// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.app.ActivityManager;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;

public class CompatModeButton extends ImageView
{

    private static final boolean DEBUG = false;
    private static final String TAG = "StatusBar.CompatModeButton";
    private ActivityManager mAM;

    public CompatModeButton(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public CompatModeButton(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        setClickable(true);
        mAM = (ActivityManager)context.getSystemService("activity");
        refresh();
    }

    public void refresh()
    {
        int i = mAM.getFrontActivityScreenCompatMode();
        if (i == -3)
            return;
        boolean flag;
        if (i != -2 && i != -1)
            flag = true;
        else
            flag = false;
        byte byte0 = 0;
        if (!flag)
            byte0 = 8;
        setVisibility(byte0);
    }
}
