{
  description = "Backend for a crypto portfolio tracker web app";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = inputs:
    let
      overlay = final: prev: {
        haskell = prev.haskell // {
          packageOverrides = hfinal: hprev:
            prev.haskell.packageOverrides hfinal hprev // {
              crypto-portfolio-tracker-backend = hfinal.callCabal2nix "crypto-portfolio-tracker-backend" ./. { };
            };
        };
        crypto-portfolio-tracker-backend = final.haskell.lib.compose.justStaticExecutables final.haskellPackages.crypto-portfolio-tracker-backend;
      };
      perSystem = system:
        let
          pkgs = import inputs.nixpkgs { inherit system; overlays = [ overlay ]; };
          hspkgs = pkgs.haskellPackages;
        in
        {
          devShell = hspkgs.shellFor {
            withHoogle = true;
            packages = p: [ p.crypto-portfolio-tracker-backend ];
            buildInputs = [
              hspkgs.zlib
              hspkgs.cabal-install
              hspkgs.haskell-language-server
              hspkgs.hlint
              hspkgs.ormolu
              pkgs.bashInteractive
            ];
          };
          defaultPackage = pkgs.crypto-portfolio-tracker-backend;
        };
    in
    { inherit overlay; } // 
      inputs.flake-utils.lib.eachDefaultSystem perSystem;
}
