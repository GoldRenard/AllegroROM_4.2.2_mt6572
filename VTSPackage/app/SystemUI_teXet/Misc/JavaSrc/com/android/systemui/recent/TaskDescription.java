// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

public final class TaskDescription
{

    final CharSequence description;
    final Intent intent;
    private Drawable mIcon;
    private CharSequence mLabel;
    private boolean mLoaded;
    private Bitmap mThumbnail;
    final String packageName;
    final int persistentTaskId;
    final ResolveInfo resolveInfo;
    final int taskId;

    public TaskDescription()
    {
        resolveInfo = null;
        intent = null;
        taskId = -1;
        persistentTaskId = -1;
        description = null;
        packageName = null;
    }

    public TaskDescription(int i, int j, ResolveInfo resolveinfo, Intent intent1, String s, CharSequence charsequence)
    {
        resolveInfo = resolveinfo;
        intent = intent1;
        taskId = i;
        persistentTaskId = j;
        description = charsequence;
        packageName = s;
    }

    public Drawable getIcon()
    {
        return mIcon;
    }

    public CharSequence getLabel()
    {
        return mLabel;
    }

    public Bitmap getThumbnail()
    {
        return mThumbnail;
    }

    public boolean isLoaded()
    {
        return mLoaded;
    }

    public boolean isNull()
    {
        return resolveInfo == null;
    }

    public void setIcon(Drawable drawable)
    {
        mIcon = drawable;
    }

    public void setLabel(CharSequence charsequence)
    {
        mLabel = charsequence;
    }

    public void setLoaded(boolean flag)
    {
        mLoaded = flag;
    }

    public void setThumbnail(Bitmap bitmap)
    {
        mThumbnail = bitmap;
    }
}
