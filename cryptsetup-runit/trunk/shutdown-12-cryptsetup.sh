# Kill non-root encrypted partition mappings
if [[ -f /etc/crypttab ]] && type -p cryptsetup >/dev/null; then
	# Maybe someone has LVM on an encrypted block device
	# executing an extra vgchange is errorless
	[[ -r /etc/rc/sysinit.d/10-lvm2.sh ]] && vgchange --sysinit -a n &>/dev/null
	if [[ -x /usr/bin/dmsetup ]]; then
		for v in $(dmsetup ls --target crypt --exec "dmsetup info -c --noheadings -o open,name"); do
			[[ ${v%%:*} == 0 ]] && cryptsetup close ${v##*:}
		done
	fi
fi
