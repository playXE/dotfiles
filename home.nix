{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aprokurov";
  home.homeDirectory = "/home/aprokurov";
  nixpkgs.config = {allowUnfree = true; };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };
  home.packages = [
     pkgs.htop pkgs.rustup pkgs.clang pkgs.llvm pkgs.cider pkgs.racket
  ];

  programs.git = {
    enable = true;
    userName = "Adel Prokurov";
    userEmail = "adel.prokurov@gmail.com";
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions =
      with pkgs.vscode-extensions; [
        matklad.rust-analyzer
        ms-python.python
        ms-vscode.cpptools
        #ms-vscode-remote.remote-ssh # won't work with vscodium
      ];
  };
}
