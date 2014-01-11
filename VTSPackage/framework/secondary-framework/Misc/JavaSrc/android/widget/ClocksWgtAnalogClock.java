// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

// Referenced classes of package android.widget:
//            ScreenStateChangeListener, Utils

public class ClocksWgtAnalogClock extends View
    implements ScreenStateChangeListener
{

    private static final String TAG = "ClocksWgtAnalogClock";
    private static final String WEEK_FORMAT = "E";
    private boolean mAttached;
    private boolean mChanged;
    private float mDateFontSize;
    private String mDateFormatString;
    private Drawable mDayDial;
    private Drawable mDayHat;
    private Drawable mDayHourHand;
    private Drawable mDayMinuteHand;
    private Drawable mDial;
    private int mDialHeight;
    private int mDialWidth;
    private final Handler mHandler;
    private Drawable mHat;
    private float mHour;
    private Drawable mHourHand;
    private final BroadcastReceiver mIntentReceiver;
    private boolean mIsScreenEnter;
    private Drawable mMinuteHand;
    private float mMinutes;
    private Drawable mNightDial;
    private Drawable mNightHat;
    private Drawable mNightHourHand;
    private Drawable mNightMinuteHand;
    private Runnable mTicker;
    private String mTimeZone;

    public ClocksWgtAnalogClock(Context context)
    {
        this(context, null);
    }

    public ClocksWgtAnalogClock(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ClocksWgtAnalogClock(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mHandler = new Handler();
        mIsScreenEnter = true;
        mIntentReceiver = new BroadcastReceiver() {

            final ClocksWgtAnalogClock this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (!mIsScreenEnter)
                {
                    return;
                } else
                {
                    onTimeChanged();
                    invalidate();
                    return;
                }
            }

            
            {
                this$0 = ClocksWgtAnalogClock.this;
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
        mDialWidth = mDial.getIntrinsicWidth();
        mDialHeight = mDial.getIntrinsicHeight();
    }

    private void drawDate(Canvas canvas, int i, int j)
    {
        Paint paint = new Paint();
        paint.setTextSize(mDateFontSize);
        paint.setAntiAlias(true);
        int k = Integer.valueOf(getFormatStr("k")).intValue();
        if (k > 5 && k < 18)
            paint.setColor(0xff000000);
        else
            paint.setColor(-1);
        Rect rect = new Rect();
        String s = getFormatStr(mDateFormatString);
        if (s != null)
        {
            paint.getTextBounds(s, 0, s.length(), rect);
            canvas.drawText(s, (float)((double)i - (double)rect.width() / 2D), (float)((double)j - (double)rect.height() / 2D) + (2.0F * (float)j) / 4F, paint);
        }
    }

    private void drawWeekDay(Canvas canvas, int i, int j)
    {
        Paint paint = new Paint();
        paint.setTextSize(mDateFontSize);
        paint.setAntiAlias(true);
        int k = Integer.valueOf(getFormatStr("k")).intValue();
        if (k > 5 && k < 18)
            paint.setColor(0xff000000);
        else
            paint.setColor(-1);
        Rect rect = new Rect();
        String s = getFormatStr("E");
        if (s != null)
        {
            paint.getTextBounds(s, 0, s.length(), rect);
            canvas.drawText(s, (float)i - (float)rect.width() / 2.0F - (1.6F * (float)i) / 4F, (float)j + (float)rect.height() / 2.0F, paint);
        }
    }

    private String getFormatStr(String s)
    {
        if (mTimeZone != null)
        {
            if (s != null)
            {
                SimpleDateFormat simpledateformat = new SimpleDateFormat(s);
                simpledateformat.setTimeZone(TimeZone.getTimeZone(mTimeZone));
                return simpledateformat.format(new Date());
            }
        } else
        if (s != null)
            return (new SimpleDateFormat(s)).format(new Date());
        return null;
    }

    private void onTimeChanged()
    {
        int i = Integer.valueOf(getFormatStr("h")).intValue();
        int j = Integer.valueOf(getFormatStr("m")).intValue();
        int k = Integer.valueOf(getFormatStr("s")).intValue();
        mMinutes = (float)j + (float)k / 60F;
        mHour = (float)i + mMinutes / 60F;
        if (mDayHat == null)
        {
            mChanged = true;
            return;
        }
        int l = Integer.valueOf(getFormatStr("k")).intValue();
        if (l > 5 && l < 18)
        {
            if (mDayDial != null)
                mDial = mDayDial;
            if (mDayHourHand != null)
                mHourHand = mDayHourHand;
            if (mDayMinuteHand != null)
                mMinuteHand = mDayMinuteHand;
            if (mDayHat != null)
                mHat = mDayHat;
        } else
        {
            if (mNightDial != null)
                mDial = mNightDial;
            if (mNightHourHand != null)
                mHourHand = mNightHourHand;
            if (mNightMinuteHand != null)
                mMinuteHand = mNightMinuteHand;
            if (mNightHat != null)
                mHat = mNightHat;
        }
        mChanged = true;
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
            intentfilter.addAction("android.intent.action.SCREEN_ON");
            getContext().registerReceiver(mIntentReceiver, intentfilter, null, mHandler);
        }
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
        Utils.onDetachedFromWindowClearUp(this);
    }

    protected void onDraw(Canvas canvas)
    {
        boolean flag;
        int i;
        int j;
        int k;
        int l;
        Drawable drawable;
        Drawable drawable1;
        int i1;
        int j1;
        int k1;
        int l1;
        boolean flag1;
label0:
        {
            super.onDraw(canvas);
            flag = mChanged;
            if (flag)
                mChanged = false;
            i = super.mRight - super.mLeft;
            j = super.mBottom - super.mTop;
            k = i / 2;
            l = j / 2;
            drawable = mDial;
            drawable1 = mHat;
            i1 = drawable.getIntrinsicWidth();
            j1 = drawable.getIntrinsicHeight();
            k1 = 0;
            l1 = 0;
            if (drawable1 != null)
            {
                l1 = drawable1.getIntrinsicWidth();
                k1 = drawable1.getIntrinsicHeight();
            }
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
        drawDate(canvas, k, l);
        if (mDayHat != null)
            drawWeekDay(canvas, k, l);
        canvas.save();
        canvas.rotate(360F * (mHour / 12F), k, l);
        Drawable drawable2 = mHourHand;
        if (flag)
        {
            int k2 = drawable2.getIntrinsicWidth();
            int l2 = drawable2.getIntrinsicHeight();
            drawable2.setBounds(k - k2 / 2, l - l2 / 2, k + k2 / 2, l + l2 / 2);
        }
        drawable2.draw(canvas);
        drawable2.setAlpha(225);
        canvas.restore();
        canvas.save();
        canvas.rotate(360F * (mMinutes / 60F), k, l);
        Drawable drawable3 = mMinuteHand;
        if (flag)
        {
            int i2 = drawable3.getIntrinsicWidth();
            int j2 = drawable3.getIntrinsicHeight();
            drawable3.setBounds(k - i2 / 2, l - j2 / 2, k + i2 / 2, l + j2 / 2);
        }
        drawable3.draw(canvas);
        drawable3.setAlpha(225);
        canvas.restore();
        if (flag1)
            canvas.restore();
        if (i < l1 || j < k1)
        {
            float f1 = Math.min((float)i / (float)l1, (float)j / (float)k1);
            canvas.save();
            canvas.scale(f1, f1, k, l);
        }
        if (flag && drawable1 != null)
            drawable1.setBounds(k - l1 / 2, l - k1 / 2, k + l1 / 2, l + k1 / 2);
        if (drawable1 != null)
            drawable1.draw(canvas);
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
        setMeasuredDimension(resolveSize((int)(f2 * (float)mDialWidth), i), resolveSize((int)(f2 * (float)mDialHeight), j));
    }

    public void onScreenStateChanged(int i, int j)
    {
        if (j == 0)
        {
            mIsScreenEnter = true;
            mTicker = new Runnable() {

                final ClocksWgtAnalogClock this$0;

                public void run()
                {
                    onTimeChanged();
                    invalidate();
                }

            
            {
                this$0 = ClocksWgtAnalogClock.this;
                super();
            }
            }
;
            mHandler.post(mTicker);
            return;
        } else
        {
            mIsScreenEnter = false;
            return;
        }
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        mChanged = true;
    }

    public void setDateFontSize(int i)
    {
        mDateFontSize = getResources().getDimension(i);
    }

    public void setDateFormatString(int i)
    {
        mDateFormatString = getContext().getString(i);
    }

    public void setDateHeight(int i)
    {
    }

    public void setDayDialResource(int i)
    {
        mDayDial = getResources().getDrawable(i);
    }

    public void setDayHatResource(int i)
    {
        mDayHat = getResources().getDrawable(i);
    }

    public void setDayHourResource(int i)
    {
        mDayHourHand = getResources().getDrawable(i);
    }

    public void setDayMinuteResource(int i)
    {
        mDayMinuteHand = getResources().getDrawable(i);
    }

    public void setNightDialResource(int i)
    {
        mNightDial = getResources().getDrawable(i);
    }

    public void setNightHatResource(int i)
    {
        mNightHat = getResources().getDrawable(i);
    }

    public void setNightHourResource(int i)
    {
        mNightHourHand = getResources().getDrawable(i);
    }

    public void setNightMinuteResource(int i)
    {
        mNightMinuteHand = getResources().getDrawable(i);
    }

    public void setOnTimeChanged(int i)
    {
        onTimeChanged();
    }

    public void setTimeZone(String s)
    {
        mTimeZone = s;
        onTimeChanged();
    }


}
