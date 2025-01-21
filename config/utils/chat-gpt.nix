{
  lib,
  config,
  ...
}: {
  options = {
    chatgpt.enable = lib.mkEnableOption "Enable ChatGPT module";
  };
  config = lib.mkIf config.chatgpt.enable {
    plugins.chatgpt = {
      autoLoad = true;
      enable = true;
      settings = {
        answer_sign = "ﮧ";
        chat_layout = {
          position = "50%";
          relative = "editor";
        };
        keymaps = {
          close = [
            "<C-c>"
          ];
          submit = "<C-s>";
        };
        loading_text = "loading";
        max_line_length = 120;
        openai_edit_params = {
          model = "gpt-4o-mini";
          temperature = 0;
        };
        openai_params = {
          frequency_penalty = 0;
          max_tokens = 300;
          model = "chatgpt-4o-latest";
          presence_penalty = 0;
        };
        question_sign = "";
        yank_register = "+";
      };
    };
  };
}

