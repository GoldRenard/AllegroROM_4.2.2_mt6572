// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.animation.*;
import java.util.*;

// Referenced classes of package android.view:
//            View, DisplayList

public class ViewPropertyAnimator
{
    private class AnimatorEventListener
        implements android.animation.Animator.AnimatorListener, android.animation.ValueAnimator.AnimatorUpdateListener
    {

        final ViewPropertyAnimator this$0;

        public void onAnimationCancel(Animator animator)
        {
            if (mListener != null)
                mListener.onAnimationCancel(animator);
            if (mAnimatorOnEndMap != null)
                mAnimatorOnEndMap.remove(animator);
        }

        public void onAnimationEnd(Animator animator)
        {
            mView.setHasTransientState(false);
            if (mListener != null)
                mListener.onAnimationEnd(animator);
            if (mAnimatorOnEndMap != null)
            {
                Runnable runnable1 = (Runnable)mAnimatorOnEndMap.get(animator);
                if (runnable1 != null)
                    runnable1.run();
                mAnimatorOnEndMap.remove(animator);
            }
            if (mAnimatorCleanupMap != null)
            {
                Runnable runnable = (Runnable)mAnimatorCleanupMap.get(animator);
                if (runnable != null)
                    runnable.run();
                mAnimatorCleanupMap.remove(animator);
            }
            mAnimatorMap.remove(animator);
        }

        public void onAnimationRepeat(Animator animator)
        {
            if (mListener != null)
                mListener.onAnimationRepeat(animator);
        }

        public void onAnimationStart(Animator animator)
        {
            if (mAnimatorSetupMap != null)
            {
                Runnable runnable1 = (Runnable)mAnimatorSetupMap.get(animator);
                if (runnable1 != null)
                    runnable1.run();
                mAnimatorSetupMap.remove(animator);
            }
            if (mAnimatorOnStartMap != null)
            {
                Runnable runnable = (Runnable)mAnimatorOnStartMap.get(animator);
                if (runnable != null)
                    runnable.run();
                mAnimatorOnStartMap.remove(animator);
            }
            if (mListener != null)
                mListener.onAnimationStart(animator);
        }

        public void onAnimationUpdate(ValueAnimator valueanimator)
        {
            PropertyBundle propertybundle = (PropertyBundle)mAnimatorMap.get(valueanimator);
            if (propertybundle == null)
                return;
            boolean flag;
            if (mView.mDisplayList != null)
                flag = true;
            else
                flag = false;
            if (!flag)
                mView.invalidateParentCaches();
            float f = valueanimator.getAnimatedFraction();
            int i = propertybundle.mPropertyMask;
            if ((i & 0x1ff) != 0)
                mView.invalidateViewProperty(false, false);
            ArrayList arraylist = propertybundle.mNameValuesHolder;
            boolean flag1 = false;
            if (arraylist != null)
            {
                int j = arraylist.size();
                for (int k = 0; k < j; k++)
                {
                    NameValuesHolder namevaluesholder = (NameValuesHolder)arraylist.get(k);
                    float f1 = namevaluesholder.mFromValue + f * namevaluesholder.mDeltaValue;
                    if (namevaluesholder.mNameConstant == 512)
                        flag1 = mView.setAlphaNoInvalidation(f1);
                    else
                        setValue(namevaluesholder.mNameConstant, f1);
                }

            }
            if ((i & 0x1ff) != 0)
            {
                mView.mTransformationInfo.mMatrixDirty = true;
                if (!flag)
                {
                    View view = mView;
                    view.mPrivateFlags = 0x20 | view.mPrivateFlags;
                }
            }
            if (flag1)
            {
                mView.invalidate(true);
                return;
            } else
            {
                mView.invalidateViewProperty(false, false);
                return;
            }
        }

        private AnimatorEventListener()
        {
            this$0 = ViewPropertyAnimator.this;
            super();
        }

    }

    private static class NameValuesHolder
    {

        float mDeltaValue;
        float mFromValue;
        int mNameConstant;

        NameValuesHolder(int i, float f, float f1)
        {
            mNameConstant = i;
            mFromValue = f;
            mDeltaValue = f1;
        }
    }

    private static class PropertyBundle
    {

        ArrayList mNameValuesHolder;
        int mPropertyMask;

