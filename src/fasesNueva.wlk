import mazos.*
import selector.*
import barajaJugador.*
import wollok.game.*
import barajaJugador.*
import tp.*
import puntaje.*

object faseMazos {
	
	method dibujarFase(){
		
		mazos.draw()
	}
	
	method espacio(){} // No debería hacer nada
	
	method derecha(){
		
		mazos.derecha()
	}
	
	
	method izquierda(){
		
		mazos.izquierda()
	}
	
	method arriba(){
		
		barajaJugador.addCarta(mazos.tomarCarta(mazos.obtenerSelector()))
		juego.cambiarFase(faseBarajaJugador)
	}
	
	method abajo(){}
		//Nada por ahora en un futuro se cambia a la siguiente fase
}

object faseBarajaJugador {
	
	
	method dibujarFase(){
		
		barajaJugador.dibujarInicial()		
	}
	

	
	method espacio(){} // No debería hacer nada
	
	method derecha(){
		
		barajaJugador.derecha()

	}
	
	method izquierda(){

		barajaJugador.izquierda()
	}
	
	method arriba(){
		
	}
	
	method abajo(){}
		//Nada por ahora en un futuro se cambia a la siguiente fase
}