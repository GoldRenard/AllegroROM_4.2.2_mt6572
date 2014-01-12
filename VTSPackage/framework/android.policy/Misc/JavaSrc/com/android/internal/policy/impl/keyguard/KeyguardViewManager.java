// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.*;
import android.util.Log;
import android.util.SparseArray;
import android.view.*;
import android.widget.FrameLayout;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUpdateMonitor, KeyguardHostView, KeyguardPasswordView, KeyguardUtils, 
//            KeyguardViewBase

public class KeyguardViewManager
{
    public static interface ShowListener
    {

        public abstract void onShown(IBinder ibinder);
    }

    class ViewManagerHost extends FrameLayout
    {

        final KeyguardViewManager this$0;

        public boolean dispatchKeyEvent(KeyEvent keyevent)
        {
label0:
            {
                if (mKeyguardView != null)
                {
                    if (keyevent.getAction() == 0)
                    {
                        int i = keyevent.getKeyCode();
                        if (i == 4 && mKeyguardView.handleBackKey() || i == 82 && mKeyguardView.handleMenuKey())
                            break label0;
                    }
                    if (mKeyguardView.dispatchKeyEvent(keyevent))
                        break label0;
                }
                return super.dispatchKeyEvent(keyevent);
            }
            return true;
        }

        protected boolean fitSystemWindows(Rect rect)
        {
            Log.v("TAG", (new StringBuilder()).append("bug 7643792: fitSystemWindows(").append(rect.toShortString()).append(")").toString());
            return super.fitSystemWindows(rect);
        }

        protected void onConfigurationChanged(Configuration configuration)
        {
            super.onConfigurationChanged(configuration);
            KeyguardUtils.xlogD(KeyguardViewManager.TAG, (new StringBuilder()).append("onConfigurationChanged, old orientation=").append(mCreateOrientation).append(", new orientation=").append(configuration.orientation).toString());
            if (mCreateOrientation != configuration.orientation)
            {
                post(new Runnable() {

                    final ViewManagerHost this$1;

                    public void run()
                    {
                        KeyguardViewManager keyguardviewmanager = _fld0;
                        keyguardviewmanager;
                        JVM INSTR monitorenter ;
                        if (mKeyguardHost.getVisibility() != 0)
                            break MISSING_BLOCK_LABEL_51;
                        maybeCreateKeyguardLocked(shouldEnableScreenRotation(), true, null);
_L2:
                        return;
                        KeyguardUtils.xlogD(KeyguardViewManager.TAG, "onConfigurationChanged: view not visible");
                        if (true) goto _L2; else goto _L1
_L1:
                        Exception exception;
                        exception;
                        keyguardviewmanager;
                        JVM INSTR monitorexit ;
                        throw exception;
                    }

            
            {
                this$1 = ViewManagerHost.this;
                super();
            }
                }
);
                return;
            } else
            {
                KeyguardUtils.xlogD(KeyguardViewManager.TAG, "onConfigurationChanged: orientation not changed");
                return;
            }
        }

        public ViewManagerHost(Context context)
        {
            this$0 = KeyguardViewManager.this;
            super(context);
            setFitsSystemWindows(true);
            mCreateOrientation = context.getResources().getConfiguration().orientation;
        }
    }


    private static final boolean DEBUG = true;
    static final int DIGIT_PRESS_WAKE_MILLIS = 5000;
    private static String TAG = "KeyguardViewManager";
    public static boolean USE_UPPER_CASE = true;
    private final Context mContext;
    private int mCreateOrientation;
    private FrameLayout mKeyguardHost;
    private KeyguardHostView mKeyguardView;
    private LockPatternUtils mLockPatternUtils;
    private boolean mNeedsInput;
    private boolean mScreenOn;
    SparseArray mStateContainer;
    private final ViewManager mViewManager;
    private final KeyguardViewMediator.ViewMediatorCallback mViewMediatorCallback;
    private android.view.WindowManager.LayoutParams mWindowLayoutParams;

    public KeyguardViewManager(Context context, ViewManager viewmanager, KeyguardViewMediator.ViewMediatorCallback viewmediatorcallback, LockPatternUtils lockpatternutils)
    {
        mNeedsInput = false;
        mScreenOn = false;
        mStateContainer = new SparseArray();
        mContext = context;
        mViewManager = viewmanager;
        mViewMediatorCallback = viewmediatorcallback;
        mLockPatternUtils = lockpatternutils;
    }

