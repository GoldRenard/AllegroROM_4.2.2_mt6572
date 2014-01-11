// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.PowerManager;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, FaceUnlock, KeyguardUpdateMonitor, BiometricSensorUnlock, 
//            KeyguardSecurityViewHelper, KeyguardSecurityCallback, SecurityMessageDisplay, KeyguardUpdateMonitorCallback

public class KeyguardFaceUnlockView extends LinearLayout
    implements KeyguardSecurityView
{

    private static final boolean DEBUG = false;
    private static final String TAG = "FULKeyguardFaceUnlockView";
    private BiometricSensorUnlock mBiometricUnlock;
    private Drawable mBouncerFrame;
    private ImageButton mCancelButton;
    private View mEcaView;
    private View mFaceUnlockAreaView;
    private boolean mIsShowing;
    private final Object mIsShowingLock;
    private KeyguardSecurityCallback mKeyguardSecurityCallback;
    private LockPatternUtils mLockPatternUtils;
    private SecurityMessageDisplay mSecurityMessageDisplay;
    KeyguardUpdateMonitorCallback mUpdateCallback = new KeyguardUpdateMonitorCallback() ;

    public KeyguardFaceUnlockView(Context context)
    {
        this(context, null);
    }

    public KeyguardFaceUnlockView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIsShowing = false;
        mIsShowingLock = new Object();
    }

    private void initializeBiometricUnlockView()
    {
        mFaceUnlockAreaView = findViewById(0x10202ae);
        if (mFaceUnlockAreaView != null)
        {
            mBiometricUnlock = new FaceUnlock(mContext);
            mCancelButton = (ImageButton)findViewById(0x10202b0);
            mCancelButton.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardFaceUnlockView this$0;

                public void onClick(View view)
                {
                    mBiometricUnlock.stopAndShowBackup();
                }

            
            {
                this$0 = KeyguardFaceUnlockView.this;
                super();
            }
            }
);
            return;
        } else
        {
            Log.w("FULKeyguardFaceUnlockView", "Couldn't find biometric unlock view");
            return;
        }
    }

    private void maybeStartBiometricUnlock()
    {
        KeyguardUpdateMonitor keyguardupdatemonitor;
        boolean flag;
        if (mBiometricUnlock != null)
        {
            keyguardupdatemonitor = KeyguardUpdateMonitor.getInstance(mContext);
            PowerManager powermanager;
            boolean flag1;
            if (keyguardupdatemonitor.getFailedUnlockAttempts() >= 5)
                flag = true;
            else
                flag = false;
            powermanager = (PowerManager)mContext.getSystemService("power");
            synchronized (mIsShowingLock)
            {
                flag1 = mIsShowing;
            }
            if (powermanager.isScreenOn() && flag1)
                break MISSING_BLOCK_LABEL_92;
            mBiometricUnlock.stop();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (keyguardupdatemonitor.getPhoneState() == 0 && !keyguardupdatemonitor.getMaxBiometricUnlockAttemptsReached() && !flag)
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

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        mBiometricUnlock.initializeView(mFaceUnlockAreaView);
    }

    public void onPause()
    {
        if (mBiometricUnlock != null)
            mBiometricUnlock.stop();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mUpdateCallback);
    }

    public void onResume(int i)
    {
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
        ((FaceUnlock)mBiometricUnlock).setKeyguardCallback(keyguardsecuritycallback);
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
    static boolean access$202(KeyguardFaceUnlockView keyguardfaceunlockview, boolean flag)
    {
        keyguardfaceunlockview.mIsShowing = flag;
        return flag;
    }

*/


}
