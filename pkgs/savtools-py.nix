{ pkgs, ... }:

pkgs.python312Packages.buildPythonPackage {
  pname = "savtools-py";
  version = "0.1.0";

  pyproject = true;
  nativeBuildInputs = [ pkgs.python312Packages.hatchling ];
  propagatedBuildInputs = with pkgs.python312Packages; [
    polars
  ];

  src = pkgs.fetchFromGitHub {
    owner  = "mohammadsav";
    repo   = "savtools-py";
    rev    = "5e54beaf834b66b283b83d65c8d68a872de3c1c6"; # from step 2
    sha256 = "sha256-Mcg4ozzNsIvqMAb9vH1T5eEjsWe8cKYeKYwlMETzju8=";   # from step 2
  };
}