    private void inflateKeyguardView(Bundle bundle)
    {
        int i = 0x10202b3;
        int j = 0x1090058;
        if (KeyguardUpdateMonitor.isAlarmBoot())
        {
            j = 0x2070016;
            i = 0x2100054;
        }
        View view = mKeyguardHost.findViewById(i);
        if (view != null)
            mKeyguardHost.removeView(view);
        mCreateOrientation = mContext.getResources().getConfiguration().orientation;
        mKeyguardView = (KeyguardHostView)LayoutInflater.from(mContext).inflate(j, mKeyguardHost, true).findViewById(i);
        mKeyguardView.setLockPatternUtils(mLockPatternUtils);
        mKeyguardView.setViewMediatorCallback(mViewMediatorCallback);
        if (mViewMediatorCallback != null)
        {
            KeyguardPasswordView keyguardpasswordview = (KeyguardPasswordView)mKeyguardView.findViewById(0x10202c0);
            if (keyguardpasswordview != null)
                mViewMediatorCallback.setNeedsInput(keyguardpasswordview.needsInput());
        }
        updateKeyguardViewFromOptions(bundle);
    }

    private void maybeCreateKeyguardLocked(boolean flag, boolean flag1, Bundle bundle)
    {
        boolean flag2 = mContext instanceof Activity;
        if (mKeyguardHost != null)
            mKeyguardHost.saveHierarchyState(mStateContainer);
        if (mKeyguardHost == null)
        {
            KeyguardUtils.xlogD(TAG, "keyguard host is null, creating it...");
            mKeyguardHost = new ViewManagerHost(mContext);
            int i = 0x110900;
            if (KeyguardUpdateMonitor.getInstance(mContext).dmIsLocked())
            {
                KeyguardUtils.xlogD(TAG, "show(); dmIsLocked ");
                i = 0x10000 | (0x100 | i & 0xfffff7ff);
            } else
            if (KeyguardUpdateMonitor.isAlarmBoot())
            {
                KeyguardUtils.xlogD(TAG, "show(); AlarmBoot ");
                i = 0x800 | 0xfffeffff & (i & 0xfffffeff);
            }
            if (!mNeedsInput)
                i |= 0x20000;
            if (ActivityManager.isHighEndGfx())
                i |= 0x1000000;
            char c;
            if (flag2)
                c = '\002';
            else
                c = '\u07D4';
            android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -1, c, i, -3);
            layoutparams.softInputMode = 16;
            layoutparams.windowAnimations = 0x10301e2;
            if (ActivityManager.isHighEndGfx())
            {
                layoutparams.flags = 0x1000000 | layoutparams.flags;
                layoutparams.privateFlags = 2 | layoutparams.privateFlags;
            }
            layoutparams.privateFlags = 8 | layoutparams.privateFlags;
            if (flag2)
                layoutparams.privateFlags = 0x10 | layoutparams.privateFlags;
            String s;
            if (flag2)
                s = "KeyguardMock";
            else
                s = "Keyguard";
            layoutparams.setTitle(s);
            mWindowLayoutParams = layoutparams;
            mViewManager.addView(mKeyguardHost, layoutparams);
        }
        if (flag1 && mKeyguardView != null)
            mKeyguardView.cleanUp();
        if (flag1 || mKeyguardView == null)
        {
            inflateKeyguardView(bundle);
            mKeyguardView.requestFocus();
        }
        updateUserActivityTimeoutInWindowLayoutParams();
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        mKeyguardHost.restoreHierarchyState(mStateContainer);
    }

    private void maybeEnableScreenRotation(boolean flag)
    {
        if (flag)
        {
            KeyguardUtils.xlogD(TAG, "Rotation sensor for lock screen On!");
            mWindowLayoutParams.screenOrientation = 2;
        } else
        {
            KeyguardUtils.xlogD(TAG, "Rotation sensor for lock screen Off!");
            mWindowLayoutParams.screenOrientation = 5;
        }
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
    }

    private boolean shouldEnableScreenRotation()
    {
        boolean flag;
label0:
        {
            Resources resources = mContext.getResources();
            if (!SystemProperties.getBoolean("lockscreen.rot_override", false))
            {
                boolean flag1 = resources.getBoolean(0x1110027);
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    private void updateKeyguardViewFromOptions(Bundle bundle)
    {
        if (bundle != null)
        {
            int i = bundle.getInt("showappwidget", 0);
            if (i != 0)
                mKeyguardView.goToWidget(i);
        }
    }

    private void updateUserActivityTimeoutInWindowLayoutParams()
    {
        if (mKeyguardView != null)
        {
            long l = mKeyguardView.getUserActivityTimeout();
            if (l >= 0L)
            {
                mWindowLayoutParams.userActivityTimeout = l;
                return;
            }
        }
        mWindowLayoutParams.userActivityTimeout = 10000L;
    }

    public void dismiss()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("dismiss mScreenOn=").append(mScreenOn).toString());
        if (mScreenOn)
            mKeyguardView.dismiss();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void hide()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("hide() mKeyguardView=").append(mKeyguardView).toString());
        if (mKeyguardHost != null)
        {
            mKeyguardHost.setVisibility(8);
            mStateContainer.clear();
            if (mKeyguardView != null)
            {
                final KeyguardHostView lastView = mKeyguardView;
                mKeyguardView = null;
                mKeyguardHost.postDelayed(new Runnable() {

                    final KeyguardViewManager this$0;
                    final KeyguardViewBase val$lastView;

                    public void run()
                    {
                        synchronized (KeyguardViewManager.this)
                        {
                            KeyguardUtils.xlogD(KeyguardViewManager.TAG, (new StringBuilder()).append("hide() runnable lastView=").append(lastView).toString());
                            lastView.cleanUp();
                            mKeyguardHost.removeView(lastView);
                        }
                        return;
                        exception1;
                        keyguardviewmanager;
                        JVM INSTR monitorexit ;
                        throw exception1;
                    }

            
            {
                this$0 = KeyguardViewManager.this;
                lastView = keyguardviewbase;
                super();
            }
                }
, 500L);
            }
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public boolean isAlarmUnlockScreen()
    {
        if (mKeyguardView != null)
            return mKeyguardView.isAlarmUnlockScreen();
        else
            return false;
    }

    public boolean isShowing()
    {
        this;
        JVM INSTR monitorenter ;
        if (mKeyguardHost == null) goto _L2; else goto _L1
_L1:
        int i = mKeyguardHost.getVisibility();
        if (i != 0) goto _L2; else goto _L3
_L3:
        boolean flag = true;
_L5:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        flag = false;
        if (true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    public void onScreenTurnedOff()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD(TAG, "onScreenTurnedOff()");
        mScreenOn = false;
        if (mKeyguardView != null)
            mKeyguardView.onScreenTurnedOff();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onScreenTurnedOn(final ShowListener showListener)
    {
        this;
        JVM INSTR monitorenter ;
        Log.d(TAG, "onScreenTurnedOn()");
        mScreenOn = true;
        if (mKeyguardView == null) goto _L2; else goto _L1
_L1:
        mKeyguardView.onScreenTurnedOn();
        if (mCreateOrientation != mContext.getResources().getConfiguration().orientation)
        {
            KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("onScreenTurnedOn orientation is different, recreate it. mCreateOrientation=").append(mCreateOrientation).append(", newConfig=").append(mContext.getResources().getConfiguration().orientation).toString());
            maybeCreateKeyguardLocked(shouldEnableScreenRotation(), true, null);
        }
        if (showListener == null) goto _L4; else goto _L3
_L3:
        if (mKeyguardHost.getVisibility() != 0) goto _L6; else goto _L5
_L5:
        KeyguardUtils.xlogD(TAG, "onScreenTurnedOn mKeyguardView visible, post runnable");
        mKeyguardHost.post(new Runnable() {

            final KeyguardViewManager this$0;
            final ShowListener val$showListener;

            public void run()
            {
                if (mKeyguardHost.getVisibility() == 0)
                {
                    KeyguardUtils.xlogD(KeyguardViewManager.TAG, "onScreenTurnedOn mKeyguardView visible, showListener.onShown");
                    showListener.onShown(mKeyguardHost.getWindowToken());
                    return;
                } else
                {
                    KeyguardUtils.xlogD(KeyguardViewManager.TAG, "onScreenTurnedOn mKeyguardView !visible showListener.onShown");
                    showListener.onShown(null);
                    return;
                }
            }

            
            {
                this$0 = KeyguardViewManager.this;
                showListener = showlistener;
                super();
            }
        }
);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L6:
        KeyguardUtils.xlogD(TAG, "onScreenTurnedOn else mKeyguardView !visible showListener.onShown");
        showListener.onShown(null);
          goto _L4
        Exception exception;
        exception;
        throw exception;
_L2:
        if (showListener == null) goto _L4; else goto _L7
_L7:
        KeyguardUtils.xlogD(TAG, "onScreenTurnedOn mKeyguardView=null showListener.onShown");
        showListener.onShown(null);
          goto _L4
    }

    public void reLayoutScreen(boolean flag)
    {
        if (mWindowLayoutParams != null)
        {
            KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("reLayoutScreen, dmLock=").append(flag).append(", isAlarmBoot=").append(KeyguardUpdateMonitor.isAlarmBoot()).toString());
            if (flag)
            {
                android.view.WindowManager.LayoutParams layoutparams6 = mWindowLayoutParams;
                layoutparams6.flags = 0xfffff7ff & layoutparams6.flags;
                android.view.WindowManager.LayoutParams layoutparams7 = mWindowLayoutParams;
                layoutparams7.flags = 0x100 | layoutparams7.flags;
                android.view.WindowManager.LayoutParams layoutparams8 = mWindowLayoutParams;
                layoutparams8.flags = 0x10000 | layoutparams8.flags;
            } else
            if (KeyguardUpdateMonitor.isAlarmBoot())
            {
                android.view.WindowManager.LayoutParams layoutparams3 = mWindowLayoutParams;
                layoutparams3.flags = 0xfffffeff & layoutparams3.flags;
                android.view.WindowManager.LayoutParams layoutparams4 = mWindowLayoutParams;
                layoutparams4.flags = 0xfffeffff & layoutparams4.flags;
                android.view.WindowManager.LayoutParams layoutparams5 = mWindowLayoutParams;
                layoutparams5.flags = 0x800 | layoutparams5.flags;
            } else
            {
                android.view.WindowManager.LayoutParams layoutparams = mWindowLayoutParams;
                layoutparams.flags = 0x100 | layoutparams.flags;
                android.view.WindowManager.LayoutParams layoutparams1 = mWindowLayoutParams;
                layoutparams1.flags = 0x10000 | layoutparams1.flags;
                android.view.WindowManager.LayoutParams layoutparams2 = mWindowLayoutParams;
                layoutparams2.flags = 0x800 | layoutparams2.flags;
            }
            mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        }
    }

    public void reset(Bundle bundle)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = false;
        if (bundle == null) goto _L2; else goto _L1
_L1:
        if (bundle.getBoolean("dmlock_reset")) goto _L4; else goto _L3
_L3:
        boolean flag1 = bundle.getBoolean("showuserswitcher");
        flag = false;
        if (!flag1) goto _L2; else goto _L4
_L2:
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("reset() mKeyguardView=").append(mKeyguardView).append(", forceReCreate=").append(flag).toString());
        if (flag)
            break MISSING_BLOCK_LABEL_102;
        if (mKeyguardView == null)
            break MISSING_BLOCK_LABEL_102;
        mKeyguardView.reset();
        updateKeyguardViewFromOptions(bundle);
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
        maybeCreateKeyguardLocked(shouldEnableScreenRotation(), true, bundle);
          goto _L5
        Exception exception;
        exception;
        throw exception;
_L4:
        flag = true;
        if (true) goto _L2; else goto _L6
_L6:
    }

    public void setNeedsInput(boolean flag)
    {
        mNeedsInput = flag;
        if (mWindowLayoutParams == null)
            break MISSING_BLOCK_LABEL_53;
        if (flag)
        {
            android.view.WindowManager.LayoutParams layoutparams1 = mWindowLayoutParams;
            layoutparams1.flags = 0xfffdffff & layoutparams1.flags;
        } else
        {
            android.view.WindowManager.LayoutParams layoutparams = mWindowLayoutParams;
            layoutparams.flags = 0x20000 | layoutparams.flags;
        }
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        return;
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        Log.w(TAG, (new StringBuilder()).append("Can't update input method on ").append(mKeyguardHost).append(" window not attached").toString());
        return;
    }

    public void show(Bundle bundle)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("show(); mKeyguardView=").append(mKeyguardView).toString());
        boolean flag = shouldEnableScreenRotation();
        KeyguardUtils.xlogD(TAG, "show() query screen rotation after");
        KeyguardUpdateMonitor.getInstance(mContext).setQueryBaseTime();
        maybeCreateKeyguardLocked(flag, false, bundle);
        KeyguardUtils.xlogD(TAG, "show() maybeCreateKeyguardLocked finish");
        maybeEnableScreenRotation(flag);
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("show:setSystemUiVisibility(").append(Integer.toHexString(0x200000)).append(")").toString());
        mKeyguardHost.setSystemUiVisibility(0x200000);
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        mKeyguardHost.setVisibility(0);
        mKeyguardView.show();
        mKeyguardView.requestFocus();
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("show() exit; mKeyguardView=").append(mKeyguardView).toString());
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void showAssistant()
    {
        if (mKeyguardView != null)
            mKeyguardView.showAssistant();
    }

    public void updateUserActivityTimeout()
    {
        updateUserActivityTimeoutInWindowLayoutParams();
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
    }

    public void verifyUnlock()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD(TAG, "verifyUnlock()");
        show(null);
        mKeyguardView.verifyUnlock();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public boolean wakeWhenReadyTq(int i)
    {
        KeyguardUtils.xlogD(TAG, (new StringBuilder()).append("wakeWhenReady(").append(i).append(")").toString());
        if (mKeyguardView != null)
        {
            mKeyguardView.wakeWhenReadyTq(i);
            return true;
        } else
        {
            KeyguardUtils.xlogD(TAG, "mKeyguardView is null in wakeWhenReadyTq");
            return false;
        }
    }




/*
    static int access$002(KeyguardViewManager keyguardviewmanager, int i)
    {
        keyguardviewmanager.mCreateOrientation = i;
        return i;
    }

*/





}
