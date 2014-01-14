// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUtils

public class TargetDrawable
{
    static class DrawableWithAlpha extends Drawable
    {

        private float mAlpha;
        private Drawable mRealDrawable;

        public void draw(Canvas canvas)
        {
            mRealDrawable.setAlpha(Math.round(255F * mAlpha));
            mRealDrawable.draw(canvas);
        }

        public float getAlpha()
        {
            return mAlpha;
        }

        public int getOpacity()
        {
            return mRealDrawable.getOpacity();
        }

        public void setAlpha(float f)
        {
            mAlpha = f;
        }

        public void setAlpha(int i)
        {
            mRealDrawable.setAlpha(i);
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
            mRealDrawable.setColorFilter(colorfilter);
        }

        public DrawableWithAlpha(Drawable drawable)
        {
            mAlpha = 1.0F;
            mRealDrawable = drawable;
        }
    }


    private static final boolean DEBUG = false;
    public static final int STATE_ACTIVE[] = {
        0x101009e, 0x10100a2
    };
    public static final int STATE_FOCUSED[] = {
        0x101009e, 0xfefeff5e, 0x101009c
    };
    public static final int STATE_INACTIVE[] = {
        0x101009e, 0xfefeff5e
    };
    private static final String TAG = "TargetDrawable";
    private float mAlpha;
    private Drawable mDrawable;
    private boolean mEnabled;
    private float mPositionX;
    private float mPositionY;
    private final int mResourceId;
    private float mScaleX;
    private float mScaleY;
    private float mTranslationX;
    private float mTranslationY;

    public TargetDrawable(Resources resources, int i)
    {
        mTranslationX = 0.0F;
        mTranslationY = 0.0F;
        mPositionX = 0.0F;
        mPositionY = 0.0F;
        mScaleX = 1.0F;
        mScaleY = 1.0F;
        mAlpha = 1.0F;
        mEnabled = true;
        mResourceId = i;
        setDrawable(resources, i);
    }

    public TargetDrawable(TargetDrawable targetdrawable)
    {
        mTranslationX = 0.0F;
        mTranslationY = 0.0F;
        mPositionX = 0.0F;
        mPositionY = 0.0F;
        mScaleX = 1.0F;
        mScaleY = 1.0F;
        mAlpha = 1.0F;
        mEnabled = true;
        mResourceId = targetdrawable.mResourceId;
        Drawable drawable;
        if (targetdrawable.mDrawable != null)
            drawable = targetdrawable.mDrawable.mutate();
        else
            drawable = null;
        mDrawable = drawable;
        resizeDrawables();
        setState(STATE_INACTIVE);
    }

    private void resizeDrawables()
    {
        if (mDrawable instanceof StateListDrawable)
        {
            StateListDrawable statelistdrawable = (StateListDrawable)mDrawable;
            int i = 0;
            int j = 0;
            for (int k = 0; k < statelistdrawable.getStateCount(); k++)
            {
                Drawable drawable = statelistdrawable.getStateDrawable(k);
                i = Math.max(i, drawable.getIntrinsicWidth());
                j = Math.max(j, drawable.getIntrinsicHeight());
            }

            statelistdrawable.setBounds(0, 0, i, j);
            for (int l = 0; l < statelistdrawable.getStateCount(); l++)
                statelistdrawable.getStateDrawable(l).setBounds(0, 0, i, j);

        } else
        if (mDrawable != null)
            mDrawable.setBounds(0, 0, mDrawable.getIntrinsicWidth(), mDrawable.getIntrinsicHeight());
    }

    public void draw(Canvas canvas)
    {
        if (mDrawable != null && mEnabled)
        {
            canvas.save(1);
            canvas.translate(mTranslationX + mPositionX, mTranslationY + mPositionY);
            canvas.translate(-0.5F * (float)getWidth(), -0.5F * (float)getHeight());
            canvas.scale(mScaleX, mScaleY);
            mDrawable.setAlpha(Math.round(255F * mAlpha));
            mDrawable.draw(canvas);
            canvas.restore();
            return;
        } else
        {
            return;
        }
    }

    public float getAlpha()
    {
        return mAlpha;
    }

    public int getHeight()
    {
        float f;
        if (mDrawable != null)
            f = (float)mDrawable.getIntrinsicHeight() * mScaleY;
        else
            f = 0.0F;
        return (int)f;
    }

    public float getPositionX()
    {
        return mPositionX;
    }

    public float getPositionY()
    {
        return mPositionY;
    }

    public int getResourceId()
    {
        return mResourceId;
    }

    public float getScaleX()
    {
        return mScaleX;
    }

    public float getScaleY()
    {
        return mScaleY;
    }

    public int[] getState()
    {
        boolean flag = mDrawable instanceof StateListDrawable;
        int ai[] = null;
        if (flag)
            ai = ((StateListDrawable)mDrawable).getState();
        return ai;
    }

    public int getWidth()
    {
        float f;
        if (mDrawable != null)
            f = (float)mDrawable.getIntrinsicWidth() * mScaleX;
        else
            f = 0.0F;
        return (int)f;
    }

    public float getX()
    {
        return mTranslationX;
    }

    public float getY()
    {
        return mTranslationY;
    }

    public boolean hasState(int ai[])
    {
        boolean flag = mDrawable instanceof StateListDrawable;
        boolean flag1 = false;
        if (flag)
        {
            int i = ((StateListDrawable)mDrawable).getStateDrawableIndex(ai);
            flag1 = false;
            if (i != -1)
                flag1 = true;
        }
        return flag1;
    }

    public boolean isActive()
    {
        if (mDrawable instanceof StateListDrawable)
        {
            int ai[] = ((StateListDrawable)mDrawable).getState();
            for (int i = 0; i < ai.length; i++)
                if (ai[i] == 0x101009c)
                    return true;

        }
        return false;
    }

    public boolean isEnabled()
    {
        return mDrawable != null && mEnabled;
    }

    public void setAlpha(float f)
    {
        mAlpha = f;
    }

    public void setDrawable(Resources resources, int i)
    {
        Drawable drawable;
        if (i == 0)
            drawable = null;
        else
            drawable = resources.getDrawable(i);
        Drawable drawable1 = null;
        if (drawable != null)
            drawable1 = drawable.mutate();
        mDrawable = drawable1;
        resizeDrawables();
        setState(STATE_INACTIVE);
    }

    public void setEnabled(boolean flag)
    {
        KeyguardUtils.xlogD("TargetDrawable", (new StringBuilder()).append("setEnable enabled=").append(flag).toString());
        mEnabled = flag;
    }

    public void setPositionX(float f)
    {
        mPositionX = f;
    }

    public void setPositionY(float f)
    {
        mPositionY = f;
    }

    public void setScaleX(float f)
    {
        mScaleX = f;
    }

    public void setScaleY(float f)
    {
        mScaleY = f;
    }

    public void setState(int ai[])
    {
        if (mDrawable instanceof StateListDrawable)
            ((StateListDrawable)mDrawable).setState(ai);
    }

    public void setX(float f)
    {
        mTranslationX = f;
    }

    public void setY(float f)
    {
        mTranslationY = f;
    }

}
