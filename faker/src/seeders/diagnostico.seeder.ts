import { Diagnostoico } from '../models/Diagnostico'
import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { ContactoEmergencia } from '../models/ContactoEmergencia'

interface SeedParams {
  quantity?: number | undefined
}
export class DiagnosticoSeeder {

static seed({ quantity = 1000000 }: SeedParams = {}) {
  let sentence = '';
  for (let i = 1; i <= quantity; i++) {
    const contacto = new Diagnostoico(i);
    const sql = formatSqlOne('DIAGNOSTICO', contacto);
    sentence += sql + '\n';
    console.log(i);
  }
  exportTo('sql', sentence, 'diagnostico');
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
