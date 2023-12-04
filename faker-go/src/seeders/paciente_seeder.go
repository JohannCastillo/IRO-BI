package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/utils"
	"sync"
	"time"

	"github.com/cheggaaa/pb/v3"
)

func TestingBarPaciente(cantidad int, wgParent *sync.WaitGroup, bar3 *pb.ProgressBar) {
	defer wgParent.Done()

	for i := 0; i < cantidad; i++ {
		bar3.Add(1)
		time.Sleep(100 * time.Millisecond)
	}
	bar3.Finish()
}

func PacienteSeeder(cantidad int, wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()
	var wg sync.WaitGroup

	dataChan := make(chan SeederStruct)

	wg.Add(1)
	go Save(&wg, dataChan, bar)

	generatePaciente(cantidad, dataChan)
	close(dataChan)

	wg.Wait()

	bar.Set("prefix", utils.GetPrefix("Pacientes Creados!"))

}

func generatePaciente(cantidad int, dataChan chan<- SeederStruct) {
	database.GetNumPacientes()
	data := database.GetDataDefault()
	f := classes.GetFaker()
	for i := 0; i < cantidad; i += constants.MAX_SAVES {
		pacientes := SeederStruct{}
		pacientes.Query = constants.INSERT_PACIENTE

		antecedentesQuery := constants.INSERT_PACIENTE_ANTECEDENTE

		remain := cantidad - i

		if remain > constants.MAX_SAVES {
			remain = constants.MAX_SAVES
		}

		for j := 0; j < remain; j++ {
			paciente := classes.NewPaciente()
			pacientes.Query += paciente.GetQuery()

			if j < remain-1 {
				pacientes.Query += ", "

				if f.IntBetween(0, 100) <= constants.P_PACIENTE_HAS_ANTECEDENTE {
					// 95% de probabilidad de que tenga antecedentes
					antecedente := classes.NewPacienteAntecedente(data.MaxIdPaciente + int64(i+j))
					antecedentesQuery += antecedente.GetQuery() + ", "
				}

			} else {
				antecedente := classes.NewPacienteAntecedente(data.MaxIdPaciente + int64(i+j))
				antecedentesQuery += antecedente.GetQuery()
			}

		}
		pacientes.total = remain
		pacientes.Query += "; " + antecedentesQuery
		dataChan <- pacientes
	}
}

func PacienteAntecedenteSeeder(wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()
	var wg sync.WaitGroup

	dataChan := make(chan SeederStruct)

	wg.Add(1)
	go Save(&wg, dataChan, bar)

	generateAntecedentePaciente(dataChan)
	close(dataChan)

	wg.Wait()

	bar.Set("prefix", utils.GetPrefix("Antecedentes Creados!"))
}

func generateAntecedentePaciente(dataChan chan<- SeederStruct) {
	data := database.GetDataDefault()
	for i := data.MinIdPaciente; i < data.MaxIdPaciente; i += constants.MAX_SAVES {
		antecedentes := SeederStruct{}
		antecedentes.Query = `INSERT INTO PACIENTE_ANTECEDENTE (
			IdAntecedente,
			IdPaciente,
			Detalle,
			FechaRegistro) VALUES `

		remain := data.MaxIdPaciente - i

		if remain > constants.MAX_SAVES {
			remain = constants.MAX_SAVES
		}

		for j := int64(0); j < remain; j++ {
			antecedente := classes.NewPacienteAntecedente(i)
			antecedentes.Query += antecedente.GetQuery()

			if j < remain-1 {
				antecedentes.Query += ", "
			}

		}
		antecedentes.total = int(remain)
		dataChan <- antecedentes
	}
}
