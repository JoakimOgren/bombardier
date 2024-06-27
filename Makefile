.PHONY: build
build: fmt vet lint test
	mkdir -p ./build
	go build -o ./build ./cmd/...

.PHONY: run
run:
	go run ./cmd/bombardier/main.go

.PHONY:
test: fmt vet lint
	go test ./... -v -coverprofile cover.out

.PHONY: cover
cover: test
	go tool cover -html cover.out

.PHONY: lint
lint:
	golangci-lint run

.PHONY: vet
vet:
	go vet

.PHONY: fmt
fmt:
	go fmt

.PHONY: clean
clean:
	rm -rf ./build ./cover.out

.PHONY: publish-local
publish-local:
	@echo $(shell ./publish.sh)