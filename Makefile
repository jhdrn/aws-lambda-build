SHELL := /bin/bash
.DEFAULT_GOAL := image

image:
	docker build -t stechstudio/aws-lambda-build:latest .

container: image
	docker run --interactive --tty -v ${PWD}:/export -e "TERM=xterm-256color" stechstudio/aws-lambda-build:latest

push-dev: image
	docker tag stechstudio/aws-lambda-build:latest stechstudio/gitpod-lambda:latest-dev
	docker tag stechstudio/aws-lambda-build:latest stechstudio/gitpod-lambda:v0.0.1-alpha
	docker push stechstudio/gitpod-lambda:latest-dev
	docker push stechstudio/gitpod-lambda:v0.0.1-alpha

push: image
	docker push stechstudio/gitpod-lambda:latest