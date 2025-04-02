{ config, pkgs, ... }:

{
  home.username = "shinji";
  home.homeDirectory = "/home/shinji";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    rofi
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "shinji";
    userEmail = "uglymon@gmail.com";
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./customfiles/kitty.conf;
  };

#   programs.bash = {
#     enable = true;
#     enableCompletion = true;
#     # TODO add your custom bashrc here
#     bashrcExtra = ''
#       export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
#       eval "$(fnm env --use-on-cd --shell bash)"
#     '';

#     # set some aliases, feel free to add more or remove some
#     shellAliases = {
#       #k = "kubectl";
#     };
#   };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

	initExtra = ''
		eval "$(fnm env --use-on-cd --shell zsh)"
		alias tty-clock-default="tty-clock -s -c -C 4"
	'';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./customfiles/hyprland.conf;
  };

  programs.waybar = {
    enable = true;
    settings = {
        mainBar = builtins.fromJSON(builtins.readFile ./customfiles/waybar_config.json);
    };
    style = builtins.readFile ./customfiles/waybar_style.css;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
