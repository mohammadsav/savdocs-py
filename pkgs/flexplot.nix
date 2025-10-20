{ fetchFromGitHub, rPackages }:

rPackages.buildRPackage {
  # NOTE: rPackages.buildRPackage expects `name` (not pname/version) in many nixpkgs revs.
  name = "flexplot";

  src = fetchFromGitHub {
    owner = "dustinfife";
    repo  = "flexplot";
    rev   = "9a39de871d48364dd5f096b2380a4c9907adf4c3";
    sha256 = "1wfn5j94z7s34jylzilywrp550w3abr8fyi1wr9knzyz2xp71zn9";
  };

  propagatedBuildInputs = with rPackages; [
    cowplot MASS tibble withr dplyr magrittr forcats purrr plyr R6
    ggplot2 patchwork ggsci lme4 party
  ];

  # Optional toggles that sometimes help with CRAN-style tests or long builds:
  # doCheck = false;
}
