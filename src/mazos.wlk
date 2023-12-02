object mazo {
	const cartas = new List()
	
	method sacarUnaCarta(){
		const carta = cartas.anyOne()
		cartas.remove(carta)
		return carta
	}
}

object mazoAbono {
	method sacarUnaCarta(){
		
	}
}