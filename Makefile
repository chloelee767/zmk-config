.PHONY: setup update-deps build

docker-setup:
	./start_docker.sh make setup

docker-update-deps:
	./start_docker.sh make update-deps

docker-build:
	./start_docker.sh make build


setup:
	 ./setup_workspace.sh

update-deps:
	./update_deps.sh

build:
	./build.sh --shield lily58_left --name lily58_left
	./build.sh --shield lily58_right --name lily58_right
