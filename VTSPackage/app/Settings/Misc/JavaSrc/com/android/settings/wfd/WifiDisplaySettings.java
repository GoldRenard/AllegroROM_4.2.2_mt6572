// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wfd;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.hardware.display.*;
import android.net.Uri;
import android.os.*;
import android.preference.*;
import android.text.Html;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import com.android.settings.ProgressCategory;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;

public final class WifiDisplaySettings extends SettingsPreferenceFragment
{
    private final class WifiDisplayPreference extends Preference
        implements android.view.View.OnClickListener
    {

        private final WifiDisplay mDisplay;
        final WifiDisplaySettings this$0;

        public WifiDisplay getDisplay()
        {
            return mDisplay;
        }

        protected void onBindView(View view)
        {
            super.onBindView(view);
            ImageView imageview = (ImageView)view.findViewById(0x7f08000c);
            if (imageview != null)
            {
                imageview.setOnClickListener(this);
                if (!isEnabled())
                {
                    TypedValue typedvalue = new TypedValue();
                    getContext().getTheme().resolveAttribute(0x1010033, typedvalue, true);
                    imageview.setImageAlpha((int)(255F * typedvalue.getFloat()));
                }
            }
        }

        public void onClick(View view)
        {
            showOptionsDialog(mDisplay);
        }

        public WifiDisplayPreference(Context context, WifiDisplay wifidisplay)
        {
            this$0 = WifiDisplaySettings.this;
            super(context);
            mDisplay = wifidisplay;
            setTitle(wifidisplay.getFriendlyDisplayName());
        }
    }


    private static final int MENU_ID_SCAN = 1;
    private static final String TAG = "WifiDisplaySettings";
    private Switch mActionBarSwitch;
    private ProgressCategory mAvailableDevicesCategory;
    private DisplayManager mDisplayManager;
    private TextView mEmptyView;
    private boolean mIsTablet;
    private PreferenceGroup mPairedDevicesCategory;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final WifiDisplaySettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"))
            {
                Xlog.d("WifiDisplaySettings", "onReceive(): DisplayManager.ACTION_WIFI_DISPLAY_STATUS_CHANGED");
                WifiDisplayStatus wifidisplaystatus = (WifiDisplayStatus)intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS");
                mWifiDisplayStatus = wifidisplaystatus;
                applyState();
            }
        }

            
            {
                this$0 = WifiDisplaySettings.this;
                super();
            }
    }
;
    private final ContentObserver mSettingsObserver = new ContentObserver(new Handler()) {

        final WifiDisplaySettings this$0;

        public void onChange(boolean flag, Uri uri)
        {
            Xlog.d("WifiDisplaySettings", "ContentObserver, onChange()");
            update();
        }

            
            {
                this$0 = WifiDisplaySettings.this;
                super(handler);
            }
    }
;
    private final android.widget.CompoundButton.OnCheckedChangeListener mSwitchOnCheckedChangedListener = new android.widget.CompoundButton.OnCheckedChangeListener() {

        final WifiDisplaySettings this$0;

        public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
        {
            mWifiDisplayOnSetting = flag;
            Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("onCheckedChanged to ").append(flag).toString());
            ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.Global.putInt(contentresolver, "wifi_display_on", i);
        }

            
            {
                this$0 = WifiDisplaySettings.this;
                super();
            }
    }
