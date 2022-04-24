{ stdenv }:
stdenv.mkDerivation {
  name = "nix-hello-world-c";
  src = ./.;
  buildPhase = ''
    $CC -O2 -o nix-hello-world-c main.c
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-c $out/bin/
  '';
}
