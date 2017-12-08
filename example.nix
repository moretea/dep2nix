{ pkgs ? (import <nixpkgs> {}) }:
with pkgs;
with (import ./dep.nix { inherit pkgs; });

buildGoDepPackage rec {
  name = "kubernix-dev";
  goPackagePath = "github.com/moretea/kubernix";

  Gopkg_toml = ./Gopkg.toml;
  Gopkg_lock = ./Gopkg.lock;

  subPackages = ["cmd/kubernix"];
  src = builtins.filterSource (path: type:
      (builtins.baseNameOf path != "tests") && 
      (builtins.baseNameOf path != "kubernix-nixpkgs") && 
      (lib.sources.cleanSourceFilter path type)
  ) ./.;

  depsSha256 = "0adm9sd7zw0ld2dv0f5r6da5p439r8ns1abnxn6y0ydb1qrf140f";

  installPhase = ''
    mkdir -p $out
    mkdir -p $bin/bin
    cp go/bin/* $bin/bin
  '';
}
