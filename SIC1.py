from kivy.lang import Builder
from kivymd.app import MDApp
from kivy.uix.screenmanager import Screen, ScreenManager
from kivy.uix.floatlayout import FloatLayout
from kivymd.uix.pickers import MDDatePicker
import webbrowser



class login(Screen):
	pass

class pantallaPrincipal(Screen):
	pass
	
	
class clientes(Screen):
	pass
	
class etapas(Screen):
	pass


class calendario(Screen):
#	def get_date(self, date):
#		print(date)
#		self.ids.ejemplo_id.text = "Hola"

	def show_date_picker(self):
		picker = MDDatePicker()
		picker.open()

class SIC(MDApp):


	def abrirPJN (instance):
		webbrowser.open('https://www.pjn.gov.ar/')
	
	def abrirMEV (instance):
		webbrowser.open('https://mev.scba.gov.ar/loguin.asp')
	
	def build (self):

		Builder.load_file('pantallas.kv')
		
		ap = ScreenManager()
		ap.add_widget(login(name= "Login"))
		ap.add_widget(pantallaPrincipal(name= "Pantalla Principal"))
		ap.add_widget(clientes(name= "clientes"))
		ap.add_widget(etapas(name= "etapas"))
		ap.add_widget(calendario(name= "calendario"))
		
		return ap





SIC().run()
