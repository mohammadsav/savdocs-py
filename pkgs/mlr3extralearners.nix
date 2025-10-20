# pkgs/mlr3extralearners.nix
{ fetchFromGitHub, rPackages, mlr3 ? rPackages.mlr3 }:

rPackages.buildRPackage {
  name = "mlr3extralearners";

  src = fetchFromGitHub {
    owner  = "mlr-org";
    repo   = "mlr3extralearners";
    rev    = "d1600a0d16f0e4e54ff1cb2cf6f4d412a1fe99c8"; # or "v1.1.0"
    sha256 = "1gjln5jdn5mqgj8rlpvycp2pxjqf7apw4dadkccrw88xvv9jpwj9";
  };

  propagatedBuildInputs =
    [ mlr3 ] ++ (with rPackages; [
      checkmate
      data_table
      mlr3misc
      paradox
      R6
    ]);

  # doCheck = false;
}
