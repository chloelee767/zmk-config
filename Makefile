.PHONY: setup update-deps build

docker-setup:
	./start_docker.sh make setup

docker-update-deps:
	./start_docker.sh make update-deps

docker-build:
	./start_docker.sh make build

docker-build-c:
	./start_docker.sh make build-c


setup:
	 ./setup_workspace.sh

update-deps:
	./update_deps.sh

build:
	./build.sh --shield lily58_left --name lily58_left
	./build.sh --shield lily58_right --name lily58_right

build-c:
	./build_from_cache.sh --name lily58_left
	./build_from_cache.sh --name lily58_right
