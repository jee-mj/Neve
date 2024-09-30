{
  colorschemes = {
    kanagawa = {
      enable = true;

        # Option to set the colorscheme on startup
        luaConfig = {
          post = ''
            vim.cmd("colorscheme kanagawa")
          '';
        }

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
          palette = {
            # Define any custom palette colors here
            fujiWhite = "#FFFFFF";
            sumiInk0 = "#000000";
          };
          theme = {
            wave = {
              ui = {
                float = {
                  bg = "none";
                };
              };
            };
            lotus = {};   # empty for now, can add specific settings if needed
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

        overrides = ''function(colors) return {} end''; # Lua function for highlights overrides

        theme = "wave";    # Load "wave" theme by default

        background = {
          dark = "wave";    # Set the dark theme to "wave"
          light = "lotus";  # Set the light theme to "lotus"
        };
      };

    };
  };
}
