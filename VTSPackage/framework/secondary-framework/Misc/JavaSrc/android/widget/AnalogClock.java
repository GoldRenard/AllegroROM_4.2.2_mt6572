// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.format.DateUtils;
import android.text.format.Time;
import android.util.AttributeSet;
import android.view.View;
import java.util.TimeZone;

public class AnalogClock extends View
{

    private boolean mAttached;
    private Time mCalendar;
    private boolean mChanged;
    private Drawable mDial;
    private int mDialHeight;
    private int mDialWidth;
    private final Handler mHandler;
    private float mHour;
    private Drawable mHourHand;
    private final BroadcastReceiver mIntentReceiver;
    private Drawable mMinuteHand;
    private float mMinutes;

    public AnalogClock(Context context)
    {
        this(context, null);
    }

    public AnalogClock(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public AnalogClock(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mHandler = new Handler();
        mIntentReceiver = new BroadcastReceiver() {

            final AnalogClock this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.TIMEZONE_CHANGED"))
                {
                    String s = intent.getStringExtra("time-zone");
                    mCalendar = new Time(TimeZone.getTimeZone(s).getID());
                }
                onTimeChanged();
                invalidate();
            }

            
            {
                this$0 = AnalogClock.this;
                super();
            }
        }
;
        Resources resources = super.mContext.getResources();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.AnalogClock, i, 0);
        mDial = typedarray.getDrawable(0);
        if (mDial == null)
            mDial = resources.getDrawable(0x1080210);
        mHourHand = typedarray.getDrawable(1);
        if (mHourHand == null)
            mHourHand = resources.getDrawable(0x1080211);
        mMinuteHand = typedarray.getDrawable(2);
        if (mMinuteHand == null)
            mMinuteHand = resources.getDrawable(0x1080212);
        mCalendar = new Time();
        mDialWidth = mDial.getIntrinsicWidth();
        mDialHeight = mDial.getIntrinsicHeight();
    }

    private void onTimeChanged()
    {
        mCalendar.setToNow();
        int i = mCalendar.hour;
        int j = mCalendar.minute;
        int k = mCalendar.second;
        mMinutes = (float)j + (float)k / 60F;
        mHour = (float)i + mMinutes / 60F;
        mChanged = true;
        updateContentDescription(mCalendar);
    }

    private void updateContentDescription(Time time)
    {
        setContentDescription(DateUtils.formatDateTime(super.mContext, time.toMillis(false), 129));
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (!mAttached)
        {
            mAttached = true;
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.TIME_TICK");
            intentfilter.addAction("android.intent.action.TIME_SET");
            intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
            getContext().registerReceiver(mIntentReceiver, intentfilter, null, mHandler);
        }
        mCalendar = new Time();
        onTimeChanged();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
        {
            getContext().unregisterReceiver(mIntentReceiver);
            mAttached = false;
        }
    }

    protected void onDraw(Canvas canvas)
    {
        boolean flag;
        int k;
        int l;
        Drawable drawable;
        int i1;
        int j1;
        boolean flag1;
label0:
        {
            super.onDraw(canvas);
            flag = mChanged;
            if (flag)
                mChanged = false;
            int i = super.mRight - super.mLeft;
            int j = super.mBottom - super.mTop;
            k = i / 2;
            l = j / 2;
            drawable = mDial;
            i1 = drawable.getIntrinsicWidth();
            j1 = drawable.getIntrinsicHeight();
            if (i >= i1)
            {
                flag1 = false;
                if (j >= j1)
                    break label0;
            }
            flag1 = true;
            float f = Math.min((float)i / (float)i1, (float)j / (float)j1);
            canvas.save();
            canvas.scale(f, f, k, l);
        }
        if (flag)
            drawable.setBounds(k - i1 / 2, l - j1 / 2, k + i1 / 2, l + j1 / 2);
        drawable.draw(canvas);
        canvas.save();
        canvas.rotate(360F * (mHour / 12F), k, l);
        Drawable drawable1 = mHourHand;
        if (flag)
        {
            int i2 = drawable1.getIntrinsicWidth();
            int j2 = drawable1.getIntrinsicHeight();
            drawable1.setBounds(k - i2 / 2, l - j2 / 2, k + i2 / 2, l + j2 / 2);
        }
        drawable1.draw(canvas);
        canvas.restore();
        canvas.save();
        canvas.rotate(360F * (mMinutes / 60F), k, l);
        Drawable drawable2 = mMinuteHand;
        if (flag)
        {
            int k1 = drawable2.getIntrinsicWidth();
            int l1 = drawable2.getIntrinsicHeight();
            drawable2.setBounds(k - k1 / 2, l - l1 / 2, k + k1 / 2, l + l1 / 2);
        }
        drawable2.draw(canvas);
        canvas.restore();
        if (flag1)
            canvas.restore();
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getSize(i);
        int i1 = android.view.View.MeasureSpec.getMode(j);
        int j1 = android.view.View.MeasureSpec.getSize(j);
        float f = 1.0F;
        float f1 = 1.0F;
        if (k != 0 && l < mDialWidth)
            f = (float)l / (float)mDialWidth;
        if (i1 != 0 && j1 < mDialHeight)
            f1 = (float)j1 / (float)mDialHeight;
        float f2 = Math.min(f, f1);
        setMeasuredDimension(resolveSizeAndState((int)(f2 * (float)mDialWidth), i, 0), resolveSizeAndState((int)(f2 * (float)mDialHeight), j, 0));
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        mChanged = true;
    }


/*
    static Time access$002(AnalogClock analogclock, Time time)
    {
        analogclock.mCalendar = time;
        return time;
    }

*/

}
