package seeders

import (
	"IRO-Group/IRO-Golang/src/classes"
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/utils"
	"sync"
	"time"

	"github.com/cheggaaa/pb/v3"
)

func TestingBarDoctores(cantidad int, wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()

	for i := 0; i < cantidad; i++ {
		bar.Add(1)
		time.Sleep(100 * time.Millisecond)
	}
	bar.Finish()
}

func DoctorSeeder(cantidad int, wgParent *sync.WaitGroup, bar *pb.ProgressBar) {
	defer wgParent.Done()
	var wg sync.WaitGroup

	dataChan := make(chan SeederStruct)

	wg.Add(1)
	go Save(&wg, dataChan, bar)

	generateDoctores(cantidad, dataChan)
	close(dataChan)

	wg.Wait()
	bar.Set("prefix", utils.GetPrefix("Doctores Creados!"))
}

func generateDoctores(cantidad int, dataChan chan<- SeederStruct) {
	for i := 0; i < cantidad; i += constants.MAX_SAVES {
		doctores := SeederStruct{}

		doctores.Query = constants.INSERT_DOCTOR

		remain := cantidad - i

		if remain > constants.MAX_SAVES {
			remain = constants.MAX_SAVES
		}

		for j := 0; j < remain; j++ {
			doctor := classes.NewDoctor()
			doctores.Query += doctor.GetQuery()

			if j < remain-1 {
				doctores.Query += ", "
			}
		}
		doctores.total = remain
		dataChan <- doctores
	}
}
