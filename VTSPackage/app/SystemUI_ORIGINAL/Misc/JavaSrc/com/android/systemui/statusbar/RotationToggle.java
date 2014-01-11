// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.CompoundButton;
import com.android.systemui.statusbar.policy.AutoRotateController;

public class RotationToggle extends CompoundButton
    implements com.android.systemui.statusbar.policy.AutoRotateController.RotationLockCallbacks
{

    private AutoRotateController mRotater;

    public RotationToggle(Context context)
    {
        super(context);
    }

    public RotationToggle(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public RotationToggle(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mRotater = new AutoRotateController(getContext(), this, this);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mRotater != null)
        {
            mRotater.release();
            mRotater = null;
        }
    }

    public void setRotationLockControlVisibility(boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        setVisibility(byte0);
    }
}
