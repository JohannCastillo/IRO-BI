import { Atencion } from '../models/Atencion'
import { formatCSV } from '../helpers/cvs'
import { exportTo } from '../helpers/file'
import { Historia } from '../models/Historia'
interface SeedParams {
  quantity?: number | undefined
}
export class HistoriaSeeder {
  static seedCsv({ quantity = 50000 }: SeedParams = {}) {
    let historiasCSV = ''
    for (let i = 1; i <= quantity; i++) {
      const historia = new Historia(i)
      const { csv, header } = formatCSV(historia)
      if (i === 1) {
        historiasCSV += header + '\n'
      }
      historiasCSV += csv + '\n'
    }
    exportTo('csv', historiasCSV, 'Historias')
  }
  static seedCsvWithAtenciones({
    quantity = 50000,
    nAtenciones = 10
  }: SeedParams & { nAtenciones?: number } = {}) {
    let historiasCSV = ''
    let atencionesCSV = ''
    let atencionCounter = 1
    for (let i = 1; i <= quantity; i++) {
      const historia = new Historia(i, i)
      const { csv, header } = formatCSV(historia)
      if (i === 1) historiasCSV += header + '\n'
      historiasCSV += csv + '\n'
      // generate atenciones
      for (let j = 1; j <= nAtenciones; j++) {
        const atencion = new Atencion(
          atencionCounter,
          historia.IdHistoria,
          historia.FechaRegistro
        )
        const { csv, header } = formatCSV(atencion)
        if (j === 1 && i === 1) atencionesCSV += header + '\n'
        atencionesCSV += csv + '\n'
        atencionCounter++
      }
    }
    exportTo('csv', historiasCSV, 'Historias')
    exportTo('csv', atencionesCSV, 'Atenciones')
  }
}
