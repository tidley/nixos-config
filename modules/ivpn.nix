{ pkgs, ... }:

{
  services.ivpn.enable = true;

  environment.systemPackages = with pkgs; [
    ivpn
    ivpn-ui
  ];
}
