{ stdenv, python3 }:
stdenv.mkDerivation {
  name = "nix-hello-world-python";
  src = ./.;
  buildInputs = [
    python3
  ];
  buildPhase = ''
    python3 -m compileall main.py
    ls -a
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 main.py $out/bin/nix-hello-world-python
    cp -R __pycache__ $out/bin/
  '';
}
