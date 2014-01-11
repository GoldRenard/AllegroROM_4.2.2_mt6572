// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.AlertDialog;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.*;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import com.android.settings.SettingsPreferenceFragment;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDevice, LocalBluetoothProfile, Utils, LocalBluetoothProfileManager, 
//            LocalBluetoothManager, CachedBluetoothDeviceManager, Utf8ByteLengthFilter

public final class DeviceProfilesSettings extends SettingsPreferenceFragment
    implements CachedBluetoothDevice.Callback, android.preference.Preference.OnPreferenceChangeListener
{
    private class RenameEditTextPreference
        implements TextWatcher
    {

        final DeviceProfilesSettings this$0;

        public void afterTextChanged(Editable editable)
        {
            android.app.Dialog dialog = mDeviceNamePref.getDialog();
            if (dialog instanceof AlertDialog)
            {
                Button button = ((AlertDialog)dialog).getButton(-1);
                boolean flag;
                if (editable.length() > 0)
                    flag = true;
                else
                    flag = false;
                button.setEnabled(flag);
            }
        }

        public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        public void onTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        private RenameEditTextPreference()
        {
            this$0 = DeviceProfilesSettings.this;
            super();
        }

    }


    private static final int BLUETOOTH_NAME_MAX_LENGTH_BYTES = 59;
    public static final String EXTRA_DEVICE = "device";
    private static final String KEY_PROFILE_CONTAINER = "profile_container";
    private static final String KEY_RENAME_DEVICE = "rename_device";
    private static final String KEY_UNPAIR = "unpair";
    private static final String TAG = "DeviceProfilesSettings";
    private final HashMap mAutoConnectPrefs = new HashMap();
    private CachedBluetoothDevice mCachedDevice;
    private EditTextPreference mDeviceNamePref;
    private AlertDialog mDisconnectDialog;
    private LocalBluetoothManager mManager;
    private PreferenceGroup mProfileContainer;
    private boolean mProfileGroupIsRemoved;
    private LocalBluetoothProfileManager mProfileManager;
    private RenameEditTextPreference mRenameDeviceNamePref;


    private void addPreferencesForProfiles()
    {
        CheckBoxPreference checkboxpreference;
        for (Iterator iterator = mCachedDevice.getConnectableProfiles().iterator(); iterator.hasNext(); mProfileContainer.addPreference(checkboxpreference))
            checkboxpreference = createProfilePreference((LocalBluetoothProfile)iterator.next());

        showOrHideProfileGroup();
    }

    private void askDisconnect(Context context, final LocalBluetoothProfile profile)
    {
        final CachedBluetoothDevice device = mCachedDevice;
        String s = device.getName();
        if (TextUtils.isEmpty(s))
            s = context.getString(0x7f0b02db);
        String s1 = context.getString(profile.getNameResource(device.getDevice()));
        String s2 = context.getString(0x7f0b02d0);
        String s3 = context.getString(0x7f0b02d1, new Object[] {
            s1, s
        });
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final DeviceProfilesSettings this$0;
            final CachedBluetoothDevice val$device;
            final LocalBluetoothProfile val$profile;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                device.disconnect(profile);
                profile.setPreferred(device.getDevice(), false);
            }

            
            {
                this$0 = DeviceProfilesSettings.this;
                device = cachedbluetoothdevice;
                profile = localbluetoothprofile;
                super();
            }
        }
