// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

public class IconIdWrapper
    implements Cloneable
{

    private int mIconId;
    private Resources mResources;

    public IconIdWrapper()
    {
        this(null, 0);
    }

    public IconIdWrapper(int i)
    {
        this(null, i);
    }

    public IconIdWrapper(Resources resources, int i)
    {
        mResources = null;
        mIconId = 0;
        mResources = resources;
        mIconId = i;
    }

    public IconIdWrapper clone()
    {
        IconIdWrapper iconidwrapper;
        try
        {
            iconidwrapper = (IconIdWrapper)super.clone();
            iconidwrapper.mResources = mResources;
            iconidwrapper.mIconId = mIconId;
        }
        catch (CloneNotSupportedException clonenotsupportedexception)
        {
            return null;
        }
        return iconidwrapper;
    }

    public volatile Object clone()
        throws CloneNotSupportedException
    {
        return clone();
    }

    public Drawable getDrawable()
    {
        if (mResources != null && mIconId != 0)
            return mResources.getDrawable(mIconId);
        else
            return null;
    }

    public int getIconId()
    {
        return mIconId;
    }

    public Resources getResources()
    {
        return mResources;
    }

    public void setIconId(int i)
    {
        mIconId = i;
    }

    public void setResources(Resources resources)
    {
        mResources = resources;
    }
}
