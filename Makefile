
DOCKER_TAG=docker-demo
DOCKER_IMAGE=svg153/$(DOCKER_TAG)
PORT=8088

DOCKER_CMD=docker run --rm -ti \
				-v $(shell pwd)/deck.mdx:/home/node/mdx-deck/deck.mdx:cached \
				-v $(shell pwd)/components:/home/node/mdx-deck/components:cached \
				-v $(shell pwd)/images:/home/node/mdx-deck/images:cached \
				-v $(shell pwd)/samples:/home/node/mdx-deck/samples:cached \
				-p ${PORT}:8080 \
				$(DOCKER_IMAGE)

default: build start

build:
	docker build --build-arg MDX_DECK_VERSION=2.4.0 -t $(DOCKER_IMAGE) .

console:
	$(DOCKER_CMD) /bin/bash

bash:
	docker exec -it $(DOCKER_IMAGE) bash

start:
	$(DOCKER_CMD) npm start
