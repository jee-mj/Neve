{ lib, config, ... }:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        go = [ "golangci-lint" ];
        html = [ "tidy" "htmlhint" ];
        nix = [ "statix" ];
        lua = [ "selene" ];
        python = [ "flake8" ];
        javascript = [ "standardjs" "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescript = [ "ts-standard" "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        json = [ "jsonlint" ];
        java = [ "checkstyle" ];
        haskell = [ "hlint" ];
        bash = [ "shellcheck" ];
        cs = [ "omnisharp" ];
        twig = [ "twig-cs-fixer" ];
        systemd = [ "systemdlint" ];
        php = [ "phpstan" "phpmd" "phpinsights" ];
      };
    };
  };
}
