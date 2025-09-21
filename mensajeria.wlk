import mensajeros.*

object mensajeria {
    const mensajeros = []
    const paquetesEnviados = []
    const paquetesPendientes = []

    method contratar(unMensajero) {
        mensajeros.add(unMensajero)
    }

    method despedir(unMensajero) {
        mensajeros.remove(unMensajero)
    }

    method despedirATodos() {
        mensajeros.clear()
    } 

    method mensajeriaEsGrande() {
      return mensajeros.size() >= 2
    }

    method elPaquetePuedeSerEntregadoPorPrimerMensajero(unDestino){
        return paquete.sePuedeEntregar(mensajeros.first(), unDestino)
    }

    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }

    method puedeSerEntrgadoPorAlgunMensajero(unPaquete, unDestino) {
        return mensajeros.any({m => unPaquete.sePuedeEntregar(m, unDestino)})
    }

    method mensajerosQuePuedenLlevarPaqueteDado(unPaquete, unDestino){
        return mensajeros.filter({m => unPaquete.sePuedeEntregar(m, unDestino)})
    }

    method mensajeriaTieneSobrepeso(){
        return mensajeros.sum({m => m.peso()}) / mensajeros.size() > 500
    }

    method enviarPaqueteSiPuede(unPaquete, unDestino) {
      if(self.puedeSerEntrgadoPorAlgunMensajero(unPaquete, unDestino)){
        paquetesEnviados.add(unPaquete)
      }
      else{
        paquetesPendientes.add(unPaquete)
      }
    }

    method facturacionTotal(){
        return paquetesEnviados.sum({p => p.valorTotalDelPaquete()})
    }

}