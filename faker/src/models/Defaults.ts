import { Prisma } from "@prisma/client";

export type DepartamentoModel = {
    IdDepartamento: number;
    Departamento: string;
}

export type ProvinciaModel = {
    IdProvincia: number;
    Provincia: string;
    IdDepartamento: number;
}

export type DistritoModel = {
    IdDistrito: number;
    Distrito: string;
    IdProvincia: number;
}

export type TipoPacienteModel = Prisma.TIPO_PACIENTEGetPayload<{
    select: {
        IdTipoPaciente: true;
        TipoPaciente: true;
    }
}>;

export type TipoAntecedenteModel = Prisma.TIPO_ANTECEDENTEGetPayload<{
    select: {
        IdTipo: true;
        Tipo: true;
    }
}>;

export type EnfermedadesModel = Prisma.ENFERMEDADGetPayload<{
    select: {
        Nombre: true;
        Descripcion: true;
    }
}>;


export type ServicioModel = Prisma.SERVICIOGetPayload<{
    select: 
    {
        Costo: true;
        Descripcion: true;
        IdTipoServicio: true;
    }
}>;