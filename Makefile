.PHONY: build
build: install build-fleet build-ector

.PHONY: build-fleet
build-fleet: openapi
	@./scripts/build.sh cmd/fleet/fleet.go ./main

.PHONY: build-ector
build-ector: openapi
	@./scripts/build.sh cmd/ector/ector.go ./ector

.PHONY: openapi
openapi: install
	@./scripts/openapi.sh fleet
	@./scripts/openapi.sh ector

.PHONY: install
install: download
	@./scripts/install.sh

.PHONY: download
download:
	@echo "Download go.mod dependencies"
	@go mod download