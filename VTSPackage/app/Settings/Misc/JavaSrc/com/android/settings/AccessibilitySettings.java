// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.*;
import com.android.internal.content.PackageMonitor;
import com.android.internal.view.RotationPolicy;
import java.util.*;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, DialogCreatable, Utils, AccessibilityEnableScriptInjectionPreference

public class AccessibilitySettings extends SettingsPreferenceFragment
    implements DialogCreatable, android.preference.Preference.OnPreferenceChangeListener
{
    private static abstract class SettingsContentObserver extends ContentObserver
    {

        public abstract void onChange(boolean flag, Uri uri);

        public void register(ContentResolver contentresolver)
        {
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("accessibility_enabled"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("enabled_accessibility_services"), false, this);
        }

        public void unregister(ContentResolver contentresolver)
        {
            contentresolver.unregisterContentObserver(this);
        }

        public SettingsContentObserver(Handler handler)
        {
            super(handler);
        }
    }

    private class SettingsPackageMonitor extends PackageMonitor
    {

        final AccessibilitySettings this$0;

        public void onPackageAdded(String s, int i)
        {
            Message message = mHandler.obtainMessage();
            mHandler.sendMessageDelayed(message, 1000L);
        }

        public void onPackageAppeared(String s, int i)
        {
            Message message = mHandler.obtainMessage();
            mHandler.sendMessageDelayed(message, 1000L);
        }

        public void onPackageDisappeared(String s, int i)
        {
            Message message = mHandler.obtainMessage();
            mHandler.sendMessageDelayed(message, 1000L);
        }

        public void onPackageRemoved(String s, int i)
        {
            Message message = mHandler.obtainMessage();
            mHandler.sendMessageDelayed(message, 1000L);
        }

        private SettingsPackageMonitor()
        {
            this$0 = AccessibilitySettings.this;
            super();
        }

    }

    public static class ToggleAccessibilityServicePreferenceFragment extends ToggleFeaturePreferenceFragment
        implements android.content.DialogInterface.OnClickListener
    {

        private static final int DIALOG_ID_DISABLE_WARNING = 2;
        private static final int DIALOG_ID_ENABLE_WARNING = 1;
        private String mComponentName;
        private CharSequence mDisableWarningMessage;
        private CharSequence mDisableWarningTitle;
        private CharSequence mEnableWarningMessage;
        private CharSequence mEnableWarningTitle;
        private final SettingsContentObserver mSettingsContentObserver = new _cls1(new Handler());
        private int mShownDialogId;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            boolean flag = true;
            switch (i)
            {
            case -2: 
                if (mShownDialogId != 2)
                    flag = false;
                super.mToggleSwitch.setCheckedInternal(flag);
                getArguments().putBoolean("checked", flag);
                onPreferenceToggled(super.mPreferenceKey, flag);
                return;

            case -1: 
                if (mShownDialogId != flag)
                    flag = false;
                super.mToggleSwitch.setCheckedInternal(flag);
                getArguments().putBoolean("checked", flag);
                onPreferenceToggled(super.mPreferenceKey, flag);
                return;
            }
            throw new IllegalArgumentException();
        }

        public Dialog onCreateDialog(int i)
        {
label0:
            {
                CharSequence charsequence;
                CharSequence charsequence1;
                switch (i)
                {
                default:
                    break label0;

                case 2: // '\002'
                    mShownDialogId = 2;
                    charsequence = mDisableWarningTitle;
                    charsequence1 = mDisableWarningMessage;
                    break;

                case 1: // '\001'
                    mShownDialogId = 1;
                    charsequence = mEnableWarningTitle;
                    charsequence1 = mEnableWarningMessage;
                    break;
                }
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(charsequence).setIconAttribute(0x1010355).setMessage(charsequence1).setCancelable(true).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, this).create();
            }
            throw new IllegalArgumentException();
        }

        protected void onInstallActionBarToggleSwitch()
        {
            super.onInstallActionBarToggleSwitch();
            super.mToggleSwitch.setOnBeforeCheckedChangeListener(new ToggleSwitch.OnBeforeCheckedChangeListener() {

                final ToggleAccessibilityServicePreferenceFragment this$0;

                public boolean onBeforeCheckedChanged(ToggleSwitch toggleswitch, boolean flag)
                {
                    if (flag)
                    {
                        if (!TextUtils.isEmpty(mEnableWarningMessage))
                        {
                            toggleswitch.setCheckedInternal(false);
                            getArguments().putBoolean("checked", false);
                            showDialog(1);
                            return true;
                        }
                        onPreferenceToggled(mPreferenceKey, true);
                    } else
                    {
                        if (!TextUtils.isEmpty(mDisableWarningMessage))
                        {
                            toggleswitch.setCheckedInternal(true);
                            getArguments().putBoolean("checked", true);
                            showDialog(2);
                            return true;
                        }
                        onPreferenceToggled(mPreferenceKey, false);
                    }
                    return false;
                }

            
            {
                this$0 = ToggleAccessibilityServicePreferenceFragment.this;
                super();
            }
            }
);
        }

        public void onPause()
        {
            mSettingsContentObserver.unregister(getContentResolver());
            super.onPause();
        }

        public void onPreferenceToggled(String s, boolean flag)
        {
            Set set = AccessibilitySettings.getEnabledServicesFromSettings(getActivity());
            ComponentName componentname = ComponentName.unflattenFromString(s);
            boolean flag1;
            if (flag)
            {
                flag1 = true;
                set.add(componentname);
            } else
            {
                int i = 0;
                Set set1 = AccessibilitySettings.sInstalledServices;
                Iterator iterator = set.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    if (set1.contains((ComponentName)iterator.next()))
                        i++;
                } while (true);
                if (i <= 1 && (i != 1 || set1.contains(componentname)))
                    flag1 = false;
                else
                    flag1 = true;
                set.remove(componentname);
            }
            StringBuilder stringbuilder = new StringBuilder();
            for (Iterator iterator1 = set.iterator(); iterator1.hasNext(); stringbuilder.append(':'))
                stringbuilder.append(((ComponentName)iterator1.next()).flattenToString());

            int j = stringbuilder.length();
            if (j > 0)
                stringbuilder.deleteCharAt(j - 1);
            android.provider.Settings.Secure.putString(getContentResolver(), "enabled_accessibility_services", stringbuilder.toString());
            ContentResolver contentresolver = getContentResolver();
            int k;
            if (flag1)
                k = 1;
            else
                k = 0;
            android.provider.Settings.Secure.putInt(contentresolver, "accessibility_enabled", k);
        }

        protected void onProcessArguments(Bundle bundle)
        {
            super.onProcessArguments(bundle);
            String s = bundle.getString("settings_title");
            String s1 = bundle.getString("settings_component_name");
            if (!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s1))
            {
                Intent intent = (new Intent("android.intent.action.MAIN")).setComponent(ComponentName.unflattenFromString(s1.toString()));
                if (!getPackageManager().queryIntentActivities(intent, 0).isEmpty())
                {
                    super.mSettingsTitle = s;
                    super.mSettingsIntent = intent;
                    setHasOptionsMenu(true);
                }
            }
            mEnableWarningTitle = bundle.getCharSequence("enable_warning_title");
            mEnableWarningMessage = bundle.getCharSequence("enable_warning_message");
            mDisableWarningTitle = bundle.getString("disable_warning_title");
            mDisableWarningMessage = bundle.getString("disable_warning_message");
            mComponentName = bundle.getString("service_component_name");
        }

        public void onResume()
        {
            mSettingsContentObserver.register(getContentResolver());
            super.onResume();
        }




    }

    public static abstract class ToggleFeaturePreferenceFragment extends SettingsPreferenceFragment
    {

        private CharSequence mOldActivityTitle;
        protected String mPreferenceKey;
        protected Intent mSettingsIntent;
        protected CharSequence mSettingsTitle;
        protected Preference mSummaryPreference;
        protected ToggleSwitch mToggleSwitch;

        private ToggleSwitch createAndAddActionBarToggleSwitch(Activity activity)
        {
            ToggleSwitch toggleswitch = new ToggleSwitch(activity);
            toggleswitch.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f0d0002), 0);
            activity.getActionBar().setDisplayOptions(16, 16);
            activity.getActionBar().setCustomView(toggleswitch, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
            return toggleswitch;
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            PreferenceScreen preferencescreen = getPreferenceManager().createPreferenceScreen(getActivity());
            setPreferenceScreen(preferencescreen);
            mSummaryPreference = new Preference(getActivity()) {

                final ToggleFeaturePreferenceFragment this$0;

                private void sendAccessibilityEvent(View view)
                {
                    AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(getActivity());
                    if (accessibilitymanager.isEnabled())
                    {
                        AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain();
                        accessibilityevent.setEventType(8);
                        view.onInitializeAccessibilityEvent(accessibilityevent);
                        view.dispatchPopulateAccessibilityEvent(accessibilityevent);
                        accessibilitymanager.sendAccessibilityEvent(accessibilityevent);
                    }
                }

                protected void onBindView(View view)
                {
                    super.onBindView(view);
                    TextView textview = (TextView)view.findViewById(0x7f0800e5);
                    textview.setText(getSummary());
                    sendAccessibilityEvent(textview);
                }

            
            {
                this$0 = ToggleFeaturePreferenceFragment.this;
                super(context);
            }
            }
;
            mSummaryPreference.setPersistent(false);
            mSummaryPreference.setLayoutResource(0x7f04008d);
            preferencescreen.addPreference(mSummaryPreference);
        }

        public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
        {
            super.onCreateOptionsMenu(menu, menuinflater);
            MenuItem menuitem = menu.add(mSettingsTitle);
            menuitem.setShowAsAction(1);
            menuitem.setIntent(mSettingsIntent);
        }

        public void onDestroyView()
        {
            getActivity().getActionBar().setCustomView(null);
            if (mOldActivityTitle != null)
                getActivity().getActionBar().setTitle(mOldActivityTitle);
            mToggleSwitch.setOnBeforeCheckedChangeListener(null);
            super.onDestroyView();
        }

        protected void onInstallActionBarToggleSwitch()
        {
            mToggleSwitch = createAndAddActionBarToggleSwitch(getActivity());
        }

        protected abstract void onPreferenceToggled(String s, boolean flag);

        protected void onProcessArguments(Bundle bundle)
        {
            mPreferenceKey = bundle.getString("preference_key");
            boolean flag = bundle.getBoolean("checked");
            mToggleSwitch.setCheckedInternal(flag);
            PreferenceActivity preferenceactivity = (PreferenceActivity)getActivity();
            if (!preferenceactivity.onIsMultiPane() || preferenceactivity.onIsHidingHeaders())
            {
                mOldActivityTitle = getActivity().getTitle();
                String s = bundle.getString("title");
                getActivity().getActionBar().setTitle(s);
            }
            CharSequence charsequence = bundle.getCharSequence("summary");
            mSummaryPreference.setSummary(charsequence);
        }

        public void onViewCreated(View view, Bundle bundle)
        {
            super.onViewCreated(view, bundle);
            onInstallActionBarToggleSwitch();
            onProcessArguments(getArguments());
            getListView().setDivider(null);
            getListView().setEnabled(false);
        }

    }

    public static class ToggleGlobalGesturePreferenceFragment extends ToggleFeaturePreferenceFragment
    {

        protected void onInstallActionBarToggleSwitch()
        {
            super.onInstallActionBarToggleSwitch();
            super.mToggleSwitch.setOnBeforeCheckedChangeListener(new ToggleSwitch.OnBeforeCheckedChangeListener() {

                final ToggleGlobalGesturePreferenceFragment this$0;

                public boolean onBeforeCheckedChanged(ToggleSwitch toggleswitch, boolean flag)
                {
                    toggleswitch.setCheckedInternal(flag);
                    getArguments().putBoolean("checked", flag);
                    onPreferenceToggled(mPreferenceKey, flag);
                    return false;
                }

            
            {
                this$0 = ToggleGlobalGesturePreferenceFragment.this;
                super();
            }
            }
);
        }

        protected void onPreferenceToggled(String s, boolean flag)
        {
            ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.Global.putInt(contentresolver, "enable_accessibility_global_gesture_enabled", i);
        }

    }

    public static class ToggleScreenMagnificationPreferenceFragment extends ToggleFeaturePreferenceFragment
    {

        protected void onInstallActionBarToggleSwitch()
        {
            super.onInstallActionBarToggleSwitch();
            super.mToggleSwitch.setOnBeforeCheckedChangeListener(new ToggleSwitch.OnBeforeCheckedChangeListener() {

                final ToggleScreenMagnificationPreferenceFragment this$0;

                public boolean onBeforeCheckedChanged(ToggleSwitch toggleswitch, boolean flag)
                {
                    toggleswitch.setCheckedInternal(flag);
                    getArguments().putBoolean("checked", flag);
                    onPreferenceToggled(mPreferenceKey, flag);
                    return false;
                }

            
            {
                this$0 = ToggleScreenMagnificationPreferenceFragment.this;
                super();
            }
            }
);
        }

        protected void onPreferenceToggled(String s, boolean flag)
        {
            ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.Secure.putInt(contentresolver, "accessibility_display_magnification_enabled", i);
        }

    }

    public static class ToggleSwitch extends Switch
    {

        private OnBeforeCheckedChangeListener mOnBeforeListener;

        public void setChecked(boolean flag)
        {
            if (mOnBeforeListener != null && mOnBeforeListener.onBeforeCheckedChanged(this, flag))
            {
                return;
            } else
            {
                super.setChecked(flag);
                return;
            }
        }

        public void setCheckedInternal(boolean flag)
        {
            super.setChecked(flag);
        }

        public void setOnBeforeCheckedChangeListener(OnBeforeCheckedChangeListener onbeforecheckedchangelistener)
        {
            mOnBeforeListener = onbeforecheckedchangelistener;
        }

        public ToggleSwitch(Context context)
        {
            super(context);
        }
    }

    public static interface ToggleSwitch.OnBeforeCheckedChangeListener
    {

        public abstract boolean onBeforeCheckedChanged(ToggleSwitch toggleswitch, boolean flag);
    }


    private static final String DEFAULT_SCREENREADER_MARKET_LINK = "market://search?q=pname:com.google.android.marvin.talkback";
    private static final long DELAY_UPDATE_SERVICES_MILLIS = 1000L;
    private static final int DIALOG_ID_NO_ACCESSIBILITY_SERVICES = 1;
    private static final String DISPLAY_MAGNIFICATION_PREFERENCE_SCREEN = "screen_magnification_preference_screen";
    private static final char ENABLED_ACCESSIBILITY_SERVICES_SEPARATOR = 58;
    private static final String ENABLE_ACCESSIBILITY_GESTURE_PREFERENCE_SCREEN = "enable_global_gesture_preference_screen";
    private static final String EXTRA_CHECKED = "checked";
    private static final String EXTRA_DISABLE_WARNING_MESSAGE = "disable_warning_message";
    private static final String EXTRA_DISABLE_WARNING_TITLE = "disable_warning_title";
    private static final String EXTRA_ENABLE_WARNING_MESSAGE = "enable_warning_message";
    private static final String EXTRA_ENABLE_WARNING_TITLE = "enable_warning_title";
    private static final String EXTRA_PREFERENCE_KEY = "preference_key";
    private static final String EXTRA_SERVICE_COMPONENT_NAME = "service_component_name";
    private static final String EXTRA_SETTINGS_COMPONENT_NAME = "settings_component_name";
    private static final String EXTRA_SETTINGS_TITLE = "settings_title";
    private static final String EXTRA_SUMMARY = "summary";
    private static final String EXTRA_TITLE = "title";
    private static final String IPO_SETTING = "ipo_setting";
    private static final String KEY_INSTALL_ACCESSIBILITY_SERVICE_OFFERED_ONCE = "key_install_accessibility_service_offered_once";
    private static final float LARGE_FONT_SCALE_PHONE = 1.15F;
    private static final float LARGE_FONT_SCALE_TABLET = 1.03F;
    private static final String SELECT_LONG_PRESS_TIMEOUT_PREFERENCE = "select_long_press_timeout_preference";
    private static final String SERVICES_CATEGORY = "services_category";
    private static final String SYSTEM_CATEGORY = "system_category";
    private static final String SYSTEM_PROPERTY_MARKET_URL = "ro.screenreader.market";
    private static final String TAG = "AccessibilitySettings";
    private static final String TOGGLE_LARGE_TEXT_PREFERENCE = "toggle_large_text_preference";
    private static final String TOGGLE_LOCK_SCREEN_ROTATION_PREFERENCE = "toggle_lock_screen_rotation_preference";
    private static final String TOGGLE_POWER_BUTTON_ENDS_CALL_PREFERENCE = "toggle_power_button_ends_call_preference";
    private static final String TOGGLE_SCRIPT_INJECTION_PREFERENCE = "toggle_script_injection_preference";
    private static final String TOGGLE_SPEAK_PASSWORD_PREFERENCE = "toggle_speak_password_preference";
    private static final Set sInstalledServices = new HashSet();
    private static final android.text.TextUtils.SimpleStringSplitter sStringColonSplitter = new android.text.TextUtils.SimpleStringSplitter(':');
    private boolean isScreenLarge;
    private final Configuration mCurConfig = new Configuration();
    private PreferenceScreen mDisplayMagnificationPreferenceScreen;
    private PreferenceScreen mGlobalGesturePreferenceScreen;
    private final Handler mHandler = new Handler() {

        final AccessibilitySettings this$0;

        public void dispatchMessage(Message message)
        {
            super.dispatchMessage(message);
            loadInstalledServices();
            updateServicesPreferences();
        }

            
            {
                this$0 = AccessibilitySettings.this;
                super();
            }
    }
