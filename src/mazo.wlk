import cartaNueva.*
import wollok.game.*


class Mazo {
	
	const cartasEnElMazo = [self.armarCarta("primeraCarta"), self.armarCarta("")]
	const logoMazo = "espacio.png" //completar con el logo del mazo
	const posicionX
	const posicionY
	
	method position() = game.at(posicionX, posicionY)
	method image() = logoMazo
	
	method obtenerCarta(){
		
		return cartasEnElMazo.anyOne()
	}
	
	method armarCarta(nombreCarta){
		
		if(nombreCarta == "primeraCarta"){
			
			return new CartaNueva(fuerza = 1, salud = 1, logoCarta = 1, logoSalud = 1, logoFuerza = 1, sangreCarta = 1, logoCostoCarta = 1)
			
		}else{
			
		return new CartaNueva(fuerza = 2, salud = 2, logoCarta = 2, logoSalud = 2, logoFuerza = 2, sangreCarta = 2, logoCostoCarta = 2)
			
		}
		
	}	

	method obtenerLogoMazo(){
		
		return logoMazo
	}
	
	method obtenerImagen(){
		
		return logoMazo
	}
}