// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.graphics.drawable.AnimatedRotateDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

public class AnimatedImageView extends ImageView
{

    private boolean mAnimating;
    private AnimatedRotateDrawable mDrawable;

    public AnimatedImageView(Context context)
    {
        super(context);
    }

    public AnimatedImageView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    private void updateAnimating()
    {
label0:
        {
            if (mDrawable != null)
            {
                if (!isShown() || !mAnimating)
                    break label0;
                mDrawable.start();
            }
            return;
        }
        mDrawable.stop();
    }

    private void updateDrawable()
    {
        if (isShown() && mDrawable != null)
            mDrawable.stop();
        Drawable drawable = getDrawable();
        if (drawable instanceof AnimatedRotateDrawable)
        {
            mDrawable = (AnimatedRotateDrawable)drawable;
            mDrawable.setFramesCount(56);
            mDrawable.setFramesDuration(32);
            if (isShown() && mAnimating)
                mDrawable.start();
            return;
        } else
        {
            mDrawable = null;
            return;
        }
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        updateAnimating();
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        updateAnimating();
    }

    protected void onVisibilityChanged(View view, int i)
    {
        super.onVisibilityChanged(view, i);
        updateAnimating();
    }

    public void setAnimating(boolean flag)
    {
        mAnimating = flag;
        updateAnimating();
    }

    public void setImageDrawable(Drawable drawable)
    {
        super.setImageDrawable(drawable);
        updateDrawable();
    }

    public void setImageResource(int i)
    {
        super.setImageResource(i);
        updateDrawable();
    }
}
