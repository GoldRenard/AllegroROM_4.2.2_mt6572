// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.os.Handler;
import android.text.format.Time;
import android.util.AttributeSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

// Referenced classes of package android.widget:
//            TextView

public class DateTimeView extends TextView
{

    private static final int SHOW_MONTH_DAY_YEAR = 1;
    private static final int SHOW_TIME = 0;
    private static final String TAG = "DateTimeView";
    private static final long TWELVE_HOURS_IN_MINUTES = 720L;
    private static final long TWENTY_FOUR_HOURS_IN_MILLIS = 0x5265c00L;
    private boolean mAttachedToWindow;
    private BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final DateTimeView this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("android.intent.action.TIME_TICK".equals(intent.getAction()) && System.currentTimeMillis() < mUpdateTimeMillis)
            {
                return;
            } else
            {
                mLastFormat = null;
                update();
                return;
            }
        }

            
            {
                this$0 = DateTimeView.this;
                super();
            }
    }
;
    private ContentObserver mContentObserver = new ContentObserver(new Handler()) {

        final DateTimeView this$0;

        public void onChange(boolean flag)
        {
            mLastFormat = null;
            update();
        }

            
            {
                this$0 = DateTimeView.this;
                super(handler);
            }
    }
;
    int mLastDisplay;
    DateFormat mLastFormat;
    Date mTime;
    long mTimeMillis;
    private long mUpdateTimeMillis;

    public DateTimeView(Context context)
    {
        super(context);
        mLastDisplay = -1;
    }

    public DateTimeView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLastDisplay = -1;
    }

    private DateFormat getDateFormat()
    {
        String s = android.provider.Settings.System.getString(getContext().getContentResolver(), "date_format");
        if (s == null || "".equals(s))
            return DateFormat.getDateInstance(3);
        SimpleDateFormat simpledateformat;
        try
        {
            simpledateformat = new SimpleDateFormat(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return DateFormat.getDateInstance(3);
        }
        return simpledateformat;
    }

    private DateFormat getTimeFormat()
    {
        Context context = getContext();
        int i;
        if (android.text.format.DateFormat.is24HourFormat(context))
            i = 0x1040031;
        else
            i = 0x1040030;
        return new SimpleDateFormat(context.getString(i));
    }

    private void registerReceivers()
    {
        Context context = getContext();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        android.net.Uri uri = android.provider.Settings.System.getUriFor("date_format");
        context.getContentResolver().registerContentObserver(uri, true, mContentObserver);
    }

    private void unregisterReceivers()
    {
        Context context = getContext();
        context.unregisterReceiver(mBroadcastReceiver);
        context.getContentResolver().unregisterContentObserver(mContentObserver);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        registerReceivers();
        mAttachedToWindow = true;
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        unregisterReceivers();
        mAttachedToWindow = false;
    }

    public void setTime(long l)
    {
        Time time = new Time();
        time.set(l);
        time.second = 0;
        mTimeMillis = time.toMillis(false);
        mTime = new Date(-1900 + time.year, time.month, time.monthDay, time.hour, time.minute, 0);
        update();
    }

    void update()
    {
        int i;
label0:
        {
            if (mTime == null)
                return;
            System.nanoTime();
            Date _tmp = mTime;
            Time time = new Time();
            time.set(mTimeMillis);
            time.second = 0;
            time.hour = -12 + time.hour;
            long l = time.toMillis(false);
            time.hour = 12 + time.hour;
            long l1 = time.toMillis(false);
            time.hour = 0;
            time.minute = 0;
            long l2 = time.toMillis(false);
            time.monthDay = 1 + time.monthDay;
            long l3 = time.toMillis(false);
            time.set(System.currentTimeMillis());
            time.second = 0;
            long l4 = time.normalize(false);
            if ((l4 < l2 || l4 >= l3) && (l4 < l || l4 >= l1))
                i = 1;
            else
                i = 0;
            DateFormat dateformat;
            if (i == mLastDisplay && mLastFormat != null)
            {
                dateformat = mLastFormat;
            } else
            {
                switch (i)
                {
                default:
                    break label0;

                case 1: // '\001'
                    dateformat = getDateFormat();
                    break;

                case 0: // '\0'
                    dateformat = getTimeFormat();
                    break;
                }
                mLastFormat = dateformat;
            }
            setText(dateformat.format(mTime));
            if (i == 0)
            {
                if (l1 <= l3)
                    l1 = l3;
                mUpdateTimeMillis = l1;
            } else
            if (mTimeMillis < l4)
            {
                mUpdateTimeMillis = 0L;
            } else
            {
                if (l >= l2)
                    l = l2;
                mUpdateTimeMillis = l;
            }
            System.nanoTime();
            return;
        }
        throw new RuntimeException((new StringBuilder()).append("unknown display value: ").append(i).toString());
    }

}
