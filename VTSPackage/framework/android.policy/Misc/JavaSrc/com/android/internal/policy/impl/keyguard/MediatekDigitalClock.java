// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.*;
import android.database.ContentObserver;
import android.os.Handler;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.TimeZone;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            Alarms

public class MediatekDigitalClock extends LinearLayout
{
    static class AmPm
    {

        private final TextView mAmPm;
        private final String mAmString;
        private final String mPmString;

        CharSequence getAmPmText()
        {
            return mAmPm.getText();
        }

        void setIsMorning(boolean flag)
        {
            TextView textview = mAmPm;
            String s;
            if (flag)
                s = mAmString;
            else
                s = mPmString;
            textview.setText(s);
        }

        void setShowAmPm(boolean flag)
        {
            TextView textview = mAmPm;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            textview.setVisibility(byte0);
        }

        AmPm(View view)
        {
            mAmPm = (TextView)view.findViewById(0x210005f);
            String as[] = (new DateFormatSymbols()).getAmPmStrings();
            mAmString = as[0];
            mPmString = as[1];
        }
    }

    private class FormatChangeObserver extends ContentObserver
    {

        final MediatekDigitalClock this$0;

        public void onChange(boolean flag)
        {
            setDateFormat();
            updateTime();
        }

        public FormatChangeObserver()
        {
            this$0 = MediatekDigitalClock.this;
            super(new Handler());
        }
    }


    private static final String HOURS = "h";
    private static final String HOURS_24 = "kk";
    private static final String MINUTES = ":mm";
    private AmPm mAmPm;
    private boolean mAttached;
    private Calendar mCalendar;
    private ContentObserver mFormatChangeObserver;
    private final Handler mHandler;
    private String mHoursFormat;
    private final BroadcastReceiver mIntentReceiver;
    private boolean mLive;
    private TextView mTimeDisplayHours;
    private TextView mTimeDisplayMinutes;
    private String mTimeZoneId;

    public MediatekDigitalClock(Context context)
    {
        this(context, null);
    }

    public MediatekDigitalClock(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLive = true;
        mHandler = new Handler();
        mIntentReceiver = new BroadcastReceiver() {

            final MediatekDigitalClock this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (mLive && intent.getAction().equals("android.intent.action.TIMEZONE_CHANGED"))
                    mCalendar = Calendar.getInstance();
                mHandler.post(new Runnable() {

                    final _cls1 this$1;

                    public void run()
                    {
                        updateTime();
                    }

            
            {
                this$1 = _cls1.this;
                super();
            }
                }
);
            }

            
            {
                this$0 = MediatekDigitalClock.this;
                super();
            }
        }
;
    }

    private void setDateFormat()
    {
        String s;
        if (Alarms.get24HourMode(getContext()))
            s = "kk";
        else
            s = "h";
        mHoursFormat = s;
        AmPm ampm = mAmPm;
        boolean flag;
        if (!Alarms.get24HourMode(getContext()))
            flag = true;
        else
            flag = false;
        ampm.setShowAmPm(flag);
    }

    private void updateTime()
    {
        if (mLive)
            mCalendar.setTimeInMillis(System.currentTimeMillis());
        if (mTimeZoneId != null)
            mCalendar.setTimeZone(TimeZone.getTimeZone(mTimeZoneId));
        StringBuilder stringbuilder = new StringBuilder();
        CharSequence charsequence = DateFormat.format(mHoursFormat, mCalendar);
        mTimeDisplayHours.setText(charsequence);
        stringbuilder.append(charsequence);
        CharSequence charsequence1 = DateFormat.format(":mm", mCalendar);
        stringbuilder.append(charsequence1);
        mTimeDisplayMinutes.setText(charsequence1);
        boolean flag;
        if (mCalendar.get(9) == 0)
            flag = true;
        else
            flag = false;
        mAmPm.setIsMorning(flag);
        if (!Alarms.get24HourMode(getContext()))
            stringbuilder.append(mAmPm.getAmPmText());
        setContentDescription(stringbuilder);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        Log.v("PowerOffAlarm", (new StringBuilder()).append("onAttachedToWindow ").append(this).toString());
        if (mAttached)
            return;
        mAttached = true;
        if (mLive)
        {
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.TIME_TICK");
            intentfilter.addAction("android.intent.action.TIME_SET");
            intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
            getContext().registerReceiver(mIntentReceiver, intentfilter);
        }
        mFormatChangeObserver = new FormatChangeObserver();
        getContext().getContentResolver().registerContentObserver(android.provider.Settings.System.CONTENT_URI, true, mFormatChangeObserver);
        updateTime();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (!mAttached)
            return;
        mAttached = false;
        if (mLive)
            getContext().unregisterReceiver(mIntentReceiver);
        getContext().getContentResolver().unregisterContentObserver(mFormatChangeObserver);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mTimeDisplayHours = (TextView)findViewById(0x210005d);
        mTimeDisplayMinutes = (TextView)findViewById(0x210005e);
        mAmPm = new AmPm(this);
        mCalendar = Calendar.getInstance();
        setDateFormat();
    }

    void setLive(boolean flag)
    {
        mLive = flag;
    }

    public void setTimeZone(String s)
    {
        mTimeZoneId = s;
        updateTime();
    }

    public void updateTime(int i, int j)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.set(11, i);
        calendar.set(12, j);
        mCalendar = calendar;
        updateTime();
    }

    void updateTime(Calendar calendar)
    {
        mCalendar = calendar;
        updateTime();
    }



/*
    static Calendar access$102(MediatekDigitalClock mediatekdigitalclock, Calendar calendar)
    {
        mediatekdigitalclock.mCalendar = calendar;
        return calendar;
    }

*/



}
