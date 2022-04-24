{ stdenv, nodejs }:
stdenv.mkDerivation {
  name = "nix-hello-world-nodejs";
  src = ./.;
  buildInputs = [
    nodejs
  ];
  installPhase = ''
    install -d $out/bin
    install -m755 main.js $out/bin/nix-hello-world-nodejs
  '';
}
