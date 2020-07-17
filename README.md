# soundcraft-utils-nixos
NixOS module and package for lack/soundcraft-utils

## Testing locally
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
to your 
  * Add `services.soundcraft.enable = true;`
3. `$ sudo nixos-rebuild switch` and cross fingers
