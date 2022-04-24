{ stdenv, zig }:
stdenv.mkDerivation {
  name = "nix-hello-world-zig";
  src = ./.;
  nativeBuildInputs = [
    zig
  ];
  buildPhase = ''
    zig build-exe main.zig
    mv main nix-hello-world-zig
  '';
  installPhase = ''
    install -d $out/bin
    install -m755 ./nix-hello-world-zig $out/bin/
  '';
}
