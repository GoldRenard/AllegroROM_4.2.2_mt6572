// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.*;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardWidgetPager, KeyguardWidgetFrame, KeyguardViewStateManager

public class KeyguardWidgetCarousel extends KeyguardWidgetPager
{

    private static float CAMERA_DISTANCE = 10000F;
    private static float MAX_SCROLL_PROGRESS = 1.3F;
    private float mAdjacentPagesAngle;
    protected AnimatorSet mChildrenTransformsAnimator;
    Interpolator mFastFadeInterpolator = new Interpolator() {

        float mFactor;
        Interpolator mInternal;
        final KeyguardWidgetCarousel this$0;

        public float getInterpolation(float f)
        {
            return mInternal.getInterpolation(Math.min(f * mFactor, 1.0F));
        }

            
            {
                this$0 = KeyguardWidgetCarousel.this;
                super();
                mInternal = new DecelerateInterpolator(1.5F);
                mFactor = 2.5F;
            }
    }
;
    Interpolator mSlowFadeInterpolator = new Interpolator() {

        float mFactor;
        Interpolator mInternal;
        final KeyguardWidgetCarousel this$0;

        public float getInterpolation(float f)
        {
            float f1 = f - (1.0F - 1.0F / mFactor);
            float f2 = mFactor * Math.max(f1, 0.0F);
            return mInternal.getInterpolation(f2);
        }

            
            {
                this$0 = KeyguardWidgetCarousel.this;
                super();
                mInternal = new AccelerateInterpolator(1.5F);
                mFactor = 1.3F;
            }
    }
;
    float mTmpTransform[];

