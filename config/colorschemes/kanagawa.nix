{
  colorschemes = {
    kanagawa = {
      enable = true;

      settings = {
        compile = false;             # enable compiling the colorscheme
        undercurl = true;            # enable undercurls
        commentStyle = { italic = true; };
        functionStyle = {};
        keywordStyle = { italic = true; };
        statementStyle = { bold = true; };
        typeStyle = {};
        transparent = false;         # do not set background color
        dimInactive = false;         # dim inactive window
        terminalColors = true;       # define vim.g.terminal_color_{0,17}

        colors = {
          theme = {
            wave = {
              ui = {
                float = {
                  bg = "none";
                };
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

        background = {
          dark = "dragon";           # Set the dark theme to "wave"
          light = "lotus";           # Set the light theme to "lotus"
        };
      };
    };
  };
}
