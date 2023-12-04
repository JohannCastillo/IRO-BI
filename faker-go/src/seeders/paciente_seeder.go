package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/utils"
	"sync"
	"time"

	"github.com/cheggaaa/pb/v3"
)

type PacienteSeederStruct struct {
	Pacientes []classes.Paciente
	Query     string
}

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
	for i := 0; i < cantidad; i += constants.MAX_SAVES {
		pacientes := SeederStruct{}
		pacientes.Query = `INSERT INTO PACIENTE (
			NombresYApellidos, 
			FechaDeNacimiento, 
			DNI, 
			Sexo, 
			Celular, 
			Correo, 
			Observaciones, 
			Domicilio,
			TipoSangre, 
			EstadoCivil, 
			IdTipoPaciente, 
			IdDistrito) VALUES `

		remain := cantidad - i

		if remain > constants.MAX_SAVES {
			remain = constants.MAX_SAVES
		}

		for j := 0; j < remain; j++ {
			paciente := classes.NewPaciente()
			// pacientes.Pacientes = append(pacientes.Pacientes, paciente)
			pacientes.Query += paciente.GetQuery()

			if j < remain-1 {
				pacientes.Query += ", "
			}

		}
		pacientes.total = remain
		dataChan <- pacientes
	}
}
