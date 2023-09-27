import wollok.game.*
import objetos.*
import cartas.*
import zonas.*
import fases.*
import visuales.*

object juego{
	var fase
	
	method jugar() {
		self.iniciarMesa()
		
		keyboard.space().onPressDo {fase.espacio()} 
		keyboard.right().onPressDo {fase.derecha()}
		keyboard.left().onPressDo {fase.izquierda()}
		keyboard.up().onPressDo {fase.arriba()}
		keyboard.down().onPressDo {fase.abajo()}
		
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