;
    private CheckBoxPreference mIpoSetting;
    private int mLongPressTimeoutDefault;
    private final Map mLongPressTimeoutValuetoTitleMap = new HashMap();
    private Preference mNoServicesMessagePreference;
    private ContentObserver mRotationObserver;
    private final com.android.internal.view.RotationPolicy.RotationPolicyListener mRotationPolicyListener = new com.android.internal.view.RotationPolicy.RotationPolicyListener() {

        final AccessibilitySettings this$0;

        public void onChange()
        {
            updateLockScreenRotationCheckbox();
        }

            
            {
                this$0 = AccessibilitySettings.this;
                super();
            }
    }
;
    private ListPreference mSelectLongPressTimeoutPreference;
    private PreferenceCategory mServicesCategory;
    private final SettingsContentObserver mSettingsContentObserver;
    private final PackageMonitor mSettingsPackageMonitor = new SettingsPackageMonitor();
    private PreferenceCategory mSystemsCategory;
    private CheckBoxPreference mToggleLargeTextPreference;
    private CheckBoxPreference mToggleLockScreenRotationPreference;
    private CheckBoxPreference mTogglePowerButtonEndsCallPreference;
    private AccessibilityEnableScriptInjectionPreference mToggleScriptInjectionPreference;
    private CheckBoxPreference mToggleSpeakPasswordPreference;

    public AccessibilitySettings()
    {
        mSettingsContentObserver = new SettingsContentObserver(mHandler) {

            final AccessibilitySettings this$0;

            public void onChange(boolean flag, Uri uri)
            {
                loadInstalledServices();
                updateServicesPreferences();
            }

            
            {
                this$0 = AccessibilitySettings.this;
                super(handler);
            }
        }
;
        isScreenLarge = false;
        mRotationObserver = new ContentObserver(new Handler()) {

            final AccessibilitySettings this$0;

            public void onChange(boolean flag)
            {
                updateRotationCheckbox();
            }

            
            {
                this$0 = AccessibilitySettings.this;
                super(handler);
            }
        }
;
    }

    private static Set getEnabledServicesFromSettings(Context context)
    {
        String s = android.provider.Settings.Secure.getString(context.getContentResolver(), "enabled_accessibility_services");
        if (s == null)
            s = "";
        HashSet hashset = new HashSet();
        android.text.TextUtils.SimpleStringSplitter simplestringsplitter = sStringColonSplitter;
        simplestringsplitter.setString(s);
        do
        {
            if (!simplestringsplitter.hasNext())
                break;
            ComponentName componentname = ComponentName.unflattenFromString(simplestringsplitter.next());
            if (componentname != null)
                hashset.add(componentname);
        } while (true);
        return hashset;
    }

    private void handleDisplayMagnificationPreferenceScreenClick()
    {
        boolean flag = true;
        Bundle bundle = mDisplayMagnificationPreferenceScreen.getExtras();
        bundle.putString("title", getString(0x7f0b072e));
        bundle.putCharSequence("summary", getActivity().getResources().getText(0x7f0b072f));
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "accessibility_display_magnification_enabled", 0) != flag)
            flag = false;
        bundle.putBoolean("checked", flag);
        super.onPreferenceTreeClick(mDisplayMagnificationPreferenceScreen, mDisplayMagnificationPreferenceScreen);
    }

    private void handleLockScreenRotationPreferenceClick()
    {
        Activity activity = getActivity();
        boolean flag;
        if (!mToggleLockScreenRotationPreference.isChecked())
            flag = true;
        else
            flag = false;
        RotationPolicy.setRotationLockForAccessibility(activity, flag);
    }

    private void handleTogglEnableAccessibilityGesturePreferenceClick()
    {
        boolean flag = true;
        Bundle bundle = mGlobalGesturePreferenceScreen.getExtras();
        bundle.putString("title", getString(0x7f0b0730));
        bundle.putString("summary", getString(0x7f0b0733));
        if (android.provider.Settings.Global.getInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) != flag)
            flag = false;
        bundle.putBoolean("checked", flag);
        super.onPreferenceTreeClick(mGlobalGesturePreferenceScreen, mGlobalGesturePreferenceScreen);
    }

    private void handleToggleLargeTextPreferenceClick()
    {
        float f;
        float f1;
        f = 1.0F;
        f1 = android.provider.Settings.System.getFloat(getContentResolver(), "settings_fontsize_extralarge", -1F);
        if (f1 != -1F)
            break MISSING_BLOCK_LABEL_97;
        if (!isScreenLarge) goto _L2; else goto _L1
_L1:
        Configuration configuration2 = mCurConfig;
        if (mToggleLargeTextPreference.isChecked())
            f = 1.03F;
        configuration2.fontScale = f;
_L3:
        ActivityManagerNative.getDefault().updatePersistentConfiguration(mCurConfig);
        return;
_L2:
        Configuration configuration1 = mCurConfig;
        if (mToggleLargeTextPreference.isChecked())
            f = 1.15F;
        Configuration configuration;
        try
        {
            configuration1.fontScale = f;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
          goto _L3
        configuration = mCurConfig;
        if (!mToggleLargeTextPreference.isChecked())
            f1 = f;
        configuration.fontScale = f1;
        ActivityManagerNative.getDefault().updatePersistentConfiguration(mCurConfig);
        return;
    }

    private void handleTogglePowerButtonEndsCallPreferenceClick()
    {
        ContentResolver contentresolver = getContentResolver();
        byte byte0;
        if (mTogglePowerButtonEndsCallPreference.isChecked())
            byte0 = 2;
        else
            byte0 = 1;
        android.provider.Settings.Secure.putInt(contentresolver, "incall_power_button_behavior", byte0);
    }

    private void handleToggleSpeakPasswordPreferenceClick()
    {
        ContentResolver contentresolver = getContentResolver();
        int i;
        if (mToggleSpeakPasswordPreference.isChecked())
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(contentresolver, "speak_password", i);
    }

    private void initializeAllPreferences()
    {
        mServicesCategory = (PreferenceCategory)findPreference("services_category");
        mSystemsCategory = (PreferenceCategory)findPreference("system_category");
        mToggleLargeTextPreference = (CheckBoxPreference)findPreference("toggle_large_text_preference");
        mTogglePowerButtonEndsCallPreference = (CheckBoxPreference)findPreference("toggle_power_button_ends_call_preference");
        if (!KeyCharacterMap.deviceHasKey(26) || !Utils.isVoiceCapable(getActivity()))
            mSystemsCategory.removePreference(mTogglePowerButtonEndsCallPreference);
        mToggleLockScreenRotationPreference = (CheckBoxPreference)findPreference("toggle_lock_screen_rotation_preference");
        mToggleSpeakPasswordPreference = (CheckBoxPreference)findPreference("toggle_speak_password_preference");
        mSelectLongPressTimeoutPreference = (ListPreference)findPreference("select_long_press_timeout_preference");
        mSelectLongPressTimeoutPreference.setOnPreferenceChangeListener(this);
        if (mLongPressTimeoutValuetoTitleMap.size() == 0)
        {
            String as[] = getResources().getStringArray(0x7f070031);
            mLongPressTimeoutDefault = Integer.parseInt(as[0]);
            String as1[] = getResources().getStringArray(0x7f070030);
            int i = as.length;
            for (int j = 0; j < i; j++)
                mLongPressTimeoutValuetoTitleMap.put(as[j], as1[j]);

        }
        mToggleScriptInjectionPreference = (AccessibilityEnableScriptInjectionPreference)findPreference("toggle_script_injection_preference");
        mDisplayMagnificationPreferenceScreen = (PreferenceScreen)findPreference("screen_magnification_preference_screen");
        mGlobalGesturePreferenceScreen = (PreferenceScreen)findPreference("enable_global_gesture_preference_screen");
        mIpoSetting = (CheckBoxPreference)findPreference("ipo_setting");
    }

    private void loadInstalledServices()
    {
        List list = AccessibilityManager.getInstance(getActivity()).getInstalledAccessibilityServiceList();
        Set set = sInstalledServices;
        set.clear();
        int i = list.size();
        for (int j = 0; j < i; j++)
        {
            ResolveInfo resolveinfo = ((AccessibilityServiceInfo)list.get(j)).getResolveInfo();
            set.add(new ComponentName(((PackageItemInfo) (resolveinfo.serviceInfo)).packageName, resolveinfo.serviceInfo.name));
        }

    }

    private void offerInstallAccessibilitySerivceOnce()
    {
        if (mServicesCategory.getPreference(0) == mNoServicesMessagePreference)
        {
            SharedPreferences sharedpreferences = getActivity().getPreferences(0);
            boolean flag;
            if (!sharedpreferences.getBoolean("key_install_accessibility_service_offered_once", false))
                flag = true;
            else
                flag = false;
            if (flag)
            {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(SystemProperties.get("ro.screenreader.market", "market://search?q=pname:com.google.android.marvin.talkback")));
                if (getPackageManager().resolveActivity(intent, 0) != null)
                {
                    sharedpreferences.edit().putBoolean("key_install_accessibility_service_offered_once", true).commit();
                    showDialog(1);
                    return;
                }
            }
        }
    }

    private void updateAllPreferences()
    {
        updateServicesPreferences();
        updateSystemPreferences();
    }

    private void updateLockScreenRotationCheckbox()
    {
        Activity activity = getActivity();
        if (activity != null)
        {
            CheckBoxPreference checkboxpreference = mToggleLockScreenRotationPreference;
            boolean flag;
            if (!RotationPolicy.isRotationLocked(activity))
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
        }
    }

    private void updateRotationCheckbox()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "accelerometer_rotation", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        mToggleLockScreenRotationPreference.setChecked(flag);
    }

    private void updateServicesPreferences()
    {
        mServicesCategory.removeAll();
        List list = AccessibilityManager.getInstance(getActivity()).getInstalledAccessibilityServiceList();
        Set set = getEnabledServicesFromSettings(getActivity());
        boolean flag;
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "accessibility_enabled", 0) == 1)
            flag = true;
        else
            flag = false;
        int i = 0;
        for (int j = list.size(); i < j; i++)
        {
            AccessibilityServiceInfo accessibilityserviceinfo = (AccessibilityServiceInfo)list.get(i);
            PreferenceScreen preferencescreen = getPreferenceManager().createPreferenceScreen(getActivity());
            String s = accessibilityserviceinfo.getResolveInfo().loadLabel(getPackageManager()).toString();
            ServiceInfo serviceinfo = accessibilityserviceinfo.getResolveInfo().serviceInfo;
            ComponentName componentname = new ComponentName(((PackageItemInfo) (serviceinfo)).packageName, serviceinfo.name);
            preferencescreen.setKey(componentname.flattenToString());
            preferencescreen.setTitle(s);
            boolean flag1;
            if (flag && set.contains(componentname))
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
                preferencescreen.setSummary(getString(0x7f0b073d));
            else
                preferencescreen.setSummary(getString(0x7f0b073e));
            preferencescreen.setOrder(i);
            preferencescreen.setFragment(com/android/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.getName());
            preferencescreen.setPersistent(true);
            Bundle bundle = preferencescreen.getExtras();
            bundle.putString("preference_key", preferencescreen.getKey());
            bundle.putBoolean("checked", flag1);
            bundle.putString("title", s);
            String s1 = accessibilityserviceinfo.loadDescription(getPackageManager());
            if (TextUtils.isEmpty(s1))
                s1 = getString(0x7f0b074b);
            bundle.putString("summary", s1);
            CharSequence charsequence = accessibilityserviceinfo.getResolveInfo().loadLabel(getPackageManager());
            bundle.putString("enable_warning_title", getString(0x7f0b0743, new Object[] {
                charsequence
            }));
            bundle.putString("enable_warning_message", getString(0x7f0b0744, new Object[] {
                charsequence
            }));
            bundle.putString("disable_warning_title", getString(0x7f0b0745, new Object[] {
                charsequence
            }));
            bundle.putString("disable_warning_message", getString(0x7f0b0746, new Object[] {
                charsequence
            }));
            String s2 = accessibilityserviceinfo.getSettingsActivityName();
            if (!TextUtils.isEmpty(s2))
            {
                bundle.putString("settings_title", getString(0x7f0b073c));
                ComponentName componentname1 = new ComponentName(((PackageItemInfo) (accessibilityserviceinfo.getResolveInfo().serviceInfo)).packageName, s2);
                bundle.putString("settings_component_name", componentname1.flattenToString());
            }
            bundle.putString("service_component_name", componentname.flattenToString());
            mServicesCategory.addPreference(preferencescreen);
        }

        if (mServicesCategory.getPreferenceCount() == 0)
        {
            if (mNoServicesMessagePreference == null)
            {
                Preference preference = new Preference(getActivity()) {

                    final AccessibilitySettings this$0;

                    protected void onBindView(View view)
                    {
                        super.onBindView(view);
                        ((LinearLayout)view.findViewById(0x7f08017c)).setGravity(17);
                        ((TextView)view.findViewById(0x7f0800e5)).setText(getString(0x7f0b0747));
                    }

            
            {
                this$0 = AccessibilitySettings.this;
                super(context);
            }
                }
;
                mNoServicesMessagePreference = preference;
                mNoServicesMessagePreference.setPersistent(false);
                mNoServicesMessagePreference.setLayoutResource(0x7f04008d);
                mNoServicesMessagePreference.setSelectable(false);
            }
            mServicesCategory.addPreference(mNoServicesMessagePreference);
        }
    }

    private void updateSystemPreferences()
    {
        float f = android.provider.Settings.System.getFloat(getContentResolver(), "settings_fontsize_extralarge", -1F);
        boolean flag1;
        boolean flag2;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        try
        {
            mCurConfig.updateFrom(ActivityManagerNative.getDefault().getConfiguration());
        }
        catch (RemoteException remoteexception) { }
        if (f == -1F)
        {
            if (isScreenLarge)
            {
                CheckBoxPreference checkboxpreference2 = mToggleLargeTextPreference;
                String s;
                boolean flag8;
                if (mCurConfig.fontScale == 1.03F)
                    flag8 = true;
                else
                    flag8 = false;
                checkboxpreference2.setChecked(flag8);
            } else
            {
                CheckBoxPreference checkboxpreference1 = mToggleLargeTextPreference;
                boolean flag7;
                if (mCurConfig.fontScale == 1.15F)
                    flag7 = true;
                else
                    flag7 = false;
                checkboxpreference1.setChecked(flag7);
            }
        } else
        {
            CheckBoxPreference checkboxpreference = mToggleLargeTextPreference;
            boolean flag;
            if (mCurConfig.fontScale == f)
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
        }
        if (KeyCharacterMap.deviceHasKey(26) && Utils.isVoiceCapable(getActivity()))
        {
            boolean flag6;
            if (android.provider.Settings.Secure.getInt(getContentResolver(), "incall_power_button_behavior", 1) == 2)
                flag6 = true;
            else
                flag6 = false;
            mTogglePowerButtonEndsCallPreference.setChecked(flag6);
        }
        updateLockScreenRotationCheckbox();
        updateRotationCheckbox();
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "speak_password", 0) != 0)
            flag1 = true;
        else
            flag1 = false;
        mToggleSpeakPasswordPreference.setChecked(flag1);
        s = String.valueOf(android.provider.Settings.Secure.getInt(getContentResolver(), "long_press_timeout", mLongPressTimeoutDefault));
        mSelectLongPressTimeoutPreference.setValue(s);
        mSelectLongPressTimeoutPreference.setSummary((CharSequence)mLongPressTimeoutValuetoTitleMap.get(s));
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "accessibility_script_injection", 0) == 1)
            flag2 = true;
        else
            flag2 = false;
        mToggleScriptInjectionPreference.setInjectionAllowed(flag2);
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "accessibility_display_magnification_enabled", 0) == 1)
            flag3 = true;
        else
            flag3 = false;
        if (flag3)
            mDisplayMagnificationPreferenceScreen.setSummary(0x7f0b073d);
        else
            mDisplayMagnificationPreferenceScreen.setSummary(0x7f0b073e);
        if (android.provider.Settings.Global.getInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) == 1)
            flag4 = true;
        else
            flag4 = false;
        if (flag4)
            mGlobalGesturePreferenceScreen.setSummary(0x7f0b0731);
        else
            mGlobalGesturePreferenceScreen.setSummary(0x7f0b0732);
        if (android.provider.Settings.System.getInt(getContentResolver(), "ipo_setting", 1) == 1)
            flag5 = true;
        else
            flag5 = false;
        if (mIpoSetting != null)
            mIpoSetting.setChecked(flag5);
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        mCurConfig.updateFrom(configuration);
        getListView().clearScrapViewsIfNeeded();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        int i = 0xf & getResources().getConfiguration().screenLayout;
        boolean flag;
        if (i != 3 && i != 4)
            flag = false;
        else
            flag = true;
        isScreenLarge = flag;
        addPreferencesFromResource(0x7f050000);
        initializeAllPreferences();
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 1: // '\001'
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0748).setMessage(0x7f0b0749).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final AccessibilitySettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    Intent intent;
                    removeDialog(1);
                    intent = new Intent("android.intent.action.VIEW", Uri.parse(SystemProperties.get("ro.screenreader.market", "market://search?q=pname:com.google.android.marvin.talkback")));
                    if (intent == null)
                        break MISSING_BLOCK_LABEL_40;
                    startActivity(intent);
                    return;
                    ActivityNotFoundException activitynotfoundexception;
                    activitynotfoundexception;
                    Log.i("AccessibilitySettings", "cannot launch the talkback app because GMS isn't installed.");
                    return;
                }

            
            {
                this$0 = AccessibilitySettings.this;
                super();
            }
            }
).setNegativeButton(0x1040000, null).create();
        }
        return null;
    }

    public void onPause()
    {
        mSettingsPackageMonitor.unregister();
        RotationPolicy.unregisterRotationPolicyListener(getActivity(), mRotationPolicyListener);
        mSettingsContentObserver.unregister(getContentResolver());
        getContentResolver().unregisterContentObserver(mRotationObserver);
        super.onPause();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mSelectLongPressTimeoutPreference)
        {
            String s = (String)obj;
            android.provider.Settings.Secure.putInt(getContentResolver(), "long_press_timeout", Integer.parseInt(s));
            mSelectLongPressTimeoutPreference.setSummary((CharSequence)mLongPressTimeoutValuetoTitleMap.get(s));
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (mToggleLargeTextPreference == preference)
        {
            handleToggleLargeTextPreferenceClick();
            return true;
        }
        if (mTogglePowerButtonEndsCallPreference == preference)
        {
            handleTogglePowerButtonEndsCallPreferenceClick();
            return true;
        }
        if (mToggleLockScreenRotationPreference == preference)
        {
            handleLockScreenRotationPreferenceClick();
            return true;
        }
        if (mToggleSpeakPasswordPreference == preference)
        {
            handleToggleSpeakPasswordPreferenceClick();
            return true;
        }
        if (mGlobalGesturePreferenceScreen == preference)
        {
            handleTogglEnableAccessibilityGesturePreferenceClick();
            return true;
        }
        if (mDisplayMagnificationPreferenceScreen == preference)
        {
            handleDisplayMagnificationPreferenceScreenClick();
            return true;
        }
        if (mIpoSetting == preference)
        {
            boolean flag = ((CheckBoxPreference)preference).isChecked();
            ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.System.putInt(contentresolver, "ipo_setting", i);
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        super.onResume();
        loadInstalledServices();
        updateAllPreferences();
        offerInstallAccessibilitySerivceOnce();
        mSettingsPackageMonitor.register(getActivity(), getActivity().getMainLooper(), false);
        mSettingsContentObserver.register(getContentResolver());
        RotationPolicy.registerRotationPolicyListener(getActivity(), mRotationPolicyListener);
        getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("accelerometer_rotation"), true, mRotationObserver);
    }









    // Unreferenced inner class com/android/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$1

/* anonymous class */
    class ToggleAccessibilityServicePreferenceFragment._cls1 extends SettingsContentObserver
    {

        final ToggleAccessibilityServicePreferenceFragment this$0;

        public void onChange(boolean flag, Uri uri)
        {
            boolean flag1 = android.provider.Settings.Secure.getString(getContentResolver(), "enabled_accessibility_services").contains(mComponentName);
            mToggleSwitch.setCheckedInternal(flag1);
        }

            
            {
                this$0 = ToggleAccessibilityServicePreferenceFragment.this;
                super(handler);
            }
    }

}
