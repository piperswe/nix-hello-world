{ stdenv }:
stdenv.mkDerivation {
  name = "nix-hello-world-shell";
  src = ./.;
  installPhase = ''
    install -d $out/bin
    install -m755 main.sh $out/bin/nix-hello-world-shell
  '';
}
