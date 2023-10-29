import wollok.game.*


class CartaNueva {
	
	var property fuerza
	var property salud
	const property logoCarta
	var property logoSalud
	const logoFuerza
	const property sangreCarta 
	const logoCostoCarta
	
	var coordenadaX = 0
	var coordenadaY = 0
	
	method position() = game.at(coordenadaX, coordenadaY)
	method image() = logoCarta
	
	method setCoordenadas(_x,_y){
		
		coordenadaX = _x
		coordenadaY = _y
	}
	
	
	

	 // method setLogoSalud(_logoSalud){
		
	 //	logoSalud = _logoSalud
	 // } 
	
	
	
	// method getLogoCarta() = return logoCarta
	// method getFuerza() = return fuerza
	// method getSangre() = return sangreCarta
	
}