package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/utils"
	"strconv"
	"sync"

	"github.com/cheggaaa/pb/v3"
)

func CapacitacionSeeder(cantidad int, wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()

	var wg sync.WaitGroup

	dataChan := make(chan SeederStruct, 100)

	wg.Add(1)
	go Save(&wg, dataChan, bar)

	generateCapacitacion(cantidad, dataChan, bar)
	close(dataChan)

	wg.Wait()

	bar.Set("prefix", utils.GetPrefix("Capacitaciones Creadas!"))
}

func generateCapacitacion(cantidad int, dataChan chan<- SeederStruct, bar *pb.ProgressBar) {
	// f := classes.GetFaker()
	database.GetNumDoctores()
	database.GetNumCapacitaciones()
	maxId := database.GetDataDefault().MaxIdCapacitacion + 1

	for i := 0; i < cantidad; i += constants.MaxForCapacitaciones {
		capacitaciones := SeederStruct{}
		capacitaciones.Query = constants.InsertCapacitacion
		finalAsistanceQuery := ""

		asistanceQuery := constants.InsertAsistenciaCapacitacion
		totalAsistance := 0

		remain := cantidad - i
		if remain > constants.MaxForCapacitaciones {
			remain = constants.MaxForCapacitaciones
		}

		for j := 0; j < remain; j++ {
			capacitance := classes.NewCapacitacion(maxId)
			maxId++
			capacitaciones.Query += capacitance.GetQuery()

			// Generating Assistance

			query, total := capacitance.GenerateAsistencia()

			if totalAsistance+total > constants.MaxSaves {
				finalAsistanceQuery += asistanceQuery + ";"

				asistanceQuery = "\n" + constants.InsertAsistenciaCapacitacion
				totalAsistance = 0
			}

			if totalAsistance > 0 {
				asistanceQuery += ",\n"
			}

			asistanceQuery += query
			totalAsistance += total

			if j < remain-1 {
				capacitaciones.Query += ",\n"
			}

		}
		capacitaciones.total = remain

		if totalAsistance > 0 {
			finalAsistanceQuery += asistanceQuery
		}

		capacitaciones.Query += ";\n" + finalAsistanceQuery + ";"
		bar.Set("prefix", utils.GetPrefix(strconv.Itoa(i)+"k Generando capacitaciones..."))

		dataChan <- capacitaciones
	}
	bar.Set("prefix", utils.GetPrefix("✅ Generando capacitaciones..."))

}
