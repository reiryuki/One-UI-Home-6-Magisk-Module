mount -o rw,remount /data
MODPATH=${0%/*}
MODID=`echo "$MODPATH" | sed 's|/data/adb/modules/||'`
APP="`ls $MODPATH/system/priv-app` `ls $MODPATH/system/app`"
PKG="com.sec.android.app.launcher*
     com.sec.android.provider.badge
     com.samsung.android.rubin.app
     com.samsung.android.app.galaxyfinder
     com.sec.android.settings
     com.android.settings.intelligence
     com.samsung.android.app.appsedge
     org.blinksd.settings"
for PKGS in $PKG; do
  rm -rf /data/user/*/$PKGS
done
for APPS in $APP; do
  rm -f `find /data/system/package_cache -type f -name *$APPS*`
  rm -f `find /data/dalvik-cache /data/resource-cache -type f -name *$APPS*.apk`
done
rm -rf /metadata/magisk/"$MODID"
rm -rf /mnt/vendor/persist/magisk/"$MODID"
rm -rf /persist/magisk/"$MODID"
rm -rf /data/unencrypted/magisk/"$MODID"
rm -rf /cache/magisk/"$MODID"


