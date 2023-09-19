import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Paciente } from '../models/Paciente'

interface SeedParams {
  quantity?: number | undefined
}
export class PacienteSeeder {
  static seed({ quantity = 100 }: SeedParams = {}) {
    let sentence = ''
    Array.from({ length: quantity }, () => {
      const paciente = new Paciente()

      const sql = formatSqlOne('PACIENTE', paciente)
      sentence += sql + '\n'
      return paciente
    })
    exportTo('sql', sentence, 'pacientes')
  }

  static seedCsv({ quantity = 100 }: SeedParams = {}) {
    let sentence = ''
    Array.from({ length: quantity }, () => {
      const paciente = new Paciente()
      const { csv, header } = formatCSV(paciente)
      if (sentence === '') sentence += header + '\n'
      sentence += csv + '\n'
    })
    exportTo('csv', sentence, 'pacientes')
  }
}
