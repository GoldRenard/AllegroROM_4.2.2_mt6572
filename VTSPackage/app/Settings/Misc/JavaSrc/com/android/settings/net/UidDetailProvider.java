// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.net;

import android.content.Context;
import android.content.pm.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.os.UserManager;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.settings.Utils;
import com.android.settings.users.UserUtils;

// Referenced classes of package com.android.settings.net:
//            UidDetail

public class UidDetailProvider
{

    private final Context mContext;
    private final SparseArray mUidDetailCache = new SparseArray();

    public UidDetailProvider(Context context)
    {
        mContext = context.getApplicationContext();
    }

    public static int buildKeyForUser(int i)
    {
        return -(i + 2000);
    }

    private UidDetail buildUidDetail(int i)
    {
        Resources resources;
        PackageManager packagemanager;
        UidDetail uiddetail;
        resources = mContext.getResources();
        packagemanager = mContext.getPackageManager();
        uiddetail = new UidDetail();
        uiddetail.label = packagemanager.getNameForUid(i);
        uiddetail.icon = packagemanager.getDefaultActivityIcon();
        i;
        JVM INSTR lookupswitch 3: default 80
    //                   -5: 230
    //                   -4: 190
    //                   1000: 167;
           goto _L1 _L2 _L3 _L4
_L1:
        if (i > -2000) goto _L6; else goto _L5
_L5:
        UserManager usermanager;
        UserInfo userinfo;
        int i1 = -2000 + -i;
        usermanager = (UserManager)mContext.getSystemService("user");
        userinfo = usermanager.getUserInfo(i1);
        if (userinfo == null) goto _L6; else goto _L7
_L7:
        Object aobj[] = new Object[1];
        aobj[0] = userinfo.name;
        uiddetail.label = resources.getString(0x7f0b06a2, aobj);
        uiddetail.icon = UserUtils.getUserIcon(usermanager, userinfo, resources);
_L18:
        return uiddetail;
_L4:
        uiddetail.label = resources.getString(0x7f0b0791);
        uiddetail.icon = packagemanager.getDefaultActivityIcon();
        return uiddetail;
_L3:
        int j;
        if (UserManager.supportsMultipleUsers())
            j = 0x7f0b08c9;
        else
            j = 0x7f0b08c8;
        uiddetail.label = resources.getString(j);
        uiddetail.icon = packagemanager.getDefaultActivityIcon();
        return uiddetail;
_L2:
        uiddetail.label = resources.getString(Utils.getTetheringLabel((ConnectivityManager)mContext.getSystemService("connectivity")));
        uiddetail.icon = packagemanager.getDefaultActivityIcon();
        return uiddetail;
_L6:
        String as[];
        int k;
        as = packagemanager.getPackagesForUid(i);
        ApplicationInfo applicationinfo1;
        if (as != null)
            k = as.length;
        else
            k = 0;
        if (k != 1) goto _L9; else goto _L8
_L8:
        int l;
        try
        {
            applicationinfo1 = packagemanager.getApplicationInfo(as[0], 0);
            uiddetail.label = applicationinfo1.loadLabel(packagemanager).toString();
            uiddetail.icon = applicationinfo1.loadIcon(packagemanager);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
_L16:
        if (TextUtils.isEmpty(uiddetail.label))
        {
            uiddetail.label = Integer.toString(i);
            return uiddetail;
        }
          goto _L10
_L9:
        if (k <= 1) goto _L12; else goto _L11
_L11:
        uiddetail.detailLabels = new CharSequence[k];
        l = 0;
_L14:
        if (l >= k) goto _L12; else goto _L13
_L13:
        String s = as[l];
        PackageInfo packageinfo = packagemanager.getPackageInfo(s, 0);
        ApplicationInfo applicationinfo = packagemanager.getApplicationInfo(s, 0);
        uiddetail.detailLabels[l] = applicationinfo.loadLabel(packagemanager).toString();
        if (packageinfo.sharedUserLabel != 0)
        {
            uiddetail.label = packagemanager.getText(s, packageinfo.sharedUserLabel, packageinfo.applicationInfo).toString();
            uiddetail.icon = applicationinfo.loadIcon(packagemanager);
        }
        l++;
          goto _L14
_L12:
        if (true) goto _L16; else goto _L15
_L15:
_L10:
        if (true) goto _L18; else goto _L17
_L17:
    }

    public void clearCache()
    {
        synchronized (mUidDetailCache)
        {
            mUidDetailCache.clear();
        }
        return;
        exception;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public UidDetail getUidDetail(int i, boolean flag)
    {
        UidDetail uiddetail;
        synchronized (mUidDetailCache)
        {
            uiddetail = (UidDetail)mUidDetailCache.get(i);
        }
        if (uiddetail != null)
            return uiddetail;
        break MISSING_BLOCK_LABEL_37;
        exception;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception;
        if (!flag)
            return null;
        UidDetail uiddetail1 = buildUidDetail(i);
        synchronized (mUidDetailCache)
        {
            mUidDetailCache.put(i, uiddetail1);
        }
        return uiddetail1;
        exception1;
        sparsearray1;
        JVM INSTR monitorexit ;
        throw exception1;
    }
}
