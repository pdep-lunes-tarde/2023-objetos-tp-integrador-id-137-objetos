import mesa.*
import selectores.*

//las fases se van a encargar de determinar qué acción tiene que tener cada imput en cada momento

//--------------------------------------
object faseMano{
	method izquierda(){
		mano.anterior()
	}
	
	method derecha(){
		mano.siguiente()
	}
	
	method arriba(){
		mano.elegir()
	}
	
	method espacio(){
		a1.atacar()
		a2.atacar()
		a3.atacar()
		a4.atacar()
	}
	
	method abajo(){}
	
}
//--------------------------------------

object seleccionarEspacio{				
	method derecha(){					
		selectorMesa.siguiente()	
	}
	
	method izquierda(){
		selectorMesa.anterior()
	}
	
	method arriba(){
		selectorMesa.elegir()
	}
	
	method espacio(){}
	
	method abajo(){}
}
//--------------------------------------

object seleccionarSacrificios{
	
	method derecha(){					
		selectorMesa.siguiente()	
	}
	
	method izquierda(){
		selectorMesa.anterior()
	}
	
	method arriba(){
		//selectorDeEspacio.sacrificar()
	}
	
	method espacio(){}
	
	method abajo(){}
}