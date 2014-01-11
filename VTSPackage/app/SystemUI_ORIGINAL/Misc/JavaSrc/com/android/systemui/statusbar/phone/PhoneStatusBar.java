// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.animation.*;
import android.app.*;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.os.storage.StorageVolume;
import android.provider.Telephony;
import android.service.dreams.IDreamManager;
import android.util.*;
import android.view.*;
import android.view.animation.*;
import android.widget.*;
import com.android.internal.statusbar.*;
import com.android.internal.telephony.PhoneConstants;
import com.android.systemui.SearchPanelView;
import com.android.systemui.SystemUI;
import com.android.systemui.statusbar.*;
import com.android.systemui.statusbar.policy.*;
import com.android.systemui.statusbar.toolbar.*;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.xlog.Xlog;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            NotificationPanelView, NavigationBarView, StatusBarWindowView, PhoneStatusBarView, 
//            IconMerger, SettingsPanelView, Ticker, QuickSettings, 
//            PanelHolder, TickerView, CarrierLabelGemini, QuickSettingsContainerView, 
//            PhoneStatusBarPolicy

public class PhoneStatusBar extends BaseStatusBar
{
    private class ApplicationGuideDialog extends Dialog
    {

        final PhoneStatusBar this$0;

        public void onBackPressed()
        {
            mAppGuideDialog.dismiss();
            animateCollapsePanels();
            super.onBackPressed();
        }

        protected void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mAppGuideView = View.inflate(mContext, 0x7f040000, null);
            setContentView(mAppGuideView);
            int i = mContext.getResources().getThemeMainColor();
            if (i != 0)
                ((TextView)mAppGuideView.findViewById(0x7f080006)).setTextColor(i);
            mAppGuideButton = (Button)mAppGuideView.findViewById(0x7f080007);
            mAppGuideButton.setOnClickListener(mAppGuideBtnListener);
        }

        public ApplicationGuideDialog(Context context, int i)
        {
            this$0 = PhoneStatusBar.this;
            super(context, i);
        }
    }

    private static class FastColorDrawable extends Drawable
    {

        private final int mColor;

        public void draw(Canvas canvas)
        {
            canvas.drawColor(mColor, android.graphics.PorterDuff.Mode.SRC);
        }

        public int getOpacity()
        {
            return -1;
        }

        public void setAlpha(int i)
        {
        }

        public void setBounds(int i, int j, int k, int l)
        {
        }

        public void setBounds(Rect rect)
        {
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
        }

        public FastColorDrawable(int i)
        {
            mColor = 0xff000000 | i;
        }
    }

    private class MyTicker extends Ticker
    {

        final PhoneStatusBar this$0;

        public void tickerDone()
        {
            mStatusBarContents.setVisibility(0);
            mTickerView.setVisibility(8);
            mStatusBarContents.startAnimation(loadAnim(0x10a0033, null));
            mTickerView.startAnimation(loadAnim(0x10a0035, mTickingDoneListener));
        }

        public void tickerHalting()
        {
            mStatusBarContents.setVisibility(0);
            mTickerView.setVisibility(8);
            mStatusBarContents.startAnimation(loadAnim(0x10a0000, null));
        }

        public void tickerStarting()
        {
            mTicking = true;
            mStatusBarContents.setVisibility(8);
            mTickerView.setVisibility(0);
            mTickerView.startAnimation(loadAnim(0x10a0037, null));
            mStatusBarContents.startAnimation(loadAnim(0x10a0038, null));
        }

        MyTicker(Context context, View view)
        {
            this$0 = PhoneStatusBar.this;
            super(context, view);
        }
    }


    private static final String ACTION_BOOT_IPO = "android.intent.action.ACTION_PREBOOT_IPO";
    public static final String ACTION_STATUSBAR_START = "com.android.internal.policy.statusbar.START";
    public static final boolean CHATTY = false;
    private static final String CLEAR_NEW_EVENT_VIEW_INTENT = "android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS";
    private static final boolean CLOSE_PANEL_WHEN_EMPTIED = true;
    private static final String CONTACTS = "CONTACTS";
    private static final String CONTACTS_SHOW_GUIDE = "contacts_show_guide";
    public static final boolean DEBUG = false;
    public static final boolean DEBUG_CLINGS = false;
    public static final boolean DEBUG_GESTURES = false;
    public static final boolean DUMPTRUCK = true;
    public static final boolean ENABLE_NOTIFICATION_PANEL_CLING = false;
    private static final String EXTERNAL_SD0 = "/storage/sdcard0";
    private static final String EXTERNAL_SD1 = "/storage/sdcard1";
    private static final int HIDE_ICONS_BELOW_SCORE = -10;
    private static final int INTRUDER_ALERT_DECAY_MS = 0;
    private static final String MMS = "MMS";
    private static final String MMS_SHOW_GUIDE = "mms_show_guide";
    private static final int MSG_CLOSE_PANELS = 1001;
    private static final int MSG_HIDE_INTRUDER = 1004;
    private static final int MSG_OPEN_NOTIFICATION_PANEL = 1000;
    private static final int MSG_OPEN_SETTINGS_PANEL = 1002;
    private static final int MSG_SHOW_INTRUDER = 1003;
    private static final int NOTIFICATION_PRIORITY_MULTIPLIER = 10;
    private static final String PHONE = "PHONE";
    private static final String PHONE_SHOW_GUIDE = "phone_show_guide";
    public static final boolean SETTINGS_DRAG_SHORTCUT = true;
    private static final String SHOW_APP_GUIDE_SETTING = "settings";
    public static final boolean SPEW = false;
    private static final boolean SUPPORT_SD_SWAP = true;
    static final String TAG = "PhoneStatusBar";
    final int FLIP_DURATION = 350;
    final int FLIP_DURATION_IN = 225;
    final int FLIP_DURATION_OUT = 125;
    int mAbsPos[];
    final TimeInterpolator mAccelerateInterpolator = new AccelerateInterpolator();
    private boolean mAirplaneMode;
    float mAnimAccel;
    long mAnimLastTimeNanos;
    float mAnimVel;
    float mAnimY;
    boolean mAnimating;
    boolean mAnimatingReveal;
    private android.view.View.OnClickListener mAppGuideBtnListener;
    private Button mAppGuideButton;
    private Dialog mAppGuideDialog;
    private View mAppGuideView;
    private String mAppName;
    private boolean mAvoidSDAppAddNotification;
    BatteryController mBatteryController;
    BluetoothController mBluetoothController;
    private BroadcastReceiver mBroadcastReceiver;
    private String mBusinessType;
    private CarrierLabelGemini mCarrier1;
    private CarrierLabelGemini mCarrier2;
    private CarrierLabelGemini mCarrier3;
    private CarrierLabelGemini mCarrier4;
    private View mCarrierDivider;
    private View mCarrierDivider2;
    private View mCarrierDivider3;
    private TextView mCarrierLabel;
    private LinearLayout mCarrierLabelGemini;
    private int mCarrierLabelHeight;
    private boolean mCarrierLabelVisible;
    View mClearButton;
    Animator mClearButtonAnim;
    private android.view.View.OnClickListener mClearButtonListener;
    private ViewGroup mCling;
    private boolean mClingShown;
    private android.view.View.OnClickListener mClockClickListener;
    boolean mClosing;
    private float mCollapseAccelPx;
    private float mCollapseMinDisplayFraction;
    Point mCurrentDisplaySize;
    View mDateTimeView;
    DateView mDateView;
    final TimeInterpolator mDecelerateInterpolator = new DecelerateInterpolator();
    int mDisabled;
    Display mDisplay;
    DisplayMetrics mDisplayMetrics;
    IDreamManager mDreamManager;
    int mEdgeBorder;
    private TextView mEmergencyCallLabel;
    private float mExpandAccelPx;
    private float mExpandMinDisplayFraction;
    View mExpandedContents;
    boolean mExpandedVisible;
    private float mFlingCollapseMinVelocityPx;
    private float mFlingExpandMinVelocityPx;
    private float mFlingGestureMaxOutputVelocityPx;
    private float mFlingGestureMaxXVelocityPx;
    float mFlingVelocity;
    int mFlingY;
    public View mFlipSettingsView;
    Animator mFlipSettingsViewAnim;
    android.view.View.OnFocusChangeListener mFocusChangeListener;
    private final GestureRecorder mGestureRec = (GestureRecorder)null;
    public boolean mHasFlipSettings;
    public boolean mHasSettingsPanel;
    private View mHeaderSettingsButton;
    private Animator mHeaderSettingsButtonAnim;
    private android.view.View.OnClickListener mHeaderSettingsButtonListener;
    android.view.View.OnTouchListener mHomeSearchActionListener;
    int mIconHPadding;
    PhoneStatusBarPolicy mIconPolicy;
    int mIconSize;
    private IntruderAlertView mIntruderAlertView;
    private boolean mIsSimIndicatorShowing;
    private Animator mLightsOnAnimation;
    private Animator mLightsOutAnimation;
    LocationController mLocationController;
    private final android.animation.Animator.AnimatorListener mMakeIconsInvisible = new AnimatorListenerAdapter() {

        final PhoneStatusBar this$0;

        public void onAnimationEnd(Animator animator)
        {
            if (mStatusBarContents.getAlpha() == 0.0F)
                mStatusBarContents.setVisibility(4);
        }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
    }
