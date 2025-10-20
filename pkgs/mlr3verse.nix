{ fetchFromGitHub, rPackages, mlr3 ? rPackages.mlr3 }:

rPackages.buildRPackage {
  name = "mlr3verse";

  src = fetchFromGitHub {
    owner  = "mlr-org";
    repo   = "mlr3verse";
    rev    = "3476870eec2cbe28e1f14d898ca028d13f4fccf3";
    sha256 = "0hnay70wwi0s3fdnibxr1pmaawxb1fq4jyf57azhnkl8aka052di";
  };

  propagatedBuildInputs =
    [ mlr3 ] ++ (with rPackages; [

      bbotk
      mlr3cluster
      mlr3data
      mlr3filters
      mlr3fselect
      mlr3hyperband
      mlr3inferr
      mlr3learners
      mlr3mbo
      mlr3pipelines
      mlr3tuning
      mlr3tuningspaces
      mlr3viz
    ]);

  # doCheck = false;
}
