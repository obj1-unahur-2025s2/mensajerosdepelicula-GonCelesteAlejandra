// -------- Paquetes --------

object paquete {
  const valor = 50
  var pago = 0

  method estaPago(){return valor == pago} 

  method pagarPaquete() {
    pago = 50
  }

  method sePuedeEntregar(unMensajero, unDestino){
   return unMensajero.puedeArribar(unDestino) && self.estaPago()
  }

  method valorTotalDelPaquete(){return valor}
}

object paquetito {

  method valorTotalDelPaquete(){return 0}

  method estaPago(){return true} 

  method sePuedeEntregar(unMensajero, unDestino){
   return true
  }
}

object paquetonViajero {

  const valorPorDestino = 100 
  var pagoPorDestino = 0
  const destinos = []

  method agregarDestino(unDestino) {
    destinos.add(unDestino)
  }

  method estaPago(){return self.valorTotalDelPaquete() == pagoPorDestino} 

  method valorTotalDelPaquete() {
    return destinos.size() * valorPorDestino
  }

  method pagarPorDestino(){
    pagoPorDestino += 100 
  }

  method sePuedeEntregar(unMensajero, unDestino){
   return destinos.all({d => unMensajero.puedeArribar(d)}) && self.estaPago()
  }
}
// -------- Destinos --------

object puenteBrooklyn {
  method permiteElArribo(unMensajero){return unMensajero.peso() <= 1000}
}

object laMatrix {
  method permiteElArribo(unMensajero){return unMensajero.puedeLlamar()}
}

// -------- Mensajeros --------

object roberto {
  var vehiculo = bicicleta

  method cambiarVehiculo(unVehiculo){
    vehiculo = unVehiculo
  }

  method peso() {return 90 + vehiculo.peso()}

  method puedeLlamar(){return false}
  
  method puedeArribar(unDestino){return unDestino.permiteElArribo(self)}

}

object chuckNorris{

  method peso() {return 80}

  method puedeLlamar(){return true}

  method puedeArribar(unDestino){return unDestino.permiteElArribo(self)}

}

object neo {

  method peso() {return 0}

  method puedeLlamar(){return celular.tieneCredito()}

  method puedeArribar(unDestino){return unDestino.permiteElArribo(self)}
}

// -------- Vehiculos --------

object bicicleta {
  method peso(){return 5}
}

object camion {
  var acoplado = 1

  method modificarCantidadAcoplados(unValor){
    acoplado = unValor
  }

  method peso(){return acoplado * 500}
}

// -------- Objetos --------

object celular {
  var tieneCredito = true

  method cargarCredito(){
    tieneCredito = true
  }

  method descargarCredito(){
    tieneCredito = false
  }

  method tieneCredito(){
    return tieneCredito
  }
}