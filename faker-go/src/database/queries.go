package database

import (
	"fmt"
	"log"
)

func GetRandomIdDoctor() int64 {
	var IdDoctor any

	err := dbConn.SqlDb.QueryRow("SELECT TOP 1 idDoctor FROM DOCTOR ORDER BY NEWID()").Scan(&IdDoctor)

	if err != nil {
		log.Fatal(err)
	}

	if IdDoctor != nil {
		return IdDoctor.(int64)
	}

	return 1
}

func GetRandomIdPaciente() int64 {
	var IdPaciente any

	err := dbConn.SqlDb.QueryRow("SELECT TOP 1 idPaciente FROM PACIENTE ORDER BY NEWID()").Scan(&IdPaciente)

	if err != nil {
		log.Fatal(err)
	}

	if IdPaciente != nil {
		return IdPaciente.(int64)
	}

	return 1
}

func GetRandomDoctors(n int) []int64 {
	var IdDoctor any
	var doctors []int64

	rows, err := dbConn.SqlDb.Query(fmt.Sprintf("SELECT TOP %d idDoctor FROM DOCTOR ORDER BY NEWID()", n))

	if err != nil {
		log.Fatal(err)
	}

	for rows.Next() {
		err := rows.Scan(&IdDoctor)
		if err != nil {
			log.Fatal(err)
		}

		doctors = append(doctors, IdDoctor.(int64))
	}

	return doctors
}
