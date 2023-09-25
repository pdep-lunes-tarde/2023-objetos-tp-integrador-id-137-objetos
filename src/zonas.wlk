import puntaje.*
import cartas.*
import wollok.game.*

object mano {
	const cartas = new List()
	var seleccion = nada
	var posicionSeleccion = 0
	
	method cartaSiguiente(){
		if(cartas.size() > posicionSeleccion + 1 ){
			posicionSeleccion++
			self.nuevaSeleccion()
		}
	}
	
	method cartaAnterior(){
		if(posicionSeleccion > 0){
			posicionSeleccion--
			self.nuevaSeleccion()
		}
	}
	
	method bajarCartaSeleccionada(espacio){
		if(espacio.contiene() == vidaJugador){
			espacio.ponerCarta(seleccion)
			game.addVisual(espacio)
			cartas.remove(seleccion)
			posicionSeleccion = 0
			self.nuevaSeleccion()
		} else {}
	}
	
	method nuevaSeleccion(){
		if(not cartas.isEmpty()){
			seleccion = cartas.get(posicionSeleccion)
		} else seleccion = nada
	}
	
	method robar(carta){
		cartas.add(carta)
		self.nuevaSeleccion()
	}
	
	method cartas() = cartas
	
}

class Espacio{
	const x
	const y
	const opuesto
	const protege
	var contiene = protege
	
	method ponerCarta(carta){
		contiene = carta
		carta.cambiarObjetivo(opuesto)
	}
	
	method removerCarta(){
		contiene = protege
	}
	
	method recibirDanio(cantidad){
		contiene.recibirDanio(cantidad)
	}
	
	method position() {
		return game.origin().right(x).up(y)
	}
	method image() {
		return contiene.image()
	}
	
	method contiene() = contiene
	method opuesto() = opuesto	
}

const a1 = new Espacio (protege = vidaJugador, opuesto = b1, x = 17, y = 1)
const a2 = new Espacio (protege = vidaJugador, opuesto = b2, x = 21, y = 1)
const a3 = new Espacio (protege = vidaJugador, opuesto = b3, x = 25, y = 1)
const a4 = new Espacio (protege = vidaJugador, opuesto = b4, x = 29, y = 1)
const b1 = new Espacio (protege = vidaOponente, opuesto = a1, x = 17, y = 6)
const b2 = new Espacio (protege = vidaOponente, opuesto = a2, x = 21, y = 6)
const b3 = new Espacio (protege = vidaOponente, opuesto = a3, x = 25, y = 6)
const b4 = new Espacio (protege = vidaOponente, opuesto = a4, x = 29, y = 6)