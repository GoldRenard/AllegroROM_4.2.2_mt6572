// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.content.Context;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import java.util.ArrayList;
import java.util.HashMap;

class BatterySipper
    implements Comparable
{
    static class UidToDetail
    {

        Drawable icon;
        String name;
        String packageName;

    }


    long cpuFgTime;
    long cpuTime;
    String defaultPackageName;
    PowerUsageDetail.DrainType drainType;
    long gpsTime;
    Drawable icon;
    int iconId;
    final Context mContext;
    final Handler mHandler;
    final ArrayList mRequestQueue;
    final HashMap mUidCache = new HashMap();
    String name;
    double noCoveragePercent;
    double percent;
    long tcpBytesReceived;
    long tcpBytesSent;
    android.os.BatteryStats.Uid uidObj;
    long usageTime;
    double value;
    double values[];
    long wakeLockTime;
    long wifiRunningTime;

    BatterySipper(Context context, ArrayList arraylist, Handler handler, String s, PowerUsageDetail.DrainType draintype, int i, android.os.BatteryStats.Uid uid, 
            double ad[])
    {
        mContext = context;
        mRequestQueue = arraylist;
        mHandler = handler;
        values = ad;
        name = s;
        drainType = draintype;
        if (i > 0)
            icon = mContext.getResources().getDrawable(i);
        if (ad != null)
            value = ad[0];
        if ((s == null || i == 0) && uid != null)
            getQuickNameIconForUid(uid);
        uidObj = uid;
    }

    public int compareTo(BatterySipper batterysipper)
    {
        return (int)(batterysipper.getSortValue() - getSortValue());
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((BatterySipper)obj);
    }

    Drawable getIcon()
    {
        return icon;
    }

    void getNameIcon()
    {
        PackageManager packagemanager;
        Drawable drawable;
        String as[];
        String as1[];
        int j;
        packagemanager = mContext.getPackageManager();
        int i = uidObj.getUid();
        drawable = packagemanager.getDefaultActivityIcon();
        as = packagemanager.getPackagesForUid(i);
        if (as == null)
        {
            name = Integer.toString(i);
            return;
        }
        as1 = new String[as.length];
        System.arraycopy(as, 0, as1, 0, as.length);
        j = 0;
_L7:
        if (j >= as1.length) goto _L2; else goto _L1
_L1:
        if (as1[j].equals(name))
        {
            j;
        }
        ApplicationInfo applicationinfo;
        CharSequence charsequence1;
        applicationinfo = packagemanager.getApplicationInfo(as1[j], 0);
        charsequence1 = applicationinfo.loadLabel(packagemanager);
        if (charsequence1 == null)
            break MISSING_BLOCK_LABEL_126;
        as1[j] = charsequence1.toString();
        if (applicationinfo.icon == 0) goto _L4; else goto _L3
_L3:
        defaultPackageName = as[j];
        icon = applicationinfo.loadIcon(packagemanager);
_L2:
        if (icon == null)
            icon = drawable;
        if (as1.length != 1) goto _L6; else goto _L5
_L5:
        name = as1[0];
_L9:
        String s1 = Integer.toString(uidObj.getUid());
        UidToDetail uidtodetail = new UidToDetail();
        uidtodetail.name = name;
        uidtodetail.icon = icon;
        uidtodetail.packageName = defaultPackageName;
        mUidCache.put(s1, uidtodetail);
        mHandler.sendMessage(mHandler.obtainMessage(1, this));
        return;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1;
        namenotfoundexception1;
_L4:
        j++;
          goto _L7
_L6:
        int k;
        int l;
        k = as.length;
        l = 0;
_L10:
        if (l >= k) goto _L9; else goto _L8
_L8:
        String s = as[l];
        PackageInfo packageinfo;
        CharSequence charsequence;
        packageinfo = packagemanager.getPackageInfo(s, 0);
        if (packageinfo.sharedUserLabel == 0)
            break MISSING_BLOCK_LABEL_372;
        charsequence = packagemanager.getText(s, packageinfo.sharedUserLabel, packageinfo.applicationInfo);
        if (charsequence == null)
            break MISSING_BLOCK_LABEL_372;
        name = charsequence.toString();
        if (packageinfo.applicationInfo.icon != 0)
        {
            defaultPackageName = s;
            icon = packageinfo.applicationInfo.loadIcon(packagemanager);
        }
          goto _L9
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        l++;
          goto _L10
    }

    void getQuickNameIconForUid(android.os.BatteryStats.Uid uid)
    {
        int i;
        String as[];
        i = uid.getUid();
        String s = Integer.toString(i);
        if (mUidCache.containsKey(s))
        {
            UidToDetail uidtodetail = (UidToDetail)mUidCache.get(s);
            defaultPackageName = uidtodetail.packageName;
            name = uidtodetail.name;
            icon = uidtodetail.icon;
            return;
        }
        PackageManager packagemanager = mContext.getPackageManager();
        as = packagemanager.getPackagesForUid(i);
        icon = packagemanager.getDefaultActivityIcon();
        if (as != null) goto _L2; else goto _L1
_L1:
        if (i != 0) goto _L4; else goto _L3
_L3:
        name = mContext.getResources().getString(0x7f0b0791);
_L5:
        iconId = 0x7f020075;
        icon = mContext.getResources().getDrawable(iconId);
        return;
_L4:
        if ("mediaserver".equals(name))
            name = mContext.getResources().getString(0x7f0b0792);
        if (true) goto _L5; else goto _L2
_L2:
        synchronized (mRequestQueue)
        {
            mRequestQueue.add(this);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    double getSortValue()
    {
        return value;
    }

    double[] getValues()
    {
        return values;
    }
}
