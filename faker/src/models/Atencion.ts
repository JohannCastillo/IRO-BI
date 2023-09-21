import moment from 'moment'
import { faker } from '@faker-js/faker'
import { CANTIDAD_DOCTORES, CANTIDAD_ESTADOS_ATENCION, CANTIDAD_PACIENTES, CANTIDAD_SERVICIOS } from '../constants'

export class Atencion {
  IdAtencion: number | null
  IdEstado: number | null
  FechaHoraLlegada: string
  FechaHoraAtendida: string
  IdTipoAtencion: number
  IdDoctor: number
  IdCita: number | null
  IdReferencia: number | null
  IdServicio: number
  IdPaciente: number

  constructor(
    idAtencion: number | null = null,
    idCita: number | null = null,
    idTipoAtencion: number | null = null,
    idReferencia: number | null = null,
  ) {
    let llegada = faker.date.past({ years: 7 })
    const atendida = this.addRandomMinutes(llegada, 5, 30)
    this.IdAtencion = idAtencion
    this.IdEstado = faker.number.int({ min: 1, max: CANTIDAD_ESTADOS_ATENCION })
    this.FechaHoraLlegada = llegada.toISOString()
    this.FechaHoraAtendida = atendida.toISOString()
    this.IdTipoAtencion = idTipoAtencion ?? faker.helpers.arrayElement([1, 3])
    this.IdServicio = faker.number.int({ min: 1, max: CANTIDAD_SERVICIOS })
    this.IdDoctor = faker.number.int({ min: 1, max: CANTIDAD_DOCTORES })
    this.IdPaciente = faker.number.int({ min: 1, max: CANTIDAD_PACIENTES })
    this.IdCita = idCita
    this.IdReferencia = idReferencia
  }
  private addRandomMinutes(date: Date, min: number, max: number) {
    const randomMinutes = faker.number.int({
      min,
      max
    })
    return moment(date).add(randomMinutes, 'minutes').toDate()
  }
}
