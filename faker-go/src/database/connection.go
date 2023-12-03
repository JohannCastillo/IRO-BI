package database

import (
	"database/sql"
	"fmt"
	"os"

	"github.com/microsoft/go-mssqldb/azuread"
)

type DatabaseConnection struct {
	SqlDb *sql.DB
}

var dbConn DatabaseConnection

func Connect() (DatabaseConnection, error) {

	var server = os.Getenv("SERVER")
	var port = os.Getenv("PORT")
	var database = os.Getenv("DATABASE")
	var user = os.Getenv("USER")
	var password = os.Getenv("PASSWORD")

	connString := fmt.Sprintf("server=%s;user id=%s;password=%s;port=%s;database=%s", server, user, password, port, database)
	var err error

	dbConn = DatabaseConnection{}

	dbConn.SqlDb, err = sql.Open(azuread.DriverName, connString)

	if err != nil {
		return DatabaseConnection{}, err
	}

	fmt.Println("Connected!")
	return dbConn, nil
}

func GetConnection() DatabaseConnection {
	return dbConn
}
