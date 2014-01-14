// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.accounts.*;
import android.app.ActionBar;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.sip.SipManager;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.util.ArrayUtils;
import com.android.settings.accounts.AccountSyncSettings;
import com.android.settings.accounts.AuthenticatorHelper;
import com.android.settings.accounts.ManageAccountsSettings;
import com.android.settings.applications.InstalledAppDetails;
import com.android.settings.applications.ManageApplications;
import com.android.settings.bluetooth.BluetoothEnabler;
import com.android.settings.deviceinfo.Memory;
import com.android.settings.fuelgauge.PowerUsageSummary;
import com.android.settings.vpn2.VpnSettings;
import com.android.settings.wifi.WifiEnabler;
import java.util.*;

// Referenced classes of package com.android.settings:
//            ButtonBarHandler, Utils, DataUsageSummary, UserDictionarySettings, 
//            WirelessSettings, SoundSettings, PrivacySettings, SecuritySettings, 
//            TetherSettings, ApnSettings, LocationSettings, ZonePicker, 
//            SubSettings, WallpaperTypeSettings, OwnerInfoSettings

public class Settings extends PreferenceActivity
    implements ButtonBarHandler, OnAccountsUpdateListener
{
    public static class AccessibilitySettingsActivity extends Settings
    {

    }

    public static class AccountSyncSettingsActivity extends Settings
    {

    }

    public static class AccountSyncSettingsInAddAccountActivity extends Settings
    {

    }

    public static class AdvancedWifiSettingsActivity extends Settings
    {

    }

    public static class AndroidBeamSettingsActivity extends Settings
    {

    }

    public static class ApplicationSettingsActivity extends Settings
    {

    }

    public static class AudioProfileSettingsActivity extends Settings
    {

    }

    public static class BeamShareHistoryActivity extends Settings
    {

    }

    public static class BluetoothSettingsActivity extends Settings
    {

    }

    public static class CryptKeeperSettingsActivity extends Settings
    {

    }

    public static class DataUsageSummaryActivity extends Settings
    {

    }

    public static class DateTimeSettingsActivity extends Settings
    {

    }

    public static class DevelopmentSettingsActivity extends Settings
    {

    }

    public static class DeviceAdminSettingsActivity extends Settings
    {

    }

    public static class DeviceInfoSettingsActivity extends Settings
    {

    }

    public static class DisplaySettingsActivity extends Settings
    {

    }

    public static class DockSettingsActivity extends Settings
    {

    }

    public static class DreamSettingsActivity extends Settings
    {

    }

    public static class HDMISettingsActivity extends Settings
    {

    }

    private static class HeaderAdapter extends ArrayAdapter
    {

        static final int HEADER_TYPE_CATEGORY = 0;
        private static final int HEADER_TYPE_COUNT = 3;
        static final int HEADER_TYPE_NORMAL = 1;
        static final int HEADER_TYPE_SWITCH = 2;
        private AuthenticatorHelper mAuthHelper;
        private final BluetoothEnabler mBluetoothEnabler;
        private LayoutInflater mInflater;
        private boolean mIsSimEnable;
        private final WifiEnabler mWifiEnabler;

        static int getHeaderType(android.preference.PreferenceActivity.Header header)
        {
            if (header.fragment == null && header.intent == null)
                return 0;
            return header.id == 0x7f08024aL || header.id == 0x7f08024bL ? 2 : 1;
        }

        private void handleDisableHolder(HeaderViewHolder headerviewholder, View view)
        {
            headerviewholder.icon.setEnabled(mIsSimEnable);
            ImageView imageview = headerviewholder.icon;
            char c;
            if (mIsSimEnable)
                c = '\377';
            else
                c = 'K';
            imageview.setAlpha(c);
            headerviewholder.title.setEnabled(mIsSimEnable);
            headerviewholder.summary.setEnabled(mIsSimEnable);
            boolean flag;
            if (!mIsSimEnable)
                flag = true;
            else
                flag = false;
            view.setClickable(flag);
        }

        private void handleEnableHolder(HeaderViewHolder headerviewholder, View view)
        {
            if (headerviewholder.icon != null)
            {
                headerviewholder.icon.setEnabled(true);
                headerviewholder.icon.setAlpha(255);
            }
            if (headerviewholder.title != null)
                headerviewholder.title.setEnabled(true);
            if (headerviewholder.summary != null)
                headerviewholder.summary.setEnabled(true);
            view.setClickable(false);
        }

        public boolean areAllItemsEnabled()
        {
            return false;
        }

        public int getItemViewType(int i)
        {
            return getHeaderType((android.preference.PreferenceActivity.Header)getItem(i));
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            android.preference.PreferenceActivity.Header header = (android.preference.PreferenceActivity.Header)getItem(i);
            int j = getHeaderType(header);
            Object obj;
            HeaderViewHolder headerviewholder;
            if (view == null)
            {
                headerviewholder = new HeaderViewHolder();
                obj = null;
                switch (j)
                {
                case 1: // '\001'
                    obj = mInflater.inflate(0x7f040065, viewgroup, false);
                    headerviewholder.icon = (ImageView)((View) (obj)).findViewById(0x7f080023);
                    headerviewholder.title = (TextView)((View) (obj)).findViewById(0x1020016);
                    headerviewholder.summary = (TextView)((View) (obj)).findViewById(0x1020010);
                    break;

                case 2: // '\002'
                    obj = mInflater.inflate(0x7f040066, viewgroup, false);
                    headerviewholder.icon = (ImageView)((View) (obj)).findViewById(0x7f080023);
                    headerviewholder.title = (TextView)((View) (obj)).findViewById(0x1020016);
                    headerviewholder.summary = (TextView)((View) (obj)).findViewById(0x1020010);
                    headerviewholder.switch_ = (Switch)((View) (obj)).findViewById(0x7f080102);
                    break;

                case 0: // '\0'
                    obj = new TextView(getContext(), null, 0x1010208);
                    headerviewholder.title = (TextView)obj;
                    break;
                }
                ((View) (obj)).setTag(headerviewholder);
            } else
            {
                obj = view;
                headerviewholder = (HeaderViewHolder)((View) (obj)).getTag();
            }
            switch (j)
            {
            case 2: // '\002'
                if (header.id == 0x7f08024aL)
                    mWifiEnabler.setSwitch(headerviewholder.switch_);
                else
                    mBluetoothEnabler.setSwitch(headerviewholder.switch_);
                // fall through

            case 1: // '\001'
                if (header.extras != null && header.extras.containsKey("account_type"))
                {
                    String s = header.extras.getString("account_type");
                    android.view.ViewGroup.LayoutParams layoutparams = headerviewholder.icon.getLayoutParams();
                    layoutparams.width = getContext().getResources().getDimensionPixelSize(0x7f0d0019);
                    layoutparams.height = layoutparams.width;
                    headerviewholder.icon.setLayoutParams(layoutparams);
                    android.graphics.drawable.Drawable drawable = mAuthHelper.getDrawableForType(getContext(), s);
                    headerviewholder.icon.setImageDrawable(drawable);
                } else
                {
                    headerviewholder.icon.setImageResource(header.iconRes);
                }
                headerviewholder.title.setText(header.getTitle(getContext().getResources()));
                CharSequence charsequence = header.getSummary(getContext().getResources());
                if (!TextUtils.isEmpty(charsequence))
                {
                    headerviewholder.summary.setVisibility(0);
                    headerviewholder.summary.setText(charsequence);
                } else
                {
                    headerviewholder.summary.setVisibility(8);
                }
                break;

            case 0: // '\0'
                headerviewholder.title.setText(header.getTitle(getContext().getResources()));
                break;
            }
            if (header.id == 0x7f080249L)
            {
                handleDisableHolder(headerviewholder, ((View) (obj)));
                return ((View) (obj));
            } else
            {
                handleEnableHolder(headerviewholder, ((View) (obj)));
                return ((View) (obj));
            }
        }

        public int getViewTypeCount()
        {
            return 3;
        }

        public boolean hasStableIds()
        {
            return true;
        }

        public boolean isEnabled(int i)
        {
            return getItemViewType(i) != 0;
        }

        public void isSimManagementAvailable(Context context)
        {
            boolean flag2;
label0:
            {
                int i = android.provider.System.getInt(context.getContentResolver(), "enable_internet_call_value", 0);
                Log.i("Settings", (new StringBuilder()).append(" isInternetCallEnabled = ").append(i).toString());
                boolean flag;
                if (SipManager.isVoipSupported(context) && i != 0)
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (android.provider.Telephony.SIMInfo.getInsertedSIMCount(context) != 0)
                    flag1 = true;
                else
                    flag1 = false;
                Log.i("Settings", (new StringBuilder()).append(" isVoipSupported = ").append(flag).toString());
                Log.i("Settings", (new StringBuilder()).append(" isHasSimCards = ").append(flag1).toString());
                if (!flag1)
                {
                    flag2 = false;
                    if (!flag)
                        break label0;
                }
                flag2 = true;
            }
            mIsSimEnable = flag2;
        }

        public void pause()
        {
            mWifiEnabler.pause();
            mBluetoothEnabler.pause();
        }

        public void resume()
        {
            mWifiEnabler.resume();
            mBluetoothEnabler.resume();
        }

        public HeaderAdapter(Context context, List list, AuthenticatorHelper authenticatorhelper)
        {
            super(context, 0, list);
            mIsSimEnable = false;
            mAuthHelper = authenticatorhelper;
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
            mWifiEnabler = new WifiEnabler(context, new Switch(context));
            mBluetoothEnabler = new BluetoothEnabler(context, new Switch(context));
        }
    }

    private static class HeaderAdapter.HeaderViewHolder
    {

        ImageView icon;
        TextView summary;
        Switch switch_;
        TextView title;

        private HeaderAdapter.HeaderViewHolder()
        {
        }

    }

    public static class InputMethodAndLanguageSettingsActivity extends Settings
    {

    }

    public static class InputMethodAndSubtypeEnablerActivity extends Settings
    {

    }

    public static class KeyboardLayoutPickerActivity extends Settings
    {

    }

    public static class LocalePickerActivity extends Settings
    {

    }

    public static class LocationSettingsActivity extends Settings
    {

    }

    public static class ManageAccountsSettingsActivity extends Settings
    {

    }

    public static class ManageApplicationsActivity extends Settings
    {

    }

    public static class NfcSettingsActivity extends Settings
    {

    }

    public static class PowerUsageSummaryActivity extends Settings
    {

    }

    public static class PrivacySettingsActivity extends Settings
    {

    }

    public static class RunningServicesActivity extends Settings
    {

    }

    public static class SecuritySettingsActivity extends Settings
    {

    }

    public static class SimDataRoamingSettings extends Settings
    {

    }

    public static class SimListEntranceActivity extends Settings
    {

    }

    public static class SimManagementActivity extends Settings
    {

    }

    public static class SoundSettingsActivity extends Settings
    {

    }

    public static class SpellCheckersSettingsActivity extends Settings
    {

    }

    public static class StorageSettingsActivity extends Settings
    {

    }

    public static class StorageUseActivity extends Settings
    {

    }

    public static class TetherSettingsActivity extends Settings
    {

    }

    public static class TetherWifiSettingsActivity extends Settings
    {

    }

    public static class TextToSpeechSettingsActivity extends Settings
    {

    }

    public static class UsbSettingsActivity extends Settings
    {

    }

    public static class UserDictionarySettingsActivity extends Settings
    {

    }

    public static class VpnSettingsActivity extends Settings
    {

    }

    public static class WapPushSettings extends Settings
    {

    }

    public static class WifiDisplaySettingsActivity extends Settings
    {

    }

    public static class WifiGprsSelectorActivity extends Settings
    {

    }

    public static class WifiP2pSettingsActivity extends Settings
    {

    }

    public static class WifiSettingsActivity extends Settings
    {

    }

    public static class WirelessSettingsActivity extends Settings
    {

    }


    private static final String EXTRA_CLEAR_UI_OPTIONS = "settings:remove_ui_options";
    private static final int IMAGE_GRAY = 75;
    private static final String LOG_TAG = "Settings";
    private static final String META_DATA_KEY_FRAGMENT_CLASS = "com.android.settings.FRAGMENT_CLASS";
    private static final String META_DATA_KEY_HEADER_ID = "com.android.settings.TOP_LEVEL_HEADER_ID";
    private static final String META_DATA_KEY_PARENT_FRAGMENT_CLASS = "com.android.settings.PARENT_FRAGMENT_CLASS";
    private static final String META_DATA_KEY_PARENT_TITLE = "com.android.settings.PARENT_FRAGMENT_TITLE";
    private static final int ORIGINAL_IMAGE = 255;
    private static final String SAVE_KEY_CURRENT_HEADER = "com.android.settings.CURRENT_HEADER";
    private static final String SAVE_KEY_PARENT_HEADER = "com.android.settings.PARENT_HEADER";
    private int SETTINGS_FOR_RESTRICTED[] = {
        0x7f080248, 0x7f08024a, 0x7f08024b, 0x7f08024c, 0x7f08024e, 0x7f08024f, 0x7f080251, 0x7f080252, 0x7f080253, 0x7f080255, 
        0x7f080254, 0x7f080258, 0x7f080259, 0x7f08025a, 0x7f08025b, 0x7f080256, 0x7f08025d, 0x7f08025e, 0x7f08025f, 0x7f080260, 
        0x7f080264, 0x7f080262
    };
    private AuthenticatorHelper mAuthenticatorHelper;
    private android.preference.PreferenceActivity.Header mCurrentHeader;
    private SharedPreferences mDevelopmentPreferences;
    private android.content.SharedPreferences.OnSharedPreferenceChangeListener mDevelopmentPreferencesListener;
    private android.preference.PreferenceActivity.Header mFirstHeader;
    private String mFragmentClass;
    protected HashMap mHeaderIndexMap;
    private boolean mInLocalHeaderSwitch;
    private boolean mIsWifiOnly;
    private android.preference.PreferenceActivity.Header mLastHeader;
    private boolean mListeningToAccountUpdates;
    private android.preference.PreferenceActivity.Header mParentHeader;
    private BroadcastReceiver mSiminfoReceiver;
    private int mTopLevelHeaderId;

    public Settings()
    {
        mHeaderIndexMap = new HashMap();
        mIsWifiOnly = false;
        mSiminfoReceiver = new BroadcastReceiver() {

            final Settings this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                Log.d("Settings", (new StringBuilder()).append("receive action=").append(s).toString());
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                    updateSimState();
            }

            
            {
                this$0 = Settings.this;
                super();
            }
        }
;
    }

    private void getMetaData()
    {
        ActivityInfo activityinfo = getPackageManager().getActivityInfo(getComponentName(), 128);
        if (activityinfo == null)
            break MISSING_BLOCK_LABEL_120;
        if (activityinfo.metaData == null)
            return;
        int i;
        String s;
        mTopLevelHeaderId = activityinfo.metaData.getInt("com.android.settings.TOP_LEVEL_HEADER_ID");
        mFragmentClass = activityinfo.metaData.getString("com.android.settings.FRAGMENT_CLASS");
        i = activityinfo.metaData.getInt("com.android.settings.PARENT_FRAGMENT_TITLE");
        s = activityinfo.metaData.getString("com.android.settings.PARENT_FRAGMENT_CLASS");
        if (s == null)
            break MISSING_BLOCK_LABEL_120;
        mParentHeader = new android.preference.PreferenceActivity.Header();
        mParentHeader.fragment = s;
        if (i != 0)
            try
            {
                mParentHeader.title = getResources().getString(i);
                return;
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
    }

    private void highlightHeader(int i)
    {
        if (i != 0)
        {
            Integer integer = (Integer)mHeaderIndexMap.get(Integer.valueOf(i));
            if (integer != null)
            {
                getListView().setItemChecked(integer.intValue(), true);
                if (isMultiPane())
                    getListView().smoothScrollToPosition(integer.intValue());
            }
        }
    }

    private int insertAccountsHeaders(List list, int i)
    {
        String as[] = mAuthenticatorHelper.getEnabledAccountTypes();
        ArrayList arraylist = new ArrayList(as.length);
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s = as[k];
            CharSequence charsequence = mAuthenticatorHelper.getLabelForType(this, s);
            if (charsequence == null)
                continue;
            Account aaccount[] = AccountManager.get(this).getAccountsByType(s);
            boolean flag;
            if (aaccount.length == 1 && !mAuthenticatorHelper.hasAccountPreferences(s))
                flag = true;
            else
                flag = false;
            android.preference.PreferenceActivity.Header header1 = new android.preference.PreferenceActivity.Header();
            header1.title = charsequence;
            if (header1.extras == null)
                header1.extras = new Bundle();
            if (flag)
            {
                header1.breadCrumbTitleRes = 0x7f0b082e;
                header1.breadCrumbShortTitleRes = 0x7f0b082e;
                header1.fragment = com/android/settings/accounts/AccountSyncSettings.getName();
                header1.fragmentArguments = new Bundle();
                header1.extras.putString("account_type", s);
                header1.extras.putParcelable("account", aaccount[0]);
                header1.fragmentArguments.putParcelable("account", aaccount[0]);
            } else
            {
                header1.breadCrumbTitle = charsequence;
                header1.breadCrumbShortTitle = charsequence;
                header1.fragment = com/android/settings/accounts/ManageAccountsSettings.getName();
                header1.fragmentArguments = new Bundle();
                header1.extras.putString("account_type", s);
                header1.fragmentArguments.putString("account_type", s);
                if (!isMultiPane())
                    header1.fragmentArguments.putString("account_label", charsequence.toString());
            }
            arraylist.add(header1);
        }

        Collections.sort(arraylist, new Comparator() {

            final Settings this$0;

            public int compare(android.preference.PreferenceActivity.Header header2, android.preference.PreferenceActivity.Header header3)
            {
                return header2.title.toString().compareTo(header3.title.toString());
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((android.preference.PreferenceActivity.Header)obj, (android.preference.PreferenceActivity.Header)obj1);
            }

            
            {
                this$0 = Settings.this;
                super();
            }
        }
);
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
        {
            android.preference.PreferenceActivity.Header header = (android.preference.PreferenceActivity.Header)iterator.next();
            int l = i + 1;
            list.add(i, header);
            i = l;
        }

        if (!mListeningToAccountUpdates)
        {
            AccountManager.get(this).addOnAccountsUpdatedListener(this, null, true);
            mListeningToAccountUpdates = true;
        }
        return i;
    }

    private void switchToHeaderLocal(android.preference.PreferenceActivity.Header header)
    {
        mInLocalHeaderSwitch = true;
        switchToHeader(header);
        mInLocalHeaderSwitch = false;
    }

    private void switchToParent(String s)
    {
        ComponentName componentname = new ComponentName(this, s);
        PackageManager packagemanager;
        ActivityInfo activityinfo;
        String s1;
        CharSequence charsequence;
        android.preference.PreferenceActivity.Header header;
        try
        {
            packagemanager = getPackageManager();
            activityinfo = packagemanager.getActivityInfo(componentname, 128);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("Settings", (new StringBuilder()).append("Could not find parent activity : ").append(s).toString());
            return;
        }
        if (activityinfo == null)
            break MISSING_BLOCK_LABEL_149;
        if (activityinfo.metaData != null)
        {
            s1 = activityinfo.metaData.getString("com.android.settings.FRAGMENT_CLASS");
            charsequence = activityinfo.loadLabel(packagemanager);
            header = new android.preference.PreferenceActivity.Header();
            header.fragment = s1;
            header.title = charsequence;
            mCurrentHeader = header;
            switchToHeaderLocal(header);
            highlightHeader(mTopLevelHeaderId);
            mParentHeader = new android.preference.PreferenceActivity.Header();
            mParentHeader.fragment = activityinfo.metaData.getString("com.android.settings.PARENT_FRAGMENT_CLASS");
            mParentHeader.title = activityinfo.metaData.getString("com.android.settings.PARENT_FRAGMENT_TITLE");
        }
    }

    private void updateHeaderList(List list)
    {
        int i;
        i = 0;
        mHeaderIndexMap.clear();
_L7:
        if (i >= list.size()) goto _L2; else goto _L1
_L1:
        android.preference.PreferenceActivity.Header header;
        int j;
        header = (android.preference.PreferenceActivity.Header)list.get(i);
        j = (int)header.id;
        updateHeaderList_Custom(list, header);
        if (j != 0x7f08024d && j != 0x7f080257) goto _L4; else goto _L3
_L3:
        Utils.updateHeaderToSpecificActivityFromMetaDataOrRemove(this, list, header);
_L5:
        if (list.get(i) == header && UserHandle.myUserId() != 0 && !ArrayUtils.contains(SETTINGS_FOR_RESTRICTED, j))
            list.remove(i);
        if (list.get(i) == header)
        {
            if (mFirstHeader == null && HeaderAdapter.getHeaderType(header) != 0)
                mFirstHeader = header;
            mHeaderIndexMap.put(Integer.valueOf(j), Integer.valueOf(i));
            i++;
        }
        continue; /* Loop/switch isn't completed */
_L4:
        if (j == 0x7f08024a)
        {
            if (!getPackageManager().hasSystemFeature("android.hardware.wifi"))
                list.remove(i);
        } else
        if (j == 0x7f08024b)
        {
            if (!getPackageManager().hasSystemFeature("android.hardware.bluetooth"))
                list.remove(i);
        } else
        if (j == 0x7f080249)
        {
            if (mIsWifiOnly)
                list.remove(i);
        } else
        if (j == 0x7f08024c)
        {
            INetworkManagementService inetworkmanagementservice = android.os.INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
            try
            {
                if (!inetworkmanagementservice.isBandwidthControlEnabled())
                    list.remove(i);
            }
            catch (RemoteException remoteexception) { }
        } else
        if (j == 0x7f08025d)
            i = insertAccountsHeaders(list, i + 1);
        else
        if (j == 0x7f080256)
        {
            if (!UserManager.supportsMultipleUsers() || Utils.isMonkeyRunning())
                list.remove(i);
        } else
        if (j != 0x7f080263 && j != 0x7f080250)
            if (j == 0x7f080251)
                list.remove(header);
            else
            if (j == 0x7f080261)
            {
                Intent intent = new Intent("com.android.settings.SCHEDULE_POWER_ON_OFF_SETTING");
                List list1 = getPackageManager().queryIntentActivities(intent, 0);
                if (list1 != null && list1.size() != 0)
                {
                    Log.d("Settings", (new StringBuilder()).append("apps.size()=").append(list1.size()).toString());
                } else
                {
                    Log.d("Settings", "apps is null or app size is 0, remove SchedulePowerOnOff");
                    list.remove(header);
                }
            }
        if (true) goto _L5; else goto _L2
_L2:
        return;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void updateHeaderList_Custom(List list, android.preference.PreferenceActivity.Header header)
    {
label0:
        {
            if ((int)header.id == 0x7f080277)
            {
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.HOME");
                intent.addCategory("android.intent.category.DEFAULT");
                Intent intent1 = new Intent("android.intent.action.MAIN");
                intent1.addCategory("com.cyanogenmod.category.LAUNCHER_PREFERENCES");
                intent1.setPackage(getPackageManager().resolveActivity(intent, 0x10000).activityInfo.packageName);
                ResolveInfo resolveinfo = getPackageManager().resolveActivity(intent1, 0);
                if (resolveinfo == null)
                    break label0;
                header.intent = (new Intent()).setClassName(resolveinfo.activityInfo.packageName, resolveinfo.activityInfo.name);
            }
            return;
        }
        list.remove(header);
    }

    private void updateSimState()
    {
        ListAdapter listadapter = getListAdapter();
        if (listadapter instanceof HeaderAdapter)
            ((HeaderAdapter)listadapter).isSimManagementAvailable(this);
        invalidateHeaders();
    }

    public Intent getIntent()
    {
        Intent intent = super.getIntent();
        String s = getStartingFragmentClass(intent);
        if (s != null && !onIsMultiPane())
        {
            Intent intent1 = new Intent(intent);
            intent1.putExtra(":android:show_fragment", s);
            Bundle bundle = intent.getExtras();
            Bundle bundle1;
            if (bundle != null)
                bundle1 = new Bundle(bundle);
            else
                bundle1 = new Bundle();
            bundle1.putParcelable("intent", intent);
            intent1.putExtra(":android:show_fragment_args", intent.getExtras());
            return intent1;
        } else
        {
            return intent;
        }
    }

    public Button getNextButton()
    {
        return super.getNextButton();
    }

    protected String getStartingFragmentClass(Intent intent)
    {
        String s;
        if (mFragmentClass != null)
        {
            s = mFragmentClass;
        } else
        {
            s = intent.getComponent().getClassName();
            if (s.equals(getClass().getName()))
                return null;
            if ("com.android.settings.ManageApplications".equals(s) || "com.android.settings.RunningServices".equals(s) || "com.android.settings.applications.StorageUse".equals(s))
                return com/android/settings/applications/ManageApplications.getName();
        }
        return s;
    }

    public boolean hasNextButton()
    {
        return super.hasNextButton();
    }

    public void onAccountsUpdated(Account aaccount[])
    {
        mAuthenticatorHelper.updateAuthDescriptions(this);
        mAuthenticatorHelper.onAccountsUpdated(this, aaccount);
        invalidateHeaders();
    }

    public void onBuildHeaders(List list)
    {
        loadHeadersFromResource(0x7f050031, list);
        updateHeaderList(list);
    }

    public Intent onBuildStartFragmentIntent(String s, Bundle bundle, int i, int j)
    {
        Intent intent = super.onBuildStartFragmentIntent(s, bundle, i, j);
        if (com/android/settings/DataUsageSummary.getName().equals(s) || com/android/settings/fuelgauge/PowerUsageSummary.getName().equals(s) || com/android/settings/accounts/AccountSyncSettings.getName().equals(s) || com/android/settings/UserDictionarySettings.getName().equals(s) || com/android/settings/deviceinfo/Memory.getName().equals(s) || com/android/settings/applications/ManageApplications.getName().equals(s) || com/android/settings/WirelessSettings.getName().equals(s) || com/android/settings/SoundSettings.getName().equals(s) || com/android/settings/PrivacySettings.getName().equals(s) || com/android/settings/accounts/ManageAccountsSettings.getName().equals(s) || com/android/settings/vpn2/VpnSettings.getName().equals(s) || com/android/settings/SecuritySettings.getName().equals(s) || com/android/settings/applications/InstalledAppDetails.getName().equals(s) || com/android/settings/ChooseLockGeneric$ChooseLockGenericFragment.getName().equals(s) || com/android/settings/TetherSettings.getName().equals(s) || com/android/settings/ApnSettings.getName().equals(s) || com/android/settings/LocationSettings.getName().equals(s) || com/android/settings/ZonePicker.getName().equals(s))
            intent.putExtra("settings:remove_ui_options", true);
        intent.setClass(this, com/android/settings/SubSettings);
        return intent;
    }

    protected void onCreate(Bundle bundle)
    {
        if (getIntent().getBooleanExtra("settings:remove_ui_options", false))
            getWindow().setUiOptions(0);
        mAuthenticatorHelper = new AuthenticatorHelper();
        mAuthenticatorHelper.updateAuthDescriptions(this);
        mAuthenticatorHelper.onAccountsUpdated(this, null);
        mDevelopmentPreferences = getSharedPreferences("development", 0);
        boolean flag;
        if (!((ConnectivityManager)getSystemService("connectivity")).isNetworkSupported(0))
            flag = true;
        else
            flag = false;
        mIsWifiOnly = flag;
        getMetaData();
        mInLocalHeaderSwitch = true;
        super.onCreate(bundle);
        mInLocalHeaderSwitch = false;
        if (!onIsHidingHeaders() && onIsMultiPane())
        {
            highlightHeader(mTopLevelHeaderId);
            setTitle(0x7f0b034c);
        }
        if (bundle != null)
        {
            mCurrentHeader = (android.preference.PreferenceActivity.Header)bundle.getParcelable("com.android.settings.CURRENT_HEADER");
            mParentHeader = (android.preference.PreferenceActivity.Header)bundle.getParcelable("com.android.settings.PARENT_HEADER");
        }
        if (bundle != null && mCurrentHeader != null)
            showBreadCrumbs(mCurrentHeader.title, null);
        if (mParentHeader != null)
            setParentTitle(mParentHeader.title, null, new android.view.View.OnClickListener() {

                final Settings this$0;

                public void onClick(View view)
                {
                    switchToParent(mParentHeader.fragment);
                }

            
            {
                this$0 = Settings.this;
                super();
            }
            }
);
        if (onIsMultiPane())
        {
            getActionBar().setDisplayHomeAsUpEnabled(false);
            getActionBar().setHomeButtonEnabled(false);
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mListeningToAccountUpdates)
            AccountManager.get(this).removeOnAccountsUpdatedListener(this);
    }

    public android.preference.PreferenceActivity.Header onGetInitialHeader()
    {
        String s = getStartingFragmentClass(super.getIntent());
        if (s != null)
        {
            android.preference.PreferenceActivity.Header header = new android.preference.PreferenceActivity.Header();
            header.fragment = s;
            header.title = getTitle();
            header.fragmentArguments = getIntent().getExtras();
            mCurrentHeader = header;
            return header;
        } else
        {
            return mFirstHeader;
        }
    }

    public void onHeaderClick(android.preference.PreferenceActivity.Header header, int i)
    {
        int j = header.id != 0x7f08025eL;
        boolean flag = false;
        if (j == 0)
            flag = true;
        super.onHeaderClick(header, i);
        if (flag && mLastHeader != null)
        {
            highlightHeader((int)mLastHeader.id);
            return;
        } else
        {
            mLastHeader = header;
            return;
        }
    }

    public void onNewIntent(Intent intent)
    {
        super.onNewIntent(intent);
        if ((0x100000 & intent.getFlags()) == 0)
        {
            if (mFirstHeader != null && !onIsHidingHeaders() && onIsMultiPane())
                switchToHeaderLocal(mFirstHeader);
            getListView().setSelectionFromTop(0, 0);
        }
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mSiminfoReceiver);
        ListAdapter listadapter = getListAdapter();
        if (listadapter instanceof HeaderAdapter)
            ((HeaderAdapter)listadapter).pause();
        mDevelopmentPreferences.unregisterOnSharedPreferenceChangeListener(mDevelopmentPreferencesListener);
        mDevelopmentPreferencesListener = null;
    }

    public boolean onPreferenceStartFragment(PreferenceFragment preferencefragment, Preference preference)
    {
        int i = preference.getTitleRes();
        if (preference.getFragment().equals(com/android/settings/WallpaperTypeSettings.getName()))
            i = 0x7f0b0517;
        else
        if (preference.getFragment().equals(com/android/settings/OwnerInfoSettings.getName()) && UserHandle.myUserId() != 0)
            i = 0x7f0b0379;
        startPreferencePanel(preference.getFragment(), preference.getExtras(), i, preference.getTitle(), null, 0);
        return true;
    }

    public void onResume()
    {
        super.onResume();
        mDevelopmentPreferencesListener = new android.content.SharedPreferences.OnSharedPreferenceChangeListener() {

            final Settings this$0;

            public void onSharedPreferenceChanged(SharedPreferences sharedpreferences, String s)
            {
                invalidateHeaders();
            }

            
            {
                this$0 = Settings.this;
                super();
            }
        }
;
        mDevelopmentPreferences.registerOnSharedPreferenceChangeListener(mDevelopmentPreferencesListener);
        ListAdapter listadapter = getListAdapter();
        if (listadapter instanceof HeaderAdapter)
        {
            ((HeaderAdapter)listadapter).resume();
            ((HeaderAdapter)listadapter).isSimManagementAvailable(this);
        }
        invalidateHeaders();
        registerReceiver(mSiminfoReceiver, new IntentFilter("android.intent.action.SIM_INFO_UPDATE"));
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (mCurrentHeader != null)
            bundle.putParcelable("com.android.settings.CURRENT_HEADER", mCurrentHeader);
        if (mParentHeader != null)
            bundle.putParcelable("com.android.settings.PARENT_HEADER", mParentHeader);
    }

    public void setListAdapter(ListAdapter listadapter)
    {
        if (listadapter == null)
        {
            super.setListAdapter(null);
            return;
        } else
        {
            super.setListAdapter(new HeaderAdapter(this, getHeaders(), mAuthenticatorHelper));
            return;
        }
    }

    public boolean shouldUpRecreateTask(Intent intent)
    {
        return super.shouldUpRecreateTask(new Intent(this, com/android/settings/Settings));
    }

    public void switchToHeader(android.preference.PreferenceActivity.Header header)
    {
        if (!mInLocalHeaderSwitch)
        {
            mCurrentHeader = null;
            mParentHeader = null;
        }
        super.switchToHeader(header);
    }



}
