import tp.*
import selectores.*

class Carta {
	var property fuerza
	var property salud
	var objetivo = nada
	const property image
	const property costo
	const property fertilidad = 1
	
	method atacar(){
		objetivo.recibirDanio(fuerza)
	}
	
	method recibirDanio(danio){
		salud -= danio
	}
	
	method cambiarObjetivo(nuevoObjetivo){
		objetivo = nuevoObjetivo
	}
}

//Ahora mismo, recibe cartas y les crea una copia. Podría llegar a ser necesario añadirle un método
//para crear cartas nuevas 
object generadorDeCartas{
	method fotocopiar(modelo) = new Carta(
		fuerza = modelo.fuerza(),
		salud = modelo.salud(),	
		image = modelo.image(),
		costo = modelo.costo()
	)		
}

//Modelos de cartas. Son cartas totalmente funcionales, quizá sería bueno crear la clase "modelos" para diferenciarlas
//de las cartas que SÍ van a ser usadas
const carta1 = new Carta(fuerza = 1, salud = 3, image = "carta1.png", costo = 1)
const carta2 = new Carta(fuerza = 3, salud = 2, image = "carta2.png", costo = 2)
const carta3 = new Carta(fuerza = 2, salud = 1, image = "carta3.png", costo = 1)
const carta4 = new Carta(fuerza = 0, salud = 1, image = "carta5.png", costo = 0)