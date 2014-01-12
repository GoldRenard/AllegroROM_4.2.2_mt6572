// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

final class CanBeOnSdCardChecker
{

    int mInstallLocation;
    final IPackageManager mPm = android.content.pm.IPackageManager.Stub.asInterface(ServiceManager.getService("package"));


    boolean check(ApplicationInfo applicationinfo)
    {
label0:
        {
            boolean flag;
            if ((0x40000 & applicationinfo.flags) != 0)
            {
                flag = true;
            } else
            {
                int i = 0x40000000 & applicationinfo.flags;
                flag = false;
                if (i == 0)
                {
                    int j = 1 & applicationinfo.flags;
                    flag = false;
                    if (j == 0)
                    {
                        if (applicationinfo.installLocation == 2 || applicationinfo.installLocation == 0)
                            break label0;
                        int k = applicationinfo.installLocation;
                        flag = false;
                        if (k == -1)
                        {
                            int l = mInstallLocation;
                            flag = false;
                            if (l == 2)
                                return true;
                        }
                    }
                }
            }
            return flag;
        }
        return true;
    }

    void init()
    {
        try
        {
            mInstallLocation = mPm.getInstallLocation();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("CanBeOnSdCardChecker", "Is Package Manager running?");
        }
    }
}
