// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.content.res.*;
import android.database.ContentObserver;
import android.graphics.Rect;
import android.media.*;
import android.os.*;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Toast;
import com.android.internal.policy.PolicyManager;
import com.android.internal.policy.impl.keyguard.KeyguardUpdateMonitor;
import com.android.internal.policy.impl.keyguard.KeyguardViewMediator;
import com.android.internal.statusbar.IStatusBarService;
import com.android.internal.telephony.ITelephony;
import com.android.internal.widget.PointerLocationView;
import java.io.*;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl:
//            ShortcutManager, GlobalActions, RecentApplicationsDialog

public class PhoneWindowManager
    implements WindowManagerPolicy
{
    final class HideNavInputEventReceiver extends InputEventReceiver
    {

        final PhoneWindowManager this$0;

        public void onInputEvent(InputEvent inputevent)
        {
            if (!(inputevent instanceof MotionEvent) || (2 & inputevent.getSource()) == 0 || ((MotionEvent)inputevent).getAction() != 0)
                break MISSING_BLOCK_LABEL_158;
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            int i;
            int j;
            i = 4 | (1 | (2 | mResettingSystemUiFlags));
            j = mResettingSystemUiFlags;
            boolean flag;
            flag = false;
            if (j == i)
                break MISSING_BLOCK_LABEL_82;
            mResettingSystemUiFlags = i;
            flag = true;
            int k = 2 | mForceClearedSystemUiFlags;
            if (mForceClearedSystemUiFlags == k)
                break MISSING_BLOCK_LABEL_139;
            mForceClearedSystemUiFlags = k;
            flag = true;
            mHandler.postDelayed(new Runnable() {

                final HideNavInputEventReceiver this$1;

                public void run()
                {
                    synchronized (mLock)
                    {
                        PhoneWindowManager phonewindowmanager = _fld0;
                        phonewindowmanager.mForceClearedSystemUiFlags = -3 & phonewindowmanager.mForceClearedSystemUiFlags;
                    }
                    mWindowManagerFuncs.reevaluateStatusBarVisibility();
                    return;
                    exception;
                    obj;
                    JVM INSTR monitorexit ;
                    throw exception;
                }

            
            {
                this$1 = HideNavInputEventReceiver.this;
                super();
            }
            }
, 1000L);
            obj;
            JVM INSTR monitorexit ;
            if (!flag)
                break MISSING_BLOCK_LABEL_158;
            mWindowManagerFuncs.reevaluateStatusBarVisibility();
            finishInputEvent(inputevent, false);
            return;
            Exception exception1;
            exception1;
            obj;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            finishInputEvent(inputevent, false);
            throw exception;
        }

        public HideNavInputEventReceiver(InputChannel inputchannel, Looper looper)
        {
            this$0 = PhoneWindowManager.this;
            super(inputchannel, looper);
        }
    }

    class MyOrientationListener extends WindowOrientationListener
    {

        final PhoneWindowManager this$0;

        public void onProposedRotationChanged(int i)
        {
            if (PhoneWindowManager.localLOGV)
                Log.v("WindowManager", (new StringBuilder()).append("onProposedRotationChanged, rotation=").append(i).toString());
            updateRotation(false);
        }

        MyOrientationListener(Context context)
        {
            this$0 = PhoneWindowManager.this;
            super(context);
        }
    }

    private static final class PointerLocationInputEventReceiver extends InputEventReceiver
    {

        private final PointerLocationView mView;

        public void onInputEvent(InputEvent inputevent)
        {
            boolean flag = inputevent instanceof MotionEvent;
            boolean flag1;
            flag1 = false;
            if (!flag)
                break MISSING_BLOCK_LABEL_46;
            int i = 2 & inputevent.getSource();
            flag1 = false;
            if (i == 0)
                break MISSING_BLOCK_LABEL_46;
            MotionEvent motionevent = (MotionEvent)inputevent;
            mView.addPointerEvent(motionevent);
            flag1 = true;
            finishInputEvent(inputevent, flag1);
            return;
            Exception exception;
            exception;
            finishInputEvent(inputevent, false);
            throw exception;
        }

        public PointerLocationInputEventReceiver(InputChannel inputchannel, Looper looper, PointerLocationView pointerlocationview)
        {
            super(inputchannel, looper);
            mView = pointerlocationview;
        }
    }

    private class PolicyHandler extends Handler
    {

        final PhoneWindowManager this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 5: // '\005'
                mIsLongPress = true;
                dispatchMediaKeyWithWakeLockToAudioService((KeyEvent)message.obj);
                dispatchMediaKeyWithWakeLockToAudioService(KeyEvent.changeAction((KeyEvent)message.obj, 1));
                return;

            case 4: // '\004'
                dispatchMediaKeyRepeatWithWakeLock((KeyEvent)message.obj);
                return;

            case 3: // '\003'
                dispatchMediaKeyWithWakeLock((KeyEvent)message.obj);
                return;

            case 2: // '\002'
                disablePointerLocation();
                return;

            case 1: // '\001'
                enablePointerLocation();
                return;
            }
        }

        private PolicyHandler()
        {
            this$0 = PhoneWindowManager.this;
            super();
        }

    }

    class ScreenLockTimeout
        implements Runnable
    {

        Bundle options;
        final PhoneWindowManager this$0;

        public void run()
        {
            this;
            JVM INSTR monitorenter ;
            if (PhoneWindowManager.localLOGV)
                Log.v("WindowManager", "mScreenLockTimeout activating keyguard");
            if (mKeyguardMediator != null)
                mKeyguardMediator.doKeyguardTimeout(options);
            mLockScreenTimerActive = false;
            options = null;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setLockOptions(Bundle bundle)
        {
            options = bundle;
        }

        ScreenLockTimeout()
        {
            this$0 = PhoneWindowManager.this;
            super();
        }
    }

    class SettingsObserver extends ContentObserver
    {

        final PhoneWindowManager this$0;

        void observe()
        {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("end_button_behavior"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("incall_power_button_behavior"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("accelerometer_rotation"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("user_rotation"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_off_timeout"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("volbtn_music_controls"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("pointer_location"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("default_input_method"), false, this, -1);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("fancy_rotation_anim"), false, this, -1);
            updateSettings();
        }

        public void onChange(boolean flag)
        {
            updateSettings();
            updateRotation(false);
        }

        SettingsObserver(Handler handler)
        {
            this$0 = PhoneWindowManager.this;
            super(handler);
        }
    }


    static final int APPLICATION_MEDIA_OVERLAY_SUBLAYER = -1;
    static final int APPLICATION_MEDIA_SUBLAYER = -2;
    static final int APPLICATION_PANEL_SUBLAYER = 1;
    static final int APPLICATION_SUB_PANEL_SUBLAYER = 2;
    static boolean DEBUG = false;
    static boolean DEBUG_INPUT = false;
    static boolean DEBUG_LAYOUT = false;
    static boolean DEBUG_ORIENTATION = false;
    static final boolean DEBUG_STARTING_WINDOW = false;
    private static final int DISMISS_KEYGUARD_CONTINUE = 2;
    private static final int DISMISS_KEYGUARD_NONE = 0;
    private static final int DISMISS_KEYGUARD_START = 1;
    public static final String IPO_DISABLE = "android.intent.action.ACTION_BOOT_IPO";
    public static final String IPO_ENABLE = "android.intent.action.ACTION_SHUTDOWN_IPO";
    private static final float KEYGUARD_SCREENSHOT_CHORD_DELAY_MULTIPLIER = 2.5F;
    static final int KEY_DISPATCH_MODE_ALL_DISABLE = 1;
    static final int KEY_DISPATCH_MODE_ALL_ENABLE = 0;
    static final int KEY_DISPATCH_MODE_HOME_DISABLE = 2;
    static final int LONG_PRESS_HOME_NOTHING = 0;
    static final int LONG_PRESS_HOME_RECENT_DIALOG = 1;
    static final int LONG_PRESS_HOME_RECENT_SYSTEM_UI = 2;
    static final int LONG_PRESS_POWER_GLOBAL_ACTIONS = 1;
    static final int LONG_PRESS_POWER_NOTHING = 0;
    static final int LONG_PRESS_POWER_SHUT_OFF = 2;
    static final int LONG_PRESS_POWER_SHUT_OFF_NO_CONFIRM = 3;
    private static final int MSG_DISABLE_POINTER_LOCATION = 2;
    private static final int MSG_DISPATCH_MEDIA_KEY_REPEAT_WITH_WAKE_LOCK = 4;
    private static final int MSG_DISPATCH_MEDIA_KEY_WITH_WAKE_LOCK = 3;
    private static final int MSG_ENABLE_POINTER_LOCATION = 1;
    static final boolean PRINT_ANIM = false;
    static final int RECENT_APPS_BEHAVIOR_DISMISS = 2;
    static final int RECENT_APPS_BEHAVIOR_DISMISS_AND_SWITCH = 3;
    static final int RECENT_APPS_BEHAVIOR_EXIT_TOUCH_MODE_AND_SHOW = 1;
    static final int RECENT_APPS_BEHAVIOR_SHOW_OR_DISMISS = 0;
    private static final long SCREENSHOT_CHORD_DEBOUNCE_DELAY_MILLIS = 150L;
    static final boolean SHOW_PROCESSES_ON_ALT_MENU = false;
    static final boolean SHOW_STARTING_ANIMATIONS = true;
    public static final String STK_USERACTIVITY = "android.intent.action.stk.USER_ACTIVITY";
    public static final String STK_USERACTIVITY_ENABLE = "android.intent.action.stk.USER_ACTIVITY.enable";
    public static final String SYSTEM_DIALOG_REASON_ASSIST = "assist";
    public static final String SYSTEM_DIALOG_REASON_GLOBAL_ACTIONS = "globalactions";
    public static final String SYSTEM_DIALOG_REASON_HOME_KEY = "homekey";
    public static final String SYSTEM_DIALOG_REASON_KEY = "reason";
    public static final String SYSTEM_DIALOG_REASON_RECENT_APPS = "recentapps";
    static final int SYSTEM_UI_CHANGING_LAYOUT = 6;
    static final String TAG = "WindowManager";
    private static final int WINDOW_TYPES_WHERE_HOME_DOESNT_WORK[] = {
        2003, 2010
    };
    static boolean localLOGV = false;
    static final Rect mTmpContentFrame = new Rect();
    static final Rect mTmpDisplayFrame = new Rect();
    static final Rect mTmpNavigationFrame = new Rect();
    static final Rect mTmpParentFrame = new Rect();
    static final Rect mTmpVisibleFrame = new Rect();
    static SparseArray sApplicationLaunchKeyCategories;
    boolean mAccelerometerDefault;
    int mAllowAllRotations;
    boolean mAllowLockscreenWhenOn;
    final Runnable mAllowSystemUiDelay = new Runnable() {

        final PhoneWindowManager this$0;

        public void run()
        {
        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
    }
;
    boolean mAppLaunchTimeEnabled;
    boolean mAssistKeyLongPressed;
    Runnable mBackLongPress;
    ProgressDialog mBootMsgDialog;
    android.os.PowerManager.WakeLock mBroadcastWakeLock;
    boolean mCanHideNavigationBar;
    boolean mCarDockEnablesAccelerometer;
    Intent mCarDockIntent;
    int mCarDockRotation;
    boolean mConsumeSearchKeyUp;
    int mContentBottom;
    int mContentLeft;
    int mContentRight;
    int mContentTop;
    Context mContext;
    int mCurBottom;
    int mCurLeft;
    int mCurRight;
    int mCurTop;
    int mCurrentAppOrientation;
    boolean mDeskDockEnablesAccelerometer;
    Intent mDeskDockIntent;
    int mDeskDockRotation;
    int mDismissKeyguard;
    Display mDisplay;
    int mDockBottom;
    int mDockLayer;
    int mDockLeft;
    int mDockMode;
    BroadcastReceiver mDockReceiver;
    int mDockRight;
    int mDockTop;
    BroadcastReceiver mDreamReceiver;
    boolean mDreamingLockscreen;
    boolean mEnableShiftMenuBugReports;
    int mEndcallBehavior;
    private final SparseArray mFallbackActions = new SparseArray();
    IApplicationToken mFocusedApp;
    android.view.WindowManagerPolicy.WindowState mFocusedWindow;
    int mForceClearedSystemUiFlags;
    boolean mForceStatusBar;
    boolean mForceStatusBarFromKeyguard;
    boolean mForcingShowNavBar;
    int mForcingShowNavBarLayer;
    GlobalActions mGlobalActions;
    private UEventObserver mHDMIObserver;
    Handler mHandler;
    boolean mHasNavigationBar;
    boolean mHasSoftInput;
    boolean mHasSystemNavBar;
    boolean mHaveBuiltInKeyboard;
    boolean mHavePendingMediaKeyRepeatWithWakeLock;
    boolean mHdmiPlugged;
    int mHdmiRotation;
    boolean mHdmiRotationLock;
    boolean mHeadless;
    boolean mHideLockScreen;
    android.view.WindowManagerPolicy.FakeWindow mHideNavFakeWindow;
    final android.view.InputEventReceiver.Factory mHideNavInputEventReceiverFactory = new android.view.InputEventReceiver.Factory() {

        final PhoneWindowManager this$0;

        public InputEventReceiver createInputEventReceiver(InputChannel inputchannel, Looper looper)
        {
            return new HideNavInputEventReceiver(inputchannel, looper);
        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
    }
;
    Intent mHomeIntent;
    boolean mHomeLongPressed;
    boolean mHomePressed;
    int mIncallPowerBehavior;
    BroadcastReceiver mIpoEventReceiver;
    boolean mIsLongPress;
    boolean mIsStkUserActivityEnabled;
    int mKeyDispatcMode;
    final Object mKeyDispatchLock = new Object();
    long mKeyboardTapVibePattern[];
    android.view.WindowManagerPolicy.WindowState mKeyguard;
    KeyguardViewMediator mKeyguardMediator;
    int mLandscapeRotation;
    boolean mLanguageSwitchKeyPressed;
    boolean mLastFocusNeedsMenu;
    android.view.WindowManagerPolicy.WindowState mLastInputMethodTargetWindow;
    android.view.WindowManagerPolicy.WindowState mLastInputMethodWindow;
    int mLastSystemUiFlags;
    boolean mLayoutDisableStatusBar;
    boolean mLidControlsSleep;
    int mLidKeyboardAccessibility;
    int mLidNavigationAccessibility;
    int mLidOpenRotation;
    int mLidState;
    final Object mLock = new Object();
    int mLockScreenTimeout;
    boolean mLockScreenTimerActive;
    private int mLongPressOnHomeBehavior;
    int mLongPressOnPowerBehavior;
    long mLongPressVibePattern[];
    BroadcastReceiver mMultiuserReceiver;
    android.view.WindowManagerPolicy.WindowState mNavigationBar;
    boolean mNavigationBarCanMove;
    int mNavigationBarHeightForRotation[];
    boolean mNavigationBarOnBottom;
    int mNavigationBarWidthForRotation[];
    MyOrientationListener mOrientationListener;
    boolean mOrientationSensorEnabled;
    boolean mPendingPowerKeyUpCanceled;
    InputChannel mPointerLocationInputChannel;
    PointerLocationInputEventReceiver mPointerLocationInputEventReceiver;
    int mPointerLocationMode;
    PointerLocationView mPointerLocationView;
    int mPortraitRotation;
    volatile boolean mPowerKeyHandled;
    private long mPowerKeyTime;
    private boolean mPowerKeyTriggered;
    private final Runnable mPowerLongPress = new Runnable() {

        final PhoneWindowManager this$0;

        public void run()
        {
            boolean flag = true;
            if (mLongPressOnPowerBehavior < 0)
                mLongPressOnPowerBehavior = mContext.getResources().getInteger(0x10e0017);
            int i = mLongPressOnPowerBehavior;
            if (FactoryTest.isLongPressOnPowerOffEnabled())
                i = 3;
            switch (i)
            {
            case 2: // '\002'
            case 3: // '\003'
                mPowerKeyHandled = flag;
                performHapticFeedbackLw(null, 0, false);
                sendCloseSystemWindows("globalactions");
                android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs = mWindowManagerFuncs;
                if (i != 2)
                    flag = false;
                windowmanagerfuncs.shutdown(flag);
                return;

            case 1: // '\001'
                mPowerKeyHandled = flag;
                if (!performHapticFeedbackLw(null, 0, false))
                    performAuditoryFeedbackForAccessibilityIfNeed();
                sendCloseSystemWindows("globalactions");
                showGlobalActionsDialog();
                return;

            case 0: // '\0'
            default:
                return;
            }
        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
    }
;
    PowerManager mPowerManager;
    RecentApplicationsDialog mRecentAppsDialog;
    int mRecentAppsDialogHeldModifiers;
    int mResettingSystemUiFlags;
    int mRestrictedScreenHeight;
    int mRestrictedScreenLeft;
    int mRestrictedScreenTop;
    int mRestrictedScreenWidth;
    boolean mSafeMode;
    long mSafeModeDisabledVibePattern[];
    long mSafeModeEnabledVibePattern[];
    ScreenLockTimeout mScreenLockTimeout;
    int mScreenOffReason;
    boolean mScreenOnEarly;
    boolean mScreenOnFully;
    private boolean mScreenshotChordEnabled;
    private final Runnable mScreenshotChordLongPress = new Runnable() {

        final PhoneWindowManager this$0;

        public void run()
        {
            takeScreenshot();
        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
    }
;
    ServiceConnection mScreenshotConnection;
    final Object mScreenshotLock = new Object();
    final Runnable mScreenshotTimeout = new Runnable() {

        final PhoneWindowManager this$0;

        public void run()
        {
            synchronized (mScreenshotLock)
            {
                if (mScreenshotConnection != null)
                {
                    mContext.unbindService(mScreenshotConnection);
                    mScreenshotConnection = null;
                }
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
    }
;
    boolean mSearchKeyShortcutPending;
    SearchManager mSearchManager;
    int mSeascapeRotation;
    private boolean mSecureDismissingKeyguard;
    final Object mServiceAquireLock = new Object();
    SettingsObserver mSettingsObserver;
    ShortcutManager mShortcutManager;
    boolean mShowingDream;
    boolean mShowingLockscreen;
    int mStableBottom;
    int mStableFullscreenBottom;
    int mStableFullscreenLeft;
    int mStableFullscreenRight;
    int mStableFullscreenTop;
    int mStableLeft;
    int mStableRight;
    int mStableTop;
    android.view.WindowManagerPolicy.WindowState mStatusBar;
    int mStatusBarHeight;
    int mStatusBarLayer;
    IStatusBarService mStatusBarService;
    private Object mStkLock;
    BroadcastReceiver mStkUserActivityEnReceiver;
    boolean mSystemBooted;
    int mSystemBottom;
    int mSystemLeft;
    boolean mSystemReady;
    int mSystemRight;
    int mSystemTop;
    android.view.WindowManagerPolicy.WindowState mTopFullscreenOpaqueWindowState;
    boolean mTopIsFullscreen;
    int mUnrestrictedScreenHeight;
    int mUnrestrictedScreenLeft;
    int mUnrestrictedScreenTop;
    int mUnrestrictedScreenWidth;
    int mUpsideDownRotation;
    int mUserRotation;
    int mUserRotationMode;
    Vibrator mVibrator;
    long mVirtualKeyVibePattern[];
    boolean mVolBtnMusicControls;
    private boolean mVolumeDownKeyConsumedByScreenshotChord;
    private long mVolumeDownKeyTime;
    private boolean mVolumeDownKeyTriggered;
    private boolean mVolumeUpKeyTriggered;
    private android.view.WindowManagerPolicy.WindowState mWinDismissingKeyguard;
    IWindowManager mWindowManager;
    android.view.WindowManagerPolicy.WindowManagerFuncs mWindowManagerFuncs;
    private boolean mfindingTopFullscreenOpaque;

    public PhoneWindowManager()
    {
        mEnableShiftMenuBugReports = false;
        mStatusBar = null;
        mNavigationBar = null;
        mHasNavigationBar = false;
        mCanHideNavigationBar = false;
        mNavigationBarCanMove = false;
        mNavigationBarOnBottom = true;
        mNavigationBarHeightForRotation = new int[4];
        mNavigationBarWidthForRotation = new int[4];
        mKeyguard = null;
        mLastInputMethodWindow = null;
        mLastInputMethodTargetWindow = null;
        mLidState = -1;
        mDockMode = 0;
        mUserRotationMode = 0;
        mUserRotation = 0;
        mAllowAllRotations = -1;
        mLongPressOnPowerBehavior = -1;
        mScreenOnEarly = false;
        mScreenOnFully = false;
        mOrientationSensorEnabled = false;
        mCurrentAppOrientation = -1;
        mHasSoftInput = false;
        mPointerLocationMode = 0;
        mResettingSystemUiFlags = 0;
        mForceClearedSystemUiFlags = 0;
        mLastFocusNeedsMenu = false;
        mLayoutDisableStatusBar = false;
        mHideNavFakeWindow = null;
        mDismissKeyguard = 0;
        mLandscapeRotation = 0;
        mSeascapeRotation = 0;
        mPortraitRotation = 0;
        mUpsideDownRotation = 0;
        mLongPressOnHomeBehavior = -1;
        mKeyDispatcMode = 0;
        mAppLaunchTimeEnabled = false;
        mIsStkUserActivityEnabled = false;
        mStkLock = new Object();
        mScreenOffReason = -1;
        mHDMIObserver = new UEventObserver() {

            final PhoneWindowManager this$0;

            public void onUEvent(android.os.UEventObserver.UEvent uevent)
            {
                setHdmiPlugged("1".equals(uevent.get("SWITCH_STATE")));
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mfindingTopFullscreenOpaque = false;
        mScreenshotConnection = null;
        mDockReceiver = new BroadcastReceiver() {

            final PhoneWindowManager this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.DOCK_EVENT".equals(intent.getAction()))
                    mDockMode = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
                updateRotation(true);
                updateOrientationListenerLp();
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mIpoEventReceiver = new BroadcastReceiver() {

            final PhoneWindowManager this$0;

            public void onReceive(Context context, Intent intent)
            {
                Log.v("WindowManager", "mIpoEventReceiver -- onReceive -- entry");
                String s = intent.getAction();
                if (s.equals("android.intent.action.ACTION_SHUTDOWN_IPO"))
                {
                    Log.v("WindowManager", "Receive IPO_ENABLE");
                    ipoSystemShutdown();
                    return;
                }
                if (s.equals("android.intent.action.ACTION_BOOT_IPO"))
                {
                    Log.v("WindowManager", "Receive IPO_DISABLE");
                    ipoSystemBooted();
                    return;
                } else
                {
                    Log.v("WindowManager", "Receive Fake Intent");
                    return;
                }
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mStkUserActivityEnReceiver = new BroadcastReceiver() {

            final PhoneWindowManager this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s;
                s = intent.getAction();
                Log.v("WindowManager", "mStkUserActivityEnReceiver -- onReceive -- entry");
                Object obj = mStkLock;
                obj;
                JVM INSTR monitorenter ;
                if (!s.equals("android.intent.action.stk.USER_ACTIVITY.enable")) goto _L2; else goto _L1
_L1:
                if (PhoneWindowManager.DEBUG_INPUT)
                    Log.v("WindowManager", "Receive STK_ENABLE");
                boolean flag = intent.getBooleanExtra("state", false);
                if (flag != mIsStkUserActivityEnabled)
                    mIsStkUserActivityEnabled = flag;
_L4:
                if (PhoneWindowManager.DEBUG_INPUT)
                    Log.v("WindowManager", (new StringBuilder()).append("mStkUserActivityEnReceiver -- onReceive -- exist ").append(mIsStkUserActivityEnabled).toString());
                return;
_L2:
                if (PhoneWindowManager.DEBUG_INPUT)
                    Log.e("WindowManager", "Receive Fake Intent");
                if (true) goto _L4; else goto _L3
_L3:
                Exception exception;
                exception;
                obj;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mDreamReceiver = new BroadcastReceiver() {

            final PhoneWindowManager this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.DREAMING_STARTED".equals(intent.getAction()))
                {
                    if (mKeyguardMediator != null)
                        mKeyguardMediator.onDreamingStarted();
                } else
                if ("android.intent.action.DREAMING_STOPPED".equals(intent.getAction()) && mKeyguardMediator != null)
                {
                    mKeyguardMediator.onDreamingStopped();
                    return;
                }
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mMultiuserReceiver = new BroadcastReceiver() {

            final PhoneWindowManager this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.USER_SWITCHED".equals(intent.getAction()))
                {
                    mSettingsObserver.onChange(false);
                    synchronized (mLock)
                    {
                        mLastSystemUiFlags = 0;
                        updateSystemUiVisibilityLw();
                    }
                    return;
                } else
                {
                    return;
                }
                exception;
                obj;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mBackLongPress = new Runnable() {

            final PhoneWindowManager this$0;

            public void run()
            {
                if (PhoneWindowManager.killForegroundApplication(mContext))
                {
                    performHapticFeedbackLw(null, 0, false);
                    Toast.makeText(mContext, 0x1040559, 0).show();
                }
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        mBootMsgDialog = null;
        mScreenLockTimeout = new ScreenLockTimeout();
    }

    private void applyLidSwitchState()
    {
        if (mLidState == 0 && mLidControlsSleep)
            mPowerManager.goToSleep(SystemClock.uptimeMillis());
    }

    private void applyStableConstraints(int i, int j, Rect rect)
    {
        if ((i & 0x100) != 0)
            if ((j & 0x400) != 0)
            {
                if (rect.left < mStableFullscreenLeft)
                    rect.left = mStableFullscreenLeft;
                if (rect.top < mStableFullscreenTop)
                    rect.top = mStableFullscreenTop;
                if (rect.right > mStableFullscreenRight)
                    rect.right = mStableFullscreenRight;
                if (rect.bottom > mStableFullscreenBottom)
                    rect.bottom = mStableFullscreenBottom;
            } else
            {
                if (rect.left < mStableLeft)
                    rect.left = mStableLeft;
                if (rect.top < mStableTop)
                    rect.top = mStableTop;
                if (rect.right > mStableRight)
                    rect.right = mStableRight;
                if (rect.bottom > mStableBottom)
                {
                    rect.bottom = mStableBottom;
                    return;
                }
            }
    }

    private void cancelPendingPowerKeyAction()
    {
        if (!mPowerKeyHandled)
            mHandler.removeCallbacks(mPowerLongPress);
        if (mPowerKeyTriggered)
            mPendingPowerKeyUpCanceled = true;
    }

    private void cancelPendingScreenshotChordAction()
    {
        mHandler.removeCallbacks(mScreenshotChordLongPress);
    }

    private void disablePointerLocation()
    {
        if (mPointerLocationInputEventReceiver != null)
        {
            mPointerLocationInputEventReceiver.dispose();
            mPointerLocationInputEventReceiver = null;
        }
        if (mPointerLocationInputChannel != null)
        {
            mPointerLocationInputChannel.dispose();
            mPointerLocationInputChannel = null;
        }
        if (mPointerLocationView != null)
        {
            ((WindowManager)mContext.getSystemService("window")).removeView(mPointerLocationView);
            mPointerLocationView = null;
        }
    }

    private void enablePointerLocation()
    {
        if (mPointerLocationView == null)
        {
            mPointerLocationView = new PointerLocationView(mContext);
            mPointerLocationView.setPrintCoords(false);
            android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -1);
            layoutparams.type = 2015;
            layoutparams.flags = 1304;
            if (ActivityManager.isHighEndGfx())
            {
                layoutparams.flags = 0x1000000 | layoutparams.flags;
                layoutparams.privateFlags = 2 | layoutparams.privateFlags;
            }
            layoutparams.format = -3;
            layoutparams.setTitle("PointerLocation");
            WindowManager windowmanager = (WindowManager)mContext.getSystemService("window");
            layoutparams.inputFeatures = 2 | layoutparams.inputFeatures;
            windowmanager.addView(mPointerLocationView, layoutparams);
            mPointerLocationInputChannel = mWindowManagerFuncs.monitorInput("PointerLocationView");
            mPointerLocationInputEventReceiver = new PointerLocationInputEventReceiver(mPointerLocationInputChannel, Looper.myLooper(), mPointerLocationView);
        }
    }

    private void finishScreenTurningOn(android.view.WindowManagerPolicy.ScreenOnListener screenonlistener)
    {
        synchronized (mLock)
        {
            mScreenOnFully = true;
        }
        try
        {
            mWindowManager.setEventDispatching(true);
        }
        catch (RemoteException remoteexception) { }
        if (screenonlistener != null)
            screenonlistener.onScreenOn();
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static IAudioService getAudioService()
    {
        IAudioService iaudioservice = android.media.IAudioService.Stub.asInterface(ServiceManager.checkService("audio"));
        if (iaudioservice == null)
            Log.w("WindowManager", "Unable to find IAudioService interface.");
        return iaudioservice;
    }

    static long[] getLongIntArray(Resources resources, int i)
    {
        int ai[] = resources.getIntArray(i);
        long al[];
        if (ai == null)
        {
            al = null;
        } else
        {
            al = new long[ai.length];
            for (int j = 0; j < ai.length; j++)
                al[j] = ai[j];

        }
        return al;
    }

    private long getScreenshotChordLongPressDelay()
    {
        if (mKeyguardMediator.isShowing())
            return (long)(2.5F * (float)ViewConfiguration.getGlobalActionKeyTimeout());
        else
            return ViewConfiguration.getGlobalActionKeyTimeout();
    }

    private SearchManager getSearchManager()
    {
        if (mSearchManager == null)
            mSearchManager = (SearchManager)mContext.getSystemService("search");
        return mSearchManager;
    }

    static ITelephony getTelephonyService()
    {
        return com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
    }

    private void handleLongPressOnHome()
    {
        if (mLongPressOnHomeBehavior < 0)
        {
            mLongPressOnHomeBehavior = mContext.getResources().getInteger(0x10e0023);
            if (mLongPressOnHomeBehavior < 0 || mLongPressOnHomeBehavior > 2)
                mLongPressOnHomeBehavior = 0;
        }
        if (mLongPressOnHomeBehavior != 0)
        {
            performHapticFeedbackLw(null, 0, false);
            sendCloseSystemWindows("recentapps");
            mHomeLongPressed = true;
        }
        if (mLongPressOnHomeBehavior != 1) goto _L2; else goto _L1
_L1:
        showOrHideRecentAppsDialog(0);
_L4:
        return;
_L2:
        if (mLongPressOnHomeBehavior != 2)
            continue; /* Loop/switch isn't completed */
        IStatusBarService istatusbarservice = getStatusBarService();
        if (istatusbarservice != null)
        {
            try
            {
                istatusbarservice.toggleRecentApps();
                return;
            }
            catch (RemoteException remoteexception)
            {
                Slog.e("WindowManager", "RemoteException when showing recent apps", remoteexception);
            }
            mStatusBarService = null;
            return;
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    private boolean interceptFallback(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i)
    {
        return (1 & interceptKeyBeforeQueueing(keyevent, i, true)) != 0 && interceptKeyBeforeDispatching(windowstate, keyevent, i) == 0L;
    }

    private void interceptPowerKeyDown(boolean flag)
    {
        mPowerKeyHandled = flag;
        if (!flag)
            mHandler.postDelayed(mPowerLongPress, ViewConfiguration.getGlobalActionKeyTimeout());
    }

    private boolean interceptPowerKeyUp(boolean flag)
    {
        boolean flag1 = mPowerKeyHandled;
        boolean flag2 = false;
        if (!flag1)
        {
            mHandler.removeCallbacks(mPowerLongPress);
            flag2 = false;
            if (!flag)
                flag2 = true;
        }
        return flag2;
    }

    private void interceptScreenshotChord()
    {
        if (mScreenshotChordEnabled && mVolumeDownKeyTriggered && mPowerKeyTriggered && !mVolumeUpKeyTriggered)
        {
            long l = SystemClock.uptimeMillis();
            if (l <= 150L + mVolumeDownKeyTime && l <= 150L + mPowerKeyTime)
            {
                mVolumeDownKeyConsumedByScreenshotChord = true;
                cancelPendingPowerKeyAction();
                mHandler.postDelayed(mScreenshotChordLongPress, getScreenshotChordLongPressDelay());
            }
        }
    }

    private void ipoSystemBooted()
    {
        mHideLockScreen = false;
        synchronized (mKeyDispatchLock)
        {
            mKeyDispatcMode = 0;
            if (DEBUG_INPUT)
                Log.v("WindowManager", (new StringBuilder()).append("mIpoEventReceiver=").append(mKeyDispatcMode).toString());
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void ipoSystemShutdown()
    {
        synchronized (mKeyDispatchLock)
        {
            mKeyDispatcMode = 1;
            if (DEBUG_INPUT)
                Log.v("WindowManager", (new StringBuilder()).append("mIpoEventReceiver=").append(mKeyDispatcMode).toString());
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean isAnyPortrait(int i)
    {
        return i == mPortraitRotation || i == mUpsideDownRotation;
    }

    private boolean isBuiltInKeyboardVisible()
    {
        return mHaveBuiltInKeyboard && !isHidden(mLidKeyboardAccessibility);
    }

    private boolean isGlobalAccessibilityGestureEnabled()
    {
        return android.provider.Settings.Global.getInt(mContext.getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) == 1;
    }

    private boolean isHidden(int i)
    {
        boolean flag = true;
        switch (i)
        {
        case 2: // '\002'
            if (mLidState != flag)
                return false;
            break;

        case 1: // '\001'
            if (mLidState != 0)
                return false;
            break;

        default:
            flag = false;
            break;
        }
        return flag;
    }

    private boolean isLandscapeOrSeascape(int i)
    {
        return i == mLandscapeRotation || i == mSeascapeRotation;
    }

    private boolean isWakeKeyWhenScreenOff(int i)
    {
        switch (i)
        {
        case 27: // '\033'
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
            return false;

        case 24: // '\030'
        case 25: // '\031'
        case 164: 
            if (mDockMode == 0)
                return false;
            break;
        }
        return true;
    }

    private boolean keyguardIsShowingTq()
    {
        if (mKeyguardMediator == null)
            return false;
        else
            return mKeyguardMediator.isShowingAndNotHidden();
    }

    public static boolean killForegroundApplication(Context context)
    {
        int k;
        boolean flag = false;
        Intent intent;
        String s;
        ResolveInfo resolveinfo;
        ActivityInfo activityinfo;
        boolean flag1;
        IActivityManager iactivitymanager;
        Iterator iterator;
        android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo;
        int i;
        String as[];
        int j;
        String s1;
        try
        {
            intent = new Intent("android.intent.action.MAIN");
        }
        catch (RemoteException remoteexception)
        {
            return flag;
        }
        s = "com.android.launcher";
        intent.addCategory("android.intent.category.HOME");
        resolveinfo = context.getPackageManager().resolveActivity(intent, 0);
        activityinfo = resolveinfo.activityInfo;
        flag = false;
        if (activityinfo == null)
            break MISSING_BLOCK_LABEL_82;
        flag1 = resolveinfo.activityInfo.packageName.equals("android");
        flag = false;
        if (flag1)
            break MISSING_BLOCK_LABEL_82;
        s = resolveinfo.activityInfo.packageName;
        iactivitymanager = ActivityManagerNative.getDefault();
        iterator = iactivitymanager.getRunningAppProcesses().iterator();
_L4:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        runningappprocessinfo = (android.app.ActivityManager.RunningAppProcessInfo)iterator.next();
        i = runningappprocessinfo.uid;
        if (i < 10000 || i > 19999) goto _L4; else goto _L3
_L3:
        if (runningappprocessinfo.importance != 100) goto _L4; else goto _L5
_L5:
        if (runningappprocessinfo.pkgList == null || runningappprocessinfo.pkgList.length <= 0) goto _L7; else goto _L6
_L6:
        as = runningappprocessinfo.pkgList;
        j = as.length;
        k = 0;
_L9:
        if (k >= j) goto _L4; else goto _L8
_L8:
        s1 = as[k];
        if (s1.equals("com.android.systemui") || s1.equals(s))
            break MISSING_BLOCK_LABEL_254;
        iactivitymanager.forceStopPackage(s1, -2);
        flag = true;
          goto _L4
_L7:
        Process.killProcess(runningappprocessinfo.pid);
        flag = true;
_L2:
        return flag;
        k++;
          goto _L9
    }

    private void launchAssistAction()
    {
        Intent intent;
        sendCloseSystemWindows("assist");
        intent = ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2);
        if (intent == null)
            break MISSING_BLOCK_LABEL_58;
        intent.setFlags(0x34000000);
        mContext.startActivityAsUser(intent, new UserHandle(-2));
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Slog.w("WindowManager", "No activity to handle assist action.", activitynotfoundexception);
        return;
    }

    private void launchAssistLongPressAction()
    {
        performHapticFeedbackLw(null, 0, false);
        sendCloseSystemWindows("assist");
        Intent intent = new Intent("android.intent.action.SEARCH_LONG_PRESS");
        intent.setFlags(0x10000000);
        SearchManager searchmanager;
        try
        {
            searchmanager = getSearchManager();
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Slog.w("WindowManager", "No activity to handle assist long press action.", activitynotfoundexception);
            return;
        }
        if (searchmanager == null)
            break MISSING_BLOCK_LABEL_49;
        searchmanager.stopSearch();
        mContext.startActivityAsUser(intent, new UserHandle(-2));
        return;
    }

    private void offsetInputMethodWindowLw(android.view.WindowManagerPolicy.WindowState windowstate)
    {
        int i = windowstate.getContentFrameLw().top + windowstate.getGivenContentInsetsLw().top;
        if (mContentBottom > i)
            mContentBottom = i;
        int j = windowstate.getVisibleFrameLw().top + windowstate.getGivenVisibleInsetsLw().top;
        if (mCurBottom > j)
            mCurBottom = j;
        if (DEBUG_LAYOUT)
            Log.v("WindowManager", (new StringBuilder()).append("Input method: mDockBottom=").append(mDockBottom).append(" mContentBottom=").append(mContentBottom).append(" mCurBottom=").append(mCurBottom).toString());
    }

    private void performAuditoryFeedbackForAccessibilityIfNeed()
    {
        if (isGlobalAccessibilityGestureEnabled() && !((AudioManager)mContext.getSystemService("audio")).isSilentMode())
        {
            Ringtone ringtone = RingtoneManager.getRingtone(mContext, android.provider.Settings.System.DEFAULT_NOTIFICATION_URI);
            ringtone.setStreamType(3);
            ringtone.play();
            return;
        } else
        {
            return;
        }
    }

    private int readRotation(int i)
    {
        int j = mContext.getResources().getInteger(i);
        j;
        JVM INSTR lookupswitch 4: default 56
    //                   0: 58
    //                   90: 60
    //                   180: 62
    //                   270: 64;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        return -1;
_L2:
        return 0;
_L3:
        return 1;
_L4:
        return 2;
_L5:
        return 3;
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
        if (true) goto _L1; else goto _L6
_L6:
    }

    static void sendCloseSystemWindows(Context context, String s)
    {
        if (!ActivityManagerNative.isSystemReady())
            break MISSING_BLOCK_LABEL_15;
        ActivityManagerNative.getDefault().closeSystemDialogs(s);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private void takeScreenshot()
    {
label0:
        {
            synchronized (mScreenshotLock)
            {
                if (mScreenshotConnection == null)
                    break label0;
            }
            return;
        }
        ComponentName componentname = new ComponentName("com.android.systemui", "com.android.systemui.screenshot.TakeScreenshotService");
        Intent intent = new Intent();
        intent.setComponent(componentname);
        ServiceConnection serviceconnection = new ServiceConnection() {

            final PhoneWindowManager this$0;

            public void onServiceConnected(ComponentName componentname1, IBinder ibinder)
            {
label0:
                {
                    synchronized (mScreenshotLock)
                    {
                        if (mScreenshotConnection == this)
                            break label0;
                    }
                    return;
                }
                Messenger messenger;
                Message message;
                messenger = new Messenger(ibinder);
                message = Message.obtain(null, 1);
                message.replyTo = new Messenger(mHandler.getLooper(). new Handler(this) {

                    final _cls12 this$1;
                    final ServiceConnection val$myConn;

                    public void handleMessage(Message message)
                    {
                        synchronized (mScreenshotLock)
                        {
                            if (mScreenshotConnection == myConn)
                            {
                                mContext.unbindService(mScreenshotConnection);
                                mScreenshotConnection = null;
                                mHandler.removeCallbacks(mScreenshotTimeout);
                            }
                        }
                        return;
                        exception;
                        obj;
                        JVM INSTR monitorexit ;
                        throw exception;
                    }

            
            {
                this$1 = final__pcls12;
                myConn = serviceconnection;
                super(Looper.this);
            }
                }
);
                message.arg2 = 0;
                message.arg1 = 0;
                if (mStatusBar != null && mStatusBar.isVisibleLw())
                    message.arg1 = 1;
                if (mNavigationBar != null && mNavigationBar.isVisibleLw())
                    message.arg2 = 1;
                try
                {
                    messenger.send(message);
                }
                catch (RemoteException remoteexception) { }
                obj1;
                JVM INSTR monitorexit ;
                return;
                exception1;
                obj1;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            public void onServiceDisconnected(ComponentName componentname1)
            {
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
;
        if (mContext.bindService(intent, serviceconnection, 1, -2))
        {
            mScreenshotConnection = serviceconnection;
            mHandler.postDelayed(mScreenshotTimeout, 10000L);
        }
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void updateLockScreenTimeout()
    {
        ScreenLockTimeout screenlocktimeout = mScreenLockTimeout;
        screenlocktimeout;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if (mAllowLockscreenWhenOn && mScreenOnEarly && mKeyguardMediator != null && mKeyguardMediator.isSecure())
            flag = true;
        else
            flag = false;
        if (mLockScreenTimerActive == flag) goto _L2; else goto _L1
_L1:
        if (!flag)
            break MISSING_BLOCK_LABEL_92;
        if (localLOGV)
            Log.v("WindowManager", "setting lockscreen timer");
        mHandler.postDelayed(mScreenLockTimeout, mLockScreenTimeout);
_L4:
        mLockScreenTimerActive = flag;
_L2:
        screenlocktimeout;
        JVM INSTR monitorexit ;
        return;
        if (localLOGV)
            Log.v("WindowManager", "clearing lockscreen timer");
        mHandler.removeCallbacks(mScreenLockTimeout);
        if (true) goto _L4; else goto _L3
_L3:
        exception;
        screenlocktimeout;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private int updateSystemUiVisibilityLw()
    {
        if (mFocusedWindow == null)
            return 0;
        if (mFocusedWindow.getAttrs().type == 2004 && mHideLockScreen)
            return 0;
        int i = mFocusedWindow.getSystemUiVisibility() & (-1 ^ mResettingSystemUiFlags) & (-1 ^ mForceClearedSystemUiFlags);
        if (mForcingShowNavBar && mFocusedWindow.getSurfaceLayer() < mForcingShowNavBarLayer)
            i &= -8;
        final int visibility = i;
        int j = visibility ^ mLastSystemUiFlags;
        final boolean needsMenu = mFocusedWindow.getNeedsMenuLw(mTopFullscreenOpaqueWindowState);
        if (j == 0 && mLastFocusNeedsMenu == needsMenu && mFocusedApp == mFocusedWindow.getAppToken())
        {
            return 0;
        } else
        {
            mLastSystemUiFlags = visibility;
            mLastFocusNeedsMenu = needsMenu;
            mFocusedApp = mFocusedWindow.getAppToken();
            mHandler.post(new Runnable() {

                final PhoneWindowManager this$0;
                final boolean val$needsMenu;
                final int val$visibility;

                public void run()
                {
                    IStatusBarService istatusbarservice;
                    try
                    {
                        istatusbarservice = getStatusBarService();
                    }
                    catch (RemoteException remoteexception)
                    {
                        mStatusBarService = null;
                        return;
                    }
                    if (istatusbarservice == null)
                        break MISSING_BLOCK_LABEL_33;
                    istatusbarservice.setSystemUiVisibility(visibility, -1);
                    istatusbarservice.topAppWindowChanged(needsMenu);
                }

            
            {
                this$0 = PhoneWindowManager.this;
                visibility = i;
                needsMenu = flag;
                super();
            }
            }
);
            return j;
        }
    }

    private void waitForKeyguard(final android.view.WindowManagerPolicy.ScreenOnListener screenOnListener)
    {
        if (mKeyguardMediator != null)
        {
            if (screenOnListener != null)
            {
                mKeyguardMediator.onScreenTurnedOn(new com.android.internal.policy.impl.keyguard.KeyguardViewManager.ShowListener() {

                    final PhoneWindowManager this$0;
                    final android.view.WindowManagerPolicy.ScreenOnListener val$screenOnListener;

                    public void onShown(IBinder ibinder)
                    {
                        if (ibinder == null)
                        {
                            waitForTopFullscreenWindowDrawn(screenOnListener);
                            return;
                        } else
                        {
                            waitForKeyguardWindowDrawn(ibinder, screenOnListener);
                            return;
                        }
                    }

            
            {
                this$0 = PhoneWindowManager.this;
                screenOnListener = screenonlistener;
                super();
            }
                }
);
                return;
            }
            mKeyguardMediator.onScreenTurnedOn(null);
        } else
        {
            Slog.i("WindowManager", "No keyguard mediator!");
        }
        waitForTopFullscreenWindowDrawn(screenOnListener);
    }

    private void waitForKeyguardWindowDrawn(IBinder ibinder, final android.view.WindowManagerPolicy.ScreenOnListener screenOnListener)
    {
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_33;
        boolean flag = mWindowManager.waitForWindowDrawn(ibinder, new android.os.IRemoteCallback.Stub() {

            final PhoneWindowManager this$0;
            final android.view.WindowManagerPolicy.ScreenOnListener val$screenOnListener;

            public void sendResult(Bundle bundle)
            {
                Slog.i("WindowManager", "Lock screen displayed!");
                finishScreenTurningOn(screenOnListener);
            }

            
            {
                this$0 = PhoneWindowManager.this;
                screenOnListener = screenonlistener;
                super();
            }
        }
);
        if (flag)
            return;
        break MISSING_BLOCK_LABEL_33;
        RemoteException remoteexception;
        remoteexception;
        Slog.i("WindowManager", "No lock screen!");
        finishScreenTurningOn(screenOnListener);
        return;
    }

    private void waitForTopFullscreenWindowDrawn(android.view.WindowManagerPolicy.ScreenOnListener screenonlistener)
    {
        android.view.WindowManagerPolicy.WindowState windowstate = mTopFullscreenOpaqueWindowState;
        IBinder ibinder = null;
        if (windowstate != null)
            ibinder = mTopFullscreenOpaqueWindowState.asBinder();
        waitForKeyguardWindowDrawn(ibinder, screenonlistener);
    }

    public void HandleMusicVol(KeyEvent keyevent, boolean flag)
    {
label0:
        {
            int i = keyevent.getKeyCode();
            boolean flag1;
            if (keyevent.getAction() == 0)
                flag1 = true;
            else
                flag1 = false;
            if (mVolBtnMusicControls && flag1 && i != 164)
            {
                mIsLongPress = false;
                byte byte0;
                if (keyevent.getKeyCode() == 24)
                    byte0 = 87;
                else
                    byte0 = 88;
                Message message = mHandler.obtainMessage(5, new KeyEvent(keyevent.getDownTime(), keyevent.getEventTime(), keyevent.getAction(), byte0, 0));
                message.setAsynchronous(true);
                mHandler.sendMessageDelayed(message, ViewConfiguration.getLongPressTimeout());
                break label0;
            }
            if (mVolBtnMusicControls && !flag1)
            {
                mHandler.removeMessages(5);
                if (mIsLongPress)
                    break label0;
            }
            if (!flag)
            {
                handleVolumeKey(3, i);
                return;
            }
        }
    }

    public View addStartingWindow(IBinder ibinder, String s, int i, CompatibilityInfo compatibilityinfo, CharSequence charsequence, int j, int k, 
            int l)
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        View view = null;
_L4:
        return view;
_L2:
        Context context;
        int i1;
        context = mContext;
        i1 = context.getThemeResId();
        if (i == i1 && j == 0)
            break MISSING_BLOCK_LABEL_49;
        RuntimeException runtimeexception;
        android.view.WindowManager.BadTokenException badtokenexception;
        Window window;
        TypedArray typedarray;
        android.view.WindowManager.LayoutParams layoutparams;
        WindowManager windowmanager;
        android.view.ViewParent viewparent;
        try
        {
            context = context.createPackageContext(s, 0);
            context.setTheme(i);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
        window = PolicyManager.makeNewWindow(context);
        typedarray = window.getWindowStyle();
        if (typedarray.getBoolean(12, false) || typedarray.getBoolean(14, false))
            break; /* Loop/switch isn't completed */
        window.setTitle(context.getResources().getText(j, charsequence));
        window.setType(3);
        window.setFlags(0x20000 | (8 | (l | 0x10)), 0x20000 | (8 | (l | 0x10)));
        if (!compatibilityinfo.supportsScreen())
            window.addFlags(0x20000000);
        window.setLayout(-1, -1);
        layoutparams = window.getAttributes();
        layoutparams.token = ibinder;
        layoutparams.packageName = s;
        layoutparams.windowAnimations = window.getWindowStyle().getResourceId(8, 0);
        layoutparams.privateFlags = 1 | layoutparams.privateFlags;
        layoutparams.privateFlags = 0x10 | layoutparams.privateFlags;
        layoutparams.setTitle((new StringBuilder()).append("Starting ").append(s).toString());
        windowmanager = (WindowManager)context.getSystemService("window");
        view = window.getDecorView();
        if (window.isFloating())
            return null;
        windowmanager.addView(view, layoutparams);
        viewparent = view.getParent();
        if (viewparent == null)
            return null;
        if (true) goto _L4; else goto _L3
        badtokenexception;
        Log.w("WindowManager", (new StringBuilder()).append(ibinder).append(" already running, starting window not displayed").toString());
_L5:
        return null;
        runtimeexception;
        Log.w("WindowManager", (new StringBuilder()).append(ibinder).append(" failed creating starting window").toString(), runtimeexception);
        if (true) goto _L5; else goto _L3
_L3:
        return null;
    }

    public void adjustConfigurationLw(Configuration configuration, int i, int j)
    {
        boolean flag;
        if ((i & 1) != 0)
            flag = true;
        else
            flag = false;
        mHaveBuiltInKeyboard = flag;
        readLidState();
        applyLidSwitchState();
        if (configuration.keyboard == 1 || i == 1 && isHidden(mLidKeyboardAccessibility))
        {
            configuration.hardKeyboardHidden = 2;
            if (!mHasSoftInput)
                configuration.keyboardHidden = 2;
        }
        if (configuration.navigation == 1 || j == 1 && isHidden(mLidNavigationAccessibility))
            configuration.navigationHidden = 2;
    }

    public int adjustSystemUiVisibilityLw(int i)
    {
        mResettingSystemUiFlags = i & mResettingSystemUiFlags;
        return i & (-1 ^ mResettingSystemUiFlags) & (-1 ^ mForceClearedSystemUiFlags);
    }

    public void adjustWindowParamsLw(android.view.WindowManager.LayoutParams layoutparams)
    {
        switch (layoutparams.type)
        {
        case 2005: 
        case 2006: 
        case 2015: 
            layoutparams.flags = 0x18 | layoutparams.flags;
            layoutparams.flags = 0xfffbffff & layoutparams.flags;
            return;
        }
    }

    public boolean allowAppAnimationsLw()
    {
        return mKeyguard == null || !mKeyguard.isVisibleLw() || mKeyguard.isAnimatingLw();
    }

    public void applyPostLayoutPolicyLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams)
    {
        if (DEBUG_LAYOUT)
            Slog.i("WindowManager", (new StringBuilder()).append("Win ").append(windowstate).append(": isVisibleOrBehindKeyguardLw=").append(windowstate.isVisibleOrBehindKeyguardLw()).toString());
        if (mTopFullscreenOpaqueWindowState == null && (0x20 & windowstate.getAttrs().privateFlags) != 0 && mForcingShowNavBarLayer < 0)
        {
            mForcingShowNavBar = true;
            mForcingShowNavBarLayer = windowstate.getSurfaceLayer();
        }
        if (mTopFullscreenOpaqueWindowState == null && windowstate.isVisibleOrBehindKeyguardLw() && !windowstate.isGoneForLayoutLw())
        {
            if ((0x800 & layoutparams.flags) != 0)
                if (layoutparams.type == 2004)
                    mForceStatusBarFromKeyguard = true;
                else
                    mForceStatusBar = true;
            if (layoutparams.type == 2004)
                mShowingLockscreen = true;
            boolean flag;
            if (layoutparams.type >= 1 && layoutparams.type <= 99)
                flag = true;
            else
                flag = false;
            if (layoutparams.type == 2023 && (!mDreamingLockscreen || windowstate.isVisibleLw() && windowstate.hasDrawnLw()))
            {
                mShowingDream = true;
                flag = true;
            }
            if (flag && layoutparams.x == 0 && layoutparams.y == 0 && layoutparams.width == -1 && layoutparams.height == -1)
            {
                if (DEBUG_LAYOUT)
                    Log.v("WindowManager", (new StringBuilder()).append("Fullscreen window: ").append(windowstate).toString());
                mTopFullscreenOpaqueWindowState = windowstate;
                if ((0x80000 & layoutparams.flags) != 0)
                {
                    if (DEBUG_LAYOUT)
                        Log.v("WindowManager", (new StringBuilder()).append("Setting mHideLockScreen to true by win ").append(windowstate).toString());
                    mHideLockScreen = true;
                    mForceStatusBarFromKeyguard = false;
                } else
                {
                    if (DEBUG_LAYOUT)
                        Log.v("WindowManager", (new StringBuilder()).append("Setting mHideLockScreen to false by win ").append(windowstate).toString());
                    mHideLockScreen = false;
                }
                if ((0x400000 & layoutparams.flags) != 0 && mDismissKeyguard == 0)
                {
                    if (DEBUG_LAYOUT)
                        Log.v("WindowManager", (new StringBuilder()).append("Setting mDismissKeyguard to true by win ").append(windowstate).toString());
                    boolean flag1 = mKeyguardMediator.isSecure();
                    int i;
                    if (mWinDismissingKeyguard == windowstate && mSecureDismissingKeyguard == flag1)
                        i = 2;
                    else
                        i = 1;
                    mDismissKeyguard = i;
                    mWinDismissingKeyguard = windowstate;
                    mSecureDismissingKeyguard = flag1;
                    mForceStatusBarFromKeyguard = false;
                }
                if ((1 & layoutparams.flags) != 0)
                    mAllowLockscreenWhenOn = true;
            }
        }
    }

    public void beginLayoutLw(boolean flag, int i, int j, int k)
    {
        mUnrestrictedScreenTop = 0;
        mUnrestrictedScreenLeft = 0;
        mUnrestrictedScreenWidth = i;
        mUnrestrictedScreenHeight = j;
        mRestrictedScreenTop = 0;
        mRestrictedScreenLeft = 0;
        mRestrictedScreenWidth = i;
        mRestrictedScreenHeight = j;
        mCurLeft = 0;
        mSystemLeft = 0;
        mStableFullscreenLeft = 0;
        mStableLeft = 0;
        mContentLeft = 0;
        mDockLeft = 0;
        mCurTop = 0;
        mSystemTop = 0;
        mStableFullscreenTop = 0;
        mStableTop = 0;
        mContentTop = 0;
        mDockTop = 0;
        mCurRight = i;
        mSystemRight = i;
        mStableFullscreenRight = i;
        mStableRight = i;
        mContentRight = i;
        mDockRight = i;
        mCurBottom = j;
        mSystemBottom = j;
        mStableFullscreenBottom = j;
        mStableBottom = j;
        mContentBottom = j;
        mDockBottom = j;
        mDockLayer = 0x10000000;
        mStatusBarLayer = -1;
        boolean flag1;
        if (mStatusBar == null)
            flag1 = true;
        else
            flag1 = false;
        mLayoutDisableStatusBar = flag1;
        if (KeyguardUpdateMonitor.isAlarmBoot() || KeyguardViewMediator.mHideNavBar)
        {
            if (DEBUG_LAYOUT)
                Log.v("WindowManager", "Hiding status bar by for power-off alarm screen");
            mLayoutDisableStatusBar = true;
        }
        if (mLayoutDisableStatusBar && mStatusBar != null)
            mStatusBar.hideLw(false);
        Rect rect = mTmpParentFrame;
        Rect rect1 = mTmpDisplayFrame;
        Rect rect2 = mTmpVisibleFrame;
        int l = mDockLeft;
        rect2.left = l;
        rect1.left = l;
        rect.left = l;
        int i1 = mDockTop;
        rect2.top = i1;
        rect1.top = i1;
        rect.top = i1;
        int j1 = mDockRight;
        rect2.right = j1;
        rect1.right = j1;
        rect.right = j1;
        int k1 = mDockBottom;
        rect2.bottom = k1;
        rect1.bottom = k1;
        rect.bottom = k1;
        if (flag)
        {
            boolean flag2;
            if ((2 & mLastSystemUiFlags) == 0)
                flag2 = true;
            else
                flag2 = false;
            if (flag2)
            {
                if (mHideNavFakeWindow != null)
                {
                    mHideNavFakeWindow.dismiss();
                    mHideNavFakeWindow = null;
                }
            } else
            if (mHideNavFakeWindow == null)
                mHideNavFakeWindow = mWindowManagerFuncs.addFakeWindow(mHandler.getLooper(), mHideNavInputEventReceiverFactory, "hidden nav", 2022, 0, false, false, true);
            boolean flag3;
            if (!mCanHideNavigationBar)
                flag3 = true;
            else
                flag3 = false;
            boolean flag4 = flag2 | flag3;
            if (mNavigationBar != null)
            {
                boolean flag5;
                if (mNavigationBarCanMove && i >= j)
                    flag5 = false;
                else
                    flag5 = true;
                mNavigationBarOnBottom = flag5;
                if (mNavigationBarOnBottom)
                {
                    int j5 = j - mNavigationBarHeightForRotation[k];
                    mTmpNavigationFrame.set(0, j5, i, j);
                    int k5 = mTmpNavigationFrame.top;
                    mStableFullscreenBottom = k5;
                    mStableBottom = k5;
                    if (flag4)
                    {
                        if (!KeyguardUpdateMonitor.isAlarmBoot() && !KeyguardViewMediator.mHideNavBar)
                        {
                            mNavigationBar.showLw(true);
                            mDockBottom = mTmpNavigationFrame.top;
                            mRestrictedScreenHeight = mDockBottom - mDockTop;
                        }
                    } else
                    {
                        mNavigationBar.hideLw(true);
                    }
                    if (flag4 && !mNavigationBar.isAnimatingLw())
                        mSystemBottom = mTmpNavigationFrame.top;
                } else
                {
                    int l3 = i - mNavigationBarWidthForRotation[k];
                    mTmpNavigationFrame.set(l3, 0, i, j);
                    int i4 = mTmpNavigationFrame.left;
                    mStableFullscreenRight = i4;
                    mStableRight = i4;
                    if (flag4)
                    {
                        if (!KeyguardUpdateMonitor.isAlarmBoot() && !KeyguardViewMediator.mHideNavBar)
                        {
                            mNavigationBar.showLw(true);
                            mDockRight = mTmpNavigationFrame.left;
                            mRestrictedScreenWidth = mDockRight - mDockLeft;
                        }
                    } else
                    {
                        mNavigationBar.hideLw(true);
                    }
                    if (flag4 && !mNavigationBar.isAnimatingLw())
                        mSystemRight = mTmpNavigationFrame.left;
                }
                int j4 = mDockTop;
                mCurTop = j4;
                mContentTop = j4;
                int k4 = mDockBottom;
                mCurBottom = k4;
                mContentBottom = k4;
                int l4 = mDockLeft;
                mCurLeft = l4;
                mContentLeft = l4;
                int i5 = mDockRight;
                mCurRight = i5;
                mContentRight = i5;
                mStatusBarLayer = mNavigationBar.getSurfaceLayer();
                mNavigationBar.computeFrameLw(mTmpNavigationFrame, mTmpNavigationFrame, mTmpNavigationFrame, mTmpNavigationFrame);
                if (DEBUG_LAYOUT)
                    Log.i("WindowManager", (new StringBuilder()).append("mNavigationBar frame: ").append(mTmpNavigationFrame).toString());
            }
            if (DEBUG_LAYOUT)
            {
                Object aobj1[] = new Object[4];
                aobj1[0] = Integer.valueOf(mDockLeft);
                aobj1[1] = Integer.valueOf(mDockTop);
                aobj1[2] = Integer.valueOf(mDockRight);
                aobj1[3] = Integer.valueOf(mDockBottom);
                Log.i("WindowManager", String.format("mDock rect: (%d,%d - %d,%d)", aobj1));
            }
            if (!mLayoutDisableStatusBar)
            {
                int l1 = mUnrestrictedScreenLeft;
                rect1.left = l1;
                rect.left = l1;
                int i2 = mUnrestrictedScreenTop;
                rect1.top = i2;
                rect.top = i2;
                int j2 = mUnrestrictedScreenWidth - mUnrestrictedScreenLeft;
                rect1.right = j2;
                rect.right = j2;
                int k2 = mUnrestrictedScreenHeight - mUnrestrictedScreenTop;
                rect1.bottom = k2;
                rect.bottom = k2;
                rect2.left = mStableLeft;
                rect2.top = mStableTop;
                rect2.right = mStableRight;
                rect2.bottom = mStableBottom;
                mStatusBarLayer = mStatusBar.getSurfaceLayer();
                mStatusBar.computeFrameLw(rect, rect1, rect2, rect2);
                mStableTop = mUnrestrictedScreenTop + mStatusBarHeight;
                if (mStatusBar.isVisibleLw())
                {
                    mDockTop = mUnrestrictedScreenTop + mStatusBarHeight;
                    int l2 = mDockTop;
                    mCurTop = l2;
                    mContentTop = l2;
                    int i3 = mDockBottom;
                    mCurBottom = i3;
                    mContentBottom = i3;
                    int j3 = mDockLeft;
                    mCurLeft = j3;
                    mContentLeft = j3;
                    int k3 = mDockRight;
                    mCurRight = k3;
                    mContentRight = k3;
                    if (DEBUG_LAYOUT)
                    {
                        StringBuilder stringbuilder = (new StringBuilder()).append("Status bar: ");
                        Object aobj[] = new Object[12];
                        aobj[0] = Integer.valueOf(mDockLeft);
                        aobj[1] = Integer.valueOf(mDockTop);
                        aobj[2] = Integer.valueOf(mDockRight);
                        aobj[3] = Integer.valueOf(mDockBottom);
                        aobj[4] = Integer.valueOf(mContentLeft);
                        aobj[5] = Integer.valueOf(mContentTop);
                        aobj[6] = Integer.valueOf(mContentRight);
                        aobj[7] = Integer.valueOf(mContentBottom);
                        aobj[8] = Integer.valueOf(mCurLeft);
                        aobj[9] = Integer.valueOf(mCurTop);
                        aobj[10] = Integer.valueOf(mCurRight);
                        aobj[11] = Integer.valueOf(mCurBottom);
                        Log.v("WindowManager", stringbuilder.append(String.format("dock=[%d,%d][%d,%d] content=[%d,%d][%d,%d] cur=[%d,%d][%d,%d]", aobj)).toString());
                    }
                }
                if (mStatusBar.isVisibleLw() && !mStatusBar.isAnimatingLw())
                    mSystemTop = mUnrestrictedScreenTop + mStatusBarHeight;
            }
            mfindingTopFullscreenOpaque = true;
        }
    }

    public void beginPostLayoutPolicyLw(int i, int j)
    {
        mTopFullscreenOpaqueWindowState = null;
        mForceStatusBar = false;
        mForceStatusBarFromKeyguard = false;
        mForcingShowNavBar = false;
        mForcingShowNavBarLayer = -1;
        mAllowLockscreenWhenOn = false;
        mDismissKeyguard = 0;
        mShowingLockscreen = false;
        mShowingDream = false;
    }

    public boolean canBeForceHidden(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams)
    {
        switch (layoutparams.type)
        {
        case 2000: 
        case 2004: 
        case 2013: 
        case 2019: 
        case 2023: 
        case 2025: 
            return false;
        }
        return true;
    }

    public boolean canMagnifyWindowLw(android.view.WindowManager.LayoutParams layoutparams)
    {
        switch (layoutparams.type)
        {
        case 2011: 
        case 2012: 
        case 2019: 
        case 2027: 
            return false;
        }
        return true;
    }

    public int checkAddPermission(android.view.WindowManager.LayoutParams layoutparams)
    {
        int i = layoutparams.type;
        if (i >= 2000 && i <= 2999)
        {
            String s = null;
            switch (i)
            {
            case 2002: 
            case 2003: 
            case 2006: 
            case 2007: 
            case 2010: 
                s = "android.permission.SYSTEM_ALERT_WINDOW";
                break;

            default:
                s = "android.permission.INTERNAL_SYSTEM_WINDOW";
                break;

            case 2005: 
            case 2011: 
            case 2013: 
            case 2023: 
            case 2029: 
                break;
            }
            if (s != null && mContext.checkCallingOrSelfPermission(s) != 0)
                return -8;
        }
        return 0;
    }

    public boolean checkShowToOwnerOnly(android.view.WindowManager.LayoutParams layoutparams)
    {
        switch (layoutparams.type)
        {
        default:
            if ((0x10 & layoutparams.privateFlags) == 0)
                break;
            // fall through

        case 3: // '\003'
        case 2000: 
        case 2001: 
        case 2002: 
        case 2004: 
        case 2007: 
        case 2008: 
        case 2009: 
        case 2014: 
        case 2017: 
        case 2018: 
        case 2019: 
        case 2020: 
        case 2021: 
        case 2022: 
        case 2024: 
        case 2025: 
        case 2026: 
        case 2027: 
        case 2028: 
            if (mContext.checkCallingOrSelfPermission("android.permission.INTERNAL_SYSTEM_WINDOW") == 0)
                return false;
            break;
        }
        return true;
    }

    public Animation createForceHideEnterAnimation(boolean flag)
    {
        Context context = mContext;
        int i;
        if (flag)
            i = 0x10a0030;
        else
            i = 0x10a002d;
        return AnimationUtils.loadAnimation(context, i);
    }

    public void dismissKeyguardLw()
    {
        if (mKeyguardMediator.isShowing())
            mHandler.post(new Runnable() {

                final PhoneWindowManager this$0;

                public void run()
                {
                    if (mKeyguardMediator.isDismissable())
                    {
                        mKeyguardMediator.keyguardDone(false, true);
                        return;
                    } else
                    {
                        mKeyguardMediator.dismiss();
                        return;
                    }
                }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
            }
);
    }

    void dispatchMediaKeyRepeatWithWakeLock(KeyEvent keyevent)
    {
        mHavePendingMediaKeyRepeatWithWakeLock = false;
        KeyEvent keyevent1 = KeyEvent.changeTimeRepeat(keyevent, SystemClock.uptimeMillis(), 1, 0x80 | keyevent.getFlags());
        if (DEBUG_INPUT)
            Slog.d("WindowManager", (new StringBuilder()).append("dispatchMediaKeyRepeatWithWakeLock: ").append(keyevent1).toString());
        dispatchMediaKeyWithWakeLockToAudioService(keyevent1);
        mBroadcastWakeLock.release();
    }

    void dispatchMediaKeyWithWakeLock(KeyEvent keyevent)
    {
        if (DEBUG_INPUT)
            Slog.d("WindowManager", (new StringBuilder()).append("dispatchMediaKeyWithWakeLock: ").append(keyevent).toString());
        if (mHavePendingMediaKeyRepeatWithWakeLock)
        {
            if (DEBUG_INPUT)
                Slog.d("WindowManager", "dispatchMediaKeyWithWakeLock: canceled repeat");
            mHandler.removeMessages(4);
            mHavePendingMediaKeyRepeatWithWakeLock = false;
            mBroadcastWakeLock.release();
        }
        dispatchMediaKeyWithWakeLockToAudioService(keyevent);
        if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
        {
            mHavePendingMediaKeyRepeatWithWakeLock = true;
            Message message = mHandler.obtainMessage(4, keyevent);
            message.setAsynchronous(true);
            mHandler.sendMessageDelayed(message, ViewConfiguration.getKeyRepeatTimeout());
            return;
        } else
        {
            mBroadcastWakeLock.release();
            return;
        }
    }

    void dispatchMediaKeyWithWakeLockToAudioService(KeyEvent keyevent)
    {
        IAudioService iaudioservice;
        if (!ActivityManagerNative.isSystemReady())
            break MISSING_BLOCK_LABEL_21;
        iaudioservice = getAudioService();
        if (iaudioservice == null)
            break MISSING_BLOCK_LABEL_21;
        iaudioservice.dispatchMediaKeyEventUnderWakelock(keyevent);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("WindowManager", (new StringBuilder()).append("dispatchMediaKeyEvent threw exception ").append(remoteexception).toString());
        return;
    }

    public KeyEvent dispatchUnhandledKey(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i)
    {
        KeyEvent keyevent1;
label0:
        {
            if (DEBUG_INPUT)
                Slog.d("WindowManager", (new StringBuilder()).append("Unhandled key: win=").append(windowstate).append(", action=").append(keyevent.getAction()).append(", flags=").append(keyevent.getFlags()).append(", keyCode=").append(keyevent.getKeyCode()).append(", scanCode=").append(keyevent.getScanCode()).append(", metaState=").append(keyevent.getMetaState()).append(", repeatCount=").append(keyevent.getRepeatCount()).append(", policyFlags=").append(i).toString());
            int j = 0x400 & keyevent.getFlags();
            keyevent1 = null;
            if (j == 0)
            {
                KeyCharacterMap keycharactermap = keyevent.getKeyCharacterMap();
                int k = keyevent.getKeyCode();
                int l = keyevent.getMetaState();
                boolean flag;
                if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
                    flag = true;
                else
                    flag = false;
                android.view.KeyCharacterMap.FallbackAction fallbackaction;
                if (flag)
                    fallbackaction = keycharactermap.getFallbackAction(k, l);
                else
                    fallbackaction = (android.view.KeyCharacterMap.FallbackAction)mFallbackActions.get(k);
                keyevent1 = null;
                if (fallbackaction != null)
                {
                    if (DEBUG_INPUT)
                        Slog.d("WindowManager", (new StringBuilder()).append("Fallback: keyCode=").append(fallbackaction.keyCode).append(" metaState=").append(Integer.toHexString(fallbackaction.metaState)).toString());
                    int i1 = 0x400 | keyevent.getFlags();
                    keyevent1 = KeyEvent.obtain(keyevent.getDownTime(), keyevent.getEventTime(), keyevent.getAction(), fallbackaction.keyCode, keyevent.getRepeatCount(), fallbackaction.metaState, keyevent.getDeviceId(), keyevent.getScanCode(), i1, keyevent.getSource(), null);
                    if (!interceptFallback(windowstate, keyevent1, i))
                    {
                        keyevent1.recycle();
                        keyevent1 = null;
                    }
                    if (flag)
                        mFallbackActions.put(k, fallbackaction);
                    else
                    if (keyevent.getAction() == 1)
                    {
                        mFallbackActions.remove(k);
                        fallbackaction.recycle();
                    }
                }
            }
            if (DEBUG_INPUT)
            {
                if (keyevent1 != null)
                    break label0;
                Slog.d("WindowManager", "No fallback.");
            }
            return keyevent1;
        }
        Slog.d("WindowManager", (new StringBuilder()).append("Performing fallback: ").append(keyevent1).toString());
        return keyevent1;
    }

    public boolean doesForceHide(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams)
    {
        return layoutparams.type == 2004;
    }

    public void dump(String s, PrintWriter printwriter, String as[])
    {
        if (as.length > 0 && as[0].contains("-d"))
        {
            if ("-d enable 0".equals(as[0]))
            {
                DEBUG = true;
                localLOGV = true;
            } else
            if ("-d enable 3".equals(as[0]))
                DEBUG_LAYOUT = true;
            else
            if ("-d enable 6".equals(as[0]))
                DEBUG_INPUT = true;
            else
            if ("-d enable 10".equals(as[0]))
                DEBUG_ORIENTATION = true;
            else
            if (!"-d enable 16".equals(as[0]) && !"-d enable 21".equals(as[0]))
                if ("-d disable 0".equals(as[0]))
                {
                    DEBUG = false;
                    localLOGV = false;
                } else
                if ("-d disable 3".equals(as[0]))
                    DEBUG_LAYOUT = false;
                else
                if ("-d disable 6".equals(as[0]))
                    DEBUG_INPUT = false;
                else
                if ("-d disable 10".equals(as[0]))
                    DEBUG_ORIENTATION = false;
                else
                if ("-d disable 16".equals(as[0]) || !"-d disable 21".equals(as[0]));
        } else
        {
            printwriter.print(s);
            printwriter.print("mSafeMode=");
            printwriter.print(mSafeMode);
            printwriter.print(" mSystemReady=");
            printwriter.print(mSystemReady);
            printwriter.print(" mSystemBooted=");
            printwriter.println(mSystemBooted);
            printwriter.print(s);
            printwriter.print("mLidState=");
            printwriter.print(mLidState);
            printwriter.print(" mLidOpenRotation=");
            printwriter.print(mLidOpenRotation);
            printwriter.print(" mHdmiPlugged=");
            printwriter.println(mHdmiPlugged);
            if (mLastSystemUiFlags != 0 || mResettingSystemUiFlags != 0 || mForceClearedSystemUiFlags != 0)
            {
                printwriter.print(s);
                printwriter.print("mLastSystemUiFlags=0x");
                printwriter.print(Integer.toHexString(mLastSystemUiFlags));
                printwriter.print(" mResettingSystemUiFlags=0x");
                printwriter.print(Integer.toHexString(mResettingSystemUiFlags));
                printwriter.print(" mForceClearedSystemUiFlags=0x");
                printwriter.println(Integer.toHexString(mForceClearedSystemUiFlags));
            }
            if (mLastFocusNeedsMenu)
            {
                printwriter.print(s);
                printwriter.print("mLastFocusNeedsMenu=");
                printwriter.println(mLastFocusNeedsMenu);
            }
            printwriter.print(s);
            printwriter.print("mDockMode=");
            printwriter.print(mDockMode);
            printwriter.print(" mCarDockRotation=");
            printwriter.print(mCarDockRotation);
            printwriter.print(" mDeskDockRotation=");
            printwriter.println(mDeskDockRotation);
            printwriter.print(s);
            printwriter.print("mUserRotationMode=");
            printwriter.print(mUserRotationMode);
            printwriter.print(" mUserRotation=");
            printwriter.print(mUserRotation);
            printwriter.print(" mAllowAllRotations=");
            printwriter.println(mAllowAllRotations);
            printwriter.print(s);
            printwriter.print("mCurrentAppOrientation=");
            printwriter.println(mCurrentAppOrientation);
            printwriter.print(s);
            printwriter.print("mCarDockEnablesAccelerometer=");
            printwriter.print(mCarDockEnablesAccelerometer);
            printwriter.print(" mDeskDockEnablesAccelerometer=");
            printwriter.println(mDeskDockEnablesAccelerometer);
            printwriter.print(s);
            printwriter.print("mLidKeyboardAccessibility=");
            printwriter.print(mLidKeyboardAccessibility);
            printwriter.print(" mLidNavigationAccessibility=");
            printwriter.print(mLidNavigationAccessibility);
            printwriter.print(" mLidControlsSleep=");
            printwriter.println(mLidControlsSleep);
            printwriter.print(s);
            printwriter.print("mLongPressOnPowerBehavior=");
            printwriter.print(mLongPressOnPowerBehavior);
            printwriter.print(" mHasSoftInput=");
            printwriter.println(mHasSoftInput);
            printwriter.print(s);
            printwriter.print("mScreenOnEarly=");
            printwriter.print(mScreenOnEarly);
            printwriter.print(" mScreenOnFully=");
            printwriter.print(mScreenOnFully);
            printwriter.print(" mOrientationSensorEnabled=");
            printwriter.println(mOrientationSensorEnabled);
            printwriter.print(s);
            printwriter.print("mUnrestrictedScreen=(");
            printwriter.print(mUnrestrictedScreenLeft);
            printwriter.print(",");
            printwriter.print(mUnrestrictedScreenTop);
            printwriter.print(") ");
            printwriter.print(mUnrestrictedScreenWidth);
            printwriter.print("x");
            printwriter.println(mUnrestrictedScreenHeight);
            printwriter.print(s);
            printwriter.print("mRestrictedScreen=(");
            printwriter.print(mRestrictedScreenLeft);
            printwriter.print(",");
            printwriter.print(mRestrictedScreenTop);
            printwriter.print(") ");
            printwriter.print(mRestrictedScreenWidth);
            printwriter.print("x");
            printwriter.println(mRestrictedScreenHeight);
            printwriter.print(s);
            printwriter.print("mStableFullscreen=(");
            printwriter.print(mStableFullscreenLeft);
            printwriter.print(",");
            printwriter.print(mStableFullscreenTop);
            printwriter.print(")-(");
            printwriter.print(mStableFullscreenRight);
            printwriter.print(",");
            printwriter.print(mStableFullscreenBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mStable=(");
            printwriter.print(mStableLeft);
            printwriter.print(",");
            printwriter.print(mStableTop);
            printwriter.print(")-(");
            printwriter.print(mStableRight);
            printwriter.print(",");
            printwriter.print(mStableBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mSystem=(");
            printwriter.print(mSystemLeft);
            printwriter.print(",");
            printwriter.print(mSystemTop);
            printwriter.print(")-(");
            printwriter.print(mSystemRight);
            printwriter.print(",");
            printwriter.print(mSystemBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mCur=(");
            printwriter.print(mCurLeft);
            printwriter.print(",");
            printwriter.print(mCurTop);
            printwriter.print(")-(");
            printwriter.print(mCurRight);
            printwriter.print(",");
            printwriter.print(mCurBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mContent=(");
            printwriter.print(mContentLeft);
            printwriter.print(",");
            printwriter.print(mContentTop);
            printwriter.print(")-(");
            printwriter.print(mContentRight);
            printwriter.print(",");
            printwriter.print(mContentBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mDock=(");
            printwriter.print(mDockLeft);
            printwriter.print(",");
            printwriter.print(mDockTop);
            printwriter.print(")-(");
            printwriter.print(mDockRight);
            printwriter.print(",");
            printwriter.print(mDockBottom);
            printwriter.println(")");
            printwriter.print(s);
            printwriter.print("mDockLayer=");
            printwriter.print(mDockLayer);
            printwriter.print(" mStatusBarLayer=");
            printwriter.println(mStatusBarLayer);
            printwriter.print(s);
            printwriter.print("mShowingLockscreen=");
            printwriter.print(mShowingLockscreen);
            printwriter.print(" mShowingDream=");
            printwriter.print(mShowingDream);
            printwriter.print(" mDreamingLockscreen=");
            printwriter.println(mDreamingLockscreen);
            if (mLastInputMethodWindow != null)
            {
                printwriter.print(s);
                printwriter.print("mLastInputMethodWindow=");
                printwriter.println(mLastInputMethodWindow);
            }
            if (mLastInputMethodTargetWindow != null)
            {
                printwriter.print(s);
                printwriter.print("mLastInputMethodTargetWindow=");
                printwriter.println(mLastInputMethodTargetWindow);
            }
            if (mStatusBar != null)
            {
                printwriter.print(s);
                printwriter.print("mStatusBar=");
                printwriter.println(mStatusBar);
            }
            if (mNavigationBar != null)
            {
                printwriter.print(s);
                printwriter.print("mNavigationBar=");
                printwriter.println(mNavigationBar);
            }
            if (mKeyguard != null)
            {
                printwriter.print(s);
                printwriter.print("mKeyguard=");
                printwriter.println(mKeyguard);
            }
            if (mFocusedWindow != null)
            {
                printwriter.print(s);
                printwriter.print("mFocusedWindow=");
                printwriter.println(mFocusedWindow);
            }
            if (mFocusedApp != null)
            {
                printwriter.print(s);
                printwriter.print("mFocusedApp=");
                printwriter.println(mFocusedApp);
            }
            if (mWinDismissingKeyguard != null)
            {
                printwriter.print(s);
                printwriter.print("mWinDismissingKeyguard=");
                printwriter.println(mWinDismissingKeyguard);
            }
            if (mTopFullscreenOpaqueWindowState != null)
            {
                printwriter.print(s);
                printwriter.print("mTopFullscreenOpaqueWindowState=");
                printwriter.println(mTopFullscreenOpaqueWindowState);
            }
            printwriter.print(s);
            printwriter.print("mTopIsFullscreen=");
            printwriter.print(mTopIsFullscreen);
            printwriter.print(" mHideLockScreen=");
            printwriter.println(mHideLockScreen);
            printwriter.print(s);
            printwriter.print("mForceStatusBar=");
            printwriter.print(mForceStatusBar);
            printwriter.print(" mForceStatusBarFromKeyguard=");
            printwriter.println(mForceStatusBarFromKeyguard);
            printwriter.print(s);
            printwriter.print("mDismissKeyguard=");
            printwriter.print(mDismissKeyguard);
            printwriter.print(" mWinDismissingKeyguard=");
            printwriter.print(mWinDismissingKeyguard);
            printwriter.print(" mHomePressed=");
            printwriter.println(mHomePressed);
            printwriter.print(s);
            printwriter.print("mAllowLockscreenWhenOn=");
            printwriter.print(mAllowLockscreenWhenOn);
            printwriter.print(" mLockScreenTimeout=");
            printwriter.print(mLockScreenTimeout);
            printwriter.print(" mLockScreenTimerActive=");
            printwriter.println(mLockScreenTimerActive);
            printwriter.print(s);
            printwriter.print("mEndcallBehavior=");
            printwriter.print(mEndcallBehavior);
            printwriter.print(" mIncallPowerBehavior=");
            printwriter.print(mIncallPowerBehavior);
            printwriter.print(" mLongPressOnHomeBehavior=");
            printwriter.println(mLongPressOnHomeBehavior);
            printwriter.print(s);
            printwriter.print("mLandscapeRotation=");
            printwriter.print(mLandscapeRotation);
            printwriter.print(" mSeascapeRotation=");
            printwriter.println(mSeascapeRotation);
            printwriter.print(s);
            printwriter.print("mPortraitRotation=");
            printwriter.print(mPortraitRotation);
            printwriter.print(" mUpsideDownRotation=");
            printwriter.println(mUpsideDownRotation);
            printwriter.print(s);
            printwriter.print("mHdmiRotation=");
            printwriter.print(mHdmiRotation);
            printwriter.print(" mHdmiRotationLock=");
            printwriter.println(mHdmiRotationLock);
        }
        if (mLastFocusNeedsMenu)
        {
            printwriter.print(s);
            printwriter.print("mLastFocusNeedsMenu=");
            printwriter.println(mLastFocusNeedsMenu);
        }
        printwriter.print(s);
        printwriter.print("mDockMode=");
        printwriter.print(mDockMode);
        printwriter.print(" mCarDockRotation=");
        printwriter.print(mCarDockRotation);
        printwriter.print(" mDeskDockRotation=");
        printwriter.println(mDeskDockRotation);
        printwriter.print(s);
        printwriter.print("mUserRotationMode=");
        printwriter.print(mUserRotationMode);
        printwriter.print(" mUserRotation=");
        printwriter.print(mUserRotation);
        printwriter.print(" mAllowAllRotations=");
        printwriter.println(mAllowAllRotations);
        printwriter.print(s);
        printwriter.print("mCurrentAppOrientation=");
        printwriter.println(mCurrentAppOrientation);
        printwriter.print(s);
        printwriter.print("mCarDockEnablesAccelerometer=");
        printwriter.print(mCarDockEnablesAccelerometer);
        printwriter.print(" mDeskDockEnablesAccelerometer=");
        printwriter.println(mDeskDockEnablesAccelerometer);
        printwriter.print(s);
        printwriter.print("mLidKeyboardAccessibility=");
        printwriter.print(mLidKeyboardAccessibility);
        printwriter.print(" mLidNavigationAccessibility=");
        printwriter.print(mLidNavigationAccessibility);
        printwriter.print(" mLidControlsSleep=");
        printwriter.println(mLidControlsSleep);
        printwriter.print(s);
        printwriter.print("mLongPressOnPowerBehavior=");
        printwriter.print(mLongPressOnPowerBehavior);
        printwriter.print(" mHasSoftInput=");
        printwriter.println(mHasSoftInput);
        printwriter.print(s);
        printwriter.print("mScreenOnEarly=");
        printwriter.print(mScreenOnEarly);
        printwriter.print(" mScreenOnFully=");
        printwriter.print(mScreenOnFully);
        printwriter.print(" mOrientationSensorEnabled=");
        printwriter.println(mOrientationSensorEnabled);
        printwriter.print(s);
        printwriter.print("mUnrestrictedScreen=(");
        printwriter.print(mUnrestrictedScreenLeft);
        printwriter.print(",");
        printwriter.print(mUnrestrictedScreenTop);
        printwriter.print(") ");
        printwriter.print(mUnrestrictedScreenWidth);
        printwriter.print("x");
        printwriter.println(mUnrestrictedScreenHeight);
        printwriter.print(s);
        printwriter.print("mRestrictedScreen=(");
        printwriter.print(mRestrictedScreenLeft);
        printwriter.print(",");
        printwriter.print(mRestrictedScreenTop);
        printwriter.print(") ");
        printwriter.print(mRestrictedScreenWidth);
        printwriter.print("x");
        printwriter.println(mRestrictedScreenHeight);
        printwriter.print(s);
        printwriter.print("mStableFullscreen=(");
        printwriter.print(mStableFullscreenLeft);
        printwriter.print(",");
        printwriter.print(mStableFullscreenTop);
        printwriter.print(")-(");
        printwriter.print(mStableFullscreenRight);
        printwriter.print(",");
        printwriter.print(mStableFullscreenBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mStable=(");
        printwriter.print(mStableLeft);
        printwriter.print(",");
        printwriter.print(mStableTop);
        printwriter.print(")-(");
        printwriter.print(mStableRight);
        printwriter.print(",");
        printwriter.print(mStableBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mSystem=(");
        printwriter.print(mSystemLeft);
        printwriter.print(",");
        printwriter.print(mSystemTop);
        printwriter.print(")-(");
        printwriter.print(mSystemRight);
        printwriter.print(",");
        printwriter.print(mSystemBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mCur=(");
        printwriter.print(mCurLeft);
        printwriter.print(",");
        printwriter.print(mCurTop);
        printwriter.print(")-(");
        printwriter.print(mCurRight);
        printwriter.print(",");
        printwriter.print(mCurBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mContent=(");
        printwriter.print(mContentLeft);
        printwriter.print(",");
        printwriter.print(mContentTop);
        printwriter.print(")-(");
        printwriter.print(mContentRight);
        printwriter.print(",");
        printwriter.print(mContentBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mDock=(");
        printwriter.print(mDockLeft);
        printwriter.print(",");
        printwriter.print(mDockTop);
        printwriter.print(")-(");
        printwriter.print(mDockRight);
        printwriter.print(",");
        printwriter.print(mDockBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mDockLayer=");
        printwriter.print(mDockLayer);
        printwriter.print(" mStatusBarLayer=");
        printwriter.println(mStatusBarLayer);
        printwriter.print(s);
        printwriter.print("mShowingLockscreen=");
        printwriter.print(mShowingLockscreen);
        printwriter.print(" mShowingDream=");
        printwriter.print(mShowingDream);
        printwriter.print(" mDreamingLockscreen=");
        printwriter.println(mDreamingLockscreen);
        if (mLastInputMethodWindow != null)
        {
            printwriter.print(s);
            printwriter.print("mLastInputMethodWindow=");
            printwriter.println(mLastInputMethodWindow);
        }
        if (mLastInputMethodTargetWindow != null)
        {
            printwriter.print(s);
            printwriter.print("mLastInputMethodTargetWindow=");
            printwriter.println(mLastInputMethodTargetWindow);
        }
        if (mStatusBar != null)
        {
            printwriter.print(s);
            printwriter.print("mStatusBar=");
            printwriter.println(mStatusBar);
        }
        if (mNavigationBar != null)
        {
            printwriter.print(s);
            printwriter.print("mNavigationBar=");
            printwriter.println(mNavigationBar);
        }
        if (mKeyguard != null)
        {
            printwriter.print(s);
            printwriter.print("mKeyguard=");
            printwriter.println(mKeyguard);
        }
        if (mFocusedWindow != null)
        {
            printwriter.print(s);
            printwriter.print("mFocusedWindow=");
            printwriter.println(mFocusedWindow);
        }
        if (mFocusedApp != null)
        {
            printwriter.print(s);
            printwriter.print("mFocusedApp=");
            printwriter.println(mFocusedApp);
        }
        if (mWinDismissingKeyguard != null)
        {
            printwriter.print(s);
            printwriter.print("mWinDismissingKeyguard=");
            printwriter.println(mWinDismissingKeyguard);
        }
        if (mTopFullscreenOpaqueWindowState != null)
        {
            printwriter.print(s);
            printwriter.print("mTopFullscreenOpaqueWindowState=");
            printwriter.println(mTopFullscreenOpaqueWindowState);
        }
        if (mForcingShowNavBar)
        {
            printwriter.print(s);
            printwriter.print("mForcingShowNavBar=");
            printwriter.println(mForcingShowNavBar);
            printwriter.print("mForcingShowNavBarLayer=");
            printwriter.println(mForcingShowNavBarLayer);
        }
        printwriter.print(s);
        printwriter.print("mTopIsFullscreen=");
        printwriter.print(mTopIsFullscreen);
        printwriter.print(" mHideLockScreen=");
        printwriter.println(mHideLockScreen);
        printwriter.print(s);
        printwriter.print("mForceStatusBar=");
        printwriter.print(mForceStatusBar);
        printwriter.print(" mForceStatusBarFromKeyguard=");
        printwriter.println(mForceStatusBarFromKeyguard);
        printwriter.print(s);
        printwriter.print("mDismissKeyguard=");
        printwriter.print(mDismissKeyguard);
        printwriter.print(" mWinDismissingKeyguard=");
        printwriter.print(mWinDismissingKeyguard);
        printwriter.print(" mHomePressed=");
        printwriter.println(mHomePressed);
        printwriter.print(s);
        printwriter.print("mAllowLockscreenWhenOn=");
        printwriter.print(mAllowLockscreenWhenOn);
        printwriter.print(" mLockScreenTimeout=");
        printwriter.print(mLockScreenTimeout);
        printwriter.print(" mLockScreenTimerActive=");
        printwriter.println(mLockScreenTimerActive);
        printwriter.print(s);
        printwriter.print("mEndcallBehavior=");
        printwriter.print(mEndcallBehavior);
        printwriter.print(" mIncallPowerBehavior=");
        printwriter.print(mIncallPowerBehavior);
        printwriter.print(" mLongPressOnHomeBehavior=");
        printwriter.println(mLongPressOnHomeBehavior);
        printwriter.print(s);
        printwriter.print("mLandscapeRotation=");
        printwriter.print(mLandscapeRotation);
        printwriter.print(" mSeascapeRotation=");
        printwriter.println(mSeascapeRotation);
        printwriter.print(s);
        printwriter.print("mPortraitRotation=");
        printwriter.print(mPortraitRotation);
        printwriter.print(" mUpsideDownRotation=");
        printwriter.println(mUpsideDownRotation);
        printwriter.print(s);
        printwriter.print("mHdmiRotation=");
        printwriter.print(mHdmiRotation);
        printwriter.print(" mHdmiRotationLock=");
        printwriter.println(mHdmiRotationLock);
    }

    public void enableKeyguard(boolean flag)
    {
        if (mKeyguardMediator != null)
            mKeyguardMediator.setKeyguardEnabled(flag);
    }

    public void enableScreenAfterBoot()
    {
        readLidState();
        applyLidSwitchState();
        updateRotation(true);
    }

    public void exitKeyguardSecurely(android.view.WindowManagerPolicy.OnKeyguardExitResult onkeyguardexitresult)
    {
        if (mKeyguardMediator != null)
            mKeyguardMediator.verifyUnlock(onkeyguardexitresult);
    }

    public void finishLayoutLw()
    {
    }

    public int finishPostLayoutPolicyLw()
    {
        android.view.WindowManager.LayoutParams layoutparams;
        if (mTopFullscreenOpaqueWindowState != null)
            layoutparams = mTopFullscreenOpaqueWindowState.getAttrs();
        else
            layoutparams = null;
        if (!mShowingDream)
            mDreamingLockscreen = mShowingLockscreen;
        boolean flag = mLayoutDisableStatusBar;
        int i = 0;
        boolean flag1 = false;
        if (!flag)
        {
            if (DEBUG_LAYOUT)
                Log.i("WindowManager", (new StringBuilder()).append("force=").append(mForceStatusBar).append(" forcefkg=").append(mForceStatusBarFromKeyguard).append(" top=").append(mTopFullscreenOpaqueWindowState).toString());
            if (!mForceStatusBar && !mForceStatusBarFromKeyguard)
            {
                android.view.WindowManagerPolicy.WindowState windowstate = mTopFullscreenOpaqueWindowState;
                i = 0;
                flag1 = false;
                if (windowstate != null)
                {
                    if (localLOGV)
                    {
                        Log.d("WindowManager", (new StringBuilder()).append("frame: ").append(mTopFullscreenOpaqueWindowState.getFrameLw()).append(" shown frame: ").append(mTopFullscreenOpaqueWindowState.getShownFrameLw()).toString());
                        Log.d("WindowManager", (new StringBuilder()).append("attr: ").append(mTopFullscreenOpaqueWindowState.getAttrs()).append(" lp.flags=0x").append(Integer.toHexString(layoutparams.flags)).toString());
                    }
                    if ((0x400 & layoutparams.flags) == 0 && (4 & mLastSystemUiFlags) == 0)
                        flag1 = false;
                    else
                        flag1 = true;
                    if (flag1)
                    {
                        if (DEBUG_LAYOUT)
                            Log.v("WindowManager", "** HIDING status bar");
                        if (mStatusBar.hideLw(true))
                        {
                            i = false | true;
                            mHandler.post(new Runnable() {

                                final PhoneWindowManager this$0;

                                public void run()
                                {
                                    IStatusBarService istatusbarservice;
                                    try
                                    {
                                        istatusbarservice = getStatusBarService();
                                    }
                                    catch (RemoteException remoteexception)
                                    {
                                        mStatusBarService = null;
                                        return;
                                    }
                                    if (istatusbarservice == null)
                                        break MISSING_BLOCK_LABEL_18;
                                    istatusbarservice.collapsePanels();
                                }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
                            }
);
                        } else
                        {
                            boolean flag4 = DEBUG_LAYOUT;
                            i = 0;
                            if (flag4)
                            {
                                Log.v("WindowManager", "Preventing status bar from hiding by policy");
                                i = 0;
                            }
                        }
                    } else
                    {
                        if (DEBUG_LAYOUT)
                            Log.v("WindowManager", "** SHOWING status bar: top is not fullscreen");
                        boolean flag3 = mStatusBar.showLw(true);
                        i = 0;
                        if (flag3)
                            i = false | true;
                    }
                }
            } else
            {
                if (DEBUG_LAYOUT)
                    Log.v("WindowManager", "Showing status bar: forced");
                boolean flag2 = mStatusBar.showLw(true);
                i = 0;
                flag1 = false;
                if (flag2)
                    i = false | true;
            }
        }
        mTopIsFullscreen = flag1;
        if (mKeyguard != null)
        {
            if (localLOGV)
                Log.v("WindowManager", (new StringBuilder()).append("finishPostLayoutPolicyLw: mHideKeyguard=").append(mHideLockScreen).append(" mDismissKeyguard=").append(mDismissKeyguard).append(" mKeyguardMediator.isSecure()= ").append(mKeyguardMediator.isSecure()).toString());
            if (mDismissKeyguard != 0 && !mKeyguardMediator.isSecure())
            {
                if (mKeyguard.hideLw(true))
                    i |= 7;
                if (mKeyguardMediator.isShowing())
                    mHandler.post(new Runnable() {

                        final PhoneWindowManager this$0;

                        public void run()
                        {
                            mKeyguardMediator.keyguardDone(false, false);
                        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
                    }
);
            } else
            if (mHideLockScreen)
            {
                if (mKeyguard.hideLw(true))
                    i |= 7;
                mKeyguardMediator.setHidden(true);
            } else
            if (mDismissKeyguard != 0)
            {
                if (mDismissKeyguard == 1)
                {
                    if (mKeyguard.showLw(true))
                        i |= 7;
                    mKeyguardMediator.setHidden(false);
                    mHandler.post(new Runnable() {

                        final PhoneWindowManager this$0;

                        public void run()
                        {
                            mKeyguardMediator.dismiss();
                        }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
                    }
);
                }
            } else
            {
                mWinDismissingKeyguard = null;
                mSecureDismissingKeyguard = false;
                if (mKeyguard.showLw(false))
                    i |= 7;
                mKeyguardMediator.setHidden(false);
            }
        }
        if ((6 & updateSystemUiVisibilityLw()) != 0)
            i |= 1;
        updateLockScreenTimeout();
        return i;
    }

    public int focusChangedLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManagerPolicy.WindowState windowstate1)
    {
        mFocusedWindow = windowstate1;
        if (windowstate != null && windowstate != windowstate1)
            setLastInputMethodWindowLw(null, null);
        return (6 & updateSystemUiVisibilityLw()) == 0 ? 0 : 1;
    }

    public int getAboveUniverseLayer()
    {
        return windowTypeToLayerLw(2010);
    }

    public int getConfigDisplayHeight(int i, int j, int k)
    {
        if (!mHasSystemNavBar)
            return getNonDecorDisplayHeight(i, j, k) - mStatusBarHeight;
        else
            return getNonDecorDisplayHeight(i, j, k);
    }

    public int getConfigDisplayWidth(int i, int j, int k)
    {
        return getNonDecorDisplayWidth(i, j, k);
    }

    public void getContentInsetHintLw(android.view.WindowManager.LayoutParams layoutparams, Rect rect)
    {
        int i = layoutparams.flags;
        int j = layoutparams.systemUiVisibility | layoutparams.subtreeSystemUiVisibility;
        if ((i & 0x10100) == 0x10100)
        {
            int k;
            int l;
            if (mCanHideNavigationBar && (j & 0x200) != 0)
            {
                k = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                l = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
            } else
            {
                k = mRestrictedScreenLeft + mRestrictedScreenWidth;
                l = mRestrictedScreenTop + mRestrictedScreenHeight;
            }
            if ((j & 0x100) != 0)
                if ((i & 0x400) != 0)
                {
                    rect.set(mStableFullscreenLeft, mStableFullscreenTop, k - mStableFullscreenRight, l - mStableFullscreenBottom);
                    return;
                } else
                {
                    rect.set(mStableLeft, mStableTop, k - mStableRight, l - mStableBottom);
                    return;
                }
            if ((i & 0x400) != 0)
            {
                rect.setEmpty();
                return;
            }
            if ((j & 0x404) == 0)
            {
                rect.set(mCurLeft, mCurTop, k - mCurRight, l - mCurBottom);
                return;
            } else
            {
                rect.set(mCurLeft, mCurTop, k - mCurRight, l - mCurBottom);
                return;
            }
        } else
        {
            rect.setEmpty();
            return;
        }
    }

    public int getMaxWallpaperLayer()
    {
        return windowTypeToLayerLw(2000);
    }

    public int getNonDecorDisplayHeight(int i, int j, int k)
    {
        if (mHasSystemNavBar)
            j -= mNavigationBarHeightForRotation[k];
        else
        if (mHasNavigationBar && (!mNavigationBarCanMove || i < j))
            return j - mNavigationBarHeightForRotation[k];
        return j;
    }

    public int getNonDecorDisplayWidth(int i, int j, int k)
    {
        if (mHasNavigationBar && mNavigationBarCanMove && i > j)
            i -= mNavigationBarWidthForRotation[k];
        return i;
    }

    IStatusBarService getStatusBarService()
    {
        IStatusBarService istatusbarservice;
        synchronized (mServiceAquireLock)
        {
            if (mStatusBarService == null)
                mStatusBarService = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.getService("statusbar"));
            istatusbarservice = mStatusBarService;
        }
        return istatusbarservice;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getSystemDecorRectLw(Rect rect)
    {
        rect.left = mSystemLeft;
        rect.top = mSystemTop;
        rect.right = mSystemRight;
        rect.bottom = mSystemBottom;
        return 0;
    }

    boolean goHome()
    {
        if (SystemProperties.getInt("persist.sys.uts-test-mode", 0) != 1) goto _L2; else goto _L1
_L1:
        Log.d("WindowManager", "UTS-TEST-MODE");
_L4:
        if (ActivityManagerNative.getDefault().startActivityAsUser(null, mHomeIntent, mHomeIntent.resolveTypeIfNeeded(mContext.getContentResolver()), null, null, 0, 1, null, null, null, -2) == 1)
            return false;
        break; /* Loop/switch isn't completed */
_L2:
        try
        {
            ActivityManagerNative.getDefault().stopAppSwitches();
            sendCloseSystemWindows();
            continue; /* Loop/switch isn't completed */
        }
        catch (RemoteException remoteexception) { }
        break; /* Loop/switch isn't completed */
        if (true) goto _L4; else goto _L3
_L3:
        return true;
    }

    void handleVolumeKey(int i, int j)
    {
        IAudioService iaudioservice;
        iaudioservice = getAudioService();
        if (iaudioservice == null)
            return;
        mBroadcastWakeLock.acquire();
        int k;
        if (j == 24)
            k = 1;
        else
            k = -1;
        iaudioservice.adjustStreamVolume(i, k, 0);
        mBroadcastWakeLock.release();
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w("WindowManager", (new StringBuilder()).append("IAudioService.adjustStreamVolume() threw RemoteException ").append(remoteexception).toString());
        mBroadcastWakeLock.release();
        return;
        Exception exception;
        exception;
        mBroadcastWakeLock.release();
        throw exception;
    }

    public boolean hasNavigationBar()
    {
        return mHasNavigationBar;
    }

    public boolean hasSystemNavBar()
    {
        return mHasSystemNavBar;
    }

    public void hideBootMessages()
    {
        mHandler.post(new Runnable() {

            final PhoneWindowManager this$0;

            public void run()
            {
                if (mBootMsgDialog != null)
                {
                    mBootMsgDialog.dismiss();
                    mBootMsgDialog = null;
                }
            }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
        }
);
    }

    public boolean inKeyguardRestrictedKeyInputMode()
    {
        if (mKeyguardMediator == null)
            return false;
        else
            return mKeyguardMediator.isInputRestricted();
    }

    public void init(Context context, IWindowManager iwindowmanager, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs)
    {
        mContext = context;
        mWindowManager = iwindowmanager;
        mWindowManagerFuncs = windowmanagerfuncs;
        mHeadless = "1".equals(SystemProperties.get("ro.config.headless", "0"));
        if (!mHeadless)
            mKeyguardMediator = new KeyguardViewMediator(context, null);
        mHandler = new PolicyHandler();
        mOrientationListener = new MyOrientationListener(mContext);
        IntentFilter intentfilter;
        Intent intent;
        IntentFilter intentfilter1;
        IntentFilter intentfilter2;
        IntentFilter intentfilter3;
        IntentFilter intentfilter4;
        boolean flag;
        try
        {
            mOrientationListener.setCurrentRotation(iwindowmanager.getRotation());
        }
        catch (RemoteException remoteexception) { }
        mSettingsObserver = new SettingsObserver(mHandler);
        mSettingsObserver.observe();
        mShortcutManager = new ShortcutManager(context, mHandler);
        mShortcutManager.observe();
        mHomeIntent = new Intent("android.intent.action.MAIN", null);
        mHomeIntent.addCategory("android.intent.category.HOME");
        mHomeIntent.addFlags(0x10200000);
        mCarDockIntent = new Intent("android.intent.action.MAIN", null);
        mCarDockIntent.addCategory("android.intent.category.CAR_DOCK");
        mCarDockIntent.addFlags(0x10200000);
        mDeskDockIntent = new Intent("android.intent.action.MAIN", null);
        mDeskDockIntent.addCategory("android.intent.category.DESK_DOCK");
        mDeskDockIntent.addFlags(0x10200000);
        mPowerManager = (PowerManager)context.getSystemService("power");
        mBroadcastWakeLock = mPowerManager.newWakeLock(1, "PhoneWindowManager.mBroadcastWakeLock");
        mEnableShiftMenuBugReports = "1".equals(SystemProperties.get("ro.debuggable"));
        mLidOpenRotation = readRotation(0x10e000f);
        mCarDockRotation = readRotation(0x10e0011);
        mDeskDockRotation = readRotation(0x10e0010);
        mCarDockEnablesAccelerometer = mContext.getResources().getBoolean(0x1110020);
        mDeskDockEnablesAccelerometer = mContext.getResources().getBoolean(0x111001f);
        mLidKeyboardAccessibility = mContext.getResources().getInteger(0x10e0015);
        mLidNavigationAccessibility = mContext.getResources().getInteger(0x10e0016);
        mLidControlsSleep = mContext.getResources().getBoolean(0x1110021);
        intentfilter = new IntentFilter();
        intentfilter.addAction(UiModeManager.ACTION_ENTER_CAR_MODE);
        intentfilter.addAction(UiModeManager.ACTION_EXIT_CAR_MODE);
        intentfilter.addAction(UiModeManager.ACTION_ENTER_DESK_MODE);
        intentfilter.addAction(UiModeManager.ACTION_EXIT_DESK_MODE);
        intentfilter.addAction("android.intent.action.DOCK_EVENT");
        intent = context.registerReceiver(mDockReceiver, intentfilter);
        if (intent != null)
            mDockMode = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
        intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        intentfilter1.addAction("android.intent.action.ACTION_BOOT_IPO");
        context.registerReceiver(mIpoEventReceiver, intentfilter1);
        intentfilter2 = new IntentFilter();
        intentfilter2.addAction("android.intent.action.stk.USER_ACTIVITY.enable");
        context.registerReceiver(mStkUserActivityEnReceiver, intentfilter2);
        intentfilter3 = new IntentFilter();
        intentfilter3.addAction("android.intent.action.DREAMING_STARTED");
        intentfilter3.addAction("android.intent.action.DREAMING_STOPPED");
        context.registerReceiver(mDreamReceiver, intentfilter3);
        intentfilter4 = new IntentFilter("android.intent.action.USER_SWITCHED");
        context.registerReceiver(mMultiuserReceiver, intentfilter4);
        mVibrator = (Vibrator)context.getSystemService("vibrator");
        mLongPressVibePattern = getLongIntArray(mContext.getResources(), 0x1070023);
        mVirtualKeyVibePattern = getLongIntArray(mContext.getResources(), 0x1070024);
        mKeyboardTapVibePattern = getLongIntArray(mContext.getResources(), 0x1070025);
        mSafeModeDisabledVibePattern = getLongIntArray(mContext.getResources(), 0x1070026);
        mSafeModeEnabledVibePattern = getLongIntArray(mContext.getResources(), 0x1070027);
        mScreenshotChordEnabled = mContext.getResources().getBoolean(0x111001c);
        initializeHdmiState();
        if (mPowerManager.isScreenOn())
            screenTurningOn(null);
        else
            screenTurnedOff(2);
        if (1 == SystemProperties.getInt("persist.applaunchtime.enable", 0))
            flag = true;
        else
            flag = false;
        mAppLaunchTimeEnabled = flag;
    }

    void initializeHdmiState()
    {
        boolean flag;
        int i;
        FileReader filereader;
        flag = true;
        boolean flag1 = (new File("/sys/devices/virtual/switch/hdmi/state")).exists();
        i = 0;
        if (!flag1)
            break MISSING_BLOCK_LABEL_106;
        mHDMIObserver.startObserving("DEVPATH=/devices/virtual/switch/hdmi");
        filereader = null;
        FileReader filereader1 = new FileReader("/sys/class/switch/hdmi/state");
        char ac[];
        int j;
        ac = new char[15];
        j = filereader1.read(ac);
        i = 0;
        if (j <= flag)
            break MISSING_BLOCK_LABEL_96;
        int k = Integer.parseInt(new String(ac, 0, j - 1));
        boolean flag2;
        if (k != 0)
            i = ((flag) ? 1 : 0);
        else
            i = 0;
        IOException ioexception;
        Exception exception;
        NumberFormatException numberformatexception;
        if (filereader1 != null)
            try
            {
                filereader1.close();
            }
            catch (IOException ioexception4) { }
        if (i == 0)
            flag2 = flag;
        else
            flag2 = false;
        mHdmiPlugged = flag2;
        if (mHdmiPlugged)
            flag = false;
        setHdmiPlugged(flag);
        return;
        ioexception;
_L6:
        Slog.w("WindowManager", (new StringBuilder()).append("Couldn't read hdmi state from /sys/class/switch/hdmi/state: ").append(ioexception).toString());
        i = 0;
        if (filereader == null)
            break MISSING_BLOCK_LABEL_106;
        try
        {
            filereader.close();
        }
        catch (IOException ioexception2)
        {
            i = 0;
            break MISSING_BLOCK_LABEL_106;
        }
        i = 0;
        break MISSING_BLOCK_LABEL_106;
        numberformatexception;
_L4:
        Slog.w("WindowManager", (new StringBuilder()).append("Couldn't read hdmi state from /sys/class/switch/hdmi/state: ").append(numberformatexception).toString());
        i = 0;
        if (filereader == null)
            break MISSING_BLOCK_LABEL_106;
        try
        {
            filereader.close();
        }
        catch (IOException ioexception3)
        {
            i = 0;
            break MISSING_BLOCK_LABEL_106;
        }
        i = 0;
        break MISSING_BLOCK_LABEL_106;
        exception;
_L2:
        if (filereader != null)
            try
            {
                filereader.close();
            }
            catch (IOException ioexception1) { }
        throw exception;
        exception;
        filereader = filereader1;
        if (true) goto _L2; else goto _L1
_L1:
        numberformatexception;
        filereader = filereader1;
        if (true) goto _L4; else goto _L3
_L3:
        ioexception;
        filereader = filereader1;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public long interceptKeyBeforeDispatching(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i)
    {
        boolean flag;
        int j;
        int k;
        int l;
        boolean flag1;
        boolean flag2;
        interceptKeyBeforeDispatching_Custom(keyevent);
        flag = keyguardOn();
        j = keyevent.getKeyCode();
        k = keyevent.getRepeatCount();
        l = keyevent.getMetaState();
        int i1 = keyevent.getFlags();
        if (keyevent.getAction() == 0)
            flag1 = true;
        else
            flag1 = false;
        flag2 = keyevent.isCanceled();
        Log.d("WindowManager", (new StringBuilder()).append("interceptKeyTi keyCode=").append(j).append(" down=").append(flag1).append(" repeatCount=").append(k).append(" keyguardOn=").append(flag).append(" mHomePressed=").append(mHomePressed).append(" canceled=").append(flag2).toString());
        if (mScreenshotChordEnabled && (i1 & 0x400) == 0)
        {
            if (mVolumeDownKeyTriggered && !mPowerKeyTriggered)
            {
                long l2 = SystemClock.uptimeMillis();
                long l3 = 150L + mVolumeDownKeyTime;
                if (l2 < l3)
                    return l3 - l2;
            }
            if (j == 25 && mVolumeDownKeyConsumedByScreenshotChord)
            {
                if (!flag1)
                    mVolumeDownKeyConsumedByScreenshotChord = false;
                return -1L;
            }
        }
        if (j != 3) goto _L2; else goto _L1
_L1:
        if (windowstate != null && windowstate.getAttrs() != null && (0x80000000 & windowstate.getAttrs().flags) != 0)
            return 0L;
        if (flag1) goto _L4; else goto _L3
_L3:
        boolean flag3;
        flag3 = mHomeLongPressed;
        mHomePressed = false;
        mHomeLongPressed = false;
        if (flag3) goto _L4; else goto _L5
_L5:
        if (mLongPressOnHomeBehavior != 2)
            break MISSING_BLOCK_LABEL_318;
        IStatusBarService istatusbarservice1 = getStatusBarService();
        if (istatusbarservice1 != null)
            try
            {
                istatusbarservice1.cancelPreloadRecentApps();
            }
            catch (RemoteException remoteexception2)
            {
                Slog.e("WindowManager", "RemoteException when showing recent apps", remoteexception2);
                mStatusBarService = null;
            }
        mHomePressed = false;
        if (flag2) goto _L7; else goto _L6
_L6:
        boolean flag4;
        ITelephony itelephony;
        boolean flag5;
        try
        {
            itelephony = getTelephonyService();
        }
        catch (RemoteException remoteexception1)
        {
            Log.w("WindowManager", "RemoteException from getPhoneInterface()", remoteexception1);
            flag4 = false;
            continue; /* Loop/switch isn't completed */
        }
        flag4 = false;
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_354;
        flag5 = itelephony.isRinging();
        flag4 = flag5;
_L25:
        if (flag4)
        {
            Log.i("WindowManager", "Ignoring HOME; there's a ringing incoming call.");
        } else
        {
            if (mAppLaunchTimeEnabled)
                Slog.i("WindowManager", "[AppLaunch] Home key pressed");
            launchHomeFromHotKey();
        }
_L8:
        return -1L;
_L7:
        Log.i("WindowManager", "Ignoring HOME; event canceled.");
        if (true) goto _L8; else goto _L4
_L4:
        android.view.WindowManager.LayoutParams layoutparams;
        if (windowstate != null)
            layoutparams = windowstate.getAttrs();
        else
            layoutparams = null;
        if (layoutparams != null)
        {
            int k1 = layoutparams.type;
            if (k1 == 2004 || k1 == 2009)
                return 0L;
            int l1 = WINDOW_TYPES_WHERE_HOME_DOESNT_WORK.length;
            for (int i2 = 0; i2 < l1; i2++)
                if (k1 == WINDOW_TYPES_WHERE_HOME_DOESNT_WORK[i2])
                    return -1L;

        }
        if (!flag1) goto _L10; else goto _L9
_L9:
        if (mHomePressed || mLongPressOnHomeBehavior != 2)
            break MISSING_BLOCK_LABEL_570;
        IStatusBarService istatusbarservice = getStatusBarService();
        if (istatusbarservice != null)
            try
            {
                istatusbarservice.preloadRecentApps();
            }
            catch (RemoteException remoteexception)
            {
                Slog.e("WindowManager", "RemoteException when preloading recent apps", remoteexception);
                mStatusBarService = null;
            }
        if (k != 0) goto _L12; else goto _L11
_L11:
        mHomePressed = true;
_L10:
        return -1L;
_L12:
        if ((0x80 & keyevent.getFlags()) != 0 && !flag)
            handleLongPressOnHome();
        if (true) goto _L10; else goto _L2
_L2:
        if (j == 82)
        {
            if (flag1 && k == 0 && mEnableShiftMenuBugReports && (l & 1) == 1)
            {
                Intent intent5 = new Intent("android.intent.action.BUG_REPORT");
                mContext.sendOrderedBroadcastAsUser(intent5, UserHandle.CURRENT, null, null, null, 0, null, null);
                return -1L;
            }
            break MISSING_BLOCK_LABEL_966;
        }
        if (j != 84)
            break MISSING_BLOCK_LABEL_744;
        if (!flag1) goto _L14; else goto _L13
_L13:
        if (k == 0)
        {
            mSearchKeyShortcutPending = true;
            mConsumeSearchKeyUp = false;
        }
_L16:
        return 0L;
_L14:
        mSearchKeyShortcutPending = false;
        if (!mConsumeSearchKeyUp) goto _L16; else goto _L15
_L15:
        mConsumeSearchKeyUp = false;
        return -1L;
        if (j == 187)
        {
            if (flag1 && k == 0 && !flag)
                showOrHideRecentAppsDialog(0);
            return -1L;
        }
        if (j == 4)
        {
            while (!flag1 || k == 0 || (0x80 & keyevent.getFlags()) == 0) 
                return 0L;
            Log.e("back back ", "long long long");
            Intent intent4 = new Intent();
            intent4.setAction("SLIDER_OPEN_OR_CLOSE");
            mContext.sendBroadcast(intent4);
            return -1L;
        }
        if (j != 219) goto _L18; else goto _L17
_L17:
        if (!flag1) goto _L20; else goto _L19
_L19:
        if (k != 0) goto _L22; else goto _L21
_L21:
        mAssistKeyLongPressed = false;
_L23:
        return -1L;
_L22:
        if (k == 1)
        {
            mAssistKeyLongPressed = true;
            if (!flag)
                launchAssistLongPressAction();
        }
        continue; /* Loop/switch isn't completed */
_L20:
        if (mAssistKeyLongPressed)
            mAssistKeyLongPressed = false;
        else
        if (!flag)
            launchAssistAction();
        if (true) goto _L23; else goto _L18
_L18:
        if (j == 249 && !flag1)
        {
            Log.i("WindowManager", "send sos......");
            Intent intent3 = new Intent("android.intent.action.CALL_SOS");
            mContext.sendBroadcast(intent3);
        }
        if (mSearchKeyShortcutPending)
        {
            KeyCharacterMap keycharactermap1 = keyevent.getKeyCharacterMap();
            if (keycharactermap1.isPrintingKey(j))
            {
                mConsumeSearchKeyUp = true;
                mSearchKeyShortcutPending = false;
                if (flag1 && k == 0 && !flag)
                {
                    Intent intent2 = mShortcutManager.getIntent(keycharactermap1, j, l);
                    if (intent2 != null)
                    {
                        intent2.addFlags(0x10000000);
                        try
                        {
                            mContext.startActivity(intent2);
                        }
                        catch (ActivityNotFoundException activitynotfoundexception2)
                        {
                            Slog.w("WindowManager", (new StringBuilder()).append("Dropping shortcut key combination because the activity to which it is registered was not found: SEARCH+").append(KeyEvent.keyCodeToString(j)).toString(), activitynotfoundexception2);
                        }
                    } else
                    {
                        Slog.i("WindowManager", (new StringBuilder()).append("Dropping unregistered shortcut key combination: SEARCH+").append(KeyEvent.keyCodeToString(j)).toString());
                    }
                }
                return -1L;
            }
        }
        if (flag1 && k == 0 && !flag && (0x10000 & l) != 0)
        {
            KeyCharacterMap keycharactermap = keyevent.getKeyCharacterMap();
            if (keycharactermap.isPrintingKey(j))
            {
                Intent intent1 = mShortcutManager.getIntent(keycharactermap, j, 0xfff8ffff & l);
                if (intent1 != null)
                {
                    intent1.addFlags(0x10000000);
                    try
                    {
                        mContext.startActivity(intent1);
                    }
                    catch (ActivityNotFoundException activitynotfoundexception1)
                    {
                        Slog.w("WindowManager", (new StringBuilder()).append("Dropping shortcut key combination because the activity to which it is registered was not found: META+").append(KeyEvent.keyCodeToString(j)).toString(), activitynotfoundexception1);
                    }
                    return -1L;
                }
            }
        }
        if (flag1 && k == 0 && !flag)
        {
            String s = (String)sApplicationLaunchKeyCategories.get(j);
            if (s != null)
            {
                Intent intent = Intent.makeMainSelectorActivity("android.intent.action.MAIN", s);
                intent.setFlags(0x10000000);
                try
                {
                    mContext.startActivity(intent);
                }
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    Slog.w("WindowManager", (new StringBuilder()).append("Dropping application launch key because the activity to which it is registered was not found: keyCode=").append(j).append(", category=").append(s).toString(), activitynotfoundexception);
                }
                return -1L;
            }
        }
        if (flag1 && k == 0 && j == 61)
        {
            if (mRecentAppsDialogHeldModifiers == 0 && !flag)
            {
                int j1 = 0xffffff3e & keyevent.getModifiers();
                if (KeyEvent.metaStateHasModifiers(j1, 2) || KeyEvent.metaStateHasModifiers(j1, 0x10000))
                {
                    mRecentAppsDialogHeldModifiers = j1;
                    showOrHideRecentAppsDialog(1);
                    return -1L;
                }
            }
        } else
        if (!flag1 && mRecentAppsDialogHeldModifiers != 0 && (l & mRecentAppsDialogHeldModifiers) == 0)
        {
            mRecentAppsDialogHeldModifiers = 0;
            byte byte1;
            if (flag)
                byte1 = 2;
            else
                byte1 = 3;
            showOrHideRecentAppsDialog(byte1);
        }
        if (flag1 && k == 0 && (j == 204 || j == 62 && (l & 0x7000) != 0))
        {
            byte byte0;
            if ((l & 0xc1) != 0)
                byte0 = -1;
            else
                byte0 = 1;
            mWindowManagerFuncs.switchKeyboardLayout(keyevent.getDeviceId(), byte0);
            return -1L;
        }
        if (mLanguageSwitchKeyPressed && !flag1 && (j == 204 || j == 62))
        {
            mLanguageSwitchKeyPressed = false;
            return -1L;
        }
        return 0L;
        if (true) goto _L25; else goto _L24
_L24:
    }

    public long interceptKeyBeforeDispatching_Custom(KeyEvent keyevent)
    {
        int i = keyevent.getKeyCode();
        boolean flag;
        if (keyevent.getAction() == 0)
            flag = true;
        else
            flag = false;
        int j = keyevent.getRepeatCount();
        if (i == 4 && !flag)
            mHandler.removeCallbacks(mBackLongPress);
        else
        if (i == 4 && android.provider.Settings.System.getInt(mContext.getContentResolver(), "kill_app_longpress_back", 0) == 1 && flag && j == 0)
            mHandler.postDelayed(mBackLongPress, 500L);
        return 0L;
    }

    public int interceptKeyBeforeQueueing(KeyEvent keyevent, int i, boolean flag)
    {
        if (mSystemBooted) goto _L2; else goto _L1
_L1:
        int k = 0;
_L19:
        return k;
_L2:
        if (26 == keyevent.getKeyCode() && mKeyguardMediator.isAlarmUnlockScreen())
            return 0;
        synchronized (mKeyDispatchLock)
        {
            if (1 != mKeyDispatcMode)
                break MISSING_BLOCK_LABEL_64;
        }
        return 0;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        obj;
        JVM INSTR monitorexit ;
        boolean flag1;
        boolean flag2;
        int j;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        ITelephony itelephony4;
        if (keyevent.getAction() == 0)
            flag1 = true;
        else
            flag1 = false;
        flag2 = keyevent.isCanceled();
        j = keyevent.getKeyCode();
        if ((0x1000000 & i) != 0)
            flag3 = true;
        else
            flag3 = false;
        if (mKeyguardMediator == null)
            flag4 = false;
        else
        if (flag)
            flag4 = mKeyguardMediator.isShowingAndNotHidden();
        else
            flag4 = mKeyguardMediator.isShowing();
        if (j == 26)
            i |= 1;
        if ((i & 3) != 0)
            flag5 = true;
        else
            flag5 = false;
        Log.d("WindowManager", (new StringBuilder()).append("interceptKeyTq keycode=").append(j).append(" screenIsOn=").append(flag).append(" keyguardActive=").append(flag4).append(" policyFlags = #").append(Integer.toHexString(i)).append(" down =").append(flag1).append(" canceled = ").append(flag2).append(" isWakeKey=").append(flag5).toString());
        if (flag1 && (0x100 & i) != 0 && keyevent.getRepeatCount() == 0)
            performHapticFeedbackLw(null, 1, false);
        if (flag && !mHeadless || flag3 && !flag5)
        {
            k = 1;
        } else
        {
            k = 0;
            if (flag1)
            {
                k = 0;
                if (flag5)
                {
                    boolean flag6 = isWakeKeyWhenScreenOff(j);
                    k = 0;
                    if (flag6)
                        if (flag4)
                        {
                            mKeyguardMediator.onWakeKeyWhenKeyguardShowingTq(j);
                            k = 0;
                        } else
                        {
                            k = 0 | 2;
                        }
                }
            }
        }
        j;
        JVM INSTR lookupswitch 17: default 424
    //                   5: 427
    //                   6: 871
    //                   24: 580
    //                   25: 580
    //                   26: 997
    //                   79: 1291
    //                   85: 1262
    //                   86: 1291
    //                   87: 1291
    //                   88: 1291
    //                   89: 1291
    //                   90: 1291
    //                   91: 1291
    //                   126: 1262
    //                   127: 1262
    //                   130: 1291
    //                   164: 580;
           goto _L3 _L4 _L5 _L6 _L6 _L7 _L8 _L9 _L8 _L8 _L8 _L8 _L8 _L8 _L9 _L9 _L8 _L6
_L8:
        break; /* Loop/switch isn't completed */
_L3:
        return k;
_L4:
        if (!flag1)
            break; /* Loop/switch isn't completed */
        itelephony4 = getTelephonyService();
        if (itelephony4 == null)
            break; /* Loop/switch isn't completed */
        Message message;
        ITelephony itelephony;
        RemoteException remoteexception;
        boolean flag7;
        int l;
        boolean flag8;
        ITelephony itelephony1;
        boolean flag9;
        boolean flag10;
        RemoteException remoteexception1;
        int i1;
        boolean flag11;
        boolean flag12;
        int j1;
        ITelephony itelephony2;
        boolean flag13;
        boolean flag14;
        RemoteException remoteexception2;
        boolean flag15;
        ITelephony itelephony3;
        RemoteException remoteexception3;
        try
        {
            if (!itelephony4.isRinging())
                break; /* Loop/switch isn't completed */
            Log.i("WindowManager", "interceptKeyBeforeQueueing: CALL key-down while ringing: Answer the call!");
            itelephony4.answerRingingCall();
        }
        catch (RemoteException remoteexception4)
        {
            Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception4);
            return k;
        }
        return k & -2;
_L6:
        if (j == 25)
        {
            if (flag1)
            {
                if (flag && !mVolumeDownKeyTriggered && (0x400 & keyevent.getFlags()) == 0)
                {
                    mVolumeDownKeyTriggered = true;
                    mVolumeDownKeyTime = keyevent.getDownTime();
                    mVolumeDownKeyConsumedByScreenshotChord = false;
                    cancelPendingPowerKeyAction();
                    interceptScreenshotChord();
                }
            } else
            {
                mVolumeDownKeyTriggered = false;
                cancelPendingScreenshotChordAction();
            }
        } else
        if (j == 24)
            if (flag1)
            {
                if (flag && !mVolumeUpKeyTriggered && (0x400 & keyevent.getFlags()) == 0)
                {
                    mVolumeUpKeyTriggered = true;
                    cancelPendingPowerKeyAction();
                    cancelPendingScreenshotChordAction();
                }
            } else
            {
                mVolumeUpKeyTriggered = false;
                cancelPendingScreenshotChordAction();
            }
        if (!flag1) goto _L11; else goto _L10
_L10:
        itelephony3 = getTelephonyService();
        if (itelephony3 == null) goto _L11; else goto _L12
_L12:
        if (!itelephony3.isRinging()) goto _L14; else goto _L13
_L13:
        Log.i("WindowManager", "interceptKeyBeforeQueueing: VOLUME key-down while ringing: Silence ringer!");
        itelephony3.silenceRinger();
        return k & -2;
_L14:
        if (!itelephony3.isOffhook() || (k & 1) != 0) goto _L11; else goto _L15
_L15:
        if (!getAudioService().isBluetoothScoOn()) goto _L17; else goto _L16
_L16:
        handleVolumeKey(6, j);
        return k;
        remoteexception3;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception3);
_L11:
        if (isMusicActive() && (k & 1) == 0)
        {
            HandleMusicVol(keyevent, flag);
            return k;
        }
        continue; /* Loop/switch isn't completed */
_L17:
        handleVolumeKey(0, j);
        return k;
        if (!isFmActive() || (k & 1) != 0) goto _L19; else goto _L18
_L18:
        handleVolumeKey(10, j);
        return k;
_L5:
        k &= -2;
        if (!flag1)
            continue; /* Loop/switch isn't completed */
        itelephony2 = getTelephonyService();
        flag13 = false;
        if (itelephony2 == null)
            break MISSING_BLOCK_LABEL_909;
        flag15 = itelephony2.endCall();
        flag13 = flag15;
_L20:
        if (!flag || flag13)
            flag14 = true;
        else
            flag14 = false;
        interceptPowerKeyDown(flag14);
        return k;
        remoteexception2;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception2);
        flag13 = false;
          goto _L20
        if (!interceptPowerKeyUp(flag2) || (1 & mEndcallBehavior) != 0 && goHome() || (2 & mEndcallBehavior) == 0) goto _L19; else goto _L21
_L21:
        return 4 | k & -3;
_L7:
        l = k & -2;
        if (!flag1) goto _L23; else goto _L22
_L22:
        if (flag && !mPowerKeyTriggered && (0x400 & keyevent.getFlags()) == 0)
        {
            mPowerKeyTriggered = true;
            mPowerKeyTime = keyevent.getDownTime();
            interceptScreenshotChord();
        }
        itelephony1 = getTelephonyService();
        flag9 = false;
        if (itelephony1 == null) goto _L25; else goto _L24
_L24:
        if (!itelephony1.isRinging()) goto _L27; else goto _L26
_L26:
        itelephony1.silenceRinger();
_L25:
        if (!flag || flag9 || mVolumeDownKeyTriggered || mVolumeUpKeyTriggered)
            flag10 = true;
        else
            flag10 = false;
        interceptPowerKeyDown(flag10);
        return l;
_L27:
        if (flag) goto _L29; else goto _L28
_L28:
        j1 = mScreenOffReason;
        flag9 = false;
        if (j1 != 4) goto _L25; else goto _L29
_L29:
        i1 = 2 & mIncallPowerBehavior;
        flag9 = false;
        if (i1 == 0) goto _L25; else goto _L30
_L30:
        flag11 = itelephony1.isOffhook();
        flag9 = false;
        if (!flag11) goto _L25; else goto _L31
_L31:
        flag12 = itelephony1.endCall();
        flag9 = flag12;
          goto _L25
        remoteexception1;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception1);
        flag9 = false;
          goto _L25
_L23:
        mPowerKeyTriggered = false;
        cancelPendingScreenshotChordAction();
        if (flag2 || mPendingPowerKeyUpCanceled)
            flag8 = true;
        else
            flag8 = false;
        if (interceptPowerKeyUp(flag8))
            l = 4 | l & -3;
        mPendingPowerKeyUpCanceled = false;
        return l;
_L9:
        if (!flag1)
            break; /* Loop/switch isn't completed */
        itelephony = getTelephonyService();
        if (itelephony == null)
            break; /* Loop/switch isn't completed */
        flag7 = itelephony.isIdle();
        if (!flag7) goto _L19; else goto _L32
_L32:
        if ((k & 1) == 0)
        {
            mBroadcastWakeLock.acquire();
            message = mHandler.obtainMessage(3, new KeyEvent(keyevent));
            message.setAsynchronous(true);
            message.sendToTarget();
            return k;
        }
        break; /* Loop/switch isn't completed */
        remoteexception;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception);
        if (true) goto _L32; else goto _L33
_L33:
        if (true) goto _L19; else goto _L34
_L34:
    }

    public int interceptMotionBeforeQueueingWhenScreenOff(int i)
    {
label0:
        {
            boolean flag;
            if ((i & 3) != 0)
                flag = true;
            else
                flag = false;
            if (flag)
            {
                if (mKeyguardMediator == null || !mKeyguardMediator.isShowing())
                    break label0;
                mKeyguardMediator.onWakeMotionWhenKeyguardShowingTq();
            }
            return 0;
        }
        return 0 | 2;
    }

    boolean isDeviceProvisioned()
    {
        int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    boolean isFmActive()
    {
        AudioManager audiomanager = (AudioManager)mContext.getSystemService("audio");
        if (audiomanager == null)
        {
            Log.w("WindowManager", "isFmActive: couldn't get AudioManager reference");
            return false;
        } else
        {
            return audiomanager.isFmActive();
        }
    }

    public boolean isKeyguardLocked()
    {
        return keyguardOn();
    }

    public boolean isKeyguardSecure()
    {
        if (mKeyguardMediator == null)
            return false;
        else
            return mKeyguardMediator.isSecure();
    }

    boolean isMusicActive()
    {
        AudioManager audiomanager = (AudioManager)mContext.getSystemService("audio");
        if (audiomanager == null)
        {
            Log.w("WindowManager", "isMusicActive: couldn't get AudioManager reference");
            return false;
        } else
        {
            return audiomanager.isMusicActive();
        }
    }

    public boolean isScreenOnEarly()
    {
        return mScreenOnEarly;
    }

    public boolean isScreenOnFully()
    {
        return mScreenOnFully;
    }

    public void keepScreenOnStartedLw()
    {
    }

    public void keepScreenOnStoppedLw()
    {
        if (mKeyguardMediator != null && !mKeyguardMediator.isShowingAndNotHidden())
        {
            long l = SystemClock.uptimeMillis();
            mPowerManager.userActivity(l, false);
        }
    }

    boolean keyguardOn()
    {
        return keyguardIsShowingTq() || inKeyguardRestrictedKeyInputMode();
    }

    void launchHomeFromHotKey()
    {
        if (mKeyguardMediator != null && mKeyguardMediator.isShowingAndNotHidden())
            return;
        if (!mHideLockScreen && mKeyguardMediator.isInputRestricted())
        {
            mKeyguardMediator.verifyUnlock(new android.view.WindowManagerPolicy.OnKeyguardExitResult() {

                final PhoneWindowManager this$0;

                public void onKeyguardExitResult(boolean flag)
                {
                    if (flag)
                    {
                        try
                        {
                            ActivityManagerNative.getDefault().stopAppSwitches();
                        }
                        catch (RemoteException remoteexception1) { }
                        sendCloseSystemWindows("homekey");
                        startDockOrHome();
                    }
                }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
            }
);
            return;
        }
        try
        {
            ActivityManagerNative.getDefault().stopAppSwitches();
        }
        catch (RemoteException remoteexception) { }
        sendCloseSystemWindows("homekey");
        startDockOrHome();
    }

    public void layoutWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams, android.view.WindowManagerPolicy.WindowState windowstate1)
    {
        if (windowstate != mStatusBar && windowstate != mNavigationBar)
        {
            boolean flag = windowstate.isDefaultDisplay();
            boolean flag1;
            if (flag && windowstate == mLastInputMethodTargetWindow && mLastInputMethodWindow != null)
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
            {
                if (DEBUG_LAYOUT)
                    Slog.i("WindowManager", "Offset ime target window by the last ime window state");
                offsetInputMethodWindowLw(mLastInputMethodWindow);
            }
            int i = layoutparams.flags;
            int j = layoutparams.softInputMode;
            int k = windowstate.getSystemUiVisibility();
            Rect rect = mTmpParentFrame;
            Rect rect1 = mTmpDisplayFrame;
            Rect rect2 = mTmpContentFrame;
            Rect rect3 = mTmpVisibleFrame;
            boolean flag2;
            if (flag && mHasNavigationBar && mNavigationBar != null && mNavigationBar.isVisibleLw())
                flag2 = true;
            else
                flag2 = false;
            int l = j & 0xf0;
            if (!flag)
            {
                if (windowstate1 != null)
                {
                    setAttachedWindowFrames(windowstate, i, l, windowstate1, true, rect, rect1, rect2, rect3);
                } else
                {
                    int i14 = mUnrestrictedScreenLeft;
                    rect2.left = i14;
                    rect1.left = i14;
                    rect.left = i14;
                    int j14 = mUnrestrictedScreenTop;
                    rect2.top = j14;
                    rect1.top = j14;
                    rect.top = j14;
                    int k14 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect2.right = k14;
                    rect1.right = k14;
                    rect.right = k14;
                    int l14 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect2.bottom = l14;
                    rect1.bottom = l14;
                    rect.bottom = l14;
                }
            } else
            if (layoutparams.type == 2011)
            {
                int i13 = mDockLeft;
                rect3.left = i13;
                rect2.left = i13;
                rect1.left = i13;
                rect.left = i13;
                int j13 = mDockTop;
                rect3.top = j13;
                rect2.top = j13;
                rect1.top = j13;
                rect.top = j13;
                int k13 = mDockRight;
                rect3.right = k13;
                rect2.right = k13;
                rect1.right = k13;
                rect.right = k13;
                int l13 = mDockBottom;
                rect3.bottom = l13;
                rect2.bottom = l13;
                rect1.bottom = l13;
                rect.bottom = l13;
                layoutparams.gravity = 80;
                mDockLayer = windowstate.getSurfaceLayer();
            } else
            if ((0x10500 & i) == 0x10100 && (k & 4) == 0)
            {
                if (DEBUG_LAYOUT)
                    Log.v("WindowManager", (new StringBuilder()).append("layoutWindowLw(").append(layoutparams.getTitle()).append("): IN_SCREEN, INSET_DECOR, !FULLSCREEN, sim = #").append(Integer.toHexString(l)).toString());
                if (windowstate1 != null)
                {
                    setAttachedWindowFrames(windowstate, i, l, windowstate1, true, rect, rect1, rect2, rect3);
                } else
                {
                    if (layoutparams.type != 2014 && layoutparams.type != 2017)
                    {
                        if (mCanHideNavigationBar && (k & 0x200) != 0 && layoutparams.type >= 1 && layoutparams.type <= 1999)
                        {
                            int i12 = mUnrestrictedScreenLeft;
                            rect1.left = i12;
                            rect.left = i12;
                            int j12 = mUnrestrictedScreenTop;
                            rect1.top = j12;
                            rect.top = j12;
                            int k12 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                            rect1.right = k12;
                            rect.right = k12;
                            int l12 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                            rect1.bottom = l12;
                            rect.bottom = l12;
                        } else
                        {
                            int i11 = mRestrictedScreenLeft;
                            rect1.left = i11;
                            rect.left = i11;
                            int j11 = mRestrictedScreenTop;
                            rect1.top = j11;
                            rect.top = j11;
                            int k11 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                            rect1.right = k11;
                            rect.right = k11;
                            int l11 = mRestrictedScreenTop + mRestrictedScreenHeight;
                            rect1.bottom = l11;
                            rect.bottom = l11;
                        }
                    } else
                    {
                        int i10;
                        if (flag2)
                            i10 = mDockLeft;
                        else
                            i10 = mUnrestrictedScreenLeft;
                        rect1.left = i10;
                        rect.left = i10;
                        int j10 = mUnrestrictedScreenTop;
                        rect1.top = j10;
                        rect.top = j10;
                        int k10;
                        if (flag2)
                            k10 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                        else
                            k10 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                        rect1.right = k10;
                        rect.right = k10;
                        int l10;
                        if (flag2)
                            l10 = mRestrictedScreenTop + mRestrictedScreenHeight;
                        else
                            l10 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                        rect1.bottom = l10;
                        rect.bottom = l10;
                        if (DEBUG_LAYOUT)
                        {
                            Object aobj3[] = new Object[4];
                            aobj3[0] = Integer.valueOf(rect.left);
                            aobj3[1] = Integer.valueOf(rect.top);
                            aobj3[2] = Integer.valueOf(rect.right);
                            aobj3[3] = Integer.valueOf(rect.bottom);
                            Log.v("WindowManager", String.format("Laying out status bar window: (%d,%d - %d,%d)", aobj3));
                        }
                    }
                    if (l != 16)
                    {
                        rect2.left = mDockLeft;
                        rect2.top = mDockTop;
                        rect2.right = mDockRight;
                        rect2.bottom = mDockBottom;
                    } else
                    {
                        rect2.left = mContentLeft;
                        rect2.top = mContentTop;
                        rect2.right = mContentRight;
                        rect2.bottom = mContentBottom;
                    }
                    applyStableConstraints(k, i, rect2);
                    if (l != 48)
                    {
                        rect3.left = mCurLeft;
                        rect3.top = mCurTop;
                        rect3.right = mCurRight;
                        rect3.bottom = mCurBottom;
                    } else
                    {
                        rect3.set(rect2);
                    }
                    if (mfindingTopFullscreenOpaque && !mHasSystemNavBar && !mLayoutDisableStatusBar)
                    {
                        if (rect2.top < mUnrestrictedScreenTop + mStatusBarHeight)
                            rect2.top = mUnrestrictedScreenTop + mStatusBarHeight;
                        if (rect3.top < mUnrestrictedScreenTop + mStatusBarHeight)
                            rect3.top = mUnrestrictedScreenTop + mStatusBarHeight;
                    }
                }
            } else
            if ((i & 0x100) == 0 && (k & 0x600) == 0)
            {
                if (windowstate1 != null)
                {
                    if (DEBUG_LAYOUT)
                        Log.v("WindowManager", (new StringBuilder()).append("layoutWindowLw(").append(layoutparams.getTitle()).append("): attached to ").append(windowstate1).toString());
                    setAttachedWindowFrames(windowstate, i, l, windowstate1, false, rect, rect1, rect2, rect3);
                } else
                {
                    if (DEBUG_LAYOUT)
                        Log.v("WindowManager", (new StringBuilder()).append("layoutWindowLw(").append(layoutparams.getTitle()).append("): normal window").toString());
                    if (layoutparams.type == 2014)
                    {
                        int i9 = mRestrictedScreenLeft;
                        rect2.left = i9;
                        rect1.left = i9;
                        rect.left = i9;
                        int j9 = mRestrictedScreenTop;
                        rect2.top = j9;
                        rect1.top = j9;
                        rect.top = j9;
                        int k9 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                        rect2.right = k9;
                        rect1.right = k9;
                        rect.right = k9;
                        int l9 = mRestrictedScreenTop + mRestrictedScreenHeight;
                        rect2.bottom = l9;
                        rect1.bottom = l9;
                        rect.bottom = l9;
                    } else
                    {
                        rect.left = mContentLeft;
                        rect.top = mContentTop;
                        rect.right = mContentRight;
                        rect.bottom = mContentBottom;
                        if (l != 16)
                        {
                            int i8 = mDockLeft;
                            rect2.left = i8;
                            rect1.left = i8;
                            int j8 = mDockTop;
                            rect2.top = j8;
                            rect1.top = j8;
                            int k8 = mDockRight;
                            rect2.right = k8;
                            rect1.right = k8;
                            int l8 = mDockBottom;
                            rect2.bottom = l8;
                            rect1.bottom = l8;
                        } else
                        {
                            int i7 = mContentLeft;
                            rect2.left = i7;
                            rect1.left = i7;
                            int j7 = mContentTop;
                            rect2.top = j7;
                            rect1.top = j7;
                            int k7 = mContentRight;
                            rect2.right = k7;
                            rect1.right = k7;
                            int l7 = mContentBottom;
                            rect2.bottom = l7;
                            rect1.bottom = l7;
                        }
                        if (l != 48)
                        {
                            rect3.left = mCurLeft;
                            rect3.top = mCurTop;
                            rect3.right = mCurRight;
                            rect3.bottom = mCurBottom;
                        } else
                        {
                            rect3.set(rect2);
                        }
                    }
                }
            } else
            {
                if (DEBUG_LAYOUT)
                    Log.v("WindowManager", (new StringBuilder()).append("layoutWindowLw(").append(layoutparams.getTitle()).append("): IN_SCREEN").toString());
                if (layoutparams.type != 2014 && layoutparams.type != 2017)
                {
                    if (layoutparams.type != 2019 && layoutparams.type != 2024)
                    {
                        if ((layoutparams.type == 2015 || layoutparams.type == 2021) && (i & 0x400) != 0)
                        {
                            int i6 = mUnrestrictedScreenLeft;
                            rect1.left = i6;
                            rect.left = i6;
                            int j6 = mUnrestrictedScreenTop;
                            rect1.top = j6;
                            rect.top = j6;
                            int k6 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                            rect1.right = k6;
                            rect.right = k6;
                            int l6 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                            rect1.bottom = l6;
                            rect.bottom = l6;
                        } else
                        if (layoutparams.type != 2021 && layoutparams.type != 2025)
                        {
                            if (mCanHideNavigationBar && (k & 0x200) != 0 && layoutparams.type >= 1 && layoutparams.type <= 1999)
                            {
                                int i5 = mUnrestrictedScreenLeft;
                                rect2.left = i5;
                                rect1.left = i5;
                                rect.left = i5;
                                int j5 = mUnrestrictedScreenTop;
                                rect2.top = j5;
                                rect1.top = j5;
                                rect.top = j5;
                                int k5 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                                rect2.right = k5;
                                rect1.right = k5;
                                rect.right = k5;
                                int l5 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                                rect2.bottom = l5;
                                rect1.bottom = l5;
                                rect.bottom = l5;
                            } else
                            {
                                int i4 = mRestrictedScreenLeft;
                                rect2.left = i4;
                                rect1.left = i4;
                                rect.left = i4;
                                int j4 = mRestrictedScreenTop;
                                rect2.top = j4;
                                rect1.top = j4;
                                rect.top = j4;
                                int k4 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                                rect2.right = k4;
                                rect1.right = k4;
                                rect.right = k4;
                                int l4 = mRestrictedScreenTop + mRestrictedScreenHeight;
                                rect2.bottom = l4;
                                rect1.bottom = l4;
                                rect.bottom = l4;
                            }
                        } else
                        {
                            int i3 = mUnrestrictedScreenLeft;
                            rect2.left = i3;
                            rect1.left = i3;
                            rect.left = i3;
                            int j3 = mUnrestrictedScreenTop;
                            rect2.top = j3;
                            rect1.top = j3;
                            rect.top = j3;
                            int k3 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                            rect2.right = k3;
                            rect1.right = k3;
                            rect.right = k3;
                            int l3 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                            rect2.bottom = l3;
                            rect1.bottom = l3;
                            rect.bottom = l3;
                        }
                    } else
                    {
                        int i2 = mUnrestrictedScreenLeft;
                        rect1.left = i2;
                        rect.left = i2;
                        int j2 = mUnrestrictedScreenTop;
                        rect1.top = j2;
                        rect.top = j2;
                        int k2 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                        rect1.right = k2;
                        rect.right = k2;
                        int l2 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                        rect1.bottom = l2;
                        rect.bottom = l2;
                        if (DEBUG_LAYOUT)
                        {
                            Object aobj2[] = new Object[4];
                            aobj2[0] = Integer.valueOf(rect.left);
                            aobj2[1] = Integer.valueOf(rect.top);
                            aobj2[2] = Integer.valueOf(rect.right);
                            aobj2[3] = Integer.valueOf(rect.bottom);
                            Log.v("WindowManager", String.format("Laying out navigation bar window: (%d,%d - %d,%d)", aobj2));
                        }
                    }
                } else
                {
                    int i1;
                    if (flag2)
                        i1 = mDockLeft;
                    else
                        i1 = mUnrestrictedScreenLeft;
                    rect2.left = i1;
                    rect1.left = i1;
                    rect.left = i1;
                    int j1 = mUnrestrictedScreenTop;
                    rect2.top = j1;
                    rect1.top = j1;
                    rect.top = j1;
                    int k1;
                    if (flag2)
                        k1 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                    else
                        k1 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect2.right = k1;
                    rect1.right = k1;
                    rect.right = k1;
                    int l1;
                    if (flag2)
                        l1 = mRestrictedScreenTop + mRestrictedScreenHeight;
                    else
                        l1 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect2.bottom = l1;
                    rect1.bottom = l1;
                    rect.bottom = l1;
                    if (DEBUG_LAYOUT)
                    {
                        Object aobj1[] = new Object[4];
                        aobj1[0] = Integer.valueOf(rect.left);
                        aobj1[1] = Integer.valueOf(rect.top);
                        aobj1[2] = Integer.valueOf(rect.right);
                        aobj1[3] = Integer.valueOf(rect.bottom);
                        Log.v("WindowManager", String.format("Laying out IN_SCREEN status bar window: (%d,%d - %d,%d)", aobj1));
                    }
                }
                applyStableConstraints(k, i, rect2);
                if (l != 48)
                {
                    rect3.left = mCurLeft;
                    rect3.top = mCurTop;
                    rect3.right = mCurRight;
                    rect3.bottom = mCurBottom;
                } else
                {
                    rect3.set(rect2);
                }
                boolean flag3;
                if ((k & 0x100) != 0 && (i & 0x400) == 0)
                    flag3 = true;
                else
                    flag3 = false;
                if (mfindingTopFullscreenOpaque && !flag3 && !mHasSystemNavBar && !mLayoutDisableStatusBar)
                {
                    if (rect2.top > mRestrictedScreenTop)
                        rect2.top = mRestrictedScreenTop;
                    if (rect3.top > mRestrictedScreenTop)
                        rect3.top = mRestrictedScreenTop;
                }
            }
            if ((i & 0x200) != 0)
            {
                rect3.top = -10000;
                rect3.left = -10000;
                rect2.top = -10000;
                rect2.left = -10000;
                rect1.top = -10000;
                rect1.left = -10000;
                rect3.bottom = 10000;
                rect3.right = 10000;
                rect2.bottom = 10000;
                rect2.right = 10000;
                rect1.bottom = 10000;
                rect1.right = 10000;
            }
            if (DEBUG_LAYOUT)
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("Compute frame ").append(layoutparams.getTitle()).append(": sim=#").append(Integer.toHexString(j)).append(" attach=").append(windowstate1).append(" type=").append(layoutparams.type);
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                Log.v("WindowManager", stringbuilder.append(String.format(" flags=0x%08x", aobj)).append(" pf=").append(rect.toShortString()).append(" df=").append(rect1.toShortString()).append(" cf=").append(rect2.toShortString()).append(" vf=").append(rect3.toShortString()).toString());
            }
            windowstate.computeFrameLw(rect, rect1, rect2, rect3);
            if (layoutparams.type == 2011 && windowstate.isVisibleOrBehindKeyguardLw() && !windowstate.getGivenInsetsPendingLw())
            {
                setLastInputMethodWindowLw(null, null);
                offsetInputMethodWindowLw(windowstate);
            }
            if (mfindingTopFullscreenOpaque && windowstate.isVisibleLw() && layoutparams.type >= 1 && layoutparams.type <= 99 && layoutparams.x == 0 && layoutparams.y == 0 && layoutparams.width == -1 && layoutparams.height == -1)
            {
                mfindingTopFullscreenOpaque = false;
                return;
            }
        }
    }

    public void lockNow(Bundle bundle)
    {
        mContext.enforceCallingOrSelfPermission("android.permission.DEVICE_POWER", null);
        mHandler.removeCallbacks(mScreenLockTimeout);
        if (bundle != null)
            mScreenLockTimeout.setLockOptions(bundle);
        mHandler.post(mScreenLockTimeout);
    }

    boolean needSensorRunningLp()
    {
        return mCurrentAppOrientation == 4 || mCurrentAppOrientation == 10 || mCurrentAppOrientation == 7 || mCurrentAppOrientation == 6 || mCarDockEnablesAccelerometer && mDockMode == 2 || mDeskDockEnablesAccelerometer && (mDockMode == 1 || mDockMode == 3 || mDockMode == 4) || mUserRotationMode != 1;
    }

    public void notifyLidSwitchChanged(long l, boolean flag)
    {
        if (!mHeadless)
        {
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            if (i != mLidState)
            {
                mLidState = i;
                applyLidSwitchState();
                updateRotation(true);
                if (flag)
                    if (keyguardIsShowingTq())
                    {
                        mKeyguardMediator.onWakeKeyWhenKeyguardShowingTq(26);
                        return;
                    } else
                    {
                        mPowerManager.wakeUp(SystemClock.uptimeMillis());
                        return;
                    }
                if (!mLidControlsSleep)
                {
                    mPowerManager.userActivity(SystemClock.uptimeMillis(), false);
                    return;
                }
            }
        }
    }

    public boolean performHapticFeedbackLw(android.view.WindowManagerPolicy.WindowState windowstate, int i, boolean flag)
    {
label0:
        {
label1:
            {
                if (!mVibrator.hasVibrator())
                    break label0;
                boolean flag1;
                if (android.provider.Settings.System.getIntForUser(mContext.getContentResolver(), "haptic_feedback_enabled", 0, -2) == 0)
                    flag1 = true;
                else
                    flag1 = false;
                if (!flag && (flag1 || mKeyguardMediator.isShowingAndNotHidden()))
                    break label0;
                long al[];
                switch (i)
                {
                default:
                    break label1;

                case 10001: 
                    al = mSafeModeEnabledVibePattern;
                    break;

                case 10000: 
                    al = mSafeModeDisabledVibePattern;
                    break;

                case 3: // '\003'
                    al = mKeyboardTapVibePattern;
                    break;

                case 1: // '\001'
                    al = mVirtualKeyVibePattern;
                    break;

                case 0: // '\0'
                    al = mLongPressVibePattern;
                    break;
                }
                if (al.length == 1)
                    mVibrator.vibrate(al[0]);
                else
                    mVibrator.vibrate(al, -1);
                return true;
            }
            return false;
        }
        return false;
    }

    public int prepareAddWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams)
    {
        byte byte0;
label0:
        {
            byte0 = -7;
            switch (layoutparams.type)
            {
            default:
                break;

            case 2004: 
                if (mKeyguard == null)
                {
                    mKeyguard = windowstate;
                    break;
                }
                break label0;

            case 2017: 
                mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
                break;

            case 2014: 
                mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
                break;

            case 2024: 
                mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
                break;

            case 2019: 
                mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
                if (mNavigationBar == null || !mNavigationBar.isAlive())
                {
                    mNavigationBar = windowstate;
                    if (DEBUG_LAYOUT)
                        Log.i("WindowManager", (new StringBuilder()).append("NAVIGATION BAR: ").append(mNavigationBar).toString());
                    break;
                }
                break label0;

            case 2000: 
                mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
                if (mStatusBar != null && mStatusBar.isAlive())
                    break label0;
                mStatusBar = windowstate;
                break;
            }
            byte0 = 0;
        }
        return byte0;
    }

    void readLidState()
    {
        mLidState = mWindowManagerFuncs.getLidState();
    }

    public void removeStartingWindow(IBinder ibinder, View view)
    {
        if (view != null)
            ((WindowManager)mContext.getSystemService("window")).removeView(view);
    }

    public void removeWindowLw(android.view.WindowManagerPolicy.WindowState windowstate)
    {
        if (mStatusBar == windowstate)
        {
            mStatusBar = null;
        } else
        {
            if (mKeyguard == windowstate)
            {
                mKeyguard = null;
                return;
            }
            if (mNavigationBar == windowstate)
            {
                mNavigationBar = null;
                return;
            }
        }
    }

    public int rotationForOrientationLw(int i, int j)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        int k = mOrientationListener.getProposedRotation();
        if (k < 0)
            k = j;
        if (mLidState != 1 || mLidOpenRotation < 0) goto _L2; else goto _L1
_L1:
        int l = mLidOpenRotation;
_L6:
        if (DEBUG_ORIENTATION)
            Slog.v("WindowManager", (new StringBuilder()).append("rotationForOrientationLw(appReqQrientation = ").append(i).append(", lastOrientation = ").append(j).append(", sensorRotation = ").append(k).append(", UserRotation = ").append(mUserRotation).append(", LidState = ").append(mLidState).append(", DockMode = ").append(mDockMode).append(", DeskDockEnable = ").append(mDeskDockEnablesAccelerometer).append(", CarDockEnable = ").append(mCarDockEnablesAccelerometer).append(", HdmiPlugged = ").append(mHdmiPlugged).append(", Accelerometer = ").append(mAccelerometerDefault).append(", AllowAllRotations = ").append(mAllowAllRotations).append(")").toString());
          goto _L3
_L14:
        if (l < 0) goto _L5; else goto _L4
_L4:
        return l;
_L2:
        if (mDockMode != 2 || !mCarDockEnablesAccelerometer && mCarDockRotation < 0)
            break MISSING_BLOCK_LABEL_266;
        if (!mCarDockEnablesAccelerometer)
            break MISSING_BLOCK_LABEL_257;
        l = k;
          goto _L6
        l = mCarDockRotation;
          goto _L6
        if (mDockMode != 1 && mDockMode != 3 && mDockMode != 4 || !mDeskDockEnablesAccelerometer && mDeskDockRotation < 0)
            break MISSING_BLOCK_LABEL_327;
        if (!mDeskDockEnablesAccelerometer)
            break MISSING_BLOCK_LABEL_318;
        l = k;
          goto _L6
        l = mDeskDockRotation;
          goto _L6
        if (!mHdmiPlugged || !mHdmiRotationLock) goto _L8; else goto _L7
_L7:
        l = mHdmiRotation;
          goto _L6
_L21:
        if (mAllowAllRotations >= 0)
            break MISSING_BLOCK_LABEL_402;
        Exception exception;
        int i1;
        int j1;
        int k1;
        int l1;
        int i2;
        int j2;
        int k2;
        if (mContext.getResources().getBoolean(0x111001d))
            k2 = 1;
        else
            k2 = 0;
        mAllowAllRotations = k2;
        if (k != 2) goto _L10; else goto _L9
_L9:
        if (mAllowAllRotations != 1 && i != 10) goto _L11; else goto _L10
_L22:
        if (mUserRotationMode != 1 || i == 5) goto _L13; else goto _L12
_L12:
        l = mUserRotation;
          goto _L6
_L16:
        if (!isAnyPortrait(l))
            break MISSING_BLOCK_LABEL_468;
        obj;
        JVM INSTR monitorexit ;
        return l;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        j2 = mPortraitRotation;
        obj;
        JVM INSTR monitorexit ;
        return j2;
_L15:
        if (!isLandscapeOrSeascape(l))
            break MISSING_BLOCK_LABEL_493;
        obj;
        JVM INSTR monitorexit ;
        return l;
        i2 = mLandscapeRotation;
        obj;
        JVM INSTR monitorexit ;
        return i2;
_L20:
        if (!isAnyPortrait(l))
            break MISSING_BLOCK_LABEL_518;
        obj;
        JVM INSTR monitorexit ;
        return l;
        l1 = mUpsideDownRotation;
        obj;
        JVM INSTR monitorexit ;
        return l1;
_L19:
        if (!isLandscapeOrSeascape(l))
            break MISSING_BLOCK_LABEL_543;
        obj;
        JVM INSTR monitorexit ;
        return l;
        k1 = mSeascapeRotation;
        obj;
        JVM INSTR monitorexit ;
        return k1;
_L17:
        if (!isLandscapeOrSeascape(l))
            break MISSING_BLOCK_LABEL_568;
        obj;
        JVM INSTR monitorexit ;
        return l;
        if (!isLandscapeOrSeascape(j))
            break MISSING_BLOCK_LABEL_580;
        obj;
        JVM INSTR monitorexit ;
        return j;
        j1 = mLandscapeRotation;
        obj;
        JVM INSTR monitorexit ;
        return j1;
_L18:
        if (!isAnyPortrait(l))
            break MISSING_BLOCK_LABEL_605;
        obj;
        JVM INSTR monitorexit ;
        return l;
        if (!isAnyPortrait(j))
            break MISSING_BLOCK_LABEL_617;
        obj;
        JVM INSTR monitorexit ;
        return j;
        i1 = mPortraitRotation;
        obj;
        JVM INSTR monitorexit ;
        return i1;
_L5:
        obj;
        JVM INSTR monitorexit ;
        return 0;
_L3:
        i;
        JVM INSTR tableswitch 0 9: default 211
    //                   0 479
    //                   1 447
    //                   2 211
    //                   3 211
    //                   4 211
    //                   5 211
    //                   6 554
    //                   7 591
    //                   8 529
    //                   9 504;
           goto _L14 _L15 _L16 _L14 _L14 _L14 _L14 _L17 _L18 _L19 _L20
_L8:
        if ((mUserRotationMode != 0 || i != 2 && i != -1) && i != 4 && i != 10 && i != 6 && i != 7) goto _L22; else goto _L21
_L10:
        l = k;
          goto _L6
_L11:
        l = j;
          goto _L6
_L13:
        l = -1;
          goto _L6
    }

    public boolean rotationHasCompatibleMetricsLw(int i, int j)
    {
        switch (i)
        {
        case 0: // '\0'
        case 6: // '\006'
        case 8: // '\b'
            return isLandscapeOrSeascape(j);

        case 1: // '\001'
        case 7: // '\007'
        case 9: // '\t'
            return isAnyPortrait(j);

        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
        default:
            return true;
        }
    }

    public void screenTurnedOff(int i)
    {
        EventLog.writeEvent(0x11170, 0);
        synchronized (mLock)
        {
            mScreenOnEarly = false;
            mScreenOnFully = false;
            mScreenOffReason = i;
        }
        if (mKeyguardMediator != null)
            mKeyguardMediator.onScreenTurnedOff(i);
        synchronized (mLock)
        {
            updateOrientationListenerLp();
            updateLockScreenTimeout();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public void screenTurningOn(android.view.WindowManagerPolicy.ScreenOnListener screenonlistener)
    {
        EventLog.writeEvent(0x11170, 1);
        synchronized (mLock)
        {
            mScreenOnEarly = true;
            updateOrientationListenerLp();
            updateLockScreenTimeout();
        }
        waitForKeyguard(screenonlistener);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int selectAnimationLw(android.view.WindowManagerPolicy.WindowState windowstate, int i)
    {
label0:
        {
label1:
            {
                if (windowstate == mStatusBar)
                {
                    if (i != 8194 && i != 8196)
                    {
                        if (i == 4097 || i == 4099)
                            return 0x10a001a;
                    } else
                    {
                        return 0x10a001b;
                    }
                } else
                if (windowstate == mNavigationBar)
                    if (mNavigationBarOnBottom)
                    {
                        if (i != 8194 && i != 8196)
                        {
                            if (i == 4097 || i == 4099)
                                return 0x10a0014;
                        } else
                        {
                            return 0x10a0015;
                        }
                    } else
                    {
                        if (i == 8194 || i == 8196)
                            break label0;
                        if (i == 4097 || i == 4099)
                            break label1;
                    }
                if (i == 5)
                {
                    if (windowstate.hasAppShownWindows())
                        return 0x10a0011;
                } else
                if (windowstate.getAttrs().type == 2023 && mDreamingLockscreen && i == 4097)
                    return -1;
                return 0;
            }
            return 0x10a0018;
        }
        return 0x10a0019;
    }

    void sendCloseSystemWindows()
    {
        sendCloseSystemWindows(mContext, null);
    }

    void sendCloseSystemWindows(String s)
    {
        sendCloseSystemWindows(mContext, s);
    }

    void setAttachedWindowFrames(android.view.WindowManagerPolicy.WindowState windowstate, int i, int j, android.view.WindowManagerPolicy.WindowState windowstate1, boolean flag, Rect rect, Rect rect1, 
            Rect rect2, Rect rect3)
    {
        if (windowstate.getSurfaceLayer() > mDockLayer && windowstate1.getSurfaceLayer() < mDockLayer)
        {
            int k = mDockLeft;
            rect3.left = k;
            rect2.left = k;
            rect1.left = k;
            int l = mDockTop;
            rect3.top = l;
            rect2.top = l;
            rect1.top = l;
            int i1 = mDockRight;
            rect3.right = i1;
            rect2.right = i1;
            rect1.right = i1;
            int j1 = mDockBottom;
            rect3.bottom = j1;
            rect2.bottom = j1;
            rect1.bottom = j1;
        } else
        {
            if (j != 16)
            {
                rect2.set(windowstate1.getDisplayFrameLw());
            } else
            {
                rect2.set(windowstate1.getContentFrameLw());
                if (windowstate1.getSurfaceLayer() < mDockLayer)
                {
                    if (rect2.left < mContentLeft)
                        rect2.left = mContentLeft;
                    if (rect2.top < mContentTop)
                        rect2.top = mContentTop;
                    if (rect2.right > mContentRight)
                        rect2.right = mContentRight;
                    if (rect2.bottom > mContentBottom)
                        rect2.bottom = mContentBottom;
                }
            }
            if (flag)
                rect2 = windowstate1.getDisplayFrameLw();
            rect1.set(rect2);
            rect3.set(windowstate1.getVisibleFrameLw());
        }
        if ((i & 0x100) == 0)
            rect1 = windowstate1.getFrameLw();
        rect.set(rect1);
    }

    public void setCurrentOrientationLw(int i)
    {
        synchronized (mLock)
        {
            if (i != mCurrentAppOrientation)
            {
                mCurrentAppOrientation = i;
                updateOrientationListenerLp();
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setCurrentUserLw(int i)
    {
        if (mKeyguardMediator != null)
            mKeyguardMediator.setCurrentUser(i);
        if (mStatusBarService != null)
            try
            {
                mStatusBarService.setCurrentUser(i);
            }
            catch (RemoteException remoteexception) { }
        setLastInputMethodWindowLw(null, null);
    }

    void setHdmiPlugged(boolean flag)
    {
        if (mHdmiPlugged != flag)
        {
            mHdmiPlugged = flag;
            updateRotation(true, true);
            Intent intent = new Intent("android.intent.action.HDMI_PLUGGED");
            intent.addFlags(0x8000000);
            intent.putExtra("state", flag);
            mContext.sendStickyBroadcastAsUser(intent, UserHandle.ALL);
        }
    }

    public void setInitialDisplaySize(Display display, int i, int j, int k)
    {
        mDisplay = display;
        int l;
        int i1;
        if (i > j)
        {
            l = j;
            i1 = i;
            mLandscapeRotation = 0;
            mSeascapeRotation = 2;
            if (mContext.getResources().getBoolean(0x111001e))
            {
                mPortraitRotation = 1;
                mUpsideDownRotation = 3;
            } else
            {
                mPortraitRotation = 3;
                mUpsideDownRotation = 1;
            }
        } else
        {
            l = i;
            i1 = j;
            mPortraitRotation = 0;
            mUpsideDownRotation = 2;
            if (mContext.getResources().getBoolean(0x111001e))
            {
                mLandscapeRotation = 3;
                mSeascapeRotation = 1;
            } else
            {
                mLandscapeRotation = 1;
                mSeascapeRotation = 3;
            }
        }
        mStatusBarHeight = mContext.getResources().getDimensionPixelSize(0x105000c);
        int ai[] = mNavigationBarHeightForRotation;
        int j1 = mPortraitRotation;
        int ai1[] = mNavigationBarHeightForRotation;
        int k1 = mUpsideDownRotation;
        int l1 = mContext.getResources().getDimensionPixelSize(0x105000d);
        ai1[k1] = l1;
        ai[j1] = l1;
        int ai2[] = mNavigationBarHeightForRotation;
        int i2 = mLandscapeRotation;
        int ai3[] = mNavigationBarHeightForRotation;
        int j2 = mSeascapeRotation;
        int k2 = mContext.getResources().getDimensionPixelSize(0x105000e);
        ai3[j2] = k2;
        ai2[i2] = k2;
        int ai4[] = mNavigationBarWidthForRotation;
        int l2 = mPortraitRotation;
        int ai5[] = mNavigationBarWidthForRotation;
        int i3 = mUpsideDownRotation;
        int ai6[] = mNavigationBarWidthForRotation;
        int j3 = mLandscapeRotation;
        int ai7[] = mNavigationBarWidthForRotation;
        int k3 = mSeascapeRotation;
        int l3 = mContext.getResources().getDimensionPixelSize(0x105000f);
        ai7[k3] = l3;
        ai6[j3] = l3;
        ai5[i3] = l3;
        ai4[l2] = l3;
        int i4 = (l * 160) / k;
        if (i4 < 600)
        {
            mHasSystemNavBar = false;
            mNavigationBarCanMove = true;
        } else
        if (i4 < 720)
        {
            mHasSystemNavBar = false;
            mNavigationBarCanMove = false;
        }
        if (!mHasSystemNavBar)
        {
            mHasNavigationBar = mContext.getResources().getBoolean(0x111003c);
            String s = SystemProperties.get("qemu.hw.mainkeys");
            if (!"".equals(s))
                if (s.equals("1"))
                    mHasNavigationBar = false;
                else
                if (s.equals("0"))
                    mHasNavigationBar = true;
        } else
        {
            mHasNavigationBar = false;
        }
        if (mHasSystemNavBar)
        {
            int j4 = (i1 * 160) / k;
            boolean flag;
            if ((16 * (i4 - (160 * mNavigationBarHeightForRotation[mLandscapeRotation]) / k)) / j4 < 9)
                flag = true;
            else
                flag = false;
            mCanHideNavigationBar = flag;
        } else
        if (mHasNavigationBar)
            mCanHideNavigationBar = true;
        else
            mCanHideNavigationBar = false;
        if ("portrait".equals(SystemProperties.get("persist.demo.hdmirotation")))
            mHdmiRotation = mPortraitRotation;
        else
            mHdmiRotation = mLandscapeRotation;
        mHdmiRotationLock = SystemProperties.getBoolean("persist.demo.hdmirotationlock", true);
    }

    public void setLastInputMethodWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManagerPolicy.WindowState windowstate1)
    {
        mLastInputMethodWindow = windowstate;
        mLastInputMethodTargetWindow = windowstate1;
    }

    public void setRotationLw(int i)
    {
        mOrientationListener.setCurrentRotation(i);
    }

    public void setSafeMode(boolean flag)
    {
        mSafeMode = flag;
        char c;
        if (flag)
            c = '\u2711';
        else
            c = '\u2710';
        performHapticFeedbackLw(null, c, true);
    }

    public void setUserRotationMode(int i, int j)
    {
        ContentResolver contentresolver = mContext.getContentResolver();
        if (i == 1)
        {
            android.provider.Settings.System.putIntForUser(contentresolver, "user_rotation", j, -2);
            android.provider.Settings.System.putIntForUser(contentresolver, "accelerometer_rotation", 0, -2);
            return;
        } else
        {
            android.provider.Settings.System.putIntForUser(contentresolver, "accelerometer_rotation", 1, -2);
            return;
        }
    }

    public void showAssistant()
    {
        mKeyguardMediator.showAssistant();
    }

    public void showBootMessage(final CharSequence msg, boolean flag)
    {
        if (mHeadless)
        {
            return;
        } else
        {
            mHandler.post(new Runnable() {

                final PhoneWindowManager this$0;
                final CharSequence val$msg;

                public void run()
                {
                    if (mBootMsgDialog == null)
                    {
                        mBootMsgDialog = new ProgressDialog(mContext) {

                            final _cls22 this$1;

                            public boolean dispatchGenericMotionEvent(MotionEvent motionevent)
                            {
                                return true;
                            }

                            public boolean dispatchKeyEvent(KeyEvent keyevent)
                            {
                                return true;
                            }

                            public boolean dispatchKeyShortcutEvent(KeyEvent keyevent)
                            {
                                return true;
                            }

                            public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
                            {
                                return true;
                            }

                            public boolean dispatchTouchEvent(MotionEvent motionevent)
                            {
                                return true;
                            }

                            public boolean dispatchTrackballEvent(MotionEvent motionevent)
                            {
                                return true;
                            }

            
            {
                this$1 = _cls22.this;
                super(context);
            }
                        }
;
                        mBootMsgDialog.setTitle(0x10403e7);
                        mBootMsgDialog.setProgressStyle(0);
                        mBootMsgDialog.setIndeterminate(true);
                        mBootMsgDialog.getWindow().setType(2021);
                        mBootMsgDialog.getWindow().addFlags(258);
                        mBootMsgDialog.getWindow().setDimAmount(1.0F);
                        android.view.WindowManager.LayoutParams layoutparams = mBootMsgDialog.getWindow().getAttributes();
                        layoutparams.screenOrientation = 5;
                        mBootMsgDialog.getWindow().setAttributes(layoutparams);
                        mBootMsgDialog.setCancelable(false);
                        mBootMsgDialog.show();
                    }
                    mBootMsgDialog.setMessage(msg);
                }

            
            {
                this$0 = PhoneWindowManager.this;
                msg = charsequence;
                super();
            }
            }
);
            return;
        }
    }

    void showGlobalActionsDialog()
    {
        if (mGlobalActions == null)
            mGlobalActions = new GlobalActions(mContext, mWindowManagerFuncs);
        boolean flag = keyguardIsShowingTq();
        mGlobalActions.showDialog(flag, isDeviceProvisioned());
        if (flag)
            mKeyguardMediator.userActivity();
    }

    void showOrHideRecentAppsDialog(final int behavior)
    {
        mHandler.post(new Runnable() {

            final PhoneWindowManager this$0;
            final int val$behavior;

            public void run()
            {
                if (mRecentAppsDialog == null)
                    mRecentAppsDialog = new RecentApplicationsDialog(mContext);
                if (mRecentAppsDialog.isShowing())
                {
                    switch (behavior)
                    {
                    case 1: // '\001'
                    default:
                        return;

                    case 0: // '\0'
                    case 2: // '\002'
                        mRecentAppsDialog.dismiss();
                        return;

                    case 3: // '\003'
                        mRecentAppsDialog.dismissAndSwitch();
                        break;
                    }
                    return;
                }
                switch (behavior)
                {
                default:
                    return;

                case 0: // '\0'
                    mRecentAppsDialog.show();
                    return;

                case 1: // '\001'
                    break;
                }
                try
                {
                    mWindowManager.setInTouchMode(false);
                }
                catch (RemoteException remoteexception) { }
                mRecentAppsDialog.show();
            }

            
            {
                this$0 = PhoneWindowManager.this;
                behavior = i;
                super();
            }
        }
);
    }

    void startDockOrHome()
    {
        mContext.startActivityAsUser(mHomeIntent, UserHandle.CURRENT);
    }

    public int subWindowTypeToLayerLw(int i)
    {
        switch (i)
        {
        case 1002: 
            return 2;

        case 1004: 
            return -1;

        case 1001: 
            return -2;

        case 1000: 
        case 1003: 
            return 1;
        }
        Log.e("WindowManager", (new StringBuilder()).append("Unknown sub-window type: ").append(i).toString());
        return 0;
    }

    public void systemBooted()
    {
        synchronized (mLock)
        {
            mSystemBooted = true;
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void systemReady()
    {
        if (mKeyguardMediator != null)
            mKeyguardMediator.onSystemReady();
        synchronized (mLock)
        {
            updateOrientationListenerLp();
            mSystemReady = true;
            mHandler.post(new Runnable() {

                final PhoneWindowManager this$0;

                public void run()
                {
                    updateSettings();
                }

            
            {
                this$0 = PhoneWindowManager.this;
                super();
            }
            }
);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void updateCustomSettings(ContentResolver contentresolver)
    {
        boolean flag = true;
        if (android.provider.Settings.System.getInt(contentresolver, "volbtn_music_controls", flag) != flag)
            flag = false;
        mVolBtnMusicControls = flag;
    }

    void updateOrientationListenerLp()
    {
        if (mOrientationListener.canDetectOrientation())
        {
            if (localLOGV)
                Log.v("WindowManager", (new StringBuilder()).append("Screen status=").append(mScreenOnEarly).append(", current orientation=").append(mCurrentAppOrientation).append(", SensorEnabled=").append(mOrientationSensorEnabled).toString());
            boolean flag = true;
            if (mScreenOnEarly && needSensorRunningLp())
            {
                boolean flag1 = mOrientationSensorEnabled;
                flag = false;
                if (!flag1)
                {
                    mOrientationListener.enable();
                    if (localLOGV)
                        Log.v("WindowManager", "Enabling listeners");
                    mOrientationSensorEnabled = true;
                }
            }
            if (flag && mOrientationSensorEnabled)
            {
                mOrientationListener.disable();
                if (localLOGV)
                    Log.v("WindowManager", "Disabling listeners");
                mOrientationSensorEnabled = false;
                return;
            }
        }
    }

    void updateRotation(boolean flag)
    {
        try
        {
            mWindowManager.updateRotation(flag, false);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    void updateRotation(boolean flag, boolean flag1)
    {
        try
        {
            mWindowManager.updateRotation(flag, flag1);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void updateSettings()
    {
        byte byte0;
        ContentResolver contentresolver;
        byte0 = 2;
        contentresolver = mContext.getContentResolver();
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        updateCustomSettings(contentresolver);
        int i;
        int j;
        mEndcallBehavior = android.provider.Settings.System.getIntForUser(contentresolver, "end_button_behavior", 2, -2);
        mIncallPowerBehavior = android.provider.Settings.Secure.getIntForUser(contentresolver, "incall_power_button_behavior", 1, -2);
        i = android.provider.Settings.System.getIntForUser(contentresolver, "user_rotation", 0, -2);
        j = mUserRotation;
        boolean flag;
        flag = false;
        if (j == i)
            break MISSING_BLOCK_LABEL_87;
        mUserRotation = i;
        flag = true;
        int k;
        String s;
        boolean flag1;
        int l;
        int i1;
        Handler handler;
        if (android.provider.Settings.System.getIntForUser(contentresolver, "accelerometer_rotation", 0, -2) != 0)
            k = 0;
        else
            k = 1;
        if (mUserRotationMode == k)
            break MISSING_BLOCK_LABEL_125;
        mUserRotationMode = k;
        flag = true;
        updateOrientationListenerLp();
        if (!mSystemReady)
            break MISSING_BLOCK_LABEL_179;
        i1 = android.provider.Settings.System.getIntForUser(contentresolver, "pointer_location", 0, -2);
        if (mPointerLocationMode == i1)
            break MISSING_BLOCK_LABEL_179;
        mPointerLocationMode = i1;
        handler = mHandler;
        if (i1 != 0)
            byte0 = 1;
        handler.sendEmptyMessage(byte0);
        mLockScreenTimeout = android.provider.Settings.System.getIntForUser(contentresolver, "screen_off_timeout", 0, -2);
        s = android.provider.Settings.Secure.getStringForUser(contentresolver, "default_input_method", -2);
        flag1 = false;
        if (s == null)
            break MISSING_BLOCK_LABEL_230;
        l = s.length();
        flag1 = false;
        if (l > 0)
            flag1 = true;
        if (mHasSoftInput == flag1)
            break MISSING_BLOCK_LABEL_248;
        mHasSoftInput = flag1;
        flag = true;
        obj;
        JVM INSTR monitorexit ;
        if (flag)
            updateRotation(true);
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void userActivity()
    {
        synchronized (mStkLock)
        {
            if (mIsStkUserActivityEnabled)
            {
                Intent intent = new Intent("android.intent.action.stk.USER_ACTIVITY");
                mContext.sendBroadcast(intent);
            }
        }
        synchronized (mScreenLockTimeout)
        {
            if (mLockScreenTimerActive)
            {
                mHandler.removeCallbacks(mScreenLockTimeout);
                mHandler.postDelayed(mScreenLockTimeout, mLockScreenTimeout);
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        screenlocktimeout;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public int windowTypeToLayerLw(int i)
    {
        if (i < 1 || i > 99)
            switch (i)
            {
            case 2029: 
                return 29;

            case 2022: 
                return 28;

            case 2018: 
                return 27;

            case 2021: 
                return 26;

            case 2015: 
                return 25;

            case 2016: 
                return 24;

            case 2026: 
                return 23;

            case 2027: 
                return 22;

            case 2010: 
                return 21;

            case 2024: 
                return 20;

            case 2019: 
                return 19;

            case 2006: 
                return 18;

            case 2020: 
                return 17;

            case 2014: 
                return 16;

            case 2000: 
                return 15;

            case 2017: 
                return 14;

            case 2009: 
                return 13;

            case 2004: 
                return 12;

            case 2012: 
                return 11;

            case 2011: 
                return 10;

            case 2003: 
                return 9;

            case 2023: 
                return 8;

            case 2007: 
                return 7;

            case 2005: 
                return 6;

            case 2008: 
            case 2028: 
                return 5;

            case 2001: 
                return 4;

            case 2002: 
                return 3;

            case 2025: 
                return 1;

            default:
                Log.e("WindowManager", (new StringBuilder()).append("Unknown window type: ").append(i).toString());
                return 2;

            case 2013: 
                break;
            }
        return 2;
    }

    static 
    {
        DEBUG = false;
        DEBUG_LAYOUT = false;
        DEBUG_INPUT = false;
        DEBUG_ORIENTATION = false;
        sApplicationLaunchKeyCategories = new SparseArray();
        sApplicationLaunchKeyCategories.append(64, "android.intent.category.APP_BROWSER");
        sApplicationLaunchKeyCategories.append(65, "android.intent.category.APP_EMAIL");
        sApplicationLaunchKeyCategories.append(207, "android.intent.category.APP_CONTACTS");
        sApplicationLaunchKeyCategories.append(208, "android.intent.category.APP_CALENDAR");
        sApplicationLaunchKeyCategories.append(209, "android.intent.category.APP_MUSIC");
        sApplicationLaunchKeyCategories.append(210, "android.intent.category.APP_CALCULATOR");
    }











}
