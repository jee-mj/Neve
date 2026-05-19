{
  lib,
  config,
  ...
}: {
  options = {
    cyberdream.enable = lib.mkEnableOption "Enable cyberdream module";
  };
  config = lib.mkIf config.cyberdream.enable {
    colorschemes = {
      cyberdream = {
        enable = true;
      };
    };
  };
}
