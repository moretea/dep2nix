# Dep2nix

Package go projects that use dep with ease.

## Usage
1. Create a `Gopkg.toml` file.
2. Run `dep` via nix-shell to generate a `Gopkg.lock` file.
3. Use the build `buildGoDepPackage` function in `dep.nix` in this repository to build your go application!
