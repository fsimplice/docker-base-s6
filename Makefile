DIST ?= alpine
ARCH ?= amd64
TAG ?= latest


build: $(DIST)/$(ARCH)/$(TAG)/Dockerfile
	@docker build $(BUILD_OPTS) $(DIST)/$(ARCH)/$(TAG)/ -f $(DIST)/$(ARCH)/$(TAG)/Dockerfile -t $(REPO):$(DIST)_$(TAG)$(VARIANT)

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u="$(DOCKER_USERNAME)" --password-stdin

logout:
	@docker logout

pull:
	@docker pull $(REPO):$(DIST)_$(TAG)$(VARIANT)

push:
	@docker push $(REPO):$(DIST)_$(TAG)$(VARIANT)

save:
	@docker save --output .images/$(DIST)_$(TAG)$(VARIANT).tar $(REPO):$(DIST)_$(TAG)$(VARIANT)

tag:
	@docker tag $(REPO):$(DIST)_$(TAG)$(VARIANT) $(REPO):$(DIST)_$(TAG)

