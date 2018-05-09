# Activate LVM2 groups, if any
[[ -x $(type -P lvm) && -d /sys/block ]] && \
    status "Activating LVM2 groups" vgchange --sysinit -a y
