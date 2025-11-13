import wx

class Ventana(wx.Frame):
    def __init__(self):
        super().__init__(parent=None, title="Ejemplo WxPython", size=(300, 200))
        panel = wx.Panel(self)
        boton = wx.Button(panel, label="Saludar", pos=(100, 70))
        boton.Bind(wx.EVT_BUTTON, self.saludar)

    def saludar(self, event):
        wx.MessageBox("¡Hola mundo con WxPython!", "Saludo", wx.OK | wx.ICON_INFORMATION)

app = wx.App(False)
ventana = Ventana()
ventana.Show()
app.MainLoop()
