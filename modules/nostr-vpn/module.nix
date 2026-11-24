{ pkgs, ... }:

let
  nvpn = pkgs.callPackage ./package.nix {};
  configFile = "/home/tom/.local/share/nostr-vpn/config.toml";
in
{
  environment.systemPackages = [
    nvpn
    pkgs.iproute2
    pkgs.nftables
    pkgs.wireguard-tools
  ];

  systemd.services.nvpn-egress-guard = {
    wantedBy = [ "multi-user.target" ];
    description = "Nostr VPN saved egress protection";

    after = [ "local-fs.target" ];
    before = [ "network-pre.target" "nvpn.service" ];
    wants = [ "network-pre.target" ];

    unitConfig.DefaultDependencies = false;

    path = with pkgs; [
      iproute2
      nftables
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${nvpn}/bin/nvpn egress-guard --config ${configFile}";
    };
  };

  systemd.services.nvpn = {
    wantedBy = [ "multi-user.target" ];
    description = "Nostr VPN daemon";

    after = [
      "network-online.target"
      "nvpn-egress-guard.service"
    ];

    requires = [ "nvpn-egress-guard.service" ];
    wants = [ "network-online.target" ];

    path = with pkgs; [
      iproute2
      nftables
      iptables
      wireguard-tools
      curl
    ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${nvpn}/bin/nvpn daemon --service --config ${configFile} --iface utun100 --mesh-refresh-interval-secs 60";
      Restart = "always";
      RestartSec = 3;
    };
  };
}
