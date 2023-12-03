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

//--------------------------------------

	object faseRobar{
	method accionDeInicio(){
		game.addVisual(flechaIzquierda)
		game.addVisual(flechaDerecha)
		if(mazoAbono.estaVacio() and mazoPrincipal.estaVacio()){
			self.terminarFase()
		}
	}
	
	method izquierda(){
		if(mazoPrincipal.tieneCartas()){
			mano.robar(mazoPrincipal)
			self.terminarFase()
		}
	}
	
	method derecha(){
		if(mazoAbono.tieneCartas()){
			mano.robar(mazoAbono)
			self.terminarFase()
		}
	}
	
	method arriba(){}
	
	method espacio(){}
	
	method abajo(){}
	
	method terminarFase(){
		game.removeVisual(flechaIzquierda)
		game.removeVisual(flechaDerecha)
		juego.cambiarFase(faseMano)
	}
}

//--------------------------------------
object faseMano{
	method accionDeInicio(){
		game.addVisual(indicadorMano)
	}
	
	method izquierda(){
		mano.anterior()
	}
	
	method derecha(){
		mano.siguiente()
	}
	
	method arriba(){
		mano.elegir()
	}
	
	method espacio(){
		game.removeVisual(indicadorMano)
		juego.cambiarFase(jugadorAtaca)
	}
	
	method abajo(){}
}
//--------------------------------------

object seleccionarEspacio{				
	method accionDeInicio(){}
	
	method derecha(){					
		selectorMesa.siguiente()	
	}
	
	method izquierda(){
		selectorMesa.anterior()
	}
	
	method arriba(){
		selectorMesa.elegir()
	}
	
	method espacio(){}
	
	method abajo(){
		selectorMesa.finalizar()
	}
}
//--------------------------------------

object jugadorAtaca{
	method accionDeInicio(){
		[a1,a2,a3,a4].forEach({espacio => espacio.atacar()})
	}
	
	method derecha(){}
	
	method izquierda(){}
	
	method arriba(){}
	
	method espacio(){
		juego.cambiarFase(oponenteAvanza)
	}
	
	method abajo(){}
}
//--------------------------------------

object oponenteAvanza{
	method accionDeInicio(){
		if(oponente.noTieneCartasParaAvanzar()) {juego.cambiarFase(oponenteAtaca)}
		else {oponente.avanzarCartas()}	
	}
	
	method derecha(){}
	
	method izquierda(){}
	
	method arriba(){}
	
	method espacio(){
		juego.cambiarFase(oponenteAtaca)
	}
	
	method abajo(){}
}
//--------------------------------------

object oponenteAtaca{
	method accionDeInicio(){
		if(oponente.noTieneCartasParaAtacar()) {juego.cambiarFase(oponenteBajaCartas)}
		else {oponente.atacar()}	
	}
	
	method derecha(){}
	
	method izquierda(){}
	
	method arriba(){}
	
	method espacio(){
		juego.cambiarFase(oponenteBajaCartas)
	}
	
	method abajo(){}
}

//--------------------------------------


object oponenteBajaCartas{
	method accionDeInicio(){
		oponente.bajarCarta(generadorDeCartas.fotocopiar(carta1))	
	}
	
	method derecha(){}
	
	method izquierda(){}
	
	method arriba(){}
	
	method espacio(){
		juego.cambiarFase(faseRobar)
	}
	
	method abajo(){}
}
