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
	const iconoSalud = new SaludDisplay(coordX = (coordX+2), coordY = coordY)
	const iconoFuerza = new FuerzaDisplay(coordX = coordX, coordY = coordY)
	const iconoCosto = new CostoDisplay(coordX = (coordX+2), coordY = (coordY+3))
	
	method ponerCarta(carta){
		contiene = carta 
		self.graficar()
	}
	
	method removerCarta(){
		self.borrar()
		contiene = nada
	}
	
	method graficar(){
		game.addVisual(self)
		iconoSalud.actualizar(contiene.salud())
		iconoFuerza.actualizar(contiene.fuerza())
		iconoCosto.actualizar(contiene.costo())
		game.addVisual(iconoSalud)
		game.addVisual(iconoFuerza)
		game.addVisual(iconoCosto)
	}
	
	method borrar(){
		game.removeVisual(self)
		game.removeVisual(iconoSalud)
		game.removeVisual(iconoFuerza)
		game.removeVisual(iconoCosto)
	}
	
	method estaLibre() = contiene == nada
	method position() = game.at(coordX,coordY)
	method image() = contiene.image()
}

//---------------------------------------------------------------------------------------------------Espacios que participan en el combate 
class EspacioCombate inherits Espacio{
	const property opuesto
	const property protege = contiene
	var property estaMarcado = false
	const marca = new ObjetoVisual(image = "marca.png", coordX = (coordX + 1), coordY = (coordY + 1))
	
	method atacar(){
		contiene.atacar()
	}
	
	method marcar(){
		estaMarcado = true
		game.addVisual(marca)
	}
	
	method desmarcar(){
		estaMarcado = false
		game.removeVisual(marca)
	}
	
	override method ponerCarta(carta){
		contiene = carta 
		carta.cambiarObjetivo(opuesto)
		self.graficar()
	}
	
	override method removerCarta(){
		self.borrar()
		contiene = protege
	}
	
	method recibirDanio(cantidad){
		contiene.recibirDanio(cantidad)
		if(self.contieneUnaCarta()){
			if(contiene.salud() <= 0) {self.removerCarta()}
			else {iconoSalud.actualizar(contiene.salud())}
		}	
	}
	
	method contieneUnaCarta() = contiene != vidaJugador and contiene != vidaOponente
	override method estaLibre() = !self.contieneUnaCarta()
}

class EspacioAvance inherits Espacio(
	contiene = nada,
	coordY = 12){
	const espacioInferior
	
	method avanzar(){
		if(self.puedeAvanzar()){
			espacioInferior.ponerCarta(contiene)
			self.removerCarta()
		}
	}
	
	method puedeAvanzar() = espacioInferior.estaLibre() and contiene != nada	
}

//falta modelar los espacios espaciales de las cartas que va a bajar la máquina (c)						//hardcodeado por tiempo
const a1 = new EspacioCombate (contiene = vidaJugador, opuesto = b1, coordX = 17, coordY = 1)
const a2 = new EspacioCombate (contiene = vidaJugador, opuesto = b2, coordX = 21, coordY = 1)
const a3 = new EspacioCombate (contiene = vidaJugador, opuesto = b3, coordX = 25, coordY = 1)
const a4 = new EspacioCombate (contiene = vidaJugador, opuesto = b4, coordX = 29, coordY = 1)
const b1 = new EspacioCombate (contiene = vidaOponente, opuesto = a1, coordX = 17, coordY = 7)
const b2 = new EspacioCombate (contiene = vidaOponente, opuesto = a2, coordX = 21, coordY = 7)
const b3 = new EspacioCombate (contiene = vidaOponente, opuesto = a3, coordX = 25, coordY = 7)
const b4 = new EspacioCombate (contiene = vidaOponente, opuesto = a4, coordX = 29, coordY = 7)

const c1 = new EspacioAvance(coordX = 17, espacioInferior = b1)
const c2 = new EspacioAvance(coordX = 21, espacioInferior = b2)
const c3 = new EspacioAvance(coordX = 25, espacioInferior = b3)
const c4 = new EspacioAvance(coordX = 29, espacioInferior = b4)