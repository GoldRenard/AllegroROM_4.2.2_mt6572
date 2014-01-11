// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

public class AnimatedImageView extends ImageView
{

    AnimationDrawable mAnim;
    boolean mAttached;

    public AnimatedImageView(Context context)
    {
        super(context);
    }

    public AnimatedImageView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    private void updateAnim()
    {
        Drawable drawable = getDrawable();
        if (mAttached && mAnim != null)
            mAnim.stop();
        if (drawable instanceof AnimationDrawable)
        {
            mAnim = (AnimationDrawable)drawable;
            if (isShown())
                mAnim.start();
            return;
        } else
        {
            mAnim = null;
            return;
        }
    }

    public void onAttachedToWindow()
    {
label0:
        {
            super.onAttachedToWindow();
            mAttached = true;
            if (mAnim != null)
            {
                if (mAnim.isRunning() || !isShown())
                    break label0;
                mAnim.start();
            }
            return;
        }
        mAnim.stop();
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAnim != null)
            mAnim.stop();
        mAttached = false;
    }

    protected void onVisibilityChanged(View view, int i)
    {
label0:
        {
            super.onVisibilityChanged(view, i);
            if (mAnim != null)
            {
                if (mAnim.isRunning() || !isShown())
                    break label0;
                mAnim.start();
            }
            return;
        }
        mAnim.stop();
    }

    public void setImageDrawable(Drawable drawable)
    {
        super.setImageDrawable(drawable);
        updateAnim();
    }

    public void setImageResource(int i)
    {
        super.setImageResource(i);
        updateAnim();
    }
}
