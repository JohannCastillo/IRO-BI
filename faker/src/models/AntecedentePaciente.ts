import { faker } from '@faker-js/faker'
import { now } from 'moment'

export class AntecedentePaciente {
    IdAntecedente: number
    IdPaciente: number
    Detalle: string
    FechaRegistro: string

    constructor(IdPaciente: number, fechaNacimiento: string) {
        this.IdAntecedente = faker.number.int({ min: 1, max: 116 })
        this.IdPaciente = IdPaciente
        this.Detalle = faker.lorem.sentence({min:4 , max: 15}).slice(0, 50)
        this.FechaRegistro = faker.date.between({from: fechaNacimiento, to:now()}).toISOString()
    }
}