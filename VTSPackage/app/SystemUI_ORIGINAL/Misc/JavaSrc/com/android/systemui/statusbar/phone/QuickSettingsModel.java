// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.drawable.Drawable;
import android.hardware.display.WifiDisplay;
import android.hardware.display.WifiDisplayStatus;
import android.net.ConnectivityManager;
import android.os.Handler;
import android.text.TextUtils;
import android.view.inputmethod.*;
import com.android.internal.view.RotationPolicy;
import com.android.systemui.statusbar.policy.CurrentUserTracker;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            QuickSettingsTileView

class QuickSettingsModel
    implements com.android.systemui.statusbar.policy.BatteryController.BatteryStateChangeCallback, com.android.systemui.statusbar.policy.BrightnessController.BrightnessStateChangeCallback
{
    static class BatteryState extends State
    {

        int batteryLevel;
        boolean pluggedIn;

    }

    private class BrightnessObserver extends ContentObserver
    {

        final QuickSettingsModel this$0;

        public void onChange(boolean flag)
        {
            onBrightnessLevelChanged();
        }

        public void startObserving()
        {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.unregisterContentObserver(this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness_mode"), false, this, mUserTracker.getCurrentUserId());
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness"), false, this, mUserTracker.getCurrentUserId());
        }

        public BrightnessObserver(Handler handler)
        {
            this$0 = QuickSettingsModel.this;
            super(handler);
        }
    }

    static class BrightnessState extends State
    {

        boolean autoBrightness;

    }

    private class BugreportObserver extends ContentObserver
    {

        final QuickSettingsModel this$0;

        public void onChange(boolean flag)
        {
            onBugreportChanged();
        }

        public void startObserving()
        {
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.Secure.getUriFor("bugreport_in_power_menu"), false, this);
        }

        public BugreportObserver(Handler handler)
        {
            this$0 = QuickSettingsModel.this;
            super(handler);
        }
    }

    private class NextAlarmObserver extends ContentObserver
    {

        final QuickSettingsModel this$0;

        public void onChange(boolean flag)
        {
            onNextAlarmChanged();
        }

        public void startObserving()
        {
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("next_alarm_formatted"), false, this, -1);
        }

        public NextAlarmObserver(Handler handler)
        {
            this$0 = QuickSettingsModel.this;
            super(handler);
        }
    }

    static interface RefreshCallback
    {

        public abstract void refreshView(QuickSettingsTileView quicksettingstileview, State state);
    }

    static class State
    {

        boolean enabled;
        int iconId;
        String label;

        State()
        {
            enabled = false;
        }
    }

    static class UserState extends State
    {

        Drawable avatar;

    }


    private static final String TAG_TRY_SUPPRESSING_IME_SWITCHER = "TrySuppressingImeSwitcher";
    private RefreshCallback mAlarmCallback;
    private BroadcastReceiver mAlarmIntentReceiver;
    private State mAlarmState;
    private QuickSettingsTileView mAlarmTile;
    private RefreshCallback mBatteryCallback;
    private BatteryState mBatteryState;
    private QuickSettingsTileView mBatteryTile;
    private RefreshCallback mBrightnessCallback;
    private final BrightnessObserver mBrightnessObserver;
    private BrightnessState mBrightnessState;
    private QuickSettingsTileView mBrightnessTile;
    private RefreshCallback mBugreportCallback;
    private final BugreportObserver mBugreportObserver;
    private State mBugreportState;
    private QuickSettingsTileView mBugreportTile;
    private final Context mContext;
    private final Handler mHandler = new Handler();
    private final boolean mHasMobileData;
    private RefreshCallback mImeCallback;
    private State mImeState;
    private QuickSettingsTileView mImeTile;
    private final NextAlarmObserver mNextAlarmObserver;
    private RefreshCallback mRSSICallback;
    private State mRSSIState;
    private QuickSettingsTileView mRSSITile;
    private RefreshCallback mRotationLockCallback;
    private State mRotationLockState;
    private QuickSettingsTileView mRotationLockTile;
    private RefreshCallback mSettingsCallback;
    private State mSettingsState;
    private QuickSettingsTileView mSettingsTile;
    private RefreshCallback mTimeCallback;
    private State mTimeState;
    private QuickSettingsTileView mTimeTile;
    private RefreshCallback mUserCallback;
    private UserState mUserState;
    private QuickSettingsTileView mUserTile;
    private final CurrentUserTracker mUserTracker;
    private RefreshCallback mWifiDisplayCallback;
    private State mWifiDisplayState;
    private QuickSettingsTileView mWifiDisplayTile;

    public QuickSettingsModel(Context context)
    {
        mAlarmIntentReceiver = new BroadcastReceiver() {

            final QuickSettingsModel this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.ALARM_CHANGED"))
                {
                    onAlarmChanged(intent);
                    onNextAlarmChanged();
                }
            }

            
            {
                this$0 = QuickSettingsModel.this;
                super();
            }
        }
