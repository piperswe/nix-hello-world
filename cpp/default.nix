{ stdenv }:
stdenv.mkDerivation {
  name = "nix-hello-world-cpp";
  src = ./.;
  buildPhase = ''
    $CXX -O2 -o nix-hello-world-cpp main.cpp
  '';
  doCheck = true;
  checkPhase = ''
    [ "$(./nix-hello-world-cpp)" = "Hello, world!" ]
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-cpp $out/bin/
  '';
}
