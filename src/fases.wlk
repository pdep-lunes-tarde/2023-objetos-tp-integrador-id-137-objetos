import wollok.game.*
import mesa.*
import selectores.*
import oponente.*
import cartas.*
import mesa.*
import tp.*
import visuales.*
import mazos.*

//las fases se van a encargar de determinar qué acción tiene que tener cada imput en cada momento

class Fase{
	method accionDeInicio(){}
	method izquierda(){}
	method derecha(){}
	method arriba(){}
	method espacio(){}
	method abajo(){}
	method i(){
		infoControles.suspenderFase()
	}
}


//--------------------------------------

	object faseRobar inherits Fase{
		override method accionDeInicio(){
			game.addVisual(flechaIzquierda)
			game.addVisual(flechaDerecha)
			if(mazoAbono.estaVacio() and mazoPrincipal.estaVacio()){
			self.terminarFase()
		}
	}
	
	override method izquierda(){
		if(mazoPrincipal.tieneCartas()){
			mano.robar(mazoPrincipal)
			self.terminarFase()
		}
	}
	
	override method derecha(){
		if(mazoAbono.tieneCartas()){
			mano.robar(mazoAbono)
			self.terminarFase()
		}
	}
	
	override method espacio(){
		game.addVisual(indicadorMano)
		juego.cambiarSemiFase(verManoDuranteRobo)
	}
	
	method terminarFase(){
		game.removeVisual(flechaIzquierda)
		game.removeVisual(flechaDerecha)
		juego.cambiarFase(faseMano)
	}
	
	method controles() = "controlesRobar.png"
}

//--------------------------------------

object verManoDuranteRobo inherits Fase{

	override method izquierda(){
		mano.anterior()
	}
	
	override method derecha(){
		mano.siguiente()
	}
	
	override method arriba(){}
	
	override method espacio(){
		game.removeVisual(indicadorMano)
		juego.cambiarSemiFase(faseRobar)
	}
	
	method controles() = "controlesVerManoDuranteRobo.png"
}

//--------------------------------------

object faseMano inherits Fase{
	override method accionDeInicio(){
		game.addVisual(indicadorMano)
	}
	
	override method izquierda(){
		mano.anterior()
	}
	
	override method derecha(){
		mano.siguiente()
	}
	
	override method arriba(){
		mano.elegir()
	}
	
	override method espacio(){
		game.removeVisual(indicadorMano)
		juego.cambiarFase(jugadorAtaca)
	}
	
	method controles() = "controlesMano.png"
}
//--------------------------------------

object seleccionarEspacio inherits Fase{				
	
	override method derecha(){					
		selectorMesa.siguiente()	
	}
	
	override method izquierda(){
		selectorMesa.anterior()
	}
	
	override method arriba(){
		selectorMesa.elegir()
	}
	
	override method abajo(){
		selectorMesa.finalizar()
	}
	
	method controles() = "controlesMesa.png"
}
//--------------------------------------

object jugadorAtaca inherits Fase{
	override method accionDeInicio(){
		[a1,a2,a3,a4].forEach({espacio => espacio.atacar()})
	}

	override method espacio(){
		juego.cambiarFase(oponenteAvanza)
	}
	
	method controes() = "controlesFaseNoInteractiva.png"
}

//--------------------------------------

object oponenteAvanza inherits Fase{
	override method accionDeInicio(){
		if(oponente.noTieneCartasParaAvanzar()) {juego.cambiarFase(oponenteAtaca)}
		else {oponente.avanzarCartas()}	
	}
	
	override method espacio(){
		juego.cambiarFase(oponenteAtaca)
	}
	
	method controes() = "controlesFaseNoInteractiva.png"
}
//--------------------------------------

object oponenteAtaca inherits Fase{
	override method accionDeInicio(){
		if(oponente.noTieneCartasParaAtacar()) {juego.cambiarFase(oponenteBajaCartas)}
		else {oponente.atacar()}	
	}
	
	override method espacio(){
		juego.cambiarFase(oponenteBajaCartas)
	}
	
	method controes() = "controlesFaseNoInteractiva.png"
}

//--------------------------------------


object oponenteBajaCartas inherits Fase{
	override method accionDeInicio(){
		oponente.bajarTurno()	
	}
	
	override method espacio(){
		juego.cambiarFase(faseRobar)
	}
	
	method controes() = "controlesFaseNoInteractiva.png"
}

//--------------------------------------

object verControles inherits Fase{
	 override method i(){
	 	infoControles.volverAFase()
	 }
}

//---------------------------------------

object faseFinal inherits Fase{
	override method i(){}
}