DOCKER_IMAGE_TAG=joseluisq/drone-rocketchat
DRONE_COMMIT_SHA ?= $(shell git rev-parse HEAD)
LABEL_SCHEMA_BUILD_DATE ?= $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
LABEL_SCHEMA_VCS_REF ?= $(shell git rev-parse --short HEAD)
GOOS=linux
BINARY_VERSION=1.0.0

test:
	@go test -v -timeout 30s -race -coverprofile=coverage.txt -covermode=atomic ./...
.PHONY: test

coverage:
	@bash -c "bash <(curl -s https://codecov.io/bash)"
.PHONY: coverage

fmt:
	@go fmt ./...
.PHONY: fmt

build:
	@env \
		CGO_ENABLED=0 \
		GO111MODULE=on \
		GOOS=$(GOOS) \
			go build -v \
				-ldflags "-s -w -X main.version=$(BINARY_VERSION)" \
				-a -tags netgo \
				-o release/linux/amd64/drone-rocketchat ./cmd
	@du -sh release/linux/amd64/.
.PHONY: build

image-build:
	@docker build \
		--label org.label-schema.build-date=$(LABEL_SCHEMA_BUILD_DATE) \
		--label org.label-schema.vcs-ref=$(LABEL_SCHEMA_VCS_REF) \
		--file docker/Dockerfile.linux.amd64 \
		--tag $(DOCKER_IMAGE_TAG):latest .
.PHONY: image-build
