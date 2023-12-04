package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/utils"
	"sync"

	"github.com/cheggaaa/pb/v3"
)

func AtencionSeeder(cantidad int, wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()
	var wg sync.WaitGroup

	dataChan := make(chan SeederStruct)

	wg.Add(1)
	go Save(&wg, dataChan, bar)

	generateAtencion(cantidad, dataChan)
	close(dataChan)

	wg.Wait()

	bar.Set("prefix", utils.GetPrefix("Pacientes Creados!"))
}

func generateAtencion(cantidad int, dataChan chan<- SeederStruct) {
	f := classes.GetFaker()
	database.GetNumPacientes()
	database.GetNumDoctores()
	database.GetNumCitas()
	data := database.GetDataDefault()
	maxCita := data.MaxIdCita + 1

	for i := 0; i < cantidad; i += constants.MAX_SAVES {
		atenciones := SeederStruct{}
		atencionesQuery := constants.INSERT_ATENCION
		citaQuery := constants.INSERT_CITA

		remain := cantidad - i

		if remain > constants.MAX_SAVES {
			remain = constants.MAX_SAVES
		}

		for j := 0; j < remain; j++ {
			atencion := classes.NewAtencion()

			if j < remain-1 {

				if f.IntBetween(0, 100) <= constants.P_ATENCION_HAS_CITA {
					cita := classes.NewCita(atencion)
					citaQuery += cita.GetQuery() + ", "
					atencion.IdCita = maxCita
					maxCita++
				}

				atencionesQuery += atencion.GetQuery()
				atencionesQuery += ", "

			} else {
				cita := classes.NewCita(atencion)
				citaQuery += cita.GetQuery()
				atencion.IdCita = maxCita
				maxCita++
				atencionesQuery += atencion.GetQuery()
			}
		}
		atenciones.total = remain
		atenciones.Query = citaQuery + ";" + atencionesQuery + ";"
		dataChan <- atenciones
	}
}
