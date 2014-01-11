// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;


class SimItem
{

    public int mColor;
    public int mDispalyNumberFormat;
    public boolean mIsSim;
    public String mName;
    public String mNumber;
    public long mSimID;
    public int mSlot;
    public int mState;

    public SimItem(android.provider.Telephony.SIMInfo siminfo)
    {
        mIsSim = true;
        mName = null;
        mNumber = null;
        mDispalyNumberFormat = 0;
        mColor = -1;
        mSlot = -1;
        mSimID = -1L;
        mState = 5;
        mIsSim = true;
        mName = siminfo.mDisplayName;
        mNumber = siminfo.mNumber;
        mDispalyNumberFormat = siminfo.mDispalyNumberFormat;
        mColor = siminfo.mColor;
        mSlot = siminfo.mSlot;
        mSimID = siminfo.mSimId;
    }

    public SimItem(String s, int i, long l)
    {
        mIsSim = true;
        mName = null;
        mNumber = null;
        mDispalyNumberFormat = 0;
        mColor = -1;
        mSlot = -1;
        mSimID = -1L;
        mState = 5;
        mName = s;
        mColor = i;
        mIsSim = false;
        mSimID = l;
    }
}
