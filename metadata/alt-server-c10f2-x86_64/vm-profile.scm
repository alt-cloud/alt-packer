((server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
	       ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
               ; Calculating: disk_size (M) * 1024 * 2 - 4096
               ; 10 GiB
               ("/" (size 18870272 . 18870272 ) (fsim . "Ext2/3") (methods plain))
               )))
