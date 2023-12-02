import wollok.game.*
import mesa.*
import fases.*
import puntaje.*
import tp.*
import mano.*
import visuales.*
import mazos.*

//--------------------------------------------------------------------------------------------------------Implementación general de los selectores
class Selector{
	const property elementos
	var property posicionSeleccion = 0 //después le puedo sacar el property, está puesto para probar cosas
	var property seleccion = nada
	
	method siguiente(){
		if(elementos.size() > posicionSeleccion + 1 ){
			self.borrarDisplay()
			posicionSeleccion++
			self.nuevaSeleccion()
		}
	}
	
	method anterior(){
		if(posicionSeleccion > 0){
			self.borrarDisplay()
			posicionSeleccion--
			self.nuevaSeleccion()
		}
	}
	
	method nuevaSeleccion(){
		seleccion = elementos.get(posicionSeleccion)
		self.actualizarDisplay()
	}
	
	//estos dos métodos están creados para que la clase funcione, pero se definen en cada uno de los selectores
	method borrarDisplay() {}
	method actualizarDisplay(){}
}

//--------------------------------------------------------------------------------------------------------Selector que interactúa con las cartas de la mano

object mano inherits Selector(
	elementos = []){
	  
	method elegir(){
		if(!elementos.isEmpty()){
			juego.cambiarFase(seleccionarEspacio)
			selectorMesa.iniciar()
		}
	}
	
	
	method bajarCartaElegida(espacio){
			espacio.ponerCarta(seleccion) //tira este error pero funciona hm
			self.borrarDisplay()
			elementos.remove(seleccion)
			if(posicionSeleccion > 0) posicionSeleccion--
			self.nuevaSeleccion()
	}
	 
	override method nuevaSeleccion(){
		if(!elementos.isEmpty()){
			seleccion = elementos.get(posicionSeleccion)
			self.actualizarDisplay()
		} else seleccion = nada
	}
	
	override method actualizarDisplay(){
		if(posicionSeleccion > 0) cartaAnterior.ponerCarta(elementos.get(posicionSeleccion -1))
		if(self.tamanio() > 0) cartaActual.ponerCarta(elementos.get(posicionSeleccion))
		if(posicionSeleccion + 1 < self.tamanio()) cartaSiguiente.ponerCarta(elementos.get(posicionSeleccion +1))
		if(posicionSeleccion > 1) game.addVisual(extensionIzquierda)
		if(posicionSeleccion + 2 < self.tamanio()) game.addVisual(extensionDerecha)
			
	}
	
	override method borrarDisplay(){
		if(posicionSeleccion > 0) cartaAnterior.removerCarta()
		if(self.tamanio() > 0) cartaActual.removerCarta()
		if(posicionSeleccion + 1 < self.tamanio()) cartaSiguiente.removerCarta()
		if(posicionSeleccion > 1) game.removeVisual(extensionIzquierda)
		if(posicionSeleccion + 2 < self.tamanio()) game.removeVisual(extensionDerecha)
	}
	
	
	//hay que implementar el mazo
	method robar(mazo){
		const carta = mazo.sacarUnaCarta()
		self.borrarDisplay()
		elementos.add(carta)
		self.nuevaSeleccion()
	}
	
	method tamanio() = elementos.size()
}


//--------------------------------------------------------------------------------------------------------Selector que interactúa con la mesa

object selectorMesa inherits Selector(
	elementos = [a1, a2, a3, a4],
	seleccion = a1){
	const property image = "selector.png"
	const coordY = 0
	
	method elegir(){
		if(seleccion.contiene() == vidaJugador){
		mano.bajarCartaElegida(seleccion)
		self.finalizar()
		}
	}

	method sacrificar(){
		if(seleccion == vidaJugador){} else 
		if(seleccion.estaMarcada()){seleccion.desmarcar()}else
		seleccion.marcar()
	}

	method iniciar(){
		self.actualizarDisplay()
	}
	
	method finalizar(){
		self.borrarDisplay()
		juego.cambiarFase(faseMano)
	}
	
	override method actualizarDisplay(){
		game.addVisual(self)
	}
	
	override method borrarDisplay(){
		game.removeVisual(self)
	}
	
	method position() = game.at(seleccion.coordX(), coordY)
}

//-------------------------------------------------------------------------------------------------------------------------------------------------

