// import { PacienteSeeder } from './src/seeders/paciente.seeder'
// import { ContactoEmergenciaSeeder } from './src/seeders/contactoemergencia.seeder'
//import { HistoriaSeeder } from './src/seeders/historia.seeder'

import { AtencionSeeder } from "./src/seeders/atencion.seeder"
import { CitaSeeder } from "./src/seeders/cita.seeder"

function main() {
  // PacienteSeeder.seed()
  // ContactoEmergenciaSeeder.seed()
  AtencionSeeder.seed()
  CitaSeeder.seed()
}

main()
