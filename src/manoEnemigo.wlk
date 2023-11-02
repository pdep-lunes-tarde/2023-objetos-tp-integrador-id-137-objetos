import mano.*
import cartaVacia.*


object manoEnemigo {
	
	var coordenadaX = 17
	var coordenadaY = 7
	var separacion = 4
	
	const manoActual = new Mano(coordenadaX = coordenadaX, coordenadaY = coordenadaY, separacion = separacion)
	const manoSiguiente = new Mano(coordenadaX = coordenadaX, coordenadaY = coordenadaY+5, separacion = separacion)
	
	
	method dibujarInicial(){
		
		manoActual.dibujarInicial()
		manoSiguiente.dibujarInicial()
	}
	
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
