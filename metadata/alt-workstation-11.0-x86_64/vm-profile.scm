((workstation
  (title . "Setup for workstation")
  (action . trivial)
  (actiondata 
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
	       ; 12 GiB * 1024 * 1024 * 2 - 4096
	       ("/" (size 25161728 . 25161728 ) (fsim . "Ext2/3") (methods plain))
               )))
