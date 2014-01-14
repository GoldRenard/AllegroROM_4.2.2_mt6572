// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

public class MediatekZeroTopPaddingTextView extends TextView
{

    private static final float BOLD_FONT_BOTTOM_PADDING_RATIO = 0.208F;
    private static final float BOLD_FONT_PADDING_RATIO = 0.208F;
    private static final float NORMAL_FONT_BOTTOM_PADDING_RATIO = 0.25F;
    private static final float NORMAL_FONT_PADDING_RATIO = 0.328F;
    private static final Typeface SAN_SERIF_BOLD = Typeface.create("san-serif", 1);
    private int mPaddingRight;

    public MediatekZeroTopPaddingTextView(Context context)
    {
        this(context, null);
    }

    public MediatekZeroTopPaddingTextView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public MediatekZeroTopPaddingTextView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mPaddingRight = 0;
        setIncludeFontPadding(false);
        updatePadding();
    }

    public void setPaddingRight(int i)
    {
        mPaddingRight = i;
        updatePadding();
    }

    public void updatePadding()
    {
        float f = 0.328F;
        float f1 = 0.25F;
        if (getTypeface().equals(SAN_SERIF_BOLD))
        {
            f = 0.208F;
            f1 = 0.208F;
        }
        setPadding(0, (int)(-f * getTextSize()), mPaddingRight, (int)(-f1 * getTextSize()));
    }

}
