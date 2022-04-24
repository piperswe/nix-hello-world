{ stdenv, nodejs }:
stdenv.mkDerivation {
  name = "nix-hello-world-nodejs";
  src = ./.;
  buildInputs = [
    nodejs
  ];
  doCheck = true;
  checkPhase = ''
    ./main.js
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 main.js $out/bin/nix-hello-world-nodejs
  '';
}
