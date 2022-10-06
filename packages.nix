{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # apps
    neovim
    imv
    mpv
    zathura
    pavucontrol
    alacritty
    firefox-wayland

    # utils
    pfetch
    alsa-utils
    gotop
    wget
    curl
    git
    acpi
    pywal
    grim
    slurp
    wl-clipboard
    bemenu
    mako
    pulseaudio
    unzip

    # wayland packages
    sway
    wayland
    swaylock
    swayidle
    waybar

    # programming
    # rustup
    python3
    nodejs
    gdb
  ];
}
