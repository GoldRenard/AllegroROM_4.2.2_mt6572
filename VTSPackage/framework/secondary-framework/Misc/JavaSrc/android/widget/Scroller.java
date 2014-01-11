// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.util.FloatMath;
import android.view.ViewConfiguration;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;

public class Scroller
{

    private static float DECELERATION_RATE = 0F;
    private static final int DEFAULT_DURATION = 250;
    private static final float END_TENSION = 1F;
    private static final int FLING_MODE = 1;
    private static final float INFLEXION = 0.35F;
    private static final int NB_SAMPLES = 100;
    private static final float P1 = 0.175F;
    private static final float P2 = 0.35F;
    private static final int SCROLL_MODE = 0;
    private static final float SPLINE_POSITION[];
    private static final float SPLINE_TIME[];
    private static final float START_TENSION = 0.5F;
    private static float sViscousFluidNormalize;
    private static float sViscousFluidScale;
    private float mCurrVelocity;
    private int mCurrX;
    private int mCurrY;
    private float mDeceleration;
    private float mDeltaX;
    private float mDeltaY;
    private int mDistance;
    private int mDuration;
    private float mDurationReciprocal;
    private int mFinalX;
    private int mFinalY;
    private boolean mFinished;
    private float mFlingFriction;
    private boolean mFlywheel;
    private Interpolator mInterpolator;
    private int mMaxX;
    private int mMaxY;
    private int mMinX;
    private int mMinY;
    private int mMode;
    private float mPhysicalCoeff;
    private final float mPpi;
    private long mStartTime;
    private int mStartX;
    private int mStartY;
    private float mVelocity;

    public Scroller(Context context)
    {
        this(context, null);
    }

    public Scroller(Context context, Interpolator interpolator)
    {
        boolean flag;
        if (context.getApplicationInfo().targetSdkVersion >= 11)
            flag = true;
        else
            flag = false;
        this(context, interpolator, flag);
    }

    public Scroller(Context context, Interpolator interpolator, boolean flag)
    {
        mFlingFriction = ViewConfiguration.getScrollFriction();
        mFinished = true;
        mInterpolator = interpolator;
        mPpi = 160F * context.getResources().getDisplayMetrics().density;
        mDeceleration = computeDeceleration(ViewConfiguration.getScrollFriction());
        mFlywheel = flag;
        mPhysicalCoeff = computeDeceleration(0.84F);
    }

    private float computeDeceleration(float f)
    {
        return f * (386.0878F * mPpi);
    }

    private double getSplineDeceleration(float f)
    {
        return Math.log((0.35F * Math.abs(f)) / (mFlingFriction * mPhysicalCoeff));
    }

    private double getSplineFlingDistance(float f)
    {
        double d = getSplineDeceleration(f);
        double d1 = (double)DECELERATION_RATE - 1.0D;
        return (double)(mFlingFriction * mPhysicalCoeff) * Math.exp(d * ((double)DECELERATION_RATE / d1));
    }

    private int getSplineFlingDuration(float f)
    {
        return (int)(1000D * Math.exp(getSplineDeceleration(f) / ((double)DECELERATION_RATE - 1.0D)));
    }

    static float viscousFluid(float f)
    {
        float f1 = f * sViscousFluidScale;
        float f2;
        if (f1 < 1.0F)
            f2 = f1 - (1.0F - (float)Math.exp(-f1));
        else
            f2 = 0.3678795F + (1.0F - (float)Math.exp(1.0F - f1)) * (1.0F - 0.3678795F);
        return f2 * sViscousFluidNormalize;
    }

    public void abortAnimation()
    {
        mCurrX = mFinalX;
        mCurrY = mFinalY;
        mFinished = true;
    }

