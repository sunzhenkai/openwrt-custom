.PHONEY: build resolve image container clear

build:
	@bash scripts/build.sh

resolve:
	@bash scripts/deps.sh

image:
	@docker build -t zhenkai.sun/lede-builder .

container:
	@bash scripts/create-container.sh

clear:
	@docker stop lede-builder
	@docker rm lede-builder

login:
	@docker exec -it lede-builder sh