        boolean cancel(int i)
        {
            if ((i & mPropertyMask) != 0 && mNameValuesHolder != null)
            {
                int j = mNameValuesHolder.size();
                for (int k = 0; k < j; k++)
                    if (((NameValuesHolder)mNameValuesHolder.get(k)).mNameConstant == i)
                    {
                        mNameValuesHolder.remove(k);
                        mPropertyMask = mPropertyMask & ~i;
                        return true;
                    }

            }
            return false;
        }

        PropertyBundle(int i, ArrayList arraylist)
        {
            mPropertyMask = i;
            mNameValuesHolder = arraylist;
        }
    }


    private static final int ALPHA = 512;
    private static final int NONE = 0;
    private static final int ROTATION = 16;
    private static final int ROTATION_X = 32;
    private static final int ROTATION_Y = 64;
    private static final int SCALE_X = 4;
    private static final int SCALE_Y = 8;
    private static final int TRANSFORM_MASK = 511;
    private static final int TRANSLATION_X = 1;
    private static final int TRANSLATION_Y = 2;
    private static final int X = 128;
    private static final int Y = 256;
    private Runnable mAnimationStarter;
    private HashMap mAnimatorCleanupMap;
    private AnimatorEventListener mAnimatorEventListener;
    private HashMap mAnimatorMap;
    private HashMap mAnimatorOnEndMap;
    private HashMap mAnimatorOnStartMap;
    private HashMap mAnimatorSetupMap;
    private long mDuration;
    private boolean mDurationSet;
    private TimeInterpolator mInterpolator;
    private boolean mInterpolatorSet;
    private android.animation.Animator.AnimatorListener mListener;
    ArrayList mPendingAnimations;
    private Runnable mPendingCleanupAction;
    private Runnable mPendingOnEndAction;
    private Runnable mPendingOnStartAction;
    private Runnable mPendingSetupAction;
    private long mStartDelay;
    private boolean mStartDelaySet;
    private final View mView;

    ViewPropertyAnimator(View view)
    {
        mDurationSet = false;
        mStartDelay = 0L;
        mStartDelaySet = false;
        mInterpolatorSet = false;
        mListener = null;
        mAnimatorEventListener = new AnimatorEventListener();
        mPendingAnimations = new ArrayList();
        mAnimationStarter = new Runnable() {

            final ViewPropertyAnimator this$0;

            public void run()
            {
                startAnimation();
            }

            
            {
                this$0 = ViewPropertyAnimator.this;
                super();
            }
        }
;
        mAnimatorMap = new HashMap();
        mView = view;
        view.ensureTransformationInfo();
    }

    private void animateProperty(int i, float f)
    {
        float f1 = getValue(i);
        animatePropertyBy(i, f1, f - f1);
    }

    private void animatePropertyBy(int i, float f)
    {
        animatePropertyBy(i, getValue(i), f);
    }

    private void animatePropertyBy(int i, float f, float f1)
    {
        if (mAnimatorMap.size() > 0)
        {
            Iterator iterator = mAnimatorMap.keySet().iterator();
            Animator animator;
            do
            {
                boolean flag = iterator.hasNext();
                animator = null;
                if (!flag)
                    break;
                Animator animator1 = (Animator)iterator.next();
                PropertyBundle propertybundle = (PropertyBundle)mAnimatorMap.get(animator1);
                if (!propertybundle.cancel(i) || propertybundle.mPropertyMask != 0)
                    continue;
                animator = animator1;
                break;
            } while (true);
            if (animator != null)
                animator.cancel();
        }
        NameValuesHolder namevaluesholder = new NameValuesHolder(i, f, f1);
        mPendingAnimations.add(namevaluesholder);
        mView.removeCallbacks(mAnimationStarter);
        mView.post(mAnimationStarter);
    }

    private float getValue(int i)
    {
        View.TransformationInfo transformationinfo = mView.mTransformationInfo;
        switch (i)
        {
        case 512: 
            return transformationinfo.mAlpha;

        case 256: 
            return (float)mView.mTop + transformationinfo.mTranslationY;

        case 128: 
            return (float)mView.mLeft + transformationinfo.mTranslationX;

        case 8: // '\b'
            return transformationinfo.mScaleY;

        case 4: // '\004'
            return transformationinfo.mScaleX;

        case 64: // '@'
            return transformationinfo.mRotationY;

        case 32: // ' '
            return transformationinfo.mRotationX;

        case 16: // '\020'
            return transformationinfo.mRotation;

        case 2: // '\002'
            return transformationinfo.mTranslationY;

        case 1: // '\001'
            return transformationinfo.mTranslationX;
        }
        return 0.0F;
    }

