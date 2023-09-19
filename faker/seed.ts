import { AtencionSeeder } from './src/seeders/atencion.seeder'
import { PacienteSeeder } from './src/seeders/paciente.seeder'

function main() {
  AtencionSeeder.seedCsv()
  PacienteSeeder.seedCsv()
}

main()
