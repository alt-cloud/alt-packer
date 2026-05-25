((workstation
  (title . "Setup for workstation")
  (action . trivial)
  (actiondata 
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
	       ; 512 MB
	       ; ("swap" (size 1024000 . #t ) (fsim . "SWAPFS") (methods plain))
	       ; Calculating: disk_size (M) * 1024 * 2 - 4096
	       ; 13 GiB
	       ("/" (size 27258880 . #t ) (fsim . "Ext2/3") (methods plain))
               )))
