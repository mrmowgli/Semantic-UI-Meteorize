IMAGE_NAME=fomantic-ui-meteorize
FOMANTIC_UI_PACKAGE=dist/fomantic-ui
FOMANTIC_UI_DATA_PACKAGE=dist/fomantic-ui-data

docker-build:
	docker build -t $(IMAGE_NAME) .
.PHONY: docker-build

docker-shell:
	docker run --rm -it -v $(PWD):/app -v ~/.ssh:/home/node/.ssh:ro $(IMAGE_NAME) bash -c ". env.sh; bash"
.PHONY: docker-shell

deps:
	npm install
.PHONY: deps

generate:
	gulp
.PHONY: generate

publish: publish-ui-data publish-ui
.PHONY: publish

publish-ui-data:
	PACKAGE_PATH=$(FOMANTIC_UI_DATA_PACKAGE) ./scripts/publish.sh
.PHONY: publish-ui-data

publish-ui:
	PACKAGE_PATH=$(FOMANTIC_UI_PACKAGE) ./scripts/publish.sh
.PHONY: publish-ui

clean:
	rm -fr tmp dist node_modules
.PHONY: clean
