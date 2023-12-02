import wollok.game.*
import tp.*
import cartas.*
import fases.*
import visuales.*
import puntaje.*


/*Acá definimos los 8 espacios principales en los que se juega. No están modelados los espacios
  donde la máquina debería dejar preparadas cartas para bajar*/ 
 
class Espacio{
	const property coordX
	const property coordY
	const opuesto
	const protege
	var contiene = protege
	
	method ponerCarta(carta){
		contiene = carta 
		carta.cambiarObjetivo(opuesto)
		game.addVisual(self)
	}
	
	method removerCarta(){
		game.removeVisual(self)
		contiene = protege
	}
	
	method recibirDanio(cantidad){
		contiene.recibirDanio(cantidad)
	}
	
	method cartaMarcada(){
		return true //al macarse, una espacio debería pasar a "estar marcado" y añadirse a una lista 
	}
	
	method atacar(){
		contiene.atacar()
	}
	
	method position() = game.at(coordX,coordY)
	method image() = contiene.image()
	method contiene() = contiene
	method opuesto() = opuesto	
}

//falta modelar los espacios espaciales de las cartas que va a bajar la máquina (c)
const a1 = new Espacio (protege = vidaJugador, opuesto = b1, coordX = 17, coordY = 1)
const a2 = new Espacio (protege = vidaJugador, opuesto = b2, coordX = 21, coordY = 1)
const a3 = new Espacio (protege = vidaJugador, opuesto = b3, coordX = 25, coordY = 1)
const a4 = new Espacio (protege = vidaJugador, opuesto = b4, coordX = 29, coordY = 1)
const b1 = new Espacio (protege = vidaOponente, opuesto = a1, coordX = 17, coordY = 6)
const b2 = new Espacio (protege = vidaOponente, opuesto = a2, coordX = 21, coordY = 6)
const b3 = new Espacio (protege = vidaOponente, opuesto = a3, coordX = 25, coordY = 6)
const b4 = new Espacio (protege = vidaOponente, opuesto = a4, coordX = 29, coordY = 6)

//estos espacios solo se usan para el display de cartas
class EspacioDisplay{
	const x
	const y
	var contiene = nada
	
	method ponerCarta(carta){
		contiene = carta 
		game.addVisual(self)
	}
	
	method removerCarta(){
		game.removeVisual(self)
	}
	
	method position() = game.at(x,y)
	method image() = contiene.image()
}

const cartaAnterior = new EspacioDisplay (x = 2, y = 1)
const cartaActual = new EspacioDisplay (x = 6, y = 1)
const cartaSiguiente = new EspacioDisplay (x = 10, y = 1)