    private void setValue(int i, float f)
    {
        View.TransformationInfo transformationinfo = mView.mTransformationInfo;
        DisplayList displaylist = mView.mDisplayList;
        switch (i)
        {
        default:
            break;

        case 512: 
            transformationinfo.mAlpha = f;
            if (displaylist != null)
            {
                displaylist.setAlpha(f);
                return;
            }
            break;

        case 256: 
            transformationinfo.mTranslationY = f - (float)mView.mTop;
            if (displaylist != null)
            {
                displaylist.setTranslationY(f - (float)mView.mTop);
                return;
            }
            break;

        case 128: 
            transformationinfo.mTranslationX = f - (float)mView.mLeft;
            if (displaylist != null)
            {
                displaylist.setTranslationX(f - (float)mView.mLeft);
                return;
            }
            break;

        case 8: // '\b'
            transformationinfo.mScaleY = f;
            if (displaylist != null)
            {
                displaylist.setScaleY(f);
                return;
            }
            break;

        case 4: // '\004'
            transformationinfo.mScaleX = f;
            if (displaylist != null)
            {
                displaylist.setScaleX(f);
                return;
            }
            break;

        case 64: // '@'
            transformationinfo.mRotationY = f;
            if (displaylist != null)
            {
                displaylist.setRotationY(f);
                return;
            }
            break;

        case 32: // ' '
            transformationinfo.mRotationX = f;
            if (displaylist != null)
            {
                displaylist.setRotationX(f);
                return;
            }
            break;

        case 16: // '\020'
            transformationinfo.mRotation = f;
            if (displaylist != null)
            {
                displaylist.setRotation(f);
                return;
            }
            break;

        case 2: // '\002'
            transformationinfo.mTranslationY = f;
            if (displaylist != null)
            {
                displaylist.setTranslationY(f);
                return;
            }
            break;

        case 1: // '\001'
            transformationinfo.mTranslationX = f;
            if (displaylist != null)
            {
                displaylist.setTranslationX(f);
                return;
            }
            break;
        }
    }

