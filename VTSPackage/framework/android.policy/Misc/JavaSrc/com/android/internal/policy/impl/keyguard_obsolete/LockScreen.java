// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.os.*;
import android.util.Log;
import android.util.Slog;
import android.view.*;
import android.widget.LinearLayout;
import com.android.internal.widget.*;
import com.android.internal.widget.multiwaveview.GlowPadView;
import java.io.File;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardUpdateMonitor, KeyguardScreenCallback, 
//            KeyguardUpdateMonitorCallback

class LockScreen extends LinearLayout
    implements KeyguardScreen
{
    class GlowPadViewMethods
        implements com.android.internal.widget.multiwaveview.GlowPadView.OnTriggerListener, UnlockWidgetCommonMethods
    {

        private final GlowPadView mGlowPadView;
        final LockScreen this$0;

        private void launchActivity(Intent intent)
        {
            intent.setFlags(0x34000000);
            try
            {
                ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
            }
            catch (RemoteException remoteexception)
            {
                Log.w("LockScreen", "can't dismiss keyguard on launch");
            }
            try
            {
                access$1400.startActivityAsUser(intent, new UserHandle(-2));
                return;
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Log.w("LockScreen", (new StringBuilder()).append("Activity not found for intent + ").append(intent.getAction()).toString());
            }
        }

        public void cleanUp()
        {
            mGlowPadView.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i)
        {
            return mGlowPadView.getTargetPosition(i);
        }

        public View getView()
        {
            return mGlowPadView;
        }

        public boolean isTargetPresent(int i)
        {
            return mGlowPadView.getTargetPosition(i) != -1;
        }

        public void onFinishFinalAnimation()
        {
        }

        public void onGrabbed(View view, int i)
        {
        }

        public void onGrabbedStateChange(View view, int i)
        {
            if (i != 0)
                mCallback.pokeWakelock();
        }

        public void onReleased(View view, int i)
        {
        }

        public void onTrigger(View view, int i)
        {
            switch (mGlowPadView.getResourceIdForTarget(i))
            {
            case 17302271: 
            case 17302274: 
                mCallback.goToUnlockScreen();
                return;

            case 17302262: 
                toggleRingMode();
                mCallback.pokeWakelock();
                return;

            case 17302241: 
                launchActivity(new Intent("android.media.action.STILL_IMAGE_CAMERA"));
                mCallback.pokeWakelock();
                return;

            case 17302164: 
                Intent intent = ((SearchManager)access$1400.getSystemService("search")).getAssistIntent(access$1400, -2);
                if (intent != null)
                    launchActivity(intent);
                else
                    Log.w("LockScreen", "Failed to get intent for assist activity");
                mCallback.pokeWakelock();
                return;
            }
        }

        public void ping()
        {
            mGlowPadView.ping();
        }

        public void reset(boolean flag)
        {
            mGlowPadView.reset(flag);
        }

        public void setEnabled(int i, boolean flag)
        {
            mGlowPadView.setEnableTarget(i, flag);
        }

        public void updateResources()
        {
            boolean flag = true;
            int i;
            if (mCameraDisabled && mEnableRingSilenceFallback)
            {
                if (mSilentMode)
                    i = 0x1070009;
                else
                    i = 0x107000c;
            } else
            {
                i = 0x107000e;
            }
            if (mGlowPadView.getTargetResourceId() != i)
                mGlowPadView.setTargetResources(i);
            if (!mSearchDisabled)
            {
                Intent intent = ((SearchManager)access$1400.getSystemService("search")).getAssistIntent(access$1400, -2);
                if (intent != null)
                {
                    android.content.ComponentName componentname = intent.getComponent();
                    if (!mGlowPadView.replaceTargetDrawablesIfPresent(componentname, "com.android.systemui.action_assist_icon_google", 0x1080294) && !mGlowPadView.replaceTargetDrawablesIfPresent(componentname, "com.android.systemui.action_assist_icon", 0x1080294))
                        Slog.w("LockScreen", (new StringBuilder()).append("Couldn't grab icon from package ").append(componentname).toString());
                }
            }
            boolean flag1;
            if (!mCameraDisabled)
                flag1 = flag;
            else
                flag1 = false;
            setEnabled(0x10802e1, flag1);
            if (mSearchDisabled)
                flag = false;
            setEnabled(0x1080294, flag);
        }

        GlowPadViewMethods(GlowPadView glowpadview)
        {
            this$0 = LockScreen.this;
            super();
            mGlowPadView = glowpadview;
        }
    }

    class SlidingTabMethods
        implements com.android.internal.widget.SlidingTab.OnTriggerListener, UnlockWidgetCommonMethods
    {

        private final SlidingTab mSlidingTab;
        final LockScreen this$0;

        public void cleanUp()
        {
            mSlidingTab.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i)
        {
            return -1;
        }

        public View getView()
        {
            return mSlidingTab;
        }

        public void onGrabbedStateChange(View view, int i)
        {
            if (i == 2)
            {
                mSilentMode = isSilentMode();
                SlidingTab slidingtab = mSlidingTab;
                int j;
                if (mSilentMode)
                    j = 0x1040318;
                else
                    j = 0x1040319;
                slidingtab.setRightHintText(j);
            }
            if (i != 0)
                mCallback.pokeWakelock();
        }

        public void onTrigger(View view, int i)
        {
            if (i == 1)
                mCallback.goToUnlockScreen();
            else
            if (i == 2)
            {
                toggleRingMode();
                mCallback.pokeWakelock();
                return;
            }
        }

        public void ping()
        {
        }

        public void reset(boolean flag)
        {
            mSlidingTab.reset(flag);
        }

        public void setEnabled(int i, boolean flag)
        {
        }

        public void updateResources()
        {
            int i = 1;
            if (!mSilentMode || mAudioManager.getRingerMode() != i)
                i = 0;
            SlidingTab slidingtab = mSlidingTab;
            int j;
            if (mSilentMode)
            {
                if (i != 0)
                    j = 0x10802d8;
                else
                    j = 0x10802d5;
            } else
            {
                j = 0x10802d6;
            }
            int k;
            if (mSilentMode)
                k = 0x10803b2;
            else
                k = 0x10803af;
            int l;
            if (mSilentMode)
                l = 0x108039b;
            else
                l = 0x108039a;
            int i1;
            if (mSilentMode)
                i1 = 0x10803ae;
            else
                i1 = 0x10803ad;
            slidingtab.setRightTabResources(j, k, l, i1);
        }

        SlidingTabMethods(SlidingTab slidingtab)
        {
            this$0 = LockScreen.this;
            super();
            mSlidingTab = slidingtab;
        }
    }

    private static interface UnlockWidgetCommonMethods
    {

        public abstract void cleanUp();

        public abstract int getTargetPosition(int i);

        public abstract View getView();

        public abstract void ping();

        public abstract void reset(boolean flag);

        public abstract void setEnabled(int i, boolean flag);

        public abstract void updateResources();
    }

    class WaveViewMethods
        implements com.android.internal.widget.WaveView.OnTriggerListener, UnlockWidgetCommonMethods
    {

        private final WaveView mWaveView;
        final LockScreen this$0;

        public void cleanUp()
        {
            mWaveView.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i)
        {
            return -1;
        }

        public View getView()
        {
            return mWaveView;
        }

        public void onGrabbedStateChange(View view, int i)
        {
            if (i == 10)
                mCallback.pokeWakelock(30000);
        }

        public void onTrigger(View view, int i)
        {
            if (i == 10)
                requestUnlockScreen();
        }

        public void ping()
        {
        }

        public void reset(boolean flag)
        {
            mWaveView.reset();
        }

        public void setEnabled(int i, boolean flag)
        {
        }

        public void updateResources()
        {
        }

        WaveViewMethods(WaveView waveview)
        {
            this$0 = LockScreen.this;
            super();
            mWaveView = waveview;
        }
    }


    private static final String ASSIST_ICON_METADATA_NAME = "com.android.systemui.action_assist_icon";
    private static final boolean DBG = false;
    private static final String ENABLE_MENU_KEY_FILE = "/data/local/enable_menu_key";
    private static final int ON_RESUME_PING_DELAY = 500;
    private static final int STAY_ON_WHILE_GRABBED_TIMEOUT = 30000;
    private static final String TAG = "LockScreen";
    private static final int WAIT_FOR_ANIMATION_TIMEOUT;
    private AudioManager mAudioManager;
    private KeyguardScreenCallback mCallback;
    private boolean mCameraDisabled;
    private int mCreationOrientation;
    private boolean mEnableMenuKeyInLockScreen;
    private boolean mEnableRingSilenceFallback;
    private final boolean mHasVibrator;
    KeyguardUpdateMonitorCallback mInfoCallback;
    private LockPatternUtils mLockPatternUtils;
    private final Runnable mOnResumePing = new Runnable() {

        final LockScreen this$0;

        public void run()
        {
            mUnlockWidgetMethods.ping();
        }

            
            {
                this$0 = LockScreen.this;
                super();
            }
    }
;
    private boolean mSearchDisabled;
    private boolean mSilentMode;
    private KeyguardStatusViewManager mStatusViewManager;
    private View mUnlockWidget;
    private UnlockWidgetCommonMethods mUnlockWidgetMethods;
    private KeyguardUpdateMonitor mUpdateMonitor;

    LockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback)
    {
        super(context);
        mEnableRingSilenceFallback = false;
        mInfoCallback = new KeyguardUpdateMonitorCallback() {

            final LockScreen this$0;

            public void onDevicePolicyManagerStateChanged()
            {
                updateTargets();
            }

            public void onRingerModeChanged(int i)
            {
                boolean flag1;
                if (2 != i)
                    flag1 = true;
                else
                    flag1 = false;
                if (flag1 != mSilentMode)
                {
                    mSilentMode = flag1;
                    mUnlockWidgetMethods.updateResources();
                }
            }

            public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
            {
                updateTargets();
            }

            
            {
                this$0 = LockScreen.this;
                super();
            }
        }
;
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mEnableMenuKeyInLockScreen = shouldEnableMenuKey();
        mCreationOrientation = configuration.orientation;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if (mCreationOrientation != 2)
            layoutinflater.inflate(0x109006c, this, true);
        else
            layoutinflater.inflate(0x109006d, this, true);
        mStatusViewManager = new KeyguardStatusViewManager(this, mUpdateMonitor, mLockPatternUtils, mCallback, false);
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x60000);
        Vibrator vibrator = (Vibrator)context.getSystemService("vibrator");
        boolean flag = false;
        if (vibrator != null)
            flag = vibrator.hasVibrator();
        mHasVibrator = flag;
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        mSilentMode = isSilentMode();
        mUnlockWidget = findViewById(0x10202fa);
        mUnlockWidgetMethods = createUnlockMethods(mUnlockWidget);
    }

    private UnlockWidgetCommonMethods createUnlockMethods(View view)
    {
        if (view instanceof SlidingTab)
        {
            SlidingTab slidingtab = (SlidingTab)view;
            slidingtab.setHoldAfterTrigger(true, false);
            slidingtab.setLeftHintText(0x1040317);
            slidingtab.setLeftTabResources(0x10802d7, 0x10803b0, 0x1080391, 0x10803a4);
            SlidingTabMethods slidingtabmethods = new SlidingTabMethods(slidingtab);
            slidingtab.setOnTriggerListener(slidingtabmethods);
            return slidingtabmethods;
        }
        if (view instanceof WaveView)
        {
            WaveView waveview = (WaveView)view;
            WaveViewMethods waveviewmethods = new WaveViewMethods(waveview);
            waveview.setOnTriggerListener(waveviewmethods);
            return waveviewmethods;
        }
        if (view instanceof GlowPadView)
        {
            GlowPadView glowpadview = (GlowPadView)view;
            GlowPadViewMethods glowpadviewmethods = new GlowPadViewMethods(glowpadview);
            glowpadview.setOnTriggerListener(glowpadviewmethods);
            return glowpadviewmethods;
        } else
        {
            throw new IllegalStateException((new StringBuilder()).append("Unrecognized unlock widget: ").append(view).toString());
        }
    }

    private boolean isSilentMode()
    {
        return mAudioManager.getRingerMode() != 2;
    }

    private void requestUnlockScreen()
    {
        postDelayed(new Runnable() {

            final LockScreen this$0;

            public void run()
            {
                mCallback.goToUnlockScreen();
            }

            
            {
                this$0 = LockScreen.this;
                super();
            }
        }
, 0L);
    }

    private boolean shouldEnableMenuKey()
    {
        boolean flag = getResources().getBoolean(0x1110025);
        boolean flag1 = ActivityManager.isRunningInTestHarness();
        boolean flag2 = (new File("/data/local/enable_menu_key")).exists();
        return !flag || flag1 || flag2;
    }

    private void toggleRingMode()
    {
        int i = 1;
        boolean flag;
        if (!mSilentMode)
            flag = i;
        else
            flag = false;
        mSilentMode = flag;
        if (mSilentMode)
        {
            AudioManager audiomanager = mAudioManager;
            if (!mHasVibrator)
                i = 0;
            audiomanager.setRingerMode(i);
            return;
        } else
        {
            mAudioManager.setRingerMode(2);
            return;
        }
    }

    private void updateTargets()
    {
        boolean flag6;
label0:
        {
            boolean flag = mLockPatternUtils.getDevicePolicyManager().getCameraDisabled(null);
            boolean flag1 = mUpdateMonitor.isSimLocked();
            boolean flag2;
            if (mUnlockWidgetMethods instanceof GlowPadViewMethods)
                flag2 = ((GlowPadViewMethods)mUnlockWidgetMethods).isTargetPresent(0x10802e1);
            else
                flag2 = false;
            boolean flag3;
            if (mUnlockWidgetMethods instanceof GlowPadViewMethods)
                flag3 = ((GlowPadViewMethods)mUnlockWidgetMethods).isTargetPresent(0x1080294);
            else
                flag3 = false;
            if (flag)
                Log.v("LockScreen", "Camera disabled by Device Policy");
            else
            if (flag1)
                Log.v("LockScreen", "Camera disabled by Sim State");
            boolean flag4;
            if (((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2) != null)
                flag4 = true;
            else
                flag4 = false;
            boolean flag5;
            if (!flag && !flag1 && flag2)
                flag5 = false;
            else
                flag5 = true;
            mCameraDisabled = flag5;
            if (!flag1 && flag4)
            {
                flag6 = false;
                if (flag3)
                    break label0;
            }
            flag6 = true;
        }
        mSearchDisabled = flag6;
        mUnlockWidgetMethods.updateResources();
    }

    public void cleanUp()
    {
        mUpdateMonitor.removeCallback(mInfoCallback);
        mUnlockWidgetMethods.cleanUp();
        mLockPatternUtils = null;
        mUpdateMonitor = null;
        mCallback = null;
    }

    public boolean needsInput()
    {
        return false;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 82 && mEnableMenuKeyInLockScreen)
            mCallback.goToUnlockScreen();
        return false;
    }

    public void onPause()
    {
        mUpdateMonitor.removeCallback(mInfoCallback);
        mStatusViewManager.onPause();
        mUnlockWidgetMethods.reset(false);
    }

    public void onResume()
    {
        mUpdateMonitor.registerCallback(mInfoCallback);
        mStatusViewManager.onResume();
        postDelayed(mOnResumePing, 500L);
    }

    void updateConfiguration()
    {
        Configuration configuration = getResources().getConfiguration();
        if (configuration.orientation != mCreationOrientation)
            mCallback.recreateMe(configuration);
    }



/*
    static boolean access$002(LockScreen lockscreen, boolean flag)
    {
        lockscreen.mSilentMode = flag;
        return flag;
    }

*/















}
