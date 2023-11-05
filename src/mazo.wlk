import cartaNueva.*
import wollok.game.*


class Mazo {
	
	const cartasEnElMazo = []
	const logoMazo //completar con el logo del mazo
	const posicionX
	const posicionY
	
	method position() = game.at(posicionX, posicionY)
	method image() = logoMazo
	
	method obtenerCarta(){
		
		return self.armarCarta(cartasEnElMazo.anyOne())
	}
	
	method armarCarta(nombreCarta){
		
		if(nombreCarta == "girasol"){
			
			return new CartaNueva(logoCarta = "carta1.png",fuerza = 1, salud = 1, sangreCarta = 1)
			
		}if(nombreCarta == "carnivora"){
			
		return new CartaNueva(logoCarta = "carta2.png", sangreCarta = 2, fuerza = 3, salud = 4)
			
		}else if(nombreCarta == "carpincho"){
			
		return new CartaNueva(logoCarta = "carta3.png", sangreCarta = 1, fuerza = 2, salud = 3)
			
		}else if(nombreCarta == "marmota"){
			
		return new CartaNueva(logoCarta = "carta4.png", sangreCarta = 1, fuerza = 1, salud = 1)
			
		}else if(nombreCarta == "ardilla"){
			
		return new CartaNueva(logoCarta = "carta5.png", sangreCarta = 0, fuerza = 0, salud = 1)
			
		}else if(nombreCarta == "tortuga"){
			
		return new CartaNueva(logoCarta = "carta6.png", sangreCarta = 3, fuerza = 1, salud = 7)
			
		}else if(nombreCarta == "oso"){
			
		return new CartaNueva(logoCarta = "carta7.png", sangreCarta = 4, fuerza = 4, salud = 6)
			
		}else if(nombreCarta == "jabali"){
			
		return new CartaNueva(logoCarta = "carta8.png", sangreCarta = 3, fuerza = 3, salud = 3)
			
		}else if(nombreCarta == "leon"){
			
		return new CartaNueva(logoCarta = "carta9.png", sangreCarta = 4, fuerza = 4, salud = 8)
			
		}else{ // retorna COYOTE
			
		return new CartaNueva(logoCarta = "carta10.png", sangreCarta = 2, fuerza = 3, salud = 3)
			
		}
		
	}	

}