;
    private boolean mWifiDisplayOnSetting;
    private WifiDisplayStatus mWifiDisplayStatus;


    private void applyState()
    {
        int i = mWifiDisplayStatus.getFeatureState();
        Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("applyState, wfd state is ").append(i).toString());
        Switch switch1 = mActionBarSwitch;
        boolean flag;
        if (i != 1)
            flag = true;
        else
            flag = false;
        switch1.setEnabled(flag);
        mActionBarSwitch.setChecked(mWifiDisplayOnSetting);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.removeAll();
        if (i == 3)
        {
            WifiDisplay awifidisplay[] = mWifiDisplayStatus.getRememberedDisplays();
            WifiDisplay awifidisplay1[] = mWifiDisplayStatus.getAvailableDisplays();
            Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("applyState(), paired device list size is ").append(awifidisplay.length).toString());
            Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("applyState(), available device list size is ").append(awifidisplay1.length).toString());
            if (mPairedDevicesCategory == null)
            {
                mPairedDevicesCategory = new PreferenceCategory(getActivity());
                mPairedDevicesCategory.setTitle(0x7f0b0417);
            } else
            {
                mPairedDevicesCategory.removeAll();
            }
            preferencescreen.addPreference(mPairedDevicesCategory);
            int k = awifidisplay.length;
            for (int l = 0; l < k; l++)
            {
                WifiDisplay wifidisplay1 = awifidisplay[l];
                Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("paired device is ").append(wifidisplay1.getFriendlyDisplayName()).toString());
                mPairedDevicesCategory.addPreference(createWifiDisplayPreference(wifidisplay1, true));
            }

            if (mPairedDevicesCategory.getPreferenceCount() == 0)
                preferencescreen.removePreference(mPairedDevicesCategory);
            if (mAvailableDevicesCategory == null)
            {
                mAvailableDevicesCategory = new ProgressCategory(getActivity(), null, 0x7f0b0416);
                mAvailableDevicesCategory.setTitle(0x7f0b0418);
            } else
            {
                mAvailableDevicesCategory.removeAll();
            }
            preferencescreen.addPreference(mAvailableDevicesCategory);
            int i1 = awifidisplay1.length;
            for (int j1 = 0; j1 < i1; j1++)
            {
                WifiDisplay wifidisplay = awifidisplay1[j1];
                Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("available device is ").append(wifidisplay.getFriendlyDisplayName()).toString());
                if (!contains(awifidisplay, wifidisplay.getDeviceAddress()))
                    mAvailableDevicesCategory.addPreference(createWifiDisplayPreference(wifidisplay, false));
            }

            if (mWifiDisplayStatus.getScanState() == 1)
            {
                Xlog.d("WifiDisplaySettings", "applystate(), scan state is scanning");
                mAvailableDevicesCategory.setProgress(true);
            } else
            {
                Xlog.d("WifiDisplaySettings", "applystate(), scan state is not scan");
                mAvailableDevicesCategory.setProgress(false);
            }
        } else
        {
            TextView textview = mEmptyView;
            int j;
            if (i == 2)
                j = 0x7f0b0412;
            else
                j = 0x7f0b0413;
            textview.setText(j);
        }
        getActivity().invalidateOptionsMenu();
    }

    private static boolean contains(WifiDisplay awifidisplay[], String s)
    {
        int i = awifidisplay.length;
        for (int j = 0; j < i; j++)
            if (awifidisplay[j].getDeviceAddress().equals(s))
                return true;

        return false;
    }

    private Preference createWifiDisplayPreference(WifiDisplay wifidisplay, boolean flag)
    {
        WifiDisplayPreference wifidisplaypreference = new WifiDisplayPreference(getActivity(), wifidisplay);
        if (wifidisplay.equals(mWifiDisplayStatus.getActiveDisplay()))
        {
            Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("createWifiDisplayPreference: ").append(wifidisplay.getFriendlyDisplayName()).append("state is: ").append(mWifiDisplayStatus.getActiveDisplayState()).toString());
            switch (mWifiDisplayStatus.getActiveDisplayState())
            {
            case 1: // '\001'
                wifidisplaypreference.setSummary(0x7f0b0419);
                break;

            case 2: // '\002'
                wifidisplaypreference.setSummary(0x7f0b041a);
                break;
            }
        } else
        if (flag && contains(mWifiDisplayStatus.getAvailableDisplays(), wifidisplay.getDeviceAddress()))
            wifidisplaypreference.setSummary(0x7f0b041b);
        if (flag)
            wifidisplaypreference.setWidgetLayoutResource(0x7f0400ad);
        return wifidisplaypreference;
    }

    private void showDisconnectDialog(final WifiDisplay display)
    {
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final WifiDisplaySettings this$0;
            final WifiDisplay val$display;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (display.equals(mWifiDisplayStatus.getActiveDisplay()))
                {
                    Xlog.d("WifiDisplaySettings", "click disconnect button, disconnectWifiDisplay()");
                    mDisplayManager.disconnectWifiDisplay();
                }
            }

            
            {
                this$0 = WifiDisplaySettings.this;
                display = wifidisplay;
                super();
            }
        }
;
        android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(getActivity())).setCancelable(true).setTitle(0x7f0b041d);
        Resources resources = getResources();
        Object aobj[] = new Object[1];
        aobj[0] = display.getFriendlyDisplayName();
        builder.setMessage(Html.fromHtml(resources.getString(0x7f0b041e, aobj))).setPositiveButton(0x104000a, onclicklistener).setNegativeButton(0x1040000, null).create().show();
    }

    private void showOptionsDialog(final WifiDisplay display)
    {
        View view = getActivity().getLayoutInflater().inflate(0x7f0400ac, null);
        final EditText nameEditText = (EditText)view.findViewById(0x7f08007a);
        nameEditText.setText(display.getFriendlyDisplayName());
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final WifiDisplaySettings this$0;
            final WifiDisplay val$display;
            final EditText val$nameEditText;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                String s = nameEditText.getText().toString().trim();
                if (s.isEmpty() || s.equals(display.getDeviceName()))
                    s = null;
                Xlog.d("WifiDisplaySettings", "click rename button, renameWifiDisplay()");
                mDisplayManager.renameWifiDisplay(display.getDeviceAddress(), s);
            }

            
            {
                this$0 = WifiDisplaySettings.this;
                nameEditText = edittext;
                display = wifidisplay;
                super();
            }
        }
