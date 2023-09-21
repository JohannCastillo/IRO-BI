//import { PacienteSeeder } from './src/seeders/paciente.seeder'
import { ContactoEmergenciaSeeder } from './src/seeders/contactoemergencia.seeder'
//import { HistoriaSeeder } from './src/seeders/historia.seeder'

function main() {
  //PacienteSeeder.seed()
  //HistoriaSeeder.seedCsv({ quantity: 50000, nAtenciones: 20 })
  ContactoEmergenciaSeeder.seed()
}

main()
