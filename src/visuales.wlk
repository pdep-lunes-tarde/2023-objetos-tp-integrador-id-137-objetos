import tp.*
import wollok.game.*

//el borde está para ir definiendo qué espacio va a tener la mesa y qué espacio la mano, el mazo y la info
object borde {
	method position() {
		return game.at(15,0)
	}
	method image() {
		return "borde.png"
	}
}

