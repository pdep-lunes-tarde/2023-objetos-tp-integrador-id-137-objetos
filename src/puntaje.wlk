import visuales.*

class Puntaje{
	var property vida = 5
	const oponente
	
	method recibirDanio(cantidad){
		vida = vida - cantidad
		oponente.aumentarVida(cantidad)
		puntajeDisplay.actualizar()
	}
	
	method aumentarVida(cantidad){
		vida = vida + cantidad
	}
	
	method atacar(){} //los puntajes "habitan" los espacios vacíos	
	
	//métodos que no deberían usarse, pero evitan errores 
	method cambiarObjetivo(_){}
	method image (){}
}

const vidaJugador = new Puntaje(oponente = vidaOponente)
const vidaOponente = new Puntaje(oponente = vidaJugador)
