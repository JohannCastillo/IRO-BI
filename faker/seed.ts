//import { AtencionSeeder } from './src/seeders/atencion.seeder'
import { PacienteSeeder } from './src/seeders/paciente.seeder'
import { ContactoEmergenciaSeeder } from "./src/seeders/contactoemergencia.seeder" 

function main() {
  //AtencionSeeder.seedCsv()
  PacienteSeeder.seedCsv()
  ContactoEmergenciaSeeder.seedCsv()

}

main()
