{ pkgs, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # AI development
    claude-code
    codex
    opencode

    # Cloud and synchronisation
    megasync

    # Bitcoin and Nostr
    bisq2
    sparrow
    wasabiwallet
    gossip

    # Multimedia and utilities
    pychess
    stockfish
  ];
}
