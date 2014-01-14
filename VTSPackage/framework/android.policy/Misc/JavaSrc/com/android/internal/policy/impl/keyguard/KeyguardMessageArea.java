// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import libcore.util.MutableInt;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUpdateMonitor, KeyguardUpdateMonitorCallback, SecurityMessageDisplay

class KeyguardMessageArea extends TextView
{
    public static class Helper
        implements SecurityMessageDisplay
    {

        KeyguardMessageArea mMessageArea;

        public void hideBouncer(int i)
        {
            mMessageArea.showMessage(i);
            mMessageArea.mShowingBouncer = false;
        }

        public void setMessage(int i, boolean flag)
        {
            if (i != 0 && flag)
            {
                mMessageArea.mMessage = mMessageArea.getContext().getResources().getText(i);
                mMessageArea.securityMessageChanged();
            }
        }

        public transient void setMessage(int i, boolean flag, Object aobj[])
        {
            if (i != 0 && flag)
            {
                mMessageArea.mMessage = mMessageArea.getContext().getString(i, aobj);
                mMessageArea.securityMessageChanged();
            }
        }

        public void setMessage(CharSequence charsequence, boolean flag)
        {
            if (!TextUtils.isEmpty(charsequence) && flag)
            {
                mMessageArea.mMessage = charsequence;
                mMessageArea.securityMessageChanged();
            }
        }

        public void setTimeout(int i)
        {
            mMessageArea.mTimeout = i;
        }

        public void showBouncer(int i)
        {
            mMessageArea.hideMessage(i, false);
            mMessageArea.mShowingBouncer = true;
        }

        Helper(View view)
        {
            mMessageArea = (KeyguardMessageArea)view.findViewById(0x1020283);
            if (mMessageArea == null)
                throw new RuntimeException((new StringBuilder()).append("Can't find keyguard_message_area in ").append(view.getClass()).toString());
            else
                return;
        }
    }


    static final int BATTERY_LOW_ICON = 0;
    static final int CHARGING_ICON = 0;
    protected static final int FADE_DURATION = 750;
    static final int SECURITY_MESSAGE_DURATION = 5000;
    protected boolean mBatteryCharged;
    protected boolean mBatteryIsLow;
    int mBatteryLevel;
    boolean mCharging;
    Runnable mClearMessageRunnable = new Runnable() {

        final KeyguardMessageArea this$0;

        public void run()
        {
            mMessage = null;
            mShowingMessage = false;
            if (mShowingBouncer)
            {
                hideMessage(750, true);
                return;
            } else
            {
                update();
                return;
            }
        }

            
            {
                this$0 = KeyguardMessageArea.this;
                super();
            }
    }
;
    private Handler mHandler;
    private KeyguardUpdateMonitorCallback mInfoCallback = new KeyguardUpdateMonitorCallback() {

        final KeyguardMessageArea this$0;

        public void onRefreshBatteryInfo(KeyguardUpdateMonitor.BatteryStatus batterystatus)
        {
            boolean flag = true;
            KeyguardMessageArea keyguardmessagearea = KeyguardMessageArea.this;
            boolean flag1;
            if (!batterystatus.isPluggedIn() && !batterystatus.isBatteryLow())
                flag1 = false;
            else
                flag1 = flag;
            keyguardmessagearea.mShowingBatteryInfo = flag1;
            KeyguardMessageArea keyguardmessagearea1 = KeyguardMessageArea.this;
            if (!batterystatus.isPluggedIn() || batterystatus.status != 2 && batterystatus.status != 5)
                flag = false;
            keyguardmessagearea1.mCharging = flag;
            mBatteryLevel = batterystatus.level;
            mBatteryCharged = batterystatus.isCharged();
            mBatteryIsLow = batterystatus.isBatteryLow();
            update();
        }

            
            {
                this$0 = KeyguardMessageArea.this;
                super();
            }
    }
;
    CharSequence mMessage;
    private CharSequence mSeparator;
    boolean mShowingBatteryInfo;
    boolean mShowingBouncer;
    boolean mShowingMessage;
    long mTimeout;
    KeyguardUpdateMonitor mUpdateMonitor;

    public KeyguardMessageArea(Context context)
    {
        this(context, null);
    }

    public KeyguardMessageArea(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mShowingBatteryInfo = false;
        mShowingBouncer = false;
        mCharging = false;
        mBatteryLevel = 100;
        mTimeout = 5000L;
        setSelected(true);
        mUpdateMonitor = KeyguardUpdateMonitor.getInstance(getContext());
        mUpdateMonitor.registerCallback(mInfoCallback);
        mHandler = new Handler(Looper.myLooper());
        mSeparator = getResources().getString(0x1040543);
        update();
    }

