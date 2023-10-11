import wollok.game.*
import visuales.*
 
//Imports Nuevos
import fasesNueva.*
import selector.*


object juego{
	
	var fase
	
	method jugar() {
		
		self.iniciarMesa()
		
	/* Codigo de Tefa nuevo no tocar por ahora Gracias :D
	 * 
	 */
		
		
		
	/* Fin de codigo de Tefa. Gracias por no tocar :D
	 * 
	 */
		
		keyboard.space().onPressDo {fase.espacio()} 
		keyboard.right().onPressDo {fase.derecha()}
		keyboard.left().onPressDo {fase.izquierda()}
		keyboard.up().onPressDo {fase.arriba()}
		keyboard.down().onPressDo {fase.abajo()}
		
		//provisional------------
		fase = faseMazos
		
			
		//-----------------------
		
		game.start()
	}
	
	method iniciarMesa(){
		game.width(33)
		game.height(17)
		game.cellSize(50)
		game.addVisual(fondo)
		
		faseMazos.dibujarFase()
		
	}
	
	method cambiarFase(_fase){
		fase = _fase
	}
}
