// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.*;
import android.database.ContentObserver;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.UserHandle;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.text.DateFormatSymbols;
import java.util.Calendar;

public class ClockView extends RelativeLayout
{
    static class AmPm
    {

        private TextView mAmPmTextView;
        private String mAmString;
        private String mPmString;

        void setIsMorning(boolean flag)
        {
            if (mAmPmTextView != null)
            {
                TextView textview = mAmPmTextView;
                String s;
                if (flag)
                    s = mAmString;
                else
                    s = mPmString;
                textview.setText(s);
            }
        }

        void setShowAmPm(boolean flag)
        {
            if (mAmPmTextView != null)
            {
                TextView textview = mAmPmTextView;
                byte byte0;
                if (flag)
                    byte0 = 0;
                else
                    byte0 = 8;
                textview.setVisibility(byte0);
            }
        }

        AmPm(View view, Typeface typeface)
        {
            mAmPmTextView = (TextView)view.findViewById(0x1020309);
            if (mAmPmTextView != null && typeface != null)
                mAmPmTextView.setTypeface(typeface);
            String as[] = (new DateFormatSymbols()).getAmPmStrings();
            mAmString = as[0];
            mPmString = as[1];
        }
    }

    private static class FormatChangeObserver extends ContentObserver
    {

        private WeakReference mClock;
        private Context mContext;

        public void onChange(boolean flag)
        {
            ClockView clockview = (ClockView)mClock.get();
            if (clockview != null)
            {
                clockview.setDateFormat();
                clockview.updateTime();
                return;
            }
            try
            {
                mContext.getContentResolver().unregisterContentObserver(this);
                return;
            }
            catch (RuntimeException runtimeexception)
            {
                return;
            }
        }

        public FormatChangeObserver(ClockView clockview)
        {
            super(new Handler());
            mClock = new WeakReference(clockview);
            mContext = clockview.getContext();
        }
    }

    private static class TimeChangedReceiver extends BroadcastReceiver
    {

        private WeakReference mClock;
        private Context mContext;

        public void onReceive(Context context, Intent intent)
        {
            final boolean timezoneChanged = intent.getAction().equals("android.intent.action.TIMEZONE_CHANGED");
            ClockView clockview = (ClockView)mClock.get();
            if (clockview != null)
            {
                clockview.mHandler.post(clockview. new Runnable() {

                    final TimeChangedReceiver this$0;
                    final ClockView val$clock;
                    final boolean val$timezoneChanged;

                    public void run()
                    {
                        if (timezoneChanged)
                            clock.mCalendar = Calendar.getInstance();
                        clock.updateTime();
                    }

            
            {
                this$0 = final_timechangedreceiver;
                timezoneChanged = flag;
                clock = ClockView.this;
                super();
            }
                }
);
                return;
            }
            try
            {
                mContext.unregisterReceiver(this);
                return;
            }
            catch (RuntimeException runtimeexception)
            {
                return;
            }
        }

        public TimeChangedReceiver(ClockView clockview)
        {
            mClock = new WeakReference(clockview);
            mContext = clockview.getContext();
        }
    }


    private static final String ANDROID_CLOCK_FONT_FILE = "/system/fonts/AndroidClock.ttf";
    private static final String M12 = "h:mm";
    private static final String M24 = "kk:mm";
    private AmPm mAmPm;
    private int mAttached;
    private Calendar mCalendar;
    private String mFormat;
    private ContentObserver mFormatChangeObserver;
    private final Handler mHandler;
    private BroadcastReceiver mIntentReceiver;
    private TextView mTimeView;

    public ClockView(Context context)
    {
        this(context, null);
    }

    public ClockView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mAttached = 0;
        mHandler = new Handler();
    }

    private void setDateFormat()
    {
        String s;
        if (DateFormat.is24HourFormat(getContext()))
            s = "kk:mm";
        else
            s = "h:mm";
        mFormat = s;
        mAmPm.setShowAmPm(mFormat.equals("h:mm"));
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mAttached = 1 + mAttached;
        if (mIntentReceiver == null)
        {
            mIntentReceiver = new TimeChangedReceiver(this);
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.TIME_TICK");
            intentfilter.addAction("android.intent.action.TIME_SET");
            intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
            mContext.registerReceiverAsUser(mIntentReceiver, UserHandle.OWNER, intentfilter, null, null);
        }
        if (mFormatChangeObserver == null)
        {
            mFormatChangeObserver = new FormatChangeObserver(this);
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.CONTENT_URI, true, mFormatChangeObserver);
        }
        updateTime();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mAttached = -1 + mAttached;
        if (mIntentReceiver != null)
            mContext.unregisterReceiver(mIntentReceiver);
        if (mFormatChangeObserver != null)
            mContext.getContentResolver().unregisterContentObserver(mFormatChangeObserver);
        mFormatChangeObserver = null;
        mIntentReceiver = null;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mTimeView = (TextView)findViewById(0x1020308);
        mTimeView.setTypeface(Typeface.createFromFile("/system/fonts/AndroidClock.ttf"), 1);
        mAmPm = new AmPm(this, null);
        mCalendar = Calendar.getInstance();
        setDateFormat();
    }

    public void updateTime()
    {
        mCalendar.setTimeInMillis(System.currentTimeMillis());
        CharSequence charsequence = DateFormat.format(mFormat, mCalendar);
        mTimeView.setText(charsequence);
        AmPm ampm = mAmPm;
        boolean flag;
        if (mCalendar.get(9) == 0)
            flag = true;
        else
            flag = false;
        ampm.setIsMorning(flag);
    }

    void updateTime(Calendar calendar)
    {
        mCalendar = calendar;
        updateTime();
    }


/*
    static Calendar access$002(ClockView clockview, Calendar calendar)
    {
        clockview.mCalendar = calendar;
        return calendar;
    }

*/


}
