{ pkgs, ... }:

{
  environment.variables.EDITOR = "vim";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ((vim-full.override {}).customize {
      name = "vim";
      vimrcConfig = {
        customRC = builtins.readFile ./customfiles/.vimrc;
      };
    })

    kime
    firefox

    fastfetch
    btop

    networkmanagerapplet
    rofi-wayland
    polkit_gnome
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
    swaynotificationcenter

    hyprland-qtutils
    hyprland-protocols
    hyprland-qt-support
    hyprwayland-scanner
    hyprlock
    hypridle

    wget curl
    fnm

	vscode
	code-cursor
    remmina
    telegram-desktop

	nerd-fonts.d2coding
    nerd-fonts.noto
	nerd-fonts.fira-code
	nerd-fonts.fira-mono
	nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans
    noto-fonts-emoji
    d2coding
    nanum
    nanum-gothic-coding
    fira-code
    jetbrains-mono
    pretendard
  ];
}
