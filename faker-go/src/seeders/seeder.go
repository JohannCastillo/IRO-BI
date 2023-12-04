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

	NDoctores := flag.Int("d", 0, "Cantidad de doctores a crear")
	SeedDefault := flag.Bool("def", false, "Crear antecedentes")
	NPacientes := flag.Int("p", 0, "Cantidad de pacientes a crear")
	NAtenciones := flag.Int("at", 0, "Crear Atencion")

	flag.Parse()

	var wg sync.WaitGroup
	pool, err := pb.StartPool()
	if err != nil {
		panic(err)
	}

	fmt.Println("Iniciando ...")
	err = database.InitDataDefault()

	fmt.Println("Listo para iniciar ...")

	if *SeedDefault || err != nil {
		antecedentesBar := utils.NewPB("Creando antecedentes ...", len(defaultValues))
		pool.Add(antecedentesBar)
		seedDefault(antecedentesBar)
		database.InitDataDefault()
	}

	if *NPacientes > 0 {
		wg.Add(1)
		pacienteBar := utils.NewPB("Creando pacientes ...", *NPacientes)
		pool.Add(pacienteBar)
		go PacienteSeeder(*NPacientes, &wg, pacienteBar)
	}
	// else if *PacientesWithAntecedes {
	// 	database.GetNumPacientes()
	// 	database.GetNumAntecedentes()

	// 	wg.Add(1)
	// 	pacienteAntecedenteBar := utils.NewPB("Creando antecedentes ...", database.GetDataDefault().MaxIdPaciente-database.GetDataDefault().MinIdPaciente+1)
	// 	pool.Add(pacienteAntecedenteBar)
	// 	go PacienteAntecedenteSeeder(&wg, pacienteAntecedenteBar)
	// }

	if *NDoctores > 0 {
		wg.Add(1)
		doctorBar := utils.NewPB("Creando doctores ...", *NDoctores)
		pool.Add(doctorBar)
		go DoctorSeeder(*NDoctores, &wg, doctorBar)
	}

	wg.Wait()

	if *NAtenciones > 0 {
		wg.Add(1)
		atencionBar := utils.NewPB("Creando atenciones ...", *NAtenciones)
		pool.Add(atencionBar)
		go AtencionSeeder(*NAtenciones, &wg, atencionBar)
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
			bar.Set("prefix", utils.GetPrefix("Error al crear datos :o"))
			fmt.Println(err)
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

func seedDefault(bar *pb.ProgressBar) {

	data := database.GetDataDefault()

	if data.MaxIdDistrito != 0 {
		bar.Add(len(defaultValues))
		bar.Finish()
		bar.Set("prefix", utils.GetPrefix("Datos Básicos ya creados!"))
		return
	}

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
	bar.Finish()
	bar.Set("prefix", utils.GetPrefix("Datos Básicos creados!"))
}
