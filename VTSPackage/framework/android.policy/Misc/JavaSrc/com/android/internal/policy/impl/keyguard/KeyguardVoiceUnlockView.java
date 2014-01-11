// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.media.AudioSystem;
import android.os.PowerManager;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, VoiceUnlock, BiometricSensorUnlock, KeyguardUpdateMonitor, 
//            KeyguardSecurityViewHelper, KeyguardSecurityCallback, SecurityMessageDisplay, KeyguardUpdateMonitorCallback

public class KeyguardVoiceUnlockView extends LinearLayout
    implements KeyguardSecurityView
{

    private static final boolean DEBUG = true;
    private static final String TAG = "VoiceUnlock";
    private BiometricSensorUnlock mBiometricUnlock;
    private Drawable mBouncerFrame;
    private View mEcaView;
    private boolean mIsShowing;
    private final Object mIsShowingLock;
    private KeyguardSecurityCallback mKeyguardSecurityCallback;
    private LockPatternUtils mLockPatternUtils;
    private SecurityMessageDisplay mSecurityMessageDisplay;
    KeyguardUpdateMonitorCallback mUpdateCallback = new KeyguardUpdateMonitorCallback() {

        final KeyguardVoiceUnlockView this$0;

        public void onKeyguardVisibilityChanged(boolean flag)
        {
            log((new StringBuilder()).append("onKeyguardVisibilityChanged(").append(flag).append(")").toString());
            boolean flag1;
            synchronized (mIsShowingLock)
            {
                flag1 = mIsShowing;
                mIsShowing = flag;
            }
            PowerManager powermanager = (PowerManager)stop.getSystemService("power");
            if (mBiometricUnlock != null)
                if (!flag && flag1)
                    mBiometricUnlock.stop();
                else
                if (flag && powermanager.isScreenOn() && !flag1)
                {
                    maybeStartBiometricUnlock();
                    return;
                }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onPhoneStateChanged(int i)
        {
            log((new StringBuilder()).append("onPhoneStateChanged(").append(i).append(")").toString());
            if (i == 1 && mBiometricUnlock != null)
                mBiometricUnlock.stopAndShowBackup();
        }

        public void onUserSwitched(int i)
        {
            log((new StringBuilder()).append("onUserSwitched(").append(i).append(")").toString());
            if (mBiometricUnlock != null)
                mBiometricUnlock.stop();
        }

            
            {
                this$0 = KeyguardVoiceUnlockView.this;
                super();
            }
    }
;
    private View mVoiceUnlockAreaView;

    public KeyguardVoiceUnlockView(Context context)
    {
        this(context, null);
    }

    public KeyguardVoiceUnlockView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIsShowing = false;
        mIsShowingLock = new Object();
    }

    private void initializeBiometricUnlockView()
    {
        log("initializeBiometricUnlockView()");
        mVoiceUnlockAreaView = findViewById(0x10203bf);
        if (mVoiceUnlockAreaView != null)
        {
            mBiometricUnlock = new VoiceUnlock(mContext, this);
            mBiometricUnlock.initializeView(mVoiceUnlockAreaView);
            return;
        } else
        {
            log("Couldn't find biometric unlock view");
            return;
        }
    }

    private void log(String s)
    {
        Xlog.d("VoiceUnlock", (new StringBuilder()).append("KeyguardVoiceUnlockView: ").append(s).toString());
    }

    private void maybeStartBiometricUnlock()
    {
        KeyguardUpdateMonitor keyguardupdatemonitor;
        boolean flag;
        boolean flag1;
        log("maybeStartBiometricUnlock()");
        if (mBiometricUnlock != null)
        {
            keyguardupdatemonitor = KeyguardUpdateMonitor.getInstance(mContext);
            PowerManager powermanager;
            boolean flag2;
            if (keyguardupdatemonitor.getFailedUnlockAttempts() >= 5)
                flag = true;
            else
                flag = false;
            if (AudioSystem.isStreamActive(3, 0) || AudioSystem.isStreamActive(10, 0))
                flag1 = true;
            else
                flag1 = false;
            powermanager = (PowerManager)mContext.getSystemService("power");
            synchronized (mIsShowingLock)
            {
                flag2 = mIsShowing;
            }
            if (powermanager.isScreenOn() && flag2)
                break MISSING_BLOCK_LABEL_124;
            mBiometricUnlock.stop();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (keyguardupdatemonitor.getPhoneState() == 0 && !keyguardupdatemonitor.getMaxBiometricUnlockAttemptsReached() && !flag && !flag1)
        {
            mBiometricUnlock.start();
            return;
        } else
        {
            mBiometricUnlock.stopAndShowBackup();
            return;
        }
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mKeyguardSecurityCallback;
    }

    public void hideBouncer(int i)
    {
        KeyguardSecurityViewHelper.hideBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    public boolean needsInput()
    {
        return false;
    }

    public void onDetachedFromWindow()
    {
        log("onDetachedFromWindow()");
        if (mBiometricUnlock != null)
            mBiometricUnlock.stop();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mUpdateCallback);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        initializeBiometricUnlockView();
        mSecurityMessageDisplay = new KeyguardMessageArea.Helper(this);
        mEcaView = findViewById(0x10202b1);
        View view = findViewById(0x10202ad);
        if (view != null)
            mBouncerFrame = view.getBackground();
    }

    public void onPause()
    {
        log("onPause()");
        if (mBiometricUnlock != null)
            mBiometricUnlock.stop();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mUpdateCallback);
    }

    public void onResume(int i)
    {
        log("onResume()");
        mIsShowing = KeyguardUpdateMonitor.getInstance(mContext).isKeyguardVisible();
        maybeStartBiometricUnlock();
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mUpdateCallback);
    }

    public void reset()
    {
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mKeyguardSecurityCallback = keyguardsecuritycallback;
        ((VoiceUnlock)mBiometricUnlock).setKeyguardCallback(keyguardsecuritycallback);
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }

    public void showBouncer(int i)
    {
        KeyguardSecurityViewHelper.showBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    public void showUsabilityHint()
    {
    }






/*
    static boolean access$302(KeyguardVoiceUnlockView keyguardvoiceunlockview, boolean flag)
    {
        keyguardvoiceunlockview.mIsShowing = flag;
        return flag;
    }

*/


}
