package utils

import "os"

func LogError(erro error, Query string) {
	os.Create("log.txt")

	f, err := os.OpenFile("log.txt", os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		panic(err)
	}

	defer f.Close()

	if _, err := f.WriteString(erro.Error() + "\n\n" + Query); err != nil {
		panic(err)
	}
}
