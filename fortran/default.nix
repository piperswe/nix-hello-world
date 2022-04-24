{ stdenv, gfortran }:
stdenv.mkDerivation {
  name = "nix-hello-world-fortran";
  src = ./.;
  nativeBuildInputs = [
    gfortran
  ];
  buildPhase = ''
    gfortran -O2 -o nix-hello-world-fortran main.f90
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-fortran $out/bin/
  '';
}
