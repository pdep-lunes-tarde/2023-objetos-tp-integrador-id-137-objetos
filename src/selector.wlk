class Selector {
	
	const cantidadElementos
	var elementoActual // comienza con el valor 0
	const coordenadaInicialX
	const coordenadaInicialY // Se utiliza para dibujar (NO BORRAR)
	var desplazamiento //Nota siempre se mueve horizotalmente



//Esto no tipa por que ya existe un selector en el código anterior, pero funciona :D
	
	method desplazarDerecha(){
		
		if(elementoActual < cantidadElementos){
			
			return coordenadaInicialX + (desplazamiento*(elementoActual+1))
		}else{
			
			return coordenadaInicialX + (desplazamiento*elementoActual)
		}
				
	}
	
	method desplazarIzquierda(){
		
		if(elementoActual > 0){
			
			return coordenadaInicialX + (desplazamiento*(elementoActual-1))
		}else{
			
			return coordenadaInicialX + (desplazamiento*elementoActual)
		}
				
	}
	
	method obtenerElementoSeleccionado(){
		
		return elementoActual
	}
}
