.PHONEY: build

build:
	@bash scripts/build.sh

resolve:
	@bash scripts/deps.sh