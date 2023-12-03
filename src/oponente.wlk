import mesa.*

object oponente {
	const espaciosDeCombate = [b1, b2, b3, b4]
	const espaciosDeAvance = [c1, c2 , c3, c4]
	
	method avanzarCartas(){
		espaciosDeAvance.forEach({espacio => espacio.avanzar()})
	}
	
	method atacar(){
		espaciosDeCombate.forEach({espacio => espacio.atacar()})
	}
	
	method bajarCarta(carta){
		if(self.tieneEspacioLibre()){
			self.unEspacioLibre().ponerCarta(carta)
		}
	}
	
	method noTieneCartasParaAtacar() = espaciosDeCombate.all(estaLibre)
	method noTieneCartasParaAvanzar() = espaciosDeAvance.all(estaLibre)
	method tieneEspacioLibre() = espaciosDeAvance.any(estaLibre)
	method unEspacioLibre() = espaciosDeAvance.filter({espacio => espacio.estaLibre()}).anyOne() //intenté poner directamente el oebjeto "estaLibre" pero fallaba 
}

object estaLibre{
	method apply(espacio) = espacio.estaLibre()
}