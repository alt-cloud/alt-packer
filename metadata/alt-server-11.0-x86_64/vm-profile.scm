((server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
	       ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
	       ; ("swap" (size 1024000 . 1024000) (fsim . "SWAPFS") (methods plain))
               ; Calculating: disk_size (M) * 1024 * 2 - 4096
	       ; 5 GiB * 1024 * 1024 * 4 - 4096
	       ("/" (size 10485760 . #t ) (fsim . "Ext2/3") (methods plain))
               )))
