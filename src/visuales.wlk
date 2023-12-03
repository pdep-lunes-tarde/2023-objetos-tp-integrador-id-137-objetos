import tp.*
import wollok.game.*
import puntaje.*
import mesa.*

class ObjetoVisual{ 
	var property coordX
	var property coordY
	var property image = "nada.png"
	
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
			image = "6salud.png"
		}
		if(salud  == 7){
			image = "7salud.png"
		}
	}	 
}

class FuerzaDisplay inherits ObjetoVisual{
	method actualizar(fuerza){
		if(fuerza == 0){
			image = "0fuerza.png"
		}
		if(fuerza == 1){
			image = "1fuerza.png"
		}
		if(fuerza  == 2){
			image = "2fuerza.png"
		}
		if(fuerza  == 3){
			image = "3fuerza.png"
		}
		if(fuerza  == 4){
			image = "4fuerza.png"
		}
		if(fuerza  == 5){
			image = "5fuerza.png"
		}
		if(fuerza  == 6){
			image = "fuerza.png"
		}
		if(fuerza  == 7){
			image = "7fuerza.png"
		}
	} 
}
//La clase sirve para representar gráficamente la fuerza de una carta

class CostoDisplay inherits ObjetoVisual{
	method actualizar(costo){
		if(costo == 0){
			image = "nada.png"
		}
		if(costo == 1){
			image = "1costo.png"
		}
		if(costo  == 2){
			image = "2costo.png"
		}
		if(costo  == 3){
			image = "3costo.png"
		}
		if(costo  == 4){
			image = "4costo.png"
		}
	}
} 

//La clase sirve para representar gráficamente el costo de una carta

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

//-------------------------Mensajes de juego terminado. Quizá no lo más pulido de todo.

const mensajeVictoria = new ObjetoVisual(coordX = 17, coordY = 5, image = "mensajeVictoria.png")
const mensajeDerrota = new ObjetoVisual(coordX = 17, coordY = 5, image = "mensajeDerrota.png")