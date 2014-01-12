// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.text.SpannableStringBuilder;
import android.text.format.DateFormat;
import android.text.style.RelativeSizeSpan;
import android.util.AttributeSet;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;
import java.text.SimpleDateFormat;
import java.util.*;

public class Clock extends TextView
{

    private static final int AM_PM_STYLE = 1;
    private static final int AM_PM_STYLE_GONE = 2;
    private static final int AM_PM_STYLE_NORMAL = 0;
    private static final int AM_PM_STYLE_SMALL = 1;
    private static final String TAG = "Clock";
    private boolean mAttached;
    private Calendar mCalendar;
    private SimpleDateFormat mClockFormat;
    private String mClockFormatString;
    private final BroadcastReceiver mIntentReceiver;
    private Locale mLocale;

    public Clock(Context context)
    {
        this(context, null);
    }

    public Clock(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public Clock(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mIntentReceiver = new BroadcastReceiver() {

            final Clock this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                Xlog.d("Clock", (new StringBuilder()).append("action =").append(s).toString());
                if (s.equals("android.intent.action.TIMEZONE_CHANGED"))
                {
                    String s1 = intent.getStringExtra("time-zone");
                    mCalendar = Calendar.getInstance(TimeZone.getTimeZone(s1));
                    if (mClockFormat != null)
                        mClockFormat.setTimeZone(mCalendar.getTimeZone());
                    Xlog.d("Clock", (new StringBuilder()).append("mCalendar =").append(mCalendar).append("TimeZone.getTimeZone(tz) =").append(TimeZone.getTimeZone(s1)).toString());
                } else
                if (s.equals("android.intent.action.CONFIGURATION_CHANGED"))
                {
                    Locale locale = getResources().getConfiguration().locale;
                    if (!locale.equals(mLocale))
                    {
                        mLocale = locale;
                        mClockFormatString = "";
                    }
                }
                updateClock();
            }

            
            {
                this$0 = Clock.this;
                super();
            }
        }
;
    }

    private final CharSequence getSmallTime()
    {
        Context context = getContext();
        int i;
        if (DateFormat.is24HourFormat(context))
            i = 0x1040031;
        else
            i = 0x1040030;
        String s = context.getString(i);
        SimpleDateFormat simpledateformat;
        if (!s.equals(mClockFormatString))
        {
            int l = -1;
            boolean flag = false;
            int i1 = 0;
label0:
            do
            {
label1:
                {
                    if (i1 < s.length())
                    {
                        char c = s.charAt(i1);
                        if (c == '\'')
                            if (!flag)
                                flag = true;
                            else
                                flag = false;
                        if (flag || c != 'a')
                            break label1;
                        l = i1;
                    }
                    if (l >= 0)
                    {
                        int j1 = l;
                        for (; l > 0 && Character.isWhitespace(s.charAt(l - 1)); l--);
                        s = (new StringBuilder()).append(s.substring(0, l)).append('\uEF00').append(s.substring(l, j1)).append("a").append('\uEF01').append(s.substring(j1 + 1)).toString();
                    }
                    simpledateformat = new SimpleDateFormat(s);
                    mClockFormat = simpledateformat;
                    mClockFormatString = s;
                    break label0;
                }
                i1++;
            } while (true);
        } else
        {
            simpledateformat = mClockFormat;
        }
        java.util.Date date = mCalendar.getTime();
        String s1 = simpledateformat.format(date);
        int j = s1.indexOf('\uEF00');
        int k = s1.indexOf('\uEF01');
        if (j >= 0 && k > j)
        {
            SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder(s1);
            spannablestringbuilder.setSpan(new RelativeSizeSpan(0.7F), j, k, 34);
            spannablestringbuilder.delete(k, k + 1);
            spannablestringbuilder.delete(j, j + 1);
            return spannablestringbuilder;
        } else
        {
            return s1;
        }
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
            intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
            intentfilter.addAction("android.intent.action.USER_SWITCHED");
            getContext().registerReceiver(mIntentReceiver, intentfilter, null, getHandler());
        }
        mCalendar = Calendar.getInstance(TimeZone.getDefault());
        updateClock();
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

    final void updateClock()
    {
        mCalendar.setTimeInMillis(System.currentTimeMillis());
        setText(getSmallTime());
    }



/*
    static Calendar access$002(Clock clock, Calendar calendar)
    {
        clock.mCalendar = calendar;
        return calendar;
    }

*/




/*
    static Locale access$202(Clock clock, Locale locale)
    {
        clock.mLocale = locale;
        return locale;
    }

*/


/*
    static String access$302(Clock clock, String s)
    {
        clock.mClockFormatString = s;
        return s;
    }

*/
}
