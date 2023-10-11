import portaCarta.*
import cartaVacia.*
import wollok.game.*
import cartaNueva.*


object barajaJugador {
	
	var selector = 0
	const coordenadaX = 2
	const coordenadaY = 1
	const separacion = 4
	
	var cartasDisponibles = new List()
	//Esto estaría bueno separarlo en otro objeto
	
	var cartaTest = new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta1.png", logoSalud = "", logoFuerza = "", sangreCarta = 4, logoCostoCarta = "")
	
	var barajaVisible = [new PortaCarta(cartaPortada = cartaTest, coordenadaX = coordenadaX, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+separacion, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+(2*separacion), coordenadaY = coordenadaY)]
	
	method dibujarInicial(){
		
		game.addVisual(barajaVisible.get(0))
		game.addVisual(barajaVisible.get(1))
		game.addVisual(barajaVisible.get(2))
		
	}
	
	
	method getCartaSiguiente(){
		
		
	}
	
	method getCartaAnterior(){
		
		
	}
	
	method dibujarCartas(){
		
		var segundaPosicion = barajaVisible.get(1)
		segundaPosicion.dibujarCarta()
		
		var terceraPosicion = barajaVisible.get(2)
		terceraPosicion.dibujarCarta()
		
	}
	
	method izquierda(){
		
		if(selector > 0){
		
			selector--
			
			var	primeraPosicion = barajaVisible.get(0)
			primeraPosicion.setCartaPortada(cartasDisponibles.get(selector-1))
			primeraPosicion.eliminarCarta()
			primeraPosicion.dibujarCarta()
			
			var	segundaPosicion = barajaVisible.get(1)
			segundaPosicion.setCartaPortada(cartasDisponibles.get(selector))
			segundaPosicion.eliminarCarta()
			segundaPosicion.dibujarCarta()
			
			
			var	terceraPosicion = barajaVisible.get(2)
			terceraPosicion.setCartaPortada(cartasDisponibles.get(selector+1))
			terceraPosicion.eliminarCarta()
			terceraPosicion.dibujarCarta()
			
		}
		
	}
	
	method derecha(){
		
		if(selector < cartasDisponibles.size()){
			
			selector++
			
			var	primeraPosicion = barajaVisible.get(0)
			primeraPosicion.setCartaPortada(cartasDisponibles.get(selector-1))
			primeraPosicion.eliminarCarta()
			primeraPosicion.dibujarCarta()
			
			var	segundaPosicion = barajaVisible.get(1)
			segundaPosicion.setCartaPortada(cartasDisponibles.get(selector))
			segundaPosicion.eliminarCarta()
			segundaPosicion.dibujarCarta()
			
			
			var	terceraPosicion = barajaVisible.get(2)
			terceraPosicion.setCartaPortada(cartasDisponibles.get(selector+1))
			terceraPosicion.eliminarCarta()
			terceraPosicion.dibujarCarta()
			
		}
		
	}
	
	
	method addCarta(carta){
		
		cartasDisponibles.add(carta)
	}
	
	method removeCarta(carta){
		
		cartasDisponibles.remove(carta)
	}
}