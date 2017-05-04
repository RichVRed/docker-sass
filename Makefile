.PHONY: default build build_latest push debug run microbadge_hook bin release
TAG = rvannauker/sass
VERSION = 1.0.0
FILE_NAME = sass.dockerfile
DESTINATION = $$PWD
DEBUG_COMMAND = /bin/bash
MICROBADGE_HOOK_URL = https://hooks.microbadger.com/images/rvannauker/sass/ThW9uuJa4VzGlF__-A-Jl5sfHt8=
HOME_BIN = ${HOME}/bin

default: build

build:
	docker build \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="$(VERSION)" \
	       --force-rm \
	       --tag "$(TAG):$(VERSION)" \
	       --file "$(FILE_NAME)" \
	       $$PWD

build_latest:
	docker build \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="latest" \
	       --force-rm \
	       --tag "$(TAG):latest" \
	       --file "$(FILE_NAME)" \
	       $$PWD

push:
	docker push $(TAG)

debug:
	docker run \
	       --rm \
	       --interactive \
	       "$(TAG)$(VERSION)" $(DEBUG_COMMAND)

run:
	@docker run \
	       --rm \
           --volume $$PWD:/workspace \
           --name "sass" \
           "$(TAG):$(VERSION)" \
           --colors=1 \
           --standard=PSR2 \
           -v \
           "$(DESTINATION)"

microbadge_hook:
	curl -X POST $(MICROBADGE_HOOK_URL)

bin:
	if [ -f "${HOME_BIN}/sass" ]; then rm -f "${HOME_BIN}/sass"; fi
	echo '#!/usr/bin/env bash' > "${HOME_BIN}/sass"
	echo '/usr/bin/docker run --rm --volume $$(pwd):/src --name="sass" "rvannauker/sass"' > "${HOME_BIN}/sass"
	chmod 100 "${HOME_BIN}/sass"

release: build build_latest push bin microbadge_hook
