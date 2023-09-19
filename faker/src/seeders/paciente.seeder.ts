import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Paciente } from '../models/Paciente'

interface SeedParams {
  quantity?: number | undefined
}
export class PacienteSeeder {

static seed({ quantity = 100 }: SeedParams = {}) {
  let sentence = '';
  for (let i = 1; i <= quantity; i++) {
    const paciente = new Paciente(i);
    const sql = formatSqlOne('PACIENTE', paciente);
    sentence += sql + '\n';
  }
  exportTo('sql', sentence, 'pacientes');
}

  static seedCsv({ quantity = 1000 }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const paciente = new Paciente(i)
      const { csv, header } = formatCSV(paciente)
      if (i === 1) sentence += header + '\n'
      sentence += csv + '\n'
    }
    //Por cada paciente crea historia aquí 
    

    exportTo('csv', sentence, 'pacientes')
  }
}
