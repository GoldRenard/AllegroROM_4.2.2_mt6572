// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.animation.LayoutTransition;
import android.animation.ObjectAnimator;
import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.drawable.LayerDrawable;
import android.os.*;
import android.text.TextUtils;
import android.util.Slog;
import android.view.*;
import android.widget.*;
import com.android.internal.statusbar.*;
import com.android.systemui.SearchPanelView;
import com.android.systemui.SystemUI;
import com.android.systemui.statusbar.*;
import com.android.systemui.statusbar.policy.*;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            NotificationPanel, InputMethodButton, TabletStatusBarView, InputMethodsPanel, 
//            CompatModePanel, TabletTicker, NotificationIconArea, NotificationPeekPanel

public class TabletStatusBar extends BaseStatusBar
    implements InputMethodsPanel.OnHardKeyboardEnabledChangeListener
{
    private class H extends com.android.systemui.statusbar.BaseStatusBar.H
    {

        final TabletStatusBar this$0;

        public void handleMessage(Message message)
        {
            super.handleMessage(message);
            switch (message.what)
            {
            default:
                break;

            case 2000: 
                mTicker.halt();
                return;

            case 1031: 
                animateCollapsePanels();
                visibilityChanged(false);
                mBarContents.setVisibility(8);
                mShadow.setVisibility(0);
                int j = message | ((get) (this)).get;
                notifyUiVisibilityChanged();
                return;

            case 1030: 
                mBarContents.setVisibility(0);
                mShadow.setVisibility(8);
                int j = message & ((get) (this)).get;
                notifyUiVisibilityChanged();
                return;

            case 1051: 
                if (mCompatModePanel != null)
                {
                    mCompatModePanel.closePanel();
                    return;
                }
                break;

            case 1050: 
                if (mCompatModePanel != null)
                {
                    mCompatModePanel.openPanel();
                    return;
                }
                break;

            case 1041: 
                if (mInputMethodsPanel != null)
                {
                    mInputMethodsPanel.closePanel(false);
                    return;
                }
                break;

            case 1040: 
                if (mInputMethodsPanel != null)
                {
                    mInputMethodsPanel.openPanel();
                    return;
                }
                break;

            case 1001: 
                if (mNotificationPanel.isShowing())
                {
                    mNotificationPanel.show(false, true);
                    mNotificationArea.setVisibility(0);
                    return;
                }
                break;

            case 1000: 
                if (!mNotificationPanel.isShowing())
                {
                    mNotificationPanel.show(true, true);
                    mNotificationArea.setVisibility(4);
                    mTicker.halt();
                    return;
                }
                break;

            case 1003: 
                mNotificationPeekWindow.setVisibility(8);
                mNotificationPeekRow.removeAllViews();
                int k = 
// JavaClassFileOutputException: get_constant: invalid tag

        private H()
        {
            this$0 = TabletStatusBar.this;
            super(TabletStatusBar.this);
        }

    }

    private class NotificationTriggerTouchListener
        implements android.view.View.OnTouchListener
    {

        private Runnable mHiliteOnR;
        float mInitialTouchX;
        float mInitialTouchY;
        int mTouchSlop;
        VelocityTracker mVT;
        final TabletStatusBar this$0;

        public void hilite(boolean flag)
        {
            if (flag)
            {
                mNotificationArea.postDelayed(mHiliteOnR, 100L);
                return;
            } else
            {
                mNotificationArea.removeCallbacks(mHiliteOnR);
                mNotificationArea.setBackground(null);
                return;
            }
        }

        public boolean onTouch(View view, MotionEvent motionevent)
        {
            if ((0x10000 & mDisabled) == 0)
            {
                int i = motionevent.getAction();
                switch (i)
                {
                case 1: // '\001'
                case 3: // '\003'
                    hilite(false);
                    if (mVT != null)
                    {
                        if (i == 1 && Math.abs(motionevent.getX() - mInitialTouchX) < (float)mTouchSlop && Math.abs(motionevent.getY() - mInitialTouchY) < (float)(mTouchSlop / 3) && (int)motionevent.getY() < view.getBottom())
                        {
                            animateExpandNotificationsPanel();
                            visibilityChanged(true);
                            view.sendAccessibilityEvent(1);
                            view.playSoundEffect(0);
                        }
                        mVT.recycle();
                        mVT = null;
                        return true;
                    }
                    // fall through

                default:
                    return false;

                case 0: // '\0'
                    mVT = VelocityTracker.obtain();
                    mInitialTouchX = motionevent.getX();
                    mInitialTouchY = motionevent.getY();
                    hilite(true);
                    break;

                case 2: // '\002'
                case 4: // '\004'
                    break;
                }
                if (mVT != null)
                {
                    mVT.addMovement(motionevent);
                    mVT.computeCurrentVelocity(1000);
                    if (mVT.getYVelocity() < (float)(-mNotificationFlingVelocity))
                    {
                        animateExpandNotificationsPanel();
                        visibilityChanged(true);
                        hilite(false);
                        mVT.recycle();
                        mVT = null;
                        return true;
                    }
                }
            }
            return true;
        }

        public NotificationTriggerTouchListener()
        {
            this$0 = TabletStatusBar.this;
            super();
            mHiliteOnR = new _cls1();
            mTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        }
    }


    public static final boolean DEBUG = false;
    public static final boolean DEBUG_COMPAT_HELP = false;
    private static final boolean FAKE_SPACE_BAR = true;
    private static final int HIDE_ICONS_BELOW_SCORE = -10;
    public static final int MSG_CLOSE_COMPAT_MODE_PANEL = 1051;
    public static final int MSG_CLOSE_INPUT_METHODS_PANEL = 1041;
    public static final int MSG_CLOSE_NOTIFICATION_PANEL = 1001;
    public static final int MSG_CLOSE_NOTIFICATION_PEEK = 1003;
    public static final int MSG_HIDE_CHROME = 1031;
    public static final int MSG_OPEN_COMPAT_MODE_PANEL = 1050;
    public static final int MSG_OPEN_INPUT_METHODS_PANEL = 1040;
    public static final int MSG_OPEN_NOTIFICATION_PANEL = 1000;
    public static final int MSG_OPEN_NOTIFICATION_PEEK = 1002;
    public static final int MSG_SHOW_CHROME = 1030;
    public static final int MSG_STOP_TICKER = 2000;
    static final int NOTIFICATION_PEEK_FADE_DELAY = 3000;
    static final int NOTIFICATION_PEEK_HOLD_THRESH = 200;
    private static final int NOTIFICATION_PRIORITY_MULTIPLIER = 10;
    public static final String TAG = "TabletStatusBar";
    private boolean mAltBackButtonEnabledForIme;
    ImageView mBackButton;
    ViewGroup mBarContents;
    BatteryController mBatteryController;
    BluetoothController mBluetoothController;
    private BroadcastReceiver mBroadcastReceiver;
    CompatModeButton mCompatModeButton;
    private CompatModePanel mCompatModePanel;
    View mCompatibilityHelpDialog;
    int mDisabled;
    DoNotDisturb mDoNotDisturb;
    View mFakeSpaceBar;
    ViewGroup mFeedbackIconArea;
    View mHomeButton;
    private android.view.View.OnTouchListener mHomeSearchActionListener;
    int mIconHPadding;
    NotificationIconArea.IconLayout mIconLayout;
    int mIconSize;
    InputMethodButton mInputMethodSwitchButton;
    private InputMethodsPanel mInputMethodsPanel;
    LocationController mLocationController;
    private int mMaxNotificationIcons;
    View mMenuButton;
    int mMenuNavIconWidth;
    int mNaturalBarHeight;
    int mNavIconWidth;
    ViewGroup mNavigationArea;
    private int mNavigationIconHints;
    NetworkController mNetworkController;
    View mNotificationArea;
    com.android.systemui.statusbar.NotificationData.Entry mNotificationDNDDummyEntry;
    boolean mNotificationDNDMode;
    int mNotificationFlingVelocity;
    NotificationIconArea mNotificationIconArea;
    NotificationPanel mNotificationPanel;
    android.view.WindowManager.LayoutParams mNotificationPanelParams;
    int mNotificationPeekIndex;
    IBinder mNotificationPeekKey;
    ViewGroup mNotificationPeekRow;
    LayoutTransition mNotificationPeekScrubLeft;
    LayoutTransition mNotificationPeekScrubRight;
    int mNotificationPeekTapDuration;
    NotificationPeekPanel mNotificationPeekWindow;
    View mNotificationTrigger;
    private android.view.View.OnClickListener mOnClickListener;
    View mRecentButton;
    View mShadow;
    private int mShowSearchHoldoff;
    private Runnable mShowSearchPanel;
    KeyEvent mSpaceBarKeyEvent;
    TabletStatusBarView mStatusBarView;
    private int mSystemUiVisibility;
    TabletTicker mTicker;

    public TabletStatusBar()
    {
        mNaturalBarHeight = -1;
        mIconSize = -1;
        mIconHPadding = -1;
        mNavIconWidth = -1;
        mMenuNavIconWidth = -1;
        mMaxNotificationIcons = 5;
        mSpaceBarKeyEvent = null;
        mCompatibilityHelpDialog = null;
        mDisabled = 0;
        mSystemUiVisibility = 0;
        mNavigationIconHints = 0;
        mShowSearchHoldoff = 0;
        mShowSearchPanel = new Runnable() {

            final TabletStatusBar this$0;

            public void run()
            {
                showSearchPanel();
            }

            
            {
                this$0 = TabletStatusBar.this;
                super();
            }
        }
;
        mHomeSearchActionListener = new android.view.View.OnTouchListener() ;
        mOnClickListener = new android.view.View.OnClickListener() {

            final TabletStatusBar this$0;

            public void onClick(View view)
            {
                if (view == mRecentButton)
                {
                    onClickRecentButton();
                } else
                {
                    if (view == mInputMethodSwitchButton)
                    {
                        onClickInputMethodSwitchButton();
                        return;
                    }
                    if (view == mCompatModeButton)
                    {
                        onClickCompatModeButton();
                        return;
                    }
                }
            }

            
            {
                this$0 = TabletStatusBar.this;
                super();
            }
        }
;
        mBroadcastReceiver = new BroadcastReceiver() {

            final TabletStatusBar this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if ("android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s) || "android.intent.action.SCREEN_OFF".equals(s))
                {
                    boolean flag = "android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s);
                    int i = 0;
                    if (flag)
                    {
                        String s1 = intent.getStringExtra("reason");
                        i = 0;
                        if (s1 != null)
                        {
                            boolean flag1 = s1.equals("recentapps");
                            i = 0;
                            if (flag1)
                                i = 0 | 2;
                        }
                    }
                    animateCollapsePanels(i);
                }
            }

            
            {
                this$0 = TabletStatusBar.this;
                super();
            }
        }
;
    }

    private void addStatusBarWindow()
    {
        View view = makeStatusBarView();
        android.view.WindowManager.LayoutParams layoutparams = new LayoutParams(-1, -1, 2019, 0x800048, -1);
        layoutparams.gravity = getStatusBarGravity();
        layoutparams.setTitle("SystemBar");
        layoutparams.packageName = super.mContext.getPackageName();
        super.mWindowManager.addView(view, layoutparams);
    }

    private int getNotificationPanelHeight()
    {
        Resources resources = super.mContext.getResources();
        Display display = super.mWindowManager.getDefaultDisplay();
        Point point = new Point();
        display.getRealSize(point);
        return Math.max(resources.getDimensionPixelSize(0x7f0d004d), point.y);
    }

    private boolean hasTicker(Notification notification)
    {
        return notification.tickerView != null || !TextUtils.isEmpty(notification.tickerText);
    }

    private void hideCompatibilityHelp()
    {
        if (mCompatibilityHelpDialog != null)
        {
            super.mWindowManager.removeView(mCompatibilityHelpDialog);
            mCompatibilityHelpDialog = null;
        }
    }

    private boolean isImmersive()
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isTopActivityImmersive();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    private void loadNotificationPanel()
    {
        int i = super.mNotificationData.size();
        ArrayList arraylist = new ArrayList();
        boolean flag = isDeviceProvisioned();
        for (int j = 0; j < i; j++)
        {
            com.android.systemui.statusbar.NotificationData.Entry entry = super.mNotificationData.get(-1 + (i - j));
            if (flag || showNotificationEvenIfUnprovisioned(entry.notification))
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
                super.mPile.addView(view, Math.min((-1 + arraylist.size()) - l, super.mPile.getChildCount()));
        }

        mNotificationPanel.setNotificationCount(arraylist.size());
        mNotificationPanel.setSettingsEnabled(isDeviceProvisioned());
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

    private void reloadAllNotificationIcons()
    {
        if (mIconLayout == null)
        {
            return;
        } else
        {
            mIconLayout.removeAllViews();
            updateNotificationIcons();
            return;
        }
    }

    private void setNavigationVisibility(int i)
    {
        byte byte0 = 4;
        boolean flag = true;
        boolean flag1;
        if ((0x200000 & i) != 0)
            flag1 = flag;
        else
            flag1 = false;
        boolean flag2;
        if ((0x1000000 & i) != 0)
            flag2 = flag;
        else
            flag2 = false;
        boolean flag3;
        if ((0x400000 & i) != 0)
            flag3 = flag;
        else
            flag3 = false;
        ImageView imageview = mBackButton;
        byte byte1;
        if (flag3)
            byte1 = byte0;
        else
            byte1 = 0;
        imageview.setVisibility(byte1);
        View view = mHomeButton;
        byte byte2;
        if (flag1)
            byte2 = byte0;
        else
            byte2 = 0;
        view.setVisibility(byte2);
        View view1 = mRecentButton;
        if (!flag2)
            byte0 = 0;
        view1.setVisibility(byte0);
        InputMethodButton inputmethodbutton = mInputMethodSwitchButton;
        if ((0x100000 & i) == 0)
            flag = false;
        inputmethodbutton.setScreenLocked(flag);
    }

    private void showCompatibilityHelp()
    {
        if (mCompatibilityHelpDialog != null)
        {
            return;
        } else
        {
            mCompatibilityHelpDialog = View.inflate(super.mContext, 0x7f040003, null);
            mCompatibilityHelpDialog.findViewById(0x7f080011).setOnClickListener(new android.view.View.OnClickListener() {

                final TabletStatusBar this$0;

                public void onClick(View view)
                {
                    hideCompatibilityHelp();
                    android.content.SharedPreferences.Editor editor = Prefs.edit(mContext);
                    editor.putBoolean("shown_compat_mode_help", true);
                    editor.apply();
                }

            
            {
                this$0 = TabletStatusBar.this;
                super();
            }
            }
);
            android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -1, 2008, 0x20300, -3);
            layoutparams.setTitle("CompatibilityModeDialog");
            layoutparams.softInputMode = 49;
            layoutparams.windowAnimations = 0x10301eb;
            super.mWindowManager.addView(mCompatibilityHelpDialog, layoutparams);
            return;
        }
    }

    public void addIcon(String s, int i, int j, StatusBarIcon statusbaricon)
    {
    }

    public void addNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        addNotificationViews(ibinder, statusbarnotification);
        isImmersive();
        if (statusbarnotification.notification.fullScreenIntent != null)
        {
            Slog.w("TabletStatusBar", "Notification has fullScreenIntent and activity is not immersive; sending fullScreenIntent");
            try
            {
                statusbarnotification.notification.fullScreenIntent.send();
            }
            catch (android.app.PendingIntent.CanceledException canceledexception) { }
        } else
        {
            tick(ibinder, statusbarnotification, true);
        }
        setAreThereNotifications();
    }

    protected void addPanelWindows()
    {
        Context context = super.mContext;
        Resources resources = super.mContext.getResources();
        mNotificationPanel = (NotificationPanel)View.inflate(context, 0x7f040039, null);
        mNotificationPanel.setBar(this);
        mNotificationPanel.show(false, false);
        mNotificationPanel.setOnTouchListener(new com.android.systemui.statusbar.BaseStatusBar.TouchOutsideListener(this, 1001, mNotificationPanel));
        mBatteryController.addIconView((ImageView)mNotificationPanel.findViewById(0x7f080053));
        mBatteryController.addLabelView((TextView)mNotificationPanel.findViewById(0x7f0800f6));
        mBluetoothController.addIconView((ImageView)mNotificationPanel.findViewById(0x7f0800eb));
        ImageView imageview = (ImageView)mNotificationPanel.findViewById(0x7f080023);
        if (imageview != null)
            mNetworkController.addPhoneSignalIconView(imageview);
        ImageView imageview1 = (ImageView)mNotificationPanel.findViewById(0x7f08001c);
        if (imageview1 != null)
            mNetworkController.addWifiIconView(imageview1);
        mNetworkController.addWifiLabelView((TextView)mNotificationPanel.findViewById(0x7f0800f5));
        mNetworkController.addDataTypeIconView((ImageView)mNotificationPanel.findViewById(0x7f080025));
        mNetworkController.addMobileLabelView((TextView)mNotificationPanel.findViewById(0x7f0800f2));
        mNetworkController.addCombinedLabelView((TextView)mBarContents.findViewById(0x7f0800ea));
        mStatusBarView.setIgnoreChildren(0, mNotificationTrigger, mNotificationPanel);
        android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(resources.getDimensionPixelSize(0x7f0d0046), getNotificationPanelHeight(), 2024, 0x1820300, -3);
        mNotificationPanelParams = layoutparams;
        layoutparams.gravity = 85;
        layoutparams.setTitle("NotificationPanel");
        layoutparams.softInputMode = 49;
        layoutparams.windowAnimations = 0x1030000;
        super.mWindowManager.addView(mNotificationPanel, layoutparams);
        mStatusBarView.setBar(this);
        mHomeButton.setOnTouchListener(mHomeSearchActionListener);
        updateSearchPanel();
        mInputMethodsPanel = (InputMethodsPanel)View.inflate(context, 0x7f040036, null);
        mInputMethodsPanel.setHardKeyboardEnabledChangeListener(this);
        mInputMethodsPanel.setOnTouchListener(new com.android.systemui.statusbar.BaseStatusBar.TouchOutsideListener(this, 1041, mInputMethodsPanel));
        mInputMethodsPanel.setImeSwitchButton(mInputMethodSwitchButton);
        mStatusBarView.setIgnoreChildren(2, mInputMethodSwitchButton, mInputMethodsPanel);
        android.view.WindowManager.LayoutParams layoutparams1 = new android.view.WindowManager.LayoutParams(-2, -2, 2014, 0x1820100, -3);
        layoutparams1.gravity = 85;
        layoutparams1.setTitle("InputMethodsPanel");
        layoutparams1.windowAnimations = 0x7f0f0016;
        super.mWindowManager.addView(mInputMethodsPanel, layoutparams1);
        mCompatModePanel = (CompatModePanel)View.inflate(context, 0x7f040034, null);
        mCompatModePanel.setOnTouchListener(new com.android.systemui.statusbar.BaseStatusBar.TouchOutsideListener(this, 1051, mCompatModePanel));
        mCompatModePanel.setTrigger(mCompatModeButton);
        mCompatModePanel.setVisibility(8);
        mStatusBarView.setIgnoreChildren(3, mCompatModeButton, mCompatModePanel);
        android.view.WindowManager.LayoutParams layoutparams2 = new android.view.WindowManager.LayoutParams(250, -2, 2014, 0x1820100, -3);
        layoutparams2.gravity = 85;
        layoutparams2.setTitle("CompatModePanel");
        layoutparams2.windowAnimations = 0x1030002;
        super.mWindowManager.addView(mCompatModePanel, layoutparams2);
        mRecentButton.setOnTouchListener(super.mRecentsPreloadOnTouchListener);
        super.mPile = (NotificationRowLayout)mNotificationPanel.findViewById(0x7f0800b4);
        super.mPile.removeAllViews();
        super.mPile.setLongPressListener(getNotificationLongClicker());
        ((ScrollView)super.mPile.getParent()).setFillViewport(true);
    }

    public void animateCollapsePanels()
    {
        animateCollapsePanels(0);
    }

    public void animateCollapsePanels(int i)
    {
        if ((i & 4) == 0)
        {
            super.mHandler.removeMessages(1001);
            super.mHandler.sendEmptyMessage(1001);
        }
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
        if ((i & 8) == 0)
        {
            super.mHandler.removeMessages(1041);
            super.mHandler.sendEmptyMessage(1041);
        }
        if ((i & 0x10) == 0)
        {
            super.mHandler.removeMessages(1051);
            super.mHandler.sendEmptyMessage(1051);
        }
    }

    public void animateExpandNotificationsPanel()
    {
        super.mHandler.removeMessages(1000);
        super.mHandler.sendEmptyMessage(1000);
    }

    public void animateExpandSettingsPanel()
    {
    }

    public void clearAll()
    {
        try
        {
            super.mBarService.onClearAllNotifications();
        }
        catch (RemoteException remoteexception) { }
        animateCollapsePanels();
        visibilityChanged(false);
    }

    protected void createAndAddWindows()
    {
        addStatusBarWindow();
        addPanelWindows();
    }

    protected com.android.systemui.statusbar.BaseStatusBar.H createHandler()
    {
        return new H();
    }

    public void disable(int i)
    {
        int j = i ^ mDisabled;
        mDisabled = i;
        if ((0x800000 & j) != 0)
        {
            boolean flag1;
            if ((0x800000 & i) == 0)
                flag1 = true;
            else
                flag1 = false;
            StringBuilder stringbuilder3 = (new StringBuilder()).append("DISABLE_CLOCK: ");
            String s3;
            if (flag1)
                s3 = "no";
            else
                s3 = "yes";
            Slog.i("TabletStatusBar", stringbuilder3.append(s3).toString());
            showClock(flag1);
        }
        if ((0x100000 & j) != 0)
        {
            boolean flag;
            if ((0x100000 & i) == 0)
                flag = true;
            else
                flag = false;
            StringBuilder stringbuilder2 = (new StringBuilder()).append("DISABLE_SYSTEM_INFO: ");
            String s2;
            if (flag)
                s2 = "no";
            else
                s2 = "yes";
            Slog.i("TabletStatusBar", stringbuilder2.append(s2).toString());
            View view = mNotificationTrigger;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            view.setVisibility(byte0);
        }
        if ((j & 0x10000) != 0 && (i & 0x10000) != 0)
        {
            Slog.i("TabletStatusBar", "DISABLE_EXPAND: yes");
            animateCollapsePanels();
            visibilityChanged(false);
        }
        if ((j & 0x20000) != 0)
        {
            mNotificationDNDMode = Prefs.read(super.mContext).getBoolean("do_not_disturb", false);
            if ((i & 0x20000) != 0)
            {
                StringBuilder stringbuilder1 = (new StringBuilder()).append("DISABLE_NOTIFICATION_ICONS: yes");
                String s1;
                if (mNotificationDNDMode)
                    s1 = " (DND)";
                else
                    s1 = "";
                Slog.i("TabletStatusBar", stringbuilder1.append(s1).toString());
                mTicker.halt();
            } else
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("DISABLE_NOTIFICATION_ICONS: no");
                String s;
                if (mNotificationDNDMode)
                    s = " (DND)";
                else
                    s = "";
                Slog.i("TabletStatusBar", stringbuilder.append(s).toString());
            }
            reloadAllNotificationIcons();
        } else
        if ((0x80000 & j) != 0 && (0x80000 & i) != 0)
            mTicker.halt();
        if ((0x1600000 & j) != 0)
        {
            setNavigationVisibility(i);
            if ((0x1000000 & i) != 0)
            {
                super.mHandler.removeMessages(1021);
                super.mHandler.sendEmptyMessage(1021);
            }
        }
    }

    public void doneTicking()
    {
        mFeedbackIconArea.setVisibility(0);
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.print("mDisabled=0x");
        printwriter.println(Integer.toHexString(mDisabled));
        printwriter.println("mNetworkController:");
        mNetworkController.dump(filedescriptor, printwriter, as);
    }

    public Context getContext()
    {
        return super.mContext;
    }

    protected int getExpandedViewMaxHeight()
    {
        return getNotificationPanelHeight();
    }

    protected android.view.WindowManager.LayoutParams getRecentsLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        android.view.WindowManager.LayoutParams layoutparams1 = new android.view.WindowManager.LayoutParams((int)super.mContext.getResources().getDimension(0x7f0d004f), -1, 2024, 0x1820100, -3);
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
        android.view.WindowManager.LayoutParams layoutparams1 = new android.view.WindowManager.LayoutParams(-1, -1, 2024, 0x820100, byte0);
        if (ActivityManager.isHighEndGfx())
        {
            layoutparams1.flags = 0x1000000 | layoutparams1.flags;
        } else
        {
            layoutparams1.flags = 2 | layoutparams1.flags;
            layoutparams1.dimAmount = 0.7F;
        }
        layoutparams1.gravity = 83;
        layoutparams1.setTitle("SearchPanel");
        layoutparams1.windowAnimations = 0x10301ed;
        layoutparams1.softInputMode = 49;
        return layoutparams1;
    }

    protected int getStatusBarGravity()
    {
        return 87;
    }

    public int getStatusBarHeight()
    {
        if (mStatusBarView != null)
            return mStatusBarView.getHeight();
        else
            return super.mContext.getResources().getDimensionPixelSize(0x105000d);
    }

    public View getStatusBarView()
    {
        return mStatusBarView;
    }

    protected void haltTicker()
    {
        mTicker.halt();
    }

    public void hideSearchPanel()
    {
        super.hideSearchPanel();
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mStatusBarView.getLayoutParams();
        layoutparams.flags = 0x20 | layoutparams.flags;
        super.mWindowManager.updateViewLayout(mStatusBarView, layoutparams);
    }

    public void hideSimIndicator()
    {
    }

    public boolean isExpanded()
    {
        return false;
    }

    protected boolean isTopNotification(ViewGroup viewgroup, com.android.systemui.statusbar.NotificationData.Entry entry)
    {
        return viewgroup != null && entry != null && viewgroup.indexOfChild(entry.row) == -1 + viewgroup.getChildCount();
    }

    protected void loadDimens()
    {
        Resources resources = super.mContext.getResources();
        mNaturalBarHeight = resources.getDimensionPixelSize(0x105000d);
        int i = resources.getDimensionPixelSize(0x1050013);
        int j = resources.getDimensionPixelSize(0x7f0d001e);
        int k = resources.getDimensionPixelSize(0x7f0d002c);
        int l = resources.getDimensionPixelSize(0x7f0d002d);
        if (mNavigationArea != null && k != mNavIconWidth)
        {
            mNavIconWidth = k;
            android.widget.LinearLayout.LayoutParams layoutparams1 = new android.widget.LinearLayout.LayoutParams(mNavIconWidth, -1);
            mBackButton.setLayoutParams(layoutparams1);
            mHomeButton.setLayoutParams(layoutparams1);
            mRecentButton.setLayoutParams(layoutparams1);
        }
        if (mNavigationArea != null && l != mMenuNavIconWidth)
        {
            mMenuNavIconWidth = l;
            android.widget.LinearLayout.LayoutParams layoutparams = new android.widget.LinearLayout.LayoutParams(mMenuNavIconWidth, -1);
            mMenuButton.setLayoutParams(layoutparams);
        }
        if (j != mIconHPadding || i != mIconSize)
        {
            mIconHPadding = j;
            mIconSize = i;
            reloadAllNotificationIcons();
        }
        int i1 = resources.getInteger(0x7f0c0000);
        if (i1 != mMaxNotificationIcons)
        {
            mMaxNotificationIcons = i1;
            reloadAllNotificationIcons();
        }
    }

    protected View makeStatusBarView()
    {
        Context context = super.mContext;
        loadDimens();
        TabletStatusBarView tabletstatusbarview = (TabletStatusBarView)View.inflate(context, 0x7f040033, null);
        mStatusBarView = tabletstatusbarview;
        tabletstatusbarview.setHandler(super.mHandler);
        SignalClusterView signalclusterview;
        LayoutTransition layouttransition;
        LayoutTransition layouttransition1;
        LayoutTransition layouttransition2;
        IntentFilter intentfilter;
        try
        {
            if (super.mWindowManagerService.hasNavigationBar())
                Slog.e("TabletStatusBar", "Tablet device cannot show navigation bar and system bar");
        }
        catch (RemoteException remoteexception) { }
        mBarContents = (ViewGroup)tabletstatusbarview.findViewById(0x7f0800cb);
        mNotificationArea = tabletstatusbarview.findViewById(0x7f0800ce);
        mNotificationArea.setOnTouchListener(new NotificationTriggerTouchListener());
        mNotificationTrigger = tabletstatusbarview.findViewById(0x7f0800e9);
        mNotificationIconArea = (NotificationIconArea)tabletstatusbarview.findViewById(0x7f08004d);
        mIconLayout = (NotificationIconArea.IconLayout)tabletstatusbarview.findViewById(0x7f0800e8);
        mNotificationPeekTapDuration = ViewConfiguration.getTapTimeout();
        mNotificationFlingVelocity = 300;
        mTicker = new TabletTicker(this);
        mLocationController = new LocationController(super.mContext);
        mDoNotDisturb = new DoNotDisturb(super.mContext);
        mBatteryController = new BatteryController(super.mContext);
        mBatteryController.addIconView((ImageView)tabletstatusbarview.findViewById(0x7f080053));
        mBluetoothController = new BluetoothController(super.mContext);
        mBluetoothController.addIconView((ImageView)tabletstatusbarview.findViewById(0x7f0800eb));
        mNetworkController = new NetworkController(super.mContext);
        signalclusterview = (SignalClusterView)tabletstatusbarview.findViewById(0x7f080051);
        mNetworkController.addSignalCluster(signalclusterview);
        mBackButton = (ImageView)tabletstatusbarview.findViewById(0x7f080066);
        mNavigationArea = (ViewGroup)tabletstatusbarview.findViewById(0x7f0800cc);
        mHomeButton = mNavigationArea.findViewById(0x7f080067);
        mMenuButton = mNavigationArea.findViewById(0x7f080069);
        mRecentButton = mNavigationArea.findViewById(0x7f080068);
        mRecentButton.setOnClickListener(mOnClickListener);
        layouttransition = new LayoutTransition();
        layouttransition.setDuration(250L);
        layouttransition.setDuration(0, 0L);
        layouttransition.setDuration(1, 0L);
        layouttransition.addTransitionListener(new android.animation.LayoutTransition.TransitionListener() {

            final TabletStatusBar this$0;

            public void endTransition(LayoutTransition layouttransition3, ViewGroup viewgroup, View view, int i)
            {
                mBarContents.invalidate();
            }

            public void startTransition(LayoutTransition layouttransition3, ViewGroup viewgroup, View view, int i)
            {
            }

            
            {
                this$0 = TabletStatusBar.this;
                super();
            }
        }
);
        mNavigationArea.setLayoutTransition(layouttransition);
        mNavigationArea.setMotionEventSplittingEnabled(false);
        mFeedbackIconArea = (ViewGroup)tabletstatusbarview.findViewById(0x7f0800e5);
        mInputMethodSwitchButton = (InputMethodButton)tabletstatusbarview.findViewById(0x7f0800e6);
        mInputMethodSwitchButton.setOnClickListener(mOnClickListener);
        mCompatModeButton = (CompatModeButton)tabletstatusbarview.findViewById(0x7f0800e7);
        mCompatModeButton.setOnClickListener(mOnClickListener);
        mCompatModeButton.setVisibility(8);
        mFakeSpaceBar = tabletstatusbarview.findViewById(0x7f0800cd);
        mShadow = tabletstatusbarview.findViewById(0x7f0800d0);
        mShadow.setOnTouchListener(new android.view.View.OnTouchListener() );
        layouttransition1 = new LayoutTransition();
        layouttransition1.setAnimator(2, ObjectAnimator.ofFloat(null, "alpha", new float[] {
            0.5F, 1.0F
        }));
        layouttransition1.setDuration(2, 200L);
        layouttransition1.setStartDelay(2, 0L);
        layouttransition1.setAnimator(3, ObjectAnimator.ofFloat(null, "alpha", new float[] {
            1.0F, 0.0F
        }));
        layouttransition1.setDuration(3, 750L);
        layouttransition1.setStartDelay(3, 0L);
        ((ViewGroup)tabletstatusbarview.findViewById(0x7f0800ca)).setLayoutTransition(layouttransition1);
        layouttransition2 = new LayoutTransition();
        layouttransition2.setAnimator(2, ObjectAnimator.ofFloat(null, "alpha", new float[] {
            0.0F, 1.0F
        }));
        layouttransition2.setDuration(2, 750L);
        layouttransition2.setStartDelay(2, 0L);
        layouttransition2.setAnimator(3, ObjectAnimator.ofFloat(null, "alpha", new float[] {
            1.0F, 0.0F
        }));
        layouttransition2.setDuration(3, 0L);
        layouttransition2.setStartDelay(3, 0L);
        ((ViewGroup)tabletstatusbarview.findViewById(0x7f0800cf)).setLayoutTransition(layouttransition2);
        setAreThereNotifications();
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        return tabletstatusbarview;
    }

    public void onBarHeightChanged(int i)
    {
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mStatusBarView.getLayoutParams();
        if (layoutparams != null && ((android.view.ViewGroup.LayoutParams) (layoutparams)).height != i)
        {
            layoutparams.height = i;
            super.mWindowManager.updateViewLayout(mStatusBarView, layoutparams);
            return;
        } else
        {
            return;
        }
    }

    public void onClickCompatModeButton()
    {
        char c;
        if (mCompatModePanel.getVisibility() == 8)
            c = '\u041A';
        else
            c = '\u041B';
        super.mHandler.removeMessages(c);
        super.mHandler.sendEmptyMessage(c);
    }

    public void onClickInputMethodSwitchButton()
    {
        char c;
        if (mInputMethodsPanel.getVisibility() == 8)
            c = '\u0410';
        else
            c = '\u0411';
        super.mHandler.removeMessages(c);
        super.mHandler.sendEmptyMessage(c);
    }

    public void onClickRecentButton()
    {
        if ((0x10000 & mDisabled) == 0)
            toggleRecentApps();
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        loadDimens();
        mNotificationPanelParams.height = getNotificationPanelHeight();
        super.mWindowManager.updateViewLayout(mNotificationPanel, mNotificationPanelParams);
        mShowSearchHoldoff = super.mContext.getResources().getInteger(0x7f0c0001);
        updateSearchPanel();
    }

    public void onHardKeyboardEnabledChange(boolean flag)
    {
        try
        {
            super.mBarService.setHardKeyboardEnabled(flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void removeIcon(String s, int i, int j)
    {
    }

    public void removeNotification(IBinder ibinder)
    {
        removeNotificationViews(ibinder);
        mTicker.remove(ibinder);
        setAreThereNotifications();
    }

    public void resetNotificationPeekFadeTimer()
    {
        super.mHandler.removeMessages(1003);
        super.mHandler.sendEmptyMessageDelayed(1003, 3000L);
    }

    protected void setAreThereNotifications()
    {
        if (mNotificationPanel != null)
        {
            NotificationPanel notificationpanel = mNotificationPanel;
            boolean flag;
            if (isDeviceProvisioned() && super.mNotificationData.hasClearableItems())
                flag = true;
            else
                flag = false;
            notificationpanel.setClearable(flag);
        }
    }

    public void setHardKeyboardStatus(boolean flag, boolean flag1)
    {
        mInputMethodSwitchButton.setHardKeyboardStatus(flag);
        updateNotificationIcons();
        mInputMethodsPanel.setHardKeyboardStatus(flag, flag1);
    }

    public void setImeWindowStatus(IBinder ibinder, int i, int j)
    {
        InputMethodButton inputmethodbutton = mInputMethodSwitchButton;
        boolean flag;
        if ((i & 1) != 0)
            flag = true;
        else
            flag = false;
        inputmethodbutton.setImeWindowStatus(ibinder, flag);
        updateNotificationIcons();
        mInputMethodsPanel.setImeToken(ibinder);
        boolean flag1;
        if (j != 2 && (i & 2) == 0)
            flag1 = false;
        else
            flag1 = true;
        mAltBackButtonEnabledForIme = flag1;
        CommandQueue commandqueue = super.mCommandQueue;
        int k;
        if (flag1)
            k = 8 | mNavigationIconHints;
        else
            k = -9 & mNavigationIconHints;
        commandqueue.setNavigationIconHints(k);
        View view = mFakeSpaceBar;
        int l = i & 2;
        byte byte0 = 0;
        if (l == 0)
            byte0 = 8;
        view.setVisibility(byte0);
    }

    public void setLightsOn(boolean flag)
    {
        if (mMenuButton.getVisibility() == 0)
            flag = true;
        Slog.v("TabletStatusBar", (new StringBuilder()).append("setLightsOn(").append(flag).append(")").toString());
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
        float f = 0.5F;
        if (i == mNavigationIconHints)
            return;
        mNavigationIconHints = i;
        ImageView imageview = mBackButton;
        float f1;
        if ((i & 1) != 0)
            f1 = f;
        else
            f1 = 1.0F;
        imageview.setAlpha(f1);
        View view = mHomeButton;
        float f2;
        if ((i & 2) != 0)
            f2 = f;
        else
            f2 = 1.0F;
        view.setAlpha(f2);
        View view1 = mRecentButton;
        if ((i & 4) == 0)
            f = 1.0F;
        view1.setAlpha(f);
        ImageView imageview1 = mBackButton;
        int j;
        if ((i & 8) != 0)
            j = 0x7f0200c2;
        else
            j = 0x7f0200c1;
        imageview1.setImageResource(j);
    }

    public void setSystemUiVisibility(int i, int j)
    {
        char c = '\u0406';
        int k = mSystemUiVisibility;
        int l = k & ~j | i & j;
        int i1 = l ^ k;
        if (i1 != 0)
        {
            mSystemUiVisibility = l;
            if ((i1 & 1) != 0)
            {
                super.mHandler.removeMessages(1031);
                super.mHandler.removeMessages(c);
                com.android.systemui.statusbar.BaseStatusBar.H h = super.mHandler;
                if ((i & 1) != 0)
                    c = '\u0407';
                h.sendEmptyMessage(c);
            }
            notifyUiVisibilityChanged();
        }
    }

    protected boolean shouldDisableNavbarGestures()
    {
        return mNotificationPanel.getVisibility() == 0 || (0x200000 & mDisabled) != 0;
    }

    public void showApplicationGuide(String s)
    {
    }

    public void showClock(boolean flag)
    {
        View view = mBarContents.findViewById(0x7f080054);
        View view1 = mBarContents.findViewById(0x7f0800ea);
        if (view != null)
        {
            byte byte1;
            if (flag)
                byte1 = 0;
            else
                byte1 = 8;
            view.setVisibility(byte1);
        }
        if (view1 != null)
        {
            byte byte0 = 0;
            if (flag)
                byte0 = 8;
            view1.setVisibility(byte0);
        }
    }

    public void showSearchPanel()
    {
        showSearchPanel();
        android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)mStatusBarView.getLayoutParams();
        layoutparams.flags = 0xffffffdf & layoutparams.flags;
        super.mWindowManager.updateViewLayout(mStatusBarView, layoutparams);
    }

    public void showSimIndicator(String s)
    {
    }

    public void start()
    {
        start();
    }

    protected void tick(IBinder ibinder, StatusBarNotification statusbarnotification, boolean flag)
    {
        if (!mNotificationPanel.isShowing() && (flag || (8 & statusbarnotification.notification.flags) == 0) && hasTicker(statusbarnotification.notification) && mStatusBarView.getWindowToken() != null && (0xa0000 & mDisabled) == 0)
        {
            mTicker.add(ibinder, statusbarnotification);
            mFeedbackIconArea.setVisibility(8);
            return;
        } else
        {
            return;
        }
    }

    public void topAppWindowChanged(boolean flag)
    {
        View view = mMenuButton;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        view.setVisibility(byte0);
        if (flag)
            setLightsOn(true);
        mCompatModeButton.refresh();
        if (mCompatModeButton.getVisibility() == 0)
        {
            if (!Prefs.read(super.mContext).getBoolean("shown_compat_mode_help", false))
                showCompatibilityHelp();
            return;
        } else
        {
            hideCompatibilityHelp();
            mCompatModePanel.closePanel();
            return;
        }
    }

    protected void updateExpandedViewPos(int i)
    {
    }

    public void updateIcon(String s, int i, int j, StatusBarIcon statusbaricon, StatusBarIcon statusbaricon1)
    {
    }

    protected void updateNotificationIcons()
    {
        if (mIconLayout != null)
        {
            loadNotificationPanel();
            android.widget.LinearLayout.LayoutParams layoutparams = new LayoutParams(mIconSize + 2 * mIconHPadding, mNaturalBarHeight);
            if (mNotificationDNDMode)
            {
                if (mIconLayout.getChildCount() == 0)
                {
                    Notification notification = (new Builder(super.mContext)).setContentTitle(super.mContext.getText(0x7f0b00ae)).setContentText(super.mContext.getText(0x7f0b00af)).setSmallIcon(0x7f02001d).setOngoing(true).getNotification();
                    StatusBarIconView statusbariconview = new StatusBarIconView(super.mContext, "_dnd", notification);
                    statusbariconview.setImageResource(0x7f02001d);
                    statusbariconview.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
                    statusbariconview.setPadding(mIconHPadding, 0, mIconHPadding, 0);
                    com.android.systemui.statusbar.NotificationData.Entry entry1 = new Entry(null, new StatusBarNotification("", 0, "", 0, 0, 2, notification, Process.myUserHandle()), statusbariconview);
                    mNotificationDNDDummyEntry = entry1;
                    mIconLayout.addView(statusbariconview, layoutparams);
                    return;
                }
            } else
            if ((0x20000 & mDisabled) == 0)
            {
                int i = super.mNotificationData.size();
                ArrayList arraylist = new ArrayList();
                int j = mMaxNotificationIcons;
                if (mInputMethodSwitchButton.getVisibility() != 8)
                    j--;
                if (mCompatModeButton.getVisibility() != 8)
                    j--;
                boolean flag = isDeviceProvisioned();
                for (int k = 0; arraylist.size() < j && k < i; k++)
                {
                    com.android.systemui.statusbar.NotificationData.Entry entry = super.mNotificationData.get(-1 + (i - k));
                    if (flag && entry.notification.score >= -10 || showNotificationEvenIfUnprovisioned(entry.notification))
                        arraylist.add(entry.icon);
                }

                ArrayList arraylist1 = new ArrayList();
                for (int l = 0; l < mIconLayout.getChildCount(); l++)
                {
                    View view2 = mIconLayout.getChildAt(l);
                    if (!arraylist.contains(view2))
                        arraylist1.add(view2);
                }

                View view1;
                for (Iterator iterator = arraylist1.iterator(); iterator.hasNext(); mIconLayout.removeView(view1))
                    view1 = (View)iterator.next();

                for (int i1 = 0; i1 < arraylist.size(); i1++)
                {
                    View view = (View)arraylist.get(i1);
                    view.setPadding(mIconHPadding, 0, mIconHPadding, 0);
                    if (view.getParent() == null)
                        mIconLayout.addView(view, i1, layoutparams);
                }

            }
        }
    }

    protected void updateSearchPanel()
    {
        updateSearchPanel();
        super.mSearchPanelView.setStatusBarView(mStatusBarView);
        mStatusBarView.setDelegateView(super.mSearchPanelView);
    }

    protected void workAroundBadLayerDrawableOpacity(View view)
    {
        android.graphics.drawable.Drawable drawable = view.getBackground();
        if (!(drawable instanceof LayerDrawable))
        {
            return;
        } else
        {
            LayerDrawable layerdrawable = (LayerDrawable)drawable;
            view.setBackground(null);
            layerdrawable.setOpacity(-3);
            view.setBackground(layerdrawable);
            return;
        }
    }










/*
    static int access$1672(TabletStatusBar tabletstatusbar, int i)
    {
        int j = i & tabletstatusbar.mSystemUiVisibility;
        tabletstatusbar.mSystemUiVisibility = j;
        return j;
    }

*/


/*
    static int access$1676(TabletStatusBar tabletstatusbar, int i)
    {
        int j = i | tabletstatusbar.mSystemUiVisibility;
        tabletstatusbar.mSystemUiVisibility = j;
        return j;
    }

*/













    // Unreferenced inner class com/android/systemui/statusbar/tablet/TabletStatusBar$H$1

/* anonymous class */
    class H._cls1
        implements android.view.View.OnClickListener
    {

        final H this$1;

        public void onClick(View view)
        {
            android.content.SharedPreferences.Editor editor = Prefs.edit(mContext);
            editor.putBoolean("do_not_disturb", false);
            editor.apply();
            animateCollapsePanels();
            visibilityChanged(false);
        }

            
            {
                this$1 = H.this;
                super();
            }
    }


    // Unreferenced inner class com/android/systemui/statusbar/tablet/TabletStatusBar$NotificationTriggerTouchListener$1

/* anonymous class */
    class NotificationTriggerTouchListener._cls1
        implements Runnable
    {

        final NotificationTriggerTouchListener this$1;

        public void run()
        {
            mNotificationArea.setBackgroundResource(0x10803f9);
        }

            
            {
                this$1 = NotificationTriggerTouchListener.this;
                super();
            }
    }

}
