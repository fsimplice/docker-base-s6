DIST ?= alpine
ARCH ?= amd64
TAG ?= latest
REPO ?= local/baseimage-s6

build: $(DIST)/$(ARCH)/$(TAG)/Dockerfile
	@echo "Building $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT) using $(DIST)/$(ARCH)/$(TAG)/Dockerfile"
	@docker build $(BUILD_OPTS) $(DIST)/$(ARCH)/$(TAG)/ -f $(DIST)/$(ARCH)/$(TAG)/Dockerfile -t $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT)
	@docker images | grep "$(REPO)"

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u="$(DOCKER_USERNAME)" --password-stdin

logout:
	@docker logout

pull:
	@docker pull $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT)

push:
	@docker push $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT)

save:
	@mkdir -p .images
	@docker save --output .images/$(DIST)_$(TAG)_$(ARCH)$(VARIANT).tar $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT)

tag:
	@docker tag $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT) $(REPO):$(DIST)_$(TAG)_$(ARCH)

run:
	@docker run --name baseimage-s6 $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT) echo "Hello world !!!"

run-shell:
	@docker run -it --rm $(RUN_OPTS) $(REPO):$(DIST)_$(TAG)_$(ARCH)$(VARIANT) /bin/bash

