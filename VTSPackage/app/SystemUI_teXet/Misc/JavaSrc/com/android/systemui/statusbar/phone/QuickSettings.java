// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.app.*;
import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.drawable.*;
import android.hardware.display.DisplayManager;
import android.hardware.display.WifiDisplayStatus;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.os.*;
import android.util.Log;
import android.util.Pair;
import android.view.*;
import android.widget.*;
import com.android.internal.view.RotationPolicy;
import com.android.systemui.statusbar.policy.*;
import com.android.systemui.statusbar.toolbar.QuickSettingsConnectionModel;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            QuickSettingsModel, QuickSettingsTileView, PhoneStatusBar, QuickSettingsContainerView, 
//            PanelBar

class QuickSettings
{

    private static boolean IS_Tablet = false;
    public static final boolean LONG_PRESS_TOGGLES = false;
    private static final int PROFILE_SWITCH_DIALOG_LONG_TIMEOUT = 4000;
    private static final int PROFILE_SWITCH_DIALOG_SHORT_TIMEOUT = 2000;
    public static final boolean SHOW_IME_TILE = false;
    private static final String TAG = "QuickSettings";
    private PanelBar mBar;
    private LevelListDrawable mBatteryLevels;
    private BluetoothAdapter mBluetoothAdapter;
    private BrightnessController mBrightnessController;
    private Dialog mBrightnessDialog;
    private int mBrightnessDialogLongTimeout;
    private int mBrightnessDialogShortTimeout;
    private LevelListDrawable mChargingBatteryLevels;
    private ViewGroup mContainerView;
    private Context mContext;
    private Runnable mDismissBrightnessDialogRunnable;
    private DisplayManager mDisplayManager;
    private final ArrayList mDynamicSpannedTiles = new ArrayList();
    private Handler mHandler;
    private BroadcastReceiver mIntentReceiver;
    private QuickSettingsModel mModel;
    private final BroadcastReceiver mProfileReceiver = new BroadcastReceiver() {

        final QuickSettings this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if (!"android.provider.Contacts.PROFILE_CHANGED".equals(s) && !"android.intent.action.USER_INFO_CHANGED".equals(s))
                break MISSING_BLOCK_LABEL_52;
            int i = ActivityManagerNative.getDefault().getCurrentUser().id;
            if (getSendingUserId() == i)
                reloadUserInfo();
            return;
            RemoteException remoteexception;
            remoteexception;
            Log.e("QuickSettings", "Couldn't get current user id for profile change", remoteexception);
            return;
        }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
    }
;
    private QuickSettingsConnectionModel mQuickSettingsConnectionModel;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final QuickSettings this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if ("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED".equals(s))
            {
                WifiDisplayStatus wifidisplaystatus = (WifiDisplayStatus)intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS");
                mWifiDisplayStatus = wifidisplaystatus;
                applyWifiDisplayStatus();
            } else
            if ("android.intent.action.USER_SWITCHED".equals(s))
            {
                reloadUserInfo();
                return;
            }
        }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
    }
;
    private final com.android.internal.view.RotationPolicy.RotationPolicyListener mRotationPolicyListener = new com.android.internal.view.RotationPolicy.RotationPolicyListener() {

        final QuickSettings this$0;

        public void onChange()
        {
            mModel.onRotationLockChanged();
        }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
    }
