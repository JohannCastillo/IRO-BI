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
    Array.from({ length: quantity }, () => {
      const atencion = new Atencion()

      const sql = formatSqlOne('ATENCION', atencion)
      sentence += sql + '\n'
      return atencion
    })
    exportTo('sql', sentence, 'atenciones')
  }

  static seedCsv({ quantity = 100 }: SeedParams = {}) {
    let sentence = ''
    Array.from({ length: quantity }, () => {
      const atencion = new Atencion()
      const { csv, header } = formatCSV(atencion)
      if (sentence === '') sentence += header + '\n'
      sentence += csv + '\n'
    })
    exportTo('csv', sentence, 'atenciones')
  }
}
