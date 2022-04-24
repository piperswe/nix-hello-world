{ stdenv, python3 }:
stdenv.mkDerivation {
  name = "nix-hello-world-python";
  src = ./.;
  buildInputs = [
    python3
  ];
  buildPhase = ''
    mv main.py nix-hello-world-python
    python3 -m compileall nix-hello-world-python
  '';
  doCheck = true;
  checkPhase = ''
    ./nix-hello-world-python
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 nix-hello-world-python $out/bin/
    cp -R __pycache__ $out/bin/
  '';
}
