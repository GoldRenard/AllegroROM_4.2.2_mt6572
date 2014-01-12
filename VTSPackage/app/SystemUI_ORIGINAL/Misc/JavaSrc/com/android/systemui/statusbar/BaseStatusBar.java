// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.app.*;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.*;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.util.*;
import android.view.*;
import android.widget.*;
import com.android.internal.statusbar.*;
import com.android.systemui.SearchPanelView;
import com.android.systemui.SystemUI;
import com.android.systemui.recent.*;
import com.android.systemui.statusbar.policy.NotificationRowLayout;
import com.android.systemui.statusbar.tablet.StatusBarPanel;
import java.util.ArrayList;

// Referenced classes of package com.android.systemui.statusbar:
//            NotificationData, StatusBarIconView, CommandQueue

public abstract class BaseStatusBar extends SystemUI
    implements CommandQueue.Callbacks
{
    protected class H extends Handler
    {

        final BaseStatusBar this$0;

        public void handleMessage(Message message)
        {
label0:
            {
label1:
                {
label2:
                    {
label3:
                        {
                            switch (message.what)
                            {
                            default:
                                break;

                            case 1020: 
                                break label0;

                            case 1021: 
                                break label1;

                            case 1022: 
                                break label2;

                            case 1023: 
                                break label3;

                            case 1025: 
                                if (mSearchPanelView != null && mSearchPanelView.isShowing())
                                {
                                    mSearchPanelView.show(false, true);
                                    return;
                                }
                                break;

                            case 1024: 
                                if (mSearchPanelView != null && mSearchPanelView.isAssistantAvailable())
                                {
                                    mSearchPanelView.show(true, true);
                                    return;
                                }
                                break;
                            }
                            return;
                        }
                        cancelPreloadingRecentTasksList();
                        return;
                    }
                    preloadRecentTasksList();
                    return;
                }
                Intent intent = new Intent("com.android.systemui.recent.action.CLOSE");
                intent.setPackage("com.android.systemui");
                mContext.sendBroadcastAsUser(intent, new UserHandle(-2));
                return;
            }
            toggleRecentsActivity();
        }

        protected H()
        {
            this$0 = BaseStatusBar.this;
            super();
        }
    }

    private class NotificationClicker
        implements android.view.View.OnClickListener
    {

        private int mId;
        private PendingIntent mIntent;
        private String mPkg;
        private String mTag;
        final BaseStatusBar this$0;

        public void onClick(View view)
        {
            try
            {
                ActivityManagerNative.getDefault().resumeAppSwitches();
                ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
            }
            catch (RemoteException remoteexception) { }
            if (mIntent != null)
            {
                int ai[] = new int[2];
                view.getLocationOnScreen(ai);
                Intent intent = new Intent();
                intent.setSourceBounds(new Rect(ai[0], ai[1], ai[0] + view.getWidth(), ai[1] + view.getHeight()));
                KeyguardManager keyguardmanager;
                try
                {
                    mIntent.send(mContext, 0, intent);
                }
                catch (android.app.PendingIntent.CanceledException canceledexception)
                {
                    Slog.w("StatusBar", (new StringBuilder()).append("Sending contentIntent failed: ").append(canceledexception).toString());
                }
                keyguardmanager = (KeyguardManager)mContext.getSystemService("keyguard");
                if (keyguardmanager != null)
                    keyguardmanager.exitKeyguardSecurely(null);
            }
            try
            {
                mBarService.onNotificationClick(mPkg, mTag, mId);
            }
            catch (RemoteException remoteexception1) { }
            animateCollapsePanels(0);
            visibilityChanged(false);
        }

        NotificationClicker(PendingIntent pendingintent, String s, String s1, int i)
        {
            this$0 = BaseStatusBar.this;
            super();
            mIntent = pendingintent;
            mPkg = s;
            mTag = s1;
            mId = i;
        }
    }

    public class TouchOutsideListener
        implements android.view.View.OnTouchListener
    {

        private int mMsg;
        private StatusBarPanel mPanel;
        final BaseStatusBar this$0;

        public boolean onTouch(View view, MotionEvent motionevent)
        {
            int i = motionevent.getAction();
            if (i != 4 && (i != 0 || mPanel.isInContentArea((int)motionevent.getX(), (int)motionevent.getY())))
            {
                return false;
            } else
            {
                mHandler.removeMessages(mMsg);
                mHandler.sendEmptyMessage(mMsg);
                return true;
            }
        }

        public TouchOutsideListener(int i, StatusBarPanel statusbarpanel)
        {
            this$0 = BaseStatusBar.this;
            super();
            mMsg = i;
            mPanel = statusbarpanel;
        }
    }


    public static final boolean DEBUG = false;
    protected static final boolean ENABLE_INTRUDERS = false;
    public static final int EXPANDED_FULL_OPEN = -10001;
    public static final int EXPANDED_LEAVE_ALONE = -10000;
    protected static final int MSG_CANCEL_PRELOAD_RECENT_APPS = 1023;
    protected static final int MSG_CLOSE_RECENTS_PANEL = 1021;
    protected static final int MSG_CLOSE_SEARCH_PANEL = 1025;
    protected static final int MSG_HIDE_INTRUDER = 1027;
    protected static final int MSG_OPEN_SEARCH_PANEL = 1024;
    protected static final int MSG_PRELOAD_RECENT_APPS = 1022;
    protected static final int MSG_SHOW_INTRUDER = 1026;
    protected static final int MSG_TOGGLE_RECENTS_PANEL = 1020;
    public static final boolean MULTIUSER_DEBUG = false;
    public static final String SYSTEM_DIALOG_REASON_RECENT_APPS = "recentapps";
    public static final String TAG = "StatusBar";
    protected IStatusBarService mBarService;
    protected CommandQueue mCommandQueue;
    protected int mCurrentUserId;
    protected StatusBarNotification mCurrentlyIntrudingNotification;
    private boolean mDeviceProvisioned;
    protected Display mDisplay;
    protected H mHandler;
    protected PopupMenu mNotificationBlamePopup;
    protected NotificationData mNotificationData;
    private android.widget.RemoteViews.OnClickHandler mOnClickHandler;
    protected boolean mPanelSlightlyVisible;
    protected NotificationRowLayout mPile;
    private ContentObserver mProvisioningObserver;
    protected android.view.View.OnTouchListener mRecentsPreloadOnTouchListener;
    protected SearchPanelView mSearchPanelView;
    protected WindowManager mWindowManager;
    protected IWindowManager mWindowManagerService;

    public BaseStatusBar()
    {
        mHandler = createHandler();
        mNotificationData = new NotificationData();
        mCurrentUserId = 0;
        mDeviceProvisioned = false;
        mProvisioningObserver = new ContentObserver(new Handler()) {

            final BaseStatusBar this$0;

            public void onChange(boolean flag)
            {
                int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0);
                boolean flag1 = false;
                if (i != 0)
                    flag1 = true;
                if (flag1 != mDeviceProvisioned)
                {
                    mDeviceProvisioned = flag1;
                    updateNotificationIcons();
                }
            }

            
            {
                this$0 = BaseStatusBar.this;
                super(handler);
            }
        }
;
        mOnClickHandler = new android.widget.RemoteViews.OnClickHandler() {

            final BaseStatusBar this$0;

            public boolean onClickHandler(View view, PendingIntent pendingintent, Intent intent)
            {
                boolean flag = pendingintent.isActivity();
                boolean flag1;
                if (flag)
                    try
                    {
                        ActivityManagerNative.getDefault().resumeAppSwitches();
                        ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
                    }
                    catch (RemoteException remoteexception) { }
                flag1 = super.onClickHandler(view, pendingintent, intent);
                if (flag && flag1)
                {
                    animateCollapsePanels(0);
                    visibilityChanged(false);
                }
                return flag1;
            }

            
            {
                this$0 = BaseStatusBar.this;
                super();
            }
        }
;
        mRecentsPreloadOnTouchListener = new android.view.View.OnTouchListener() {

            final BaseStatusBar this$0;

            public boolean onTouch(View view, MotionEvent motionevent)
            {
                int i = 0xff & motionevent.getAction();
                if (i == 0)
                    preloadRecentTasksList();
                else
                if (i == 3)
                    cancelPreloadingRecentTasksList();
                else
                if (i == 1 && !view.isPressed())
                    cancelPreloadingRecentTasksList();
                return false;
            }

            
            {
                this$0 = BaseStatusBar.this;
                super();
            }
        }
;
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

    private void startApplicationDetailsActivity(String s)
    {
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.fromParts("package", s, null));
        intent.setComponent(intent.resolveActivity(super.mContext.getPackageManager()));
        TaskStackBuilder.create(super.mContext).addNextIntentWithParentStack(intent).startActivities(null, UserHandle.CURRENT);
    }

    protected StatusBarIconView addNotificationViews(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        StatusBarIconView statusbariconview = new StatusBarIconView(super.mContext, (new StringBuilder()).append(statusbarnotification.pkg).append("/0x").append(Integer.toHexString(statusbarnotification.id)).toString(), statusbarnotification.notification);
        statusbariconview.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
        StatusBarIcon statusbaricon = new StatusBarIcon(statusbarnotification.pkg, statusbarnotification.user, statusbarnotification.notification.icon, statusbarnotification.notification.iconLevel, statusbarnotification.notification.number, statusbarnotification.notification.tickerText);
        if (!statusbariconview.set(statusbaricon))
        {
            handleNotificationError(ibinder, statusbarnotification, (new StringBuilder()).append("Couldn't create icon: ").append(statusbaricon).toString());
            return null;
        }
        NotificationData.Entry entry = new NotificationData.Entry(ibinder, statusbarnotification, statusbariconview);
        if (!inflateViews(entry, mPile))
        {
            handleNotificationError(ibinder, statusbarnotification, (new StringBuilder()).append("Couldn't expand RemoteViews for: ").append(statusbarnotification).toString());
            return null;
        } else
        {
            mNotificationData.add(entry);
            updateExpansionStates();
            updateNotificationIcons();
            return statusbariconview;
        }
    }

    protected void applyLegacyRowBackground(StatusBarNotification statusbarnotification, View view)
    {
label0:
        {
            if (statusbarnotification.notification.contentView.getLayoutId() != 0x109008f)
            {
                int i;
                try
                {
                    i = super.mContext.getPackageManager().getApplicationInfo(statusbarnotification.pkg, 0).targetSdkVersion;
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                {
                    Slog.e("StatusBar", (new StringBuilder()).append("Failed looking up ApplicationInfo for ").append(statusbarnotification.pkg).toString(), namenotfoundexception);
                    i = 0;
                }
                if (i <= 0 || i >= 9)
                    break label0;
                view.setBackgroundResource(0x7f02011c);
            }
            return;
        }
        view.setBackgroundResource(0x108041d);
    }

    public void cancelPreloadRecentApps()
    {
        mHandler.removeMessages(1023);
        mHandler.sendEmptyMessage(1023);
    }

    protected void cancelPreloadingRecentTasksList()
    {
        Intent intent = new Intent("com.android.systemui.recent.CANCEL_PRELOAD");
        intent.setClassName("com.android.systemui", "com.android.systemui.recent.RecentsPreloadReceiver");
        super.mContext.sendBroadcastAsUser(intent, new UserHandle(-2));
        RecentTasksLoader.getInstance(super.mContext).cancelPreloadingFirstTask();
    }

    protected abstract void createAndAddWindows();

    protected H createHandler()
    {
        return new H();
    }

    public void dismissIntruder()
    {
    }

    public void dismissPopups()
    {
        if (mNotificationBlamePopup != null)
        {
            mNotificationBlamePopup.dismiss();
            mNotificationBlamePopup = null;
        }
    }

    protected boolean expandView(NotificationData.Entry entry, boolean flag)
    {
        int i = super.mContext.getResources().getDimensionPixelSize(0x7f0d001a);
        android.view.ViewGroup.LayoutParams layoutparams = entry.row.getLayoutParams();
        if (entry.expandable() && flag)
            layoutparams.height = -2;
        else
            layoutparams.height = i;
        entry.row.setLayoutParams(layoutparams);
        return flag;
    }

    protected abstract int getExpandedViewMaxHeight();

    protected android.view.View.OnLongClickListener getNotificationLongClicker()
    {
        return new android.view.View.OnLongClickListener() {

            final BaseStatusBar this$0;

            public boolean onLongClick(View view)
            {
                String s = (String)view.getTag();
                if (s != null && view.getWindowToken() != null)
                {
                    mNotificationBlamePopup = new PopupMenu(mContext, view);
                    mNotificationBlamePopup.getMenuInflater().inflate(0x7f100000, mNotificationBlamePopup.getMenu());
                    mNotificationBlamePopup.setOnMenuItemClickListener(s. new android.widget.PopupMenu.OnMenuItemClickListener() {

                        final _cls5 this$1;
                        final String val$packageNameF;

                        public boolean onMenuItemClick(MenuItem menuitem)
                        {
                            int i = menuitem.getItemId();
                            boolean flag = false;
                            if (i == 0x7f08012b)
                            {
                                startApplicationDetailsActivity(packageNameF);
                                animateCollapsePanels(0);
                                flag = true;
                            }
                            return flag;
                        }

            
            {
                this$1 = final__pcls5;
                packageNameF = String.this;
                super();
            }
                    }
);
                    mNotificationBlamePopup.show();
                    return true;
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = BaseStatusBar.this;
                super();
            }
        }
;
    }

    protected abstract android.view.WindowManager.LayoutParams getRecentsLayoutParams(android.view.ViewGroup.LayoutParams layoutparams);

    protected abstract android.view.WindowManager.LayoutParams getSearchLayoutParams(android.view.ViewGroup.LayoutParams layoutparams);

    public IStatusBarService getStatusBarService()
    {
        return mBarService;
    }

    protected abstract View getStatusBarView();

    protected abstract void haltTicker();

    void handleNotificationError(IBinder ibinder, StatusBarNotification statusbarnotification, String s)
    {
        removeNotification(ibinder);
        try
        {
            mBarService.onNotificationError(statusbarnotification.pkg, statusbarnotification.tag, statusbarnotification.id, statusbarnotification.uid, statusbarnotification.initialPid, s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void hideSearchPanel()
    {
        mHandler.removeMessages(1025);
        mHandler.sendEmptyMessage(1025);
    }

    public boolean inKeyguardRestrictedInputMode()
    {
        return ((KeyguardManager)super.mContext.getSystemService("keyguard")).inKeyguardRestrictedInputMode();
    }

    protected boolean inflateViews(NotificationData.Entry entry, ViewGroup viewgroup)
    {
        int i = super.mContext.getResources().getDimensionPixelSize(0x7f0d0018);
        int j = super.mContext.getResources().getDimensionPixelSize(0x7f0d0019);
        StatusBarNotification statusbarnotification = entry.notification;
        RemoteViews remoteviews = statusbarnotification.notification.contentView;
        RemoteViews remoteviews1 = statusbarnotification.notification.bigContentView;
        if (remoteviews == null)
            return false;
        View view = ((LayoutInflater)super.mContext.getSystemService("layout_inflater")).inflate(0x7f040031, viewgroup, false);
        view.setTag(statusbarnotification.pkg);
        workAroundBadLayerDrawableOpacity(view);
        updateNotificationVetoButton(view, statusbarnotification).setContentDescription(super.mContext.getString(0x7f0b009f));
        ViewGroup viewgroup1 = (ViewGroup)view.findViewById(0x7f0800b8);
        ViewGroup viewgroup2 = (ViewGroup)view.findViewById(0x7f0800b9);
        viewgroup1.setDescendantFocusability(0x60000);
        PendingIntent pendingintent = statusbarnotification.notification.contentIntent;
        View view1;
        View view2;
        View view3;
        com.android.internal.widget.SizeAdaptiveLayout.LayoutParams layoutparams;
        com.android.internal.widget.SizeAdaptiveLayout.LayoutParams layoutparams1;
        if (pendingintent != null)
            viewgroup1.setOnClickListener(new NotificationClicker(pendingintent, statusbarnotification.pkg, statusbarnotification.tag, statusbarnotification.id));
        else
            viewgroup1.setOnClickListener(null);
        try
        {
            view1 = remoteviews.apply(super.mContext, viewgroup2, mOnClickHandler);
        }
        catch (RuntimeException runtimeexception)
        {
            String s = (new StringBuilder()).append(statusbarnotification.pkg).append("/0x").append(Integer.toHexString(statusbarnotification.id)).toString();
            Slog.e("StatusBar", (new StringBuilder()).append("couldn't inflate view for notification ").append(s).toString(), runtimeexception);
            return false;
        }
        view2 = null;
        if (remoteviews1 == null)
            break MISSING_BLOCK_LABEL_247;
        view3 = remoteviews1.apply(super.mContext, viewgroup2, mOnClickHandler);
        view2 = view3;
        if (view1 != null)
        {
            layoutparams = new com.android.internal.widget.SizeAdaptiveLayout.LayoutParams(view1.getLayoutParams());
            layoutparams.minHeight = i;
            layoutparams.maxHeight = i;
            viewgroup2.addView(view1, layoutparams);
        }
        if (view2 != null)
        {
            layoutparams1 = new com.android.internal.widget.SizeAdaptiveLayout.LayoutParams(view2.getLayoutParams());
            layoutparams1.minHeight = i + 1;
            layoutparams1.maxHeight = j;
            viewgroup2.addView(view2, layoutparams1);
        }
        view.setDrawingCacheEnabled(true);
        applyLegacyRowBackground(statusbarnotification, viewgroup1);
        boolean flag;
        if (remoteviews1 != null)
            flag = true;
        else
            flag = false;
        view.setTag(0x7f080002, Boolean.valueOf(flag));
        entry.row = view;
        entry.content = viewgroup1;
        entry.expanded = view1;
        entry.setLargeView(view2);
        return true;
    }

    public boolean isDeviceProvisioned()
    {
        return mDeviceProvisioned;
    }

    public abstract boolean isExpanded();

    protected boolean isTopNotification(ViewGroup viewgroup, NotificationData.Entry entry)
    {
        return viewgroup != null && viewgroup.indexOfChild(entry.row) == 0;
    }

    public NotificationClicker makeClicker(PendingIntent pendingintent, String s, String s1, int i)
    {
        return new NotificationClicker(pendingintent, s, s1, i);
    }

    public boolean notificationIsForCurrentUser(StatusBarNotification statusbarnotification)
    {
        int i = mCurrentUserId;
        int j = statusbarnotification.getUserId();
        return j == -1 || i == j;
    }

    public void preloadRecentApps()
    {
        mHandler.removeMessages(1022);
        mHandler.sendEmptyMessage(1022);
    }

    protected void preloadRecentTasksList()
    {
        Intent intent = new Intent("com.android.systemui.recent.action.PRELOAD");
        intent.setClassName("com.android.systemui", "com.android.systemui.recent.RecentsPreloadReceiver");
        super.mContext.sendBroadcastAsUser(intent, new UserHandle(-2));
        RecentTasksLoader.getInstance(super.mContext).preloadFirstTask();
    }

    protected StatusBarNotification removeNotificationViews(IBinder ibinder)
    {
        NotificationData.Entry entry = mNotificationData.remove(ibinder);
        if (entry == null)
        {
            Slog.w("StatusBar", (new StringBuilder()).append("removeNotification for unknown key: ").append(ibinder).toString());
            return null;
        }
        ViewGroup viewgroup = (ViewGroup)entry.row.getParent();
        if (viewgroup != null)
            viewgroup.removeView(entry.row);
        updateExpansionStates();
        updateNotificationIcons();
        return entry.notification;
    }

    protected abstract void setAreThereNotifications();

    protected abstract boolean shouldDisableNavbarGestures();

    protected boolean showNotificationEvenIfUnprovisioned(StatusBarNotification statusbarnotification)
    {
        if ("android".equals(statusbarnotification.pkg) && statusbarnotification.notification.kind != null)
        {
            String as[] = statusbarnotification.notification.kind;
            int i = as.length;
            for (int j = 0; j < i;)
            {
                String s = as[j];
                if (!"android.system.imeswitcher".equals(s) && !"android.system.update".equals(s))
                    j++;
                else
                    return true;
            }

        }
        return false;
    }

    public void showSearchPanel()
    {
        mHandler.removeMessages(1024);
        mHandler.sendEmptyMessage(1024);
    }

    public void start()
    {
        boolean flag = true;
        mWindowManager = (WindowManager)super.mContext.getSystemService("window");
        mWindowManagerService = WindowManagerGlobal.getWindowManagerService();
        mDisplay = mWindowManager.getDefaultDisplay();
        mProvisioningObserver.onChange(false);
        super.mContext.getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor("device_provisioned"), flag, mProvisioningObserver);
        mBarService = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.getService("statusbar"));
        StatusBarIconList statusbariconlist = new StatusBarIconList();
        ArrayList arraylist = new ArrayList();
        ArrayList arraylist1 = new ArrayList();
        mCommandQueue = new CommandQueue(this, statusbariconlist);
        int ai[] = new int[7];
        ArrayList arraylist2 = new ArrayList();
        boolean flag1;
        boolean flag2;
        int i;
        int j;
        int l;
        IntentFilter intentfilter;
        try
        {
            mBarService.registerStatusBar(mCommandQueue, statusbariconlist, arraylist, arraylist1, ai, arraylist2);
        }
        catch (RemoteException remoteexception) { }
        createAndAddWindows();
        disable(ai[0]);
        setSystemUiVisibility(ai[flag], -1);
        if (ai[2] != 0)
            flag1 = flag;
        else
            flag1 = false;
        topAppWindowChanged(flag1);
        setImeWindowStatus((IBinder)arraylist2.get(0), ai[3], ai[4]);
        if (ai[5] != 0)
            flag2 = flag;
        else
            flag2 = false;
        if (ai[6] == 0)
            flag = false;
        setHardKeyboardStatus(flag2, flag);
        i = statusbariconlist.size();
        j = 0;
        for (int k = 0; k < i; k++)
        {
            StatusBarIcon statusbaricon = statusbariconlist.getIcon(k);
            if (statusbaricon != null)
            {
                addIcon(statusbariconlist.getSlot(k), k, j, statusbaricon);
                j++;
            }
        }

        l = arraylist.size();
        if (l == arraylist1.size())
        {
            for (int i1 = 0; i1 < l; i1++)
                addNotification((IBinder)arraylist.get(i1), (StatusBarNotification)arraylist1.get(i1));

        } else
        {
            Log.wtf("StatusBar", (new StringBuilder()).append("Notification list length mismatch: keys=").append(l).append(" notifications=").append(arraylist1.size()).toString());
        }
        mCurrentUserId = ActivityManager.getCurrentUser();
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.USER_SWITCHED");
        super.mContext.registerReceiver(new BroadcastReceiver() {

            final BaseStatusBar this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.USER_SWITCHED".equals(intent.getAction()))
                {
                    mCurrentUserId = intent.getIntExtra("android.intent.extra.user_handle", -1);
                    Slog.v("StatusBar", (new StringBuilder()).append("userId ").append(mCurrentUserId).append(" is in the house").toString());
                    userSwitched(mCurrentUserId);
                }
            }

            
            {
                this$0 = BaseStatusBar.this;
                super();
            }
        }
, intentfilter);
    }

    protected abstract void tick(IBinder ibinder, StatusBarNotification statusbarnotification, boolean flag);

    public void toggleRecentApps()
    {
        mHandler.removeMessages(1020);
        mHandler.sendEmptyMessage(1020);
    }

    protected void toggleRecentsActivity()
    {
        TaskDescription taskdescription;
        Intent intent;
        taskdescription = RecentTasksLoader.getInstance(super.mContext).getFirstTask();
        intent = new Intent("com.android.systemui.recent.action.TOGGLE_RECENTS");
        intent.setClassName("com.android.systemui", "com.android.systemui.recent.RecentsActivity");
        intent.setFlags(0x10800000);
        if (taskdescription != null)
            break MISSING_BLOCK_LABEL_128;
        if (RecentsActivity.forceOpaqueBackground(super.mContext))
        {
            ActivityOptions activityoptions = ActivityOptions.makeCustomAnimation(super.mContext, 0x7f05000c, 0x7f05000d);
            super.mContext.startActivityAsUser(intent, activityoptions.toBundle(), new UserHandle(-2));
            return;
        }
        try
        {
            super.mContext.startActivityAsUser(intent, new UserHandle(-2));
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("StatusBar", "Failed to launch RecentAppsIntent", activitynotfoundexception);
        }
        return;
        Bitmap bitmap;
        Resources resources;
        float f;
        float f1;
        bitmap = taskdescription.getThumbnail();
        resources = super.mContext.getResources();
        f = resources.getDimensionPixelSize(0x7f0d0003);
        f1 = resources.getDimensionPixelSize(0x7f0d0004);
        if (bitmap != null)
            break MISSING_BLOCK_LABEL_181;
        throw new RuntimeException("Recents thumbnail is null");
        if ((float)bitmap.getWidth() == f && (float)bitmap.getHeight() == f1)
            break MISSING_BLOCK_LABEL_235;
        bitmap = Bitmap.createScaledBitmap(bitmap, (int)f, (int)f1, true);
        if (bitmap != null)
            break MISSING_BLOCK_LABEL_235;
        throw new RuntimeException("Recents thumbnail is null");
        DisplayMetrics displaymetrics;
        displaymetrics = new DisplayMetrics();
        mDisplay.getMetrics(displaymetrics);
        if (resources.getConfiguration().orientation != 1) goto _L2; else goto _L1
_L1:
        float f12;
        float f13;
        float f14;
        float f15;
        f12 = resources.getDimensionPixelSize(0x7f0d000e);
        f13 = resources.getDimensionPixelSize(0x7f0d000d);
        f14 = resources.getDimensionPixelSize(0x7f0d000b);
        f15 = resources.getDimensionPixelSize(0x7f0d0005);
        float f16 = f + (f14 + (f12 + f13)) + 2.0F * f15;
        int i;
        int k;
        i = (int)(f14 + (f15 + (f13 + (f12 + ((float)displaymetrics.widthPixels - f16) / 2.0F))));
        k = (int)((float)(displaymetrics.heightPixels - resources.getDimensionPixelSize(0x7f0d0004)) - f15);
_L3:
        View view = getStatusBarView();
        android.app.ActivityOptions.OnAnimationStartedListener onanimationstartedlistener = new android.app.ActivityOptions.OnAnimationStartedListener() {

            final BaseStatusBar this$0;

            public void onAnimationStarted()
            {
                Intent intent1 = new Intent("com.android.systemui.recent.action.WINDOW_ANIMATION_START");
                intent1.setPackage("com.android.systemui");
                mContext.sendBroadcastAsUser(intent1, new UserHandle(-2));
            }

            
            {
                this$0 = BaseStatusBar.this;
                super();
            }
        }
;
        ActivityOptions activityoptions1 = ActivityOptions.makeThumbnailScaleDownAnimation(view, bitmap, i, k, onanimationstartedlistener);
        intent.putExtra("com.android.systemui.recent.WAITING_FOR_WINDOW_ANIMATION", true);
        super.mContext.startActivityAsUser(intent, activityoptions1.toBundle(), new UserHandle(-2));
        return;
_L2:
        float f2;
        float f3;
        float f4;
        float f6;
        float f7;
        float f8;
        f2 = resources.getDimensionPixelSize(0x7f0d0045);
        f3 = resources.getDimensionPixelSize(0x7f0d0005);
        f4 = resources.getDimensionPixelSize(0x7f0d000c);
        float f5 = resources.getDimensionPixelSize(0x7f0d0006);
        Paint paint = new Paint();
        paint.setTextSize(f5);
        f6 = paint.getFontMetricsInt().bottom - paint.getFontMetricsInt().top;
        paint.setTextSize(resources.getDimensionPixelSize(0x7f0d0007));
        f7 = paint.getFontMetricsInt().bottom - paint.getFontMetricsInt().top;
        f8 = resources.getDimensionPixelSize(0x105000c);
        float f9 = f7 + (f4 + (f8 + (f6 + (f4 + (f2 + f1 + 2.0F * f3)))));
        int j;
        float f10 = resources.getDimensionPixelSize(0x7f0d000f);
        float f11 = resources.getDimensionPixelSize(0x7f0d000a);
        i = (int)((float)(displaymetrics.widthPixels - resources.getDimensionPixelSize(0x7f0d0003)) - f3 - f10 - f11);
        j = displaymetrics.heightPixels;
        k = (int)(f8 + (f3 + (f8 + (f2 + ((float)j - f8 - f9) / 2.0F))));
          goto _L3
    }

    protected abstract void updateExpandedViewPos(int i);

    protected void updateExpansionStates()
    {
        int i = mNotificationData.size();
        for (int j = 0; j < i; j++)
        {
            NotificationData.Entry entry = mNotificationData.get(j);
            if (entry.userLocked())
                continue;
            if (j == i - 1)
            {
                expandView(entry, true);
                continue;
            }
            if (!entry.userExpanded())
                expandView(entry, false);
        }

    }

    public void updateNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        NotificationData.Entry entry;
        entry = mNotificationData.findByKey(ibinder);
        if (entry == null)
        {
            Slog.w("StatusBar", (new StringBuilder()).append("updateNotification for unknown key: ").append(ibinder).toString());
            return;
        }
        StatusBarNotification statusbarnotification1 = entry.notification;
        RemoteViews remoteviews = statusbarnotification1.notification.contentView;
        RemoteViews remoteviews1 = statusbarnotification.notification.contentView;
        RemoteViews remoteviews2 = statusbarnotification1.notification.bigContentView;
        RemoteViews remoteviews3 = statusbarnotification.notification.bigContentView;
        boolean flag;
        boolean flag1;
        ViewGroup viewgroup;
        boolean flag2;
        boolean flag3;
        boolean flag4;
        boolean flag6;
        RuntimeException runtimeexception;
        PendingIntent pendingintent;
        NotificationClicker notificationclicker;
        StatusBarIcon statusbaricon;
        if (entry.expanded != null && remoteviews1.getPackage() != null && remoteviews.getPackage() != null && remoteviews.getPackage().equals(remoteviews1.getPackage()) && remoteviews.getLayoutId() == remoteviews1.getLayoutId())
            flag = true;
        else
            flag = false;
        if (entry.getLargeView() == null && remoteviews3 == null || entry.getLargeView() != null && remoteviews3 != null && remoteviews3.getPackage() != null && remoteviews2.getPackage() != null && remoteviews2.getPackage().equals(remoteviews3.getPackage()) && remoteviews2.getLayoutId() == remoteviews3.getLayoutId())
            flag1 = true;
        else
            flag1 = false;
        viewgroup = (ViewGroup)entry.row.getParent();
        if (statusbarnotification.notification.when == statusbarnotification1.notification.when || statusbarnotification.score == statusbarnotification1.score)
            flag2 = true;
        else
            flag2 = false;
        if (statusbarnotification.notification.tickerText != null && !TextUtils.equals(statusbarnotification.notification.tickerText, entry.notification.notification.tickerText))
            flag3 = true;
        else
            flag3 = false;
        flag4 = isTopNotification(viewgroup, entry);
        if (!flag || !flag1 || !flag2 && !flag4)
            break MISSING_BLOCK_LABEL_640;
        entry.notification = statusbarnotification;
        remoteviews1.reapply(super.mContext, entry.expanded, mOnClickHandler);
        if (remoteviews3 == null)
            break MISSING_BLOCK_LABEL_373;
        if (entry.getLargeView() != null)
            remoteviews3.reapply(super.mContext, entry.getLargeView(), mOnClickHandler);
        pendingintent = statusbarnotification.notification.contentIntent;
        if (pendingintent == null) goto _L2; else goto _L1
_L1:
        notificationclicker = makeClicker(pendingintent, statusbarnotification.pkg, statusbarnotification.tag, statusbarnotification.id);
        entry.content.setOnClickListener(notificationclicker);
_L4:
        statusbaricon = new StatusBarIcon(statusbarnotification.pkg, statusbarnotification.user, statusbarnotification.notification.icon, statusbarnotification.notification.iconLevel, statusbarnotification.notification.number, statusbarnotification.notification.tickerText);
        if (!entry.icon.set(statusbaricon))
        {
            handleNotificationError(ibinder, statusbarnotification, (new StringBuilder()).append("Couldn't update icon: ").append(statusbaricon).toString());
            return;
        }
          goto _L3
_L5:
        updateNotificationVetoButton(entry.row, statusbarnotification);
        flag6 = notificationIsForCurrentUser(statusbarnotification);
        if (flag3 && flag6)
        {
            haltTicker();
            tick(ibinder, statusbarnotification, false);
        }
        setAreThereNotifications();
        updateExpandedViewPos(-10000);
        return;
_L2:
        entry.content.setOnClickListener(null);
          goto _L4
_L3:
        try
        {
            updateExpansionStates();
        }
        // Misplaced declaration of an exception variable
        catch (RuntimeException runtimeexception)
        {
            Slog.w("StatusBar", (new StringBuilder()).append("Couldn't reapply views for package ").append(remoteviews1.getPackage()).toString(), runtimeexception);
            removeNotificationViews(ibinder);
            addNotificationViews(ibinder, statusbarnotification);
        }
          goto _L5
        boolean flag5 = entry.userExpanded();
        removeNotificationViews(ibinder);
        addNotificationViews(ibinder, statusbarnotification);
        if (flag5)
        {
            NotificationData.Entry entry1 = mNotificationData.findByKey(ibinder);
            expandView(entry1, true);
            entry1.setUserExpanded(true);
        }
          goto _L5
    }

    protected abstract void updateNotificationIcons();

    protected View updateNotificationVetoButton(View view, StatusBarNotification statusbarnotification)
    {
        View view1 = view.findViewById(0x7f0800b7);
        if (statusbarnotification.isClearable())
        {
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final BaseStatusBar this$0;
                final int val$_id;
                final String val$_pkg;
                final String val$_tag;

                public void onClick(View view2)
                {
                    view2.announceForAccessibility(mContext.getString(0x7f0b00c3));
                    try
                    {
                        mBarService.onNotificationClear(_pkg, _tag, _id);
                        return;
                    }
                    catch (RemoteException remoteexception)
                    {
                        return;
                    }
                }

            
            {
                this$0 = BaseStatusBar.this;
                _pkg = s;
                _tag = s1;
                _id = i;
                super();
            }
            }
);
            view1.setVisibility(0);
        } else
        {
            view1.setVisibility(8);
        }
        view1.setImportantForAccessibility(2);
        return view1;
    }

    protected void updateSearchPanel()
    {
        SearchPanelView searchpanelview = mSearchPanelView;
        boolean flag = false;
        if (searchpanelview != null)
        {
            flag = mSearchPanelView.isShowing();
            mWindowManager.removeView(mSearchPanelView);
        }
        LinearLayout linearlayout = new LinearLayout(super.mContext);
        mSearchPanelView = (SearchPanelView)LayoutInflater.from(super.mContext).inflate(0x7f040034, linearlayout, false);
        mSearchPanelView.setOnTouchListener(new TouchOutsideListener(1025, mSearchPanelView));
        mSearchPanelView.setVisibility(8);
        android.view.WindowManager.LayoutParams layoutparams = getSearchLayoutParams(mSearchPanelView.getLayoutParams());
        mWindowManager.addView(mSearchPanelView, layoutparams);
        mSearchPanelView.setBar(this);
        if (flag)
            mSearchPanelView.show(true, false);
    }

    public void userSwitched(int i)
    {
    }

    protected void visibilityChanged(boolean flag)
    {
        if (mPanelSlightlyVisible == flag)
            break MISSING_BLOCK_LABEL_22;
        mPanelSlightlyVisible = flag;
        mBarService.onPanelRevealed();
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    protected void workAroundBadLayerDrawableOpacity(View view)
    {
    }



/*
    static boolean access$002(BaseStatusBar basestatusbar, boolean flag)
    {
        basestatusbar.mDeviceProvisioned = flag;
        return flag;
    }

*/

}
