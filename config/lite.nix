{
  lib,
  config,
  pkgs,
  ...
}:
{
  # ===========================================================================
  # lite.nix — minimal Neve for music workstations
  #
  # Lua-only dependency policy: compiled binaries (fd, rg, nerd-fonts) are
  # fine; scripting runtimes (Python, Node, npm, PyPI, etc.) are eradicated.
  # No treesitter, LSP, DAP, formatting, linting, or git integration.
  # ===========================================================================

  # ---- Imports: bare module files only (no directory defaults) ----
  imports = [
    ./sets/set.nix
    ./colorschemes/kanagawa.nix
    ./ui/alpha.nix
    ./telescope/telescope-nvim.nix
    ./utils/plenary.nix
    ./utils/oil.nix
    ./utils/persistence.nix
    ./utils/nvterm.nix
    ./utils/todo-comments.nix
    ./utils/undotree.nix
    ./utils/nvim-autopairs.nix
    ./utils/nvim-surround.nix
    ./utils/better-escape.nix
  ];

  # ---- Enable flags for imported modules ----
  set.enable = true;
  kanagawa.enable = true;
  alpha.enable = true;
  telescope-nvim.enable = true;
  plenary.enable = true;
  oil.enable = true;
  persistence.enable = true;
  nvterm.enable = true;
  todo-comments.enable = true;
  undotree.enable = true;
  nvim-autopairs.enable = true;
  nvim-surround.enable = true;
  better-escape.enable = true;

  # ---- System packages (compiled binaries only, no scripting runtimes) ----
  extraPackages = with pkgs; [
    fd
    ripgrep
    nerd-fonts.symbols-only
  ];

  # ---- Overrides: telescope — drop fzf-native C extension ----
  plugins.telescope.extensions.fzf-native.enable = lib.mkForce false;

  # ---- Overrides: core vim options — drop treesitter / conform deps ----
  opts.foldmethod = lib.mkForce "marker";
  opts.foldexpr = lib.mkForce "";
  opts.formatexpr = lib.mkForce "";

  # ---- mini.nvim (inline config — no treesitter dep) ----
  plugins.mini = {
    enable = true;
    modules = {
      comment = { };
      cursorword = {
        opts = {
          delay = 100;
        };
      };
    };
  };

  # ---- Toggle utility functions (inline; no nvim-notify dep) ----
  extraConfigLua = ''
    function ToggleLineNumber()
      if vim.wo.number then
        vim.wo.number = false
        vim.notify("Line numbers disabled", vim.log.levels.INFO)
      else
        vim.wo.number = true
        vim.wo.relativenumber = false
        vim.notify("Line numbers enabled", vim.log.levels.INFO)
      end
    end

    function ToggleRelativeLineNumber()
      if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        vim.notify("Relative line numbers disabled", vim.log.levels.INFO)
      else
        vim.wo.relativenumber = true
        vim.wo.number = false
        vim.notify("Relative line numbers enabled", vim.log.levels.INFO)
      end
    end

    function ToggleWrap()
      if vim.wo.wrap then
        vim.wo.wrap = false
        vim.notify("Wrap disabled", vim.log.levels.INFO)
      else
        vim.wo.wrap = true
        vim.notify("Wrap enabled", vim.log.levels.INFO)
      end
    end
  '';

  # ---- web-devicons (explicit — silence deprecation from telescope/alpha) ----
  plugins.web-devicons.enable = true;

  # ---- lualine (inline — clean statusline: mode, file, lang, pos, time) ----
  plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;
      theme = "auto";
      componentSeparators = {
        left = "|";
        right = "|";
      };
      sectionSeparators = {
        left = "█";
        right = "█";
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "filename" ];
        lualine_c = [ ];
        lualine_x = [ "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ ''" " .. os.date("%R")'' ];
      };
    };
  };

  # ---- which-key (inline — clean spec, no coding groups) ----
  plugins.which-key = {
    enable = true;
    settings = {
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = "";
      };
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          mode = "n";
          group = "+find/file";
        }
        {
          __unkeyed-1 = "<leader>q";
          mode = "n";
          group = "+quit/session";
        }
        {
          __unkeyed-1 = "<leader>s";
          mode = "n";
          group = "+search";
        }
        {
          __unkeyed-1 = "<leader><Tab>";
          mode = "n";
          group = "+tab";
        }
        {
          __unkeyed-1 = "<leader>u";
          mode = "n";
          group = "+ui";
        }
        {
          __unkeyed-1 = "<leader>w";
          mode = "n";
          group = "+windows";
        }
      ];
      win = {
        border = "none";
        wo.winblend = 0;
      };
    };
  };

  # ---- Keymaps ----
  globals.mapleader = " ";
  keymaps = [
    # ----- Disable arrow keys -----
    {
      mode = [ "n" "i" ];
      key = "<Up>";
      action = "<Nop>";
      options = { silent = true; noremap = true; desc = "Disable Up arrow key"; };
    }
    {
      mode = [ "n" "i" ];
      key = "<Down>";
      action = "<Nop>";
      options = { silent = true; noremap = true; desc = "Disable Down arrow key"; };
    }
    {
      mode = [ "n" "i" ];
      key = "<Right>";
      action = "<Nop>";
      options = { silent = true; noremap = true; desc = "Disable Right arrow key"; };
    }
    {
      mode = [ "n" "i" ];
      key = "<Left>";
      action = "<Nop>";
      options = { silent = true; noremap = true; desc = "Disable Left arrow key"; };
    }

    # ----- Tabs -----
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options = { silent = true; desc = "Last tab"; };
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options = { silent = true; desc = "First Tab"; };
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = { silent = true; desc = "New Tab"; };
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options = { silent = true; desc = "Next Tab"; };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = { silent = true; desc = "Close tab"; };
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options = { silent = true; desc = "Previous Tab"; };
    }

    # ----- Windows -----
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = { silent = true; desc = "Other window"; };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = { silent = true; desc = "Delete window"; };
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = { silent = true; desc = "Split window below"; };
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = { silent = true; desc = "Split window right"; };
    }

    # ----- Save / Quit / Session -----
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = { silent = true; desc = "Save file"; };
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = { silent = true; desc = "Quit all"; };
    }
    {
      mode = "n";
      key = "<leader>qs";
      action = ":lua require('persistence').load()<cr>";
      options = { silent = true; desc = "Restore session"; };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load({ last = true })<cr>";
      options = { silent = true; desc = "Restore last session"; };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>lua require('persistence').stop()<cr>";
      options = { silent = true; desc = "Don't save current session"; };
    }

    # ----- Toggle UI -----
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = { silent = true; desc = "Toggle Line Numbers"; };
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = { silent = true; desc = "Toggle Relative Line Numbers"; };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = { silent = true; desc = "Toggle Line Wrap"; };
    }

    # ----- Visual mode line moving -----
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = { silent = true; desc = "Move highlighted line down"; };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = { silent = true; desc = "Move highlighted line up"; };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = { silent = true; desc = "Unindent, stay in visual mode"; };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = { silent = true; desc = "Indent, stay in visual mode"; };
    }

    # ----- Normal mode join (keep cursor) -----
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = { silent = true; desc = "Join lines, keep cursor position"; };
    }

    # ----- Scrolling (keep cursor centered) -----
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = { silent = true; desc = "Half-page down, centered"; };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = { silent = true; desc = "Half-page up, centered"; };
    }

    # ----- j/k with word-wrap and jumplist -----
    {
      mode = "n";
      key = "j";
      action.__raw = "[[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']]";
      options = { expr = true; desc = "Down (word-wrap aware, jumplist)"; };
    }
    {
      mode = "n";
      key = "k";
      action.__raw = "[[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']]";
      options = { expr = true; desc = "Up (word-wrap aware, jumplist)"; };
    }

    # ----- Search (keep centered) -----
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = { desc = "Next search result, centered"; };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = { desc = "Previous search result, centered"; };
    }

    # ----- Void register operations -----
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options = { desc = "Paste over without yanking deleted text"; };
    }

    # ----- System clipboard -----
    {
      mode = [ "n" "v" ];
      key = "<leader>y";
      action = "\"+y";
      options = { desc = "Copy to system clipboard"; };
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>Y";
      action = "\"+Y";
      options = { desc = "Copy to system clipboard"; };
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>D";
      action = "\"_d";
      options = { desc = "Delete to void register"; };
    }

    # ----- Insert mode Esc -----
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }

    # ----- Clear search highlight on Esc -----
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
  ];
}
