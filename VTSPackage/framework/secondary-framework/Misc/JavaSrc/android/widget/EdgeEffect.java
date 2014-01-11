// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.animation.*;

public class EdgeEffect
{

    private static final float EPSILON = 0.001F;
    private static final float HELD_EDGE_SCALE_Y = 0.5F;
    private static final float MAX_ALPHA = 1F;
    private static final float MAX_GLOW_HEIGHT = 4F;
    private static final int MIN_VELOCITY = 100;
    private static final int MIN_WIDTH = 300;
    private static final int PULL_DECAY_TIME = 1000;
    private static final float PULL_DISTANCE_ALPHA_GLOW_FACTOR = 1.1F;
    private static final int PULL_DISTANCE_EDGE_FACTOR = 7;
    private static final int PULL_DISTANCE_GLOW_FACTOR = 7;
    private static final float PULL_EDGE_BEGIN = 0.6F;
    private static final float PULL_GLOW_BEGIN = 1F;
    private static final int PULL_TIME = 167;
    private static final int RECEDE_TIME = 1000;
    private static final int STATE_ABSORB = 2;
    private static final int STATE_IDLE = 0;
    private static final int STATE_PULL = 1;
    private static final int STATE_PULL_DECAY = 4;
    private static final int STATE_RECEDE = 3;
    private static final String TAG = "EdgeEffect";
    private static final int VELOCITY_EDGE_FACTOR = 8;
    private static final int VELOCITY_GLOW_FACTOR = 16;
    private final Rect mBounds = new Rect();
    private float mDuration;
    private final Drawable mEdge;
    private float mEdgeAlpha;
    private float mEdgeAlphaFinish;
    private float mEdgeAlphaStart;
    private final int mEdgeHeight;
    private float mEdgeScaleY;
    private float mEdgeScaleYFinish;
    private float mEdgeScaleYStart;
    private final Drawable mGlow;
    private float mGlowAlpha;
    private float mGlowAlphaFinish;
    private float mGlowAlphaStart;
    private final int mGlowHeight;
    private float mGlowScaleY;
    private float mGlowScaleYFinish;
    private float mGlowScaleYStart;
    private final int mGlowWidth;
    private int mHeight;
    private final Interpolator mInterpolator = new DecelerateInterpolator();
    private final int mMaxEffectHeight;
    private final int mMinWidth;
    private float mPullDistance;
    private long mStartTime;
    private int mState;
    private int mWidth;
    private int mX;
    private int mY;

    public EdgeEffect(Context context)
    {
        mState = 0;
        Resources resources = context.getResources();
        mEdge = resources.getDrawable(0x1080437);
        mGlow = resources.getDrawable(0x1080438);
        mEdgeHeight = mEdge.getIntrinsicHeight();
        mGlowHeight = 6 * mGlow.getIntrinsicHeight();
        mGlowWidth = 6 * mGlow.getIntrinsicWidth();
        mMaxEffectHeight = (int)(0.5F + Math.min(0.6F * ((4F * (float)mGlowHeight * (float)mGlowHeight) / (float)mGlowWidth), 4F * (float)mGlowHeight));
        mMinWidth = (int)(0.5F + 300F * resources.getDisplayMetrics().density);
    }

    private void update()
    {
        float f = Math.min((float)(AnimationUtils.currentAnimationTimeMillis() - mStartTime) / mDuration, 1.0F);
        float f1 = mInterpolator.getInterpolation(f);
        mEdgeAlpha = mEdgeAlphaStart + f1 * (mEdgeAlphaFinish - mEdgeAlphaStart);
        mEdgeScaleY = mEdgeScaleYStart + f1 * (mEdgeScaleYFinish - mEdgeScaleYStart);
        mGlowAlpha = mGlowAlphaStart + f1 * (mGlowAlphaFinish - mGlowAlphaStart);
        mGlowScaleY = mGlowScaleYStart + f1 * (mGlowScaleYFinish - mGlowScaleYStart);
        if (f >= 0.999F)
            switch (mState)
            {
            case 3: // '\003'
                mState = 0;
                return;

            case 4: // '\004'
                float f2;
                if (mGlowScaleYFinish != 0.0F)
                    f2 = 1.0F / (mGlowScaleYFinish * mGlowScaleYFinish);
                else
                    f2 = 3.402823E+038F;
                mEdgeScaleY = mEdgeScaleYStart + f2 * (f1 * (mEdgeScaleYFinish - mEdgeScaleYStart));
                mState = 3;
                return;

            case 1: // '\001'
                mState = 4;
                mStartTime = AnimationUtils.currentAnimationTimeMillis();
                mDuration = 1000F;
                mEdgeAlphaStart = mEdgeAlpha;
                mEdgeScaleYStart = mEdgeScaleY;
                mGlowAlphaStart = mGlowAlpha;
                mGlowScaleYStart = mGlowScaleY;
                mEdgeAlphaFinish = 0.0F;
                mEdgeScaleYFinish = 0.0F;
                mGlowAlphaFinish = 0.0F;
                mGlowScaleYFinish = 0.0F;
                return;

            case 2: // '\002'
                mState = 3;
                mStartTime = AnimationUtils.currentAnimationTimeMillis();
                mDuration = 1000F;
                mEdgeAlphaStart = mEdgeAlpha;
                mEdgeScaleYStart = mEdgeScaleY;
                mGlowAlphaStart = mGlowAlpha;
                mGlowScaleYStart = mGlowScaleY;
                mEdgeAlphaFinish = 0.0F;
                mEdgeScaleYFinish = 0.0F;
                mGlowAlphaFinish = 0.0F;
                mGlowScaleYFinish = 0.0F;
                return;
            }
    }

