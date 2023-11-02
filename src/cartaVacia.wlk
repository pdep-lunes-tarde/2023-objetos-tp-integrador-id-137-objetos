import wollok.game.*


object cartaVacia {

	var fuerza = 0
	var property salud = 0
	const logoCarta = "espacio.png"
	var logoSalud = ""
	var sangreCarta = 0
	
	var coordenadaX = 0
	var coordenadaY = 0
	
	method position() = game.at(coordenadaX, coordenadaY)
	
	method setCoordenadas(_x,_y){
		
		coordenadaX = _x
		coordenadaY = _y
	}

	method setLogoSalud(_logoSalud){
		
		logoSalud = _logoSalud
	} 
	
	method getLogoCarta() = return logoCarta
	method getFuerza() = return fuerza
	method getSangre() = return sangreCarta
	
	method image() = logoCarta
	
}