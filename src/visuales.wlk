import tp.*
import wollok.game.*
import puntaje.*
import mesa.*

class ObjetoVisual{ 
	var coordX
	var coordY
	var property image
	
	method position() = game.at(coordX,coordY)	
}

//Fondo
const fondo = new ObjetoVisual(coordX = 0, coordY = 0, image = "fondo.png")

//Extensiones para el selector de la mano
const extensionDerecha = new ObjetoVisual(coordX = 13, coordY = 2, image = "extension_derecha.png")
const extensionIzquierda = new ObjetoVisual(coordX = 1, coordY = 2, image = "extension_izquierda.png")


//Puntaje

object puntajeDisplay inherits ObjetoVisual(coordX = 10, coordY = 6, image = "5vida.png") {

	method actualizar(){
		if(vidaJugador.vida() <= 1){
			image = "1vida.png"
		}
		if(vidaJugador.vida() == 2){
			image = "2vida.png"
		}
		if(vidaJugador.vida() == 3){
			image = "3vida.png"
		}
		if(vidaJugador.vida() == 4){
			image = "4vida.png"
		}
		if(vidaJugador.vida() == 5){
			image = "5vida.png"
		}
		if(vidaJugador.vida() == 6){
			image = "6vida.png"
		}
		if(vidaJugador.vida() == 7){
			image = "7vida.png"
		}
		if(vidaJugador.vida() == 8){
			image = "8vida.png"
		}
		if(vidaJugador.vida() == 9){
			image = "9vida.png"
		}
		if(vidaJugador.vida() >= 10){
			image = "10vida.png"
		}
	}
}

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