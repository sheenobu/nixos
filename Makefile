
THOST ?= basic

run:
	mkdir -p ./work
	nix-build -I nixpkgs=/home/${USER}/nixpkgs -I nixos-config=./test/test-$(THOST).nix '<nixpkgs/nixos>' -A vm
	NIX_DISK_IMAGE=./work/test-$(THOST).qcow2 ./result/bin/run-$(THOST)-test-vm

clean:
	rm -rf ./work
