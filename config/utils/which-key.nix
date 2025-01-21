{
  lib,
  config,
  ...
}: {
  options = {
    which-key.enable = lib.mkEnableOption "Enable which-key module";
  };
  config = lib.mkIf config.which-key.enable {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
        };
        spec = [
          # Harpoon Configs
          {
            __unkeyed-1 = "<leader>h";
            mode = "n";
            group = "+harpoon";
            icon = "󱡁";
          }
          {
            __unkeyed-1 = "<leader>ha";
            mode = "n";
            group = "Add file to Harpoon";
          }
          {
            __unkeyed-1 = "<leader>hj";
            mode = "n";
            group = "Harpoon File 1";
          }
          {
            __unkeyed-1 = "<leader>hk";
            mode = "n";
            group = "Harpoon File 2";
          }
          {
            __unkeyed-1 = "<leader>hl";
            mode = "n";
            group = "Harpoon File 3";
          }
          {
            __unkeyed-1 = "<leader>hm";
            mode = "n";
            group = "Harpoon File 4";
          }

          # General Mappings
          {
            __unkeyed-1 = "<leader>c";
            mode = [
              "n"
              "v"
            ];
            group = "+code";
          }
          {
            __unkeyed-1 = "<leader>d";
            mode = [
              "n"
              "v"
            ];
            group = "+debug";
          }
          {
            __unkeyed-1 = "<leader>f";
            mode = "n";
            group = "+find/file";
          }

          {
            __unkeyed-1 = "<leader>g";
            mode = [
              "n"
              "v"
            ];
            group = "+git";
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
            __unkeyed-1 = "<leader>t";
            mode = "n";
            group = "+test";
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

          # ChatGPT Mappings
          {
            __unkeyed-1 = "<leader>cc";
            mode = "n";
            command = "<cmd>ChatGPT<CR>";
            group = "ChatGPT";
            description = "ChatGPT";
          }
          {
            __unkeyed-1 = "<leader>ce";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTEditWithInstruction<CR>";
            group = "ChatGPT";
            description = "Edit with instruction";
          }
          {
            __unkeyed-1 = "<leader>cg";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun grammar_correction<CR>";
            group = "ChatGPT";
            description = "Grammar Correction";
          }
          {
            __unkeyed-1 = "<leader>ct";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun translate<CR>";
            group = "ChatGPT";
            description = "Translate";
          }
          {
            __unkeyed-1 = "<leader>ck";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun keywords<CR>";
            group = "ChatGPT";
            description = "Keywords";
          }
          {
            __unkeyed-1 = "<leader>cd";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun docstring<CR>";
            group = "ChatGPT";
            description = "Docstring";
          }
          {
            __unkeyed-1 = "<leader>ca";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun add_tests<CR>";
            group = "ChatGPT";
            description = "Add Tests";
          }
          {
            __unkeyed-1 = "<leader>co";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun optimize_code<CR>";
            group = "ChatGPT";
            description = "Optimize Code";
          }
          {
            __unkeyed-1 = "<leader>cs";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun summarize<CR>";
            group = "ChatGPT";
            description = "Summarize";
          }
          {
            __unkeyed-1 = "<leader>cf";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun fix_bugs<CR>";
            group = "ChatGPT";
            description = "Fix Bugs";
          }
          {
            __unkeyed-1 = "<leader>cx";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun explain_code<CR>";
            group = "ChatGPT";
            description = "Explain Code";
          }
          {
            __unkeyed-1 = "<leader>cr";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun roxygen_edit<CR>";
            group = "ChatGPT";
            description = "Roxygen Edit";
          }
          {
            __unkeyed-1 = "<leader>cl";
            mode = [
              "n"
              "v"
            ];
            command = "<cmd>ChatGPTRun code_readability_analysis<CR>";
            group = "ChatGPT";
            description = "Code Readability Analysis";
          }
        ];
        win = {
          border = "none";
          wo.winblend = 0;
        };
      };
    };
  };
}

