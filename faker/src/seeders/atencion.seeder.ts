import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Atencion } from '../models/Atencion'
interface SeedParams {
  quantity?: number | undefined
}
export class AtencionSeeder {
  static seed({ quantity = 100 }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const atencion = new Atencion(i)
      const sql = formatSqlOne('ATENCION', atencion)
      sentence += sql + '\n'
    }
    exportTo('sql', sentence, 'atenciones')
  }

  static seedCsv({ quantity = 20 }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const atencion = new Atencion(i)
      const { csv, header } = formatCSV(atencion)
      if (i === 1) {
        sentence += header + '\n'
      }
      sentence += csv + '\n'
    }
    exportTo('csv', sentence, 'atenciones')
  }
}
