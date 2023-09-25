class Carta {
	var objetivo = nada
	var fuerza
	var salud
	const image
	
	method atacar(){
		objetivo.recibirDanio(fuerza)
	}
	
	method recibirDanio(danio){
		salud = salud - danio
	}
	
	method cambiarObjetivo(nuevoObjetivo){
		objetivo = nuevoObjetivo
	}
	
	method image() = image
}

object nada{
	method recibirDanio(_){}
	method ponerCarta(){}
}

//cartas para probar 
const carta1 = new Carta(fuerza = 1, salud = 3, image = "carta1.png")
const carta2 = new Carta(fuerza = 3, salud = 2, image = "carta2.png")
const carta3 = new Carta(fuerza = 2, salud = 1, image = "carta3.png")