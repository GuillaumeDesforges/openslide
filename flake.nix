{
  nixConfig.bash-prompt-prefix = "(nix) ";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # configure and make
            autoconf
            automake
            libtool
            pkg-config
            # libs
            zlib
            libpng
            libjpeg
            libtiff
            openjpeg
            gdk-pixbuf
            libxml2
            sqlite
            cairo
            glib
            # clangd LSP
            clang-tools
          ];
        };
      });
}
    
