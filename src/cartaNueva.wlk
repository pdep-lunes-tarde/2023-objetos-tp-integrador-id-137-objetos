class CartaNueva {
	
	var fuerza
	var salud
	const logoCarta
	var logoSalud
	const logoFuerza
	var sangreCarta
	const logoCostoCarta
	
	
	method setSalud(_salud){
		
		salud = _salud 
	} 
	
	method setLogoSalud(_logoSalud){
		
		logoSalud = _logoSalud
	} 
	
	method getSalud() = return salud
	method getFuerza() = return fuerza
	method getSangre() = return sangreCarta
	
}