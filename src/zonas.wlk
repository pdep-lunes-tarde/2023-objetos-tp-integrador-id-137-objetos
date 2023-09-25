import wollok.game.*
import tp.*
import objetos.*
import cartas.*
import fases.*

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
	
	/*Necesitamos un método "elegir" que determine cuándo dejamos de seleccionar una carta
	  y pasamos a decidir en qué espacio bajarla 
	*/
	  
	method elegir(){
		juego.cambiarFase(seleccionarEspacio)
		selectorDeEspacio.iniciar()
	}
	
	
	method bajarCartaElegida(espacio){
		if(espacio.contiene() == vidaJugador){
			espacio.ponerCarta(seleccion) //tira este error pero funciona hm
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
	
	
	//hay que implementar el mazo
	method robar(carta){
		cartas.add(carta)
		self.nuevaSeleccion()
	}
	
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
	}
	
	method removerCarta(){
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