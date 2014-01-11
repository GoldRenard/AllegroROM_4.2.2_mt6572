// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import java.util.Random;

// Referenced classes of package android.view.animation:
//            Animation, LinearInterpolator, Interpolator, AnimationUtils

public class LayoutAnimationController
{
    public static class AnimationParameters
    {

        public int count;
        public int index;

    }


    public static final int ORDER_NORMAL = 0;
    public static final int ORDER_RANDOM = 2;
    public static final int ORDER_REVERSE = 1;
    protected Animation mAnimation;
    private float mDelay;
    private long mDuration;
    protected Interpolator mInterpolator;
    private long mMaxDelay;
    private int mOrder;
    protected Random mRandomizer;

    public LayoutAnimationController(Context context, AttributeSet attributeset)
    {
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.LayoutAnimation);
        mDelay = Animation.Description.parseValue(typedarray.peekValue(1)).value;
        mOrder = typedarray.getInt(3, 0);
        int i = typedarray.getResourceId(2, 0);
        if (i > 0)
            setAnimation(context, i);
        int j = typedarray.getResourceId(0, 0);
        if (j > 0)
            setInterpolator(context, j);
        typedarray.recycle();
    }

    public LayoutAnimationController(Animation animation)
    {
        this(animation, 0.5F);
    }

    public LayoutAnimationController(Animation animation, float f)
    {
        mDelay = f;
        setAnimation(animation);
    }

    public Animation getAnimation()
    {
        return mAnimation;
    }

    public final Animation getAnimationForView(View view)
    {
        long l = getDelayForView(view) + mAnimation.getStartOffset();
        mMaxDelay = Math.max(mMaxDelay, l);
        Animation animation;
        try
        {
            animation = mAnimation.clone();
            animation.setStartOffset(l);
        }
        catch (CloneNotSupportedException clonenotsupportedexception)
        {
            return null;
        }
        return animation;
    }

    public float getDelay()
    {
        return mDelay;
    }

    protected long getDelayForView(View view)
    {
        AnimationParameters animationparameters = view.getLayoutParams().layoutAnimationParameters;
        if (animationparameters == null)
            return 0L;
        float f = mDelay * (float)mAnimation.getDuration();
        long l = (long)(f * (float)getTransformedIndex(animationparameters));
        float f1 = f * (float)animationparameters.count;
        if (mInterpolator == null)
            mInterpolator = new LinearInterpolator();
        float f2 = (float)l / f1;
        return (long)(f1 * mInterpolator.getInterpolation(f2));
    }

    public Interpolator getInterpolator()
    {
        return mInterpolator;
    }

    public int getOrder()
    {
        return mOrder;
    }

    protected int getTransformedIndex(AnimationParameters animationparameters)
    {
        switch (getOrder())
        {
        case 2: // '\002'
            if (mRandomizer == null)
                mRandomizer = new Random();
            return (int)((float)animationparameters.count * mRandomizer.nextFloat());

        case 1: // '\001'
            return (-1 + animationparameters.count) - animationparameters.index;
        }
        return animationparameters.index;
    }

    public boolean isDone()
    {
        return AnimationUtils.currentAnimationTimeMillis() > mAnimation.getStartTime() + mMaxDelay + mDuration;
    }

    public void setAnimation(Context context, int i)
    {
        setAnimation(AnimationUtils.loadAnimation(context, i));
    }

    public void setAnimation(Animation animation)
    {
        mAnimation = animation;
        mAnimation.setFillBefore(true);
    }

    public void setDelay(float f)
    {
        mDelay = f;
    }

    public void setInterpolator(Context context, int i)
    {
        setInterpolator(AnimationUtils.loadInterpolator(context, i));
    }

    public void setInterpolator(Interpolator interpolator)
    {
        mInterpolator = interpolator;
    }

    public void setOrder(int i)
    {
        mOrder = i;
    }

    public void start()
    {
        mDuration = mAnimation.getDuration();
        mMaxDelay = 0x8000000000000000L;
        mAnimation.setStartTime(-1L);
    }

    public boolean willOverlap()
    {
        return mDelay < 1.0F;
    }
}
