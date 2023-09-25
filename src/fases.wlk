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
	
	method espacio(){
		mano.bajarCartaElegida(a1)
		//debería ser mano.elegir()
	}
}
//--------------------------------------

/*--------------------------------------
object seleccionarEspacio{				
	method izquierda(){					
		selectorDeEspacio.siguiente()	
	}
	
	method derecha(){
		selectorDeEspacio.anterior()
	}
	
	method espacio(){
		selectorDeEspacio.elegir()
	}
}*/
//--------------------------------------