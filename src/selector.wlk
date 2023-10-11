import wollok.game.*


class Selector {
	
	const cantidadElementos
	var elementoActual // comienza con el valor 0
	const coordenadaInicialX
	const coordenadaInicialY // Se utiliza para dibujar (NO BORRAR)
	var posicionActualX = coordenadaInicialX
	var desplazamiento //Nota siempre se mueve horizotalmente
	const logoSelector = "espacio.png" // agregar

	method position() = game.at(posicionActualX, coordenadaInicialY)
	method image() = logoSelector

//Esto no tipa por que ya existe un selector en el código anterior, pero funciona :D
	
	method desplazarDerecha(){
				
		if(elementoActual < cantidadElementos){
			
			posicionActualX =  coordenadaInicialX + (desplazamiento*(elementoActual+1))
			elementoActual++
		}else{
			
			posicionActualX =  coordenadaInicialX + (desplazamiento*elementoActual)
		}
				
	}
	
	method desplazarIzquierda(){
		
		if(elementoActual > 0){
			
			posicionActualX = coordenadaInicialX + (desplazamiento*(elementoActual-1))
			elementoActual--
		}else{
			
			posicionActualX = coordenadaInicialX + (desplazamiento*elementoActual)
		}
				
	}
	
	method getSelector(){
		
		return elementoActual
	}
	

}
