{ stdenv, ghc }:
stdenv.mkDerivation {
  name = "nix-hello-world-haskell";
  src = ./.;
  nativeBuildInputs = [
    ghc
  ];
  buildPhase = ''
    ghc -O2 -o nix-hello-world-haskell main.hs
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-haskell $out/bin/
  '';
}
