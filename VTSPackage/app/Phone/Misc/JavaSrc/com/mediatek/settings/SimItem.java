// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;


public class SimItem
{

    public boolean mIsSim;
    public android.provider.Telephony.SIMInfo mSiminfo;
    public int mState;

    public SimItem(android.provider.Telephony.SIMInfo siminfo)
    {
        mIsSim = true;
        mState = 5;
        mSiminfo = siminfo;
        if (siminfo == null)
        {
            mIsSim = false;
            return;
        } else
        {
            mIsSim = true;
            return;
        }
    }
}
