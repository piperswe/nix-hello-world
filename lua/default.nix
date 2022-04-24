{ stdenv, lua }:
stdenv.mkDerivation {
  name = "nix-hello-world-lua";
  src = ./.;
  buildInputs = [
    lua
  ];
  doCheck = true;
  checkPhase = ''
    [ "$(./main.lua)" = "Hello, world!" ]
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 main.lua $out/bin/nix-hello-world-lua
  '';
}