;
        android.content.DialogInterface.OnClickListener onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

            final WifiDisplaySettings this$0;
            final WifiDisplay val$display;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                Xlog.d("WifiDisplaySettings", "click forget button, forgetWifiDisplay()");
                mDisplayManager.forgetWifiDisplay(display.getDeviceAddress());
            }

            
            {
                this$0 = WifiDisplaySettings.this;
                display = wifidisplay;
                super();
            }
        }
;
        (new android.app.AlertDialog.Builder(getActivity())).setCancelable(true).setTitle(0x7f0b041f).setView(view).setPositiveButton(0x7f0b0421, onclicklistener).setNegativeButton(0x7f0b0420, onclicklistener1).create().show();
    }

    private void update()
    {
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "wifi_display_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        mWifiDisplayOnSetting = flag;
        Xlog.d("WifiDisplaySettings", (new StringBuilder()).append("update: mWifiDisplayOnSetting is ").append(mWifiDisplayOnSetting).toString());
        mWifiDisplayStatus = mDisplayManager.getWifiDisplayStatus();
        applyState();
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mActionBarSwitch = new Switch(activity);
        mEmptyView = (TextView)getView().findViewById(0x1020004);
        getListView().setEmptyView(mEmptyView);
        int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
        mActionBarSwitch.setPadding(0, 0, i, 0);
        mActionBarSwitch.setOnCheckedChangeListener(mSwitchOnCheckedChangedListener);
        update();
        if (mWifiDisplayStatus.getFeatureState() == 0)
        {
            Xlog.d("WifiDisplaySettings", "Wfd is unavailable, finish the activity");
            activity.finish();
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mDisplayManager = (DisplayManager)getActivity().getSystemService("display");
        addPreferencesFromResource(0x7f05004d);
        setHasOptionsMenu(true);
        if ("tablet".equals(SystemProperties.get("ro.build.characteristics")))
        {
            mIsTablet = true;
            return;
        } else
        {
            mIsTablet = false;
            return;
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        int i;
        if (mWifiDisplayStatus.getScanState() == 1)
            i = 0x7f0b0415;
        else
            i = 0x7f0b0414;
        MenuItem menuitem = menu.add(0, 1, 0, i);
        boolean flag;
        if (mWifiDisplayStatus.getFeatureState() == 3 && mWifiDisplayStatus.getScanState() == 0)
            flag = true;
        else
            flag = false;
        menuitem.setEnabled(flag);
        menuitem.setShowAsAction(1);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 1: // '\001'
            if (mWifiDisplayStatus.getFeatureState() == 3)
            {
                mDisplayManager.scanWifiDisplays();
                Xlog.d("WifiDisplaySettings", "Click scan menu, start scan wifi display device");
            }
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
        getContentResolver().unregisterContentObserver(mSettingsObserver);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof WifiDisplayPreference)
        {
            WifiDisplay wifidisplay = ((WifiDisplayPreference)preference).getDisplay();
            if (wifidisplay.equals(mWifiDisplayStatus.getActiveDisplay()))
            {
                Xlog.d("WifiDisplaySettings", "Click the connected device preference, show disconnect dialog");
                showDisconnectDialog(wifidisplay);
            } else
            {
                Xlog.d("WifiDisplaySettings", "Call display manager to connect directly");
                mDisplayManager.connectWifiDisplay(wifidisplay.getDeviceAddress());
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        Activity activity = getActivity();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED");
        activity.registerReceiver(mReceiver, intentfilter);
        getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor("wifi_display_on"), false, mSettingsObserver);
        mDisplayManager.scanWifiDisplays();
        Xlog.d("WifiDisplaySettings", "onResume, start scan wifi display device");
        update();
    }

    public void onStart()
    {
        super.onStart();
        Activity activity = getActivity();
        if (activity instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
            if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane() || mIsTablet)
            {
                activity.getActionBar().setDisplayOptions(16, 16);
                activity.getActionBar().setCustomView(mActionBarSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
            }
        }
    }

    public void onStop()
    {
        super.onStop();
        Activity activity = getActivity();
        if (mIsTablet)
        {
            activity.getActionBar().setDisplayOptions(0, 16);
            activity.getActionBar().setCustomView(null);
        }
    }



/*
    static WifiDisplayStatus access$002(WifiDisplaySettings wifidisplaysettings, WifiDisplayStatus wifidisplaystatus)
    {
        wifidisplaysettings.mWifiDisplayStatus = wifidisplaystatus;
        return wifidisplaystatus;
    }

*/



/*
    static boolean access$202(WifiDisplaySettings wifidisplaysettings, boolean flag)
    {
        wifidisplaysettings.mWifiDisplayOnSetting = flag;
        return flag;
    }

*/




}
