import wollok.game.*
import objetos.*
import cartas.*
import zonas.*
import fases.*

object juego{
	var fase
	
	method jugar() {
		self.iniciarMesa()
		
		keyboard.space().onPressDo {fase.espacio()} 
		keyboard.right().onPressDo {fase.derecha()}
		keyboard.left().onPressDo {fase.izquierda()}
		
		//provisional------------
		fase = seleccionarCarta
		mano.robar(carta1)
		mano.robar(carta2)
		mano.robar(carta3)
		//-----------------------
		
		game.start()
	}
	
	method iniciarMesa(){
		game.width(33)
		game.height(17)
		game.cellSize(50)
		game.addVisual(borde)
	}
	
	method cambiarFase(_fase){
		fase = _fase
	}
}

//el borde está para ir definiendo qué espacio va a tener la mesa y qué espacio la mano, el mazo y la info
object borde {
	method position() {
		return game.at(15,0)
	}
	method image() {
		return "borde.png"
	}
}

//Este amigo va a encargarse de recibir casi todos los mensajes que no deberían tener efecto ni respuesta 
object nada{
	method recibirDanio(valor){}
	method ponerCarta(){}
	method cambiarObjectivo(objetivo){}
}
