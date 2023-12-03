import wollok.game.*
import cartas.*
import visuales.*
import selectores.*

class Mazo inherits ObjetoVisual{
	const cartas = new List()
	const control
	
	method sacarUnaCarta(){
		const carta = cartas.anyOne()
		cartas.remove(carta)
		if(self.estaVacio()){
			game.removeVisual(self)
			control.cambiarImagen("nada.png")
		}
		return carta
	}
	
	method aniadirUnaCarta(carta){
		cartas.add(carta)
	}
	
	method estaVacio() = cartas.isEmpty()
	method tieneCartas() = !cartas.isEmpty()
}

object mazoPrincipal inherits Mazo(
	coordX = 1,
	coordY = 7,
	image = "dorsoDeMazo2.png",
	control = flechaIzquierda){

	method inicializar(){
		cartas.clear()
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta1)) //hardcodeado por tiempo
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta1))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta2))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta2))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta3))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta3))
	}
}

object mazoAbono inherits Mazo(
	coordX = 5,
	coordY = 7,
	image = "dorsoDeMazo1.png",
	control = flechaDerecha){
		
	method inicializar(){
		cartas.clear()
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4)) //hardcodeado por tiempo
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta4))
	}
}