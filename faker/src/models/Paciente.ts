
import { faker } from '@faker-js/faker'

export class Paciente {
    DNI: string
    IdTipoPaciente: number
    IdDistrito: number
    FechaDeNacimiento: Date 
    Nombre: string
    Sexo: string
    Celular: string
    Correo: string
    Observaciones: string
    Domicilio: string
    TipoSangre: string
    EstadoCivil: string
    IdContactoEmergencia:number

    constructor() {
        this.DNI = faker.string.numeric(8).toString()
        this.IdTipoPaciente = faker.number.int({ min: 1, max: 4 })
        this.IdDistrito = faker.number.int({ min: 1, max: 5 })
        this.FechaDeNacimiento = faker.date.birthdate()
        this.Nombre = faker.person.fullName()
        this.Sexo = faker.helpers.arrayElement(['M', 'F'])
        this.Celular = faker.phone.number('##########')
        this.Correo = faker.internet.email()
        this.Observaciones = faker.lorem.paragraph(2)
        this.Domicilio = faker.location.streetAddress()
        this.TipoSangre = faker.helpers.arrayElement(['A+','A-', 'B+','B-', 'AB+', 'AB-', 'O+', 'O-'])
        this.EstadoCivil = faker.helpers.arrayElement(['Soltero', 'Casado', 'Divorciado', 'Viudo'])
        this.IdContactoEmergencia = faker.number.int({ min: 1, max: 10000 })
    }
}