// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.media.IAudioService;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.*;
import android.view.KeyEvent;
import android.widget.FrameLayout;

public abstract class KeyguardViewBase extends FrameLayout
{

    private static final int BACKGROUND_COLOR = 0x70000000;
    private static final int BACKGROUND_COLOR_SAMSUN = 0;
    private static final boolean KEYGUARD_MANAGES_VOLUME = true;
    private static final Drawable mBackgroundDrawable = new Drawable() {

        public void draw(Canvas canvas)
        {
            if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
            {
                canvas.drawColor(0, android.graphics.PorterDuff.Mode.SRC);
                return;
            } else
            {
                canvas.drawColor(0x70000000, android.graphics.PorterDuff.Mode.SRC);
                return;
            }
        }

        public int getOpacity()
        {
            return -3;
        }

        public void setAlpha(int i)
        {
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
        }

    }
;
    private AudioManager mAudioManager;
    private TelephonyManager mTelephonyManager;
    protected KeyguardViewMediator.ViewMediatorCallback mViewMediatorCallback;

    public KeyguardViewBase(Context context)
    {
        this(context, null);
    }

    public KeyguardViewBase(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTelephonyManager = null;
        resetBackground();
    }

    private boolean interceptMediaKey(KeyEvent keyevent)
    {
        boolean flag;
        int i;
        flag = true;
        i = keyevent.getKeyCode();
        if (keyevent.getAction() != 0) goto _L2; else goto _L1
_L1:
        i;
        JVM INSTR lookupswitch 14: default 136
    //                   24: 187
    //                   25: 187
    //                   79: 180
    //                   85: 140
    //                   86: 180
    //                   87: 180
    //                   88: 180
    //                   89: 180
    //                   90: 180
    //                   91: 180
    //                   126: 140
    //                   127: 140
    //                   130: 180
    //                   164: 187;
           goto _L3 _L4 _L4 _L5 _L6 _L5 _L5 _L5 _L5 _L5 _L5 _L6 _L6 _L5 _L4
_L3:
        flag = false;
_L7:
        return flag;
_L6:
        if (mTelephonyManager == null)
            mTelephonyManager = (TelephonyManager)getContext().getSystemService("phone");
        if (mTelephonyManager != null && mTelephonyManager.getCallState() != 0) goto _L7; else goto _L5
_L5:
        handleMediaKeyEvent(keyevent);
        return flag;
_L4:
        this;
        JVM INSTR monitorenter ;
        if (mAudioManager == null)
            mAudioManager = (AudioManager)getContext().getSystemService("audio");
        this;
        JVM INSTR monitorexit ;
        int j;
        Exception exception;
        if (i == 24)
            j = ((flag) ? 1 : 0);
        else
            j = -1;
        if (mAudioManager.isMusicActive())
        {
            mAudioManager.adjustLocalOrRemoteStreamVolume(3, j);
            return flag;
        }
        continue; /* Loop/switch isn't completed */
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (!mAudioManager.isFmActive()) goto _L7; else goto _L8
_L8:
        mAudioManager.adjustLocalOrRemoteStreamVolume(10, j);
        return flag;
_L2:
        if (keyevent.getAction() != flag) goto _L3; else goto _L9
_L9:
        switch (i)
        {
        case 79: // 'O'
        case 85: // 'U'
        case 86: // 'V'
        case 87: // 'W'
        case 88: // 'X'
        case 89: // 'Y'
        case 90: // 'Z'
        case 91: // '['
        case 126: // '~'
        case 127: // '\177'
        case 130: 
            handleMediaKeyEvent(keyevent);
            return flag;
        }
        if (true) goto _L3; else goto _L10
_L10:
    }

    public abstract void cleanUp();

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (interceptMediaKey(keyevent))
            return true;
        else
            return super.dispatchKeyEvent(keyevent);
    }

    public void dispatchSystemUiVisibilityChanged(int i)
    {
        super.dispatchSystemUiVisibilityChanged(i);
        if (!(mContext instanceof Activity))
            setSystemUiVisibility(0x400000);
    }

    public abstract long getUserActivityTimeout();

    void handleMediaKeyEvent(KeyEvent keyevent)
    {
        IAudioService iaudioservice = android.media.IAudioService.Stub.asInterface(ServiceManager.checkService("audio"));
        if (iaudioservice != null)
        {
            try
            {
                iaudioservice.dispatchMediaKeyEvent(keyevent);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Log.e("KeyguardViewBase", (new StringBuilder()).append("dispatchMediaKeyEvent threw exception ").append(remoteexception).toString());
            }
            return;
        } else
        {
            Slog.w("KeyguardViewBase", "Unable to find IAudioService for media key event");
            return;
        }
    }

    public abstract boolean isAlarmUnlockScreen();

    public abstract void onScreenTurnedOff();

    public abstract void onScreenTurnedOn();

    public abstract void reset();

    public void resetBackground()
    {
        setBackground(mBackgroundDrawable);
    }

    public void setViewMediatorCallback(KeyguardViewMediator.ViewMediatorCallback viewmediatorcallback)
    {
        mViewMediatorCallback = viewmediatorcallback;
    }

    public abstract void show();

    public abstract void verifyUnlock();

    public abstract void wakeWhenReadyTq(int i);

}
