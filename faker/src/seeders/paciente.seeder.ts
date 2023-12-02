import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Paciente } from '../models/Paciente'

interface SeedParams {
  quantity?: number | undefined
}
export class PacienteSeeder {

static seed({ quantity = 50000 }: SeedParams = {}) {
  let sentence = '';
  for (let i = 1; i <= quantity; i++) {
    var paciente
    if (i < 40000)
      paciente = new Paciente(1160, 1170);
    else if (i<47000)
      paciente = new Paciente(1160, 1242);
    else paciente = new Paciente(1, 1874);
    const sql = formatSqlOne('PACIENTE', paciente);
    sentence += sql + '\n';
  }
  exportTo('sql', sentence, 'PACIENTE');
}

  static seedCsv({ quantity = 50000 }: SeedParams = {}) {
    let sentence = ''
    for (let i = 1; i <= quantity; i++) {
      const paciente = new Paciente(1,1874, i)
      const { csv, header } = formatCSV(paciente)
      if (i === 1) sentence += header + '\n'
      sentence += csv + '\n'
    }
    //Por cada paciente crea historia aquí 
    

    exportTo('csv', sentence, 'pacientes')
  }
}
