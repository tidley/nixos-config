{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  pname = "ssvnc";
  version = "1.0.29-6.1";

  src = fetchurl {
    url = "https://deb.debian.org/debian/pool/main/s/ssvnc/ssvnc_${version}_amd64.deb";
    sha256 = "f3d89236045988c9618c2b62e3ae629f9b8cafe193b5f2841e2e56dd169c7ac5";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    libjpeg
    openssl
    zlib
    xorg.libX11
    xorg.libXaw
    xorg.libXext
    xorg.libXmu
    xorg.libXt
    xorg.libXpm
    xorg.libSM
    xorg.libICE
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    dpkg-deb -x "$src" extracted
    mkdir -p "$out"
    cp -r extracted/usr/. "$out/"

    for f in "$out"/bin/{ssvnc,sshvnc,tsvnc} \
             "$out"/lib/ssvnc/{ssvnc,sshvnc,tsvnc,ssvnc_cmd} \
             "$out"/lib/ssvnc/util/{ss_vncviewer,ssvnc.tcl}; do
      sed -i "s|/usr/lib/ssvnc|$out/lib/ssvnc|g" "$f"
    done

    # Replace hard-coded shell paths in application scripts.
    for f in "$out"/lib/ssvnc/{ssvnc,sshvnc,tsvnc,ssvnc_cmd} \
             "$out"/lib/ssvnc/util/{ss_vncviewer,ssvnc.tcl}; do
      sed -i 's|/bin/bash|${bash}/bin/bash|g' "$f"
    done

    patchShebangs "$out"

    runHook postInstall
  '';

  postFixup = ''
    for cmd in ssvnc sshvnc tsvnc; do
      wrapProgram "$out/bin/$cmd" \
        --prefix PATH : "$out/bin:$out/lib/ssvnc:${lib.makeBinPath [
          tk
          tcl
          bash
          coreutils
          gnugrep
          gnused
          findutils
          gawk
          openssh
          bind
          procps
          psmisc
          xterm
          stunnel
          openssl
        ]}"
    done
  '';

  meta = {
    description = "Enhanced TightVNC viewer with SSL and SSH tunnelling";
    platforms = [ "x86_64-linux" ];
    mainProgram = "ssvnc";
  };
}
