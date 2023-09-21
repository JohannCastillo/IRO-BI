import { faker } from '@faker-js/faker'
export class Diagnostoico {
    IdAtencion: number;
    LejosODEsf: number;
	LejosODCil: number;
	LejosODEje: number;
	LejosOIEsf: number;
	LejosOICil: number;
	LejosOIEje: number;
	CercaODEsf: number;
	CercaODCil: number;
	CercaODEje: number;
	CercaOIEsf: number;
	CercaOICil: number;
	CercaOIEje: number;

    AgudezaVisual: number
	Tonometria: number
	Refraccion: number
	Campimetria: number
	CurvaturaCorneal: number
	MedicionLagrima: number
	Paquimetria: number
	OCT: number

    Observaciones: string
  constructor(IdAtencion: number) {
    this.IdAtencion = IdAtencion;
    this.AgudezaVisual = faker.number.int({min: 6, max: 20});
    this.Tonometria = faker.number.int({min: 10, max: 30});
    this.Refraccion = faker.number.float({min: -10, max: 10, precision: 2});
    this.Paquimetria = faker.number.float({min: 400, max: 600, precision: 2});
    this.OCT = faker.number.float({min: 50, max: 600, precision: 2});
    
    var prob = faker.number.int(100);



    if (prob < 35) {
        this.Observaciones = faker.lorem.sentence(10);
        return;
    }

    prob = faker.number.int(100);

    if (prob < 33 || prob > 85){
        this.LejosODEsf = faker.number.float({min: -10, max: 10, precision: 2});
        this.LejosODCil = faker.number.float({min: -10, max: 10, precision: 2});
        this.LejosODEje = faker.number.int({min: 0, max: 180});
        this.LejosOIEsf = faker.number.float({min: -10, max: 10, precision: 2});
        this.LejosOICil = faker.number.float({min: -10, max: 10, precision: 2});
        this.LejosOIEje = faker.number.int({min: 0, max: 180});
    }

    if (prob >= 33){
        this.CercaODEsf = faker.number.float({min: -10, max: 10, precision: 2});
        this.CercaODCil = faker.number.float({min: -10, max: 10, precision: 2});
        this.CercaODEje = faker.number.int({min: 0, max: 180});
        this.CercaOIEsf = faker.number.float({min: -10, max: 10, precision: 2});
        this.CercaOICil = faker.number.float({min: -10, max: 10, precision: 2});
        this.CercaOIEje = faker.number.int({min: 0, max: 180});
    }

  }
}
