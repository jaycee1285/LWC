{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # dirHashes = {
    #   docs = "~/Documents"
    #   ...
    # }

    shellAliases = {

      # Nix specific
      nix-update = "sudo cp -r /etc/nixos ~/dotfiles && sudo nixos-rebuild switch";
      nix-config = "sudo -E hx /etc/nixos";
      
      # Thesis specific
      thesis = "cd ~/Projects/thesis && source venv/bin/activate";
      thesis-tex = "cd ~/Documents/tex/thesis";

      # Aliases for color options
      ls = "ls -G";
      ll = "ls -l";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      # Misc
      # .. = "cd ..";
      cp = "cp -i";
      rm = "rm -i";
    };


    plugins = [
      {
                name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];    
  };

}