    public boolean computeScrollOffset()
    {
        if (mFinished)
            return false;
        int i = (int)(AnimationUtils.currentAnimationTimeMillis() - mStartTime);
        if (i < mDuration)
        {
            switch (mMode)
            {
            case 1: // '\001'
                float f2 = (float)i / (float)mDuration;
                int j = (int)(100F * f2);
                float f3 = 1.0F;
                float f4 = 0.0F;
                if (j < 100)
                {
                    float f5 = (float)j / 100F;
                    float f6 = (float)(j + 1) / 100F;
                    float f7 = SPLINE_POSITION[j];
                    f4 = (SPLINE_POSITION[j + 1] - f7) / (f6 - f5);
                    f3 = f7 + f4 * (f2 - f5);
                }
                mCurrVelocity = 1000F * ((f4 * (float)mDistance) / (float)mDuration);
                mCurrX = mStartX + Math.round(f3 * (float)(mFinalX - mStartX));
                mCurrX = Math.min(mCurrX, mMaxX);
                mCurrX = Math.max(mCurrX, mMinX);
                mCurrY = mStartY + Math.round(f3 * (float)(mFinalY - mStartY));
                mCurrY = Math.min(mCurrY, mMaxY);
                mCurrY = Math.max(mCurrY, mMinY);
                if (mCurrX == mFinalX && mCurrY == mFinalY)
                    mFinished = true;
                break;

            case 0: // '\0'
                float f = (float)i * mDurationReciprocal;
                float f1;
                if (mInterpolator == null)
                    f1 = viscousFluid(f);
                else
                    f1 = mInterpolator.getInterpolation(f);
                mCurrX = mStartX + Math.round(f1 * mDeltaX);
                mCurrY = mStartY + Math.round(f1 * mDeltaY);
                break;
            }
        } else
        {
            mCurrX = mFinalX;
            mCurrY = mFinalY;
            mFinished = true;
        }
        return true;
    }

    public void extendDuration(int i)
    {
        mDuration = i + timePassed();
        mDurationReciprocal = 1.0F / (float)mDuration;
        mFinished = false;
    }

    public void fling(int i, int j, int k, int l, int i1, int j1, int k1, 
            int l1)
    {
        if (mFlywheel && !mFinished)
        {
            float f3 = getCurrVelocity();
            float f4 = mFinalX - mStartX;
            float f5 = mFinalY - mStartY;
            float f6 = FloatMath.sqrt(f4 * f4 + f5 * f5);
            float f7 = f4 / f6;
            float f8 = f5 / f6;
            float f9 = f7 * f3;
            float f10 = f8 * f3;
            if (Math.signum(k) == Math.signum(f9) && Math.signum(l) == Math.signum(f10))
            {
                k = (int)(f9 + (float)k);
                l = (int)(f10 + (float)l);
            }
        }
        mMode = 1;
        mFinished = false;
        float f = FloatMath.sqrt(k * k + l * l);
        mVelocity = f;
        mDuration = getSplineFlingDuration(f);
        mStartTime = AnimationUtils.currentAnimationTimeMillis();
        mStartX = i;
        mStartY = j;
        float f1;
        if (f == 0.0F)
            f1 = 1.0F;
        else
            f1 = (float)k / f;
        float f2;
        if (f == 0.0F)
            f2 = 1.0F;
        else
            f2 = (float)l / f;
        double d = getSplineFlingDistance(f);
        mDistance = (int)(d * (double)Math.signum(f));
        mMinX = i1;
        mMaxX = j1;
        mMinY = k1;
        mMaxY = l1;
        mFinalX = i + (int)Math.round(d * (double)f1);
        mFinalX = Math.min(mFinalX, mMaxX);
        mFinalX = Math.max(mFinalX, mMinX);
        mFinalY = j + (int)Math.round(d * (double)f2);
        mFinalY = Math.min(mFinalY, mMaxY);
        mFinalY = Math.max(mFinalY, mMinY);
    }

    public final void forceFinished(boolean flag)
    {
        mFinished = flag;
    }

    public float getCurrVelocity()
    {
        if (mMode == 1)
            return mCurrVelocity;
        else
            return mVelocity - (mDeceleration * (float)timePassed()) / 2000F;
    }

