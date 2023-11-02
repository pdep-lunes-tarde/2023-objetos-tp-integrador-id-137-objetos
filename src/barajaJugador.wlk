import portaCarta.*
import cartaVacia.*
import wollok.game.*
import cartaNueva.*
import barajaJugador.extensionDerecha
import barajaJugador.extensionIzquierda


object barajaJugador {
	
	var selector = 0
	const coordenadaX = 2
	const coordenadaY = 1
	const separacion = 4
		
	var cartasDisponibles = new List()
	
	//Esto estaría bueno separarlo en otro objeto
		
	var barajaVisible = [new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX, coordenadaY = coordenadaY),
		new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX + separacion, coordenadaY = coordenadaY),
		new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX + (2*separacion), coordenadaY = coordenadaY)
	]
	
	method dibujarInicial(){
		
		//Esto son test para probar cosas
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta1.png", logoSalud = "", sangreCarta = 4, logoCostoCarta = ""))
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta2.png", logoSalud = "", sangreCarta = 4, logoCostoCarta = ""))
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta1.png", logoSalud = "", sangreCarta = 4, logoCostoCarta = ""))

		//Fin de test para probar cosas
		

<<<<<<< HEAD
		/*if(cartasDisponibles.size() == 1){
=======
		if(cartasDisponibles.size() == 1){
					
			game.addVisual(barajaVisible.get(1))
		}else if(cartasDisponibles.size()==2){
			
			game.addVisual(barajaVisible.get(1))
			game.addVisual(barajaVisible.get(2))
		}else if(cartasDisponibles.size() >= 3){
		
			game.addVisual(barajaVisible.get(1))
			game.addVisual(barajaVisible.get(2))
			game.addVisual(extensionDerecha)		
		}
		
		
		self.dibujarCartasInicial()
	}
	
	method removerInicial(){
		
		if(cartasDisponibles.size() == 1){
					
			game.removeVisual(barajaVisible.get(1))
		}else if(cartasDisponibles.size()==2){
			
			game.removeVisual(barajaVisible.get(1))
			game.removeVisual(barajaVisible.get(2))
		}else if(cartasDisponibles.size() >= 3){
		
			game.removeVisual(barajaVisible.get(1))
			game.removeVisual(barajaVisible.get(2))
			game.removeVisual(extensionDerecha)		
		}	
	}
	
	method dibujarCartasInicial(){
		
		//Nota se puede hacer refactor sacando un Método y achicando mucho el código
		
		if(cartasDisponibles.size() == 1){
>>>>>>> tefa
					
			var posicionActual = barajaVisible.get(1)
			posicionActual.setCartaPortada(cartasDisponibles.get(0))
			game.addVisual(posicionActual)
			posicionActual.dibujarCarta()	
				
		}else if(cartasDisponibles.size()==2){
			
			var posicionActual = barajaVisible.get(1)
			posicionActual.setCartaPortada(cartasDisponibles.get(0))
			game.addVisual(posicionActual)
			posicionActual.dibujarCarta()
			
			var posicionSiguiente = barajaVisible.get(2)
			posicionSiguiente.setCartaPortada(cartasDisponibles.get(1))
			game.addVisual(posicionSiguiente)
			posicionSiguiente.dibujarCarta()
			
		}else if(cartasDisponibles.size() >= 3){
		*/
			
			var posicionAnterior = barajaVisible.get(0)
			posicionAnterior.setCartaPortada(cartaVacia)
			game.addVisual(posicionAnterior)
				
			var posicionActual = barajaVisible.get(1)
			posicionActual.setCartaPortada(cartasDisponibles.get(0))
			game.addVisual(posicionActual)
			
			posicionActual.dibujarCarta()
			
			var posicionSiguiente = barajaVisible.get(2)
			posicionSiguiente.setCartaPortada(cartasDisponibles.get(1))
			game.addVisual(posicionSiguiente)
			posicionSiguiente.dibujarCarta()
			
			game.addVisual(extencionDerecha)						
		}
		
	//}
	


	method derecha(){
		
		if((selector >= 0) && (cartasDisponibles.size()>1) && (selector <= cartasDisponibles.size()-2)){
			
			var posicionAnterior = barajaVisible.get(0)
			var posicionActual = barajaVisible.get(1)
			var posicionSiguiente = barajaVisible.get(2)
			
			if(selector==0){
				
				//game.addVisual(posicionAnterior)
			}
			
			posicionAnterior.setCartaPortada(posicionActual.getCartaPortada())
			posicionActual.eliminarCarta()
			posicionAnterior.dibujarCarta()
			posicionActual.setCartaPortada(posicionSiguiente.getCartaPortada())
			posicionSiguiente.eliminarCarta()
			posicionActual.dibujarCarta()
				
			if(cartasDisponibles.size() == selector+2){
				
				//game.removeVisual(posicionSiguiente)
			}else{
				
				posicionSiguiente.setCartaPortada(cartasDisponibles.get(selector+2))
				posicionSiguiente.dibujarCarta()
			}
			
			//if(cartasDisponibles.size()==selector+3){
				//game.removeVisual(extencionDerecha)
			//}
			
			selector++
		}

	}
	
	method izquierda(){
		
		if(selector >= 0 && cartasDisponibles.size()>1 && selector!=0 && selector < cartasDisponibles.size()){
			
						
			var posicionAnterior = barajaVisible.get(0)
			var posicionActual = barajaVisible.get(1)
			var posicionSiguiente = barajaVisible.get(2)
			
			
			if(selector==cartasDisponibles.size()-1){
				
				//game.addVisual(posicionSiguiente)
				//posicionSiguiente.dibujarCarta()
			}
			
			posicionSiguiente.eliminarCarta()
			posicionSiguiente.setCartaPortada(posicionActual.getCartaPortada())
			posicionActual.eliminarCarta()
			posicionSiguiente.dibujarCarta()
			posicionActual.setCartaPortada(posicionAnterior.getCartaPortada())
			posicionAnterior.eliminarCarta()
			posicionActual.dibujarCarta()
			
			if(selector == 1){
				
				//game.removeVisual(posicionAnterior)
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