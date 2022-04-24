{ stdenv, rustc, libiconv }:
stdenv.mkDerivation {
  name = "nix-hello-world-rust";
  src = ./.;
  buildInputs = [
    libiconv
  ];
  nativeBuildInputs = [
    rustc
  ];
  buildPhase = ''
    rustc -O -o nix-hello-world-rust main.rs
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-rust $out/bin/
  '';
}
