#!/sbin/bb/busybox sh
#
#  Stuxnet kernel
#

# busybox
bb=/sbin/bb/busybox;

# CPU Settings
        $bb echo "192000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        $bb echo "1512000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        $bb echo "Configure CPU Settings" | tee /dev/kmsg

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


