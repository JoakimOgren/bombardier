.PHONY: build
build:
	mkdir -p ./build
	go build -o ./build ./cmd/...

.PHONY: run
run:
	go run ./cmd/bombardier/main.go

.PHONY: test
test:
	go test ./... -v -coverprofile cover.out

.PHONY: cover
cover: test
	go tool cover -html cover.out