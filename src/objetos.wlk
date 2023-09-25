import zonas.*

//-------------------------------------------------------
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
	
	method atacar(){}
	
	//métodos que no deberían usarse, pero evitan errores 
	method cambiarObjetivo(_){}
	method image (){}
}

const vidaJugador = new Puntaje(oponente = vidaOponente)
const vidaOponente = new Puntaje(oponente = vidaJugador)

//-------------------------------------------------------

//-------------------------------------------------------
object selectorDeEspacio{
	const espacios = [a1, a2, a3, a4]
	var seleccion
	var posicionSeleccion
	
	method siguiente(){
		if(posicionSeleccion < 3){
			posicionSeleccion++
			self.nuevaSeleccion()
		}
	}
	
	method anterior(){
			posicionSeleccion++
		if(posicionSeleccion > 0){
			self.nuevaSeleccion()
		}
	}
	
	method nuevaSeleccion(){
		seleccion = espacios.get(posicionSeleccion)
	}
	
	method elegir(){
		mano.bajarCartaElegida(seleccion)
		self.finalizar()
	}
	
	method iniciar(){
		seleccion = a1
		posicionSeleccion = 0
	}
	method finalizar(){}
}
//-------------------------------------------------------
