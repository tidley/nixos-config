{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld.enable = true;

  users.users.tom.extraGroups = [
    "dialout"
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    git
    gh
    git-filter-repo
    vscode
    gcc
    clang
    gnumake
    cmake
    ninja
    pkg-config
    nodejs
    pnpm
    typescript
    go
    rustup
    python3
    jdk
    protobuf
    openssl
    curl
    wget
    ripgrep
    jq
    shfmt
    strace
    picocom
    scrcpy
    openssh
    sshfs
    nmap
    tcpdump
    ethtool
    usbutils
    pciutils
    vulkan-tools
  ];
}
