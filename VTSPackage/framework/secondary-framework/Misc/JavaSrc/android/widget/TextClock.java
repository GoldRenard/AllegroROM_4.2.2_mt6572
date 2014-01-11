// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.TypedArray;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import java.util.Calendar;
import java.util.TimeZone;

// Referenced classes of package android.widget:
//            TextView

public class TextClock extends TextView
{

    public static final CharSequence DEFAULT_FORMAT_12_HOUR = "h:mm aa";
    public static final CharSequence DEFAULT_FORMAT_24_HOUR = "k:mm";
    private boolean mAttached;
    private CharSequence mFormat;
    private CharSequence mFormat12;
    private CharSequence mFormat24;
    private final ContentObserver mFormatChangeObserver;
    private boolean mHasSeconds;
    private final BroadcastReceiver mIntentReceiver;
    private final Runnable mTicker;
    private Calendar mTime;
    private String mTimeZone;

    public TextClock(Context context)
    {
        super(context);
        mFormat12 = DEFAULT_FORMAT_12_HOUR;
        mFormat24 = DEFAULT_FORMAT_24_HOUR;
        mFormatChangeObserver = new ContentObserver(new Handler()) {

            final TextClock this$0;

            public void onChange(boolean flag)
            {
                chooseFormat();
                onTimeChanged();
            }

            public void onChange(boolean flag, Uri uri)
            {
                chooseFormat();
                onTimeChanged();
            }

            
            {
                this$0 = TextClock.this;
                super(handler);
            }
        }
;
        mIntentReceiver = new BroadcastReceiver() {

            final TextClock this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (mTimeZone == null && "android.intent.action.TIMEZONE_CHANGED".equals(intent.getAction()))
                {
                    String s = intent.getStringExtra("time-zone");
                    createTime(s);
                }
                onTimeChanged();
            }

            
            {
                this$0 = TextClock.this;
                super();
            }
        }
;
        mTicker = new Runnable() {

            final TextClock this$0;

            public void run()
            {
                onTimeChanged();
                long l = SystemClock.uptimeMillis();
                long l1 = l + (1000L - l % 1000L);
                getHandler().postAtTime(mTicker, l1);
            }

            
            {
                this$0 = TextClock.this;
                super();
            }
        }
;
        init();
    }

    public TextClock(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public TextClock(Context context, AttributeSet attributeset, int i)
    {
        TypedArray typedarray;
        super(context, attributeset, i);
        mFormat12 = DEFAULT_FORMAT_12_HOUR;
        mFormat24 = DEFAULT_FORMAT_24_HOUR;
        mFormatChangeObserver = new _cls1(new Handler());
        mIntentReceiver = new _cls2();
        mTicker = new _cls3();
        typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.TextClock, i, 0);
        CharSequence charsequence = typedarray.getText(0);
        if (charsequence != null)
            break MISSING_BLOCK_LABEL_94;
        charsequence = DEFAULT_FORMAT_12_HOUR;
        CharSequence charsequence1;
        mFormat12 = charsequence;
        charsequence1 = typedarray.getText(1);
        if (charsequence1 != null)
            break MISSING_BLOCK_LABEL_118;
        charsequence1 = DEFAULT_FORMAT_24_HOUR;
        mFormat24 = charsequence1;
        mTimeZone = typedarray.getString(2);
        typedarray.recycle();
        init();
        return;
        Exception exception;
        exception;
        typedarray.recycle();
        throw exception;
    }

    private static CharSequence abc(CharSequence charsequence, CharSequence charsequence1, CharSequence charsequence2)
    {
        if (charsequence == null)
        {
            if (charsequence1 == null)
                return charsequence2;
            else
                return charsequence1;
        } else
        {
            return charsequence;
        }
    }

    private void chooseFormat()
    {
        chooseFormat(true);
    }

    private void chooseFormat(boolean flag)
    {
label0:
        {
            if (is24HourModeEnabled())
                mFormat = abc(mFormat24, mFormat12, DEFAULT_FORMAT_24_HOUR);
            else
                mFormat = abc(mFormat12, mFormat24, DEFAULT_FORMAT_12_HOUR);
            boolean flag1 = mHasSeconds;
            mHasSeconds = DateFormat.hasSeconds(mFormat);
            if (flag && mAttached && flag1 != mHasSeconds)
            {
                if (!flag1)
                    break label0;
                getHandler().removeCallbacks(mTicker);
            }
            return;
        }
        mTicker.run();
    }

    private void createTime(String s)
    {
        if (s != null)
        {
            mTime = Calendar.getInstance(TimeZone.getTimeZone(s));
            return;
        } else
        {
            mTime = Calendar.getInstance();
            return;
        }
    }

    private void init()
    {
        createTime(mTimeZone);
        chooseFormat(false);
    }

    private void onTimeChanged()
    {
        mTime.setTimeInMillis(System.currentTimeMillis());
        setText(DateFormat.format(mFormat, mTime));
    }

    private void registerObserver()
    {
        getContext().getContentResolver().registerContentObserver(android.provider.Settings.System.CONTENT_URI, true, mFormatChangeObserver);
    }

    private void registerReceiver()
    {
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        getContext().registerReceiver(mIntentReceiver, intentfilter, null, getHandler());
    }

    private void unregisterObserver()
    {
        getContext().getContentResolver().unregisterContentObserver(mFormatChangeObserver);
    }

    private void unregisterReceiver()
    {
        getContext().unregisterReceiver(mIntentReceiver);
    }

    public CharSequence getFormat12Hour()
    {
        return mFormat12;
    }

    public CharSequence getFormat24Hour()
    {
        return mFormat24;
    }

    public String getTimeZone()
    {
        return mTimeZone;
    }

    public boolean is24HourModeEnabled()
    {
        return DateFormat.is24HourFormat(getContext());
    }

    protected void onAttachedToWindow()
    {
label0:
        {
            super.onAttachedToWindow();
            if (!mAttached)
            {
                mAttached = true;
                registerReceiver();
                registerObserver();
                createTime(mTimeZone);
                if (!mHasSeconds)
                    break label0;
                mTicker.run();
            }
            return;
        }
        onTimeChanged();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
        {
            unregisterReceiver();
            unregisterObserver();
            getHandler().removeCallbacks(mTicker);
            mAttached = false;
        }
    }

    public void setFormat12Hour(CharSequence charsequence)
    {
        mFormat12 = charsequence;
        chooseFormat();
        onTimeChanged();
    }

    public void setFormat24Hour(CharSequence charsequence)
    {
        mFormat24 = charsequence;
        chooseFormat();
        onTimeChanged();
    }

    public void setTimeZone(String s)
    {
        mTimeZone = s;
        createTime(s);
        onTimeChanged();
    }






}
