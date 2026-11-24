{ ... }:

{
  fileSystems."/mnt/debian-home" = {
    device = "/dev/disk/by-uuid/d4e49a5d-8d85-4bd0-944d-f6ecff66affd";
    fsType = "ext4";
    options = [ "rw" "nofail" ];
  };

  fileSystems."/mnt/archive" = {
    device = "/dev/disk/by-uuid/361cc7e7-cdec-4829-b877-73cc4666b938";
    fsType = "ext4";
    options = [ "ro" "noload" "nofail" ];
  };
}
