import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { ContactoEmergencia } from '../models/ContactoEmergencia'

interface SeedParams {
  quantity?: number | undefined
}
export class ContactoEmergenciaSeeder {

static seed({ quantity = 40000 }: SeedParams = {}) {
  let sentence = '';
  for (let i = 1; i <= quantity; i++) {
    const contacto = new ContactoEmergencia();
    const sql = formatSqlOne('CONTACTO_EMERGENCIA', contacto);
    sentence += sql + '\n';
  }
  exportTo('sql', sentence, 'ContactoEmergencia');
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
