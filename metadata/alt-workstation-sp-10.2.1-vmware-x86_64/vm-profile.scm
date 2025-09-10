((server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
               ; Calculating: disk_size (M) * 1024 * 2
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
               ; Calculating: disk_size (M) * 1024 * 2 - 4096
               ; 12 GiB
               ("/" (size 25161728 . #t) (fsim . "Ext2/3") (methods plain))
               )))

