import tp.*
import objetos.*

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
	
	method fuerza() = fuerza
	method salud() = salud
	method image() = image
}

//Ahora mismo, recibe cartas y les crea una copia. Podría llegar a ser necesario añadirle un método
//para crear cartas nuevas 
object generadorDeCartas{
	method fotocopiar(modelo) = new Carta(
		fuerza = modelo.fuerza(),
		salud = modelo.salud(),	
		image = modelo.image()
	)		
}

//Modelos de cartas. Son cartas totalmente funcionales, quizá sería bueno crear la clase "modelos" para diferenciarlas
//de las cartas que SÍ van a ser usadas
const carta1 = new Carta(fuerza = 1, salud = 3, image = "carta1.png")
const carta2 = new Carta(fuerza = 3, salud = 2, image = "carta2.png")
const carta3 = new Carta(fuerza = 2, salud = 1, image = "carta3.png")