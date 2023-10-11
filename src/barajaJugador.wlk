import portaCarta.*
import cartaVacia.*

object barajaJugador {
	
	var selector = 0
	
	var cartasDisponibles //listaDeCartas iniciales del jugaor en cado de existir
	var barajaVisible = [new PortaCarta(cartaPortada = cartaVacia),new PortaCarta(cartaPortada = cartaVacia),new PortaCarta(cartaPortada = cartaVacia)]
	
	method setSelector(_selector){
		
		selector = _selector
	}
	
	method addCarta(carta){
		
		cartasDisponibles.add(carta)
	}
	
	method getCarta(){
		
		return cartasDisponibles.get(selector)
	}
	
	method removeCarta(carta){
		
		cartasDisponibles.remove(carta)
	}
}
	
