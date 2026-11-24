{ ... }:

{
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      nixedit = "code ~/nixos-config";
      nixbuild = "sudo nixos-rebuild build";
      nixswitch = "sudo nixos-rebuild switch";
      nixtest = "sudo nixos-rebuild test";
      nixrollback = "sudo nixos-rebuild switch --rollback";
      nixpush = "git -C ~/nixos-config push origin main && git -C ~/nixos-config push github main";
    };

    historySize = 10000;
    historyFileSize = 20000;
  };
}
