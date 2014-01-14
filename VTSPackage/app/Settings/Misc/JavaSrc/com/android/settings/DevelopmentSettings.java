// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.app.backup.IBackupManager;
import android.content.*;
import android.content.pm.IPackageManager;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.IWindowManager;
import android.widget.*;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings:
//            Utils, AppPicker

public class DevelopmentSettings extends PreferenceFragment
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener, android.preference.Preference.OnPreferenceChangeListener, android.widget.CompoundButton.OnCheckedChangeListener
{
    public static class ConfirmEnforceFragment extends DialogFragment
    {

        public static void show(DevelopmentSettings developmentsettings)
        {
            ConfirmEnforceFragment confirmenforcefragment = new ConfirmEnforceFragment();
            confirmenforcefragment.setTargetFragment(developmentsettings, 0);
            confirmenforcefragment.show(developmentsettings.getFragmentManager(), "confirm_enforce");
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            builder.setTitle(0x7f0b0719);
            builder.setMessage(0x7f0b071a);
            builder.setPositiveButton(0x104000a, activity. new android.content.DialogInterface.OnClickListener() {

                final ConfirmEnforceFragment this$0;
                final Context val$context;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DevelopmentSettings.setPermissionEnforced(context, "android.permission.READ_EXTERNAL_STORAGE", true);
                    ((DevelopmentSettings)getTargetFragment()).updateAllOptions();
                }

            
            {
                this$0 = final_confirmenforcefragment;
                context = Context.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

                final ConfirmEnforceFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    ((DevelopmentSettings)getTargetFragment()).updateAllOptions();
                }

            
            {
                this$0 = ConfirmEnforceFragment.this;
                super();
            }
            }
);
            return builder.create();
        }

    }

    static class SystemPropPoker extends AsyncTask
    {

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient Void doInBackground(Void avoid[])
        {
            String as[] = ServiceManager.listServices();
            int i = as.length;
            int j = 0;
            while (j < i) 
            {
                String s = as[j];
                IBinder ibinder = ServiceManager.checkService(s);
                if (ibinder != null)
                {
                    Parcel parcel = Parcel.obtain();
                    RemoteException remoteexception;
                    try
                    {
                        ibinder.transact(0x5f535052, parcel, null, 0);
                    }
                    catch (RemoteException remoteexception1) { }
                    catch (Exception exception)
                    {
                        Log.i("DevSettings", (new StringBuilder()).append("Somone wrote a bad service '").append(s).append("' that doesn't like to be poked: ").append(exception).toString());
                    }
                    parcel.recycle();
                }
                j++;
            }
            break MISSING_BLOCK_LABEL_67;
            remoteexception;
            return null;
        }

    }


    private static final String ALLOW_MOCK_LOCATION = "allow_mock_location";
    private static final String ANIMATOR_DURATION_SCALE_KEY = "animator_duration_scale";
    private static final String APP_PROCESS_LIMIT_KEY = "app_process_limit";
    private static final String BUGREPORT = "bugreport";
    private static final String BUGREPORT_IN_POWER_KEY = "bugreport_in_power";
    private static final String DEBUG_APP_KEY = "debug_app";
    private static final String DEBUG_DEBUGGING_CATEGORY_KEY = "debug_debugging_category";
    private static final String DEBUG_DRAWING_CATEGORY_KEY = "debug_drawing_category";
    private static final String DEBUG_LAYOUT_KEY = "debug_layout";
    private static final String DISABLE_OVERLAYS_KEY = "disable_overlays";
    private static final String ENABLE_ADB = "enable_adb";
    private static final String ENABLE_TRACES_KEY = "enable_traces";
    private static final String ENFORCE_READ_EXTERNAL = "enforce_read_external";
    private static final String FORCE_HARDWARE_UI_KEY = "force_hw_ui";
    private static final String FORCE_MSAA_KEY = "force_msaa";
    private static final String HARDWARE_UI_PROPERTY = "persist.sys.ui.hw";
    private static final String HDCP_CHECKING_KEY = "hdcp_checking";
    private static final String HDCP_CHECKING_PROPERTY = "persist.sys.hdcp_checking";
    private static final String IMMEDIATELY_DESTROY_ACTIVITIES_KEY = "immediately_destroy_activities";
    private static final String KEEP_SCREEN_ON = "keep_screen_on";
    private static final String LOCAL_BACKUP_PASSWORD = "local_backup_password";
    private static final String MSAA_PROPERTY = "debug.egl.force_msaa";
    private static final String OPENGL_TRACES_KEY = "enable_opengl_traces";
    private static final String OPENGL_TRACES_PROPERTY = "debug.egl.trace";
    private static final String OVERLAY_DISPLAY_DEVICES_KEY = "overlay_display_devices";
    private static final String PACKAGE_MIME_TYPE = "application/vnd.android.package-archive";
    private static final String POINTER_LOCATION_KEY = "pointer_location";
    public static final String PREF_FILE = "development";
    public static final String PREF_SHOW = "show";
    private static final int RESULT_DEBUG_APP = 1000;
    private static final String SHOW_ALL_ANRS_KEY = "show_all_anrs";
    private static final String SHOW_CPU_USAGE_KEY = "show_cpu_usage";
    private static final String SHOW_HW_LAYERS_UPDATES_KEY = "show_hw_layers_udpates";
    private static final String SHOW_HW_OVERDRAW_KEY = "show_hw_overdraw";
    private static final String SHOW_HW_SCREEN_UPDATES_KEY = "show_hw_screen_udpates";
    private static final String SHOW_SCREEN_UPDATES_KEY = "show_screen_updates";
    private static final String SHOW_TOUCHES_KEY = "show_touches";
    private static final String STRICT_MODE_KEY = "strict_mode";
    private static final boolean SUPPORT_SECONDARY_DISPLAY = false;
    private static final String TAG = "DevelopmentSettings";
    private static final String TAG_CONFIRM_ENFORCE = "confirm_enforce";
    private static final String TRACK_FRAME_TIME_KEY = "track_frame_time";
    private static final String TRANSITION_ANIMATION_SCALE_KEY = "transition_animation_scale";
    private static final String VERIFY_APPS_OVER_USB_KEY = "verify_apps_over_usb";
    private static final String WAIT_FOR_DEBUGGER_KEY = "wait_for_debugger";
    private static final String WINDOW_ANIMATION_SCALE_KEY = "window_animation_scale";
    private Dialog mAdbDialog;
    private final ArrayList mAllPrefs = new ArrayList();
    private CheckBoxPreference mAllowMockLocation;
    private ListPreference mAnimatorDurationScale;
    private ListPreference mAppProcessLimit;
    private IBackupManager mBackupManager;
    private Preference mBugreport;
    private CheckBoxPreference mBugreportInPower;
    private String mDebugApp;
    private Preference mDebugAppPref;
    private CheckBoxPreference mDebugLayout;
    private boolean mDialogClicked;
    private CheckBoxPreference mDisableOverlays;
    private final HashSet mDisabledPrefs = new HashSet();
    private boolean mDontPokeProperties;
    private DevicePolicyManager mDpm;
    private CheckBoxPreference mEnableAdb;
    private Dialog mEnableDialog;
    private MultiCheckPreference mEnableTracesPref;
    private Switch mEnabledSwitch;
    private CheckBoxPreference mEnforceReadExternal;
    private CheckBoxPreference mForceHardwareUi;
    private CheckBoxPreference mForceMsaa;
    private boolean mHaveDebugSettings;
    private CheckBoxPreference mImmediatelyDestroyActivities;
    private CheckBoxPreference mKeepScreenOn;
    private boolean mLastEnabledState;
    private ListPreference mOpenGLTraces;
    private ListPreference mOverlayDisplayDevices;
    private PreferenceScreen mPassword;
    private CheckBoxPreference mPointerLocation;
    private final ArrayList mResetCbPrefs = new ArrayList();
    private CheckBoxPreference mShowAllANRs;
    private CheckBoxPreference mShowCpuUsage;
    private CheckBoxPreference mShowHwLayersUpdates;
    private CheckBoxPreference mShowHwOverdraw;
    private CheckBoxPreference mShowHwScreenUpdates;
    private CheckBoxPreference mShowScreenUpdates;
    private CheckBoxPreference mShowTouches;
    private CheckBoxPreference mStrictMode;
    private CheckBoxPreference mTrackFrameTime;
    private ListPreference mTransitionAnimationScale;
    private CheckBoxPreference mVerifyAppsOverUsb;
    private CheckBoxPreference mWaitForDebugger;
    private ListPreference mWindowAnimationScale;
    private IWindowManager mWindowManager;


    private static int currentStrictModeActiveIndex()
    {
        if (TextUtils.isEmpty(SystemProperties.get("persist.sys.strictmode.visual")))
            return 0;
        return !SystemProperties.getBoolean("persist.sys.strictmode.visual", false) ? 2 : 1;
    }

    private void disableForUser(Preference preference)
    {
        if (preference != null)
        {
            preference.setEnabled(false);
            mDisabledPrefs.add(preference);
        }
    }

    private void dismissDialogs()
    {
        if (mAdbDialog != null)
        {
            mAdbDialog.dismiss();
            mAdbDialog = null;
        }
        if (mEnableDialog != null)
        {
            mEnableDialog.dismiss();
            mEnableDialog = null;
        }
    }

    private boolean enableVerifierSetting()
    {
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        if (android.provider.Settings.Global.getInt(contentresolver, "adb_enabled", 0) != 0 && android.provider.Settings.Global.getInt(contentresolver, "package_verifier_enable", 1) != 0)
        {
            PackageManager packagemanager = getActivity().getPackageManager();
            Intent intent = new Intent("android.intent.action.PACKAGE_NEEDS_VERIFICATION");
            intent.setType("application/vnd.android.package-archive");
            intent.addFlags(1);
            if (packagemanager.queryBroadcastReceivers(intent, 0).size() != 0)
                return true;
        }
        return false;
    }

    private CheckBoxPreference findAndInitCheckboxPref(String s)
    {
        CheckBoxPreference checkboxpreference = (CheckBoxPreference)findPreference(s);
        if (checkboxpreference == null)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Cannot find preference with key = ").append(s).toString());
        } else
        {
            mAllPrefs.add(checkboxpreference);
            mResetCbPrefs.add(checkboxpreference);
            return checkboxpreference;
        }
    }

    private static boolean isPermissionEnforced(String s)
    {
        boolean flag;
        try
        {
            flag = ActivityThread.getPackageManager().isPermissionEnforced(s);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Problem talking with PackageManager", remoteexception);
        }
        return flag;
    }

    private void removeHdcpOptionsForProduction()
    {
        if ("user".equals(Build.TYPE))
        {
            Preference preference = findPreference("hdcp_checking");
            if (preference != null)
            {
                getPreferenceScreen().removePreference(preference);
                mAllPrefs.remove(preference);
            }
        }
    }

    private void resetDangerousOptions()
    {
        mDontPokeProperties = true;
        for (int i = 0; i < mResetCbPrefs.size(); i++)
        {
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)mResetCbPrefs.get(i);
            if (checkboxpreference.isChecked())
            {
                checkboxpreference.setChecked(false);
                onPreferenceTreeClick(null, checkboxpreference);
            }
        }

        resetDebuggerOptions();
        writeAnimationScaleOption(0, mWindowAnimationScale, null);
        writeAnimationScaleOption(1, mTransitionAnimationScale, null);
        writeAnimationScaleOption(2, mAnimatorDurationScale, null);
        writeOverlayDisplayDevicesOptions(null);
        writeEnableTracesOptions(0L);
        writeAppProcessLimitOptions(null);
        mHaveDebugSettings = false;
        updateAllOptions();
        mDontPokeProperties = false;
        pokeSystemProperties();
    }

    private static void resetDebuggerOptions()
    {
        try
        {
            ActivityManagerNative.getDefault().setDebugApp(null, false, true);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private static void setPermissionEnforced(Context context, String s, boolean flag)
    {
        try
        {
            ActivityThread.getPackageManager().setPermissionEnforced("android.permission.READ_EXTERNAL_STORAGE", flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Problem talking with PackageManager", remoteexception);
        }
    }

    private void setPrefsEnabledState(boolean flag)
    {
        for (int i = 0; i < mAllPrefs.size(); i++)
        {
            Preference preference = (Preference)mAllPrefs.get(i);
            boolean flag1;
            if (flag && !mDisabledPrefs.contains(preference))
                flag1 = true;
            else
                flag1 = false;
            preference.setEnabled(flag1);
        }

        updateAllOptions();
    }

    private boolean showVerifierSetting()
    {
        return android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "verifier_setting_visible", 1) > 0;
    }

    private void updateAllOptions()
    {
        boolean flag = true;
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        mHaveDebugSettings = false;
        if (mAdbDialog != null && mAdbDialog.isShowing())
        {
            updateCheckBox(mEnableAdb, flag);
        } else
        {
            CheckBoxPreference checkboxpreference = mEnableAdb;
            boolean flag1;
            if (android.provider.Settings.Global.getInt(contentresolver, "adb_enabled", 0) != 0)
                flag1 = flag;
            else
                flag1 = false;
            updateCheckBox(checkboxpreference, flag1);
        }
        CheckBoxPreference checkboxpreference1 = mBugreportInPower;
        boolean flag2;
        if (android.provider.Settings.Secure.getInt(contentresolver, "bugreport_in_power_menu", 0) != 0)
            flag2 = flag;
        else
            flag2 = false;
        updateCheckBox(checkboxpreference1, flag2);
        CheckBoxPreference checkboxpreference2 = mKeepScreenOn;
        boolean flag3;
        if (android.provider.Settings.Global.getInt(contentresolver, "stay_on_while_plugged_in", 0) != 0)
            flag3 = flag;
        else
            flag3 = false;
        updateCheckBox(checkboxpreference2, flag3);
        updateCheckBox(mEnforceReadExternal, isPermissionEnforced("android.permission.READ_EXTERNAL_STORAGE"));
        CheckBoxPreference checkboxpreference3 = mAllowMockLocation;
        if (android.provider.Settings.Secure.getInt(contentresolver, "mock_location", 0) == 0)
            flag = false;
        updateCheckBox(checkboxpreference3, flag);
        updateHdcpValues();
        updatePasswordSummary();
        updateDebuggerOptions();
        updateStrictModeVisualOptions();
        updatePointerLocationOptions();
        updateShowTouchesOptions();
        updateFlingerOptions();
        updateCpuUsageOptions();
        updateHardwareUiOptions();
        updateMsaaOptions();
        updateTrackFrameTimeOptions();
        updateShowHwScreenUpdatesOptions();
        updateShowHwLayersUpdatesOptions();
        updateShowHwOverdrawOptions();
        updateDebugLayoutOptions();
        updateAnimationScaleOptions();
        updateOverlayDisplayDevicesOptions();
        updateOpenGLTracesOptions();
        updateEnableTracesOptions();
        updateImmediatelyDestroyActivitiesOptions();
        updateAppProcessLimitOptions();
        updateShowAllANRsOptions();
        updateVerifyAppsOverUsbOptions();
        updateBugreportOptions();
    }

    private void updateAnimationScaleOptions()
    {
        updateAnimationScaleValue(0, mWindowAnimationScale);
        updateAnimationScaleValue(1, mTransitionAnimationScale);
        updateAnimationScaleValue(2, mAnimatorDurationScale);
    }

    private void updateAnimationScaleValue(int i, ListPreference listpreference)
    {
        int j;
        float f;
        CharSequence acharsequence[];
        try
        {
            f = mWindowManager.getAnimationScale(i);
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (f == 1.0F)
            break MISSING_BLOCK_LABEL_24;
        mHaveDebugSettings = true;
        acharsequence = listpreference.getEntryValues();
        j = 0;
_L2:
        if (j < acharsequence.length)
        {
            if (f <= Float.parseFloat(acharsequence[j].toString()))
            {
                listpreference.setValueIndex(j);
                listpreference.setSummary(listpreference.getEntries()[j]);
                return;
            }
            break MISSING_BLOCK_LABEL_98;
        }
        listpreference.setValueIndex(-1 + acharsequence.length);
        listpreference.setSummary(listpreference.getEntries()[0]);
        return;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void updateAppProcessLimitOptions()
    {
        int j;
        int i;
        CharSequence acharsequence[];
        try
        {
            i = ActivityManagerNative.getDefault().getProcessLimit();
            acharsequence = mAppProcessLimit.getEntryValues();
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        j = 0;
_L2:
        if (j >= acharsequence.length)
            break MISSING_BLOCK_LABEL_78;
        if (Integer.parseInt(acharsequence[j].toString()) < i)
            break MISSING_BLOCK_LABEL_105;
        if (j == 0)
            break MISSING_BLOCK_LABEL_51;
        mHaveDebugSettings = true;
        mAppProcessLimit.setValueIndex(j);
        mAppProcessLimit.setSummary(mAppProcessLimit.getEntries()[j]);
        return;
        mAppProcessLimit.setValueIndex(0);
        mAppProcessLimit.setSummary(mAppProcessLimit.getEntries()[0]);
        return;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void updateBugreportOptions()
    {
        if ("user".equals(Build.TYPE))
        {
            android.content.ContentResolver contentresolver = getActivity().getContentResolver();
            boolean flag;
            if (android.provider.Settings.Global.getInt(contentresolver, "adb_enabled", 0) != 0)
                flag = true;
            else
                flag = false;
            if (flag)
            {
                mBugreport.setEnabled(true);
                mBugreportInPower.setEnabled(true);
                return;
            } else
            {
                mBugreport.setEnabled(false);
                mBugreportInPower.setEnabled(false);
                mBugreportInPower.setChecked(false);
                android.provider.Settings.Secure.putInt(contentresolver, "bugreport_in_power_menu", 0);
                return;
            }
        } else
        {
            mBugreportInPower.setEnabled(true);
            return;
        }
    }

    private void updateCpuUsageOptions()
    {
        CheckBoxPreference checkboxpreference = mShowCpuUsage;
        int i = android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "show_processes", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateDebugLayoutOptions()
    {
        updateCheckBox(mDebugLayout, SystemProperties.getBoolean("debug.layout", false));
    }

    private void updateDebuggerOptions()
    {
        String s;
        mDebugApp = android.provider.Settings.Global.getString(getActivity().getContentResolver(), "debug_app");
        CheckBoxPreference checkboxpreference = mWaitForDebugger;
        boolean flag;
        android.content.pm.ApplicationInfo applicationinfo;
        CharSequence charsequence;
        String s1;
        if (android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "wait_for_debugger", 0) != 0)
            flag = true;
        else
            flag = false;
        updateCheckBox(checkboxpreference, flag);
        if (mDebugApp == null || mDebugApp.length() <= 0) goto _L2; else goto _L1
_L1:
        applicationinfo = getActivity().getPackageManager().getApplicationInfo(mDebugApp, 512);
        charsequence = getActivity().getPackageManager().getApplicationLabel(applicationinfo);
        if (charsequence == null) goto _L4; else goto _L3
_L3:
        s1 = charsequence.toString();
        s = s1;
_L5:
        mDebugAppPref.setSummary(getResources().getString(0x7f0b0861, new Object[] {
            s
        }));
        mWaitForDebugger.setEnabled(true);
        mHaveDebugSettings = true;
        return;
_L4:
        try
        {
            s = mDebugApp;
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            s = mDebugApp;
        }
        if (true) goto _L5; else goto _L2
_L2:
        mDebugAppPref.setSummary(getResources().getString(0x7f0b0860));
        mWaitForDebugger.setEnabled(false);
        return;
    }

    private void updateEnableTracesOptions()
    {
        long l = SystemProperties.getLong("debug.atrace.tags.enableflags", 0L);
        String as[] = mEnableTracesPref.getEntryValues();
        int i = 0;
        for (int j = 1; j <= as.length; j++)
        {
            boolean flag;
            if ((l & (long)(1 << j)) != 0L)
                flag = true;
            else
                flag = false;
            mEnableTracesPref.setValue(j - 1, flag);
            if (flag)
                i++;
        }

        if (i == 0)
        {
            mEnableTracesPref.setSummary(0x7f0b087b);
            return;
        }
        if (i == as.length)
        {
            mHaveDebugSettings = true;
            mEnableTracesPref.setSummary(0x7f0b087d);
            return;
        } else
        {
            mHaveDebugSettings = true;
            MultiCheckPreference multicheckpreference = mEnableTracesPref;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            multicheckpreference.setSummary(getString(0x7f0b087c, aobj));
            return;
        }
    }

    private void updateFlingerOptions()
    {
        boolean flag = true;
        IBinder ibinder;
        Parcel parcel;
        Parcel parcel1;
        int i;
        CheckBoxPreference checkboxpreference;
        boolean flag1;
        int j;
        CheckBoxPreference checkboxpreference1;
        try
        {
            ibinder = ServiceManager.getService("SurfaceFlinger");
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_128;
        parcel = Parcel.obtain();
        parcel1 = Parcel.obtain();
        parcel.writeInterfaceToken("android.ui.ISurfaceComposer");
        ibinder.transact(1010, parcel, parcel1, 0);
        parcel1.readInt();
        parcel1.readInt();
        i = parcel1.readInt();
        checkboxpreference = mShowScreenUpdates;
        if (i != 0)
            flag1 = flag;
        else
            flag1 = false;
        updateCheckBox(checkboxpreference, flag1);
        parcel1.readInt();
        j = parcel1.readInt();
        checkboxpreference1 = mDisableOverlays;
        if (j == 0)
            flag = false;
        updateCheckBox(checkboxpreference1, flag);
        parcel1.recycle();
        parcel.recycle();
    }

    private void updateHardwareUiOptions()
    {
        updateCheckBox(mForceHardwareUi, SystemProperties.getBoolean("persist.sys.ui.hw", false));
    }

    private void updateHdcpValues()
    {
        int i;
        ListPreference listpreference;
        i = 1;
        listpreference = (ListPreference)findPreference("hdcp_checking");
        if (listpreference == null) goto _L2; else goto _L1
_L1:
        String s;
        String as[];
        String as1[];
        int j;
        s = SystemProperties.get("persist.sys.hdcp_checking");
        as = getResources().getStringArray(0x7f070033);
        as1 = getResources().getStringArray(0x7f070034);
        j = 0;
_L8:
        if (j >= as.length) goto _L4; else goto _L3
_L3:
        if (!s.equals(as[j])) goto _L6; else goto _L5
_L5:
        i = j;
_L4:
        listpreference.setValue(as[i]);
        listpreference.setSummary(as1[i]);
        listpreference.setOnPreferenceChangeListener(this);
_L2:
        return;
_L6:
        j++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    private void updateImmediatelyDestroyActivitiesOptions()
    {
        CheckBoxPreference checkboxpreference = mImmediatelyDestroyActivities;
        int i = android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "always_finish_activities", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateMsaaOptions()
    {
        updateCheckBox(mForceMsaa, SystemProperties.getBoolean("debug.egl.force_msaa", false));
    }

    private void updateOpenGLTracesOptions()
    {
        String s = SystemProperties.get("debug.egl.trace");
        if (s == null)
            s = "";
        CharSequence acharsequence[] = mOpenGLTraces.getEntryValues();
        for (int i = 0; i < acharsequence.length; i++)
            if (s.contentEquals(acharsequence[i]))
            {
                mOpenGLTraces.setValueIndex(i);
                mOpenGLTraces.setSummary(mOpenGLTraces.getEntries()[i]);
                return;
            }

        mOpenGLTraces.setValueIndex(0);
        mOpenGLTraces.setSummary(mOpenGLTraces.getEntries()[0]);
    }

    private void updateOverlayDisplayDevicesOptions()
    {
        String s = android.provider.Settings.Global.getString(getActivity().getContentResolver(), "overlay_display_devices");
        if (s == null)
            s = "";
        CharSequence acharsequence[] = mOverlayDisplayDevices.getEntryValues();
        for (int i = 0; i < acharsequence.length; i++)
            if (s.contentEquals(acharsequence[i]))
            {
                mOverlayDisplayDevices.setValueIndex(i);
                mOverlayDisplayDevices.setSummary(mOverlayDisplayDevices.getEntries()[i]);
                return;
            }

        mOverlayDisplayDevices.setValueIndex(0);
        mOverlayDisplayDevices.setSummary(mOverlayDisplayDevices.getEntries()[0]);
    }

    private void updatePasswordSummary()
    {
        try
        {
            if (mBackupManager.hasBackupPassword())
            {
                mPassword.setSummary(0x7f0b07f7);
                return;
            }
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        mPassword.setSummary(0x7f0b07f6);
        return;
    }

    private void updatePointerLocationOptions()
    {
        CheckBoxPreference checkboxpreference = mPointerLocation;
        int i = android.provider.Settings.System.getInt(getActivity().getContentResolver(), "pointer_location", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateShowAllANRsOptions()
    {
        CheckBoxPreference checkboxpreference = mShowAllANRs;
        int i = android.provider.Settings.Secure.getInt(getActivity().getContentResolver(), "anr_show_background", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateShowHwLayersUpdatesOptions()
    {
        updateCheckBox(mShowHwLayersUpdates, SystemProperties.getBoolean("debug.hwui.show_layers_updates", false));
    }

    private void updateShowHwOverdrawOptions()
    {
        updateCheckBox(mShowHwOverdraw, SystemProperties.getBoolean("debug.hwui.show_overdraw", false));
    }

    private void updateShowHwScreenUpdatesOptions()
    {
        updateCheckBox(mShowHwScreenUpdates, SystemProperties.getBoolean("debug.hwui.show_dirty_regions", false));
    }

    private void updateShowTouchesOptions()
    {
        CheckBoxPreference checkboxpreference = mShowTouches;
        int i = android.provider.Settings.System.getInt(getActivity().getContentResolver(), "show_touches", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateStrictModeVisualOptions()
    {
        boolean flag = true;
        CheckBoxPreference checkboxpreference = mStrictMode;
        if (currentStrictModeActiveIndex() != flag)
            flag = false;
        updateCheckBox(checkboxpreference, flag);
    }

    private void updateTrackFrameTimeOptions()
    {
        updateCheckBox(mTrackFrameTime, SystemProperties.getBoolean("debug.hwui.profile", false));
    }

    private void updateVerifyAppsOverUsbOptions()
    {
        boolean flag = true;
        CheckBoxPreference checkboxpreference = mVerifyAppsOverUsb;
        if (android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "verifier_verify_adb_installs", flag) == 0)
            flag = false;
        updateCheckBox(checkboxpreference, flag);
        mVerifyAppsOverUsb.setEnabled(enableVerifierSetting());
    }

    private void writeAnimationScaleOption(int i, ListPreference listpreference, Object obj)
    {
        if (obj == null)
            break MISSING_BLOCK_LABEL_32;
        float f = Float.parseFloat(obj.toString());
_L1:
        mWindowManager.setAnimationScale(i, f);
        updateAnimationScaleValue(i, listpreference);
        return;
        f = 1.0F;
          goto _L1
        RemoteException remoteexception;
        remoteexception;
    }

    private void writeAppProcessLimitOptions(Object obj)
    {
        if (obj == null)
            break MISSING_BLOCK_LABEL_26;
        int i = Integer.parseInt(obj.toString());
_L1:
        ActivityManagerNative.getDefault().setProcessLimit(i);
        updateAppProcessLimitOptions();
        return;
        i = -1;
          goto _L1
        RemoteException remoteexception;
        remoteexception;
    }

    private void writeCpuUsageOptions()
    {
        boolean flag = mShowCpuUsage.isChecked();
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "show_processes", i);
        Intent intent = (new Intent()).setClassName("com.android.systemui", "com.android.systemui.LoadAverageService");
        if (flag)
        {
            getActivity().startService(intent);
            return;
        } else
        {
            getActivity().stopService(intent);
            return;
        }
    }

    private void writeDebugLayoutOptions()
    {
        String s;
        if (mDebugLayout.isChecked())
            s = "true";
        else
            s = "false";
        SystemProperties.set("debug.layout", s);
        pokeSystemProperties();
    }

    private void writeDebuggerOptions()
    {
        try
        {
            ActivityManagerNative.getDefault().setDebugApp(mDebugApp, mWaitForDebugger.isChecked(), true);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void writeDisableOverlaysOption()
    {
        IBinder ibinder;
        Parcel parcel;
        boolean flag;
        int i;
        try
        {
            ibinder = ServiceManager.getService("SurfaceFlinger");
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_69;
        parcel = Parcel.obtain();
        parcel.writeInterfaceToken("android.ui.ISurfaceComposer");
        flag = mDisableOverlays.isChecked();
        i = 0;
        if (flag)
            i = 1;
        parcel.writeInt(i);
        ibinder.transact(1008, parcel, null, 0);
        parcel.recycle();
        updateFlingerOptions();
    }

    private void writeEnableTracesOptions()
    {
        long l = 0L;
        String as[] = mEnableTracesPref.getEntryValues();
        for (int i = 1; i <= as.length; i++)
            if (mEnableTracesPref.getValue(i - 1))
                l |= 1 << i;

        writeEnableTracesOptions(l);
        updateEnableTracesOptions();
    }

    private void writeEnableTracesOptions(long l)
    {
        SystemProperties.set("debug.atrace.tags.enableflags", (new StringBuilder()).append("0x").append(Long.toString(l, 16)).toString());
        pokeSystemProperties();
    }

    private void writeHardwareUiOptions()
    {
        String s;
        if (mForceHardwareUi.isChecked())
            s = "true";
        else
            s = "false";
        SystemProperties.set("persist.sys.ui.hw", s);
        pokeSystemProperties();
    }

    private void writeImmediatelyDestroyActivitiesOptions()
    {
        try
        {
            ActivityManagerNative.getDefault().setAlwaysFinish(mImmediatelyDestroyActivities.isChecked());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void writeMsaaOptions()
    {
        String s;
        if (mForceMsaa.isChecked())
            s = "true";
        else
            s = "false";
        SystemProperties.set("debug.egl.force_msaa", s);
        pokeSystemProperties();
    }

    private void writeOpenGLTracesOptions(Object obj)
    {
        String s;
        if (obj == null)
            s = "";
        else
            s = obj.toString();
        SystemProperties.set("debug.egl.trace", s);
        pokeSystemProperties();
        updateOpenGLTracesOptions();
    }

    private void writeOverlayDisplayDevicesOptions(Object obj)
    {
        android.provider.Settings.Global.putString(getActivity().getContentResolver(), "overlay_display_devices", (String)obj);
        updateOverlayDisplayDevicesOptions();
    }

    private void writePointerLocationOptions()
    {
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (mPointerLocation.isChecked())
            i = 1;
        else
            i = 0;
        android.provider.Settings.System.putInt(contentresolver, "pointer_location", i);
    }

    private void writeShowAllANRsOptions()
    {
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (mShowAllANRs.isChecked())
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(contentresolver, "anr_show_background", i);
    }

    private void writeShowHwLayersUpdatesOptions()
    {
        String s;
        if (mShowHwLayersUpdates.isChecked())
            s = "true";
        else
            s = null;
        SystemProperties.set("debug.hwui.show_layers_updates", s);
        pokeSystemProperties();
    }

    private void writeShowHwOverdrawOptions()
    {
        String s;
        if (mShowHwOverdraw.isChecked())
            s = "true";
        else
            s = null;
        SystemProperties.set("debug.hwui.show_overdraw", s);
        pokeSystemProperties();
    }

    private void writeShowHwScreenUpdatesOptions()
    {
        String s;
        if (mShowHwScreenUpdates.isChecked())
            s = "true";
        else
            s = null;
        SystemProperties.set("debug.hwui.show_dirty_regions", s);
        pokeSystemProperties();
    }

    private void writeShowTouchesOptions()
    {
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (mShowTouches.isChecked())
            i = 1;
        else
            i = 0;
        android.provider.Settings.System.putInt(contentresolver, "show_touches", i);
    }

    private void writeShowUpdatesOption()
    {
        IBinder ibinder;
        Parcel parcel;
        boolean flag;
        int i;
        try
        {
            ibinder = ServiceManager.getService("SurfaceFlinger");
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_69;
        parcel = Parcel.obtain();
        parcel.writeInterfaceToken("android.ui.ISurfaceComposer");
        flag = mShowScreenUpdates.isChecked();
        i = 0;
        if (flag)
            i = 1;
        parcel.writeInt(i);
        ibinder.transact(1002, parcel, null, 0);
        parcel.recycle();
        updateFlingerOptions();
    }

    private void writeStrictModeVisualOptions()
    {
        IWindowManager iwindowmanager = mWindowManager;
        String s;
        if (mStrictMode.isChecked())
            s = "1";
        else
            s = "";
        try
        {
            iwindowmanager.setStrictModeVisualIndicatorPreference(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void writeTrackFrameTimeOptions()
    {
        String s;
        if (mTrackFrameTime.isChecked())
            s = "true";
        else
            s = "false";
        SystemProperties.set("debug.hwui.profile", s);
        pokeSystemProperties();
    }

    private void writeVerifyAppsOverUsbOptions()
    {
        android.content.ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (mVerifyAppsOverUsb.isChecked())
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "verifier_verify_adb_installs", i);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mEnabledSwitch = new Switch(activity);
        int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
        mEnabledSwitch.setPadding(0, 0, i, 0);
        mEnabledSwitch.setOnCheckedChangeListener(this);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 1000)
        {
            if (j == -1)
            {
                mDebugApp = intent.getAction();
                writeDebuggerOptions();
                updateDebuggerOptions();
            }
            return;
        } else
        {
            super.onActivityResult(i, j, intent);
            return;
        }
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
label0:
        {
            if (compoundbutton == mEnabledSwitch && flag != mLastEnabledState)
            {
                if (!flag)
                    break label0;
                mDialogClicked = false;
                if (mEnableDialog != null)
                    dismissDialogs();
                mEnableDialog = (new android.app.AlertDialog.Builder(getActivity())).setMessage(getActivity().getResources().getString(0x7f0b0714)).setTitle(0x7f0b0713).setIconAttribute(0x1010355).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, this).show();
                mEnableDialog.setOnDismissListener(this);
            }
            return;
        }
        resetDangerousOptions();
        android.provider.Settings.Global.putInt(getActivity().getContentResolver(), "development_settings_enabled", 0);
        mLastEnabledState = flag;
        setPrefsEnabledState(mLastEnabledState);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (dialoginterface == mAdbDialog)
        {
            if (i == -1)
            {
                mDialogClicked = true;
                android.provider.Settings.Global.putInt(getActivity().getContentResolver(), "adb_enabled", 1);
                mVerifyAppsOverUsb.setEnabled(true);
                updateVerifyAppsOverUsbOptions();
                updateBugreportOptions();
            } else
            {
                mEnableAdb.setChecked(false);
                return;
            }
        } else
        if (dialoginterface == mEnableDialog)
            if (i == -1)
            {
                mDialogClicked = true;
                android.provider.Settings.Global.putInt(getActivity().getContentResolver(), "development_settings_enabled", 1);
                mLastEnabledState = true;
                mEnabledSwitch.setChecked(mLastEnabledState);
                setPrefsEnabledState(mLastEnabledState);
                return;
            } else
            {
                mEnabledSwitch.setChecked(false);
                return;
            }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        Xlog.d("DevelopmentSettings", "-->onConfigurationChanged");
        getListView().clearScrapViewsIfNeeded();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mWindowManager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        mBackupManager = android.app.backup.IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
        mDpm = (DevicePolicyManager)getActivity().getSystemService("device_policy");
        addPreferencesFromResource(0x7f05000e);
        mEnableAdb = findAndInitCheckboxPref("enable_adb");
        mBugreport = findPreference("bugreport");
        mBugreportInPower = findAndInitCheckboxPref("bugreport_in_power");
        mKeepScreenOn = findAndInitCheckboxPref("keep_screen_on");
        mEnforceReadExternal = findAndInitCheckboxPref("enforce_read_external");
        mAllowMockLocation = findAndInitCheckboxPref("allow_mock_location");
        mPassword = (PreferenceScreen)findPreference("local_backup_password");
        mAllPrefs.add(mPassword);
        if (!Process.myUserHandle().equals(UserHandle.OWNER))
        {
            disableForUser(mEnableAdb);
            disableForUser(mPassword);
        }
        mDebugAppPref = findPreference("debug_app");
        mAllPrefs.add(mDebugAppPref);
        mWaitForDebugger = findAndInitCheckboxPref("wait_for_debugger");
        mVerifyAppsOverUsb = findAndInitCheckboxPref("verify_apps_over_usb");
        if (!showVerifierSetting())
        {
            PreferenceGroup preferencegroup1 = (PreferenceGroup)findPreference("debug_debugging_category");
            if (preferencegroup1 != null)
                preferencegroup1.removePreference(mVerifyAppsOverUsb);
            else
                mVerifyAppsOverUsb.setEnabled(false);
        }
        mStrictMode = findAndInitCheckboxPref("strict_mode");
        mPointerLocation = findAndInitCheckboxPref("pointer_location");
        mShowTouches = findAndInitCheckboxPref("show_touches");
        mShowScreenUpdates = findAndInitCheckboxPref("show_screen_updates");
        mDisableOverlays = findAndInitCheckboxPref("disable_overlays");
        mShowCpuUsage = findAndInitCheckboxPref("show_cpu_usage");
        mForceHardwareUi = findAndInitCheckboxPref("force_hw_ui");
        mForceMsaa = findAndInitCheckboxPref("force_msaa");
        mTrackFrameTime = findAndInitCheckboxPref("track_frame_time");
        mShowHwScreenUpdates = findAndInitCheckboxPref("show_hw_screen_udpates");
        mShowHwLayersUpdates = findAndInitCheckboxPref("show_hw_layers_udpates");
        mShowHwOverdraw = findAndInitCheckboxPref("show_hw_overdraw");
        mDebugLayout = findAndInitCheckboxPref("debug_layout");
        mWindowAnimationScale = (ListPreference)findPreference("window_animation_scale");
        mAllPrefs.add(mWindowAnimationScale);
        mWindowAnimationScale.setOnPreferenceChangeListener(this);
        mTransitionAnimationScale = (ListPreference)findPreference("transition_animation_scale");
        mAllPrefs.add(mTransitionAnimationScale);
        mTransitionAnimationScale.setOnPreferenceChangeListener(this);
        mAnimatorDurationScale = (ListPreference)findPreference("animator_duration_scale");
        mAllPrefs.add(mAnimatorDurationScale);
        mAnimatorDurationScale.setOnPreferenceChangeListener(this);
        mOverlayDisplayDevices = (ListPreference)findPreference("overlay_display_devices");
        mAllPrefs.add(mOverlayDisplayDevices);
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("debug_drawing_category");
        if (preferencegroup != null)
            preferencegroup.removePreference(mOverlayDisplayDevices);
        mAllPrefs.remove(mOverlayDisplayDevices);
        mOverlayDisplayDevices.setOnPreferenceChangeListener(this);
        mOpenGLTraces = (ListPreference)findPreference("enable_opengl_traces");
        mAllPrefs.add(mOpenGLTraces);
        mOpenGLTraces.setOnPreferenceChangeListener(this);
        mEnableTracesPref = (MultiCheckPreference)findPreference("enable_traces");
        String as[] = new String[Trace.TRACE_TAGS.length];
        for (int i = 1; i <= as.length; i++)
            as[i - 1] = Integer.toString(1 << i);

        mEnableTracesPref.setEntries(Trace.TRACE_TAGS);
        mEnableTracesPref.setEntryValues(as);
        mAllPrefs.add(mEnableTracesPref);
        mEnableTracesPref.setOnPreferenceChangeListener(this);
        mImmediatelyDestroyActivities = (CheckBoxPreference)findPreference("immediately_destroy_activities");
        mAllPrefs.add(mImmediatelyDestroyActivities);
        mResetCbPrefs.add(mImmediatelyDestroyActivities);
        mAppProcessLimit = (ListPreference)findPreference("app_process_limit");
        mAllPrefs.add(mAppProcessLimit);
        mAppProcessLimit.setOnPreferenceChangeListener(this);
        mShowAllANRs = (CheckBoxPreference)findPreference("show_all_anrs");
        mAllPrefs.add(mShowAllANRs);
        mResetCbPrefs.add(mShowAllANRs);
        Preference preference = findPreference("hdcp_checking");
        if (preference != null)
            mAllPrefs.add(preference);
        removeHdcpOptionsForProduction();
    }

    public void onDestroy()
    {
        dismissDialogs();
        super.onDestroy();
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        if (dialoginterface == mAdbDialog)
        {
            if (!mDialogClicked)
                mEnableAdb.setChecked(false);
            mAdbDialog = null;
        } else
        if (dialoginterface == mEnableDialog)
        {
            if (!mDialogClicked)
                mEnabledSwitch.setChecked(false);
            mEnableDialog = null;
            return;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if ("hdcp_checking".equals(preference.getKey()))
        {
            SystemProperties.set("persist.sys.hdcp_checking", obj.toString());
            updateHdcpValues();
            pokeSystemProperties();
            return true;
        }
        if (preference == mWindowAnimationScale)
        {
            writeAnimationScaleOption(0, mWindowAnimationScale, obj);
            return true;
        }
        if (preference == mTransitionAnimationScale)
        {
            writeAnimationScaleOption(1, mTransitionAnimationScale, obj);
            return true;
        }
        if (preference == mAnimatorDurationScale)
        {
            writeAnimationScaleOption(2, mAnimatorDurationScale, obj);
            return true;
        }
        if (preference == mOverlayDisplayDevices)
        {
            writeOverlayDisplayDevicesOptions(obj);
            return true;
        }
        if (preference == mOpenGLTraces)
        {
            writeOpenGLTracesOptions(obj);
            return true;
        }
        if (preference == mEnableTracesPref)
        {
            writeEnableTracesOptions();
            return true;
        }
        if (preference == mAppProcessLimit)
        {
            writeAppProcessLimitOptions(obj);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        int i = 1;
        if (!Utils.isMonkeyRunning())
        {
            if (preference == mEnableAdb)
                if (mEnableAdb.isChecked())
                {
                    mDialogClicked = false;
                    if (mAdbDialog != null)
                        dismissDialogs();
                    mAdbDialog = (new android.app.AlertDialog.Builder(getActivity())).setMessage(getActivity().getResources().getString(0x7f0b0712)).setTitle(0x7f0b0711).setIconAttribute(0x1010355).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, this).show();
                    mAdbDialog.setOnDismissListener(this);
                    return false;
                } else
                {
                    android.provider.Settings.Global.putInt(getActivity().getContentResolver(), "adb_enabled", 0);
                    mVerifyAppsOverUsb.setEnabled(false);
                    mVerifyAppsOverUsb.setChecked(false);
                    updateBugreportOptions();
                    return false;
                }
            if (preference == mBugreportInPower)
            {
                android.content.ContentResolver contentresolver2 = getActivity().getContentResolver();
                if (!mBugreportInPower.isChecked())
                    i = 0;
                android.provider.Settings.Secure.putInt(contentresolver2, "bugreport_in_power_menu", i);
                return false;
            }
            if (preference == mKeepScreenOn)
            {
                android.content.ContentResolver contentresolver1 = getActivity().getContentResolver();
                byte byte0;
                if (mKeepScreenOn.isChecked())
                    byte0 = 3;
                else
                    byte0 = 0;
                android.provider.Settings.Global.putInt(contentresolver1, "stay_on_while_plugged_in", byte0);
                return false;
            }
            if (preference == mEnforceReadExternal)
                if (mEnforceReadExternal.isChecked())
                {
                    ConfirmEnforceFragment.show(this);
                    return false;
                } else
                {
                    setPermissionEnforced(getActivity(), "android.permission.READ_EXTERNAL_STORAGE", false);
                    return false;
                }
            if (preference == mAllowMockLocation)
            {
                android.content.ContentResolver contentresolver = getActivity().getContentResolver();
                if (!mAllowMockLocation.isChecked())
                    i = 0;
                android.provider.Settings.Secure.putInt(contentresolver, "mock_location", i);
                return false;
            }
            if (preference == mDebugAppPref)
            {
                startActivityForResult(new Intent(getActivity(), com/android/settings/AppPicker), 1000);
                return false;
            }
            if (preference == mWaitForDebugger)
            {
                writeDebuggerOptions();
                return false;
            }
            if (preference == mVerifyAppsOverUsb)
            {
                writeVerifyAppsOverUsbOptions();
                return false;
            }
            if (preference == mStrictMode)
            {
                writeStrictModeVisualOptions();
                return false;
            }
            if (preference == mPointerLocation)
            {
                writePointerLocationOptions();
                return false;
            }
            if (preference == mShowTouches)
            {
                writeShowTouchesOptions();
                return false;
            }
            if (preference == mShowScreenUpdates)
            {
                writeShowUpdatesOption();
                return false;
            }
            if (preference == mDisableOverlays)
            {
                writeDisableOverlaysOption();
                return false;
            }
            if (preference == mShowCpuUsage)
            {
                writeCpuUsageOptions();
                return false;
            }
            if (preference == mImmediatelyDestroyActivities)
            {
                writeImmediatelyDestroyActivitiesOptions();
                return false;
            }
            if (preference == mShowAllANRs)
            {
                writeShowAllANRsOptions();
                return false;
            }
            if (preference == mForceHardwareUi)
            {
                writeHardwareUiOptions();
                return false;
            }
            if (preference == mForceMsaa)
            {
                writeMsaaOptions();
                return false;
            }
            if (preference == mTrackFrameTime)
            {
                writeTrackFrameTimeOptions();
                return false;
            }
            if (preference == mShowHwScreenUpdates)
            {
                writeShowHwScreenUpdatesOptions();
                return false;
            }
            if (preference == mShowHwLayersUpdates)
            {
                writeShowHwLayersUpdatesOptions();
                return false;
            }
            if (preference == mShowHwOverdraw)
            {
                writeShowHwOverdrawOptions();
                return false;
            }
            if (preference == mDebugLayout)
            {
                writeDebugLayoutOptions();
                return false;
            }
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
        if (mDpm.getMaximumTimeToLock(null) > 0L)
            mDisabledPrefs.add(mKeepScreenOn);
        else
            mDisabledPrefs.remove(mKeepScreenOn);
        int i = android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "development_settings_enabled", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        mLastEnabledState = flag;
        if (mEnableDialog == null)
        {
            Xlog.d("DevelopmentSettings", "development enable dialog is null");
            mEnabledSwitch.setChecked(mLastEnabledState);
        }
        setPrefsEnabledState(mLastEnabledState);
        if (mHaveDebugSettings && !mLastEnabledState)
        {
            android.provider.Settings.Global.putInt(getActivity().getContentResolver(), "development_settings_enabled", 1);
            mLastEnabledState = true;
            mEnabledSwitch.setChecked(mLastEnabledState);
            setPrefsEnabledState(mLastEnabledState);
        }
    }

    public void onStart()
    {
        super.onStart();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(mEnabledSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
    }

    public void onStop()
    {
        super.onStop();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
    }

    void pokeSystemProperties()
    {
        if (!mDontPokeProperties)
            (new SystemPropPoker()).execute(new Void[0]);
    }

    void updateCheckBox(CheckBoxPreference checkboxpreference, boolean flag)
    {
        checkboxpreference.setChecked(flag);
        mHaveDebugSettings = flag | mHaveDebugSettings;
    }


}
