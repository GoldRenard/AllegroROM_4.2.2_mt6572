// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.view.*;
import android.widget.*;
import com.android.settings.*;
import com.android.settings.applications.InstalledAppDetails;
import com.android.settings.bluetooth.BluetoothSettings;
import com.android.settings.wifi.WifiSettings;

// Referenced classes of package com.android.settings.fuelgauge:
//            Utils

public class PowerUsageDetail extends Fragment
    implements android.view.View.OnClickListener
{
    static final class DrainType extends Enum
    {

        private static final DrainType $VALUES[];
        public static final DrainType APP;
        public static final DrainType BLUETOOTH;
        public static final DrainType CELL;
        public static final DrainType IDLE;
        public static final DrainType PHONE;
        public static final DrainType SCREEN;
        public static final DrainType USER;
        public static final DrainType WIFI;

        public static DrainType valueOf(String s)
        {
            return (DrainType)Enum.valueOf(com/android/settings/fuelgauge/PowerUsageDetail$DrainType, s);
        }

        public static DrainType[] values()
        {
            return (DrainType[])$VALUES.clone();
        }

        static 
        {
            IDLE = new DrainType("IDLE", 0);
            CELL = new DrainType("CELL", 1);
            PHONE = new DrainType("PHONE", 2);
            WIFI = new DrainType("WIFI", 3);
            BLUETOOTH = new DrainType("BLUETOOTH", 4);
            SCREEN = new DrainType("SCREEN", 5);
            APP = new DrainType("APP", 6);
            USER = new DrainType("USER", 7);
            DrainType adraintype[] = new DrainType[8];
            adraintype[0] = IDLE;
            adraintype[1] = CELL;
            adraintype[2] = PHONE;
            adraintype[3] = WIFI;
            adraintype[4] = BLUETOOTH;
            adraintype[5] = SCREEN;
            adraintype[6] = APP;
            adraintype[7] = USER;
            $VALUES = adraintype;
        }

        private DrainType(String s, int i)
        {
            super(s, i);
        }
    }


    public static final int ACTION_APP_DETAILS = 5;
    public static final int ACTION_BLUETOOTH_SETTINGS = 3;
    public static final int ACTION_DISPLAY_SETTINGS = 1;
    public static final int ACTION_FORCE_STOP = 7;
    public static final int ACTION_LOCATION_SETTINGS = 6;
    public static final int ACTION_REPORT = 8;
    public static final int ACTION_WIFI_SETTINGS = 2;
    public static final int ACTION_WIRELESS_SETTINGS = 4;
    public static final String EXTRA_DETAIL_TYPES = "types";
    public static final String EXTRA_DETAIL_VALUES = "values";
    public static final String EXTRA_DRAIN_TYPE = "drainType";
    public static final String EXTRA_GAUGE = "gauge";
    public static final String EXTRA_ICON_ID = "iconId";
    public static final String EXTRA_ICON_PACKAGE = "iconPackage";
    public static final String EXTRA_NO_COVERAGE = "noCoverage";
    public static final String EXTRA_PERCENT = "percent";
    public static final String EXTRA_REPORT_CHECKIN_DETAILS = "report_checkin_details";
    public static final String EXTRA_REPORT_DETAILS = "report_details";
    public static final String EXTRA_TITLE = "title";
    public static final String EXTRA_UID = "uid";
    public static final String EXTRA_USAGE_DURATION = "duration";
    public static final String EXTRA_USAGE_SINCE = "since";
    private static final String TAG = "PowerUsageDetail";
    public static final int USAGE_SINCE_RESET = 2;
    public static final int USAGE_SINCE_UNPLUGGED = 1;
    private static int sDrainTypeDesciptions[] = {
        0x7f0b077e, 0x7f0b077f, 0x7f0b077d, 0x7f0b0783, 0x7f0b0785, 0x7f0b0781, 0x7f0b0788, 0x7f0b078c
    };
    ApplicationInfo mApp;
    private Drawable mAppIcon;
    private final BroadcastReceiver mCheckKillProcessesReceiver = new BroadcastReceiver() {

        final PowerUsageDetail this$0;

        public void onReceive(Context context, Intent intent)
        {
            Button button = mForceStopButton;
            boolean flag;
            if (getResultCode() != 0)
                flag = true;
            else
                flag = false;
            button.setEnabled(flag);
        }

            
            {
                this$0 = PowerUsageDetail.this;
                super();
            }
    }
;
    private ViewGroup mControlsParent;
    private ViewGroup mDetailsParent;
    private DevicePolicyManager mDpm;
    private DrainType mDrainType;
    private Button mForceStopButton;
    ComponentName mInstaller;
    private double mNoCoverage;
    private String mPackages[];
    private PackageManager mPm;
    private Button mReportButton;
    private View mRootView;
    private long mStartTime;
    private String mTitle;
    private TextView mTitleView;
    private ViewGroup mTwoButtonsPanel;
    private int mTypes[];
    private int mUid;
    private int mUsageSince;
    private boolean mUsesGps;
    private double mValues[];


    private void addControl(int i, int j, int k)
    {
        Resources resources = getResources();
        ViewGroup viewgroup = (ViewGroup)getActivity().getLayoutInflater().inflate(0x7f040057, null);
        mControlsParent.addView(viewgroup);
        Button button = (Button)viewgroup.findViewById(0x7f080078);
        TextView textview = (TextView)viewgroup.findViewById(0x7f0800e5);
        button.setText(resources.getString(i));
        textview.setText(resources.getString(j));
        button.setOnClickListener(this);
        button.setTag(new Integer(k));
    }

    private void checkForceStop()
    {
        int j;
        if (mPackages == null || mUid < 10000)
        {
            mForceStopButton.setEnabled(false);
            return;
        }
        for (int i = 0; i < mPackages.length; i++)
            if (mDpm.packageHasActiveAdmins(mPackages[i]))
            {
                mForceStopButton.setEnabled(false);
                return;
            }

        j = 0;
_L2:
        if (j >= mPackages.length)
            break MISSING_BLOCK_LABEL_110;
        if ((0x200000 & mPm.getApplicationInfo(mPackages[j], 0).flags) != 0)
            break MISSING_BLOCK_LABEL_187;
        mForceStopButton.setEnabled(true);
        Intent intent = new Intent("android.intent.action.QUERY_PACKAGE_RESTART", Uri.fromParts("package", mPackages[0], null));
        intent.putExtra("android.intent.extra.PACKAGES", mPackages);
        intent.putExtra("android.intent.extra.UID", mUid);
        intent.putExtra("android.intent.extra.user_handle", mUid);
        getActivity().sendOrderedBroadcast(intent, null, mCheckKillProcessesReceiver, null, 0, null, null);
        return;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void createDetails()
    {
        Bundle bundle;
        int i;
        int j;
        String s;
        int k;
        bundle = getArguments();
        mTitle = bundle.getString("title");
        i = bundle.getInt("percent", 1);
        j = bundle.getInt("gauge", 1);
        mUsageSince = bundle.getInt("since", 1);
        mUid = bundle.getInt("uid", 0);
        mDrainType = (DrainType)bundle.getSerializable("drainType");
        mNoCoverage = bundle.getDouble("noCoverage", 0.0D);
        s = bundle.getString("iconPackage");
        k = bundle.getInt("iconId", 0);
        if (TextUtils.isEmpty(s))
            break MISSING_BLOCK_LABEL_603;
        PackageManager packagemanager;
        ApplicationInfo applicationinfo;
        packagemanager = getActivity().getPackageManager();
        applicationinfo = packagemanager.getPackageInfo(s, 0).applicationInfo;
        TextView textview;
        TextView textview1;
        Object aobj[];
        if (applicationinfo != null)
            try
            {
                mAppIcon = applicationinfo.loadIcon(packagemanager);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1) { }
        if (mAppIcon == null)
            mAppIcon = getActivity().getPackageManager().getDefaultActivityIcon();
        textview = (TextView)mRootView.findViewById(0x1020010);
        textview.setText(getDescriptionForDrainType());
        textview.setVisibility(0);
        mTypes = bundle.getIntArray("types");
        mValues = bundle.getDoubleArray("values");
        mTitleView = (TextView)mRootView.findViewById(0x1020016);
        mTitleView.setText(mTitle);
        textview1 = (TextView)mRootView.findViewById(0x1020014);
        aobj = new Object[1];
        aobj[0] = Integer.valueOf(i);
        textview1.setText(getString(0x7f0b0905, aobj));
        mTwoButtonsPanel = (ViewGroup)mRootView.findViewById(0x7f0800e8);
        mForceStopButton = (Button)mRootView.findViewById(0x7f080198);
        mReportButton = (Button)mRootView.findViewById(0x7f080199);
        mForceStopButton.setEnabled(false);
        ((ProgressBar)mRootView.findViewById(0x102000d)).setProgress(j);
        ((ImageView)mRootView.findViewById(0x1020006)).setImageDrawable(mAppIcon);
        mDetailsParent = (ViewGroup)mRootView.findViewById(0x7f0800e9);
        mControlsParent = (ViewGroup)mRootView.findViewById(0x7f0800ea);
        fillDetailsSection();
        fillPackagesSection(mUid);
        fillControlsSection(mUid);
        if (mUid >= 10000)
        {
            mForceStopButton.setText(0x7f0b063f);
            mForceStopButton.setTag(Integer.valueOf(7));
            mForceStopButton.setOnClickListener(this);
            mReportButton.setText(0x10403dc);
            mReportButton.setTag(Integer.valueOf(8));
            mReportButton.setOnClickListener(this);
            if (android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "send_action_app_error", 0) != 0)
            {
                Button button;
                boolean flag;
                if (mPackages != null && mPackages.length > 0)
                    try
                    {
                        mApp = getActivity().getPackageManager().getApplicationInfo(mPackages[0], 0);
                        mInstaller = ApplicationErrorReport.getErrorReportReceiver(getActivity(), mPackages[0], mApp.flags);
                    }
                    catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
                button = mReportButton;
                if (mInstaller != null)
                    flag = true;
                else
                    flag = false;
                button.setEnabled(flag);
                return;
            } else
            {
                mTwoButtonsPanel.setVisibility(8);
                return;
            }
        } else
        {
            mTwoButtonsPanel.setVisibility(8);
            return;
        }
        if (k != 0)
            mAppIcon = getActivity().getResources().getDrawable(k);
        break MISSING_BLOCK_LABEL_140;
    }

    private void doAction(int i)
    {
        PreferenceActivity preferenceactivity = (PreferenceActivity)getActivity();
        switch (i)
        {
        case 8: // '\b'
            reportBatteryUse();
            return;

        case 7: // '\007'
            killProcesses();
            return;

        case 6: // '\006'
            preferenceactivity.startPreferencePanel(com/android/settings/LocationSettings.getName(), null, 0x7f0b037a, null, null, 0);
            return;

        case 5: // '\005'
            startApplicationDetailsActivity();
            return;

        case 4: // '\004'
            preferenceactivity.startPreferencePanel(com/android/settings/WirelessSettings.getName(), null, 0x7f0b0350, null, null, 0);
            return;

        case 3: // '\003'
            preferenceactivity.startPreferencePanel(com/android/settings/bluetooth/BluetoothSettings.getName(), null, 0x7f0b03ca, null, null, 0);
            return;

        case 2: // '\002'
            preferenceactivity.startPreferencePanel(com/android/settings/wifi/WifiSettings.getName(), null, 0x7f0b0432, null, null, 0);
            return;

        case 1: // '\001'
            preferenceactivity.startPreferencePanel(com/android/settings/DisplaySettings.getName(), null, 0x7f0b04df, null, null, 0);
            return;
        }
    }

    private void fillControlsSection(int i)
    {
        PackageManager packagemanager;
        String as[];
        packagemanager = getActivity().getPackageManager();
        as = packagemanager.getPackagesForUid(i);
        if (as == null) goto _L2; else goto _L1
_L1:
        PackageInfo packageinfo1 = packagemanager.getPackageInfo(as[0], 0);
        PackageInfo packageinfo = packageinfo1;
_L11:
        boolean flag;
        boolean flag1;
        static class _cls2
        {

            static final int $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[];

            static 
            {
                $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType = new int[DrainType.values().length];
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[DrainType.APP.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[DrainType.SCREEN.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[DrainType.WIFI.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[DrainType.BLUETOOTH.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[DrainType.CELL.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4)
                {
                    return;
                }
            }
        }

        ApplicationInfo applicationinfo;
        if (packageinfo != null)
            applicationinfo = packageinfo.applicationInfo;
        else
            applicationinfo = null;
        flag = false;
        if (applicationinfo != null)
        {
            int j = 1 & applicationinfo.flags;
            flag = false;
            if (j != 0)
                flag = true;
        }
        flag1 = true;
        _cls2..SwitchMap.com.android.settings.fuelgauge.PowerUsageDetail.DrainType[mDrainType.ordinal()];
        JVM INSTR tableswitch 1 5: default 120
    //                   1 147
    //                   2 195
    //                   3 212
    //                   4 229
    //                   5 246;
           goto _L3 _L4 _L5 _L6 _L7 _L8
_L3:
        if (flag1)
            mControlsParent.setVisibility(8);
        return;
_L2:
        packageinfo = null;
        continue; /* Loop/switch isn't completed */
_L4:
        if (as != null && !flag)
        {
            addControl(0x7f0b0778, 0x7f0b0789, 5);
            flag1 = false;
        }
        if (mUsesGps)
        {
            addControl(0x7f0b037a, 0x7f0b078a, 6);
            flag1 = false;
        }
        continue; /* Loop/switch isn't completed */
_L5:
        addControl(0x7f0b050e, 0x7f0b0782, 1);
        flag1 = false;
        continue; /* Loop/switch isn't completed */
_L6:
        addControl(0x7f0b0432, 0x7f0b0784, 2);
        flag1 = false;
        continue; /* Loop/switch isn't completed */
_L7:
        addControl(0x7f0b03ca, 0x7f0b0786, 3);
        flag1 = false;
        continue; /* Loop/switch isn't completed */
_L8:
        if (mNoCoverage > 10D)
        {
            addControl(0x7f0b0350, 0x7f0b0780, 4);
            flag1 = false;
        }
        if (true) goto _L3; else goto _L9
_L9:
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        packageinfo = null;
        if (true) goto _L11; else goto _L10
_L10:
    }

    private void fillDetailsSection()
    {
        LayoutInflater layoutinflater = getActivity().getLayoutInflater();
        if (mTypes != null && mValues != null)
        {
            for (int i = 0; i < mTypes.length; i++)
            {
                if (mValues[i] <= 0.0D)
                    continue;
                String s = getString(mTypes[i]);
                String s1;
                switch (mTypes[i])
                {
                case 2131429230: 
                    mUsesGps = true;
                    // fall through

                case 2131429231: 
                case 2131429232: 
                case 2131429235: 
                case 2131429236: 
                case 2131429237: 
                default:
                    s1 = Utils.formatElapsedTime(getActivity(), mValues[i]);
                    break;

                case 2131429238: 
                    int j = (int)Math.floor(mValues[i]);
                    Activity activity = getActivity();
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(j);
                    s1 = activity.getString(0x7f0b0905, aobj);
                    break;

                case 2131429233: 
                case 2131429234: 
                    long l = (long)mValues[i];
                    s1 = Formatter.formatFileSize(getActivity(), l);
                    break;
                }
                ViewGroup viewgroup = (ViewGroup)layoutinflater.inflate(0x7f040058, null);
                mDetailsParent.addView(viewgroup);
                ((TextView)viewgroup.findViewById(0x7f0800b8)).setText((new StringBuilder()).append(s).append(" ").append(s1).toString());
            }

        }
    }

    private void fillPackagesSection(int i)
    {
        if (i >= 1) goto _L2; else goto _L1
_L1:
        removePackagesSection();
_L4:
        return;
_L2:
        ViewGroup viewgroup = (ViewGroup)mRootView.findViewById(0x7f0800ed);
        if (viewgroup == null) goto _L4; else goto _L3
_L3:
        LayoutInflater layoutinflater;
        PackageManager packagemanager;
        int j;
        layoutinflater = getActivity().getLayoutInflater();
        packagemanager = getActivity().getPackageManager();
        mPackages = packagemanager.getPackagesForUid(i);
        if (mPackages == null || mPackages.length < 2)
        {
            removePackagesSection();
            return;
        }
        j = 0;
_L6:
        if (j >= mPackages.length) goto _L4; else goto _L5
_L5:
        CharSequence charsequence = packagemanager.getApplicationInfo(mPackages[j], 0).loadLabel(packagemanager);
        if (charsequence == null)
            break MISSING_BLOCK_LABEL_126;
        mPackages[j] = charsequence.toString();
        ViewGroup viewgroup1 = (ViewGroup)layoutinflater.inflate(0x7f04005a, null);
        viewgroup.addView(viewgroup1);
        ((TextView)viewgroup1.findViewById(0x7f0800b8)).setText(mPackages[j]);
_L7:
        j++;
          goto _L6
          goto _L4
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
          goto _L7
    }

    private String getDescriptionForDrainType()
    {
        return getResources().getString(sDrainTypeDesciptions[mDrainType.ordinal()]);
    }

    private void killProcesses()
    {
        if (mPackages == null)
            return;
        ActivityManager activitymanager = (ActivityManager)getActivity().getSystemService("activity");
        for (int i = 0; i < mPackages.length; i++)
            activitymanager.forceStopPackage(mPackages[i]);

        checkForceStop();
    }

    private void removePackagesSection()
    {
        View view = mRootView.findViewById(0x7f0800ec);
        if (view != null)
            view.setVisibility(8);
        View view1 = mRootView.findViewById(0x7f0800ed);
        if (view1 != null)
            view1.setVisibility(8);
    }

    private void reportBatteryUse()
    {
        if (mPackages == null)
            return;
        ApplicationErrorReport applicationerrorreport = new ApplicationErrorReport();
        applicationerrorreport.type = 3;
        applicationerrorreport.packageName = mPackages[0];
        applicationerrorreport.installerPackageName = mInstaller.getPackageName();
        applicationerrorreport.processName = mPackages[0];
        applicationerrorreport.time = System.currentTimeMillis();
        int i = 1 & mApp.flags;
        boolean flag = false;
        if (i != 0)
            flag = true;
        applicationerrorreport.systemApp = flag;
        Bundle bundle = getArguments();
        android.app.ApplicationErrorReport.BatteryInfo batteryinfo = new android.app.ApplicationErrorReport.BatteryInfo();
        batteryinfo.usagePercent = bundle.getInt("percent", 1);
        batteryinfo.durationMicros = bundle.getLong("duration", 0L);
        batteryinfo.usageDetails = bundle.getString("report_details");
        batteryinfo.checkinDetails = bundle.getString("report_checkin_details");
        applicationerrorreport.batteryInfo = batteryinfo;
        Intent intent = new Intent("android.intent.action.APP_ERROR");
        intent.setComponent(mInstaller);
        intent.putExtra("android.intent.extra.BUG_REPORT", applicationerrorreport);
        intent.addFlags(0x10000000);
        startActivity(intent);
    }

    private void startApplicationDetailsActivity()
    {
        Bundle bundle = new Bundle();
        bundle.putString("package", mPackages[0]);
        ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/applications/InstalledAppDetails.getName(), bundle, 0x7f0b0635, null, null, 0);
    }

    public void onClick(View view)
    {
        doAction(((Integer)view.getTag()).intValue());
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mPm = getActivity().getPackageManager();
        mDpm = (DevicePolicyManager)getActivity().getSystemService("device_policy");
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f040059, viewgroup, false);
        Utils.prepareCustomPreferencesList(viewgroup, view, view, false);
        mRootView = view;
        createDetails();
        return view;
    }

    public void onPause()
    {
        super.onPause();
    }

    public void onResume()
    {
        super.onResume();
        mStartTime = Process.getElapsedCpuTime();
        checkForceStop();
    }


}
