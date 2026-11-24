{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  pname = "mender-artifact";
  version = "3.9.0+ds1-2+b5";

  src = fetchurl {
    url = "https://deb.debian.org/debian/pool/main/g/golang-github-mendersoftware-mender-artifact/mender-artifact_${version}_amd64.deb";
    sha256 = "07933cc16eb1599f39806ea93c2d99f00c0c8b3c895987a347a5c56c58195382";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    openssl
    xz
    stdenv.cc.cc.lib
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    dpkg-deb -x "$src" extracted
    mkdir -p "$out"
    cp -r extracted/usr/. "$out/"
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram "$out/bin/mender-artifact" \
      --prefix PATH : "${lib.makeBinPath [
        dosfstools
        e2fsprogs
        parted
        mtools
        coreutils
      ]}"
  '';

  meta = {
    description = "Mender OTA artifact generation utility";
    platforms = [ "x86_64-linux" ];
    mainProgram = "mender-artifact";
  };
}
