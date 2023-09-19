import { faker } from '@faker-js/faker'
export class Historia {
  IdHistoria: number
  IdPaciente: number
  FechaRegistro: string
  constructor(IdHistoria: number, IdPaciente: number = 0) {
    this.IdHistoria = IdHistoria
    this.IdPaciente = IdPaciente ?? faker.number.int({ min: 1, max: 50000 })
    this.FechaRegistro = faker.date.past({
      years: 8,
    }).toISOString()
  }
}