    private transient CharSequence concat(CharSequence acharsequence[])
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (!TextUtils.isEmpty(acharsequence[0]))
            stringbuilder.append(acharsequence[0]);
        for (int i = 1; i < acharsequence.length; i++)
        {
            CharSequence charsequence = acharsequence[i];
            if (TextUtils.isEmpty(charsequence))
                continue;
            if (stringbuilder.length() > 0)
                stringbuilder.append(mSeparator);
            stringbuilder.append(charsequence);
        }

        return stringbuilder.toString();
    }

    private CharSequence getChargeInfo(MutableInt mutableint)
    {
        boolean flag = mShowingBatteryInfo;
        String s = null;
        if (flag)
        {
            boolean flag1 = mShowingMessage;
            s = null;
            if (!flag1)
                if (mCharging)
                {
                    Context context = getContext();
                    int i;
                    if (mBatteryCharged)
                        i = 0x10402f2;
                    else
                        i = 0x10402f1;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(mBatteryLevel);
                    s = context.getString(i, aobj);
                    mutableint.value = 0;
                } else
                {
                    boolean flag2 = mBatteryIsLow;
                    s = null;
                    if (flag2)
                    {
                        String s1 = getContext().getString(0x10402f4);
                        mutableint.value = 0;
                        return s1;
                    }
                }
        }
        return s;
    }

    private void hideMessage(int i, boolean flag)
    {
        if (i > 0)
        {
            ObjectAnimator objectanimator = ObjectAnimator.ofFloat(this, "alpha", new float[] {
                0.0F
            });
            objectanimator.setDuration(i);
            if (flag)
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final KeyguardMessageArea this$0;

                    public void onAnimationEnd(Animator animator)
                    {
                        update();
                    }

            
            {
                this$0 = KeyguardMessageArea.this;
                super();
            }
                }
);
            objectanimator.start();
        } else
        {
            setAlpha(0.0F);
            if (flag)
            {
                update();
                return;
            }
        }
    }

    private void setTextMediatek(CharSequence charsequence)
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (charsequence != null && charsequence.length() > 0)
        {
            stringbuilder.append(charsequence);
            stringbuilder.append(mSeparator);
        }
        stringbuilder.append(getContext().getText(0x20500a4));
        setText(stringbuilder.toString());
    }

    private void showMessage(int i)
    {
        if (i > 0)
        {
            ObjectAnimator objectanimator = ObjectAnimator.ofFloat(this, "alpha", new float[] {
                1.0F
            });
            objectanimator.setDuration(i);
            objectanimator.start();
            return;
        } else
        {
            setAlpha(1.0F);
            return;
        }
    }

    CharSequence getCurrentMessage()
    {
        if (mShowingMessage)
            return mMessage;
        else
            return null;
    }

    String getOwnerInfo()
    {
        int i = 1;
        android.content.ContentResolver contentresolver = getContext().getContentResolver();
        if (android.provider.Settings.Secure.getIntForUser(contentresolver, "lock_screen_owner_info_enabled", i, -2) == 0)
            i = 0;
        if (i != 0 && !mShowingMessage)
            return android.provider.Settings.Secure.getStringForUser(contentresolver, "lock_screen_owner_info", -2);
        else
            return null;
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mUpdateMonitor.removeCallback(mInfoCallback);
        mUpdateMonitor = null;
    }

    public void securityMessageChanged()
    {
        setAlpha(1.0F);
        mShowingMessage = true;
        update();
        mHandler.removeCallbacks(mClearMessageRunnable);
        if (mTimeout > 0L)
            mHandler.postDelayed(mClearMessageRunnable, mTimeout);
        announceForAccessibility(getText());
    }

    void update()
    {
        MutableInt mutableint = new MutableInt(0);
        CharSequence acharsequence[] = new CharSequence[3];
        acharsequence[0] = getChargeInfo(mutableint);
        acharsequence[1] = getOwnerInfo();
        acharsequence[2] = getCurrentMessage();
        CharSequence charsequence = concat(acharsequence);
        setCompoundDrawablesWithIntrinsicBounds(mutableint.value, 0, 0, 0);
        if (!KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked())
        {
            setText(charsequence);
            return;
        } else
        {
            setTextMediatek(charsequence);
            return;
        }
    }


}
