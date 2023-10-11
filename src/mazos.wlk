import mazo.*
import visuales.*
import selector.*
import visuales.*
import wollok.game.*


object mazos {
	
	const posicionMazosX = 2
	const posicionMazosY = 10
	const separacionMasos = 4
		
	const selectorBarajaJugador = new Selector(cantidadElementos = 1, elementoActual = 0, coordenadaInicialX = posicionMazosX, coordenadaInicialY = posicionMazosY-1, desplazamiento = separacionMasos)
	
	const mazoEsbirros = new Mazo(cartasEnElMazo = ["esbirro"], posicionX = posicionMazosX, posicionY = posicionMazosY)
	const mazoSacrificio = new Mazo(cartasEnElMazo = ["primeraCarta","segundaCarta"], posicionX = posicionMazosX+separacionMasos, posicionY = posicionMazosY)
	
	method draw(){
		
		game.addVisual(mazoEsbirros)
		game.addVisual(mazoSacrificio)
		game.addVisual(selectorBarajaJugador)
	}
	
	method izquierda(){
		
		game.removeVisual(selectorBarajaJugador)
		selectorBarajaJugador.desplazarIzquierda()
		game.addVisual(selectorBarajaJugador)
	}
	
	method derecha(){
		
		game.removeVisual(selectorBarajaJugador)
		selectorBarajaJugador.desplazarDerecha()
		game.addVisual(selectorBarajaJugador)
		
	}
	
	method obtenerSelector(){
		
		return selectorBarajaJugador.getSelector()
	}
	
	method tomarCarta(selector){
		
		if(selector == 0){
			
			return mazoEsbirros.obtenerCarta();
		}else{
			
			return mazoSacrificio.obtenerCarta()
		}
	}

}