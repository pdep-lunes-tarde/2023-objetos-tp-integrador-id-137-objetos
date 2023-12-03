import mesa.*
import cartas.*

object oponente {
	const espaciosDeCombate = [b1, b2, b3, b4]
	const espaciosDeAvance = [c1, c2 , c3, c4]
	var turno = 0
	
	method avanzarCartas(){
		espaciosDeAvance.forEach({espacio => espacio.avanzar()})
	}
	
	method atacar(){
		espaciosDeCombate.forEach({espacio => espacio.atacar()})
	}
	
	method bajarCarta(carta){
		if(self.tieneEspacioLibre()){
			self.unEspacioLibre().ponerCarta(generadorDeCartas.fotocopiar(carta))
		}
	}
	
	//Los turnos del oponente son siempre iguales, lo único que cambia es la posición en la que baja las cartas
	method bajarTurno(){
		if(turno == 0){
			self.bajarCarta(bonsai)
			self.bajarCarta(girasol)
			self.bajarCarta(tronco)
		}
		if(turno == 1){
			self.bajarCarta(bonsai)

		}
		if(turno == 2){
			self.bajarCarta(carnivora)
		}
		if(turno == 3){
			self.bajarCarta(rosa)
		}
		if(turno == 4){
			self.bajarCarta(termitas)
		}
		if(turno == 6){
			self.bajarCarta(cactus)	
		}
		if(turno == 8){
			self.bajarCarta(tronco)
			self.bajarCarta(tronco)
		}
		if(turno == 9){
			self.bajarCarta(termitas)
		}
		if(turno == 10){
			self.bajarCarta(arbol)
		}
		turno++
	}
	
	method noTieneCartasParaAtacar() = espaciosDeCombate.all(estaLibre)
	method noTieneCartasParaAvanzar() = espaciosDeAvance.all(estaLibre)
	method tieneEspacioLibre() = espaciosDeAvance.any(estaLibre)
	method unEspacioLibre() = espaciosDeAvance.filter({espacio => espacio.estaLibre()}).anyOne() //intenté poner directamente el oebjeto "estaLibre" pero fallaba 
}

object estaLibre{
	method apply(espacio) = espacio.estaLibre()
}