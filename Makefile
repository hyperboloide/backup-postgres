NAME = backup-postgres
DOCKERID = hyperboloide

all: build push

build:
	docker build -t $(DOCKERID)/$(NAME) .

push:
	docker push $(DOCKERID)/$(NAME)
