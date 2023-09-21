import { faker } from '@faker-js/faker/locale/es_MX';
import moment from 'moment';
import { CANTIDAD_INSTITUCIONES_EXTERNAS} from '../constants';

export class Referencia {
    IdReferencia: number | null;
    IdInstitucionExterna: number;
    DoctorExterno: string;
    FechaHoraRegistro: string;
    constructor(idReferencia: number = 0, idInstitucionExterna: number = 0, fechaHoraLlegada: string) {
        this.IdReferencia = idReferencia === 0 ? null : idReferencia;
        this.IdInstitucionExterna = idInstitucionExterna === 0 ? faker.number.int({ min: 1, max: CANTIDAD_INSTITUCIONES_EXTERNAS }) : idInstitucionExterna;
        this.DoctorExterno = faker.person.fullName();
        this.FechaHoraRegistro = this.substractRandomHours(fechaHoraLlegada, 2, 24).toISOString();
    }

    private substractRandomHours(date: string, min: number, max: number) {
        const randomMinutes = faker.number.int({
          min,
          max
        })
        return moment(date).subtract(randomMinutes, 'hours').toDate()
      }
}