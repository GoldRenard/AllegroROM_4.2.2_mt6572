// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.View;
import android.widget.GridLayout;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;
import java.util.Date;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardViewManager, KeyguardUpdateMonitor, ClockView, KeyguardUpdateMonitorCallback

public class KeyguardStatusView extends GridLayout
{

    public static final int ALARM_ICON = 0x108002e;
    private static final String ANDROID_CUSTOM_FONT_FILE = "/system/fonts/ktGBK.ttf";
    public static final int BATTERY_LOW_ICON = 0;
    public static final int CHARGING_ICON = 0;
    private static final boolean DEBUG = true;
    public static final int LOCK_ICON = 0;
    private static final String TAG = "KeyguardStatusView";
    private TextView mAlarmStatusView;
    private ClockView mClockView;
    private CharSequence mDateFormatString;
    private TextView mDateView;
    private KeyguardUpdateMonitorCallback mInfoCallback = new KeyguardUpdateMonitorCallback() {

        final KeyguardStatusView this$0;

        void onKeyguardVisibilityChanged(boolean flag)
        {
            if (flag)
            {
                Slog.v("KeyguardStatusView", (new StringBuilder()).append("refresh statusview showing:").append(flag).toString());
                refresh();
            }
        }

        public void onTimeChanged()
        {
            refresh();
        }

            
            {
                this$0 = KeyguardStatusView.this;
                super();
            }
    }
;
    private LockPatternUtils mLockPatternUtils;
    private TextView mXYHYView;

    public KeyguardStatusView(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardStatusView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardStatusView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    private void maybeSetUpperCaseText(TextView textview, CharSequence charsequence)
    {
        if (KeyguardViewManager.USE_UPPER_CASE && textview.getId() != 0x10202f9)
        {
            String s;
            if (charsequence != null)
                s = charsequence.toString().toUpperCase();
            else
                s = null;
            textview.setText(s);
            return;
        } else
        {
            textview.setText(charsequence);
            return;
        }
    }

    public int getAppWidgetId()
    {
        return -2;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mInfoCallback);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mInfoCallback);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mDateFormatString = getContext().getResources().getText(0x1040063);
        mDateView = (TextView)findViewById(0x1020063);
        mXYHYView = (TextView)findViewById(0x1020306);
        mAlarmStatusView = (TextView)findViewById(0x10202e7);
        mClockView = (ClockView)findViewById(0x1020307);
        mLockPatternUtils = new LockPatternUtils(getContext());
        if (!SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
            mDateView.setTypeface(Typeface.SANS_SERIF, 1);
        View aview[] = new View[2];
        aview[0] = mDateView;
        aview[1] = mAlarmStatusView;
        for (int i = 0; i < aview.length; i++)
        {
            View view = aview[i];
            if (view == null)
                throw new RuntimeException((new StringBuilder()).append("Can't find widget at index ").append(i).toString());
            view.setSelected(true);
        }

        refresh();
    }

    public void onWindowFocusChanged(boolean flag)
    {
        super.onWindowFocusChanged(flag);
        if (flag)
            refresh();
    }

    protected void refresh()
    {
        mClockView.updateTime();
        refreshDate();
        refreshAlarmStatus();
    }

    void refreshAlarmStatus()
    {
        String s = mLockPatternUtils.getNextAlarm();
        if (!TextUtils.isEmpty(s))
        {
            maybeSetUpperCaseText(mAlarmStatusView, s);
            mAlarmStatusView.setCompoundDrawablesWithIntrinsicBounds(0x108002e, 0, 0, 0);
            mAlarmStatusView.setVisibility(0);
            return;
        } else
        {
            mAlarmStatusView.setVisibility(8);
            return;
        }
    }

    void refreshDate()
    {
        maybeSetUpperCaseText(mDateView, DateFormat.format(mDateFormatString, new Date()));
    }
}