    public KeyguardWidgetCarousel(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardWidgetCarousel(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardWidgetCarousel(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTmpTransform = new float[3];
        mAdjacentPagesAngle = context.getResources().getInteger(0x10e003f);
    }

    private void getTransformForPage(int i, int j, float af[])
    {
        View view = getChildAt(j);
        float f = getBoundedScrollProgress(i, view, j);
        float f1 = f * -mAdjacentPagesAngle;
        int k = view.getMeasuredWidth();
        float f2 = (float)k / 2.0F + f * ((float)k / 2.0F);
        float f3 = view.getMeasuredHeight() / 2;
        af[0] = f2;
        af[1] = f3;
        af[2] = f1;
    }

    private void updatePageAlphaValues(int i)
    {
        if (mChildrenOutlineFadeAnimation != null)
        {
            mChildrenOutlineFadeAnimation.cancel();
            mChildrenOutlineFadeAnimation = null;
        }
        boolean flag;
        if (!mShowingInitialHints && !isPageMoving())
            flag = false;
        else
            flag = true;
        if (!isReordering(false))
        {
            for (int j = 0; j < getChildCount(); j++)
            {
                KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
                if (keyguardwidgetframe != null)
                {
                    float f = getOutlineAlphaForPage(i, j, flag);
                    float f1 = getAlphaForPage(i, j, flag);
                    keyguardwidgetframe.setBackgroundAlpha(f);
                    keyguardwidgetframe.setContentAlpha(f1);
                }
            }

        }
    }

    void animatePagesToCarousel()
    {
        if (mChildrenTransformsAnimator != null)
        {
            mChildrenTransformsAnimator.cancel();
            mChildrenTransformsAnimator = null;
        }
        int i = getChildCount();
        ArrayList arraylist = new ArrayList();
        for (int j = 0; j < i; j++)
        {
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            float f = getAlphaForPage(mScreenCenter, j, true);
            float f1 = getOutlineAlphaForPage(mScreenCenter, j, true);
            getTransformForPage(mScreenCenter, j, mTmpTransform);
            boolean flag;
            if (j >= -1 + mCurrentPage && j <= 1 + mCurrentPage)
                flag = true;
            else
                flag = false;
            PropertyValuesHolder propertyvaluesholder = PropertyValuesHolder.ofFloat("contentAlpha", new float[] {
                f
            });
            PropertyValuesHolder propertyvaluesholder1 = PropertyValuesHolder.ofFloat("backgroundAlpha", new float[] {
                f1
            });
            float af[] = new float[1];
            af[0] = mTmpTransform[0];
            PropertyValuesHolder propertyvaluesholder2 = PropertyValuesHolder.ofFloat("pivotX", af);
            float af1[] = new float[1];
            af1[0] = mTmpTransform[1];
            PropertyValuesHolder propertyvaluesholder3 = PropertyValuesHolder.ofFloat("pivotY", af1);
            float af2[] = new float[1];
            af2[0] = mTmpTransform[2];
            PropertyValuesHolder propertyvaluesholder4 = PropertyValuesHolder.ofFloat("rotationY", af2);
            ObjectAnimator objectanimator;
            if (flag)
            {
                objectanimator = ObjectAnimator.ofPropertyValuesHolder(keyguardwidgetframe, new PropertyValuesHolder[] {
                    propertyvaluesholder, propertyvaluesholder1, propertyvaluesholder2, propertyvaluesholder3, propertyvaluesholder4
                });
            } else
            {
                objectanimator = ObjectAnimator.ofPropertyValuesHolder(keyguardwidgetframe, new PropertyValuesHolder[] {
                    propertyvaluesholder, propertyvaluesholder1
                });
                objectanimator.setInterpolator(mFastFadeInterpolator);
            }
            arraylist.add(objectanimator);
        }

        int k = REORDERING_ZOOM_IN_OUT_DURATION;
        mChildrenTransformsAnimator = new AnimatorSet();
        mChildrenTransformsAnimator.playTogether(arraylist);
        mChildrenTransformsAnimator.setDuration(k);
        mChildrenTransformsAnimator.start();
    }

    void animatePagesToNeutral()
    {
        if (mChildrenTransformsAnimator != null)
        {
            mChildrenTransformsAnimator.cancel();
            mChildrenTransformsAnimator = null;
        }
        int i = getChildCount();
        ArrayList arraylist = new ArrayList();
        for (int j = 0; j < i; j++)
        {
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            boolean flag;
            if (j >= -1 + mCurrentPage && j <= 1 + mCurrentPage)
                flag = true;
            else
                flag = false;
            if (!flag)
                keyguardwidgetframe.setRotationY(0.0F);
            ObjectAnimator objectanimator = ObjectAnimator.ofPropertyValuesHolder(keyguardwidgetframe, new PropertyValuesHolder[] {
                PropertyValuesHolder.ofFloat("contentAlpha", new float[] {
                    1.0F
                }), PropertyValuesHolder.ofFloat("backgroundAlpha", new float[] {
                    0.6F
                }), PropertyValuesHolder.ofFloat("rotationY", new float[] {
                    0.0F
                })
            });
            keyguardwidgetframe.setVisibility(0);
            if (!flag)
                objectanimator.setInterpolator(mSlowFadeInterpolator);
            arraylist.add(objectanimator);
        }

        int k = REORDERING_ZOOM_IN_OUT_DURATION;
        mChildrenTransformsAnimator = new AnimatorSet();
        mChildrenTransformsAnimator.playTogether(arraylist);
        mChildrenTransformsAnimator.setDuration(k);
        mChildrenTransformsAnimator.start();
    }

    public float getAlphaForPage(int i, int j, boolean flag)
    {
        View view = getChildAt(j);
        if (view != null)
        {
            boolean flag1;
            if (j >= -1 + getNextPage() && j <= 1 + getNextPage())
                flag1 = true;
            else
                flag1 = false;
            if (isOverScrollChild(j, getScrollProgress(i, view, j)))
                return 1.0F;
            if (flag && flag1 || j == getNextPage())
                return 1.0F - 1.0F * Math.abs(getBoundedScrollProgress(i, view, j) / MAX_SCROLL_PROGRESS);
        }
        return 0.0F;
    }

    protected float getMaxScrollProgress()
    {
        return MAX_SCROLL_PROGRESS;
    }

    public float getOutlineAlphaForPage(int i, int j, boolean flag)
    {
        boolean flag1;
        if (j >= -1 + getNextPage() && j <= 1 + getNextPage())
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
            return super.getOutlineAlphaForPage(i, j, flag);
        else
            return 0.0F;
    }

    protected void onEndReordering()
    {
        super.onEndReordering();
        mViewStateManager.fadeInSecurity(REORDERING_ZOOM_IN_OUT_DURATION);
    }

    protected void reorderStarting()
    {
        mViewStateManager.fadeOutSecurity(REORDERING_ZOOM_IN_OUT_DURATION);
        animatePagesToNeutral();
    }

    protected void screenScrolled(int i)
    {
        mScreenCenter = i;
        updatePageAlphaValues(i);
        if (!isReordering(false))
        {
            for (int j = 0; j < getChildCount(); j++)
            {
                KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
                float f = getScrollProgress(i, keyguardwidgetframe, j);
                float f1 = getBoundedScrollProgress(i, keyguardwidgetframe, j);
                if (keyguardwidgetframe == mDragView || keyguardwidgetframe == null)
                    continue;
                keyguardwidgetframe.setCameraDistance(CAMERA_DISTANCE);
                if (isOverScrollChild(j, f))
                {
                    keyguardwidgetframe.setRotationY(f * -OVERSCROLL_MAX_ROTATION);
                    float f5 = Math.abs(f);
                    boolean flag;
                    if (f < 0.0F)
                        flag = true;
                    else
                        flag = false;
                    keyguardwidgetframe.setOverScrollAmount(f5, flag);
                } else
                {
                    int k = keyguardwidgetframe.getMeasuredWidth();
                    float f2 = (float)k / 2.0F + f1 * ((float)k / 2.0F);
                    float f3 = keyguardwidgetframe.getMeasuredHeight() / 2;
                    float f4 = f1 * -mAdjacentPagesAngle;
                    keyguardwidgetframe.setPivotX(f2);
                    keyguardwidgetframe.setPivotY(f3);
                    keyguardwidgetframe.setRotationY(f4);
                    keyguardwidgetframe.setOverScrollAmount(0.0F, false);
                }
                if (keyguardwidgetframe.getAlpha() == 0.0F)
                {
                    keyguardwidgetframe.setVisibility(4);
                    continue;
                }
                if (keyguardwidgetframe.getVisibility() != 0)
                    keyguardwidgetframe.setVisibility(0);
            }

        }
    }

    public void showInitialPageHints()
    {
        mShowingInitialHints = true;
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            boolean flag;
            if (j >= -1 + getNextPage() && j <= 1 + getNextPage())
                flag = true;
            else
                flag = false;
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            if (flag)
            {
                keyguardwidgetframe.setBackgroundAlpha(0.6F);
                keyguardwidgetframe.setContentAlpha(1.0F);
            } else
            {
                keyguardwidgetframe.setBackgroundAlpha(0.0F);
                keyguardwidgetframe.setContentAlpha(0.0F);
            }
        }

    }

    protected boolean zoomIn(Runnable runnable)
    {
        animatePagesToCarousel();
        return super.zoomIn(runnable);
    }

}
