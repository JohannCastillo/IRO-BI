import { addIdToObjects } from '../helpers/array'
import { exportTo } from '../helpers/file'
import { formatSql, formatSqlOne } from '../helpers/sql'
import { Atencion } from '../models/Atencion'

export class AtencionSeeder {
  static seed() {
    let sentence = ''
    Array.from({ length: 1000000 }, () => {
      const atencion = new Atencion()

      const sql = formatSqlOne('ATENCION', atencion)
      sentence += sql + '\n'
      return atencion
    })
    exportTo('sql', sentence, 'atenciones')
  }

  static seedOneLine() {
    const atenciones = Array.from({ length: 1000000 }, () => {
      const atencion = new Atencion()

      return atencion
    })
    const all = formatSql('ATENCION', atenciones)

    exportTo('sql', all, 'atenciones-all')
  }
}
