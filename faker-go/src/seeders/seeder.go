package seeders

import (
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/utils"
	"flag"
	"fmt"
	"log"
	"os"
	"sync"

	"github.com/cheggaaa/pb/v3"
)

type SeederStruct struct {
	total int
	Query string
}

func Seed() {

	NPacientes := flag.Int("p", 0, "Cantidad de pacientes a crear")
	NDoctores := flag.Int("d", 0, "Cantidad de doctores a crear")
	SeedDefault := flag.Bool("def", false, "Crear antecedentes")

	flag.Parse()

	var wg sync.WaitGroup
	pool, err := pb.StartPool()
	if err != nil {
		panic(err)
	}

	if *SeedDefault {
		antecedentesBar := utils.NewPB("Creando antecedentes ...", len(defaultValues))
		pool.Add(antecedentesBar)
		seedAntecedentes(antecedentesBar)
	}

	if *NPacientes > 0 {

		wg.Add(1)
		pacienteBar := utils.NewPB("Creando pacientes ...", *NPacientes)
		pool.Add(pacienteBar)
		go PacienteSeeder(*NPacientes, &wg, pacienteBar)
	}

	if *NDoctores > 0 {
		wg.Add(1)
		doctorBar := utils.NewPB("Creando doctores ...", *NDoctores)
		pool.Add(doctorBar)
		go DoctorSeeder(*NDoctores, &wg, doctorBar)
	}

	wg.Wait()
	pool.Stop()

}

func Save(wg *sync.WaitGroup, dataChan <-chan SeederStruct, bar *pb.ProgressBar) {
	defer wg.Done()

	conn := database.GetConnection()
	bar.Add(0)
	for data := range dataChan {
		_, err := conn.SqlDb.Exec(data.Query)
		_ = data
		if err != nil {
			// finish the program
			fmt.Printf("Error inserting data: %v", err)
			fmt.Println(data.Query)
			bar.Err()
			bar.Finish()
			return
		}
		bar.Add(data.total)
	}
	bar.Finish()
}

var defaultValues = []string{
	"DEPARTAMENTO",
	"PROVINCIA",
	"DISTRITO",
	"ANTECEDENTES",
	"ENFERMEDADES",
	"DATOS_BASICOS",
}

func seedAntecedentes(bar *pb.ProgressBar) {
	conn := database.GetConnection()

	for _, table := range defaultValues {
		file := fmt.Sprintf("data/%s.sql", table)
		dat, err := os.ReadFile(file)

		if err != nil {
			log.Fatal(err)
		}
		_, err = conn.SqlDb.Exec(string(dat))
		if err != nil {
			log.Fatal(err)
		}

		bar.Add(1)
	}
}
