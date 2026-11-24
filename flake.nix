{
  description = "NixOS workstation configuration";

  inputs = {
    herdr.url = "github:herdrdev/herdr/v0.9.1";
    nix-flatpak.url = "github:gmodena/nix-flatpak/v0.6.0";
    nixpkgs.url = "github:NixOS/nixpkgs/0dc498bfe49baeb18b0f9891e800b53bb2603193";

    ngit.url = "git+https://ngit.dev/ngit.git?ref=stable&rev=2a19ffadb6320cea4f34c6a240c551219642fcb7";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, herdr, nixpkgs, ngit, home-manager, nix-flatpak, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak

        {
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.nixPath = [ "nixpkgs=${nixpkgs}" ];

          environment.systemPackages = [
            ngit.packages.x86_64-linux.default
            herdr.packages.x86_64-linux.default
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hm-backup";
            users.tom = import ./home;
          };
        }
      ];
    };
  };
}
