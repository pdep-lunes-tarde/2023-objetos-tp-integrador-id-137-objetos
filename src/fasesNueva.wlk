import mazos.*
import selector.*
import barajaJugador.*
import wollok.game.*
import barajaJugador.*
import tp.*

import manoJugador.*

import puntaje.*

object faseMazos {
	
	method dibujarFase(){
		
		mazos.draw()
	}
	
	method espacio(){
		
		juego.cambiarFase(faseBarajaJugador)
		
	} // No debería hacer nada
	
	method derecha(){
		
		mazos.derecha()
	}
	
	
	method izquierda(){
		
		mazos.izquierda()
	}
	
	method arriba(){
		
		juego.cambiarFase(faseBarajaJugador)
		barajaJugador.eliminarInicial()
		barajaJugador.addCarta(mazos.tomarCarta(mazos.obtenerSelector()))
		barajaJugador.dibujarInicial()
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

object faseManoJugador {
	
	
	method dibujarFase(){
		
		manoJugador.dibujarInicial()		
	}
	

	
	method espacio(){} // No debería hacer nada
	
	method derecha(){
		
		manoJugador.derecha()

	}
	
	method izquierda(){

		manoJugador.izquierda()
	}
	
	method arriba(){
		
	}
	
	method abajo(){}
		//Nada por ahora en un futuro se cambia a la siguiente fase
}