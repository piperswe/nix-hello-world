{ stdenv }:
stdenv.mkDerivation {
  name = "nix-hello-world-c";
  src = ./.;
  buildPhase = ''
    $CC -O2 -o nix-hello-world-c main.c
  '';
  doCheck = true;
  checkPhase = ''
    [ "$(./nix-hello-world-c)" = "Hello, world!" ]
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-c $out/bin/
  '';
}
