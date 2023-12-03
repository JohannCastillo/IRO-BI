package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/utils"
	"fmt"
	"sync"

	"github.com/schollz/progressbar/v3"
)

var (
	bar *progressbar.ProgressBar
)

type PacienteSeederStruct struct {
	Pacientes []classes.Paciente
	Query     string
}

func PacienteSeeder() {
	var wg sync.WaitGroup
	bar = utils.GetProgressbar("Creando pacientes ...", constants.NUMBER_OF_PATIENTS)

	dataChan := make(chan PacienteSeederStruct)

	wg.Add(1)
	go savePaciente(&wg, dataChan)

	generatePaciente(dataChan)
	close(dataChan)

	wg.Wait()
	fmt.Println("Pacientes creados!")

}

func savePaciente(wg *sync.WaitGroup, dataChan <-chan PacienteSeederStruct) {
	defer wg.Done()

	conn := database.GetConnection()
	for data := range dataChan {
		_, err := conn.SqlDb.Exec(data.Query)
		_ = data
		if err != nil {
			// finish the program
			fmt.Printf("Error inserting data: %v", err)
			fmt.Println(data.Query)
			return
		}
		bar.Add(len(data.Pacientes))
	}
}

func generatePaciente(dataChan chan<- PacienteSeederStruct) {
	for i := 0; i < constants.NUMBER_OF_PATIENTS/constants.MAX_SAVES; i++ {
		pacientes := PacienteSeederStruct{}
		pacientes.Pacientes = []classes.Paciente{}
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

		for j := 0; j < constants.MAX_SAVES; j++ {
			paciente := classes.NewPaciente(i*constants.MAX_SAVES + j + 1)

			pacientes.Pacientes = append(pacientes.Pacientes, paciente)
			pacientes.Query += paciente.GetQuery()

			if j < constants.MAX_SAVES-1 {
				pacientes.Query += ", "
			}

		}
		dataChan <- pacientes
	}
}
