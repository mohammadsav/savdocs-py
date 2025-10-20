{ fetchFromGitHub, rPackages }:

rPackages.buildRPackage {
  name = "mlr3";

  src = fetchFromGitHub {
    owner  = "mlr-org";
    repo   = "mlr3";
    rev    = "20c91856cb711e18d8ee542f22505412f4109b25";
    sha256 = "1lcbsafw3wnl5mhkh8hhp10yxxfsxs6nihyzrx9v17d19vi1xprv";
  };

  # Add dependencies manually:
  propagatedBuildInputs = with rPackages; [
      R6
      backports
      checkmate
      cli
      data_table
      evaluate
      future
      future_apply
      lgr
      mlbench
      mlr3measures
      mlr3misc
      parallelly
      palmerpenguins
      paradox
      uuid
    ];

  # doCheck = false;
}
