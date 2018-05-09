# Enable monitoring of LVM2 groups, now that the filesystems are mounted rw
	status "Activating monitoring of LVM2 groups" \
		vgchange --monitor y >/dev/null
