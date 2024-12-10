{
  lib,
  config,
  ...
}: {
  options = {
    kanagawa.enable = lib.mkEnableOption "Enable kanagawa module";
  };
  config = lib.mkIf config.kanagawa.enable {
    colorschemes = {
      kanagawa = {
        enable = true;

        settings = {
          compile = true; # enable compiling the colorscheme
          undercurl = true; # enable undercurls
          commentStyle = {italic = true;};
          functionStyle = {};
          keywordStyle = {italic = true;};
          statementStyle = {bold = true;};
          typeStyle = {};
          transparent = true; # do not set background color
          dimInactive = false; # dim inactive window
          terminalColors = true; # define vim.g.terminal_color_{0,17}

          colors = {
            palette = {
              sumiInk0 = "#000000";
              fujiWhite = "#FFFFFF";
            };
            theme = {
              wave = {
                ui = {
                  float = {
                    bg = "none";
                  };
                };
              };
              dragon = {
                syn = {
                  parameter = "yellow";
                };
              };
              all = {
                ui = {
                  bg_gutter = "none";
                };
              };
            };
          };

          theme = "dragon";

          # background = {
          #   dark = "dragon";
          #   light = "lotus";
          # };
        };
      };
    };
  };
}
