
import { faker } from '@faker-js/faker'

export class ContactoEmergencia {
    IdContactoEmergencia?: number
    Nombre: string
    Apellidos: string
    Celular: string
    Correo: string
    Relacion: string

    constructor(IdContactoEmergencia?: number) {
        this.IdContactoEmergencia = IdContactoEmergencia
        this.Nombre = faker.person.firstName()
        this.Apellidos = faker.person.lastName()
        this.Celular = faker.phone.number('9########')
        this.Correo = faker.internet.email()
        this.Relacion = faker.helpers.arrayElement(['Familiar','Cónyugue', 'Pariente lejano', 'Vecino de confianza','Endermero personal','Amigo','Trabajo','Otro'])  
    }
}