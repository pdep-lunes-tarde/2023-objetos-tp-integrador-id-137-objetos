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
			
			var segundaPosicion = cartasEnMano.get(1)
			game.addVisual(segundaPosicion)
			
			var terceraPosicion = cartasEnMano.get(2)
			game.addVisual(terceraPosicion)
			
			var cuartaPosicion = cartasEnMano.get(3)
			game.addVisual(cuartaPosicion)			
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
