{ config, pkgs, lib, ... }:

with lib;

let cfg = config.services.soundcraft;
    systemdService = {
      description = "D-BUS Service";
      serviceConfig = {
        Name = "soundcraft.utils.notepad";
        Exec = "/run/user/1000/tmp.57izHLVciu/bin/soundcraft_dbus_service";
        User = "root";
      };
    };

in {
  options = {
    services.soundcraft = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description =  ''
          Start Soundcraft Notepad D-Bus service.
        '';
      };
      systemd = mkOption {
        default = false;
        type = with types; bool;
        description = ''
          Start systemd service DEBUG!!
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ (import ./default.nix) ];
  };
}
