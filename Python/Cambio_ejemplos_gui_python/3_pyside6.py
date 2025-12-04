from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QMessageBox, QVBoxLayout
import sys

class Ventana(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Ejemplo PySide6")
        self.setGeometry(100, 100, 300, 200)
        layout = QVBoxLayout()

        boton = QPushButton("Saludar")
        boton.clicked.connect(self.saludar)
        layout.addWidget(boton)
        self.setLayout(layout)

    def saludar(self):
        QMessageBox.information(self, "Saludo", "¡Hola mundo con PySide6!")

app = QApplication(sys.argv)
ventana = Ventana()
ventana.show()
sys.exit(app.exec())
