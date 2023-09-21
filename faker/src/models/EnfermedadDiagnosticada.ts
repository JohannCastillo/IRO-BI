export class ContactoEmergencia {
    IdPaciente?: number
    idEnfermedad?: number
    IdDoctor?: number
    FechaDiagnostico: string
    IdAtencion: number

    constructor(IdPaciente: number, idEnfermedad: number, IdDoctor: number, IdAtencion: number) {
        this.IdPaciente = IdPaciente
        this.idEnfermedad = idEnfermedad;
        this.IdDoctor = IdDoctor;
        this.IdAtencion = IdAtencion;
        this.FechaDiagnostico = new Date().toISOString();
    }
}