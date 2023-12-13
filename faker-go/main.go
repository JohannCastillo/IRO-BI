package main

import (
	"IRO-Group/IRO-Golang/src/database"
	"IRO-Group/IRO-Golang/src/seeders"
	"fmt"

	"github.com/joho/godotenv"
)

func main() {
	envErr := godotenv.Load()
	if envErr != nil {
		fmt.Printf("Error loading credentials: %v", envErr)
	}

	_, err := database.Connect()

	if err != nil {
		fmt.Printf("Error connecting to database: %v", err)
	}

	seeders.Seed()
}
