{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "git@alexsol.is";
        name = "Alex Solis";
      };
      credential = {
        credentialStore = "secretservice";
        helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
