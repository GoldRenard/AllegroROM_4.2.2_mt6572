// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class IconPreferenceScreen extends Preference
{

    private boolean mHighlight;
    private Drawable mIcon;

    public IconPreferenceScreen(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public IconPreferenceScreen(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        setLayoutResource(0x7f040067);
        mIcon = context.obtainStyledAttributes(attributeset, R.styleable.IconPreferenceScreen, i, 0).getDrawable(0);
    }

    public Drawable getIcon()
    {
        return mIcon;
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
        ImageView imageview = (ImageView)view.findViewById(0x7f080023);
        if (imageview != null && mIcon != null)
            imageview.setImageDrawable(mIcon);
        TextView _tmp = (TextView)view.findViewById(0x1020016);
    }

    public void setHighlighted(boolean flag)
    {
        mHighlight = flag;
        notifyChanged();
    }

    public void setIcon(Drawable drawable)
    {
        if (drawable == null && mIcon != null || drawable != null && !drawable.equals(mIcon))
        {
            mIcon = drawable;
            notifyChanged();
        }
    }
}
