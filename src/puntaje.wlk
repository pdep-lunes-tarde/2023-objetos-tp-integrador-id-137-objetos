class Puntaje{
	var vida = 5
	const oponente
	
	method recibirDanio(cantidad){
		vida = vida - cantidad
		oponente.aumentarVida(cantidad)
	}
	
	method aumentarVida(cantidad){
		vida = vida + cantidad
	}
}

const vidaJugador = new Puntaje(oponente = vidaOponente)
const vidaOponente = new Puntaje(oponente = vidaJugador)
