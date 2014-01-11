// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;


public class CellBroadcastLanguage
{

    private int mLanguageId;
    private String mLanguageName;
    private boolean mLanguageState;

    public CellBroadcastLanguage(int i, String s, boolean flag)
    {
        mLanguageId = i;
        mLanguageName = s;
        mLanguageState = flag;
    }

    public int getLanguageId()
    {
        return mLanguageId;
    }

    public String getLanguageName()
    {
        return mLanguageName;
    }

    public boolean getLanguageState()
    {
        return mLanguageState;
    }

    public void setLanguageState(boolean flag)
    {
        mLanguageState = flag;
    }
}
