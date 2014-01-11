// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.util.AttributeSet;

public abstract class ProgressCategoryBase extends PreferenceCategory
{

    public ProgressCategoryBase(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public abstract void setProgress(boolean flag);
}
