{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent = {enable = true;};
      ensure_installed = "all";
      highlight = {enable = true;};
    };
    folding = true;
    nixvimInjections = true;
  };
}