    public final int getCurrX()
    {
        return mCurrX;
    }

    public final int getCurrY()
    {
        return mCurrY;
    }

    public final int getDuration()
    {
        return mDuration;
    }

    public final int getFinalX()
    {
        return mFinalX;
    }

    public final int getFinalY()
    {
        return mFinalY;
    }

    public final int getStartX()
    {
        return mStartX;
    }

    public final int getStartY()
    {
        return mStartY;
    }

    public final boolean isFinished()
    {
        return mFinished;
    }

    public boolean isScrollingInDirection(float f, float f1)
    {
        return !mFinished && Math.signum(f) == Math.signum(mFinalX - mStartX) && Math.signum(f1) == Math.signum(mFinalY - mStartY);
    }

    public void setFinalX(int i)
    {
        mFinalX = i;
        mDeltaX = mFinalX - mStartX;
        mFinished = false;
    }

    public void setFinalY(int i)
    {
        mFinalY = i;
        mDeltaY = mFinalY - mStartY;
        mFinished = false;
    }

    public final void setFriction(float f)
    {
        mDeceleration = computeDeceleration(f);
        mFlingFriction = f;
    }

    public void startScroll(int i, int j, int k, int l)
    {
        startScroll(i, j, k, l, 250);
    }

    public void startScroll(int i, int j, int k, int l, int i1)
    {
        mMode = 0;
        mFinished = false;
        mDuration = i1;
        mStartTime = AnimationUtils.currentAnimationTimeMillis();
        mStartX = i;
        mStartY = j;
        mFinalX = i + k;
        mFinalY = j + l;
        mDeltaX = k;
        mDeltaY = l;
        mDurationReciprocal = 1.0F / (float)mDuration;
    }

    public int timePassed()
    {
        return (int)(AnimationUtils.currentAnimationTimeMillis() - mStartTime);
    }

    static 
    {
        DECELERATION_RATE = (float)(Math.log(0.78000000000000003D) / Math.log(0.90000000000000002D));
        SPLINE_POSITION = new float[101];
        SPLINE_TIME = new float[101];
        float f = 0.0F;
        float f1 = 0.0F;
        int i = 0;
label0:
        do
        {
            if (i < 100)
            {
                float f2 = (float)i / 100F;
                float f3 = 1.0F;
                do
                {
                    float f4 = f + (f3 - f) / 2.0F;
                    float f5 = 3F * f4 * (1.0F - f4);
                    float f6 = f5 * (0.175F * (1.0F - f4) + 0.35F * f4) + f4 * (f4 * f4);
                    if ((double)Math.abs(f6 - f2) < 1.0000000000000001E-005D)
                    {
                        SPLINE_POSITION[i] = f5 * (f4 + 0.5F * (1.0F - f4)) + f4 * (f4 * f4);
                        float f7 = 1.0F;
                        do
                        {
                            float f8 = f1 + (f7 - f1) / 2.0F;
                            float f9 = 3F * f8 * (1.0F - f8);
                            float f10 = f9 * (f8 + 0.5F * (1.0F - f8)) + f8 * (f8 * f8);
                            if ((double)Math.abs(f10 - f2) < 1.0000000000000001E-005D)
                            {
                                SPLINE_TIME[i] = f9 * (0.175F * (1.0F - f8) + 0.35F * f8) + f8 * (f8 * f8);
                                i++;
                                continue label0;
                            }
                            if (f10 > f2)
                                f7 = f8;
                            else
                                f1 = f8;
                        } while (true);
                    }
                    if (f6 > f2)
                        f3 = f4;
                    else
                        f = f4;
                } while (true);
            }
            float af[] = SPLINE_POSITION;
            SPLINE_TIME[100] = 1.0F;
            af[100] = 1.0F;
            sViscousFluidScale = 8F;
            sViscousFluidNormalize = 1.0F;
            sViscousFluidNormalize = 1.0F / viscousFluid(1.0F);
        } while (true);
    }
}
