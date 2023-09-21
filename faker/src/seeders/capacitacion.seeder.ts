import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { ContactoEmergencia } from '../models/ContactoEmergencia'
import { Capacitacion } from '../models/capacitacion'

interface SeedParams {
  quantity?: number | undefined
}
export class CapacitacionSeeder {

static seed({ quantity = 250 }: SeedParams = {}) {
  let sentence = '';
  for (let i = 1; i <= quantity; i++) {
    const cap = new Capacitacion(i);
    const sql = formatSqlOne('CAPACITACION', cap);
    sentence += sql + '\n';
    console.log(i);
  }
  exportTo('sql', sentence, 'CAPACITACION');
}

  static seedCsv({ quantity = 40000 }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const contacto = new ContactoEmergencia(i)
      const { csv, header } = formatCSV(contacto)
      if (i === 1) sentence += header + '\n'
      sentence += csv + '\n'
    }
    exportTo('csv', sentence, 'ContactosEmergencia')
  }
}
