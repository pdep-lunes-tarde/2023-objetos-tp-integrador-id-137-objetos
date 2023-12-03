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
	var property fase
	
	method jugar() {
		self.iniciarMesa()
		
		keyboard.space().onPressDo {fase.espacio()} 
		keyboard.right().onPressDo {fase.derecha()}
		keyboard.left().onPressDo {fase.izquierda()}
		keyboard.up().onPressDo {fase.arriba()}
		keyboard.down().onPressDo {fase.abajo()}
		keyboard.i().onPressDo {fase.i()}
		
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
		oponente.bajarTurno()
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		mano.robar(mazoPrincipal)
		self.cambiarFase(faseRobar)
	}
	
	method reiniciar(){
		mano.elementos()
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

object infoControles inherits ObjetoVisual(
	coordX = 0,
	coordY = 0,
	image = "nada.png"){
	var faseEnSuspenso = null
	
	method suspenderFase(){
		faseEnSuspenso = juego.fase()
		juego.cambiarSemiFase(verControles)
		self.cambiarImagen(faseEnSuspenso.controles())
		game.addVisual(self)
	}
	method volverAFase(){
		game.removeVisual(self)
		juego.cambiarSemiFase(faseEnSuspenso)
	}	
}