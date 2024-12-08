{
  lib,
  config,
  ...
}: {
  options = {
    cyberdream.enable = lib.mkEnableOption "Enable kanagawa module";
  };
  config = lib.mkIf config.cyberdream.enable {
    colorschemes = {
      cyberdream = {
        enable = true;
      };
    };
  };
}
