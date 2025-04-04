{
  lib,
  stdenv,
  fetchurl,
  gmp,
  mpfr,
  mpfi,
  libxml2,
  fplll,
}:

stdenv.mkDerivation rec {
  pname = "sollya";
  version = "8.0";

  src = fetchurl {
    url = "https://www.sollya.org/releases/sollya-${version}/sollya-${version}.tar.gz";
    sha256 = "sha256-WNc0+aL8jmczwR+W0t+aslvvJNccQBIw4p8KEzmoEZI=";
  };

  buildInputs = [
    gmp
    mpfr
    mpfi
    libxml2
    fplll
  ];

  configureFlags = [
    "--with-xml2-config=${lib.getExe' (lib.getDev libxml2) "xml2-config"}"
  ];

  doCheck = true;

  meta = with lib; {
    description = "Tool environment for safe floating-point code development";
    mainProgram = "sollya";
    homepage = "https://www.sollya.org/";
    license = licenses.cecill-c;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wegank ];
  };
}
