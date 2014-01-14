// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.app.Activity;
import android.content.*;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.util.Log;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;

// Referenced classes of package com.android.settings.deviceinfo:
//            UsbPreference

public class UsbSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_BICR = "usb_bicr";
    private static final String KEY_CHARGE = "usb_charge";
    private static final String KEY_MTP = "usb_mtp";
    private static final String KEY_PTP = "usb_ptp";
    private static final String KEY_UMS = "usb_ums";
    private static final String TAG = "UsbSettings";
    private static final int USB_CHARGING_PHLUGIN = 2;
    private UsbPreference mBicr;
    private boolean mBicrExist;
    private boolean mCanUpdateToggle;
    private UsbPreference mCharge;
    private boolean mChargeExist;
    private String mCurrentToggles;
    private boolean mIsHwUsbConnected;
    private boolean mIsPcKnowMe;
    private UsbPreference mMtp;
    private int mPlugType;
    private UsbPreference mPtp;
    private final BroadcastReceiver mStateReceiver = new BroadcastReceiver() {

        final UsbSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
label0:
            {
                String s = intent.getAction();
                String s1 = getCurrentFunction();
                if (s.equals("android.hardware.usb.action.USB_STATE"))
                {
                    mUsbAccessoryMode = intent.getBooleanExtra("accessory", false);
                    Log.e("UsbSettings", (new StringBuilder()).append("UsbAccessoryMode ").append(mUsbAccessoryMode).toString());
                    UsbSettings usbsettings = UsbSettings.this;
                    boolean flag;
                    if (!intent.getBooleanExtra("USB_HW_DISCONNECTED", false))
                        flag = true;
                    else
                        flag = false;
                    usbsettings.mIsHwUsbConnected = flag;
                    mIsPcKnowMe = intent.getBooleanExtra("USB_IS_PC_KNOW_ME", true);
                    Log.d("UsbSettings", (new StringBuilder()).append("[ACTION_USB_STATE], mIsHwUsbConnected :").append(mIsHwUsbConnected).append(", mIsPcKnowMe :").append(mIsPcKnowMe).toString());
                    if (mIsHwUsbConnected)
                    {
                        if (mCurrentToggles.equals(s1) || !mIsPcKnowMe && !mCurrentToggles.equals("charging"))
                            mCanUpdateToggle = true;
                        if (mCanUpdateToggle)
                        {
                            Log.d("UsbSettings", "[Update Toggle - Other Functions]");
                            updateToggles(s1);
                        }
                    } else
                    if (!s1.equals("charging"))
                    {
                        Log.d("UsbSettings", "[Finish Activity]");
                        finish();
                    }
                }
                if (s.equals("android.intent.action.BATTERY_CHANGED"))
                {
                    mPlugType = intent.getIntExtra("plugged", 0);
                    Log.d("UsbSettings", (new StringBuilder()).append("[ACTION_BATTERY_CHANGED], mPlugType :").append(mPlugType).toString());
                    if (mPlugType != 2)
                        break label0;
                    if (s1.equals("charging"))
                    {
                        Log.d("UsbSettings", "[Update Toggle - USB Charging]");
                        updateToggles(s1);
                    }
                }
                return;
            }
            Log.d("UsbSettings", "[Finish Activity - USB Charging Unplugged]");
            finish();
        }

            
            {
                this$0 = UsbSettings.this;
                super();
            }
    }
