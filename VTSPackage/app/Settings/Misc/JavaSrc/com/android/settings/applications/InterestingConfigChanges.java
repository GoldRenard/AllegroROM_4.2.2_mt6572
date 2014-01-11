// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.DisplayMetrics;

class InterestingConfigChanges
{

    final Configuration mLastConfiguration = new Configuration();
    int mLastDensity;


    boolean applyNewConfig(Resources resources)
    {
        boolean flag1;
label0:
        {
            int i = mLastConfiguration.updateFrom(resources.getConfiguration());
            boolean flag;
            if (mLastDensity != resources.getDisplayMetrics().densityDpi)
                flag = true;
            else
                flag = false;
            if (!flag)
            {
                int j = i & 0x304;
                flag1 = false;
                if (j == 0)
                    break label0;
            }
            mLastDensity = resources.getDisplayMetrics().densityDpi;
            flag1 = true;
        }
        return flag1;
    }
}
