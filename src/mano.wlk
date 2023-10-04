import portaCarta.*
import cartaVacia.*
import cartaNueva.*

class Mano {
	
	//Se pude crear un método que me lo retorne,pero por ahora se queda así
	
	const cartasEnMano = [new PortaCarta(cartaPortada = cartaVacia), new PortaCarta(cartaPortada = cartaVacia), new PortaCarta(cartaPortada = cartaVacia), new PortaCarta(cartaPortada = cartaVacia)]

	method setPosicion(posicion, carta){
		
		const pos = self.getCartaPosicion(posicion)
		pos.setCartaPortada(carta)
	}

	method getCartaPosicion(posicion){
		
		return cartasEnMano.get(posicion)
	}	
}
