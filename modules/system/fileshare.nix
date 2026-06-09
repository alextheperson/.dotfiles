hostname: { ... }: {
  # Enable davfs2 for the shared drive
  services.davfs2 = {
    enable = true;
    davGroup = "disk";
    davUser = "alex";
    settings = {
      globalSection = {
        # Lock the file when it is opened
        use_locks = true;
        # Some servers do the If-Match and If-None-Match wrong. This tells davfs to use an alternative method.
        if_match_bug = true;
        # Will check with the server before uploading, but some servers don't support the protocol.
        use_expect100 = false;
        # Set the lock owner to be unique per machine
        lock_owner = "alex@${hostname}";
        # Something weird I don't really get, but when set to 0, there is some danger of losing updates to files
        drop_weak_etags = true;
        # davfs needs to check for newer versions of files when you open them. This tells it to get info about all files at once.
        # gui_optimize = true;
        # Periodically clean the memory, losing attributes stored locally
        minimize_mem = true;
        # Use gzip compression when downloading from the server
        use_compression = true;
        # Some servers need to be fed
        n_cookies = 5;
      };
    };
  };

  # Configure the mount point-
  systemd.mounts = [{ 
    description = "alexshare@alexsol.is:2078 (davfs2)";

    where = "/home/alex/Shared";
    what = "https://alexsol.is:2078";
    options = "uid=1000,file_mode=0664,dir_mode=2775,grpid";
    type = "davfs";
  }];

  # Mount it automatically
  systemd.automounts = [{
    description = "alexshare@alexsol.is:2078 (davfs2) (automnt)";
    where = "/home/alex/Shared/";
    unitConfig = {};
    wantedBy = [ "remote-fs.target" ];
  }];
}
