// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import java.util.Date;

public class DateView extends TextView
{

    private static final String TAG = "DateView";
    private boolean mAttachedToWindow;
    private BroadcastReceiver mIntentReceiver;
    private boolean mUpdating;
    private boolean mWindowVisible;

    public DateView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIntentReceiver = new BroadcastReceiver() {

            final DateView this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                if ("android.intent.action.TIME_TICK".equals(s) || "android.intent.action.TIME_SET".equals(s) || "android.intent.action.TIMEZONE_CHANGED".equals(s))
                    updateClock();
            }

            
            {
                this$0 = DateView.this;
                super();
            }
        }
;
    }

    private boolean isVisible()
    {
        Object obj = this;
        do
        {
            if (((View) (obj)).getVisibility() != 0)
                return false;
            android.view.ViewParent viewparent = ((View) (obj)).getParent();
            if (viewparent instanceof View)
                obj = (View)viewparent;
            else
                return true;
        } while (true);
    }

    private void setUpdates()
    {
label0:
        {
            boolean flag;
            if (mAttachedToWindow && mWindowVisible && isVisible())
                flag = true;
            else
                flag = false;
            if (flag != mUpdating)
            {
                mUpdating = flag;
                if (!flag)
                    break label0;
                IntentFilter intentfilter = new IntentFilter();
                intentfilter.addAction("android.intent.action.TIME_TICK");
                intentfilter.addAction("android.intent.action.TIME_SET");
                intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
                mContext.registerReceiver(mIntentReceiver, intentfilter, null, null);
                updateClock();
            }
            return;
        }
        mContext.unregisterReceiver(mIntentReceiver);
    }

    protected int getSuggestedMinimumWidth()
    {
        return 0;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mAttachedToWindow = true;
        setUpdates();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mAttachedToWindow = false;
        setUpdates();
    }

    protected void onVisibilityChanged(View view, int i)
    {
        super.onVisibilityChanged(view, i);
        setUpdates();
    }

    protected void onWindowVisibilityChanged(int i)
    {
        super.onWindowVisibilityChanged(i);
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        mWindowVisible = flag;
        setUpdates();
    }

    public void updateClock()
    {
        setText(DateFormat.format(getContext().getString(0x7f0b00f0), new Date()));
    }
}
