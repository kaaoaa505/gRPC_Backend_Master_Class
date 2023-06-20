package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)


const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:khaled505@localhost:5432/simple_bank?sslmode=disable"
)

var queries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)

	if err != nil{
		log.Fatal("connot connect to db: ", err)
	}

	queries = New(conn)

	os.Exit(m.Run())
}