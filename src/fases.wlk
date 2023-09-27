import wollok.game.*
import objetos.*
import cartas.*
import zonas.*

//las fases se van a encargar de determinar qué acción tiene que tener cada imput en cada momento

//--------------------------------------
object seleccionarCarta {
	method izquierda(){
		mano.cartaAnterior()
	}
	
	method derecha(){
		mano.cartaSiguiente()
	}
	
	method arriba(){
		mano.elegir()
		//debería ser mano.elegir()
	}
	
	method espacio(){}
	
	method abajo(){}
	
}
//--------------------------------------

object seleccionarEspacio{				
	method derecha(){					
		selectorDeEspacio.siguiente()	
	}
	
	method izquierda(){
		selectorDeEspacio.anterior()
	}
	
	method arriba(){
		selectorDeEspacio.elegir()
	}
	
	method espacio(){}
	
	method abajo(){}
}
//--------------------------------------