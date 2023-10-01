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

//
