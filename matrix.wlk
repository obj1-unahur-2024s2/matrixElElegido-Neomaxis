object neo {
    var energia = 100
 
    method esElElegido() = true
    method saltar() {
        energia = energia * 0.5
    }
    method vitalidad() = energia * 0.1
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
    }
    method estaCansado() = estaCansado
}

object trinity {
    method esElElegido() = false
    method vitalidad() = 0
    method saltar() {}
}

object nave {
    const property pasajeros = [neo, morfeo, trinity]

    method pasajeros() = pasajeros
    method subirA(unPasajero){
        pasajeros.add(unPasajero)
    }
    method bajarA(unPasajero){
        pasajeros.remove(unPasajero)
    }
    method cuantosPasajerosHay() = pasajeros.size()
    method pasajeroMasVital() = pasajeros.max({p => p.vitalidad()})
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method pasajeroMenosVital() = pasajeros.min({p => p.vitalidad()})
    method estaEquilibrada() {
        return self.pasajeroMasVital().vitalidad() <= self.pasajeroMenosVital().vitalidad()*2
    }
    method chocar() {
        pasajeros.forEach({p => p.saltar() self.bajarA(p)})
        // pasajeros.clear() se puede hacer asi tambien
    }
    method acelerar() {
        self.pasajerosSinElElegido().forEach({pas => pas.saltar()})
    }
    method pasajerosSinElElegido() {
        pasajeros.filter({p => !p.esElElegido()})
    }
}