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
	method image(){}
	method salud() = 0
}

const vidaJugador = new Puntaje(oponente = vidaOponente)
const vidaOponente = new Puntaje(oponente = vidaJugador)

object puntajeDisplay inherits ObjetoVisual(coordX = 10, coordY = 6, image = "5vida.png") {

	method actualizar(){
		if(vidaJugador.vida() <= 1){
			image = "1vida.png"
		}
		if(vidaJugador.vida() == 2){
			image = "2vida.png"
		}
		if(vidaJugador.vida() == 3){
			image = "3vida.png"
		}
		if(vidaJugador.vida() == 4){
			image = "4vida.png"
		}
		if(vidaJugador.vida() == 5){
			image = "5vida.png"
		}
		if(vidaJugador.vida() == 6){
			image = "6vida.png"
		}
		if(vidaJugador.vida() == 7){
			image = "7vida.png"
		}
		if(vidaJugador.vida() == 8){
			image = "8vida.png"
		}
		if(vidaJugador.vida() == 9){
			image = "9vida.png"
		}
		if(vidaJugador.vida() >= 10){
			image = "10vida.png"
		}
	}
}