import mazos.*
import selector.*
import barajaJugador.*
import wollok.game.*



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
		
	}
	
	method abajo(){}
		//Nada por ahora en un futuro se cambia a la siguiente fase
}

object faseBarajaJugador {
	
	method espacio(){} // No debería hacer nada
	
	method derecha(){
		
		mazos.derecha()
	}
	
	method izquierda(){
		
		mazos.izquierda()
	}
	
	method arriba(){
		
	}
	
	method abajo(){}
		//Nada por ahora en un futuro se cambia a la siguiente fase
	
}