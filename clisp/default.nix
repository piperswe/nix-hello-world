{ stdenv, sbcl }:
stdenv.mkDerivation {
  name = "nix-hello-world-clisp";
  src = ./.;
  nativeBuildInputs = [
    sbcl
  ];
  buildPhase = ''
    sbcl --eval '(compile-file "main.lisp")'
    mv main.fasl nix-hello-world-clisp
  '';
  doCheck = true;
  checkPhase = ''
    ./nix-hello-world-clisp
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-clisp $out/bin/
  '';
}
