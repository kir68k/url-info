{
  description = "Outputs information for a given URL";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem =
        {
          config,
          pkgs,
          self',
          ...
        }:
        {
          packages = {
            url-info = pkgs.clangStdenv.mkDerivation rec {
              name = "url-info";
              src = builtins.path {
                path = ./src;
                name = name;
              };
              outputs = [
                "out"
                "dev"
              ];

              nativeBuildInputs = with pkgs; [
                ada
                boost
                cmakeMinimal
                meson
                ninja
                pkg-config
              ];

              # These have to be here cuz Nix tries to use cmake -.-
              configurePhase = ''
                meson setup build
              '';

              buildPhase = ''
                ninja -C build
              '';

              installPhase = ''
                mkdir -p $out/bin
                cp build/$name $out/bin
              '';

              meta = with pkgs.lib; {
                description = "Outputs information for a given URL";
                homepage = "https://github.com/kir68k/url-info";
                license = with licenses; [ isc ];
                maintainers = [ "Kirin Etheridge" ];
              };
            };
            default = config.packages.url-info;
          };
        };
    };
}
