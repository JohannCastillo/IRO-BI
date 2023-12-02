import { faker } from '@faker-js/faker';

export class Cita {
    IdCita: number | null;
    IdPaciente: number;
    Costo: number;
    IdCitaEstado: number;
    constructor(idCita: number = 0, idPaciente: number = 0) {
        this.IdCita = idCita === 0 ? null : idCita;
        this.IdPaciente = idPaciente !== 0 ? idPaciente : faker.number.int({ min: 1, max: 10000 });
        this.Costo = faker.number.float({ min: 35, max: 100 });
        this.IdCitaEstado = faker.number.int({ min: 1, max: 5 });
    }
}