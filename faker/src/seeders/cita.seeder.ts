import { CANTIDAD_CITAS } from '../constants'
import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Cita } from '../models/Cita'
import { AtencionSeeder } from './atencion.seeder'
interface SeedParams {
  quantity?: number | undefined
}
export class CitaSeeder {
  static seed({ quantity = CANTIDAD_CITAS }: SeedParams = {}) {
    let sentence = ''
    let atenciones = ''
    for (let i = 1; i <= quantity; i++) {
      const cita = new Cita()
      const sql = formatSqlOne('CITA', cita)
      sentence += sql + '\n'
      // generate atención
      atenciones += AtencionSeeder.getSqlConsulta({ idCita: i })
      console.log("Cita: " + i)
    }

    exportTo('sql', sentence, 'citas')
    exportTo('sql', atenciones, 'atenciones-consultas')
  }

  static seedCsv({ quantity = CANTIDAD_CITAS }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const cita = new Cita(i)
      const { csv, header } = formatCSV(cita)
      if (i === 1) {
        sentence += header + '\n'
      }
      sentence += csv + '\n'
    }
    exportTo('csv', sentence, 'citas')
  }
}
