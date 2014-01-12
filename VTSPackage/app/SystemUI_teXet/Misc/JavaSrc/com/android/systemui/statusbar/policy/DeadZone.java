// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.MotionEvent;
import android.view.View;

public class DeadZone extends View
{

    private static final boolean CHATTY = true;
    public static final boolean DEBUG = false;
    public static final int HORIZONTAL = 0;
    public static final String TAG = "DeadZone";
    public static final int VERTICAL = 1;
    private final Runnable mDebugFlash;
    private int mDecay;
    private float mFlashFrac;
    private int mHold;
    private long mLastPokeTime;
    private boolean mShouldFlash;
    private int mSizeMax;
    private int mSizeMin;
    private boolean mVertical;

    public DeadZone(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public DeadZone(Context context, AttributeSet attributeset, int i)
    {
        boolean flag = true;
        super(context, attributeset);
        mFlashFrac = 0.0F;
        mDebugFlash = new Runnable() {

            final DeadZone this$0;

            public void run()
            {
                ObjectAnimator.ofFloat(DeadZone.this, "flash", new float[] {
                    1.0F, 0.0F
                }).setDuration(150L).start();
            }

            
            {
                this$0 = DeadZone.this;
                super();
            }
        }
;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.systemui.R.styleable.DeadZone, i, 0);
        mHold = typedarray.getInteger(2, 0);
        mDecay = typedarray.getInteger(3, 0);
        mSizeMin = typedarray.getDimensionPixelSize(0, 0);
        mSizeMax = typedarray.getDimensionPixelSize(flag, 0);
        if (typedarray.getInt(4, -1) != flag)
            flag = false;
        mVertical = flag;
        setFlashOnTouchCapture(context.getResources().getBoolean(0x7f0a0007));
    }

    private float getSize(long l)
    {
        if (mSizeMax == 0)
            return 0.0F;
        long l1 = l - mLastPokeTime;
        if (l1 > (long)(mHold + mDecay))
            return (float)mSizeMin;
        if (l1 < (long)mHold)
            return (float)mSizeMax;
        else
            return (float)(int)lerp(mSizeMax, mSizeMin, (float)(l1 - (long)mHold) / (float)mDecay);
    }

    static float lerp(float f, float f1, float f2)
    {
        return f + f2 * (f1 - f);
    }

    public float getFlash()
    {
        return mFlashFrac;
    }

    public void onDraw(Canvas canvas)
    {
        if (mShouldFlash && mFlashFrac > 0.0F)
        {
            int i = (int)getSize(SystemClock.uptimeMillis());
            int j;
            if (mVertical)
                j = i;
            else
                j = canvas.getWidth();
            if (mVertical)
                i = canvas.getHeight();
            canvas.clipRect(0, 0, j, i);
            canvas.drawARGB((int)(255F * mFlashFrac), 221, 238, 170);
            return;
        } else
        {
            return;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (i == 4)
            poke(motionevent);
        else
        if (i == 0)
        {
            int j = (int)getSize(motionevent.getEventTime());
            if (mVertical && motionevent.getX() < (float)j || motionevent.getY() < (float)j)
            {
                Slog.v("DeadZone", (new StringBuilder()).append("consuming errant click: (").append(motionevent.getX()).append(",").append(motionevent.getY()).append(")").toString());
                if (mShouldFlash)
                {
                    post(mDebugFlash);
                    postInvalidate();
                }
                return true;
            }
        }
        return false;
    }

    public void poke(MotionEvent motionevent)
    {
        mLastPokeTime = motionevent.getEventTime();
        postInvalidate();
    }

    public void setFlash(float f)
    {
        mFlashFrac = f;
        postInvalidate();
    }

    public void setFlashOnTouchCapture(boolean flag)
    {
        mShouldFlash = flag;
        mFlashFrac = 0.0F;
        postInvalidate();
    }
}
