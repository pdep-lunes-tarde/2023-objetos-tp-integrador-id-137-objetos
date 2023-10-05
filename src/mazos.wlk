import mazo.*
import visuales.*
import selector.*

object mazos {
	
	const posicionMazosX = 2
	const posicionMazosY = 10
	const separacionMasos = 4
	
	const selectorBarajaJugador = new Selector(cantidadElementos = 1, elementoActual = 0, coordenadaInicialX = posicionMazosX, coordenadaInicialY = posicionMazosY-1, desplazamiento = separacionMasos)
	
	const mazoEsbirros = new Mazo(cartasEnElMazo = ["esbirro"])
	const mazoSacrificio = new Mazo(cartasEnElMazo = ["primeraCarta","segundaCarta"])
	
	
	method izquierda(){
		
		selectorBarajaJugador.desplazarIzquierda()
	}
	
	method derecha(){
		
		selectorBarajaJugador.desplazarDerecha()
	}
	
	method tomarCarta(selector){
		
		if(selector == 0){
			
			return mazoEsbirros.obtenerCarta();
		}else{
			
			return mazoSacrificio.obtenerCarta()
		}
	}

}