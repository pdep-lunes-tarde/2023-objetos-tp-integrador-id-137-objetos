import wollok.game.*
import tp.*
import objetos.*
import cartas.*
import fases.*
import visuales.*

object mano {
	const cartas = new List()
	var seleccion = nada
	var posicionSeleccion = 0
	
	method cartaSiguiente(){
		if(cartas.size() > posicionSeleccion + 1 ){
			self.borrarDisplay()
			posicionSeleccion++
			self.nuevaSeleccion()
		}
	}
	
	method cartaAnterior(){
		if(posicionSeleccion > 0){
			self.borrarDisplay()
			posicionSeleccion--
			self.nuevaSeleccion()
		}
	}
	
	/*Necesitamos un método "elegir" que determine cuándo dejamos de seleccionar una carta
	  y pasamos a decidir en qué espacio bajarla 
	*/
	  
	method elegir(){
		juego.cambiarFase(seleccionarEspacio)
		selectorDeEspacio.iniciar()
	}
	
	
	method bajarCartaElegida(espacio){
			espacio.ponerCarta(seleccion) //tira este error pero funciona hm
			self.borrarDisplay()
			cartas.remove(seleccion)
			if(posicionSeleccion > 0) posicionSeleccion--
			self.nuevaSeleccion()
	}
	 
	method nuevaSeleccion(){
		if(not cartas.isEmpty()){
			seleccion = cartas.get(posicionSeleccion)
			self.cargarDisplay()
		} else seleccion = nada
	}
	
	method cargarDisplay(){
		if(posicionSeleccion > 0) cartaAnterior.ponerCarta(cartas.get(posicionSeleccion -1))
		if(self.tamanio() > 0) cartaActual.ponerCarta(cartas.get(posicionSeleccion))
		if(posicionSeleccion + 1 < self.tamanio()) cartaSiguiente.ponerCarta(cartas.get(posicionSeleccion +1))
		if(posicionSeleccion > 1) game.addVisual(extensionIzquierda)
		if(posicionSeleccion + 2 < self.tamanio()) game.addVisual(extensionDerecha)
			
	}
	
	method borrarDisplay(){
		if(posicionSeleccion > 0) cartaAnterior.removerCarta()
		if(self.tamanio() > 0) cartaActual.removerCarta()
		if(posicionSeleccion + 1 < self.tamanio()) cartaSiguiente.removerCarta()
		if(posicionSeleccion > 1) game.removeVisual(extensionIzquierda)
		if(posicionSeleccion + 2 < self.tamanio()) game.removeVisual(extensionDerecha)
	}
	
	
	//hay que implementar el mazo
	method robar(carta){
		self.borrarDisplay()
		cartas.add(carta)
		self.nuevaSeleccion()
	}
	
	method tamanio() = cartas.size()
	method cartas() = cartas
	
}

/*Acá definimos los 8 espacios principales en los que se juega. No están modelados los espacios
  donde la máquina debería dejar preparadas cartas para bajar*/ 
 
class Espacio{
	const x
	const y
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
	
	method atacar(){
		contiene.atacar()
	}
	
	method position() = game.at(x,y)
	method image() = contiene.image()
	method contiene() = contiene
	method opuesto() = opuesto	
}

//falta modelar los espacios espaciales de las cartas que va a bajar la máquina (c)
const a1 = new Espacio (protege = vidaJugador, opuesto = b1, x = 17, y = 1)
const a2 = new Espacio (protege = vidaJugador, opuesto = b2, x = 21, y = 1)
const a3 = new Espacio (protege = vidaJugador, opuesto = b3, x = 25, y = 1)
const a4 = new Espacio (protege = vidaJugador, opuesto = b4, x = 29, y = 1)
const b1 = new Espacio (protege = vidaOponente, opuesto = a1, x = 17, y = 6)
const b2 = new Espacio (protege = vidaOponente, opuesto = a2, x = 21, y = 6)
const b3 = new Espacio (protege = vidaOponente, opuesto = a3, x = 25, y = 6)
const b4 = new Espacio (protege = vidaOponente, opuesto = a4, x = 29, y = 6)

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
