{ fetchurl
, google-chrome
, lib
, makeDesktopItem
, runtimeShell
, symlinkJoin
, writeScriptBin
}:
let
  name = "discord-via-google-chrome";

  meta = {
    description = "Open Discord in Google Chrome app mode";
    longDescription = ''
    Quick Solution to stream with discord. Webcord and the normal discord not working right with nixos, wayland and nvidia.
    Supports Krisp and screen sharing, but no "close and put to system tray"
    '';
    homepage = google-chrome.meta.homepage or null;
    license = lib.licenses.unfree;
    platforms = google-chrome.meta.platforms or lib.platforms.all;
 };

  desktopItem = makeDesktopItem {
    inherit name;
    # Executing by name as opposed to store path is conventional and prevents
    # copies of the desktop file from bitrotting too much.
    # (e.g. a copy in ~/.config/autostart, you lazy lazy bastard ;) )
    exec = name;
    icon = fetchurl {
      name = "free-discord-4054295-3352977.png";
      url = "https://cdn.iconscout.com/icon/free/png-128/free-discord-4054295-3352977.png";
      sha256 = "sha256-S6ViVXLCeydDKlzOe7BbZ5wMBVSAl/XEJK0L2Xk2ink=";
      meta.license = lib.licenses.unfree;
    };
    desktopName = "Discord via Google Chrome";
    categories = [ "InstantMessaging" "Network" ];
    startupNotify = true;
  };

  script = writeScriptBin name ''
    #!${runtimeShell}
    exec ${google-chrome}/bin/${google-chrome.meta.mainProgram} \
        --app=https://discord.com/app \
      --no-first-run --no-default-browser-check --no-crash-upload
  '';

in

symlinkJoin {
  inherit name meta;
  paths = [ script desktopItem ];
}