    private void startAnimation()
    {
        mView.setHasTransientState(true);
        ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
            1.0F
        });
        ArrayList arraylist = (ArrayList)mPendingAnimations.clone();
        mPendingAnimations.clear();
        int i = 0;
        int j = arraylist.size();
        for (int k = 0; k < j; k++)
            i |= ((NameValuesHolder)arraylist.get(k)).mNameConstant;

        mAnimatorMap.put(valueanimator, new PropertyBundle(i, arraylist));
        if (mPendingSetupAction != null)
        {
            mAnimatorSetupMap.put(valueanimator, mPendingSetupAction);
            mPendingSetupAction = null;
        }
        if (mPendingCleanupAction != null)
        {
            mAnimatorCleanupMap.put(valueanimator, mPendingCleanupAction);
            mPendingCleanupAction = null;
        }
        if (mPendingOnStartAction != null)
        {
            mAnimatorOnStartMap.put(valueanimator, mPendingOnStartAction);
            mPendingOnStartAction = null;
        }
        if (mPendingOnEndAction != null)
        {
            mAnimatorOnEndMap.put(valueanimator, mPendingOnEndAction);
            mPendingOnEndAction = null;
        }
        valueanimator.addUpdateListener(mAnimatorEventListener);
        valueanimator.addListener(mAnimatorEventListener);
        if (mStartDelaySet)
            valueanimator.setStartDelay(mStartDelay);
        if (mDurationSet)
            valueanimator.setDuration(mDuration);
        if (mInterpolatorSet)
            valueanimator.setInterpolator(mInterpolator);
        valueanimator.start();
    }

    public ViewPropertyAnimator alpha(float f)
    {
        animateProperty(512, f);
        return this;
    }

    public ViewPropertyAnimator alphaBy(float f)
    {
        animatePropertyBy(512, f);
        return this;
    }

    public void cancel()
    {
        if (mAnimatorMap.size() > 0)
        {
            for (Iterator iterator = ((HashMap)mAnimatorMap.clone()).keySet().iterator(); iterator.hasNext(); ((Animator)iterator.next()).cancel());
        }
        mPendingAnimations.clear();
        mView.removeCallbacks(mAnimationStarter);
    }

    public long getDuration()
    {
        if (mDurationSet)
            return mDuration;
        else
            return (new ValueAnimator()).getDuration();
    }

    public long getStartDelay()
    {
        if (mStartDelaySet)
            return mStartDelay;
        else
            return 0L;
    }

    public ViewPropertyAnimator rotation(float f)
    {
        animateProperty(16, f);
        return this;
    }

    public ViewPropertyAnimator rotationBy(float f)
    {
        animatePropertyBy(16, f);
        return this;
    }

    public ViewPropertyAnimator rotationX(float f)
    {
        animateProperty(32, f);
        return this;
    }

    public ViewPropertyAnimator rotationXBy(float f)
    {
        animatePropertyBy(32, f);
        return this;
    }

    public ViewPropertyAnimator rotationY(float f)
    {
        animateProperty(64, f);
        return this;
    }

    public ViewPropertyAnimator rotationYBy(float f)
    {
        animatePropertyBy(64, f);
        return this;
    }

    public ViewPropertyAnimator scaleX(float f)
    {
        animateProperty(4, f);
        return this;
    }

    public ViewPropertyAnimator scaleXBy(float f)
    {
        animatePropertyBy(4, f);
        return this;
    }

    public ViewPropertyAnimator scaleY(float f)
    {
        animateProperty(8, f);
        return this;
    }

    public ViewPropertyAnimator scaleYBy(float f)
    {
        animatePropertyBy(8, f);
        return this;
    }

    public ViewPropertyAnimator setDuration(long l)
    {
        if (l < 0L)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Animators cannot have negative duration: ").append(l).toString());
        } else
        {
            mDurationSet = true;
            mDuration = l;
            return this;
        }
    }

    public ViewPropertyAnimator setInterpolator(TimeInterpolator timeinterpolator)
    {
        mInterpolatorSet = true;
        mInterpolator = timeinterpolator;
        return this;
    }

    public ViewPropertyAnimator setListener(android.animation.Animator.AnimatorListener animatorlistener)
    {
        mListener = animatorlistener;
        return this;
    }

    public ViewPropertyAnimator setStartDelay(long l)
    {
        if (l < 0L)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Animators cannot have negative duration: ").append(l).toString());
        } else
        {
            mStartDelaySet = true;
            mStartDelay = l;
            return this;
        }
    }

    public void start()
    {
        mView.removeCallbacks(mAnimationStarter);
        startAnimation();
    }

    public ViewPropertyAnimator translationX(float f)
    {
        animateProperty(1, f);
        return this;
    }

    public ViewPropertyAnimator translationXBy(float f)
    {
        animatePropertyBy(1, f);
        return this;
    }

    public ViewPropertyAnimator translationY(float f)
    {
        animateProperty(2, f);
        return this;
    }

    public ViewPropertyAnimator translationYBy(float f)
    {
        animatePropertyBy(2, f);
        return this;
    }

    public ViewPropertyAnimator withEndAction(Runnable runnable)
    {
        mPendingOnEndAction = runnable;
        if (runnable != null && mAnimatorOnEndMap == null)
            mAnimatorOnEndMap = new HashMap();
        return this;
    }

    public ViewPropertyAnimator withLayer()
    {
        mPendingSetupAction = new Runnable() {

            final ViewPropertyAnimator this$0;

            public void run()
            {
                mView.setLayerType(2, null);
            }

            
            {
                this$0 = ViewPropertyAnimator.this;
                super();
            }
        }
;
        mPendingCleanupAction = new Runnable() {

            final ViewPropertyAnimator this$0;
            final int val$currentLayerType;

            public void run()
            {
                mView.setLayerType(currentLayerType, null);
            }

            
            {
                this$0 = ViewPropertyAnimator.this;
                currentLayerType = i;
                super();
            }
        }
;
        if (mAnimatorSetupMap == null)
            mAnimatorSetupMap = new HashMap();
        if (mAnimatorCleanupMap == null)
            mAnimatorCleanupMap = new HashMap();
        return this;
    }

    public ViewPropertyAnimator withStartAction(Runnable runnable)
    {
        mPendingOnStartAction = runnable;
        if (runnable != null && mAnimatorOnStartMap == null)
            mAnimatorOnStartMap = new HashMap();
        return this;
    }

    public ViewPropertyAnimator x(float f)
    {
        animateProperty(128, f);
        return this;
    }

    public ViewPropertyAnimator xBy(float f)
    {
        animatePropertyBy(128, f);
        return this;
    }

    public ViewPropertyAnimator y(float f)
    {
        animateProperty(256, f);
        return this;
    }

    public ViewPropertyAnimator yBy(float f)
    {
        animatePropertyBy(256, f);
        return this;
    }









}
