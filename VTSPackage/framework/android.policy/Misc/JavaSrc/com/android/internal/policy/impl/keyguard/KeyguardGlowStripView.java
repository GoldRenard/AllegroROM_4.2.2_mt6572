// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.animation.*;
import android.widget.LinearLayout;

public class KeyguardGlowStripView extends LinearLayout
{

    private static final int DURATION = 500;
    private static final float SLIDING_WINDOW_SIZE = 0.4F;
    private float mAnimationProgress;
    private ValueAnimator mAnimator;
    private Interpolator mDotAlphaInterpolator;
    private Drawable mDotDrawable;
    private int mDotSize;
    private int mDotStripTop;
    private boolean mDrawDots;
    private int mHorizontalDotGap;
    private boolean mLeftToRight;
    private int mNumDots;

    public KeyguardGlowStripView(Context context)
    {
        KeyguardGlowStripView(context, null, 0);
    }

    public KeyguardGlowStripView(Context context, AttributeSet attributeset)
    {
        KeyguardGlowStripView(context, attributeset, 0);
    }

    public KeyguardGlowStripView(Context context, AttributeSet attributeset, int i)
    {
        LinearLayout(context, attributeset, i);
        mLeftToRight = true;
        mAnimationProgress = 0.0F;
        mDrawDots = false;
        mDotAlphaInterpolator = new DecelerateInterpolator(0.5F);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.KeyguardGlowStripView);
        mDotSize = typedarray.getDimensionPixelSize(0, mDotSize);
        mNumDots = typedarray.getInt(1, mNumDots);
        mDotDrawable = typedarray.getDrawable(2);
        mLeftToRight = typedarray.getBoolean(3, mLeftToRight);
    }

    protected void dispatchDraw(Canvas canvas)
    {
        dispatchDraw(canvas);
        if (mDrawDots)
        {
            int i = getPaddingLeft();
            mDotDrawable.setBounds(0, 0, mDotSize, mDotSize);
            for (int j = 0; j < mNumDots; j++)
            {
                float f = Math.max(0.0F, 1.0F - Math.abs((0.2F + 0.6F * ((1.0F * (float)j) / (float)(-1 + mNumDots))) - mAnimationProgress) / 0.2F);
                float f1 = mDotAlphaInterpolator.getInterpolation(f);
                canvas.save();
                canvas.translate(i, mDotStripTop);
                mDotDrawable.setAlpha((int)(255F * f1));
                mDotDrawable.draw(canvas);
                canvas.restore();
                i += mDotSize + mHorizontalDotGap;
            }

        }
    }

    public void makeEmGo()
    {
        if (mAnimator != null)
            mAnimator.cancel();
        float f;
        if (mLeftToRight)
            f = 0.0F;
        else
            f = 1.0F;
        float f1;
        if (mLeftToRight)
            f1 = 1.0F;
        else
            f1 = 0.0F;
        mAnimator = ValueAnimator.ofFloat(new float[] {
            f, f1
        });
        mAnimator.setDuration(500L);
        mAnimator.setInterpolator(new LinearInterpolator());
        mAnimator.addListener(new AnimatorListenerAdapter() {

            final KeyguardGlowStripView this$0;

            public void onAnimationEnd(Animator animator)
            {
                mDrawDots = false;
                invalidate();
            }

            public void onAnimationStart(Animator animator)
            {
                mDrawDots = true;
            }

            
            {
                this$0 = KeyguardGlowStripView.this;
                AnimatorListenerAdapter();
            }
        }
);
        mAnimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

            final KeyguardGlowStripView this$0;

            public void onAnimationUpdate(ValueAnimator valueanimator)
            {
                mAnimationProgress = ((Float)valueanimator.getAnimatedValue()).floatValue();
                invalidate();
            }

            
            {
                this$0 = KeyguardGlowStripView.this;
                Object();
            }
        }
);
        mAnimator.start();
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        mHorizontalDotGap = (i - getPaddingLeft() - getPaddingRight() - mDotSize * mNumDots) / (-1 + mNumDots);
        mDotStripTop = getPaddingTop();
        invalidate();
    }


/*
    static boolean access$002(KeyguardGlowStripView keyguardglowstripview, boolean flag)
    {
        keyguardglowstripview.mDrawDots = flag;
        return flag;
    }

*/


/*
    static float access$102(KeyguardGlowStripView keyguardglowstripview, float f)
    {
        keyguardglowstripview.mAnimationProgress = f;
        return f;
    }

*/
}
