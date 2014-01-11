// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import com.android.settings.ProgressCategoryBase;

public class EpoProgressCategory extends ProgressCategoryBase
{

    private boolean mProgress;
    private String mText;

    public EpoProgressCategory(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mProgress = false;
        setLayoutResource(0x7f04006e);
        mText = context.getResources().getString(0x7f0b02dc);
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x7f08010c);
        View view1 = view.findViewById(0x7f08010b);
        byte byte0;
        if (mProgress)
            byte0 = 0;
        else
            byte0 = 4;
        textview.setVisibility(byte0);
        textview.setText(mText);
        view1.setVisibility(byte0);
    }

    public void setProgress(boolean flag)
    {
        mProgress = flag;
        notifyChanged();
    }

    public void setText(String s)
    {
        mText = s;
    }
}
