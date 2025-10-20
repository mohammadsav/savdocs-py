{
  description = "Dev shell with R, Python, and a local flexplot package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Load your local package set from ./pkgs
        myPkgs = import ./pkgs { inherit pkgs; };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];

          buildInputs =
            (with pkgs; [
              # --- Core tools / system ---
              R
              vscodium
              positron-bin
              quarto
              texliveFull
              pandoc
              nix-prefetch-git
              cudaPackages.cudatoolkit

              # Local R package from ./pkgs
              myPkgs.flexplot
              myPkgs.mlr3
              myPkgs.mlr3verse
              myPkgs.mlr3extralearners
              myPkgs.savtools-py
            ])
            ++ (with pkgs.rPackages; [
              # --- R: Authoring / Compatability ---
              quarto
              reticulate
              languageserver

              # --- R: Data import & wrangling ---
              tidyverse
              readxl
              jsonlite
              haven

              # --- R: Databases ---
              DBI
              RSQLite
              RMySQL

              # --- R: Modeling & ML ---
              tidymodels
              xgboost
              glmnet
              caret
              lme4
              brms
              tensorflow
              keras
              keras3
              C50

              # --- R: Resampling & utilities ---
              rsample
              groupdata2
              cvms
              caTools

              # --- R: Visualization ---
              ggplot2
              plotly
              patchwork
              GGally
              ggthemes
              ggdark
              DiagrammeR
              DiagrammeRsvg
              rsvg
              rpivotTable
              sjPlot

              # --- R: Explainability ---
              SHAPforxgboost
              pdp

              # --- R: Datasets & misc ---
              nycflights13
              sodium
              styler
              summarytools
            ])
            ++ (with pkgs.python312Packages; [
              # --- Python: Core data stack ---
              numpy
              pandas
              polars
              pyarrow

              # --- Python: Visualization ---
              matplotlib
              seaborn

              # --- Python: ML / DL ---
              scikit-learn
              tensorflow
              keras
              optuna
              xgboost

              # --- Python: Notebook / tooling ---
              ipykernel
              pip
            ]);

          shellHook = ''
            echo "✅ Environment is set up and ready to use."
          '';
        };
      });
}
