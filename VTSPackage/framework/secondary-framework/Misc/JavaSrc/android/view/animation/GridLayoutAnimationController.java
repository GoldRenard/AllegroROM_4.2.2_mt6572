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
//            LayoutAnimationController, Animation, LinearInterpolator, Interpolator

public class GridLayoutAnimationController extends LayoutAnimationController
{
    public static class AnimationParameters extends LayoutAnimationController.AnimationParameters
    {

        public int column;
        public int columnsCount;
        public int row;
        public int rowsCount;

    }


    public static final int DIRECTION_BOTTOM_TO_TOP = 2;
    public static final int DIRECTION_HORIZONTAL_MASK = 1;
    public static final int DIRECTION_LEFT_TO_RIGHT = 0;
    public static final int DIRECTION_RIGHT_TO_LEFT = 1;
    public static final int DIRECTION_TOP_TO_BOTTOM = 0;
    public static final int DIRECTION_VERTICAL_MASK = 2;
    public static final int PRIORITY_COLUMN = 1;
    public static final int PRIORITY_NONE = 0;
    public static final int PRIORITY_ROW = 2;
    private float mColumnDelay;
    private int mDirection;
    private int mDirectionPriority;
    private float mRowDelay;

    public GridLayoutAnimationController(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.GridLayoutAnimation);
        mColumnDelay = Animation.Description.parseValue(typedarray.peekValue(0)).value;
        mRowDelay = Animation.Description.parseValue(typedarray.peekValue(1)).value;
        mDirection = typedarray.getInt(2, 0);
        mDirectionPriority = typedarray.getInt(3, 0);
        typedarray.recycle();
    }

    public GridLayoutAnimationController(Animation animation)
    {
        this(animation, 0.5F, 0.5F);
    }

    public GridLayoutAnimationController(Animation animation, float f, float f1)
    {
        super(animation);
        mColumnDelay = f;
        mRowDelay = f1;
    }

    private int getTransformedColumnIndex(AnimationParameters animationparameters)
    {
        int i;
        switch (getOrder())
        {
        case 2: // '\002'
            if (super.mRandomizer == null)
                super.mRandomizer = new Random();
            i = (int)((float)animationparameters.columnsCount * super.mRandomizer.nextFloat());
            break;

        case 1: // '\001'
            i = (-1 + animationparameters.columnsCount) - animationparameters.column;
            break;

        default:
            i = animationparameters.column;
            break;
        }
        if ((1 & mDirection) == 1)
            i = (-1 + animationparameters.columnsCount) - i;
        return i;
    }

    private int getTransformedRowIndex(AnimationParameters animationparameters)
    {
        int i;
        switch (getOrder())
        {
        case 2: // '\002'
            if (super.mRandomizer == null)
                super.mRandomizer = new Random();
            i = (int)((float)animationparameters.rowsCount * super.mRandomizer.nextFloat());
            break;

        case 1: // '\001'
            i = (-1 + animationparameters.rowsCount) - animationparameters.row;
            break;

        default:
            i = animationparameters.row;
            break;
        }
        if ((2 & mDirection) == 2)
            i = (-1 + animationparameters.rowsCount) - i;
        return i;
    }

    public float getColumnDelay()
    {
        return mColumnDelay;
    }

    protected long getDelayForView(View view)
    {
        AnimationParameters animationparameters = (AnimationParameters)view.getLayoutParams().layoutAnimationParameters;
        if (animationparameters == null)
            return 0L;
        int i = getTransformedColumnIndex(animationparameters);
        int j = getTransformedRowIndex(animationparameters);
        int k = animationparameters.rowsCount;
        int l = animationparameters.columnsCount;
        long l1 = super.mAnimation.getDuration();
        float f = mColumnDelay * (float)l1;
        float f1 = mRowDelay * (float)l1;
        if (super.mInterpolator == null)
            super.mInterpolator = new LinearInterpolator();
        long l2;
        float f2;
        switch (mDirectionPriority)
        {
        case 2: // '\002'
            l2 = (long)(f * (float)i + f * (float)(j * l));
            f2 = f * (float)l + f * (float)(k * l);
            break;

        case 1: // '\001'
            l2 = (long)(f1 * (float)j + f1 * (float)(i * k));
            f2 = f1 * (float)k + f1 * (float)(l * k);
            break;

        default:
            l2 = (long)(f * (float)i + f1 * (float)j);
            f2 = f * (float)l + f1 * (float)k;
            break;
        }
        float f3 = (float)l2 / f2;
        return (long)(f2 * super.mInterpolator.getInterpolation(f3));
    }

    public int getDirection()
    {
        return mDirection;
    }

    public int getDirectionPriority()
    {
        return mDirectionPriority;
    }

    public float getRowDelay()
    {
        return mRowDelay;
    }

    public void setColumnDelay(float f)
    {
        mColumnDelay = f;
    }

    public void setDirection(int i)
    {
        mDirection = i;
    }

    public void setDirectionPriority(int i)
    {
        mDirectionPriority = i;
    }

    public void setRowDelay(float f)
    {
        mRowDelay = f;
    }

    public boolean willOverlap()
    {
        return mColumnDelay < 1.0F || mRowDelay < 1.0F;
    }
}