;
    private BroadcastReceiver mMediaEjectBroadcastReceiver;
    View mMoreIcon;
    int mNaturalBarHeight;
    private NavigationBarView mNavigationBarView;
    private int mNavigationIconHints;
    boolean mNeedRelayout;
    private ArrayList mNeedRemoveKeys;
    NetworkController mNetworkController;
    private NetworkControllerCoolpad mNetworkControllerCoolpad;
    private NetworkControllerGemini mNetworkControllerGemini;
    ImageView mNotificationButton;
    Animator mNotificationButtonAnim;
    private android.view.View.OnClickListener mNotificationButtonListener;
    private int mNotificationHeaderHeight;
    IconMerger mNotificationIcons;
    NotificationPanelView mNotificationPanel;
    TextView mNotificationPanelDebugText;
    int mNotificationPanelGravity;
    View mNotificationPanelHeader;
    boolean mNotificationPanelIsFullScreenWidth;
    int mNotificationPanelMarginBottomPx;
    int mNotificationPanelMarginPx;
    float mNotificationPanelMinHeightFrac;
    private String mOldPlmn;
    int mPixelFormat;
    private TextView mPlmnLabel;
    int mPositionTmp[];
    Runnable mPostCollapseCleanup;
    private float mPreviousConfigFontScale;
    private int mPrevioutConfigOrientation;
    QuickSettings mQS;
    Object mQueueLock;
    private android.view.View.OnClickListener mRecentsClickListener;
    private BroadcastReceiver mSIMInfoReceiver;
    public ScrollView mScrollView;
    Animator mScrollViewAnim;
    private float mSelfCollapseVelocityPx;
    private float mSelfExpandVelocityPx;
    ImageView mSettingsButton;
    Animator mSettingsButtonAnim;
    private android.view.View.OnClickListener mSettingsButtonListener;
    QuickSettingsContainerView mSettingsContainer;
    SettingsPanelView mSettingsPanel;
    int mSettingsPanelGravity;
    private boolean mShowCarrierInPanel;
    private int mShowSearchHoldoff;
    private Runnable mShowSearchPanel;
    private ImageView mSimIndicatorIcon;
    private boolean mSimIndicatorIconShow;
    Runnable mStartTracing;
    LinearLayout mStatusBarContents;
    PhoneStatusBarView mStatusBarView;
    StatusBarWindowView mStatusBarWindow;
    LinearLayout mStatusIcons;
    Runnable mStopTracing;
    private boolean mSuppressStatusBarDrags;
    LinearLayout mSystemIconArea;
    int mSystemUiVisibility;
    private Ticker mTicker;
    private View mTickerView;
    private boolean mTicking;
    android.view.animation.Animation.AnimationListener mTickingDoneListener;
    private View mToolBarSwitchPanel;
    private ToolBarView mToolBarView;
    private int mToolBarViewHeight;
    boolean mTracking;
    int mTrackingPosition;
    private boolean mUserSetup;
    private ContentObserver mUserSetupObserver;
    VelocityTracker mVelocityTracker;
    int mViewDelta;

    public PhoneStatusBar()
    {
        mNaturalBarHeight = -1;
        mIconSize = -1;
        mIconHPadding = -1;
        mCurrentDisplaySize = new Point();
        mQueueLock = new Object();
        mCarrierLabelVisible = false;
        mShowCarrierInPanel = false;
        mPositionTmp = new int[2];
        mNavigationBarView = null;
        mAnimatingReveal = false;
        mAbsPos = new int[2];
        mPostCollapseCleanup = null;
        mDisabled = 0;
        mSystemUiVisibility = 0;
        mDisplayMetrics = new DisplayMetrics();
        mNeedRelayout = false;
        mNavigationIconHints = 0;
        mUserSetup = false;
        mUserSetupObserver = new ContentObserver(new Handler()) ;
        mRecentsClickListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                toggleRecentApps();
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mShowSearchHoldoff = 0;
        mShowSearchPanel = new Runnable() {

            final PhoneStatusBar this$0;

            public void run()
            {
                showSearchPanel();
                awakenDreams();
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mHomeSearchActionListener = new android.view.View.OnTouchListener() ;
        mFocusChangeListener = new android.view.View.OnFocusChangeListener() {

            final PhoneStatusBar this$0;

            public void onFocusChange(View view, boolean flag)
            {
                view.setSelected(flag);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mTickingDoneListener = new android.view.animation.Animation.AnimationListener() {

            final PhoneStatusBar this$0;

            public void onAnimationEnd(Animation animation)
            {
                mTicking = false;
            }

            public void onAnimationRepeat(Animation animation)
            {
            }

            public void onAnimationStart(Animation animation)
            {
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mClearButtonListener = new android.view.View.OnClickListener() ;
        mSettingsButtonListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                if (mHasSettingsPanel)
                {
                    animateExpandSettingsPanel();
                    return;
                } else
                {
                    startActivityDismissingKeyguard(new Intent("android.settings.SETTINGS"), true);
                    return;
                }
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mHeaderSettingsButtonListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                startActivityDismissingKeyguard(new Intent("android.settings.SETTINGS"), true);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mClockClickListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                startActivityDismissingKeyguard(new Intent("android.intent.action.QUICK_CLOCK"), true);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mNotificationButtonListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                animateExpandNotificationsPanel();
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mBroadcastReceiver = new BroadcastReceiver() {

            final PhoneStatusBar this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                Xlog.d("PhoneStatusBar", (new StringBuilder()).append("onReceive, action=").append(s).toString());
                if ("android.intent.action.ACTION_BOOT_IPO".equals(s))
                {
                    if (mNavigationBarView != null)
                    {
                        View view1 = mNavigationBarView.findViewById(0x7f080068);
                        if (view1 != null && view1.getVisibility() != 8)
                        {
                            Xlog.d("PhoneStatusBar", "receive android.intent.action.ACTION_BOOT_IPO to set mNavigationBarView visible");
                            view1.setVisibility(0);
                        }
                    }
                } else
                if ("android.intent.action.ACTION_SHUTDOWN_IPO".equals(s))
                {
                    if (mNavigationBarView != null)
                    {
                        Xlog.d("PhoneStatusBar", "receive android.intent.action.ACTION_SHUTDOWN_IPO to set mNavigationBarView invisible");
                        mNavigationBarView.hideForIPOShutdown();
                        return;
                    }
                } else
                {
                    if ("android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s))
                    {
                        boolean flag = "android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s);
                        int k = 0;
                        if (flag)
                        {
                            String s1 = intent.getStringExtra("reason");
                            k = 0;
                            if (s1 != null)
                            {
                                boolean flag1 = s1.equals("recentapps");
                                k = 0;
                                if (flag1)
                                    k = 0 | 2;
                            }
                        }
                        animateCollapsePanels(k);
                        return;
                    }
                    if ("android.intent.action.SKIN_CHANGED".equals(s))
                    {
                        refreshApplicationGuide();
                        refreshExpandedView(context);
                        if (mNavigationBarView != null)
                            mNavigationBarView.upDateResources();
                        repositionNavigationBar();
                        updateResources();
                        return;
                    }
                    if ("android.intent.action.SCREEN_OFF".equals(s))
                    {
                        if (mAppGuideDialog != null && mAppGuideDialog.isShowing())
                        {
                            mAppGuideDialog.dismiss();
                            Xlog.d("PhoneStatusBar", "mAppGuideDialog.dismiss()");
                        }
                        makeExpandedInvisible();
                        notifyNavigationBarScreenOn(false);
                        return;
                    }
                    if ("android.intent.action.CONFIGURATION_CHANGED".equals(s))
                    {
                        refreshApplicationGuide();
                        Configuration configuration = context.getResources().getConfiguration();
                        if (configuration.orientation != mPrevioutConfigOrientation)
                        {
                            mNeedRelayout = true;
                            mPrevioutConfigOrientation = configuration.orientation;
                        }
                        mDisplay.getSize(mCurrentDisplaySize);
                        updateResources();
                        repositionNavigationBar();
                        updateExpandedViewPos(-10000);
                        updateShowSearchHoldoff();
                        return;
                    }
                    if ("android.intent.action.SCREEN_ON".equals(s))
                    {
                        repositionNavigationBar();
                        notifyNavigationBarScreenOn(true);
                        return;
                    }
                    if ("android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s) && mShowCarrierInPanel)
                    {
                        int i = intent.getIntExtra("simId", 0);
                        for (int j = 0; j < mCarrierLabelGemini.getChildCount(); j++)
                        {
                            View view = mCarrierLabelGemini.getChildAt(j);
                            if (!(view instanceof CarrierLabelGemini))
                                continue;
                            CarrierLabelGemini carrierlabelgemini = (CarrierLabelGemini)view;
                            if (i == carrierlabelgemini.getSlotId())
                                carrierlabelgemini.updateNetworkName(intent.getBooleanExtra("showSpn", false), intent.getStringExtra("spn"), intent.getBooleanExtra("showPlmn", false), intent.getStringExtra("plmn"));
                        }

                    }
                }
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mOldPlmn = null;
        mStartTracing = new Runnable() ;
        mStopTracing = new Runnable() {

            final PhoneStatusBar this$0;

            public void run()
            {
                Debug.stopMethodTracing();
                Slog.d("PhoneStatusBar", "stopTracing");
                vibrate();
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mCarrier1 = null;
        mCarrier2 = null;
        mCarrier3 = null;
        mCarrier4 = null;
        mCarrierDivider = null;
        mCarrierDivider2 = null;
        mCarrierDivider3 = null;
        mCarrierLabelGemini = null;
        mSIMInfoReceiver = new BroadcastReceiver() ;
        mIsSimIndicatorShowing = false;
        mBusinessType = null;
        mAirplaneMode = false;
        mSimIndicatorIconShow = false;
        mAppGuideBtnListener = new android.view.View.OnClickListener() {

            final PhoneStatusBar this$0;

            public void onClick(View view)
            {
                Xlog.d("PhoneStatusBar", "onClick! dimiss application guide dialog.");
                mAppGuideDialog.dismiss();
                animateCollapsePanels();
                android.content.SharedPreferences.Editor editor = mContext.getSharedPreferences("settings", 0).edit();
                if ("MMS".equals(mAppName))
                {
                    editor.putString("mms_show_guide", "0");
                    editor.commit();
                } else
                {
                    if ("PHONE".equals(mAppName))
                    {
                        editor.putString("phone_show_guide", "0");
                        editor.commit();
                        return;
                    }
                    if ("CONTACTS".equals(mAppName))
                    {
                        editor.putString("contacts_show_guide", "0");
                        editor.commit();
                        return;
                    }
                }
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
        mMediaEjectBroadcastReceiver = new BroadcastReceiver() {

            final PhoneStatusBar this$0;

            public void onReceive(Context context, Intent intent)
            {
                StorageVolume storagevolume = (StorageVolume)intent.getParcelableExtra("storage_volume");
                if (storagevolume != null)
                {
                    String s = storagevolume.getPath();
                    if ("/storage/sdcard0".equals(s) || "/storage/sdcard1".equals(s))
                    {
                        String s1 = intent.getAction();
                        if (s1.equals("android.intent.action.MEDIA_EJECT"))
                        {
                            Xlog.d("PhoneStatusBar", (new StringBuilder()).append("receive Intent.ACTION_MEDIA_EJECT to remove notification & path = ").append(s).toString());
                            mAvoidSDAppAddNotification = true;
                            if (mNeedRemoveKeys.isEmpty())
                            {
                                Xlog.d("PhoneStatusBar", "receive Intent.ACTION_MEDIA_EJECT to remove notificaiton done, array is empty");
                                return;
                            }
                            ArrayList arraylist = (ArrayList)mNeedRemoveKeys.clone();
                            IBinder ibinder;
                            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); removeNotification(ibinder))
                                ibinder = (IBinder)iterator.next();

                            arraylist.clear();
                            System.gc();
                            Xlog.d("PhoneStatusBar", (new StringBuilder()).append("receive Intent.ACTION_MEDIA_EJECT to remove notificaiton done, array size is ").append(mNeedRemoveKeys.size()).toString());
                            return;
                        }
                        if (s1.equals("android.intent.action.MEDIA_MOUNTED"))
                        {
                            Xlog.d("PhoneStatusBar", (new StringBuilder()).append("receive Intent.ACTION_MEDIA_MOUNTED, path =").append(s).toString());
                            mAvoidSDAppAddNotification = false;
                            return;
                        }
                    }
                }
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
;
    }

    private void addIntruderView()
    {
        android.view.WindowManager.LayoutParams layoutparams = new LayoutParams(-1, -2, 2014, 0x820328, -3);
        layoutparams.gravity = 55;
        layoutparams.setTitle("IntruderAlert");
        layoutparams.packageName = super.mContext.getPackageName();
        layoutparams.windowAnimations = 0x7f0f0018;
        super.mWindowManager.addView(mIntruderAlertView, layoutparams);
    }

    private void addNavigationBar()
    {
        if (mNavigationBarView == null)
        {
            return;
        } else
        {
            prepareNavigationBarView();
            super.mWindowManager.addView(mNavigationBarView, getNavigationBarLayoutParams());
            return;
        }
    }

    private void addStatusBarWindow()
    {
        android.view.WindowManager.LayoutParams layoutparams = new LayoutParams(-1, getStatusBarHeight(), 2000, 0x800048, -3);
        layoutparams.flags = 0x1000000 | layoutparams.flags;
        layoutparams.gravity = getStatusBarGravity();
        layoutparams.setTitle("StatusBar");
        layoutparams.packageName = super.mContext.getPackageName();
        makeStatusBarView();
        super.mWindowManager.addView(mStatusBarWindow, layoutparams);
    }

    private void animateExpandNotificationsPanelSlow()
    {
        Slog.d("PhoneStatusBar", (new StringBuilder()).append("animateExpandSlow: mExpandedVisible=").append(mExpandedVisible).toString());
        if ((0x10000 & mDisabled) == 0)
        {
            mNotificationPanel.expandSlow();
            if (mHasFlipSettings && mScrollView.getVisibility() != 0)
            {
                flipToNotifications();
                return;
            }
        }
    }

    private boolean areLightsOn()
    {
        return (1 & mSystemUiVisibility) == 0;
    }

    private void awakenDreams()
    {
        if (mDreamManager == null)
            break MISSING_BLOCK_LABEL_16;
        mDreamManager.awaken();
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private android.view.WindowManager.LayoutParams getNavigationBarLayoutParams()
    {
        android.view.WindowManager.LayoutParams layoutparams = new LayoutParams(-1, -1, 2019, 0x840068, -1);
        if (ActivityManager.isHighEndGfx())
            layoutparams.flags = 0x1000000 | layoutparams.flags;
        layoutparams.setTitle("NavigationBar");
        layoutparams.windowAnimations = 0;
        return layoutparams;
    }

    private static boolean isInternetCallEnabled(Context context)
    {
        return android.provider.Settings.System.getInt(context.getContentResolver(), "enable_internet_call_value", 0) == 1;
    }

    private Animation loadAnim(int i, android.view.animation.Animation.AnimationListener animationlistener)
    {
        Animation animation = AnimationUtils.loadAnimation(super.mContext, i);
        if (animationlistener != null)
            animation.setAnimationListener(animationlistener);
        return animation;
    }

    private void loadNotificationShade()
    {
        if (super.mPile != null)
        {
            int i = super.mNotificationData.size();
            ArrayList arraylist = new ArrayList();
            boolean flag = isDeviceProvisioned();
            for (int j = 0; j < i; j++)
            {
                com.android.systemui.statusbar.NotificationData.Entry entry = super.mNotificationData.get(-1 + (i - j));
                if ((flag || showNotificationEvenIfUnprovisioned(entry.notification)) && notificationIsForCurrentUser(entry.notification))
                    arraylist.add(entry.row);
            }

            ArrayList arraylist1 = new ArrayList();
            for (int k = 0; k < super.mPile.getChildCount(); k++)
            {
                View view2 = super.mPile.getChildAt(k);
                if (!arraylist.contains(view2))
                    arraylist1.add(view2);
            }

            View view1;
            for (Iterator iterator = arraylist1.iterator(); iterator.hasNext(); super.mPile.removeView(view1))
                view1 = (View)iterator.next();

            for (int l = 0; l < arraylist.size(); l++)
            {
                View view = (View)arraylist.get(l);
                if (view.getParent() == null)
                    super.mPile.addView(view, l);
            }

            if (mSettingsButton != null)
            {
                mSettingsButton.setEnabled(isDeviceProvisioned());
                return;
            }
        }
    }

    private void notifyNavigationBarScreenOn(boolean flag)
    {
        if (mNavigationBarView == null)
        {
            return;
        } else
        {
            mNavigationBarView.notifyScreenOn(flag);
            return;
        }
    }

    private void notifyUiVisibilityChanged()
    {
        try
        {
            super.mWindowManagerService.statusBarVisibilityChanged(mSystemUiVisibility);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void prepareNavigationBarView()
    {
        mNavigationBarView.reorient();
        mNavigationBarView.getRecentsButton().setOnClickListener(mRecentsClickListener);
        mNavigationBarView.getRecentsButton().setOnTouchListener(super.mRecentsPreloadOnTouchListener);
        mNavigationBarView.getHomeButton().setOnTouchListener(mHomeSearchActionListener);
        mNavigationBarView.getSearchLight().setOnTouchListener(mHomeSearchActionListener);
        updateSearchPanel();
    }

    private void refreshApplicationGuide()
    {
        if (mAppGuideDialog != null)
        {
            mAppGuideView = View.inflate(super.mContext, 0x7f040000, null);
            mAppGuideDialog.setContentView(mAppGuideView);
            int i = super.mContext.getResources().getThemeMainColor();
            if (i != 0)
                ((TextView)mAppGuideView.findViewById(0x7f080006)).setTextColor(i);
            mAppGuideButton = (Button)mAppGuideView.findViewById(0x7f080007);
            mAppGuideButton.setOnClickListener(mAppGuideBtnListener);
        }
    }

    private void refreshExpandedView(Context context)
    {
        int i = 0;
        for (int j = super.mNotificationData.size(); i < j; i++)
            inflateViews(super.mNotificationData.get(i), super.mPile);

        loadNotificationShade();
        updateExpansionStates();
        setAreThereNotifications();
        mNotificationPanel.onFinishInflate();
        mToolBarView.mSimSwitchPanelView.updateSimInfo();
        if (mHasFlipSettings)
        {
            ImageView imageview = (ImageView)mStatusBarWindow.findViewById(0x7f0800b1);
            if (imageview != null)
                imageview.setImageDrawable(context.getResources().getDrawable(0x7f020020));
        }
        if (mHasSettingsPanel)
        {
            if (mStatusBarView.hasFullWidthNotifications())
                ((ImageView)mStatusBarWindow.findViewById(0x7f0800b0)).setImageDrawable(context.getResources().getDrawable(0x7f020028));
        } else
        {
            ((ImageView)mStatusBarWindow.findViewById(0x7f0800b0)).setImageDrawable(context.getResources().getDrawable(0x7f020030));
        }
        ((ImageView)mStatusBarWindow.findViewById(0x7f0800ae)).setImageDrawable(context.getResources().getDrawable(0x7f020023));
        ((ImageView)mStatusBarWindow.findViewById(0x7f0800ad)).setImageDrawable(context.getResources().getDrawable(0x7f020030));
    }

    private void repositionNavigationBar()
    {
        if (mNavigationBarView == null)
        {
            return;
        } else
        {
            prepareNavigationBarView();
            super.mWindowManager.updateViewLayout(mNavigationBarView, getNavigationBarLayoutParams());
            return;
        }
    }

    private void resetUserSetupObserver()
    {
        super.mContext.getContentResolver().unregisterContentObserver(mUserSetupObserver);
        mUserSetupObserver.onChange(false);
        super.mContext.getContentResolver().registerContentObserver(android.provider.Settings.Secure.getUriFor("user_setup_complete"), true, mUserSetupObserver, super.mCurrentUserId);
    }

    static final float saturate(float f)
    {
        if (f < 0.0F)
            f = 0.0F;
        else
        if (f > 1.0F)
            return 1.0F;
        return f;
    }

    private void setIntruderAlertVisibility(boolean flag)
    {
    }

    private void setPileLayers(int i)
    {
        int j = super.mPile.getChildCount();
        switch (i)
        {
        case 1: // '\001'
        default:
            break;

        case 2: // '\002'
            int ai[] = new int[2];
            mNotificationPanel.getLocationInWindow(ai);
            int l = ai[0];
            int i1 = ai[1];
            int j1 = l + mNotificationPanel.getWidth();
            int k1 = i1 + getExpandedViewMaxHeight();
            Rect rect = new Rect();
            for (int l1 = 0; l1 < j; l1++)
            {
                View view = super.mPile.getChildAt(l1);
                view.getLocationInWindow(ai);
                rect.set(ai[0], ai[1], ai[0] + view.getWidth(), ai[1] + view.getHeight());
                if (rect.intersects(l, i1, j1, k1))
                    view.setLayerType(i, null);
            }

            break;

        case 0: // '\0'
            for (int k = 0; k < j; k++)
                super.mPile.getChildAt(k).setLayerType(i, null);

            break;
        }
    }

    private void setStatusBarLowProfile(boolean flag)
    {
        if (mLightsOutAnimation == null)
        {
            View view = mStatusBarView.findViewById(0x7f080029);
            View view1 = mStatusBarView.findViewById(0x7f08002d);
            View view2 = mStatusBarView.findViewById(0x7f08002f);
            View view3 = mStatusBarView.findViewById(0x7f080031);
            View view4 = mStatusBarView.findViewById(0x7f080032);
            AnimatorSet animatorset = new AnimatorSet();
            Animator aanimator[] = new Animator[5];
            aanimator[0] = ObjectAnimator.ofFloat(view, View.ALPHA, new float[] {
                0.0F
            });
            aanimator[1] = ObjectAnimator.ofFloat(view1, View.ALPHA, new float[] {
                0.0F
            });
            aanimator[2] = ObjectAnimator.ofFloat(view2, View.ALPHA, new float[] {
                0.0F
            });
            aanimator[3] = ObjectAnimator.ofFloat(view3, View.ALPHA, new float[] {
                0.5F
            });
            aanimator[4] = ObjectAnimator.ofFloat(view4, View.ALPHA, new float[] {
                0.5F
            });
            animatorset.playTogether(aanimator);
            animatorset.setDuration(750L);
            AnimatorSet animatorset1 = new AnimatorSet();
            Animator aanimator1[] = new Animator[5];
            aanimator1[0] = ObjectAnimator.ofFloat(view, View.ALPHA, new float[] {
                1.0F
            });
            aanimator1[1] = ObjectAnimator.ofFloat(view1, View.ALPHA, new float[] {
                1.0F
            });
            aanimator1[2] = ObjectAnimator.ofFloat(view2, View.ALPHA, new float[] {
                1.0F
            });
            aanimator1[3] = ObjectAnimator.ofFloat(view3, View.ALPHA, new float[] {
                1.0F
            });
            aanimator1[4] = ObjectAnimator.ofFloat(view4, View.ALPHA, new float[] {
                1.0F
            });
            animatorset1.playTogether(aanimator1);
            animatorset1.setDuration(250L);
            mLightsOutAnimation = animatorset;
            mLightsOnAnimation = animatorset1;
        }
        mLightsOutAnimation.cancel();
        mLightsOnAnimation.cancel();
        Animator animator;
        if (flag)
            animator = mLightsOutAnimation;
        else
            animator = mLightsOnAnimation;
        animator.start();
        setAreThereNotifications();
    }

    private void showAlwaysAskOrInternetCall(long l)
    {
        mSimIndicatorIconShow = true;
        if (l == -2L)
            mSimIndicatorIcon.setBackgroundResource(0x7f020137);
        else
        if (l == -3L)
            mSimIndicatorIcon.setBackgroundResource(0x7f020136);
        else
            mSimIndicatorIcon.setBackgroundResource(0x7f020135);
        if (!mAirplaneMode)
        {
            mSimIndicatorIcon.setVisibility(0);
            return;
        } else
        {
            mSimIndicatorIcon.setVisibility(8);
            mSimIndicatorIconShow = false;
            return;
        }
    }

    private void updateAirplaneMode()
    {
label0:
        {
            ImageView imageview;
            byte byte0;
label1:
            {
                boolean flag = true;
                if (android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "airplane_mode_on", 0) != flag)
                    flag = false;
                mAirplaneMode = flag;
                if (mSimIndicatorIcon == null)
                    break label0;
                imageview = mSimIndicatorIcon;
                if (mSimIndicatorIconShow)
                {
                    boolean flag1 = mAirplaneMode;
                    byte0 = 0;
                    if (!flag1)
                        break label1;
                }
                byte0 = 8;
            }
            imageview.setVisibility(byte0);
        }
    }

    private void updateNetworkName(boolean flag, String s, boolean flag1, String s1)
    {
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("For AT&T updateNetworkName, showSpn=").append(flag).append(" spn=").append(s).append(" showPlmn=").append(flag1).append(" plmn=").append(s1).toString());
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag2 = false;
        if (flag1)
        {
            flag2 = false;
            if (s1 != null)
            {
                stringbuilder.append(s1);
                flag2 = true;
            }
        }
        if (flag && s != null)
        {
            if (flag2)
                stringbuilder.append(super.mContext.getString(0x7f0b005b));
            stringbuilder.append(s);
            flag2 = true;
        }
        if (flag2)
        {
            mOldPlmn = stringbuilder.toString();
            return;
        } else
        {
            mOldPlmn = super.mContext.getResources().getString(0x10402e6);
            return;
        }
    }

    private void updateNotificationSimInfo(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord, Notification notification, StatusBarIconView statusbariconview, View view)
    {
        if (notification.simId != siminforecord.mSimInfoId)
            return;
        int i = notification.simInfoType;
        if (statusbariconview == null)
        {
            int j = 0;
            do
            {
                if (j >= mNotificationIcons.getChildCount())
                    break;
                View view1 = mNotificationIcons.getChildAt(j);
                if ((view1 instanceof StatusBarIconView) && ((StatusBarIconView)view1).getNotificationSimId() == notification.simId)
                    break;
                j++;
            } while (true);
        }
        if ((i == 1 || i == 3) && siminforecord != null && siminforecord.mColor >= 0 && siminforecord.mColor < Telephony.SIMBackgroundRes.length)
        {
            Xlog.d("PhoneStatusBar", (new StringBuilder()).append("updateNotificationSimInfo, add sim info to notification item. simInfo.mColor = ").append(siminforecord.mColor).toString());
            view.findViewById(0x102032b).setVisibility(0);
            ImageView imageview = (ImageView)view.findViewById(0x102032d);
            imageview.setBackground(super.mContext.getResources().getDrawable(TelephonyIcons.SIM_INDICATOR_BACKGROUND_NOTIFICATION[siminforecord.mColor]));
            imageview.setVisibility(0);
            return;
        } else
        {
            view.findViewById(0x102032b).setVisibility(0);
            view.findViewById(0x102032d).setVisibility(8);
            return;
        }
    }

    private void updateNotificationsSimInfo(long l)
    {
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("updateNotificationsSimInfo, the simId is ").append(l).append(".").toString());
        if (l != -1L)
        {
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SIMHelper.getSIMInfo(super.mContext, l);
            if (siminforecord == null)
            {
                Xlog.d("PhoneStatusBar", "updateNotificationsSimInfo, the simInfo is null.");
                return;
            }
            int i = 0;
            for (int j = super.mNotificationData.size(); i < j; i++)
            {
                com.android.systemui.statusbar.NotificationData.Entry entry = super.mNotificationData.get(i);
                updateNotificationSimInfo(siminforecord, entry.notification.notification, entry.icon, entry.expanded);
            }

        }
    }

    private void updatePLMNSearchingStateView(boolean flag)
    {
        if (flag)
            mPlmnLabel.setText(0x7f0b000c);
        else
            mPlmnLabel.setText(mOldPlmn);
        mPlmnLabel.setVisibility(0);
    }

    private void updateShowSearchHoldoff()
    {
        mShowSearchHoldoff = super.mContext.getResources().getInteger(0x7f0c0001);
    }

    private void updateSimIndicator()
    {
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("updateSimIndicator mIsSimIndicatorShowing = ").append(mIsSimIndicatorShowing).append(" mBusinessType is ").append(mBusinessType).toString());
        if (mIsSimIndicatorShowing && mBusinessType != null)
            showSimIndicator(mBusinessType);
        if (mSimIndicatorIconShow && mBusinessType != null)
        {
            long l = SIMHelper.getDefaultSIM(super.mContext, mBusinessType);
            if (mSimIndicatorIcon != null && l != -1L && l != -2L && l != -3L)
                mSimIndicatorIcon.setVisibility(8);
        }
    }

    public static String viewInfo(View view)
    {
        return (new StringBuilder()).append("[(").append(view.getLeft()).append(",").append(view.getTop()).append(")(").append(view.getRight()).append(",").append(view.getBottom()).append(") ").append(view.getWidth()).append("x").append(view.getHeight()).append("]").toString();
    }

    public void addIcon(String s, int i, int j, StatusBarIcon statusbaricon)
    {
        StatusBarIconView statusbariconview = new StatusBarIconView(super.mContext, s, null);
        statusbariconview.set(statusbaricon);
        mStatusIcons.addView(statusbariconview, j, new LayoutParams(mIconSize, mIconSize));
    }

    public void addNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        if ((0x40000 & super.mContext.getPackageManager().getApplicationInfo(statusbarnotification.pkg, 0).flags) == 0)
            break MISSING_BLOCK_LABEL_92;
        if (mAvoidSDAppAddNotification)
            return;
        try
        {
            if (!mNeedRemoveKeys.contains(ibinder))
                mNeedRemoveKeys.add(ibinder);
            Slog.d("PhoneStatusBar", (new StringBuilder()).append("addNotification, applicationInfo pkg = ").append(statusbarnotification.pkg).append(" to remove notification key = ").append(ibinder).toString());
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            namenotfoundexception.printStackTrace();
        }
label0:
        {
label1:
            {
                {
                    StatusBarIconView statusbariconview = addNotificationViews(ibinder, statusbarnotification);
                    if (statusbariconview == null)
                        break label0;
                    int i;
                    long l;
                    com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord;
                    com.android.systemui.statusbar.NotificationData.Entry entry;
                    int j;
                    try
                    {
                        ActivityManagerNative.getDefault().isTopActivityImmersive();
                    }
                    catch (RemoteException remoteexception) { }
                    if (statusbarnotification.notification.fullScreenIntent == null)
                        break label1;
                    awakenDreams();
                    try
                    {
                        statusbarnotification.notification.fullScreenIntent.send();
                    }
                    catch (android.app.PendingIntent.CanceledException canceledexception) { }
                }
label2:
                {
                    i = statusbarnotification.notification.simInfoType;
                    l = statusbarnotification.notification.simId;
                    if (i < 1)
                    {
                        siminforecord = null;
                        if (i > 3)
                            break label2;
                    }
                    j = l != 0L;
                    siminforecord = null;
                    if (j > 0)
                    {
                        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("addNotificationViews, simInfoType=").append(i).append(", simId=").append(l).append(".").toString());
                        siminforecord = SIMHelper.getSIMInfo(super.mContext, l);
                    }
                }
                if (siminforecord != null)
                {
                    entry = super.mNotificationData.findByKey(ibinder);
                    updateNotificationSimInfo(siminforecord, statusbarnotification.notification, statusbariconview, entry.expanded);
                }
                setAreThereNotifications();
                updateExpandedViewPos(-10000);
                return;
            }
            if (super.mCurrentlyIntrudingNotification == null)
                tick(null, statusbarnotification, true);
            if (true)
                break MISSING_BLOCK_LABEL_138;
        }
        return;
    }

    public void animateCollapsePanels()
    {
        animateCollapsePanels(0);
    }

    public void animateCollapsePanels(int i)
    {
        if ((i & 2) == 0)
        {
            super.mHandler.removeMessages(1021);
            super.mHandler.sendEmptyMessage(1021);
        }
        if ((i & 1) == 0)
        {
            super.mHandler.removeMessages(1025);
            super.mHandler.sendEmptyMessage(1025);
        }
        mStatusBarWindow.cancelExpandHelper();
        mStatusBarView.collapseAllPanels(true);
        if (mAppGuideDialog != null)
        {
            Slog.d("PhoneStatusBar", "animateCollapsePanels,  dismiss app guide dialog");
            mAppGuideDialog.dismiss();
        }
    }

    public void animateCollapseQuickSettings()
    {
        mStatusBarView.collapseAllPanels(true);
    }

    public void animateExpandNotificationsPanel()
    {
        if ((0x10000 & mDisabled) == 0)
        {
            mNotificationPanel.expand();
            if (mHasFlipSettings && mScrollView.getVisibility() != 0)
            {
                flipToNotifications();
                return;
            }
        }
    }

    public void animateExpandSettingsPanel()
    {
        if ((0x10000 & mDisabled) == 0 && mUserSetup)
            if (mHasFlipSettings)
            {
                mNotificationPanel.expand();
                if (mFlipSettingsView.getVisibility() != 0)
                {
                    flipToSettings();
                    return;
                }
            } else
            if (mSettingsPanel != null)
            {
                mSettingsPanel.expand();
                return;
            }
    }

    public void createAndAddWindows()
    {
        addStatusBarWindow();
    }

    public void createAndShowAppGuideDialog()
    {
        Xlog.d("PhoneStatusBar", "createAndShowAppGuideDialog");
        if ((0x10000 & mDisabled) != 0)
        {
            Xlog.d("PhoneStatusBar", "StatusBar can not expand, so return.");
            return;
        } else
        {
            mAppGuideDialog = new ApplicationGuideDialog(super.mContext, 0x7f0f001d);
            mAppGuideDialog.getWindow().setType(2014);
            animateExpandNotificationsPanelSlow();
            mAppGuideDialog.show();
            ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mAppGuideView, "alpha", new float[] {
                0.0F, 1.0F
            });
            objectanimator.setDuration(1500L);
            objectanimator.start();
            return;
        }
    }

    protected com.android.systemui.statusbar.BaseStatusBar.H createHandler()
    {
        return new H();
    }

    public void disable(int i)
    {
        int j = i ^ mDisabled;
        mDisabled = i;
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("disable: < ");
        String s;
        if ((i & 0x10000) != 0)
            s = "EXPAND";
        else
            s = "expand";
        stringbuilder.append(s);
        String s1;
        if ((j & 0x10000) != 0)
            s1 = "* ";
        else
            s1 = " ";
        stringbuilder.append(s1);
        String s2;
        if ((i & 0x20000) != 0)
            s2 = "ICONS";
        else
            s2 = "icons";
        stringbuilder.append(s2);
        String s3;
        if ((j & 0x20000) != 0)
            s3 = "* ";
        else
            s3 = " ";
        stringbuilder.append(s3);
        String s4;
        if ((0x40000 & i) != 0)
            s4 = "ALERTS";
        else
            s4 = "alerts";
        stringbuilder.append(s4);
        String s5;
        if ((0x40000 & j) != 0)
            s5 = "* ";
        else
            s5 = " ";
        stringbuilder.append(s5);
        String s6;
        if ((i & 0x80000) != 0)
            s6 = "TICKER";
        else
            s6 = "ticker";
        stringbuilder.append(s6);
        String s7;
        if ((j & 0x80000) != 0)
            s7 = "* ";
        else
            s7 = " ";
        stringbuilder.append(s7);
        String s8;
        if ((0x100000 & i) != 0)
            s8 = "SYSTEM_INFO";
        else
            s8 = "system_info";
        stringbuilder.append(s8);
        String s9;
        if ((0x100000 & j) != 0)
            s9 = "* ";
        else
            s9 = " ";
        stringbuilder.append(s9);
        String s10;
        if ((0x400000 & i) != 0)
            s10 = "BACK";
        else
            s10 = "back";
        stringbuilder.append(s10);
        String s11;
        if ((0x400000 & j) != 0)
            s11 = "* ";
        else
            s11 = " ";
        stringbuilder.append(s11);
        String s12;
        if ((0x200000 & i) != 0)
            s12 = "HOME";
        else
            s12 = "home";
        stringbuilder.append(s12);
        String s13;
        if ((0x200000 & j) != 0)
            s13 = "* ";
        else
            s13 = " ";
        stringbuilder.append(s13);
        String s14;
        if ((0x1000000 & i) != 0)
            s14 = "RECENT";
        else
            s14 = "recent";
        stringbuilder.append(s14);
        String s15;
        if ((0x1000000 & j) != 0)
            s15 = "* ";
        else
            s15 = " ";
        stringbuilder.append(s15);
        String s16;
        if ((0x800000 & i) != 0)
            s16 = "CLOCK";
        else
            s16 = "clock";
        stringbuilder.append(s16);
        String s17;
        if ((0x800000 & j) != 0)
            s17 = "* ";
        else
            s17 = " ";
        stringbuilder.append(s17);
        String s18;
        if ((0x2000000 & i) != 0)
            s18 = "SEARCH";
        else
            s18 = "search";
        stringbuilder.append(s18);
        String s19;
        if ((0x2000000 & j) != 0)
            s19 = "* ";
        else
            s19 = " ";
        stringbuilder.append(s19);
        stringbuilder.append(">");
        Slog.d("PhoneStatusBar", stringbuilder.toString());
        if ((0x100000 & j) != 0)
        {
            mSystemIconArea.animate().cancel();
            if ((0x100000 & i) != 0)
            {
                mSystemIconArea.animate().alpha(0.0F).translationY(0.5F * (float)mNaturalBarHeight).setDuration(175L).setInterpolator(new DecelerateInterpolator(1.5F)).setListener(mMakeIconsInvisible).start();
            } else
            {
                mSystemIconArea.setVisibility(0);
                mSystemIconArea.animate().alpha(1.0F).translationY(0.0F).setStartDelay(0L).setInterpolator(new DecelerateInterpolator(1.5F)).setDuration(175L).start();
            }
        }
        if ((0x800000 & j) != 0)
        {
            boolean flag;
            if ((0x800000 & i) == 0)
                flag = true;
            else
                flag = false;
            showClock(flag);
        }
        if ((j & 0x10000) != 0 && (i & 0x10000) != 0)
            animateCollapsePanels();
        if ((0x3600000 & j) != 0)
        {
            if (mNavigationBarView != null)
                mNavigationBarView.setDisabledFlags(i);
            if ((0x1000000 & i) != 0)
            {
                super.mHandler.removeMessages(1021);
                super.mHandler.sendEmptyMessage(1021);
            }
        }
        if ((j & 0x20000) != 0)
        {
            if ((i & 0x20000) != 0)
            {
                if (mTicking)
                    haltTicker();
                mNotificationIcons.animate().alpha(0.0F).translationY(0.5F * (float)mNaturalBarHeight).setDuration(175L).setInterpolator(new DecelerateInterpolator(1.5F)).setListener(mMakeIconsInvisible).start();
            } else
            {
                mNotificationIcons.setVisibility(0);
                mNotificationIcons.animate().alpha(1.0F).translationY(0.0F).setStartDelay(0L).setInterpolator(new DecelerateInterpolator(1.5F)).setDuration(175L).start();
                return;
            }
        } else
        if ((j & 0x80000) != 0 && mTicking && (i & 0x80000) != 0)
        {
            haltTicker();
            return;
        }
    }

    public void dismissAppGuide()
    {
        if (mAppGuideDialog != null && mAppGuideDialog.isShowing())
        {
            Xlog.d("PhoneStatusBar", "dismiss app guide dialog");
            mAppGuideDialog.dismiss();
            mNotificationPanel.cancelTimeAnimator();
            makeExpandedInvisible();
        }
    }

    public void dismissIntruder()
    {
        if (super.mCurrentlyIntrudingNotification == null)
            return;
        try
        {
            super.mBarService.onNotificationClear(super.mCurrentlyIntrudingNotification.pkg, super.mCurrentlyIntrudingNotification.tag, super.mCurrentlyIntrudingNotification.id);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        Object obj = mQueueLock;
        obj;
        JVM INSTR monitorenter ;
        StringBuilder stringbuilder;
        printwriter.println("Current Status Bar state:");
        printwriter.println((new StringBuilder()).append("  mExpandedVisible=").append(mExpandedVisible).append(", mTrackingPosition=").append(mTrackingPosition).toString());
        printwriter.println((new StringBuilder()).append("  mTicking=").append(mTicking).toString());
        printwriter.println((new StringBuilder()).append("  mTracking=").append(mTracking).toString());
        stringbuilder = (new StringBuilder()).append("  mNotificationPanel=");
        if (mNotificationPanel != null) goto _L2; else goto _L1
_L1:
        String s = "null";
_L5:
        printwriter.println(stringbuilder.append(s).toString());
        printwriter.println((new StringBuilder()).append("  mAnimating=").append(mAnimating).append(", mAnimY=").append(mAnimY).append(", mAnimVel=").append(mAnimVel).append(", mAnimAccel=").append(mAnimAccel).toString());
        printwriter.println((new StringBuilder()).append("  mAnimLastTimeNanos=").append(mAnimLastTimeNanos).toString());
        printwriter.println((new StringBuilder()).append("  mAnimatingReveal=").append(mAnimatingReveal).append(" mViewDelta=").append(mViewDelta).toString());
        printwriter.println((new StringBuilder()).append("  mDisplayMetrics=").append(mDisplayMetrics).toString());
        printwriter.println((new StringBuilder()).append("  mPile: ").append(viewInfo(super.mPile)).toString());
        printwriter.println((new StringBuilder()).append("  mTickerView: ").append(viewInfo(mTickerView)).toString());
        printwriter.println((new StringBuilder()).append("  mScrollView: ").append(viewInfo(mScrollView)).append(" scroll ").append(mScrollView.getScrollX()).append(",").append(mScrollView.getScrollY()).toString());
        obj;
        JVM INSTR monitorexit ;
        NotificationData notificationdata;
        printwriter.print("  mNavigationBarView=");
        Exception exception;
        int i;
        int j;
        com.android.systemui.statusbar.NotificationData.Entry entry;
        StatusBarNotification statusbarnotification;
        if (mNavigationBarView == null)
            printwriter.println("null");
        else
            mNavigationBarView.dump(filedescriptor, printwriter, as);
        notificationdata = super.mNotificationData;
        notificationdata;
        JVM INSTR monitorenter ;
        i = super.mNotificationData.size();
        printwriter.println((new StringBuilder()).append("  notification icons: ").append(i).toString());
        j = 0;
_L4:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        entry = super.mNotificationData.get(j);
        printwriter.println((new StringBuilder()).append("    [").append(j).append("] key=").append(entry.key).append(" icon=").append(entry.icon).toString());
        statusbarnotification = entry.notification;
        printwriter.println((new StringBuilder()).append("         pkg=").append(statusbarnotification.pkg).append(" id=").append(statusbarnotification.id).append(" score=").append(statusbarnotification.score).toString());
        printwriter.println((new StringBuilder()).append("         notification=").append(statusbarnotification.notification).toString());
        printwriter.println((new StringBuilder()).append("         tickerText=\"").append(statusbarnotification.notification.tickerText).append("\"").toString());
        j++;
        if (true) goto _L4; else goto _L3
_L2:
        s = (new StringBuilder()).append(mNotificationPanel).append(" params=").append(mNotificationPanel.getLayoutParams().debug("")).toString();
          goto _L5
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        notificationdata;
        JVM INSTR monitorexit ;
        int k = mStatusIcons.getChildCount();
        printwriter.println((new StringBuilder()).append("  system icons: ").append(k).toString());
        for (int l = 0; l < k; l++)
        {
            StatusBarIconView statusbariconview = (StatusBarIconView)mStatusIcons.getChildAt(l);
            printwriter.println((new StringBuilder()).append("    [").append(l).append("] icon=").append(statusbariconview).toString());
        }

        break MISSING_BLOCK_LABEL_884;
        Exception exception1;
        exception1;
        notificationdata;
        JVM INSTR monitorexit ;
        throw exception1;
        mNetworkControllerGemini.dump(filedescriptor, printwriter, as);
        return;
    }

    public void flipPanels()
    {
label0:
        {
            if (mHasFlipSettings)
            {
                if (mFlipSettingsView.getVisibility() == 0)
                    break label0;
                flipToSettings();
            }
            return;
        }
        flipToNotifications();
    }

    public void flipToNotifications()
    {
        if (mFlipSettingsViewAnim != null)
            mFlipSettingsViewAnim.cancel();
        if (mScrollViewAnim != null)
            mScrollViewAnim.cancel();
        if (mSettingsButtonAnim != null)
            mSettingsButtonAnim.cancel();
        if (mNotificationButtonAnim != null)
            mNotificationButtonAnim.cancel();
        if (mClearButtonAnim != null)
            mClearButtonAnim.cancel();
        if (mHeaderSettingsButtonAnim != null)
            mHeaderSettingsButtonAnim.cancel();
        mScrollView.setVisibility(0);
        mScrollViewAnim = start(startDelay(125, interpolator(mDecelerateInterpolator, ObjectAnimator.ofFloat(mScrollView, View.SCALE_X, new float[] {
            0.0F, 1.0F
        }).setDuration(225L))));
        mFlipSettingsViewAnim = start(setVisibilityWhenDone(interpolator(mAccelerateInterpolator, ObjectAnimator.ofFloat(mFlipSettingsView, View.SCALE_X, new float[] {
            1.0F, 0.0F
        })).setDuration(125L), mFlipSettingsView, 4));
        mNotificationButtonAnim = start(setVisibilityWhenDone(ObjectAnimator.ofFloat(mNotificationButton, View.ALPHA, new float[] {
            0.0F
        }).setDuration(350L), mNotificationButton, 4));
        mSettingsButton.setVisibility(0);
        mSettingsButtonAnim = start(ObjectAnimator.ofFloat(mSettingsButton, View.ALPHA, new float[] {
            1.0F
        }).setDuration(350L));
        mClearButton.setVisibility(0);
        mClearButton.setAlpha(0.0F);
        setAreThereNotifications();
        mNotificationPanel.postDelayed(new Runnable() {

            final PhoneStatusBar this$0;

            public void run()
            {
                updateCarrierLabelVisibility(false);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
, 200L);
        if (mHeaderSettingsButton != null)
            mHeaderSettingsButton.setVisibility(8);
        if (mToolBarView.mSimSwitchPanelView.isPanelShowing())
            mToolBarSwitchPanel.setVisibility(0);
    }

    public void flipToSettings()
    {
        if (!mUserSetup)
            return;
        if (mFlipSettingsViewAnim != null)
            mFlipSettingsViewAnim.cancel();
        if (mScrollViewAnim != null)
            mScrollViewAnim.cancel();
        if (mSettingsButtonAnim != null)
            mSettingsButtonAnim.cancel();
        if (mNotificationButtonAnim != null)
            mNotificationButtonAnim.cancel();
        if (mClearButtonAnim != null)
            mClearButtonAnim.cancel();
        if (mHeaderSettingsButtonAnim != null)
            mHeaderSettingsButtonAnim.cancel();
        mFlipSettingsView.setVisibility(0);
        mFlipSettingsView.setScaleX(0.0F);
        mFlipSettingsViewAnim = start(startDelay(125, interpolator(mDecelerateInterpolator, ObjectAnimator.ofFloat(mFlipSettingsView, View.SCALE_X, new float[] {
            0.0F, 1.0F
        }).setDuration(225L))));
        mScrollViewAnim = start(setVisibilityWhenDone(interpolator(mAccelerateInterpolator, ObjectAnimator.ofFloat(mScrollView, View.SCALE_X, new float[] {
            1.0F, 0.0F
        })).setDuration(125L), mScrollView, 4));
        mSettingsButtonAnim = start(setVisibilityWhenDone(ObjectAnimator.ofFloat(mSettingsButton, View.ALPHA, new float[] {
            0.0F
        }).setDuration(350L), mScrollView, 4));
        mNotificationButton.setVisibility(0);
        mNotificationButtonAnim = start(ObjectAnimator.ofFloat(mNotificationButton, View.ALPHA, new float[] {
            1.0F
        }).setDuration(350L));
        mClearButtonAnim = start(setVisibilityWhenDone(ObjectAnimator.ofFloat(mClearButton, View.ALPHA, new float[] {
            0.0F
        }).setDuration(350L), mClearButton, 8));
        if (mHeaderSettingsButton != null)
            mHeaderSettingsButtonAnim = start(setVisibilityWhenDone(ObjectAnimator.ofFloat(mHeaderSettingsButton, View.ALPHA, new float[] {
                1.0F
            }).setDuration(350L), mHeaderSettingsButton, 0));
        mNotificationPanel.postDelayed(new Runnable() {

            final PhoneStatusBar this$0;

            public void run()
            {
                updateCarrierLabelVisibility(false);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
, 200L);
        mToolBarSwitchPanel.setVisibility(8);
    }

    protected int getExpandedViewMaxHeight()
    {
        return mDisplayMetrics.heightPixels - mNotificationPanelMarginBottomPx;
    }

    public GestureRecorder getGestureRecorder()
    {
        return mGestureRec;
    }

    public Handler getHandler()
    {
        return super.mHandler;
    }

    protected android.view.WindowManager.LayoutParams getRecentsLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        int i = layoutparams.width;
        int j = layoutparams.height;
        byte byte0;
        if (false)
            byte0 = -1;
        else
            byte0 = -3;
        android.view.WindowManager.LayoutParams layoutparams1 = new LayoutParams(i, j, 2014, 0x820100, byte0);
        if (ActivityManager.isHighEndGfx())
        {
            layoutparams1.flags = 0x1000000 | layoutparams1.flags;
        } else
        {
            layoutparams1.flags = 2 | layoutparams1.flags;
            layoutparams1.dimAmount = 0.75F;
        }
        layoutparams1.gravity = 83;
        layoutparams1.setTitle("RecentsPanel");
        layoutparams1.windowAnimations = 0x10301ed;
        layoutparams1.softInputMode = 49;
        return layoutparams1;
    }

    protected android.view.WindowManager.LayoutParams getSearchLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        byte byte0;
        if (false)
            byte0 = -1;
        else
            byte0 = -3;
        android.view.WindowManager.LayoutParams layoutparams1 = new LayoutParams(-1, -1, 2024, 0x820100, byte0);
        if (ActivityManager.isHighEndGfx())
            layoutparams1.flags = 0x1000000 | layoutparams1.flags;
        layoutparams1.gravity = 83;
        layoutparams1.setTitle("SearchPanel");
        layoutparams1.windowAnimations = 0x10301ed;
        layoutparams1.softInputMode = 49;
        return layoutparams1;
    }

    protected int getStatusBarGravity()
    {
        return 55;
    }

    public int getStatusBarHeight()
    {
        if (mNaturalBarHeight < 0)
            mNaturalBarHeight = super.mContext.getResources().getDimensionPixelSize(0x105000c);
        return mNaturalBarHeight;
    }

    protected View getStatusBarView()
    {
        return mStatusBarView;
    }

    protected void haltTicker()
    {
        mTicker.halt();
    }

    public void hideCling()
    {
        if (isClinging())
        {
            mCling.animate().alpha(0.0F).setDuration(250L).start();
            mCling.setVisibility(8);
            mSuppressStatusBarDrags = false;
        }
    }

    public void hideSearchPanel()
    {
        hideSearchPanel();
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mNavigationBarView.getLayoutParams();
        layoutparams.flags = 0x20 | layoutparams.flags;
        super.mWindowManager.updateViewLayout(mNavigationBarView, layoutparams);
    }

    public void hideSimIndicator()
    {
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("hideSimIndicator SIM indicator.mBusinessType = ").append(mBusinessType).toString());
        if (mBusinessType == null)
            return;
        long l = SIMHelper.getDefaultSIM(super.mContext, mBusinessType);
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("hideSimIndicator, hide SIM indicator simId = ").append(l).append(".").toString());
        mSimIndicatorIcon.setVisibility(8);
        mNetworkControllerGemini.hideSimIndicator(0);
        mNetworkControllerGemini.hideSimIndicator(1);
        if (PhoneConstants.GEMINI_SIM_NUM == 3)
            mNetworkControllerGemini.hideSimIndicator(2);
        if (PhoneConstants.GEMINI_SIM_NUM == 4)
            mNetworkControllerGemini.hideSimIndicator(3);
        mToolBarView.hideSimSwithPanel();
        mIsSimIndicatorShowing = false;
        mSimIndicatorIconShow = false;
    }

    public boolean interceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getActionMasked();
        if (mSuppressStatusBarDrags)
            return true;
        if (i == 1 && !mClingShown)
            showCling();
        else
            hideCling();
        return false;
    }

    public Animator interpolator(TimeInterpolator timeinterpolator, Animator animator)
    {
        animator.setInterpolator(timeinterpolator);
        return animator;
    }

    public boolean isClinging()
    {
        return mCling != null && mCling.getVisibility() == 0;
    }

    public boolean isExpanded()
    {
        return mExpandedVisible;
    }

    protected void loadDimens()
    {
        Resources resources = super.mContext.getResources();
        mNaturalBarHeight = resources.getDimensionPixelSize(0x105000c);
        int i = resources.getDimensionPixelSize(0x1050010);
        int j = resources.getDimensionPixelSize(0x7f0d001e);
        if (j != mIconHPadding || i != mIconSize)
        {
            mIconHPadding = j;
            mIconSize = i;
        }
        mEdgeBorder = resources.getDimensionPixelSize(0x7f0d0000);
        mSelfExpandVelocityPx = resources.getDimension(0x7f0d0020);
        mSelfCollapseVelocityPx = resources.getDimension(0x7f0d0021);
        mFlingExpandMinVelocityPx = resources.getDimension(0x7f0d0022);
        mFlingCollapseMinVelocityPx = resources.getDimension(0x7f0d0023);
        mCollapseMinDisplayFraction = resources.getFraction(0x7f0d0027, 1, 1);
        mExpandMinDisplayFraction = resources.getFraction(0x7f0d0028, 1, 1);
        mExpandAccelPx = resources.getDimension(0x7f0d0029);
        mCollapseAccelPx = resources.getDimension(0x7f0d002a);
        mFlingGestureMaxXVelocityPx = resources.getDimension(0x7f0d0024);
        mFlingGestureMaxOutputVelocityPx = resources.getDimension(0x7f0d0025);
        mNotificationPanelMarginBottomPx = (int)resources.getDimension(0x7f0d0038);
        mNotificationPanelMarginPx = (int)resources.getDimension(0x7f0d0039);
        mNotificationPanelGravity = resources.getInteger(0x7f0c000f);
        if (mNotificationPanelGravity <= 0)
            mNotificationPanelGravity = 51;
        mSettingsPanelGravity = resources.getInteger(0x7f0c0010);
        if (mSettingsPanelGravity <= 0)
            mSettingsPanelGravity = 53;
        mCarrierLabelHeight = resources.getDimensionPixelSize(0x7f0d003c);
        mNotificationHeaderHeight = resources.getDimensionPixelSize(0x7f0d0035);
        mToolBarViewHeight = resources.getDimensionPixelSize(0x7f0d0058);
        mNotificationPanelMinHeightFrac = resources.getFraction(0x7f0d0040, 1, 1);
        if (mNotificationPanelMinHeightFrac < 0.0F || mNotificationPanelMinHeightFrac > 1.0F)
            mNotificationPanelMinHeightFrac = 0.0F;
    }

    void makeExpandedInvisible()
    {
        if (mExpandedVisible)
        {
            mStatusBarView.collapseAllPanels(false);
            if (mHasFlipSettings)
            {
                if (mFlipSettingsViewAnim != null)
                    mFlipSettingsViewAnim.cancel();
                if (mScrollViewAnim != null)
                    mScrollViewAnim.cancel();
                if (mSettingsButtonAnim != null)
                    mSettingsButtonAnim.cancel();
                if (mNotificationButtonAnim != null)
                    mNotificationButtonAnim.cancel();
                if (mClearButtonAnim != null)
                    mClearButtonAnim.cancel();
                mScrollView.setScaleX(1.0F);
                mScrollView.setVisibility(0);
                mSettingsButton.setAlpha(1.0F);
                mSettingsButton.setVisibility(0);
                mNotificationPanel.setVisibility(8);
                mFlipSettingsView.setVisibility(8);
                mNotificationButton.setVisibility(8);
                if (mToolBarView.mSimSwitchPanelView.isPanelShowing())
                    mToolBarSwitchPanel.setVisibility(0);
                if (mHeaderSettingsButton != null)
                    mHeaderSettingsButton.setVisibility(8);
                setAreThereNotifications();
            }
            mExpandedVisible = false;
            super.mPile.setLayoutTransitionsEnabled(false);
            if (mNavigationBarView != null)
                mNavigationBarView.setSlippery(false);
            visibilityChanged(false);
            android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mStatusBarWindow.getLayoutParams();
            layoutparams.height = getStatusBarHeight();
            layoutparams.flags = 8 | layoutparams.flags;
            layoutparams.flags = 0xfffdffff & layoutparams.flags;
            super.mWindowManager.updateViewLayout(mStatusBarWindow, layoutparams);
            if ((0x20000 & mDisabled) == 0)
                setNotificationIconVisibility(true, 0x10a0000);
            mToolBarView.dismissDialogs();
            if (mQS != null)
                mQS.dismissDialogs();
            if (mAppGuideDialog != null && mAppGuideDialog.isShowing())
            {
                mAppGuideDialog.dismiss();
                Xlog.d("PhoneStatusBar", "performCollapse dismiss mAppGuideDialog");
            }
            dismissPopups();
            if (mPostCollapseCleanup != null)
            {
                mPostCollapseCleanup.run();
                mPostCollapseCleanup = null;
                return;
            }
        }
    }

    void makeExpandedInvisibleSoon()
    {
        super.mHandler.postDelayed(new Runnable() {

            final PhoneStatusBar this$0;

            public void run()
            {
                makeExpandedInvisible();
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
, 50L);
    }

    void makeExpandedVisible(boolean flag)
    {
        if (mExpandedVisible)
            return;
        mExpandedVisible = true;
        super.mPile.setLayoutTransitionsEnabled(true);
        if (mNavigationBarView != null)
            mNavigationBarView.setSlippery(true);
        updateCarrierLabelVisibility(true);
        updateExpandedViewPos(-10000);
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mStatusBarWindow.getLayoutParams();
        layoutparams.flags = -9 & layoutparams.flags;
        layoutparams.flags = 0x20000 | layoutparams.flags;
        layoutparams.height = -1;
        super.mWindowManager.updateViewLayout(mStatusBarWindow, layoutparams);
        if (!flag);
        if (mDateView != null)
            mDateView.updateClock();
        visibilityChanged(true);
    }

    protected PhoneStatusBarView makeStatusBarView()
    {
        Context context = super.mContext;
        Resources resources = context.getResources();
        Configuration configuration = resources.getConfiguration();
        mPreviousConfigFontScale = configuration.fontScale;
        mPrevioutConfigOrientation = configuration.orientation;
        updateDisplaySize();
        loadDimens();
        updateAirplaneMode();
        mIconSize = resources.getDimensionPixelSize(0x1050010);
        mStatusBarWindow = (StatusBarWindowView)View.inflate(context, 0x7f04000d, null);
        mStatusBarView = (PhoneStatusBarView)mStatusBarWindow.findViewById(0x7f080026);
        mStatusBarWindow.mService = this;
        mStatusBarWindow.setOnTouchListener(new android.view.View.OnTouchListener() {

            final PhoneStatusBar this$0;

            public boolean onTouch(View view3, MotionEvent motionevent)
            {
                if (motionevent.getAction() == 0 && mExpandedVisible && !mAnimating)
                    animateCollapsePanels();
                return mStatusBarWindow.onTouchEvent(motionevent);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
);
        mStatusBarView.setBar(this);
        PanelHolder panelholder = (PanelHolder)mStatusBarWindow.findViewById(0x7f08003c);
        mStatusBarView.setPanelHolder(panelholder);
        mNotificationPanel = (NotificationPanelView)mStatusBarWindow.findViewById(0x7f080036);
        mNotificationPanel.setStatusBar(this);
        boolean flag;
        ToolBarIndicator toolbarindicator;
        boolean flag1;
        boolean flag2;
        if (mNotificationPanel.getLayoutParams().width == -1)
            flag = true;
        else
            flag = false;
        mNotificationPanelIsFullScreenWidth = flag;
        mNotificationPanel.findViewById(0x7f08000d).setOnTouchListener(new android.view.View.OnTouchListener() {

            final PhoneStatusBar this$0;

            public boolean onTouch(View view3, MotionEvent motionevent)
            {
                return true;
            }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
        }
);
        mStatusBarWindow.setBackground(null);
        if (!ActivityManager.isHighEndGfx())
            mNotificationPanel.setBackground(new FastColorDrawable(context.getResources().getColor(0x7f090000)));
        updateShowSearchHoldoff();
        try
        {
            if (super.mWindowManagerService.hasNavigationBar())
            {
                mNavigationBarView = (NavigationBarView)View.inflate(context, 0x7f040010, null);
                mNavigationBarView.setDisabledFlags(mDisabled);
                mNavigationBarView.setBar(this);
            }
        }
        catch (RemoteException remoteexception) { }
        mPixelFormat = -1;
        mSystemIconArea = (LinearLayout)mStatusBarView.findViewById(0x7f08002c);
        mStatusIcons = (LinearLayout)mStatusBarView.findViewById(0x7f08002d);
        mNotificationIcons = (IconMerger)mStatusBarView.findViewById(0x7f08002b);
        mNotificationIcons.setOverflowIndicator(mMoreIcon);
        mStatusBarContents = (LinearLayout)mStatusBarView.findViewById(0x7f080028);
        mTickerView = mStatusBarView.findViewById(0x7f080033);
        mToolBarSwitchPanel = mStatusBarWindow.findViewById(0x7f080038);
        mToolBarView = (ToolBarView)mStatusBarWindow.findViewById(0x7f080127);
        toolbarindicator = (ToolBarIndicator)mStatusBarWindow.findViewById(0x7f080121);
        mToolBarView.setStatusBarService(this);
        mToolBarView.setToolBarSwitchPanel(mToolBarSwitchPanel);
        mToolBarView.setScrollToScreenCallback(toolbarindicator);
        mToolBarView.setToolBarIndicator(toolbarindicator);
        mToolBarView.hideSimSwithPanel();
        mToolBarView.moveToDefaultScreen(false);
        mSimIndicatorIcon = (ImageView)mStatusBarView.findViewById(0x7f080016);
        super.mPile = (NotificationRowLayout)mStatusBarWindow.findViewById(0x7f08003b);
        super.mPile.setLayoutTransitionsEnabled(false);
        super.mPile.setLongPressListener(getNotificationLongClicker());
        mExpandedContents = super.mPile;
        mNotificationPanelHeader = mStatusBarWindow.findViewById(0x7f08000d);
        mClearButton = mStatusBarWindow.findViewById(0x7f0800ae);
        mClearButton.setOnClickListener(mClearButtonListener);
        mClearButton.setAlpha(0.0F);
        mClearButton.setVisibility(8);
        mClearButton.setEnabled(false);
        mDateView = (DateView)mStatusBarWindow.findViewById(0x7f0800ab);
        mHasSettingsPanel = resources.getBoolean(0x7f0a0009);
        mHasFlipSettings = resources.getBoolean(0x7f0a000a);
        mDateTimeView = mNotificationPanelHeader.findViewById(0x7f0800aa);
        if (mHasFlipSettings)
        {
            mDateTimeView.setOnClickListener(mClockClickListener);
            mDateTimeView.setEnabled(true);
        }
        mSettingsButton = (ImageView)mStatusBarWindow.findViewById(0x7f0800b0);
        if (mSettingsButton != null)
        {
            mSettingsButton.setOnClickListener(mSettingsButtonListener);
            if (mHasSettingsPanel)
            {
                mHeaderSettingsButton = mStatusBarWindow.findViewById(0x7f0800ad);
                mHeaderSettingsButton.setOnClickListener(mHeaderSettingsButtonListener);
                SignalClusterViewGemini signalclusterviewgemini;
                IntentFilter intentfilter;
                IntentFilter intentfilter1;
                IntentFilter intentfilter2;
                View view1;
                LinearLayout linearlayout;
                if (mStatusBarView.hasFullWidthNotifications())
                {
                    mSettingsButton.setImageResource(0x7f020028);
                    mSettingsButton.setVisibility(0);
                } else
                {
                    View view2 = mStatusBarWindow.findViewById(0x7f0800af);
                    if (view2 != null)
                        view2.setVisibility(8);
                }
            } else
            {
                mSettingsButton.setVisibility(0);
                mSettingsButton.setImageResource(0x7f020030);
            }
        }
        if (mHasFlipSettings)
        {
            mNotificationButton = (ImageView)mStatusBarWindow.findViewById(0x7f0800b1);
            if (mNotificationButton != null)
                mNotificationButton.setOnClickListener(mNotificationButtonListener);
        }
        mScrollView = (ScrollView)mStatusBarWindow.findViewById(0x7f08003a);
        mScrollView.setVerticalScrollBarEnabled(false);
        if (!mNotificationPanelIsFullScreenWidth)
            mScrollView.setSystemUiVisibility(0x8a0000);
        mTicker = new MyTicker(context, mStatusBarView);
        ((TickerView)mStatusBarView.findViewById(0x7f080035)).mTicker = mTicker;
        mEdgeBorder = resources.getDimensionPixelSize(0x7f0d0000);
        setAreThereNotifications();
        mLocationController = new LocationController(super.mContext);
        mBatteryController = new BatteryController(super.mContext);
        mBatteryController.addIconView((ImageView)mStatusBarView.findViewById(0x7f080031));
        mBatteryController.addLabelView((TextView)mStatusBarWindow.findViewById(0x7f080030));
        mBluetoothController = new BluetoothController(super.mContext);
        mCarrier1 = (CarrierLabelGemini)mStatusBarWindow.findViewById(0x7f080040);
        mCarrier2 = (CarrierLabelGemini)mStatusBarWindow.findViewById(0x7f080042);
        mCarrier3 = (CarrierLabelGemini)mStatusBarWindow.findViewById(0x7f080044);
        mCarrier4 = (CarrierLabelGemini)mStatusBarWindow.findViewById(0x7f080046);
        mCarrierDivider = mStatusBarWindow.findViewById(0x7f080041);
        mCarrierDivider2 = mStatusBarWindow.findViewById(0x7f080043);
        mCarrierDivider3 = mStatusBarWindow.findViewById(0x7f080045);
        mCarrierLabelGemini = (LinearLayout)mStatusBarWindow.findViewById(0x7f08003f);
        if (mCarrierLabelGemini != null)
            flag1 = true;
        else
            flag1 = false;
        mShowCarrierInPanel = flag1;
        if (mShowCarrierInPanel)
        {
            mCarrier1.setSlotId(0);
            mCarrier2.setSlotId(1);
            mCarrier3.setSlotId(2);
            mCarrier4.setSlotId(3);
        }
        mNetworkControllerGemini = new NetworkControllerGemini(super.mContext);
        signalclusterviewgemini = (SignalClusterViewGemini)mStatusBarView.findViewById(0x7f08002f);
        mNetworkControllerGemini.addSignalCluster(signalclusterviewgemini);
        signalclusterviewgemini.setNetworkControllerGemini(mNetworkControllerGemini);
        if (PhoneConstants.GEMINI_SIM_NUM == 2)
            mNetworkControllerGemini.setCarrierGemini(mCarrier1, mCarrier2, mCarrierDivider);
        else
        if (PhoneConstants.GEMINI_SIM_NUM == 3)
            mNetworkControllerGemini.setCarrierGemini(mCarrier1, mCarrier2, mCarrier3, mCarrierDivider, mCarrierDivider2);
        else
        if (PhoneConstants.GEMINI_SIM_NUM == 4)
            mNetworkControllerGemini.setCarrierGemini(mCarrier1, mCarrier2, mCarrier3, mCarrier4, mCarrierDivider, mCarrierDivider2, mCarrierDivider3);
        if (mShowCarrierInPanel)
        {
            linearlayout = mCarrierLabelGemini;
            int i;
            if (mCarrierLabelVisible)
                i = 0;
            else
                i = 4;
            linearlayout.setVisibility(i);
            mCarrier2.setVisibility(8);
            mCarrierDivider.setVisibility(8);
            super.mPile.setOnSizeChangedListener(new OnSizeChangedListener() {

                final PhoneStatusBar this$0;

                public void onSizeChanged(View view3, int j, int k, int l, int i1)
                {
                    updateCarrierLabelVisibility(false);
                }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
            }
);
        }
        if (mHasSettingsPanel)
        {
            if (mHasFlipSettings)
            {
                view1 = mStatusBarWindow.findViewById(0x7f080039);
                if (view1 != null)
                {
                    mFlipSettingsView = ((ViewStub)view1).inflate();
                    mFlipSettingsView.setVisibility(8);
                    mFlipSettingsView.setVerticalScrollBarEnabled(false);
                }
            } else
            {
                View view = mStatusBarWindow.findViewById(0x7f08003d);
                if (view != null)
                    mSettingsPanel = (SettingsPanelView)((ViewStub)view).inflate();
                else
                    mSettingsPanel = (SettingsPanelView)mStatusBarWindow.findViewById(0x7f080074);
                if (mSettingsPanel != null && !ActivityManager.isHighEndGfx())
                    mSettingsPanel.setBackground(new FastColorDrawable(context.getResources().getColor(0x7f090000)));
            }
            mSettingsContainer = (QuickSettingsContainerView)mStatusBarWindow.findViewById(0x7f08003e);
            if (mSettingsContainer != null)
            {
                mQS = new QuickSettings(super.mContext, mSettingsContainer);
                if (!mNotificationPanelIsFullScreenWidth)
                    mSettingsContainer.setSystemUiVisibility(0x180000);
                if (mSettingsPanel != null)
                    mSettingsPanel.setQuickSettings(mQS);
                mQS.setService(this);
                mQS.setBar(mStatusBarView);
                mQS.setup(mBatteryController);
            } else
            {
                mQS = null;
            }
        }
        if (Prefs.read(super.mContext).getBoolean("shown_quick_settings_help", false))
            flag2 = true;
        else
            flag2 = false;
        mClingShown = flag2;
        mClingShown = true;
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.SCREEN_ON");
        intentfilter.addAction("android.intent.action.SKIN_CHANGED");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        intentfilter.addAction("android.intent.action.ACTION_BOOT_IPO");
        intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        resetUserSetupObserver();
        intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        intentfilter1.addAction("android.intent.action.SIM_INSERTED_STATUS");
        intentfilter1.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter1.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter1.addAction("android.intent.action.ACTION_PREBOOT_IPO");
        context.registerReceiver(mSIMInfoReceiver, intentfilter1);
        mNeedRemoveKeys = new ArrayList();
        intentfilter2 = new IntentFilter();
        intentfilter2.addAction("android.intent.action.MEDIA_EJECT");
        intentfilter2.addAction("android.intent.action.MEDIA_MOUNTED");
        intentfilter2.addDataScheme("file");
        context.registerReceiver(mMediaEjectBroadcastReceiver, intentfilter2);
        return mStatusBarView;
    }

    void postStartTracing()
    {
        super.mHandler.postDelayed(mStartTracing, 3000L);
    }

    public void removeIcon(String s, int i, int j)
    {
        mStatusIcons.removeViewAt(j);
    }

    public void removeNotification(IBinder ibinder)
    {
        StatusBarNotification statusbarnotification = removeNotificationViews(ibinder);
        if (mNeedRemoveKeys.contains(ibinder))
            mNeedRemoveKeys.remove(ibinder);
        if (statusbarnotification != null)
        {
            mTicker.removeEntry(statusbarnotification);
            updateExpandedViewPos(-10000);
            if (super.mNotificationData.size() == 0 && !mAnimating)
                animateCollapsePanels();
        }
        setAreThereNotifications();
    }

    protected void setAreThereNotifications()
    {
        float f = 1.0F;
        int i = 1;
        int j;
        if (super.mNotificationData.size() > 0)
            j = i;
        else
            j = 0;
        boolean flag;
        if (j != 0 && super.mNotificationData.hasClearableItems())
            flag = i;
        else
            flag = false;
        if (mHasFlipSettings && mFlipSettingsView != null && mFlipSettingsView.getVisibility() == 0 && mScrollView.getVisibility() != 0)
            mClearButton.setVisibility(8);
        else
        if (mClearButton.isShown())
        {
            int i1;
            if (mClearButton.getAlpha() == f)
                i1 = i;
            else
                i1 = 0;
            if (flag != i1)
            {
                View view2 = mClearButton;
                float af[] = new float[i];
                float f2;
                if (flag)
                    f2 = f;
                else
                    f2 = 0.0F;
                af[0] = f2;
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(view2, "alpha", af).setDuration(250L);
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final PhoneStatusBar this$0;

                    public void onAnimationEnd(Animator animator)
                    {
                        if (mClearButton.getAlpha() <= 0.0F)
                            mClearButton.setVisibility(8);
                    }

                    public void onAnimationStart(Animator animator)
                    {
                        if (mClearButton.getAlpha() <= 0.0F)
                            mClearButton.setVisibility(0);
                    }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
                }
);
                objectanimator.start();
            }
        } else
        {
            View view = mClearButton;
            float f1;
            if (flag)
                f1 = f;
            else
                f1 = 0.0F;
            view.setAlpha(f1);
            View view1 = mClearButton;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            view1.setVisibility(byte0);
        }
        mClearButton.setEnabled(flag);
        final View nlo = mStatusBarView.findViewById(0x7f080027);
        int k;
        if (j != 0 && !areLightsOn())
            k = i;
        else
            k = 0;
        if (nlo.getAlpha() != f)
            i = 0;
        if (k != i)
        {
            if (k != 0)
            {
                nlo.setAlpha(0.0F);
                nlo.setVisibility(0);
            }
            ViewPropertyAnimator viewpropertyanimator = nlo.animate();
            if (k == 0)
                f = 0.0F;
            ViewPropertyAnimator viewpropertyanimator1 = viewpropertyanimator.alpha(f);
            long l;
            if (k != 0)
                l = 750L;
            else
                l = 250L;
            ViewPropertyAnimator viewpropertyanimator2 = viewpropertyanimator1.setDuration(l).setInterpolator(new AccelerateInterpolator(2.0F));
            AnimatorListenerAdapter animatorlisteneradapter;
            if (k != 0)
                animatorlisteneradapter = null;
            else
                animatorlisteneradapter = new AnimatorListenerAdapter() {

                    final PhoneStatusBar this$0;
                    final View val$nlo;

                    public void onAnimationEnd(Animator animator)
                    {
                        nlo.setVisibility(8);
                    }

            
            {
                this$0 = PhoneStatusBar.this;
                nlo = view;
                super();
            }
                }
;
            viewpropertyanimator2.setListener(animatorlisteneradapter).start();
        }
        updateCarrierLabelVisibility(false);
    }

    public void setHardKeyboardStatus(boolean flag, boolean flag1)
    {
    }

    public void setImeWindowStatus(IBinder ibinder, int i, int j)
    {
        boolean flag = true;
        boolean flag1;
        if (j != 2 && (i & 2) == 0)
            flag1 = false;
        else
            flag1 = flag;
        CommandQueue commandqueue = super.mCommandQueue;
        int k;
        if (flag1)
            k = 8 | mNavigationIconHints;
        else
            k = -9 & mNavigationIconHints;
        commandqueue.setNavigationIconHints(k);
        if (mQS != null)
        {
            QuickSettings quicksettings = mQS;
            if (i <= 0)
                flag = false;
            quicksettings.setImeWindowStatus(flag);
        }
    }

    public void setLightsOn(boolean flag)
    {
        Log.v("PhoneStatusBar", (new StringBuilder()).append("setLightsOn(").append(flag).append(")").toString());
        if (flag)
        {
            setSystemUiVisibility(0, 1);
            return;
        } else
        {
            setSystemUiVisibility(1, 1);
            return;
        }
    }

    public void setNavigationIconHints(int i)
    {
        if (i != mNavigationIconHints)
        {
            mNavigationIconHints = i;
            if (mNavigationBarView != null)
            {
                mNavigationBarView.setNavigationIconHints(i);
                return;
            }
        }
    }

    void setNotificationIconVisibility(boolean flag, int i)
    {
        int j = mNotificationIcons.getVisibility();
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 4;
        if (j != byte0)
        {
            mNotificationIcons.setVisibility(byte0);
            mNotificationIcons.startAnimation(loadAnim(i, null));
        }
    }

    public void setSystemUiVisibility(int i, int j)
    {
        int k = mSystemUiVisibility;
        int l = k & ~j | i & j;
        int i1 = l ^ k;
        if (i1 != 0)
        {
            mSystemUiVisibility = l;
            if ((i1 & 1) != 0)
            {
                boolean flag;
                if ((i & 1) != 0)
                    flag = true;
                else
                    flag = false;
                if (flag)
                {
                    animateCollapsePanels();
                    if (mTicking)
                        haltTicker();
                }
                if (mNavigationBarView != null)
                    mNavigationBarView.setLowProfile(flag);
                setStatusBarLowProfile(flag);
            }
            notifyUiVisibilityChanged();
        }
    }

    public Animator setVisibilityWhenDone(Animator animator, final View v, final int vis)
    {
        animator.addListener(new AnimatorListenerAdapter() {

            final PhoneStatusBar this$0;
            final View val$v;
            final int val$vis;

            public void onAnimationEnd(Animator animator1)
            {
                v.setVisibility(vis);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                v = view;
                vis = i;
                super();
            }
        }
);
        return animator;
    }

    public ViewPropertyAnimator setVisibilityWhenDone(final ViewPropertyAnimator a, final View v, final int vis)
    {
        a.setListener(new AnimatorListenerAdapter() {

            final PhoneStatusBar this$0;
            final ViewPropertyAnimator val$a;
            final View val$v;
            final int val$vis;

            public void onAnimationEnd(Animator animator)
            {
                v.setVisibility(vis);
                a.setListener(null);
            }

            
            {
                this$0 = PhoneStatusBar.this;
                v = view;
                vis = i;
                a = viewpropertyanimator;
                super();
            }
        }
);
        return a;
    }

    protected boolean shouldDisableNavbarGestures()
    {
        return !isDeviceProvisioned() || mExpandedVisible || (0x2000000 & mDisabled) != 0;
    }

    public void showApplicationGuide(String s)
    {
        SharedPreferences sharedpreferences = super.mContext.getSharedPreferences("settings", 0);
        mAppName = s;
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("showApplicationGuide appName = ").append(s).toString());
        if ("MMS".equals(s) && "1".equals(sharedpreferences.getString("mms_show_guide", "1")))
        {
            createAndShowAppGuideDialog();
        } else
        {
            if ("PHONE".equals(s) && "1".equals(sharedpreferences.getString("phone_show_guide", "1")))
            {
                createAndShowAppGuideDialog();
                return;
            }
            if ("CONTACTS".equals(s) && "1".equals(sharedpreferences.getString("contacts_show_guide", "1")))
            {
                createAndShowAppGuideDialog();
                return;
            }
        }
    }

    public void showCling()
    {
        final ViewStub stub = (ViewStub)mStatusBarWindow.findViewById(0x7f080005);
        if (stub == null)
        {
            mClingShown = true;
            return;
        } else
        {
            mSuppressStatusBarDrags = true;
            super.mHandler.postDelayed(new Runnable() {

                final PhoneStatusBar this$0;
                final ViewStub val$stub;

                public void run()
                {
                    mCling = (ViewGroup)stub.inflate();
                    mCling.setOnTouchListener(new android.view.View.OnTouchListener() {

                        final _cls21 this$1;

                        public boolean onTouch(View view, MotionEvent motionevent)
                        {
                            return true;
                        }

            
            {
                this$1 = _cls21.this;
                super();
            }
                    }
);
                    mCling.findViewById(0x7f0800b3).setOnClickListener(new android.view.View.OnClickListener() {

                        final _cls21 this$1;

                        public void onClick(View view)
                        {
                            hideCling();
                        }

            
            {
                this$1 = _cls21.this;
                super();
            }
                    }
);
                    mCling.setAlpha(0.0F);
                    mCling.setVisibility(0);
                    mCling.animate().alpha(1.0F);
                    mClingShown = true;
                    android.content.SharedPreferences.Editor editor = Prefs.edit(mContext);
                    editor.putBoolean("shown_quick_settings_help", true);
                    editor.apply();
                    makeExpandedVisible(true);
                    animateExpandNotificationsPanel();
                    mSuppressStatusBarDrags = false;
                }

            
            {
                this$0 = PhoneStatusBar.this;
                stub = viewstub;
                super();
            }
            }
, 500L);
            animateExpandNotificationsPanel();
            return;
        }
    }

    public void showClock(boolean flag)
    {
        if (mStatusBarView != null)
        {
            View view = mStatusBarView.findViewById(0x7f080032);
            if (view != null)
            {
                byte byte0;
                if (flag)
                    byte0 = 0;
                else
                    byte0 = 8;
                view.setVisibility(byte0);
                return;
            }
        }
    }

    public void showSearchPanel()
    {
        showSearchPanel();
        super.mHandler.removeCallbacks(mShowSearchPanel);
        super.mSearchPanelView.setSystemUiVisibility(mSystemUiVisibility);
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mNavigationBarView.getLayoutParams();
        layoutparams.flags = 0xffffffdf & layoutparams.flags;
        super.mWindowManager.updateViewLayout(mNavigationBarView, layoutparams);
    }

    public void showSimIndicator(String s)
    {
        long l;
        if (mIsSimIndicatorShowing)
            hideSimIndicator();
        mBusinessType = s;
        l = SIMHelper.getDefaultSIM(super.mContext, s);
        Xlog.d("PhoneStatusBar", (new StringBuilder()).append("showSimIndicator, show SIM indicator which business is ").append(s).append("  simId = ").append(l).append(".").toString());
        if (l != -1L) goto _L2; else goto _L1
_L1:
        List list2 = SIMHelper.getSIMInfoList(super.mContext);
        if (list2 != null && list2.size() > 0)
        {
            showAlwaysAskOrInternetCall(l);
            mToolBarView.showSimSwithPanel(s);
        }
          goto _L3
_L2:
        if (!s.equals("voice_call_sim_setting") || l != -2L) goto _L5; else goto _L4
_L4:
        showAlwaysAskOrInternetCall(l);
        mToolBarView.showSimSwithPanel(s);
          goto _L3
_L5:
        if (l != -3L) goto _L7; else goto _L6
_L6:
        List list1 = SIMHelper.getSIMInfoList(super.mContext);
        if (list1 != null && list1.size() > 0)
        {
            showAlwaysAskOrInternetCall(l);
            mToolBarView.showSimSwithPanel(s);
        }
          goto _L3
_L7:
        List list;
        mSimIndicatorIconShow = false;
        list = SIMHelper.getSIMInfoList(super.mContext);
        if (list == null) goto _L9; else goto _L8
_L8:
        int i = 0;
_L15:
        int j;
        int k;
        j = list.size();
        k = 0;
        if (i >= j) goto _L11; else goto _L10
_L10:
        if (((com.mediatek.telephony.SimInfoManager.SimInfoRecord)list.get(i)).mSimInfoId != l) goto _L13; else goto _L12
_L12:
        k = ((com.mediatek.telephony.SimInfoManager.SimInfoRecord)list.get(i)).mSimSlotId;
_L11:
        if (list.size() == 1)
        {
            if (s.equals("voice_call_sim_setting") && isInternetCallEnabled(super.mContext))
            {
                mNetworkControllerGemini.showSimIndicator(k);
                mToolBarView.showSimSwithPanel(s);
            }
        } else
        if (list.size() > 1)
        {
            mNetworkControllerGemini.showSimIndicator(k);
            mToolBarView.showSimSwithPanel(s);
        }
_L3:
        mIsSimIndicatorShowing = true;
_L9:
        return;
_L13:
        i++;
        if (true) goto _L15; else goto _L14
_L14:
    }

    public Animator start(Animator animator)
    {
        animator.start();
        return animator;
    }

    public void start()
    {
        mDisplay = ((WindowManager)super.mContext.getSystemService("window")).getDefaultDisplay();
        mDreamManager = android.service.dreams.IDreamManager.Stub.asInterface(ServiceManager.checkService("dreams"));
        start();
        addNavigationBar();
        mIconPolicy = new PhoneStatusBarPolicy(super.mContext);
    }

    public void startActivityDismissingKeyguard(Intent intent, boolean flag)
    {
        if (flag && !isDeviceProvisioned())
            return;
        try
        {
            ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
        }
        catch (RemoteException remoteexception) { }
        intent.setFlags(0x14000000);
        super.mContext.startActivityAsUser(intent, new UserHandle(-2));
        animateCollapsePanels();
    }

    public Animator startDelay(int i, Animator animator)
    {
        animator.setStartDelay(i);
        return animator;
    }

    public void switchToSettings()
    {
        if (!mUserSetup)
            return;
        mFlipSettingsView.setScaleX(1.0F);
        mFlipSettingsView.setVisibility(0);
        mSettingsButton.setVisibility(8);
        mScrollView.setVisibility(8);
        mScrollView.setScaleX(0.0F);
        mNotificationButton.setVisibility(0);
        mNotificationButton.setAlpha(1.0F);
        mClearButton.setVisibility(8);
        if (mHeaderSettingsButton != null)
            mHeaderSettingsButton.setVisibility(0);
        mToolBarSwitchPanel.setVisibility(8);
    }

    protected void tick(IBinder ibinder, StatusBarNotification statusbarnotification, boolean flag)
    {
        if (areLightsOn() && isDeviceProvisioned() && notificationIsForCurrentUser(statusbarnotification) && statusbarnotification.notification.tickerText != null && mStatusBarWindow.getWindowToken() != null && (0xa0000 & mDisabled) == 0)
        {
            mTicker.addEntry(statusbarnotification);
            return;
        } else
        {
            return;
        }
    }

    public void topAppWindowChanged(boolean flag)
    {
        if (mNavigationBarView != null)
            mNavigationBarView.setMenuVisibility(flag);
        if (flag)
            setLightsOn(true);
    }

    protected void updateCarrierLabelVisibility(boolean flag)
    {
        if (mShowCarrierInPanel)
        {
            if (mEmergencyCallLabel != null);
            int i;
            if (mToolBarSwitchPanel.getVisibility() == 0)
                i = (int)mNotificationPanel.getExpandedHeight() - mCarrierLabelHeight - mNotificationHeaderHeight - mToolBarViewHeight;
            else
                i = (int)mNotificationPanel.getExpandedHeight() - mCarrierLabelHeight - mNotificationHeaderHeight;
            boolean flag1;
            if (super.mPile.getHeight() < i && mScrollView.getVisibility() == 0)
                flag1 = true;
            else
                flag1 = false;
            if (flag || mCarrierLabelVisible != flag1)
            {
                mCarrierLabelVisible = flag1;
                mCarrierLabelGemini.animate().cancel();
                if (flag1)
                    mCarrierLabelGemini.setVisibility(0);
                ViewPropertyAnimator viewpropertyanimator = mCarrierLabelGemini.animate();
                float f;
                if (flag1)
                    f = 1.0F;
                else
                    f = 0.0F;
                ViewPropertyAnimator viewpropertyanimator1 = viewpropertyanimator.alpha(f).setDuration(150L);
                AnimatorListenerAdapter animatorlisteneradapter;
                if (flag1)
                    animatorlisteneradapter = null;
                else
                    animatorlisteneradapter = new AnimatorListenerAdapter() {

                        final PhoneStatusBar this$0;

                        public void onAnimationEnd(Animator animator)
                        {
                            if (!mCarrierLabelVisible)
                            {
                                mCarrierLabelGemini.setVisibility(4);
                                mCarrierLabelGemini.setAlpha(0.0F);
                            }
                        }

            
            {
                this$0 = PhoneStatusBar.this;
                super();
            }
                    }
;
                viewpropertyanimator1.setListener(animatorlisteneradapter).start();
                return;
            }
        }
    }

    void updateDisplaySize()
    {
        mDisplay.getMetrics(mDisplayMetrics);
    }

    void updateExpandedInvisiblePosition()
    {
        mTrackingPosition = -mDisplayMetrics.heightPixels;
    }

    public void updateExpandedViewPos(int i)
    {
        mNotificationPanel.setMinimumHeight((int)(mNotificationPanelMinHeightFrac * (float)mCurrentDisplaySize.y));
        android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mNotificationPanel.getLayoutParams();
        layoutparams.gravity = mNotificationPanelGravity;
        layoutparams.leftMargin = mNotificationPanelMarginPx;
        mNotificationPanel.setLayoutParams(layoutparams);
        if (mSettingsPanel != null)
        {
            android.widget.FrameLayout.LayoutParams layoutparams1 = (android.widget.FrameLayout.LayoutParams)mSettingsPanel.getLayoutParams();
            layoutparams1.gravity = mSettingsPanelGravity;
            layoutparams1.rightMargin = mNotificationPanelMarginPx;
            mSettingsPanel.setLayoutParams(layoutparams1);
        }
        updateCarrierLabelVisibility(false);
    }

    public void updateIcon(String s, int i, int j, StatusBarIcon statusbaricon, StatusBarIcon statusbaricon1)
    {
        ((StatusBarIconView)mStatusIcons.getChildAt(j)).set(statusbaricon1);
    }

    protected void updateNotificationIcons()
    {
        if (mNotificationIcons != null)
        {
            loadNotificationShade();
            android.widget.LinearLayout.LayoutParams layoutparams = new LayoutParams(mIconSize + 2 * mIconHPadding, mNaturalBarHeight);
            int i = super.mNotificationData.size();
            ArrayList arraylist = new ArrayList();
            HashMap hashmap = new HashMap();
            boolean flag = isDeviceProvisioned();
            for (int j = 0; j < i; j++)
            {
                com.android.systemui.statusbar.NotificationData.Entry entry = super.mNotificationData.get(-1 + (i - j));
                if ((!flag || entry.notification.score < -10) && !showNotificationEvenIfUnprovisioned(entry.notification) || !notificationIsForCurrentUser(entry.notification))
                    continue;
                String s = (new StringBuilder()).append(entry.notification.pkg).append(String.valueOf(entry.notification.notification.icon)).toString();
                if (hashmap.containsKey(s) && ((Integer)hashmap.get(s)).intValue() == entry.notification.notification.iconLevel)
                {
                    Xlog.d("PhoneStatusBar", (new StringBuilder()).append("updateNotificationIcons(), IconMerger feature, skip pkg / icon / iconlevel =").append(entry.notification.pkg).append("/").append(entry.notification.notification.icon).append("/").append(entry.notification.notification.iconLevel).toString());
                } else
                {
                    arraylist.add(entry.icon);
                    hashmap.put(s, Integer.valueOf(entry.notification.notification.iconLevel));
                }
            }

            ArrayList arraylist1 = new ArrayList();
            for (int k = 0; k < mNotificationIcons.getChildCount(); k++)
            {
                View view2 = mNotificationIcons.getChildAt(k);
                if (!arraylist.contains(view2))
                    arraylist1.add(view2);
            }

            View view1;
            for (Iterator iterator = arraylist1.iterator(); iterator.hasNext(); mNotificationIcons.removeView(view1))
                view1 = (View)iterator.next();

            for (int l = 0; l < arraylist.size(); l++)
            {
                View view = (View)arraylist.get(l);
                if (view.getParent() == null)
                    mNotificationIcons.addView(view, l, layoutparams);
            }

        }
    }

    void updateResources()
    {
        Xlog.d("PhoneStatusBar", "updateResources");
        Context context = super.mContext;
        context.getResources();
        if (mClearButton instanceof TextView)
            ((TextView)mClearButton).setText(context.getText(0x7f0b003f));
        mToolBarView.updateResources();
        if (mQS != null)
            mQS.updateResources();
        loadDimens();
    }

    protected void updateSearchPanel()
    {
        updateSearchPanel();
        super.mSearchPanelView.setStatusBarView(mNavigationBarView);
        mNavigationBarView.setDelegateView(super.mSearchPanelView);
    }

    public void userSwitched(int i)
    {
        animateCollapsePanels();
        updateNotificationIcons();
        resetUserSetupObserver();
    }

    void vibrate()
    {
        ((Vibrator)super.mContext.getSystemService("vibrator")).vibrate(250L);
    }




/*
    static boolean access$102(PhoneStatusBar phonestatusbar, boolean flag)
    {
        phonestatusbar.mUserSetup = flag;
        return flag;
    }

*/



/*
    static StatusBarNotification access$1202(PhoneStatusBar phonestatusbar, StatusBarNotification statusbarnotification)
    {
        phonestatusbar.mCurrentlyIntrudingNotification = statusbarnotification;
        return statusbarnotification;
    }

*/



/*
    static ViewGroup access$1302(PhoneStatusBar phonestatusbar, ViewGroup viewgroup)
    {
        phonestatusbar.mCling = viewgroup;
        return viewgroup;
    }

*/


/*
    static boolean access$1402(PhoneStatusBar phonestatusbar, boolean flag)
    {
        phonestatusbar.mClingShown = flag;
        return flag;
    }

*/


/*
    static boolean access$1502(PhoneStatusBar phonestatusbar, boolean flag)
    {
        phonestatusbar.mSuppressStatusBarDrags = flag;
        return flag;
    }

*/


/*
    static boolean access$1602(PhoneStatusBar phonestatusbar, boolean flag)
    {
        phonestatusbar.mTicking = flag;
        return flag;
    }

*/























/*
    static int access$3502(PhoneStatusBar phonestatusbar, int i)
    {
        phonestatusbar.mPrevioutConfigOrientation = i;
        return i;
    }

*/















/*
    static View access$4702(PhoneStatusBar phonestatusbar, View view)
    {
        phonestatusbar.mAppGuideView = view;
        return view;
    }

*/



/*
    static Button access$4802(PhoneStatusBar phonestatusbar, Button button)
    {
        phonestatusbar.mAppGuideButton = button;
        return button;
    }

*/





/*
    static boolean access$5102(PhoneStatusBar phonestatusbar, boolean flag)
    {
        phonestatusbar.mAvoidSDAppAddNotification = flag;
        return flag;
    }

*/






    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$24$1

/* anonymous class */

    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$24$1$1

/* anonymous class */

    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$24$1$2

/* anonymous class */

    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$24$1$3

/* anonymous class */
    class _cls3
        implements Runnable
    {

        final _cls1 this$2;

        public void run()
        {
            animateCollapsePanels(0);
        }

            
            {
                this$2 = _cls1.this;
                super();
            }
    }


    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$32$1

/* anonymous class */
    class _cls1
        implements Runnable
    {

        final _cls32 this$1;
        final Context val$context;
        final Intent val$intent;

        public void run()
        {
            SIMHelper.updateSIMInfos(context);
            int i = intent.getIntExtra("type", -1);
            long l = intent.getLongExtra("simid", -1L);
            if (i == 0 || i == 1)
                updateNotificationsSimInfo(l);
            mToolBarView.updateSimInfos(intent);
            if (mQS != null)
                mQS.updateSimInfo(intent);
        }

            
            {
                this$1 = final__pcls32;
                context = context1;
                intent = Intent.this;
                super();
            }
    }


    // Unreferenced inner class com/android/systemui/statusbar/phone/PhoneStatusBar$32$2

/* anonymous class */
    class _cls2
        implements Runnable
    {

        final _cls32 this$1;
        final Context val$context;

        public void run()
        {
            SIMHelper.updateSIMInfos(context);
        }

            
            {
                this$1 = final__pcls32;
                context = Context.this;
                super();
            }
    }

}
