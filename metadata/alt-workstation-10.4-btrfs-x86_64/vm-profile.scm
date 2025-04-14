((workstation
  (title . "Setup for workstation")
  (action . trivial)
  (actiondata
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
	       ; 10GB * 1024 * 1024 * 2 
	       ;("/" (size 18874368 . 18874368 ) (fsim . "Ext2/3") (methods plain))
               ("/" (size 20971520 . 20971520 ) (fsim . "BtrFS") (methods plain))
               ;("/var" (size 1024000 . #t) (fsim . "Ext2/3") (methods  plain))
	       ; 1 GiB
               ("/home" (size 2048000 . #t) (fsim . "BtrFS") (methods  plain))))
               )))