;
        mDisconnectDialog = Utils.showDisconnectDialog(context, mDisconnectDialog, onclicklistener, s2, Html.fromHtml(s3));
    }

    private CheckBoxPreference createProfilePreference(LocalBluetoothProfile localbluetoothprofile)
    {
        CheckBoxPreference checkboxpreference = new CheckBoxPreference(getActivity());
        checkboxpreference.setKey(localbluetoothprofile.toString());
        checkboxpreference.setTitle(localbluetoothprofile.getNameResource(mCachedDevice.getDevice()));
        checkboxpreference.setPersistent(false);
        checkboxpreference.setOrder(getProfilePreferenceIndex(localbluetoothprofile.getOrdinal()));
        checkboxpreference.setOnPreferenceChangeListener(this);
        int i = localbluetoothprofile.getDrawableResource(mCachedDevice.getBtClass());
        if (i != 0)
            checkboxpreference.setIcon(getResources().getDrawable(i));
        boolean flag = mCachedDevice.isBusy();
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        checkboxpreference.setEnabled(flag1);
        refreshProfilePreference(checkboxpreference, localbluetoothprofile);
        return checkboxpreference;
    }

    private LocalBluetoothProfile getProfileOf(Preference preference)
    {
        while (!(preference instanceof CheckBoxPreference) || TextUtils.isEmpty(preference.getKey())) 
            return null;
        LocalBluetoothProfile localbluetoothprofile;
        try
        {
            localbluetoothprofile = mProfileManager.getProfileByName(preference.getKey());
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return null;
        }
        return localbluetoothprofile;
    }

    private int getProfilePreferenceIndex(int i)
    {
        return mProfileContainer.getOrder() + i * 10;
    }

    private void noteStateNotSaved()
    {
        try
        {
            Class class1 = getClass();
            do
            {
                class1 = class1.getSuperclass();
                Log.d("DeviceProfilesSettings", (new StringBuilder()).append("cls : ").append(class1.getName()).toString());
            } while (!"Activity".equals(class1.getSimpleName()));
            Field field = class1.getDeclaredField("mFragments");
            field.setAccessible(true);
            Object obj = field.get(this);
            obj.getClass().getDeclaredMethod("noteStateNotSaved", new Class[0]).invoke(obj, new Object[0]);
            return;
        }
        catch (Exception exception)
        {
            Log.e("DeviceProfilesSettings", (new StringBuilder()).append("Exception happens, exception : ").append(exception).toString());
        }
    }

    private void onProfileClicked(LocalBluetoothProfile localbluetoothprofile, CheckBoxPreference checkboxpreference)
    {
        BluetoothDevice bluetoothdevice = mCachedDevice.getDevice();
        boolean flag;
        if (localbluetoothprofile.getConnectionStatus(bluetoothdevice) == 2)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            askDisconnect(getActivity(), localbluetoothprofile);
            return;
        }
        if (localbluetoothprofile.isPreferred(bluetoothdevice))
        {
            localbluetoothprofile.setPreferred(bluetoothdevice, false);
            refreshProfilePreference(checkboxpreference, localbluetoothprofile);
            return;
        } else
        {
            localbluetoothprofile.setPreferred(bluetoothdevice, true);
            mCachedDevice.connectProfile(localbluetoothprofile);
            return;
        }
    }

    private void refresh()
    {
        String s = mCachedDevice.getName();
        mDeviceNamePref.setSummary(s);
        mDeviceNamePref.setText(s);
        refreshProfiles();
    }

    private void refreshProfilePreference(CheckBoxPreference checkboxpreference, LocalBluetoothProfile localbluetoothprofile)
    {
        BluetoothDevice bluetoothdevice = mCachedDevice.getDevice();
        boolean flag;
        if (!mCachedDevice.isBusy())
            flag = true;
        else
            flag = false;
        checkboxpreference.setEnabled(flag);
        checkboxpreference.setChecked(localbluetoothprofile.isPreferred(bluetoothdevice));
        checkboxpreference.setSummary(localbluetoothprofile.getSummaryResourceForDevice(bluetoothdevice));
    }

    private void refreshProfiles()
    {
        for (Iterator iterator = mCachedDevice.getConnectableProfiles().iterator(); iterator.hasNext();)
        {
            LocalBluetoothProfile localbluetoothprofile1 = (LocalBluetoothProfile)iterator.next();
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)findPreference(localbluetoothprofile1.toString());
            if (checkboxpreference == null)
            {
                CheckBoxPreference checkboxpreference1 = createProfilePreference(localbluetoothprofile1);
                mProfileContainer.addPreference(checkboxpreference1);
            } else
            {
                refreshProfilePreference(checkboxpreference, localbluetoothprofile1);
            }
        }

        Iterator iterator1 = mCachedDevice.getRemovedProfiles().iterator();
        do
        {
            if (!iterator1.hasNext())
                break;
            LocalBluetoothProfile localbluetoothprofile = (LocalBluetoothProfile)iterator1.next();
            Preference preference = findPreference(localbluetoothprofile.toString());
            if (preference != null)
            {
                Log.d("DeviceProfilesSettings", (new StringBuilder()).append("Removing ").append(localbluetoothprofile.toString()).append(" from profile list").toString());
                mProfileContainer.removePreference(preference);
            }
        } while (true);
        showOrHideProfileGroup();
    }

    private void showOrHideProfileGroup()
    {
        int i = mProfileContainer.getPreferenceCount();
        if (!mProfileGroupIsRemoved && i == 0)
        {
            getPreferenceScreen().removePreference(mProfileContainer);
            mProfileGroupIsRemoved = true;
        } else
        if (mProfileGroupIsRemoved && i != 0)
        {
            getPreferenceScreen().addPreference(mProfileContainer);
            mProfileGroupIsRemoved = false;
            return;
        }
    }

    private void unpairDevice()
    {
        mCachedDevice.unpair();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        BluetoothDevice bluetoothdevice;
        if (bundle != null)
            bluetoothdevice = (BluetoothDevice)bundle.getParcelable("device");
        else
            bluetoothdevice = (BluetoothDevice)getArguments().getParcelable("device");
        addPreferencesFromResource(0x7f05000a);
        getPreferenceScreen().setOrderingAsAdded(false);
        mProfileContainer = (PreferenceGroup)findPreference("profile_container");
        mDeviceNamePref = (EditTextPreference)findPreference("rename_device");
        if (bluetoothdevice == null)
        {
            Log.w("DeviceProfilesSettings", "Activity started without a remote Bluetooth device");
            finish();
            return;
        }
        mRenameDeviceNamePref = new RenameEditTextPreference();
        mManager = LocalBluetoothManager.getInstance(getActivity());
        CachedBluetoothDeviceManager cachedbluetoothdevicemanager = mManager.getCachedDeviceManager();
        mProfileManager = mManager.getProfileManager();
        mCachedDevice = cachedbluetoothdevicemanager.findDevice(bluetoothdevice);
        if (mCachedDevice == null)
        {
            Log.w("DeviceProfilesSettings", "Device not found, cannot connect to it");
            finish();
            return;
        } else
        {
            String s = mCachedDevice.getName();
            mDeviceNamePref.setSummary(s);
            mDeviceNamePref.setText(s);
            mDeviceNamePref.setOnPreferenceChangeListener(this);
            addPreferencesForProfiles();
            return;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mDisconnectDialog != null)
        {
            mDisconnectDialog.dismiss();
            mDisconnectDialog = null;
        }
    }

    public void onDeviceAttributesChanged()
    {
        refresh();
    }

    public void onPause()
    {
        super.onPause();
        mCachedDevice.unregisterCallback(this);
        mManager.setForegroundActivity(null);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        boolean flag1;
        if (preference == mDeviceNamePref)
        {
            mCachedDevice.setName((String)obj);
            flag1 = true;
        } else
        {
            boolean flag = preference instanceof CheckBoxPreference;
            flag1 = false;
            if (flag)
            {
                onProfileClicked(getProfileOf(preference), (CheckBoxPreference)preference);
                return false;
            }
        }
        return flag1;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.getKey().equals("unpair"))
        {
            unpairDevice();
            noteStateNotSaved();
            finish();
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        boolean flag = true;
        super.onResume();
        mManager.setForegroundActivity(this);
        mCachedDevice.registerCallback(this);
        if (mCachedDevice.getBondState() == 10)
            finish();
        refresh();
        EditText edittext = mDeviceNamePref.getEditText();
        if (edittext != null)
        {
            InputFilter ainputfilter[] = new InputFilter[flag];
            ainputfilter[0] = new Utf8ByteLengthFilter(59);
            edittext.setFilters(ainputfilter);
            edittext.addTextChangedListener(mRenameDeviceNamePref);
            android.app.Dialog dialog = mDeviceNamePref.getDialog();
            if (dialog instanceof AlertDialog)
            {
                Button button = ((AlertDialog)dialog).getButton(-1);
                if (edittext.getText().length() <= 0)
                    flag = false;
                button.setEnabled(flag);
            }
        }
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("device", mCachedDevice.getDevice());
    }

}
