

run:
	mkdir -p ./work
	nix-build -I ~/src/nixpkgs -I nixos-config=./test/test-rabbit.nix '<nixpkgs/nixos>' -A vm
	NIX_DISK_IMAGE=./work/test-rabbit.qcow2 ./result/bin/run-rabbit-test-vm -full-screen -sdl

clean:
	rm -rf ./work
