{ lib
, stdenv
, fetchurl
, dpkg
, autoPatchelfHook
, wrapGAppsHook4
, gtk4
, libadwaita
, glib
, cairo
, dbus
, curl
, iproute2
, nftables
, xdg-utils
, zbar
}:

stdenv.mkDerivation rec {
  pname = "nostr-vpn";
  version = "4.1.23";

  src = fetchurl {
    url = "https://github.com/mmalmi/nostr-vpn/releases/download/v${version}/nostr-vpn-v${version}-linux-x64.deb";
    hash = "sha256-ijB3Ap6v9O498LOEf3BnO/2IBh4zjdVDsRF9QbAl6/U=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    wrapGAppsHook4
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    gtk4
    libadwaita
    glib
    cairo
    dbus
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    dpkg-deb -x "$src" extracted

    mkdir -p "$out"
    cp -r extracted/usr/. "$out/"

    find "$out/share" -name '*.desktop' -exec \
      sed -i "s|/usr/bin/nostr-vpn|$out/bin/nostr-vpn|g;
              s|/usr/bin/nvpn|$out/bin/nvpn|g" {} +

    runHook postInstall
  '';

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix PATH : "${lib.makeBinPath [
        curl
        iproute2
        nftables
        xdg-utils
        zbar
      ]}"
    )
  '';

  meta = {
    description = "Nostr VPN desktop client and CLI";
    platforms = [ "x86_64-linux" ];
    mainProgram = "nostr-vpn";
  };
}