    public boolean draw(Canvas canvas)
    {
        update();
        mGlow.setAlpha((int)(255F * Math.max(0.0F, Math.min(mGlowAlpha, 1.0F))));
        int i = (int)Math.min(0.6F * (((float)mGlowHeight * mGlowScaleY * (float)mGlowHeight) / (float)mGlowWidth), 4F * (float)mGlowHeight);
        if (mWidth < mMinWidth)
        {
            int i1 = (mWidth - mMinWidth) / 2;
            mGlow.setBounds(i1, 0, mWidth - i1, i);
        } else
        {
            mGlow.setBounds(0, 0, mWidth, i);
        }
        mGlow.draw(canvas);
        mEdge.setAlpha((int)(255F * Math.max(0.0F, Math.min(mEdgeAlpha, 1.0F))));
        int j = (int)((float)mEdgeHeight * mEdgeScaleY);
        if (mWidth < mMinWidth)
        {
            int l = (mWidth - mMinWidth) / 2;
            mEdge.setBounds(l, 0, mWidth - l, j);
        } else
        {
            mEdge.setBounds(0, 0, mWidth, j);
        }
        mEdge.draw(canvas);
        if (mState == 3 && i == 0 && j == 0)
            mState = 0;
        int k = mState;
        boolean flag = false;
        if (k != 0)
            flag = true;
        return flag;
    }

    public void finish()
    {
        mState = 0;
    }

    public Rect getBounds(boolean flag)
    {
        mBounds.set(0, 0, mWidth, mMaxEffectHeight);
        Rect rect = mBounds;
        int i = mX;
        int j = mY;
        int k = 0;
        if (flag)
            k = mMaxEffectHeight;
        rect.offset(i, j - k);
        return mBounds;
    }

    public boolean isFinished()
    {
        return mState == 0;
    }

    public void onAbsorb(int i)
    {
        mState = 2;
        int j = Math.max(100, Math.abs(i));
        mStartTime = AnimationUtils.currentAnimationTimeMillis();
        mDuration = 0.1F + 0.03F * (float)j;
        mEdgeAlphaStart = 0.0F;
        mEdgeScaleYStart = 0.0F;
        mEdgeScaleY = 0.0F;
        mGlowAlphaStart = 0.5F;
        mGlowScaleYStart = 0.0F;
        mEdgeAlphaFinish = Math.max(0, Math.min(j * 8, 1));
        mEdgeScaleYFinish = Math.max(0.5F, Math.min(j * 8, 1.0F));
        mGlowScaleYFinish = Math.min(0.025F + 0.00015F * (float)(j * (j / 100)), 1.75F);
        mGlowAlphaFinish = Math.max(mGlowAlphaStart, Math.min(1E-005F * (float)(j * 16), 1.0F));
    }

    public void onPull(float f)
    {
        long l = AnimationUtils.currentAnimationTimeMillis();
        if (mState == 4 && (float)(l - mStartTime) < mDuration)
            return;
        if (mState != 1)
            mGlowScaleY = 1.0F;
        mState = 1;
        mStartTime = l;
        mDuration = 167F;
        mPullDistance = f + mPullDistance;
        float f1 = Math.abs(mPullDistance);
        float f2 = Math.max(0.6F, Math.min(f1, 1.0F));
        mEdgeAlphaStart = f2;
        mEdgeAlpha = f2;
        float f3 = Math.max(0.5F, Math.min(f1 * 7F, 1.0F));
        mEdgeScaleYStart = f3;
        mEdgeScaleY = f3;
        float f4 = Math.min(1.0F, mGlowAlpha + 1.1F * Math.abs(f));
        mGlowAlphaStart = f4;
        mGlowAlpha = f4;
        float f5 = Math.abs(f);
        if (f > 0.0F && mPullDistance < 0.0F)
            f5 = -f5;
        if (mPullDistance == 0.0F)
            mGlowScaleY = 0.0F;
        float f6 = Math.min(4F, Math.max(0.0F, mGlowScaleY + f5 * 7F));
        mGlowScaleYStart = f6;
        mGlowScaleY = f6;
        mEdgeAlphaFinish = mEdgeAlpha;
        mEdgeScaleYFinish = mEdgeScaleY;
        mGlowAlphaFinish = mGlowAlpha;
        mGlowScaleYFinish = mGlowScaleY;
    }

    public void onRelease()
    {
        mPullDistance = 0.0F;
        if (mState != 1 && mState != 4)
        {
            return;
        } else
        {
            mState = 3;
            mEdgeAlphaStart = mEdgeAlpha;
            mEdgeScaleYStart = mEdgeScaleY;
            mGlowAlphaStart = mGlowAlpha;
            mGlowScaleYStart = mGlowScaleY;
            mEdgeAlphaFinish = 0.0F;
            mEdgeScaleYFinish = 0.0F;
            mGlowAlphaFinish = 0.0F;
            mGlowScaleYFinish = 0.0F;
            mStartTime = AnimationUtils.currentAnimationTimeMillis();
            mDuration = 1000F;
            return;
        }
    }

    void setPosition(int i, int j)
    {
        mX = i;
        mY = j;
    }

    public void setSize(int i, int j)
    {
        mWidth = i;
        mHeight = j;
    }
}
