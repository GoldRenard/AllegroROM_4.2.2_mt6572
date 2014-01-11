// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.net.Uri;

public class UriData
{

    private String mData;
    private String mName;
    private long mSize;
    private Uri mUri;

    public UriData(Uri uri)
    {
        mUri = uri;
    }

    public String getData()
    {
        return mData;
    }

    public String getName()
    {
        return mName;
    }

    public String getPrintableString()
    {
        return (new StringBuilder()).append("name[").append(mName).append("]").append("size[").append(mSize).append("]").append("data[").append(mData).append("]").append("uri[").append(mUri).append("]").toString();
    }

    public long getSize()
    {
        return mSize;
    }

    public Uri getUri()
    {
        return mUri;
    }

    public void setData(String s)
    {
        mData = s;
    }

    public void setName(String s)
    {
        mName = s;
    }

    public void setSize(long l)
    {
        mSize = l;
    }
}
