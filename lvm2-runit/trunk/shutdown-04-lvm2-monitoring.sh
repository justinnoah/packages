# stop monitoring of LVM2 groups before unmounting filesystems
	status "Deactivating monitoring of LVM2 groups" vgchange --monitor n
