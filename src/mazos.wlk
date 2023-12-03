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
		cartas.add(generadorDeCartas.fotocopiar(carta))
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
		self.aniadirUnaCarta(girasol)
		self.aniadirUnaCarta(girasol)
		self.aniadirUnaCarta(girasol)
		self.aniadirUnaCarta(yuyo)
		self.aniadirUnaCarta(carnivora)
		self.aniadirUnaCarta(carnivora)
		self.aniadirUnaCarta(arbol)
		self.aniadirUnaCarta(bonsai)
		self.aniadirUnaCarta(bonsai)
		self.aniadirUnaCarta(bonsai)
		self.aniadirUnaCarta(abono)
		self.aniadirUnaCarta(abono)
		self.aniadirUnaCarta(tronco)
		self.aniadirUnaCarta(tronco)
		self.aniadirUnaCarta(orejaDeElefante)
		self.aniadirUnaCarta(cactus)
		self.aniadirUnaCarta(termitas)
		self.aniadirUnaCarta(termitas)
		self.aniadirUnaCarta(suculenta)
		self.aniadirUnaCarta(suculenta)
	}
}

object mazoAbono inherits Mazo(
	coordX = 5,
	coordY = 7,
	image = "dorsoDeMazo1.png",
	control = flechaDerecha){
		
	method inicializar(){
		cartas.clear()
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(brote)
		self.aniadirUnaCarta(yuyo)
		self.aniadirUnaCarta(abono)
	}
}

object hojasDeSuculenta{
	method tieneCartas() = true
	method sacarUnaCarta(){
		return generadorDeCartas.fotocopiar(hojaDeSuculenta)
	}
}