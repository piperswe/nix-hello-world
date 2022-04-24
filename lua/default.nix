{ stdenv, lua }:
stdenv.mkDerivation {
  name = "nix-hello-world-lua";
  src = ./.;
  buildInputs = [
    lua
  ];
  installPhase = ''
    install -d $out/bin
    install -m755 main.lua $out/bin/nix-hello-world-lua
  '';
}
