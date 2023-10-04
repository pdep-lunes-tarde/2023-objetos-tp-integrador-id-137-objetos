import mano.*
import cartaVacia.*


object manoEnemigo {
	
	const manoActual = new Mano()
	const manoSiguiente = new Mano()
	
	
	method atacar(cartaEnemigo){
				
		return manoActual.getCartaPosicion(cartaEnemigo)
	}
		
	//Puedo hacerla genérica
	method puedePasarCarta(posicion){
		
		return !(manoActual.getCartaPosicion(posicion)==cartaVacia)
	}
	
	//Puedo hacerla genérica
	method pasarCarta(posicion){
				
		if(self.puedePasarCarta(posicion)){
			
			manoActual.setPosicion(posicion, manoSiguiente.getCartaPosicion(posicion))
			manoSiguiente.setPosicion(posicion, cartaVacia)
		}
		
	}
	
	method pasarTurno(){
		
		self.pasarCarta(0);
		self.pasarCarta(1);
		self.pasarCarta(2);
		self.pasarCarta(3);
		
	}
	
	method setCartaManoSiguiente(posicion, carta){
		
		manoSiguiente.setPosicion(posicion, carta)
	}
	
}
