import portaCarta.*
import cartaVacia.*
import wollok.game.*
import cartaNueva.*
import barajaJugador.extencionDerecha
import barajaJugador.extencionIzquierda


object barajaJugador {
	
	var selector = 0
	const coordenadaX = 2
	const coordenadaY = 1
	const separacion = 4
	
	var cartasDisponibles = new List()
	
	//Esto estaría bueno separarlo en otro objeto
		
	var barajaVisible = [new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+separacion, coordenadaY = coordenadaY),new PortaCarta(cartaPortada = cartaVacia, coordenadaX = coordenadaX+(2*separacion), coordenadaY = coordenadaY)]
	
	method dibujarInicial(){
		
		//Esto son test para probar cosas
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta1.png", logoSalud = "", logoFuerza = "", sangreCarta = 4, logoCostoCarta = ""))
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta2.png", logoSalud = "", logoFuerza = "", sangreCarta = 4, logoCostoCarta = ""))
		cartasDisponibles.add(new CartaNueva(fuerza = 1, salud = 1, logoCarta = "carta2.png", logoSalud = "", logoFuerza = "", sangreCarta = 4, logoCostoCarta = ""))
		
		//Fin de test para probar cosas
		

		if(cartasDisponibles.size() == 1){
					
			game.addVisual(barajaVisible.get(1))
		}else if(cartasDisponibles.size()==2){
			
			game.addVisual(barajaVisible.get(1))
			game.addVisual(barajaVisible.get(2))
		}else if(cartasDisponibles.size() >= 3){
		
			game.addVisual(barajaVisible.get(1))
			game.addVisual(barajaVisible.get(2))
			game.addVisual(extencionDerecha)		
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
			game.removeVisual(extencionDerecha)		
		}	
	}
	
	method dibujarCartasInicial(){
		
		//Nota se puede hacer refactor sacando un Método y achicando mucho el código
		
		if(cartasDisponibles.size() == 1){
					
			var posicionActual = barajaVisible.get(1)
			posicionActual.setCartaPortada(cartasDisponibles.get(0))
			posicionActual.dibujarCarta()
			
		}else if(cartasDisponibles.size()>=2){
			
			var posicionActual = barajaVisible.get(1)
			posicionActual.setCartaPortada(cartasDisponibles.get(0))
			posicionActual.dibujarCarta()
			
			var posicionSiguiente = barajaVisible.get(2)
			posicionSiguiente.setCartaPortada(cartasDisponibles.get(1))
			posicionSiguiente.dibujarCarta()
			}
			
	}
	
	method izquierda(){
	}
	
	method derecha(){
		
		if(cartasDisponibles.size()==2){
			
			var posicionActual = barajaVisible.get(1)
			
			
			var posicionAnterior = barajaVisible.get(0)
			posicionAnterior.setCartaPortada()
			
		}
	}
	
	
	method addCarta(carta){
		
		cartasDisponibles.add(carta)
	}
	
	method removeCarta(carta){
		
		cartasDisponibles.remove(carta)
	}
}

object extencionDerecha{
	
	var coordenadaX = 13
	var coordenadaY = 2
	var logoExtencionDerecha = "extension_derecha.png"
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoExtencionDerecha
}

object extencionIzquierda{
	
	var coordenadaX = 1
	var coordenadaY = 2
	var logoExtencionIzquierda = "extension_izquierda.png"
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoExtencionIzquierda
	
}