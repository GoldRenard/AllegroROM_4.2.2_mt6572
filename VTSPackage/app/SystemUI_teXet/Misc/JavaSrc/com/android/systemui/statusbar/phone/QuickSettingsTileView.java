// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;

class QuickSettingsTileView extends FrameLayout
{

    private int mCellWidth;
    private int mColSpan;
    private int mRowSpan;

    public QuickSettingsTileView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mColSpan = 1;
        mRowSpan = 1;
    }

    int getColumnSpan()
    {
        return mColSpan;
    }

    void setColumnSpan(int i)
    {
        mColSpan = i;
    }

    void setContent(int i, LayoutInflater layoutinflater)
    {
        layoutinflater.inflate(i, this);
    }
}
