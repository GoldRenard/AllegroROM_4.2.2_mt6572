// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;


public class CellBroadcastChannel
{

    private int mChannelId;
    private String mChannelName;
    private boolean mChannelState;
    private int mKeyId;


    public CellBroadcastChannel(int i, int j, String s, boolean flag)
    {
        mKeyId = i;
        mChannelId = j;
        mChannelName = s;
        mChannelState = flag;
    }

    public CellBroadcastChannel(int i, String s, boolean flag)
    {
        mChannelId = i;
        mChannelName = s;
        mChannelState = flag;
    }

    public int getChannelId()
    {
        return mChannelId;
    }

    public String getChannelName()
    {
        return mChannelName;
    }

    public boolean getChannelState()
    {
        return mChannelState;
    }

    public int getKeyId()
    {
        return mKeyId;
    }

    public void setChannelId(int i)
    {
        mChannelId = i;
    }

    public void setChannelName(String s)
    {
        mChannelName = s;
    }

    public void setChannelState(boolean flag)
    {
        mChannelState = flag;
    }

    public void setKeyId(int i)
    {
        mKeyId = i;
    }
}
