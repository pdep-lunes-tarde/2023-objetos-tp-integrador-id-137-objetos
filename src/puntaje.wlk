import visuales.*

object puntaje {
	var puntosJugador = 5
	var puntosEnemigo = 5
	
	method restarPuntosJugador(puntos){
		puntosJugador = puntosJugador - puntos // Probar si se puede poner -=
		puntosEnemigo = puntosEnemigo + puntos // Probar si se puede poner +=
		self.dibujar()
	}
	
	method restarPuntosEnemigo(puntos){
		puntosEnemigo = puntosEnemigo - puntos
		puntosJugador = puntosJugador + puntos
		self.dibujar()
	}
	
	method dibujar(){
		if(puntosJugador <= 1){
			puntajeDisplay.setImage("1vida.png")
		}
		if(puntosJugador == 2){
			puntajeDisplay.setImage("2vida.png")
		}
		if(puntosJugador == 4){
			puntajeDisplay.setImage("3vida.png")
		}
		if(puntosJugador == 4){
			puntajeDisplay.setImage("4vida.png")
		}
		if(puntosJugador == 5){
			puntajeDisplay.setImage("5vida.png")
		}
		if(puntosJugador == 6){
			puntajeDisplay.setImage("6vida.png")
		}
		if(puntosJugador == 7){
			puntajeDisplay.setImage("7vida.png")
		}
		if(puntosJugador == 8){
			puntajeDisplay.setImage("8vida.png")
		}
		if(puntosJugador == 9){
			puntajeDisplay.setImage("9vida.png")
		}
		if(puntosJugador >= 10){
			puntajeDisplay.setImage("10vida.png")
		}
	}
	
	method getPuntosJugador() = puntosJugador
	method getPuntosEnemigo() = puntosJugador
}
