import portaCarta.*
import cartaVacia.*
import cartaNueva.*

class Mano {
	
	//Se pude crear un método que me lo retorne,pero por ahora se queda así
	
	const cartasEnMano = [new PortaCarta(cartaPortada = cartaVacia, coordenadaX = 10, coordenadaY = 10)]

	method setPosicion(posicion, carta){
		
		const pos = self.getCartaPosicion(posicion)
		pos.setCartaPortada(carta)
	}

	method getCartaPosicion(posicion){
		
		return cartasEnMano.get(posicion)
	}	
}
