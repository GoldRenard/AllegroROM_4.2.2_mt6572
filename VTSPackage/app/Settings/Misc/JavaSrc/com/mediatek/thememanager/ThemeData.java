// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.thememanager;


public class ThemeData
{

    private String mPackageName;
    private String mThemeName;
    private String mThemePath;


    public String getPackageName()
    {
        return mPackageName;
    }

    public String getThemeName()
    {
        return mThemeName;
    }

    public String getThemePath()
    {
        return mThemePath;
    }

    public void setPackageName(String s)
    {
        mPackageName = s;
    }

    public void setThemeName(String s)
    {
        mThemeName = s;
    }

    public void setThemePath(String s)
    {
        mThemePath = s;
    }
}
