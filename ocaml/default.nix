{ stdenv, ocaml }:
stdenv.mkDerivation {
  name = "nix-hello-world-ocaml";
  src = ./.;
  nativeBuildInputs = [
    ocaml
  ];
  buildPhase = ''
    ocamlc -o nix-hello-world-ocaml main.ml
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-ocaml $out/bin/
  '';
}
