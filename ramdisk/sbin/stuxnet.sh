#!/system/bin/sh
#

# busybox
bb=/sbin/bb/busybox;

# SuperSU daemonsu/Superuser su_daemon
$bb [ -e /system/xbin/daemonsu ] && /system/xbin/daemonsu --auto-daemon &
$bb [ ! -e /system/xbin/daemonsu ] &&  /system/xbin/su --daemon &

# set permissions for /system/etc/init.d
if [ ! -e /system/etc/init.d ]; then
  $bb mkdir /system/etc/init.d;
  $bb chown -R root.root /system/etc/init.d;
  $bb chmod -R 755 /system/etc/init.d;
fi;
$bb mount -o ro,remount /system;

# CPU Settings
	echo "384000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	echo "1728000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo "Configure CPU Settings" | tee /dev/kmsg


