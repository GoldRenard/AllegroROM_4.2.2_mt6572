// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.res.CompatibilityInfo;

public class CompatibilityInfoHolder
{

    private volatile CompatibilityInfo mCompatInfo;

    public CompatibilityInfoHolder()
    {
        mCompatInfo = CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO;
    }

    public CompatibilityInfo get()
    {
        return mCompatInfo;
    }

    public CompatibilityInfo getIfNeeded()
    {
        CompatibilityInfo compatibilityinfo = mCompatInfo;
        if (compatibilityinfo == null || compatibilityinfo == CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO)
            compatibilityinfo = null;
        return compatibilityinfo;
    }

    public void set(CompatibilityInfo compatibilityinfo)
    {
        if (compatibilityinfo == null || !compatibilityinfo.isScalingRequired() && compatibilityinfo.supportsScreen())
        {
            mCompatInfo = CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO;
            return;
        } else
        {
            mCompatInfo = compatibilityinfo;
            return;
        }
    }
}
