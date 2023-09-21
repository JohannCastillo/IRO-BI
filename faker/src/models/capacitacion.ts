import { faker } from '@faker-js/faker'
export class Capacitacion {
    IdCapacitacion: number       
	Costo: number
	Modalidad: string        
	Descripcion: string    
	TotalSesiones: number
	IdInstitucion: number
  constructor(IdCapacitacion: number) {
    this.IdCapacitacion = IdCapacitacion;
    this.Costo = faker.number.float({min: 0, max: 1000, precision: 2});

    this.Modalidad = faker.helpers.arrayElement(['Presencial','Virtual']);
    this.Descripcion = faker.lorem.sentence(10).substring(0, 80);
    this.TotalSesiones = faker.number.int({min: 1, max: 10});
    this.IdInstitucion = faker.number.int({min: 1, max: 100});

  }
}
