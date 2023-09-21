import { CANTIDAD_ATENCIONES } from '../constants'
import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { formatSqlOne } from '../helpers/sql'
import { Atencion } from '../models/Atencion'
import { Referencia } from '../models/Referencia'
interface SeedParams {
  quantity?: number | undefined
}
export class AtencionSeeder {
  static seed({ quantity = CANTIDAD_ATENCIONES }: SeedParams = {}) {
    let sentence = ''
    let indiceRef = 1;
    let sentenceRef = '';
    for (let i = 1; i <= quantity; i++) {
      const atencion = new Atencion()
      if(this.tieneReferencia()){
        const referencia = new Referencia(indiceRef, 0, atencion.FechaHoraLlegada);
        const sqlRef = formatSqlOne('REFERENCIA', referencia)
        sentenceRef += sqlRef + '\n';
        atencion.IdReferencia = referencia.IdReferencia;
        indiceRef++;
      }
      
      const sql = formatSqlOne('ATENCION', atencion)
      
      sentence += sql + '\n'
    }
    exportTo('sql', sentenceRef, 'Referencias')
    exportTo('sql', sentence, 'atenciones')
  }
  static getSqlConsulta({ idCita }: { idCita: number }) {
    let sentence = ''
    const atencion = new Atencion(null, idCita, 2)
    const sql = formatSqlOne('ATENCION', atencion)
    sentence += sql + '\n'
    return sentence
  }

  static seedCsv({ quantity = CANTIDAD_ATENCIONES }: SeedParams = {}) {
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

  static tieneReferencia(): boolean{
    return (Math.floor(Math.random() * 3) + 1) === 1 ;
  }
}
