import wollok.game.*
import puntaje.*
import cartas.*
import zonas.*

object tpIntegrador {
	method jugar() {
		game.width(33)
		game.height(17)
		game.cellSize(50)
		game.addVisual(aniadirBorde)
		//game.addVisual(entrenadorDisplay)
		//game.addVisual(pajaroDisplay)
		//game.addVisual(informacionDelPajaro)
		game.start()
	}
}

object aniadirBorde {
	method position() {
		return game.origin().right(15)
	}
	method image() {
		return "borde.png"
	}
}
