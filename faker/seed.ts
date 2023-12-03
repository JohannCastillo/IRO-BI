// import { PacienteSeeder } from './src/seeders/paciente.seeder'
// import { ContactoEmergenciaSeeder } from './src/seeders/contactoemergencia.seeder'
// import { CitaSeeder } from "./src/seeders/cita.seeder"
// import { AtencionSeeder } from "./src/seeders/atencion.seeder"
// import { CapacitacionSeeder } from "./src/seeders/capacitacion.seeder"
// import { CitaSeeder } from "./src/seeders/cita.seeder"

import { DefaultDataSeeder } from "./src/seeders/default.seeder";

function main() {
  // PacienteSeeder.seed()
  // ContactoEmergenciaSeeder.seed()
  // AtencionSeeder.seed()
  // CitaSeeder.seed()
  new DefaultDataSeeder().seed();

}

main()
