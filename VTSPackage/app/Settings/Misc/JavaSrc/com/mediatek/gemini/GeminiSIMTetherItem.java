// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;


public class GeminiSIMTetherItem
{

    private int mCheckedStatus;
    private int mContactId;
    private String mName;
    private String mPhoneNum;
    private String mPhoneNumType;
    private int mSimColor;
    private String mSimId;
    private String mSimName;

    public GeminiSIMTetherItem()
    {
        mName = "";
        mPhoneNum = "";
        mSimColor = 0;
        mCheckedStatus = -1;
    }

    public GeminiSIMTetherItem(String s, String s1, int i, int j)
    {
        mName = s;
        mPhoneNum = s1;
        mSimColor = i;
        mCheckedStatus = j;
    }

    public int getCheckedStatus()
    {
        return mCheckedStatus;
    }

    public int getContactId()
    {
        return mContactId;
    }

    public String getName()
    {
        return mName;
    }

    public String getPhoneNum()
    {
        return mPhoneNum;
    }

    public String getPhoneNumType()
    {
        return mPhoneNumType;
    }

    public int getSimColor()
    {
        return mSimColor;
    }

    public String getSimId()
    {
        return mSimId;
    }

    public String getSimName()
    {
        return mSimName;
    }

    public void setCheckedStatus(int i)
    {
        mCheckedStatus = i;
    }

    public void setContactId(int i)
    {
        mContactId = i;
    }

    public void setName(String s)
    {
        mName = s;
    }

    public void setPhoneNum(String s)
    {
        mPhoneNum = s;
    }

    public void setPhoneNumType(String s)
    {
        mPhoneNumType = s;
    }

    public void setSimColor(int i)
    {
        mSimColor = i;
    }

    public void setSimId(String s)
    {
        mSimId = s;
    }

    public void setSimName(String s)
    {
        mSimName = s;
    }
}
