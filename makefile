postgres:
	docker run --name z_postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=khaled505 -d postgres:15-alpine

createdb:
	docker exec -it z_postgres createdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migrations -database "postgresql://root:khaled505@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgresql://root:khaled505@localhost:5432/simple_bank?sslmode=disable" -verbose force 1 down

dropdb:
	docker exec -it z_postgres dropdb simple_bank

sqlc:
	sqlc generate

.PHONY: postgres createdb migrateup migratedown dropdb