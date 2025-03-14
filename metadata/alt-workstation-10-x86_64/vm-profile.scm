((workstation
  (title . "Setup for workstation")
  (action . trivial)
  (actiondata
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
	       ; 10GB * 1024 * 1024 * 2 - 4096
               ("/" (size 20971520 . 20971520 ) (fsim . "Ext2/3") (methods plain))
               ;("/var" (size 1024000 . #t) (fsim . "Ext2/3") (methods  plain))
               )))
