{ ... }: {
  # Enable davfs2 for the shared drive
  services.davfs2 = {
    enable = true;
    davGroup = "disk";
    davUser = "alex";
    settings = {
      globalSection = {
        use_locks = true;
      };
    };
  };

  # Configure the mount point-
  systemd.mounts = [{ 
    description = "alex-fileshare@alexsol.is:2078 (davfs2)";

    where = "/home/alex/Shared";
    what = "https://alexsol.is:2078";
    options = "uid=1000,file_mode=0664,dir_mode=2775,grpid";
    type = "davfs";
  }];

  # Mount it automatically
  systemd.automounts = [{
    description = "alex-fileshare@alexsol.is:2078 (davfs2) (automnt)";
    where = "/home/alex/Shared/";
    unitConfig = {
      TimeoutIdleSec=300;
    };
    wantedBy = [ "remote-fs.target" ];
  }];
}
