
import { 
    DepartamentoModel, 
    ProvinciaModel, 
    DistritoModel,
    TipoPacienteModel,
    TipoAntecedenteModel,
    ServicioModel,
    EnfermedadesModel
} from '../../src/models/Defaults';
import { getDataFromCSV } from '../../src/helpers/cvs';
import { PrismaClient } from '@prisma/client';
import {  MultiBar} from "cli-progress";

// import { save } from '../../src/helpers/database';

const prisma = new PrismaClient();



export class DefaultDataSeeder {
    private multibar = new MultiBar({
        format: ' {filename} | {bar} | {percentage}% | {value}/{total} ',
        barCompleteChar: '\u2588',
        barIncompleteChar: '\u2591',
        hideCursor: true,
    });

    async seed() {
        await this.Departamentos()
        await this.Provincias()
        await this.Distritos()
        await this.TipoPaciente()
        await this.TipoAntecedente()
        await this.Enfermedades()
        await this.DatosBasicos()

        
    }


    async Departamentos() {
        try {
            const datosDepartamentos = await getDataFromCSV<DepartamentoModel>('./data/default/Departamentos.csv');
            const bar = this.multibar.create(datosDepartamentos.length, 0);
            bar.start(datosDepartamentos.length, 0);
            bar.update(0, { filename: 'Departamentos' });
            await datosDepartamentos.forEach(async (departamentos, index) => {
                await prisma.dEPARTAMENTO.createMany({
                    data: departamentos.map((departamento) => {
                        return {
                            Departamento: departamento.Departamento
                        }
                    })
                });
                bar.increment();
                if (index === datosDepartamentos.length - 1) {
                    bar.stop();
                }
            });
            
        } catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
        }
    }

    async Provincias() {
        try {
            const datosProvincias = await getDataFromCSV<ProvinciaModel>('./data/default/Provincias.csv');
            const bar = this.multibar.create(datosProvincias.length, 0);
            bar.start(datosProvincias.length, 0);
            bar.update(0, { filename: 'Provincias' });
            await datosProvincias.forEach(async (provincias, index) => {
                await prisma.pROVINCIA.createMany({
                    data: provincias.map((provincia) => {
                        return {
                            Provincia: provincia.Provincia,
                            IdDepartamento: Number(provincia.IdDepartamento)
                        }
                    })
                });
                bar.increment();

                if (index === datosProvincias.length - 1) {
                    bar.stop();
                }
            });
            

        } catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async Distritos() {
        
        try {
            const datosDistritos = await getDataFromCSV<DistritoModel>('./data/default/Distritos.csv');
            const bar = this.multibar.create(datosDistritos.length, 0);
            bar.start(datosDistritos.length, 0);
            bar.update(0, { filename: 'Distritos' });
            await datosDistritos.forEach(async (distritos, index) => {
                await prisma.dISTRITO.createMany({
                    data: distritos.map((distrito) => {
                        return {
                            Distrito: distrito.Distrito,
                            IdProvincia: Number(distrito.IdProvincia)
                        }
                    })
                });
                bar.increment();
                if (index === datosDistritos.length - 1) {
                    bar.stop();
                }
            });


        } catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async TipoPaciente() {
        
        try {
            const datosTipoPaciente = await getDataFromCSV<TipoPacienteModel>('./data/default/TipoPaciente.csv');
            const bar = this.multibar.create(datosTipoPaciente.length, 0);
            bar.start(datosTipoPaciente.length, 0);
            bar.update(0, { filename: 'TipoPaciente' });
            await datosTipoPaciente.forEach(async (tipoPacientes, index) => {
                await prisma.tIPO_PACIENTE.createMany({
                    data: tipoPacientes.map((tipoPaciente) => {
                        return {
                            TipoPaciente: tipoPaciente.TipoPaciente
                        }
                    })
                });
                bar.increment();
                if (index === datosTipoPaciente.length - 1) {
                    bar.stop();
                }
            });
        }
        catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async TipoAntecedente() {
        
        try {
            const datosTipoAntecedente = await getDataFromCSV<TipoAntecedenteModel>('./data/default/TipoAntecedente.csv');
            const bar = this.multibar.create(datosTipoAntecedente.length, 0);
            bar.start(datosTipoAntecedente.length, 0);
            bar.update(0, { filename: 'TipoAntecedente' });
            await datosTipoAntecedente.forEach(async (tipoAntecedentes, index) => {
                await prisma.tIPO_ANTECEDENTE.createMany({
                    data: tipoAntecedentes.map((tipoAntecedente) => {
                        return {
                            Tipo: tipoAntecedente.Tipo
                        }
                    })
                });
                bar.increment();
                if (index === datosTipoAntecedente.length - 1) {
                    bar.stop();
                }
            });
        }
        catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async Enfermedades() {
        
        try {
            const datosEnfermedades = await getDataFromCSV<EnfermedadesModel>('./data/default/Enfermedades.csv');
            const bar = this.multibar.create(datosEnfermedades.length, 0);
            bar.start(datosEnfermedades.length, 0);
            bar.update(0, { filename: 'Enfermedades' });
            await datosEnfermedades.forEach(async (enfermedades, index) => {
                await prisma.eNFERMEDAD.createMany({
                    data: enfermedades.map((enfermedad) => {
                        return {
                            Nombre: enfermedad.Nombre,
                            Descripcion: enfermedad.Descripcion,
                            Sintomas: enfermedad.Descripcion
                        }
                    })
                });
                bar.increment();
                if (index === datosEnfermedades.length - 1) {
                    bar.stop();
                    // this.multibar.stop();
                }
            });
        }
        catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async Servicios() {
        try {
            const datosServicios = await getDataFromCSV<ServicioModel>('./data/default/Servicios.csv');
            const bar = this.multibar.create(datosServicios.length, 0);
            bar.start(datosServicios.length, 0);
            bar.update(0, { filename: 'Servicios' });
            await datosServicios.forEach(async (servicios, index) => {
                await prisma.sERVICIO.createMany({
                    data: servicios.map((servicio) => {
                        return {
                            Costo: servicio.Costo,
                            Descripcion: servicio.Descripcion,
                            IdTipoServicio: servicio.IdTipoServicio
                        }
                    })
                });
                bar.increment();
                if (index === datosServicios.length - 1) {
                    bar.stop();
                    // this.multibar.stop();
                }
            });
        }
        catch (error) {
            console.error('Error al obtener datos del archivo CSV:', error);
            return
        }
    }

    async DatosBasicos() {
        try{
            const bar = this.multibar.create(6, 0);
            bar.start(6, 0);
            bar.update(0, { filename: 'Enfermedades' });

            await prisma.eSTADO_ATENCION.createMany({
                data: [
                    {
                        Estado: "SIN COMPLICACIONES"
                    },
                    {
                        Estado: "HUBO COMPLICACIONES POST-OPERATORIAS"
                    },
                    {
                        Estado: "HUBO COMPLICACION INTEROPERATORIA"
                    },
                    {
                        Estado: "INCOMPLETO"
                    }
                ]
            })
            bar.increment();
            
            await prisma.tIPO_ATENCION.createMany({
                data: [
                    {
                        TipoAtencion: "EMERGENCIA"
                    },
                    {
                        TipoAtencion: "CONSULTA"
                    },
                    {
                        TipoAtencion: "QUIRURGICO"
                    }
                ]
            })
            bar.increment();


            await prisma.tIPO_SERVICIO.createMany({
                data: [
                    {
                        TipoServicio: "DIAGNOSTICO"
                    },
                    {
                        TipoServicio: "PROCEDIMIENTO ESPECIAL"
                    },
                    {
                        TipoServicio: "CIRUGIA"
                    }
                ]
            });

            bar.increment();
            await prisma.cITA_ESTADO.createMany({
                data: [
                    {
                        Estado: "PENDIENTE"
                    },
                    {
                        Estado: "ATENDIDA"
                    },
                    {
                        Estado: "CANCELADA"
                    },
                    {
                        Estado: "NO ASISTIO"
                    },
                    {
                        Estado: "REPROGRAMADA"
                    }
                ]
            });
            bar.increment();


            await prisma.eSPECIALIDAD.createMany({
                data: [
                    {
                        Especialidad: "GENERAL"
                    },
                    {
                        Especialidad: "RETINA"
                    },
                    {
                        Especialidad: "GLAUCOMA"
                    },
                    {
                        Especialidad: "PEDIATRIA"
                    },
                    {
                        Especialidad: "OCULOPLASTIA"
                    },
                    {
                        Especialidad: "NEUROLOGIA"
                    }
                ]
            });

            bar.increment();

            // INSERT INTO "INSTITUCION_EXTERNA"(Institucion) VALUES ('Hospital Regional Docente de Trujillo'), ('Hospital Belén'), ('Hospital Albrecht'), ('Hospital La Noria'),('Clínicas'), ('Otros');
            await prisma.iNSTITUCION_EXTERNA.createMany({
                data: [
                    {
                        Institucion: "Hospital Regional Docente de Trujillo"
                    },
                    {
                        Institucion: "Hospital Belén"
                    },
                    {
                        Institucion: "Hospital Albrecht"
                    },
                    {
                        Institucion: "Hospital La Noria"
                    },
                    {
                        Institucion: "Clínicas"
                    },
                    {
                        Institucion: "Otros"
                    }
                ]
            });

            bar.increment();
            bar.stop();

        }catch (error) {
            console.error('Error al crear datos basicos:', error);
            return
        }
    }
}