{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./wayland-config.nix
      ./packages.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
  '';

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;
  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.allowedUDPPorts = [ 8080 ];

  time.timeZone = "Europe/Prague";

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
  };

  fonts.fonts = with pkgs; [
    cozette
    mononoki
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
  ];

  fonts.fontconfig = {
    allowBitmaps = true;
    useEmbeddedBitmaps = true;
  };

  programs.bash.interactiveShellInit = ''
    (cat ~/.cache/wal/sequences &)
  '';

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
      CPU_SCALING_GOVERNOR_ON_AC="performance";
      CPU_MAX_PERF_ON_AC=100;
      CPU_MAX_PERF_ON_BAT=45;
    };
  };

  security.rtkit.enable = true;

  # false because of pipewire
  sound.enable = false;

  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  system.stateVersion = "22.05";

}

