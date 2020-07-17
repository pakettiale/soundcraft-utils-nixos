# Soundcraft Utils NixOS
NixOS module and package for lack/soundcraft-utils

## Known Issues
1. Does not install xdg icons
2. Generally hacky

## Testing Locally
1. Clone repo
2. `cd` to your local repo
3. Run `$ nix-build`
4. If successful, run `$ nix-shell`
5. `$ soundcraft_cli --no-dbus -l` should now work, but you can't run gui or
   make any changes.

## Installing
1. Clone repo
2. In your `configuration.nix`:
  * Add `imports = [ /path/to/repo/soundcraft-service.nix ];` 
  * Add `services.soundcraft.enable = true;`
3. `$ sudo nixos-rebuild switch` and cross fingers
4. Do NOT run `soundcraft_dbus_service --setup` it is done in the nix-expression
5. The CLI and GUI tools should now work
