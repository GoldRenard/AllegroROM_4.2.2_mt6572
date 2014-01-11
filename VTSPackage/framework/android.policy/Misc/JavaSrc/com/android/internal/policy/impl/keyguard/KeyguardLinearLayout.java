// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

public class KeyguardLinearLayout extends LinearLayout
{

    int mTopChild;

    public KeyguardLinearLayout(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardLinearLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardLinearLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTopChild = 0;
    }

    public void setTopChild(View view)
    {
        mTopChild = indexOfChild(view);
        invalidate();
    }
}
