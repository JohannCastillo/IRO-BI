
import { faker } from '@faker-js/faker'
import { now } from 'moment'

export class Paciente {
    IdPaciente?: number
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
    
    constructor(minDistrito: number, maxDistrito: number, IdPaciente?: number ) {
        this.IdPaciente = IdPaciente
        this.DNI = faker.string.numeric('########')
        this.IdTipoPaciente = faker.number.int({ min: 1, max: 4 })
        this.IdDistrito = faker.number.int({min:minDistrito, max: maxDistrito  })
        this.FechaDeNacimiento = faker.date.past({years: 80, refDate: now()})
        this.Nombre = faker.person.fullName()
        this.Sexo = faker.helpers.arrayElement(['M', 'F'])
        this.Celular = faker.phone.number('9########')
        this.Correo = faker.internet.email()
        this.Observaciones = faker.lorem.sentence({min:10 , max: 20})
        this.Domicilio = faker.location.streetAddress()
        this.TipoSangre = faker.helpers.arrayElement(['A+','A-', 'B+','B-', 'AB+', 'AB-', 'O+', 'O-'])
        this.EstadoCivil = faker.helpers.arrayElement(['Soltero', 'Casado', 'Divorciado', 'Viudo'])
        this.IdContactoEmergencia = faker.number.int({ min: 1, max: 40000 })
    }
}