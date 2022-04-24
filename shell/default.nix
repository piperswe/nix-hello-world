{ stdenv }:
stdenv.mkDerivation {
  name = "nix-hello-world-shell";
  src = ./.;
  doCheck = true;
  checkPhase = ''
    ./main.sh
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 main.sh $out/bin/nix-hello-world-shell
  '';
}
