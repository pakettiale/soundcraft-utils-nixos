with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz) { };
 
python3Packages.buildPythonApplication {
  pname = "soundcraft-utils";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "lack";
    repo = "soundcraft-utils";
    rev = "v0.3.2";
    sha256 = "0fqhwqvf4951gvjvzm1s1dwszmrxm3k0f5abkk6s5glwzvpnyrfi";
  };

  patches = [ ./0001-fix-paths.patch ];

  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
  ];

  dontWrapGapps = true;

  propagatedBuildInputs = with python3Packages; [
    dbus
    libgudev
    gtk3
    pygobject3
    pyusb
    pydbus
    setuptools
    gobjectIntrospection
  ];

  postInstall = ''
  echo "INSTALL HOOK RUNNING"
  echo "Create dbus files"
  mkdir -p share/dbus-1/system.d
  mkdir -p share/dbus-1/system-services
  $out/bin/soundcraft_dbus_service --setup
  cp -r share $out/share
  echo "Substitute correct data"
  pwd $out
  '';

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';
}