;
    private PhoneStatusBar mStatusBarService;
    boolean mTilesSetUp;
    private AsyncTask mUserInfoTask;
    private WifiDisplayStatus mWifiDisplayStatus;
    private WifiManager mWifiManager;

    public QuickSettings(Context context, QuickSettingsContainerView quicksettingscontainerview)
    {
        mTilesSetUp = false;
        mIntentReceiver = new BroadcastReceiver() {

            final QuickSettings this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("QuickSettings", "sim ready");
                    updateForSimReady();
                } else
                if (s.equals("android.intent.action.SIM_NAME_UPDATE"))
                {
                    updateForSimNameUpdate();
                    return;
                }
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
;
        mDismissBrightnessDialogRunnable = new Runnable() {

            final QuickSettings this$0;

            public void run()
            {
                if (mBrightnessDialog != null && mBrightnessDialog.isShowing())
                    mBrightnessDialog.dismiss();
                removeAllBrightnessDialogCallbacks();
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
;
        mDisplayManager = (DisplayManager)context.getSystemService("display");
        mContext = context;
        mContainerView = quicksettingscontainerview;
        mModel = new QuickSettingsModel(context);
        mWifiDisplayStatus = new WifiDisplayStatus();
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        mWifiManager = (WifiManager)context.getSystemService("wifi");
        mQuickSettingsConnectionModel = new QuickSettingsConnectionModel(context);
        mHandler = new Handler();
        Resources resources = mContext.getResources();
        mBatteryLevels = (LevelListDrawable)resources.getDrawable(0x7f020124);
        mChargingBatteryLevels = (LevelListDrawable)resources.getDrawable(0x7f020125);
        mBrightnessDialogLongTimeout = resources.getInteger(0x7f0c000c);
        mBrightnessDialogShortTimeout = resources.getInteger(0x7f0c000b);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED");
        intentfilter.addAction("android.intent.action.USER_SWITCHED");
        mContext.registerReceiver(mReceiver, intentfilter);
        IntentFilter intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.provider.Contacts.PROFILE_CHANGED");
        intentfilter1.addAction("android.intent.action.USER_INFO_CHANGED");
        mContext.registerReceiverAsUser(mProfileReceiver, UserHandle.ALL, intentfilter1, null, null);
    }

    private void addSystemTiles(ViewGroup viewgroup, LayoutInflater layoutinflater)
    {
        QuickSettingsTileView quicksettingstileview = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview.setContent(0x7f040012, layoutinflater);
        if (!IS_Tablet)
        {
            viewgroup.addView(quicksettingstileview);
            mDynamicSpannedTiles.add(quicksettingstileview);
        }
        QuickSettingsTileView quicksettingstileview1 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview1.setContent(0x7f040016, layoutinflater);
        quicksettingstileview1.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                startSettingsActivity("android.intent.action.POWER_USAGE_SUMMARY");
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addBatteryTile(quicksettingstileview1, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview13, QuickSettingsModel.State state)
            {
                QuickSettingsModel.BatteryState batterystate = (QuickSettingsModel.BatteryState)state;
                TextView textview = (TextView)quicksettingstileview13.findViewById(0x7f080088);
                ImageView imageview = (ImageView)quicksettingstileview13.findViewById(0x7f080087);
                LevelListDrawable levellistdrawable;
                if (batterystate.pluggedIn)
                    levellistdrawable = mChargingBatteryLevels;
                else
                    levellistdrawable = mBatteryLevels;
                String s;
                if (batterystate.batteryLevel == 100)
                    s = mContext.getString(0x7f0b00d5);
                else
                if (batterystate.pluggedIn)
                {
                    Context context1 = mContext;
                    Object aobj1[] = new Object[1];
                    aobj1[0] = Integer.valueOf(batterystate.batteryLevel);
                    s = context1.getString(0x7f0b00d4, aobj1);
                } else
                {
                    Context context = mContext;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(batterystate.batteryLevel);
                    s = context.getString(0x7f0b005b, aobj);
                }
                imageview.setImageDrawable(levellistdrawable);
                imageview.setImageLevel(batterystate.batteryLevel);
                textview.setText(s);
                quicksettingstileview13.setContentDescription(mContext.getString(0x7f0b00cb, new Object[] {
                    s
                }));
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview1);
        mDynamicSpannedTiles.add(quicksettingstileview1);
        if (IS_Tablet)
        {
            QuickSettingsTileView quicksettingstileview12 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
            quicksettingstileview12.setContent(0x7f040020, layoutinflater);
            quicksettingstileview12.setOnClickListener(new android.view.View.OnClickListener() {

                final QuickSettings this$0;

                public void onClick(View view)
                {
                    startSettingsActivity("android.settings.SETTINGS");
                }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
            }
);
            mModel.addSettingsTile(quicksettingstileview12, new QuickSettingsModel.RefreshCallback() {

                final QuickSettings this$0;

                public void refreshView(QuickSettingsTileView quicksettingstileview13, QuickSettingsModel.State state)
                {
                    ((TextView)quicksettingstileview13.findViewById(0x7f080096)).setText(state.label);
                }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
            }
);
            viewgroup.addView(quicksettingstileview12);
            mDynamicSpannedTiles.add(quicksettingstileview12);
        }
        QuickSettingsTileView quicksettingstileview2 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview2.setContent(0x7f040024, layoutinflater);
        quicksettingstileview2.setOnLongClickListener(new android.view.View.OnLongClickListener() {

            final QuickSettings this$0;

            public boolean onLongClick(View view)
            {
                startSettingsActivity("android.settings.WIFI_SETTINGS");
                return true;
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview2);
        QuickSettingsTileView quicksettingstileview3 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview3.setContent(0x7f040017, layoutinflater);
        quicksettingstileview3.setOnLongClickListener(new android.view.View.OnLongClickListener() {

            final QuickSettings this$0;

            public boolean onLongClick(View view)
            {
                startSettingsActivity("android.settings.BLUETOOTH_SETTINGS");
                return true;
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        if (mModel.deviceSupportsBluetooth())
            viewgroup.addView(quicksettingstileview3);
        QuickSettingsTileView quicksettingstileview4 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview4.setContent(0x7f04001b, layoutinflater);
        viewgroup.addView(quicksettingstileview4);
        QuickSettingsTileView quicksettingstileview5 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview5.setContent(0x7f04001a, layoutinflater);
        if (!isWifiOnlyDevice())
            viewgroup.addView(quicksettingstileview5);
        QuickSettingsTileView quicksettingstileview6 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview6.setContent(0x7f04001f, layoutinflater);
        quicksettingstileview6.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                Intent intent = new Intent();
                intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.Settings$DataUsageSummaryActivity"));
                startSettingsActivity(intent);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addRSSITile(quicksettingstileview6, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview13, QuickSettingsModel.State state)
            {
                ((TextView)quicksettingstileview13.findViewById(0x7f080095)).setText(0x7f0b0032);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        if (mModel.deviceHasMobileData())
            viewgroup.addView(quicksettingstileview6);
        QuickSettingsTileView quicksettingstileview7 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview7.setContent(0x7f040014, layoutinflater);
        quicksettingstileview7.setOnLongClickListener(new android.view.View.OnLongClickListener() {

            final QuickSettings this$0;

            public boolean onLongClick(View view)
            {
                Intent intent = new Intent();
                intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.Settings$AudioProfileSettingsActivity"));
                startSettingsActivity(intent);
                return true;
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        if (!IS_Tablet)
        {
            viewgroup.addView(quicksettingstileview7);
        } else
        {
            viewgroup.addView(quicksettingstileview);
            mDynamicSpannedTiles.add(quicksettingstileview);
        }
        QuickSettingsTileView quicksettingstileview8 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview8.setContent(0x7f040018, layoutinflater);
        quicksettingstileview8.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                mBar.collapseAllPanels(true);
                showBrightnessDialog();
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addBrightnessTile(quicksettingstileview8, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview13, QuickSettingsModel.State state)
            {
                TextView textview = (TextView)quicksettingstileview13.findViewById(0x7f08008c);
                textview.setCompoundDrawablesWithIntrinsicBounds(0, state.iconId, 0, 0);
                textview.setText(state.label);
                dismissBrightnessDialog(mBrightnessDialogShortTimeout);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview8);
        QuickSettingsTileView quicksettingstileview9 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview9.setContent(0x7f040022, layoutinflater);
        viewgroup.addView(quicksettingstileview9);
        QuickSettingsTileView quicksettingstileview10 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview10.setContent(0x7f04001e, layoutinflater);
        quicksettingstileview10.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                boolean flag = RotationPolicy.isRotationLocked(mContext);
                Context context = mContext;
                boolean flag1;
                if (!flag)
                    flag1 = true;
                else
                    flag1 = false;
                RotationPolicy.setRotationLock(context, flag1);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addRotationLockTile(quicksettingstileview10, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview13, QuickSettingsModel.State state)
            {
                TextView textview = (TextView)quicksettingstileview13.findViewById(0x7f080093);
                textview.setCompoundDrawablesWithIntrinsicBounds(0, state.iconId, 0, 0);
                textview.setText(state.label);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        QuickSettingsTileView quicksettingstileview11 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview11.setContent(0x7f040015, layoutinflater);
        if (mContext.getResources().getBoolean(0x7f0a0008))
            viewgroup.addView(quicksettingstileview10);
        else
            viewgroup.addView(quicksettingstileview11);
        if (IS_Tablet)
            viewgroup.addView(quicksettingstileview7);
        mQuickSettingsConnectionModel.setQuickSettingsTileView(quicksettingstileview2, quicksettingstileview3, quicksettingstileview4, quicksettingstileview5, quicksettingstileview, quicksettingstileview9, quicksettingstileview11, quicksettingstileview7);
    }

    private void addTemporaryTiles(ViewGroup viewgroup, LayoutInflater layoutinflater)
    {
        QuickSettingsTileView quicksettingstileview = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview.setContent(0x7f040013, layoutinflater);
        quicksettingstileview.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                Intent intent = new Intent();
                intent.setComponent(new ComponentName("com.android.deskclock", "com.android.deskclock.AlarmClock"));
                startSettingsActivity(intent);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addAlarmTile(quicksettingstileview, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview3, QuickSettingsModel.State state)
            {
                ((TextView)quicksettingstileview3.findViewById(0x7f080082)).setText(state.label);
                byte byte0;
                if (state.enabled)
                    byte0 = 0;
                else
                    byte0 = 8;
                quicksettingstileview3.setVisibility(byte0);
                Context context = mContext;
                Object aobj[] = new Object[1];
                aobj[0] = state.label;
                quicksettingstileview3.setContentDescription(context.getString(0x7f0b00ce, aobj));
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview);
        QuickSettingsTileView quicksettingstileview1 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview1.setContent(0x7f040025, layoutinflater);
        quicksettingstileview1.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                startSettingsActivity("android.settings.WIFI_DISPLAY_SETTINGS");
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addWifiDisplayTile(quicksettingstileview1, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview3, QuickSettingsModel.State state)
            {
                TextView textview = (TextView)quicksettingstileview3.findViewById(0x7f0800a1);
                textview.setText(state.label);
                textview.setCompoundDrawablesWithIntrinsicBounds(0, state.iconId, 0, 0);
                boolean flag = state.enabled;
                byte byte0 = 0;
                if (!flag)
                    byte0 = 8;
                quicksettingstileview3.setVisibility(byte0);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview1);
        QuickSettingsTileView quicksettingstileview2 = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview2.setContent(0x7f040019, layoutinflater);
        quicksettingstileview2.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                mBar.collapseAllPanels(true);
                showBugreportDialog();
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addBugreportTile(quicksettingstileview2, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview3, QuickSettingsModel.State state)
            {
                byte byte0;
                if (state.enabled)
                    byte0 = 0;
                else
                    byte0 = 8;
                quicksettingstileview3.setVisibility(byte0);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview2);
    }

    private void addUserTiles(ViewGroup viewgroup, LayoutInflater layoutinflater)
    {
        QuickSettingsTileView quicksettingstileview = (QuickSettingsTileView)layoutinflater.inflate(0x7f040011, viewgroup, false);
        quicksettingstileview.setContent(0x7f040023, layoutinflater);
        quicksettingstileview.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(View view)
            {
                UserManager usermanager;
                Cursor cursor;
                String s;
                mBar.collapseAllPanels(true);
                UserInfo userinfo = null;
                Context context;
                int i;
                Context context1;
                android.graphics.Bitmap bitmap;
                BitmapDrawable bitmapdrawable;
                String s1;
                Context context2;
                try
                {
                    userinfo = ActivityManagerNative.getDefault().getCurrentUser();
                    context2 = mContext.createPackageContextAsUser("android", 0, new UserHandle(userinfo.id));
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                {
                    Log.e("QuickSettings", "Couldn't create user context", namenotfoundexception);
                    throw new RuntimeException(namenotfoundexception);
                }
                catch (RemoteException remoteexception)
                {
                    Log.e("QuickSettings", "Couldn't get user info", remoteexception);
                    context = null;
                    continue; /* Loop/switch isn't completed */
                }
                context = context2;
_L8:
                i = userinfo.id;
                context1 = context;
                usermanager = (UserManager)mContext.getSystemService("user");
                bitmap = usermanager.getUserIcon(i);
                bitmapdrawable = null;
                if (bitmap != null)
                    bitmapdrawable = new BitmapDrawable(mContext.getResources(), bitmap);
                if (usermanager.getUsers().size() > 1)
                    break MISSING_BLOCK_LABEL_312;
                cursor = context1.getContentResolver().query(android.provider.ContactsContract.Profile.CONTENT_URI, new String[] {
                    "_id", "display_name"
                }, null, null, null);
                s = null;
                if (cursor == null) goto _L2; else goto _L1
_L1:
                if (!cursor.moveToFirst()) goto _L4; else goto _L3
_L3:
                s1 = cursor.getString(cursor.getColumnIndex("display_name"));
                s = s1;
_L6:
                cursor.close();
_L2:
                if (s == null && bitmapdrawable == null)
                {
                    Toast.makeText(mContext, 0x7f0b0035, 1).show();
                    return;
                }
                break MISSING_BLOCK_LABEL_312;
_L4:
                boolean flag = UserManager.supportsMultipleUsers();
                s = null;
                if (flag) goto _L6; else goto _L5
_L5:
                Xlog.d("QuickSettings", "current user is owner.");
                s = null;
                  goto _L6
                Exception exception;
                exception;
                cursor.close();
                throw exception;
                if (usermanager.getUsers(true).size() > 1)
                {
                    try
                    {
                        WindowManagerGlobal.getWindowManagerService().lockNow(null);
                        return;
                    }
                    catch (RemoteException remoteexception1)
                    {
                        Log.e("QuickSettings", "Couldn't show user switcher", remoteexception1);
                    }
                    return;
                }
                Intent intent = android.provider.ContactsContract.QuickContact.composeQuickContactsIntent(mContext, view, android.provider.ContactsContract.Profile.CONTENT_URI, 3, null);
                mContext.startActivityAsUser(intent, new UserHandle(-2));
                return;
                if (true) goto _L8; else goto _L7
_L7:
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        mModel.addUserTile(quicksettingstileview, new QuickSettingsModel.RefreshCallback() {

            final QuickSettings this$0;

            public void refreshView(QuickSettingsTileView quicksettingstileview1, QuickSettingsModel.State state)
            {
                QuickSettingsModel.UserState userstate = (QuickSettingsModel.UserState)state;
                ImageView imageview = (ImageView)quicksettingstileview1.findViewById(0x7f08009c);
                ((TextView)quicksettingstileview1.findViewById(0x7f08009d)).setText(state.label);
                imageview.setImageDrawable(userstate.avatar);
                Context context = mContext;
                Object aobj[] = new Object[1];
                aobj[0] = state.label;
                quicksettingstileview1.setContentDescription(context.getString(0x7f0b00c8, aobj));
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        viewgroup.addView(quicksettingstileview);
        mDynamicSpannedTiles.add(quicksettingstileview);
    }

    private void applyWifiDisplayStatus()
    {
        mModel.onWifiDisplayStateChanged(mWifiDisplayStatus);
    }

    private void dismissBrightnessDialog(int i)
    {
        removeAllBrightnessDialogCallbacks();
        if (mBrightnessDialog != null)
            mHandler.postDelayed(mDismissBrightnessDialogRunnable, i);
    }

    private boolean isWifiOnlyDevice()
    {
        Context context = mContext;
        Context _tmp = mContext;
        boolean flag = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    private void queryForUserInformation()
    {
        UserInfo userinfo = null;
        Context context1;
        userinfo = ActivityManagerNative.getDefault().getCurrentUser();
        context1 = mContext.createPackageContextAsUser("android", 0, new UserHandle(userinfo.id));
        Context context = context1;
_L2:
        int i = userinfo.id;
        mUserInfoTask = new AsyncTask() {

            final QuickSettings this$0;
            final Context val$context;
            final int val$userId;
            final String val$userName;

            protected transient Pair doInBackground(Void avoid[])
            {
                String s;
                Cursor cursor;
                UserManager usermanager = (UserManager)mContext.getSystemService("user");
                s = userName;
                android.graphics.Bitmap bitmap = usermanager.getUserIcon(userId);
                Object obj;
                String s2;
                if (bitmap != null)
                    obj = new BitmapDrawable(mContext.getResources(), bitmap);
                else
                    obj = mContext.getResources().getDrawable(0x7f020058);
                if (usermanager.getUsers().size() > 1) goto _L2; else goto _L1
_L1:
                cursor = context.getContentResolver().query(android.provider.ContactsContract.Profile.CONTENT_URI, new String[] {
                    "_id", "display_name"
                }, null, null, null);
                if (cursor == null) goto _L2; else goto _L3
_L3:
                if (!cursor.moveToFirst()) goto _L5; else goto _L4
_L4:
                s2 = cursor.getString(cursor.getColumnIndex("display_name"));
                s = s2;
_L7:
                cursor.close();
_L2:
                return new Pair(s, obj);
_L5:
                if (UserManager.supportsMultipleUsers()) goto _L7; else goto _L6
_L6:
                String s1;
                Xlog.d("QuickSettings", "current user is owner.");
                s1 = mContext.getResources().getString(0x7f0b0034);
                s = s1;
                  goto _L7
                Exception exception;
                exception;
                cursor.close();
                throw exception;
            }

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            protected void onPostExecute(Pair pair)
            {
                super.onPostExecute(pair);
                mModel.setUserTileInfo((String)pair.first, (Drawable)pair.second);
                mUserInfoTask = null;
            }

            protected volatile void onPostExecute(Object obj)
            {
                onPostExecute((Pair)obj);
            }

            
            {
                this$0 = QuickSettings.this;
                userName = s;
                userId = i;
                context = context1;
                super();
            }
        }
;
        mUserInfoTask.execute(new Void[0]);
        return;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Log.e("QuickSettings", "Couldn't create user context", namenotfoundexception);
        throw new RuntimeException(namenotfoundexception);
        RemoteException remoteexception;
        remoteexception;
        Log.e("QuickSettings", "Couldn't get user info", remoteexception);
        context = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void removeAllBrightnessDialogCallbacks()
    {
        mHandler.removeCallbacks(mDismissBrightnessDialogRunnable);
    }

    private void setUpdate()
    {
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        mContext.registerReceiver(mIntentReceiver, intentfilter, null, null);
    }

    private void setupQuickSettings()
    {
        LayoutInflater layoutinflater = LayoutInflater.from(mContext);
        addUserTiles(mContainerView, layoutinflater);
        addSystemTiles(mContainerView, layoutinflater);
        addTemporaryTiles(mContainerView, layoutinflater);
        queryForUserInformation();
        mTilesSetUp = true;
        mQuickSettingsConnectionModel.buildIconViews();
        (new Handler()).postDelayed(new Runnable() {

            final QuickSettings this$0;

            public void run()
            {
                setUpdate();
                mQuickSettingsConnectionModel.setUpdates(true);
                mQuickSettingsConnectionModel.initConfigurationState();
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
, 200L);
    }

    private void showBrightnessDialog()
    {
        if (mBrightnessDialog == null)
        {
            mBrightnessDialog = new Dialog(mContext);
            mBrightnessDialog.requestWindowFeature(1);
            mBrightnessDialog.setContentView(0x7f04000f);
            mBrightnessDialog.setCanceledOnTouchOutside(true);
            mBrightnessController = new BrightnessController(mContext, (ImageView)mBrightnessDialog.findViewById(0x7f080071), (ToggleSlider)mBrightnessDialog.findViewById(0x7f080072));
            mBrightnessController.addStateChangedCallback(mModel);
            mBrightnessDialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

                final QuickSettings this$0;

                public void onDismiss(DialogInterface dialoginterface)
                {
                    mBrightnessController = null;
                }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
            }
);
            mBrightnessDialog.getWindow().setType(2003);
            android.view.WindowManager.LayoutParams layoutparams = mBrightnessDialog.getWindow().getAttributes();
            layoutparams.privateFlags = 0x10 | layoutparams.privateFlags;
            mBrightnessDialog.getWindow().clearFlags(2);
        }
        if (!mBrightnessDialog.isShowing())
        {
            try
            {
                WindowManagerGlobal.getWindowManagerService().dismissKeyguard();
            }
            catch (RemoteException remoteexception) { }
            mBrightnessDialog.show();
            dismissBrightnessDialog(mBrightnessDialogLongTimeout);
        }
    }

    private void showBugreportDialog()
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        builder.setPositiveButton(0x10403dc, new android.content.DialogInterface.OnClickListener() {

            final QuickSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1)
                    mHandler.postDelayed(new Runnable() {

                        final _cls32 this$1;

                        public void run()
                        {
                            try
                            {
                                ActivityManagerNative.getDefault().requestBugReport();
                                return;
                            }
                            catch (RemoteException remoteexception)
                            {
                                return;
                            }
                        }

            
            {
                this$1 = _cls32.this;
                super();
            }
                    }
, 500L);
            }

            
            {
                this$0 = QuickSettings.this;
                super();
            }
        }
);
        builder.setMessage(0x10400e9);
        builder.setTitle(0x10400e8);
        builder.setCancelable(true);
        AlertDialog alertdialog = builder.create();
        alertdialog.getWindow().setType(2003);
        try
        {
            WindowManagerGlobal.getWindowManagerService().dismissKeyguard();
        }
        catch (RemoteException remoteexception) { }
        alertdialog.show();
    }

    private void startSettingsActivity(Intent intent)
    {
        startSettingsActivity(intent, true);
    }

    private void startSettingsActivity(Intent intent, boolean flag)
    {
        if (flag && !getService().isDeviceProvisioned())
            return;
        try
        {
            ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
        }
        catch (RemoteException remoteexception) { }
        intent.setFlags(0x14000000);
        mContext.startActivityAsUser(intent, new UserHandle(-2));
        getService().animateCollapsePanels();
    }

    private void startSettingsActivity(String s)
    {
        startSettingsActivity(new Intent(s));
    }

    private void updateForSimNameUpdate()
    {
        updateForSimReady();
    }

    private void updateForSimReady()
    {
        SIMHelper.updateSIMInfos(mContext);
        mQuickSettingsConnectionModel.updateForSimReady();
    }

    private void updateWifiDisplayStatus()
    {
        mWifiDisplayStatus = mDisplayManager.getWifiDisplayStatus();
        applyWifiDisplayStatus();
    }

    public void dismissDialogs()
    {
        if (mQuickSettingsConnectionModel != null)
            mQuickSettingsConnectionModel.dismissDialogs();
    }

    public PhoneStatusBar getService()
    {
        return mStatusBarService;
    }

    void reloadUserInfo()
    {
        if (mUserInfoTask != null)
        {
            mUserInfoTask.cancel(false);
            mUserInfoTask = null;
        }
        if (mTilesSetUp)
            queryForUserInformation();
    }

    void setBar(PanelBar panelbar)
    {
        mBar = panelbar;
    }

    public void setImeWindowStatus(boolean flag)
    {
        mModel.onImeWindowStatusChanged(flag);
    }

    public void setService(PhoneStatusBar phonestatusbar)
    {
        mStatusBarService = phonestatusbar;
        mQuickSettingsConnectionModel.setStatusBarService(phonestatusbar);
    }

    void setup(BatteryController batterycontroller)
    {
        setupQuickSettings();
        updateWifiDisplayStatus();
        updateResources();
        batterycontroller.addStateChangedCallback(mModel);
        RotationPolicy.registerRotationPolicyListener(mContext, mRotationPolicyListener, -1);
    }

    void updateResources()
    {
        Resources resources = mContext.getResources();
        mModel.updateResources();
        reloadUserInfo();
        int i = resources.getInteger(0x7f0c000a);
        for (Iterator iterator = mDynamicSpannedTiles.iterator(); iterator.hasNext(); ((QuickSettingsTileView)iterator.next()).setColumnSpan(i));
        ((QuickSettingsContainerView)mContainerView).updateResources();
        mContainerView.requestLayout();
        Dialog dialog = mBrightnessDialog;
        boolean flag = false;
        if (dialog != null)
        {
            removeAllBrightnessDialogCallbacks();
            flag = mBrightnessDialog.isShowing();
            mBrightnessDialog.dismiss();
        }
        mBrightnessDialog = null;
        if (flag)
            showBrightnessDialog();
        mQuickSettingsConnectionModel.updateResources();
    }

    public void updateSimInfo(Intent intent)
    {
        if (mQuickSettingsConnectionModel != null)
            mQuickSettingsConnectionModel.updateSimInfo(intent);
    }

    static 
    {
        IS_Tablet = "tablet".equals(SystemProperties.get("ro.build.characteristics"));
    }












/*
    static BrightnessController access$1802(QuickSettings quicksettings, BrightnessController brightnesscontroller)
    {
        quicksettings.mBrightnessController = brightnesscontroller;
        return brightnesscontroller;
    }

*/



/*
    static WifiDisplayStatus access$2002(QuickSettings quicksettings, WifiDisplayStatus wifidisplaystatus)
    {
        quicksettings.mWifiDisplayStatus = wifidisplaystatus;
        return wifidisplaystatus;
    }

*/


/*
    static AsyncTask access$202(QuickSettings quicksettings, AsyncTask asynctask)
    {
        quicksettings.mUserInfoTask = asynctask;
        return asynctask;
    }

*/








}
