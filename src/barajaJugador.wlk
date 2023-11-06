import portaCarta.*
import cartaVacia.*
import wollok.game.*
import cartaNueva.*
import barajaJugador.extensionDerecha
import barajaJugador.extensionIzquierda
import barajaJugador.extensionArriba

object barajaJugador {
	
	var selector = 0
	const coordenadaX = 2
	const coordenadaY = 1
	const separacion = 4
		
	var cartasDisponibles = [new CartaNueva(logoCarta = "carta1.png", sangreCarta = 1, fuerza = 1, salud = 1)]
	
	//Esto estaría bueno separarlo en otro objeto
		
	var barajaVisible = [new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX, coordenadaY = coordenadaY),
		new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX + separacion, coordenadaY = coordenadaY),
		new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX + (2*separacion), coordenadaY = coordenadaY)]
	
	
	method eliminarInicial(){
		
			var posicionAnterior = barajaVisible.get(0)
			posicionAnterior.eliminarCarta()
			game.removeVisual(posicionAnterior)
			
			if(cartasDisponibles.size()==1){	
				
				var posicionActual = barajaVisible.get(1)
				posicionActual.eliminarCarta()
				game.removeVisual(posicionActual)
			}
			
			if(cartasDisponibles.size() >=2){
				
				var posicionActual = barajaVisible.get(1)
				posicionActual.eliminarCarta()
				game.removeVisual(posicionActual)
				
				var posicionSiguiente = barajaVisible.get(2)
				posicionSiguiente.eliminarCarta()
				game.removeVisual(posicionSiguiente)
				game.removeVisual(extensionDerecha)}
			}
	
	
	method dibujarInicial(){
		
			
			var posicionAnterior = barajaVisible.get(0)
			posicionAnterior.setCartaPortada(cartaVacia)
			game.addVisual(posicionAnterior)
			posicionAnterior.dibujarCarta()
			
			if(cartasDisponibles.size()==1){	
				var posicionActual = barajaVisible.get(1)
				posicionActual.setCartaPortada(cartasDisponibles.get(0))
				game.addVisual(posicionActual)
				posicionActual.dibujarCarta()
			
			}
			
			if(cartasDisponibles.size() >=2){
					var posicionActual = barajaVisible.get(1)
				posicionActual.setCartaPortada(cartasDisponibles.get(0))
				game.addVisual(posicionActual)
				posicionActual.dibujarCarta()
				
				var posicionSiguiente = barajaVisible.get(2)
				posicionSiguiente.setCartaPortada(cartasDisponibles.get(1))
				game.addVisual(posicionSiguiente)
				posicionSiguiente.dibujarCarta()
				game.addVisual(extensionDerecha)		
			}				
		}
			
	method derecha(){
		
		if((selector >= 0) && (cartasDisponibles.size()>1) && (selector <= cartasDisponibles.size()-2)){
			
			var posicionAnterior = barajaVisible.get(0)
			var posicionActual = barajaVisible.get(1)
			var posicionSiguiente = barajaVisible.get(2)

			
			posicionAnterior.eliminarCarta()
			posicionAnterior.setCartaPortada(posicionActual.getCartaPortada())
			posicionActual.eliminarCarta()
			posicionAnterior.dibujarCarta()
			posicionActual.setCartaPortada(posicionSiguiente.getCartaPortada())
			posicionSiguiente.eliminarCarta()
			posicionActual.dibujarCarta()
				
			if(cartasDisponibles.size() == selector+2){
				if(game.hasVisual(posicionSiguiente))
					game.removeVisual(posicionSiguiente)
				posicionSiguiente.setCartaPortada(cartaVacia)
				posicionSiguiente.dibujarCarta()
			}else{
				
				posicionSiguiente.setCartaPortada(cartasDisponibles.get(selector+2))
				posicionSiguiente.dibujarCarta()
			}

			
			selector++
		}

	}
	
	method izquierda(){
		
		if(selector >= 0 && cartasDisponibles.size()>1 && selector!=0 && selector < cartasDisponibles.size()){
			
						
			var posicionAnterior = barajaVisible.get(0)
			var posicionActual = barajaVisible.get(1)
			var posicionSiguiente = barajaVisible.get(2)
			
			posicionSiguiente.eliminarCarta()
			posicionSiguiente.setCartaPortada(posicionActual.getCartaPortada())
			posicionActual.eliminarCarta()
			posicionSiguiente.dibujarCarta()
			posicionActual.setCartaPortada(posicionAnterior.getCartaPortada())
			posicionAnterior.eliminarCarta()
			posicionActual.dibujarCarta()
			
			if(selector == 1){
				
				posicionAnterior.setCartaPortada(cartaVacia)
				posicionAnterior.dibujarCarta()
			}else{
				
				posicionAnterior.setCartaPortada(cartasDisponibles.get(selector-2))
				posicionAnterior.dibujarCarta()
			}
			
			selector--
		}
	}
	
	
	method addCarta(carta){
		
		cartasDisponibles.add(carta)
	}
	
	method removeCarta(carta){
		
		cartasDisponibles.remove(carta)
	}
}

object extensionDerecha{
	
	var coordenadaX = 13
	var coordenadaY = 2
	var logoExtensionDerecha = "extension_derecha.png"
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoExtensionDerecha
}

object extensionIzquierda{
	
	var coordenadaX = 1
	var coordenadaY = 2
	var logoExtensionIzquierda = "extension_izquierda.png"
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoExtensionIzquierda
	
}
