{ stdenv, swift }:
stdenv.mkDerivation {
  name = "nix-hello-world-swift";
  src = ./.;
  nativeBuildInputs = [
    swift
  ];
  buildPhase = ''
    swiftc -o nix-hello-world-swift main.swift
  '';
  doCheck = true;
  checkPhase = ''
    [ "$(./nix-hello-world-swift)" = "Hello, world!" ]
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-swift $out/bin/
  '';
}
