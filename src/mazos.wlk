import mazo.*

object mazos {
	
	const mazoEsbirros = new Mazo(cartasEnElMazo = ["esbirro"])
	const mazoSacrificio = new Mazo(cartasEnElMazo = ["primeraCarta","segundaCarta"])
	
	method tomarCarta(selector){
		
		if(selector == 0){
			
			return mazoEsbirros.obtenerCarta();
		}else{
			
			return mazoSacrificio.obtenerCarta()
		}
	}
}
