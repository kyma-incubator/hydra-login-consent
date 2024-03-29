APP_NAME=test-hydra-login-consent
APP_IMG=$(DOCKER_PUSH_REPOSITORY)$(DOCKER_PUSH_DIRECTORY)/$(APP_NAME)
TAG=$(DOCKER_TAG)


.PHONY: build-image
build-image:
	docker build -t $(APP_NAME):latest .

.PHONY: push-image
push-image:
	docker tag $(APP_NAME) $(APP_IMG):$(TAG)
	docker push $(APP_IMG):$(TAG)

.PHONY: ci-pr
ci-pr: build-image push-image

.PHONY: ci-main
ci-main: build-image push-image