;
    private UsbPreference mUms;
    private boolean mUmsExist;
    private boolean mUsbAccessoryMode;
    private UsbManager mUsbManager;

    public UsbSettings()
    {
        mUmsExist = true;
        mChargeExist = true;
        mBicrExist = true;
        mIsHwUsbConnected = false;
        mIsPcKnowMe = false;
        mPlugType = 2;
        mCanUpdateToggle = true;
        mCurrentToggles = "";
    }

    private PreferenceScreen createPreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
            preferencescreen.removeAll();
        addPreferencesFromResource(0x7f050043);
        PreferenceScreen preferencescreen1 = getPreferenceScreen();
        mMtp = (UsbPreference)preferencescreen1.findPreference("usb_mtp");
        mMtp.setOnPreferenceChangeListener(this);
        mPtp = (UsbPreference)preferencescreen1.findPreference("usb_ptp");
        mPtp.setOnPreferenceChangeListener(this);
        mUms = (UsbPreference)preferencescreen1.findPreference("usb_ums");
        mUms.setOnPreferenceChangeListener(this);
        mCharge = (UsbPreference)preferencescreen1.findPreference("usb_charge");
        mCharge.setOnPreferenceChangeListener(this);
        mBicr = (UsbPreference)preferencescreen1.findPreference("usb_bicr");
        mBicr.setOnPreferenceChangeListener(this);
        if (!SystemProperties.get("ro.sys.usb.storage.type", "mtp").equals("mtp,mass_storage"))
        {
            preferencescreen1.removePreference(mUms);
            mUmsExist = false;
        }
        String s = SystemProperties.get("ro.sys.usb.charging.only", "no");
        Log.d("UsbSettings", (new StringBuilder()).append("ro.sys.usb.charging.only: ").append(s).toString());
        if (s.equals("no"))
        {
            Log.d("UsbSettings", "Usb Charge does not exist!");
            preferencescreen1.removePreference(mCharge);
            mChargeExist = false;
        }
        String s1 = SystemProperties.get("ro.sys.usb.bicr", "no");
        Log.d("UsbSettings", (new StringBuilder()).append("ro.sys.usb.bicr: ").append(s1).toString());
        if (s1.equals("no"))
        {
            Log.d("UsbSettings", "Usb Bicr does not exist!");
            PreferenceCategory preferencecategory = (PreferenceCategory)findPreference("usb_connect_as_cdrom_category");
            preferencescreen1.removePreference(mBicr);
            preferencescreen1.removePreference(preferencecategory);
            mBicrExist = false;
        }
        return preferencescreen1;
    }

    private String getCurrentFunction()
    {
        String s = SystemProperties.get("sys.usb.config", "none");
        Log.d("UsbSettings", (new StringBuilder()).append("current function: ").append(s).toString());
        int i = s.indexOf(',');
        if (i > 0)
            s = s.substring(0, i);
        return s;
    }

    private void updateToggles(String s)
    {
        if ("mtp".equals(s))
        {
            mMtp.setChecked(true);
            mPtp.setChecked(false);
            if (mUmsExist)
                mUms.setChecked(false);
            if (mChargeExist)
                mCharge.setChecked(false);
            if (mBicrExist)
                mBicr.setChecked(false);
        } else
        if ("ptp".equals(s))
        {
            mMtp.setChecked(false);
            mPtp.setChecked(true);
            if (mUmsExist)
                mUms.setChecked(false);
            if (mChargeExist)
                mCharge.setChecked(false);
            if (mBicrExist)
                mBicr.setChecked(false);
        } else
        if ("mass_storage".equals(s))
        {
            mMtp.setChecked(false);
            mPtp.setChecked(false);
            if (mUmsExist)
                mUms.setChecked(true);
            if (mChargeExist)
                mCharge.setChecked(false);
            if (mBicrExist)
                mBicr.setChecked(false);
        } else
        if ("charging".equals(s))
        {
            mMtp.setChecked(false);
            mPtp.setChecked(false);
            if (mUmsExist)
                mUms.setChecked(false);
            if (mChargeExist)
                mCharge.setChecked(true);
            if (mBicrExist)
                mBicr.setChecked(false);
        } else
        if ("bicr".equals(s))
        {
            mMtp.setChecked(false);
            mPtp.setChecked(false);
            if (mUmsExist)
                mUms.setChecked(false);
            if (mChargeExist)
                mCharge.setChecked(false);
            if (mBicrExist)
                mBicr.setChecked(true);
        } else
        {
            mMtp.setChecked(false);
            mPtp.setChecked(false);
            if (mUmsExist)
                mUms.setChecked(false);
            if (mChargeExist)
                mCharge.setChecked(false);
            if (mBicrExist)
                mBicr.setChecked(false);
        }
        if (!mUsbAccessoryMode)
        {
            Log.e("UsbSettings", "USB Normal Mode");
            mMtp.setEnabled(true);
            mPtp.setEnabled(true);
            if (mUmsExist)
                mUms.setEnabled(true);
            if (mChargeExist)
                mCharge.setEnabled(true);
            if (mBicrExist)
                mBicr.setEnabled(true);
        } else
        {
            Log.e("UsbSettings", "USB Accessory Mode");
            mMtp.setEnabled(false);
            mPtp.setEnabled(false);
            if (mUmsExist)
                mUms.setEnabled(false);
            if (mChargeExist)
                mCharge.setEnabled(false);
            if (mBicrExist)
                mBicr.setEnabled(false);
        }
        mCurrentToggles = s;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mUsbManager = (UsbManager)getSystemService("usb");
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mStateReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        Log.d("UsbSettings", "onPreferenceChange");
        if (Utils.isMonkeyRunning())
            return true;
        if (preference instanceof CheckBoxPreference)
        {
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)preference;
            Log.d("UsbSettings", (new StringBuilder()).append("").append(checkboxpreference.getTitle()).append(checkboxpreference.isChecked()).toString());
            if (!checkboxpreference.isChecked())
            {
                checkboxpreference.setChecked(true);
                return true;
            }
        }
        if (preference == mMtp)
        {
            mUsbManager.setCurrentFunction("mtp", true);
            updateToggles("mtp");
        } else
        if (preference == mPtp)
        {
            mUsbManager.setCurrentFunction("ptp", true);
            updateToggles("ptp");
        } else
        if (preference == mUms)
        {
            mUsbManager.setCurrentFunction("mass_storage", true);
            updateToggles("mass_storage");
        } else
        if (preference == mCharge)
        {
            mUsbManager.setCurrentFunction("charging", true);
            updateToggles("charging");
        } else
        if (preference == mBicr)
        {
            mUsbManager.setCurrentFunction("bicr", false);
            updateToggles("bicr");
        }
        mCanUpdateToggle = false;
        return true;
    }

    public void onResume()
    {
        super.onResume();
        createPreferenceHierarchy();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.hardware.usb.action.USB_STATE");
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        getActivity().registerReceiver(mStateReceiver, intentfilter);
    }




/*
    static boolean access$102(UsbSettings usbsettings, boolean flag)
    {
        usbsettings.mUsbAccessoryMode = flag;
        return flag;
    }

*/



/*
    static boolean access$202(UsbSettings usbsettings, boolean flag)
    {
        usbsettings.mIsHwUsbConnected = flag;
        return flag;
    }

*/



/*
    static boolean access$302(UsbSettings usbsettings, boolean flag)
    {
        usbsettings.mIsPcKnowMe = flag;
        return flag;
    }

*/




/*
    static boolean access$502(UsbSettings usbsettings, boolean flag)
    {
        usbsettings.mCanUpdateToggle = flag;
        return flag;
    }

*/




/*
    static int access$702(UsbSettings usbsettings, int i)
    {
        usbsettings.mPlugType = i;
        return i;
    }

*/
}
