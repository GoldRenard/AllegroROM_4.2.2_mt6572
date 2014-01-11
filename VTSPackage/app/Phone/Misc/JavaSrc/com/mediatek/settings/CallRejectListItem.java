// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;


public class CallRejectListItem
{

    private String mId;
    private boolean mIsChecked;
    private String mName;
    private String mPhoneNum;

    public CallRejectListItem()
    {
        mName = "";
        mPhoneNum = "";
        mId = "";
        mIsChecked = false;
    }

    public CallRejectListItem(String s, String s1, String s2, boolean flag)
    {
        mName = s;
        mPhoneNum = s1;
        mId = s2;
        mIsChecked = flag;
    }

    public String getId()
    {
        return mId;
    }

    public boolean getIsChecked()
    {
        return mIsChecked;
    }

    public String getName()
    {
        return mName;
    }

    public String getPhoneNum()
    {
        return mPhoneNum;
    }

    public void setId(String s)
    {
        mId = s;
    }

    public void setIsChecked(boolean flag)
    {
        mIsChecked = flag;
    }

    public void setName(String s)
    {
        mName = s;
    }

    public void setPhoneNum(String s)
    {
        mPhoneNum = s;
    }
}
