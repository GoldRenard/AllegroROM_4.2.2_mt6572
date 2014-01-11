// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.TypedArray;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            ViewAnimator

public class ViewFlipper extends ViewAnimator
{

    private static final int DEFAULT_INTERVAL = 3000;
    private static final boolean LOGD = false;
    private static final String TAG = "ViewFlipper";
    private final int FLIP_MSG;
    private boolean mAutoStart;
    private int mFlipInterval;
    private final Handler mHandler;
    private final BroadcastReceiver mReceiver;
    private boolean mRunning;
    private boolean mStarted;
    private boolean mUserPresent;
    private boolean mVisible;

    public ViewFlipper(Context context)
    {
        ViewAnimator(context);
        mFlipInterval = 3000;
        mAutoStart = false;
        mRunning = false;
        mStarted = false;
        mVisible = false;
        mUserPresent = true;
        mReceiver = new BroadcastReceiver() {

            final ViewFlipper this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                if ("android.intent.action.SCREEN_OFF".equals(s))
                {
                    mUserPresent = false;
                    updateRunning();
                } else
                if ("android.intent.action.USER_PRESENT".equals(s))
                {
                    mUserPresent = true;
                    updateRunning(false);
                    return;
                }
            }

            
            {
                this$0 = ViewFlipper.this;
                BroadcastReceiver();
            }
        }
;
        FLIP_MSG = 1;
        mHandler = new Handler() {

            final ViewFlipper this$0;

            public void handleMessage(Message message)
            {
                if (message.what == 1 && mRunning)
                {
                    showNext();
                    sendMessageDelayed(obtainMessage(1), mFlipInterval);
                }
            }

            
            {
                this$0 = ViewFlipper.this;
                Handler();
            }
        }
;
    }

    public ViewFlipper(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mFlipInterval = 3000;
        mAutoStart = false;
        mRunning = false;
        mStarted = false;
        mVisible = false;
        mUserPresent = true;
        mReceiver = new _cls1();
        FLIP_MSG = 1;
        mHandler = new _cls2();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewFlipper);
        mFlipInterval = typedarray.getInt(0, 3000);
        mAutoStart = typedarray.getBoolean(1, false);
        typedarray.recycle();
    }

    private void updateRunning()
    {
        updateRunning(true);
    }

    private void updateRunning(boolean flag)
    {
        boolean flag1;
        if (mVisible && mStarted && mUserPresent)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != mRunning)
        {
            if (flag1)
            {
                showOnly(super.mWhichChild, flag);
                Message message = mHandler.obtainMessage(1);
                mHandler.sendMessageDelayed(message, mFlipInterval);
            } else
            {
                mHandler.removeMessages(1);
            }
            mRunning = flag1;
        }
    }

    public boolean isAutoStart()
    {
        return mAutoStart;
    }

    public boolean isFlipping()
    {
        return mStarted;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.USER_PRESENT");
        getContext().registerReceiver(mReceiver, intentfilter);
        if (mAutoStart)
            startFlipping();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mVisible = false;
        getContext().unregisterReceiver(mReceiver);
        updateRunning();
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/ViewFlipper.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/ViewFlipper.getName());
    }

    protected void onWindowVisibilityChanged(int i)
    {
        super.onWindowVisibilityChanged(i);
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        mVisible = flag;
        updateRunning(false);
    }

    public void setAutoStart(boolean flag)
    {
        mAutoStart = flag;
    }

    public void setFlipInterval(int i)
    {
        mFlipInterval = i;
    }

    public void startFlipping()
    {
        mStarted = true;
        updateRunning();
    }

    public void stopFlipping()
    {
        mStarted = false;
        updateRunning();
    }


/*
    static boolean access$002(ViewFlipper viewflipper, boolean flag)
    {
        viewflipper.mUserPresent = flag;
        return flag;
    }

*/




}
