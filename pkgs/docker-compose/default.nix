{ stdenv, fetchurl, docker, bash }:
stdenv.mkDerivation rec {
   version = "1.8.0";
   name = "docker-compose-${version}";

   src = fetchurl {
     url = "https://github.com/docker/compose/releases/download/${version}/run.sh";
     sha256 = "07saca5f63p0zib1xjxr6c3rvk3ddwafdxppxbzg8zm3c8kif8np";
   };

   unpackPhase = ''
     cp $src ./run.sh
   '';

   patchPhase = ''
     substituteInPlace ./run.sh --replace "exec docker" "exec ${docker}/bin/docker"
     substituteInPlace ./run.sh --replace "/bin/bash" "${bash}/bin/bash"
   '';

   installPhase = ''
     mkdir -p $out/bin/
     cp ./run.sh $out/bin/docker-compose
     chmod +x $out/bin/docker-compose
   '';
}
