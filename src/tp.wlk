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
		mano.robar(generadorDeCartas.fotocopiar(carta1))
		mano.robar(generadorDeCartas.fotocopiar(carta2))
		mano.robar(generadorDeCartas.fotocopiar(carta3))
		mano.robar(generadorDeCartas.fotocopiar(carta2))
		mano.robar(generadorDeCartas.fotocopiar(carta3))
		mano.robar(generadorDeCartas.fotocopiar(carta1))
		//-----------------------
		
		game.start()
	}
	
	method iniciarMesa(){
		game.width(15)
		game.height(9)
		game.cellSize(50)
		game.addVisual(fondo)
	}
	
	method cambiarFase(_fase){
		fase = _fase
	}
}
