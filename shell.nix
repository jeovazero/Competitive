let
  npkgs = import (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixos-unstable-2022-04-05";
    url = "https://github.com/nixos/nixpkgs/archive/4dddff0976bc8d3ef077d81bc44f00796b49e395.tar.gz";
    sha256 = "1lqzycykzi31fqmlgrvy26q7j5rwm8crxmyvjglyrii4167acic3";
  }) {};
in
with npkgs.pkgs;
mkShell {
  buildInputs = [gcc haskell.compiler.ghc8107];
}
