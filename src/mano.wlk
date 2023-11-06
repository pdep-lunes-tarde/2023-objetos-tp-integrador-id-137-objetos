import portaCarta.*
import cartaVacia.*
import cartaNueva.*
import wollok.game.*

class Mano {
	
	var coordenadaX 
	var coordenadaY
	var separacion
	
	//Se pude crear un método que me lo retorne,pero por ahora se queda así
	
	const cartasEnMano = [new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+separacion, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+(2*separacion), coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+(3*separacion), coordenadaY = coordenadaY)]
	
	method dibujarInicial(){
		
			var primeraPosicion = cartasEnMano.get(0)
			game.addVisual(primeraPosicion)
			var miCarta1 = new CartaNueva(logoCarta = "lugarParaTirarCartas.png", sangreCarta = 0, fuerza = 0, salud = 0)
			primeraPosicion.setCartaPortada(miCarta1)
			primeraPosicion.dibujarCarta()
			
			var segundaPosicion = cartasEnMano.get(1)
			game.addVisual(segundaPosicion)
			var miCarta2 = new CartaNueva(logoCarta = "lugarParaTirarCartas.png", sangreCarta = 0, fuerza = 0, salud = 0)
			segundaPosicion.setCartaPortada(miCarta2)
			segundaPosicion.dibujarCarta()
			
			var terceraPosicion = cartasEnMano.get(2)
			game.addVisual(terceraPosicion)
			var miCarta3 = new CartaNueva(logoCarta = "lugarParaTirarCartas.png", sangreCarta = 0, fuerza = 0, salud = 0)
			terceraPosicion.setCartaPortada(miCarta3)
			terceraPosicion.dibujarCarta()
			
			var cuartaPosicion = cartasEnMano.get(3)
			game.addVisual(cuartaPosicion)
			var miCarta4 = new CartaNueva(logoCarta = "lugarParaTirarCartas.png", sangreCarta = 0, fuerza = 0, salud = 0)
		    cuartaPosicion.setCartaPortada(miCarta4)
			cuartaPosicion.dibujarCarta()	
		}
		
	
	method dibujarCarta(posicion, carta){
		
		var posicionSelect = cartasEnMano(posicion)
		posicionSelect.setCartaPortada(carta)
		posicionSelect.dibujarCarta()
	}
	
	method eliminarCarta(posicion){
		
		var posicionSelect = cartasEnMano(posicion)
		posicionSelect.eliminarCarta()
	}
	

	method getCartaPosicion(posicion){
		
		var posicionSelect = cartasEnMano(posicion)		
		
		return posicionSelect.getCartaPortada()
	}	
}
