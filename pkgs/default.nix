# Aggregates all your local packages in this folder.
{ pkgs }:
{
  flexplot          = pkgs.callPackage ./flexplot.nix { };
  mlr3              = pkgs.callPackage ./mlr3.nix { };
  mlr3verse         = pkgs.callPackage ./mlr3verse.nix { };
  mlr3extralearners = pkgs.callPackage ./mlr3extralearners.nix { };
  savtools-py = import ./savtools-py.nix { inherit pkgs; };
  # myOtherPkg = pkgs.callPackage ./my-other-pkg.nix { };
}
