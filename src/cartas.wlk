import tp.*
import selectores.*
import mazos.*

//------------------------------------------------------------------------------------------Cartas normales 
class Carta {
	var property fuerza
	var property salud
	var objetivo = nada
	const property image
	const property costo
	const property fertilidad = 1
	const property tipo = "normal"
	
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

//-----------------------------------------------------------------------------Cartas con sellos especiales

class CartaEspinosa inherits Carta(tipo = "espinosa"){ //por como está implementado, dos cartas con espinas luchando se siguen 
	override method recibirDanio(danio){					//dañando entre ellas hasta una muera
		salud -= danio											// (o al menos eso creí: lo probé y explotó el programa)
		objetivo.recibirDanio(1)
	}
}

class CartaVoraz inherits Carta(tipo = "voraz"){
	override method atacar(){
		if(objetivo.contieneUnaCarta()){
			objetivo.removerCarta()
		}else objetivo.recibirDanio(fuerza)
	}
}

class CartaProlifera inherits Carta(tipo = "prolifera"){
	override method recibirDanio(danio){
		salud -= danio
		if(danio > 0){mano.robar(hojasDeSuculenta)}
	}
}

class CartaFertil inherits Carta(tipo = "fertil", fertilidad = 3){}

//Ahora mismo, recibe cartas y les crea una copia. Podría llegar a ser necesario añadirle un método
//para crear cartas nuevas 
object generadorDeCartas{
	method fotocopiar(modelo){
		if(modelo.tipo() == "normal"){return new Carta(fuerza = modelo.fuerza(), salud = modelo.salud(),	image = modelo.image(), costo = modelo.costo())}
		else if(modelo.tipo() == "espinosa"){return new CartaEspinosa(fuerza = modelo.fuerza(), salud = modelo.salud(),	image = modelo.image(), costo = modelo.costo())}
		else if(modelo.tipo() == "voraz"){return new CartaVoraz(fuerza = modelo.fuerza(), salud = modelo.salud(),	image = modelo.image(), costo = modelo.costo())}
		else if(modelo.tipo() == "fertil"){return new CartaFertil(fuerza = modelo.fuerza(), salud = modelo.salud(),	image = modelo.image(), costo = modelo.costo())}
		else {return new CartaProlifera(fuerza = modelo.fuerza(), salud = modelo.salud(),	image = modelo.image(), costo = modelo.costo())}
	}
}

//Modelos de cartas
const girasol = new Carta(fuerza = 1, salud = 3, image = "girasol.png", costo = 1)
const yuyo = new Carta (fuerza = 1, salud = 1, image = "yuyo.png", costo = 0)
const carnivora = new Carta(fuerza = 3, salud = 2, image = "carnivora.png", costo = 2)
const brote = new Carta(fuerza = 0, salud = 1, image = "brote.png", costo = 0)
const arbol = new Carta(fuerza = 7, salud = 7, image = "arbol.png", costo = 4)
const bonsai = new Carta(fuerza = 2, salud = 1, image = "bonsai.png", costo = 1)
const tronco = new Carta(fuerza = 0, salud = 6, image = "tronco.png", costo = 1)
const abono = new CartaFertil(fuerza = 1, salud = 1, image = "abono.png", costo = 1)
const orejaDeElefante = new Carta(fuerza = 4, salud = 3, image = "orejaDeElefante.png", costo = 3)
const hojaDeSuculenta = new Carta(fuerza = 1, salud = 1, image = "hojaDeSuculenta.png", costo = 1)
const cactus = new CartaEspinosa(fuerza = 2, salud = 4, image = "cactus.png", costo = 2)
const rosa = new CartaEspinosa(fuerza = 1, salud = 1, image = "rosa.png", costo = 1)
const termitas = new CartaVoraz(fuerza = 1, salud = 1, image = "termitas.png", costo = 2)
const suculenta = new CartaProlifera(fuerza = 2, salud = 4, image = "suculenta.png", costo = 2)