;
        mUserState = new UserState();
        mTimeState = new State();
        mAlarmState = new State();
        mWifiDisplayState = new State();
        mRSSIState = new State();
        mBatteryState = new BatteryState();
        mImeCallback = null;
        mImeState = new State();
        mRotationLockState = new State();
        mBrightnessState = new BrightnessState();
        mBugreportState = new State();
        mSettingsState = new State();
        mContext = context;
        mUserTracker = new CurrentUserTracker(mContext) {

            final QuickSettingsModel this$0;

            public void onReceive(Context context1, Intent intent)
            {
                super.onReceive(context1, intent);
                onUserSwitched();
            }

            
            {
                this$0 = QuickSettingsModel.this;
                super(context);
            }
        }
;
        mNextAlarmObserver = new NextAlarmObserver(mHandler);
        mNextAlarmObserver.startObserving();
        mBugreportObserver = new BugreportObserver(mHandler);
        mBugreportObserver.startObserving();
        mBrightnessObserver = new BrightnessObserver(mHandler);
        mBrightnessObserver.startObserving();
        mHasMobileData = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.ALARM_CHANGED");
        context.registerReceiver(mAlarmIntentReceiver, intentfilter);
    }

    private static String getCurrentInputMethodName(Context context, ContentResolver contentresolver, InputMethodManager inputmethodmanager, List list, PackageManager packagemanager)
    {
label0:
        {
            if (contentresolver == null || list == null)
                break label0;
            String s = android.provider.Settings.Secure.getString(contentresolver, "default_input_method");
            if (TextUtils.isEmpty(s))
                break label0;
            Iterator iterator = list.iterator();
            InputMethodInfo inputmethodinfo;
            do
            {
                if (!iterator.hasNext())
                    break label0;
                inputmethodinfo = (InputMethodInfo)iterator.next();
            } while (!s.equals(inputmethodinfo.getId()));
            InputMethodSubtype inputmethodsubtype = inputmethodmanager.getCurrentInputMethodSubtype();
            Object obj;
            if (inputmethodsubtype != null)
                obj = inputmethodsubtype.getDisplayName(context, inputmethodinfo.getPackageName(), inputmethodinfo.getServiceInfo().applicationInfo);
            else
                obj = context.getString(0x7f0b00db);
            return obj.toString();
        }
        return null;
    }

    private boolean needsToShowImeSwitchOngoingNotification(InputMethodManager inputmethodmanager)
    {
        List list = inputmethodmanager.getEnabledInputMethodList();
        int i = list.size();
        if (i > 2)
            return true;
        if (i < 1)
            return false;
        int j = 0;
        int k = 0;
        InputMethodSubtype inputmethodsubtype = null;
        InputMethodSubtype inputmethodsubtype1 = null;
        for (int l = 0; l < i; l++)
        {
            List list1 = inputmethodmanager.getEnabledInputMethodSubtypeList((InputMethodInfo)list.get(l), true);
            int i1 = list1.size();
            if (i1 == 0)
            {
                j++;
                continue;
            }
            for (int j1 = 0; j1 < i1; j1++)
            {
                InputMethodSubtype inputmethodsubtype2 = (InputMethodSubtype)list1.get(j1);
                if (!inputmethodsubtype2.isAuxiliary())
                {
                    j++;
                    inputmethodsubtype = inputmethodsubtype2;
                } else
                {
                    k++;
                    inputmethodsubtype1 = inputmethodsubtype2;
                }
            }

        }

        if (j <= 1 && k <= 1)
        {
            if (j == 1 && k == 1)
                return inputmethodsubtype == null || inputmethodsubtype1 == null || !inputmethodsubtype.getLocale().equals(inputmethodsubtype1.getLocale()) && !inputmethodsubtype1.overridesImplicitlyEnabledSubtype() && !inputmethodsubtype.overridesImplicitlyEnabledSubtype() || !inputmethodsubtype.containsExtraValueKey("TrySuppressingImeSwitcher");
            else
                return false;
        } else
        {
            return true;
        }
    }

    public static String removeDoubleQuotes(String s)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            int i = s.length();
            if (i > 1 && s.charAt(0) == '"' && s.charAt(i - 1) == '"')
                return s.substring(1, i - 1);
        }
        return s;
    }

    public static String removeTrailingPeriod(String s)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            int i = s.length();
            if (s.endsWith("."))
            {
                s.substring(0, i - 1);
                return s;
            }
        }
        return s;
    }

    void addAlarmTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mAlarmTile = quicksettingstileview;
        mAlarmCallback = refreshcallback;
        mAlarmCallback.refreshView(quicksettingstileview, mAlarmState);
    }

    void addBatteryTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mBatteryTile = quicksettingstileview;
        mBatteryCallback = refreshcallback;
        mBatteryCallback.refreshView(mBatteryTile, mBatteryState);
    }

    void addBrightnessTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mBrightnessTile = quicksettingstileview;
        mBrightnessCallback = refreshcallback;
        onBrightnessLevelChanged();
    }

    void addBugreportTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mBugreportTile = quicksettingstileview;
        mBugreportCallback = refreshcallback;
        onBugreportChanged();
    }

    void addImeTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mImeTile = quicksettingstileview;
        mImeCallback = refreshcallback;
        mImeCallback.refreshView(mImeTile, mImeState);
    }

    void addRSSITile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mRSSITile = quicksettingstileview;
        mRSSICallback = refreshcallback;
        mRSSICallback.refreshView(mRSSITile, mRSSIState);
    }

    void addRotationLockTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mRotationLockTile = quicksettingstileview;
        mRotationLockCallback = refreshcallback;
        onRotationLockChanged();
    }

    void addSettingsTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mSettingsTile = quicksettingstileview;
        mSettingsCallback = refreshcallback;
        refreshSettingsTile();
    }

    void addTimeTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mTimeTile = quicksettingstileview;
        mTimeCallback = refreshcallback;
        mTimeCallback.refreshView(quicksettingstileview, mTimeState);
    }

    void addUserTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mUserTile = quicksettingstileview;
        mUserCallback = refreshcallback;
        mUserCallback.refreshView(mUserTile, mUserState);
    }

    void addWifiDisplayTile(QuickSettingsTileView quicksettingstileview, RefreshCallback refreshcallback)
    {
        mWifiDisplayTile = quicksettingstileview;
        mWifiDisplayCallback = refreshcallback;
    }

    boolean deviceHasMobileData()
    {
        return mHasMobileData;
    }

    boolean deviceSupportsBluetooth()
    {
        return BluetoothAdapter.getDefaultAdapter() != null;
    }

    void onAlarmChanged(Intent intent)
    {
        mAlarmState.enabled = intent.getBooleanExtra("alarmSet", false);
        mAlarmCallback.refreshView(mAlarmTile, mAlarmState);
    }

    public void onBatteryLevelChanged(int i, boolean flag)
    {
        mBatteryState.batteryLevel = i;
        mBatteryState.pluggedIn = flag;
        mBatteryCallback.refreshView(mBatteryTile, mBatteryState);
    }

    public void onBrightnessLevelChanged()
    {
        boolean flag = true;
        Resources resources = mContext.getResources();
        int i = android.provider.Settings.System.getIntForUser(mContext.getContentResolver(), "screen_brightness_mode", 0, mUserTracker.getCurrentUserId());
        BrightnessState brightnessstate = mBrightnessState;
        if (i != flag)
            flag = false;
        brightnessstate.autoBrightness = flag;
        BrightnessState brightnessstate1 = mBrightnessState;
        int j;
        if (mBrightnessState.autoBrightness)
            j = 0x7f020052;
        else
            j = 0x7f020051;
        brightnessstate1.iconId = j;
        mBrightnessState.label = resources.getString(0x7f0b00d8);
        mBrightnessCallback.refreshView(mBrightnessTile, mBrightnessState);
    }

    public void onBugreportChanged()
    {
        ContentResolver contentresolver = mContext.getContentResolver();
        int i = android.provider.Settings.Secure.getInt(contentresolver, "bugreport_in_power_menu");
        boolean flag;
        if (i != 0)
            flag = true;
        else
            flag = false;
_L2:
        mBugreportState.enabled = flag;
        mBugreportCallback.refreshView(mBugreportTile, mBugreportState);
        return;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    void onImeWindowStatusChanged(boolean flag)
    {
        InputMethodManager inputmethodmanager = (InputMethodManager)mContext.getSystemService("input_method");
        List list = inputmethodmanager.getInputMethodList();
        State state = mImeState;
        boolean flag1;
        if (flag && needsToShowImeSwitchOngoingNotification(inputmethodmanager))
            flag1 = true;
        else
            flag1 = false;
        state.enabled = flag1;
        mImeState.label = getCurrentInputMethodName(mContext, mContext.getContentResolver(), inputmethodmanager, list, mContext.getPackageManager());
        if (mImeCallback != null)
            mImeCallback.refreshView(mImeTile, mImeState);
    }

    void onNextAlarmChanged()
    {
        String s = android.provider.Settings.System.getStringForUser(mContext.getContentResolver(), "next_alarm_formatted", -2);
        mAlarmState.label = s;
        State state = mAlarmState;
        boolean flag;
        if (!TextUtils.isEmpty(s))
            flag = true;
        else
            flag = false;
        state.enabled = flag;
        mAlarmCallback.refreshView(mAlarmTile, mAlarmState);
    }

    void onRotationLockChanged()
    {
        boolean flag = RotationPolicy.isRotationLocked(mContext);
        mRotationLockState.enabled = flag;
        State state = mRotationLockState;
        int i;
        if (flag)
            i = 0x7f02007b;
        else
            i = 0x7f020034;
        state.iconId = i;
        State state1 = mRotationLockState;
        String s;
        if (flag)
            s = mContext.getString(0x7f0b00da);
        else
            s = mContext.getString(0x7f0b00d9);
        state1.label = s;
        if (mRotationLockTile != null && mRotationLockCallback != null)
            mRotationLockCallback.refreshView(mRotationLockTile, mRotationLockState);
    }

    void onUserSwitched()
    {
        mBrightnessObserver.startObserving();
        onRotationLockChanged();
        onBrightnessLevelChanged();
        onNextAlarmChanged();
        onBugreportChanged();
    }

    public void onWifiDisplayStateChanged(WifiDisplayStatus wifidisplaystatus)
    {
        State state = mWifiDisplayState;
        boolean flag;
        if (wifidisplaystatus.getFeatureState() == 3)
            flag = true;
        else
            flag = false;
        state.enabled = flag;
        if (wifidisplaystatus.getActiveDisplay() != null)
        {
            mWifiDisplayState.label = wifidisplaystatus.getActiveDisplay().getFriendlyDisplayName();
            mWifiDisplayState.iconId = 0x7f02007a;
        } else
        {
            mWifiDisplayState.label = mContext.getString(0x7f0b00e8);
            mWifiDisplayState.iconId = 0x7f020079;
        }
        mWifiDisplayCallback.refreshView(mWifiDisplayTile, mWifiDisplayState);
    }

    void refreshBatteryTile()
    {
        mBatteryCallback.refreshView(mBatteryTile, mBatteryState);
    }

    void refreshBrightnessTile()
    {
        onBrightnessLevelChanged();
    }

    void refreshRotationLockTile()
    {
        if (mRotationLockTile != null)
            onRotationLockChanged();
    }

    void refreshRssiTile()
    {
        mRSSICallback.refreshView(mRSSITile, mRSSIState);
    }

    void refreshSettingsTile()
    {
        if (mSettingsTile != null)
        {
            Resources resources = mContext.getResources();
            mSettingsState.label = resources.getString(0x7f0b00e0);
            mSettingsCallback.refreshView(mSettingsTile, mSettingsState);
        }
    }

    void setUserTileInfo(String s, Drawable drawable)
    {
        mUserState.label = s;
        mUserState.avatar = drawable;
        mUserCallback.refreshView(mUserTile, mUserState);
    }

    void updateResources()
    {
        refreshSettingsTile();
        refreshBatteryTile();
        refreshBrightnessTile();
        refreshRotationLockTile();
        refreshRssiTile();
    }


}
