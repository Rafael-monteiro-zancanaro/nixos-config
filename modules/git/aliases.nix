{ config, ... }:

{
  programs.git.settings.aliases = {
    cm = "commit";
    sw = "switch";
    s = "status -s";
    poh = "push origin HEAD";
    pl = "pull";
  };
}