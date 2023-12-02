import wollok.game.*
import tp.*
import cartas.*
import fases.*
import visuales.*
import puntaje.*


/*Acá definimos los 8 espacios principales en los que se juega. No están modelados los espacios
  donde la máquina debería dejar preparadas cartas para bajar*/ 
 
 //----------------------------------------------------------------------------Modelado general de los espacios donde se ponene las cartas
 
class Espacio{
	const property coordX
	const property coordY
	var property contiene = nada
	
	method ponerCarta(carta){
		contiene = carta 
		game.addVisual(self)
	}
	
	method removerCarta(){
		game.removeVisual(self)
		contiene = nada
	}
	
	method position() = game.at(coordX,coordY)
	method image() = contiene.image()
}

//---------------------------------------------------------------------------------------------------Espacios que participan en el combate 
class EspacioCombate inherits Espacio{
	const property opuesto
	const property protege = contiene
	var property estaMarcado = false
	
	method atacar(){
		contiene.atacar()
	}
	
	override method ponerCarta(carta){
		contiene = carta 
		carta.cambiarObjetivo(opuesto)
		game.addVisual(self)
	}
	
	override method removerCarta(){
		game.removeVisual(self)
		contiene = protege
	}
	
	method recibirDanio(cantidad){
		contiene.recibirDanio(cantidad)
	}
}

//falta modelar los espacios espaciales de las cartas que va a bajar la máquina (c)
const a1 = new EspacioCombate (contiene = vidaJugador, opuesto = b1, coordX = 17, coordY = 1)
const a2 = new EspacioCombate (contiene = vidaJugador, opuesto = b2, coordX = 21, coordY = 1)
const a3 = new EspacioCombate (contiene = vidaJugador, opuesto = b3, coordX = 25, coordY = 1)
const a4 = new EspacioCombate (contiene = vidaJugador, opuesto = b4, coordX = 29, coordY = 1)
const b1 = new EspacioCombate (contiene = vidaOponente, opuesto = a1, coordX = 17, coordY = 6)
const b2 = new EspacioCombate (contiene = vidaOponente, opuesto = a2, coordX = 21, coordY = 6)
const b3 = new EspacioCombate (contiene = vidaOponente, opuesto = a3, coordX = 25, coordY = 6)
const b4 = new EspacioCombate (contiene = vidaOponente, opuesto = a4, coordX = 29, coordY = 6)

//estos espacios solo se usan para el display de cartas

const cartaAnterior = new Espacio (coordX = 2, coordY = 1)
const cartaActual = new Espacio (coordX = 6, coordY = 1)
const cartaSiguiente = new Espacio (coordX = 10, coordY = 1)