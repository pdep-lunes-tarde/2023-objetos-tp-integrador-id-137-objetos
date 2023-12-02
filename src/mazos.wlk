import cartas.*

object mazoPrincipal {
	const cartas = new List()
	
	method sacarUnaCarta(){
		const carta = cartas.anyOne()
		cartas.remove(carta)
		return carta
	}
	
	method aniadirUnaCarta(carta){
		cartas.add(carta)
	}
	
	method inicializarMazo(){
		cartas.clear()
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta1))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta1))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta2))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta2))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta3))
		self.aniadirUnaCarta(generadorDeCartas.fotocopiar(carta3))
	}
}

object mazoAbono {
	method sacarUnaCarta(){
		return generadorDeCartas.fotocopiar(carta4)	
	}
}