(10485760(server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
	       ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
               ; Calculating: disk_size (M) * 1024 * 2 - 4096
	       ; 5 GiB 
	       ("/" (size 10481664 . #t) (fsim . "Ext2/3") (methods plain))
               )))
