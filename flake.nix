{
  description = "Simple python flake with LSP";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs"; # also valid: "nixpkgs"
    flake-utils.url = "github:numtide/flake-utils";
  };


  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {inherit system;};
        buildInputs = with pkgs;[
          python310Packages.python-lsp-server
          python310Packages.python-lsp-ruff
          python310Packages.black
         ]; 
      in
      {
        devShell = pkgs.mkShell { 
          inherit buildInputs;
          NIX_SHELL_PRESERVE_PROMPT=1;
        };
      });

}
