import moment from 'moment'
import { faker } from '@faker-js/faker'

export class Atencion {
  IdAtencion: number
  IdEstado: number
  FechaHoraLlegada: string
  FechaHoraAtendida: string
  IdTipoAtencion: number
  IdServicio: number
  IdHistoria: number
  IdDoctor: number

  constructor(
    idAtencion: number,
    idHistoria: number = 0,
    fechaAperturaHistoria: string = ''
  ) {
    this.IdAtencion = idAtencion
    let llegada = new Date()
    if (fechaAperturaHistoria) {
      llegada = faker.date.between({
        from: moment(fechaAperturaHistoria).toDate(),
        to: moment().toDate()
      })
    }
    llegada = faker.date.past({ years: 7 })
    const randomMinutes = faker.number.int({
      min: 5,
      max: 60
    })
    const atendida = moment(llegada).add(randomMinutes, 'minutes').toDate()

    this.IdEstado = faker.helpers.arrayElement([1, 2, 3, 4, 5])
    this.FechaHoraLlegada = llegada.toISOString()
    this.FechaHoraAtendida = atendida.toISOString()
    this.IdTipoAtencion = faker.helpers.arrayElement([1, 2, 3])
    this.IdServicio = faker.helpers.arrayElement([1, 2, 3, 4, 5, 6, 7])
    this.IdHistoria = idHistoria ?? faker.number.int({ min: 1, max: 50000 })
    this.IdDoctor = faker.number.int({ min: 1, max: 10000 })
  }
}
