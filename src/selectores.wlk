import wollok.game.*
import mesa.*
import fases.*
import puntaje.*
import tp.*
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
			juego.cambiarSemiFase(seleccionarEspacio)
			selectorMesa.iniciar()
		}
	}
	
	method bajarCartaElegida(espacio){
			espacio.ponerCarta(seleccion) 
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
	
	method robar(mazo){
		if(mazo.tieneCartas()){
			const carta = mazo.sacarUnaCarta()
			self.borrarDisplay()
			elementos.add(carta)
			self.nuevaSeleccion()
		}
	}
	
	method tamanio() = elementos.size()
}


//--------------------------------------------------------------------------------------------------------Selector que interactúa con la mesa

object selectorMesa inherits Selector(
	elementos = [a1, a2, a3, a4],
	seleccion = a1){
	const property image = "selector.png"
	const coordY = 0
	const abono = []
	var property costoPagado = false
	
	method elegir(){
		self.verificarPago()
		
		if(self.sePuedeBajar()){
			mano.bajarCartaElegida(seleccion)
			self.finalizar()
		}else
		if(self.sePuedeSacrificar()){
			if(seleccion.estaMarcado()){
				seleccion.desmarcar()
				abono.remove(seleccion)
			}else{
				seleccion.marcar()
				abono.add(seleccion)
				self.verificarPago()
			} 
		}
	}
	
	method verificarPago(){
		if(self.fertilizanteDisponible() >= mano.seleccion().costo()){
			costoPagado = true
			self.sacrificarCartas()
			self.vaciarAbono()
		} 
	}
	
	method sacrificarCartas(){
		abono.forEach({espacio => espacio.removerCarta()})
	}
	
	method vaciarAbono(){
		abono.forEach({espacio => espacio.desmarcar()})
		abono.clear()
	}
	
	//-------------------------visuales
	method iniciar(){
		self.actualizarDisplay()
		self.verificarPago()
	}
	
	method finalizar(){
		costoPagado = false
		self.borrarDisplay()
		self.vaciarAbono()
		juego.cambiarSemiFase(faseMano)
	}
	
	override method actualizarDisplay(){
		game.addVisual(self)
	}
	
	override method borrarDisplay(){
		game.removeVisual(self)
	}
	
	//-------------------------consultas
	method fertilizanteDisponible() = abono.sum({sacrificio => sacrificio.contiene().fertilidad()}) 
	method sePuedeSacrificar() = !(seleccion.contiene() == vidaJugador) and !costoPagado
	method sePuedeBajar() = seleccion.contiene() == vidaJugador and costoPagado
	method position() = game.at(seleccion.coordX(), coordY)
}

//-----------------------------------------------------------------------------------------------------------Selector que interactúa con los mazos

