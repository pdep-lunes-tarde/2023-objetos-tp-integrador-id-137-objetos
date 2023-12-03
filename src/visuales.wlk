import tp.*
import wollok.game.*
import puntaje.*
import mesa.*

class ObjetoVisual{ 
	var property coordX
	var property coordY
	var property image
	
	method cambiarImagen(imagen){image = imagen}
	method position() = game.at(coordX,coordY)	
}

//Fondo
const fondo = new ObjetoVisual(coordX = 0, coordY = 0, image = "fondo.png")
//Fases
const fases = new ObjetoVisual(coordX = 2, coordY = 12, image = "fases.png")

//controles Mazos
const flechaIzquierda = new ObjetoVisual(coordX = 2, coordY = 6, image = "flechaIzquierda.png")
const flechaDerecha = new ObjetoVisual(coordX = 6, coordY = 6, image = "flechaDerecha.png")

//Extensiones para el selector de la mano
const extensionDerecha = new ObjetoVisual(coordX = 13, coordY = 2, image = "extension_derecha.png")
const extensionIzquierda = new ObjetoVisual(coordX = 1, coordY = 2, image = "extension_izquierda.png")
const indicadorMano = new ObjetoVisual(coordX = 5, coordY = 0, image = "indicadorMano.png")

//estos espacios solo se usan para el display de cartas

const cartaAnterior = new Espacio(coordX = 2, coordY = 1)
const cartaActual = new Espacio(coordX = 6, coordY = 1)
const cartaSiguiente = new Espacio(coordX = 10, coordY = 1)


//La clase sirve para representar gráficamente la salud variable de las cartas contenidas en un espacio
class SaludDisplay inherits ObjetoVisual{
	method actualizar(salud){
		if(salud <= 1){
			image = "1salud.png"
		}
		if(salud  == 2){
			image = "2salud.png"
		}
		if(salud  == 3){
			image = "3salud.png"
		}
		if(salud  == 4){
			image = "4salud.png"
		}
		if(salud  == 5){
			image = "5salud.png"
		}
		if(salud  == 6){
			image = "salud.png"
		}
		if(salud  == 7){
			image = "7salud.png"
		}
		if(salud  == 8){
			image = "8salud.png"
		}
		if(salud  == 9){
			image = "9salud.png"
		}
	}
} 

//Indicador de fase

object indicadorDeFase inherits ObjetoVisual(
	coordX = 6,
	coordY = 12,
	image = "indicadorFase.png"){
	
	method siguiente(){
		if(coordX < 5){coordX += 2}
		else{
			coordX -= 4
			if(coordY == 14){
				coordY -= 2
			}else coordY += 2
		}
	}
	
}