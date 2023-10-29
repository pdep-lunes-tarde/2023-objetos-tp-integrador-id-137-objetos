import cartaNueva.*
import wollok.game.*
import cartaVacia.*


class PortaCarta {
	
	const logoPortaCarta = "espacio.png" //ES temporal para que no grite
	var property cartaPortada 
	const coordenadaX
	const coordenadaY
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoPortaCarta
	
	method dibujarCarta(){
		
		cartaPortada.setCoordenadas(coordenadaX, coordenadaY)
		game.addVisual(cartaPortada)
	}
	
	method eliminarCarta(){
		
		game.removeVisual(cartaPortada)
	}
	
//	method setCartaPortada(_cartaPortada){
		
//		cartaPortada = _cartaPortada
//	}
	

//	method getCartaPortada()= return cartaPortada
	
}
