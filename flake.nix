{
  description = "NixOS workstation configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/0dc498bfe49baeb18b0f9891e800b53bb2603193";

    ngit.url = "git+https://ngit.dev/ngit.git?ref=stable&rev=2a19ffadb6320cea4f34c6a240c551219642fcb7";
  };

  outputs = { self, nixpkgs, ngit, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.nixPath = [ "nixpkgs=${nixpkgs}" ];

          environment.systemPackages = [
            ngit.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
