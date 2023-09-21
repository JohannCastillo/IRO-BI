// import { PacienteSeeder } from './src/seeders/paciente.seeder'
// import { ContactoEmergenciaSeeder } from './src/seeders/contactoemergencia.seeder'
// import { HistoriaSeeder } from './src/seeders/historia.seeder'

import { CapacitacionSeeder } from "./src/seeders/capacitacion.seeder";
// import { DiagnosticoSeeder } from "./src/seeders/diagnostico.seeder";

function main() {
  // PacienteSeeder.seedCsv()
  // HistoriaSeeder.seedCsvWithAtenciones({ quantity: 50000, nAtenciones: 20 })
  // ContactoEmergenciaSeeder.seedCsv()
  // DiagnosticoSeeder.seed();
  CapacitacionSeeder.seed();
}

main()
