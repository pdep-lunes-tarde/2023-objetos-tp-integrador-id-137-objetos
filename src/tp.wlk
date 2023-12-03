import wollok.game.*
import cartas.*
import fases.*
import mesa.*
import visuales.*
import puntaje.*
import selectores.*
import mazos.*
import oponente.*

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
		
		mano.robar(mazoAbono)
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		
		//-----------------------
		
		game.start()
	}
	
	method iniciarMesa(){
		game.width(33)
		game.height(17)
		game.cellSize(50)
		game.addVisual(fondo)
		game.addVisual(puntajeDisplay)
		game.addVisual(fases)
		game.addVisual(indicadorDeFase)
		game.addVisual(mazoPrincipal)
		game.addVisual(mazoAbono)
		mazoPrincipal.inicializar()
		mazoAbono.inicializar()
		self.cambiarFase(faseRobar)
	}
	
	method cambiarSemiFase(_fase){
		fase = _fase
	}
	
	method cambiarFase(_fase){
		fase = _fase
		fase.accionDeInicio()
		indicadorDeFase.siguiente()
	}
}

object nada{
	method recibirDanio(valor){}					
	method ponerCarta(){}							//Este amigo va a encargarse de recibir casi todos los  
	method cambiarObjectivo(objetivo){}				//mensajes que no deberían tener efecto ni respuesta
	method image(){}
	method contiene(){}
	method marcar(){}
	method desmarcar(){}
	method salud(){}
}