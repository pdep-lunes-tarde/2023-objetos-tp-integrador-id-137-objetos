import tp.*

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

/*vamos a necesitar un objeto que cree cartas con atributos en vez de definilas directamente,
  así podemos evitar que cuando una carta reciba daño *todas* las cartas iguales reciban daño*/

//cartas para probar 
const carta1 = new Carta(fuerza = 1, salud = 3, image = "carta1.png")
const carta2 = new Carta(fuerza = 3, salud = 2, image = "carta2.png")
const carta3 = new Carta(fuerza = 2, salud = 1, image = "carta3.png")