{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.flake-utils.url = github:numtide/flake-utils;
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem(system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      packages = {
        nix-hello-world-c = pkgs.callPackage ./c {};
        nix-hello-world-clisp = pkgs.callPackage ./clisp {};
        nix-hello-world-cpp = pkgs.callPackage ./cpp {};
        nix-hello-world-fortran = pkgs.callPackage ./fortran {};
        nix-hello-world-haskell = pkgs.callPackage ./haskell {};
        nix-hello-world-lua = pkgs.callPackage ./lua {};
        nix-hello-world-nodejs = pkgs.callPackage ./nodejs {};
        nix-hello-world-ocaml = pkgs.callPackage ./ocaml {};
        nix-hello-world-python = pkgs.callPackage ./python {};
        nix-hello-world-rust = pkgs.callPackage ./rust {};
        nix-hello-world-shell = pkgs.callPackage ./shell {};
        nix-hello-world-swift = pkgs.callPackage ./swift {};
        nix-hello-world-zig = pkgs.callPackage ./zig {};
      };
      apps = {
        c = flake-utils.lib.mkApp { drv = packages.nix-hello-world-c; };
        clisp = flake-utils.lib.mkApp { drv = packages.nix-hello-world-clisp; };
        cpp = flake-utils.lib.mkApp { drv = packages.nix-hello-world-cpp; };
        fortran = flake-utils.lib.mkApp { drv = packages.nix-hello-world-fortran; };
        haskell = flake-utils.lib.mkApp { drv = packages.nix-hello-world-haskell; };
        lua = flake-utils.lib.mkApp { drv = packages.nix-hello-world-lua; };
        nodejs = flake-utils.lib.mkApp { drv = packages.nix-hello-world-nodejs; };
        ocaml = flake-utils.lib.mkApp { drv = packages.nix-hello-world-ocaml; };
        python = flake-utils.lib.mkApp { drv = packages.nix-hello-world-python; };
        rust = flake-utils.lib.mkApp { drv = packages.nix-hello-world-rust; };
        shell = flake-utils.lib.mkApp { drv = packages.nix-hello-world-shell; };
        swift = flake-utils.lib.mkApp { drv = packages.nix-hello-world-swift; };
        zig = flake-utils.lib.mkApp { drv = packages.nix-hello-world-zig; };
      };
      checks = packages;
    }
  );
}
