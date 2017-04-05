all: build

build:
	@docker build -t mrl045/fusiondirectory-openldap:latest .

release: build
	@docker build -t mrl045/fusiondirectory-openldap:$(shell cat VERSION) .

.PHONY: test
test:
	@docker build -t mrl045/fusiondirectory-openldap:bats .
	bats test
