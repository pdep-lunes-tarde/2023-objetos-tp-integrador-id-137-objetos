import tp.*
import wollok.game.*

//el borde está para ir definiendo qué espacio va a tener la mesa y qué espacio la mano, el mazo y la info
object fondo {
	method position() = game.at(0,0)
	method image() = "fondo.png"
}

object extensionDerecha{
	method position() = game.at(13, 2)
	method image() = "extension_derecha.png"
}

object extensionIzquierda{
	method position() = game.at(1, 2)
	method image() = "extension_izquierda.png"
}

class Dibujar{ 
	
	/*	Solo sirve para dibujar cosas simples
	 */
	
	const coordenadaX
	const coordenadaY
	const imagen
	
	method draw(){
		
		game.addVisual(self)
	}
	
	method position() = game.at(coordenadaX,coordenadaY)
	method image() = imagen.image()
	
}

//
