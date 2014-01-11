// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.bluetooth.*;
import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.os.*;
import android.os.storage.IMountService;
import android.preference.*;
import android.webkit.WebView;
import com.android.settings.wifi.WifiApEnabler;
import com.mediatek.settings.ext.ISettingsMiscExt;
import com.mediatek.wifi.hotspot.HotspotSwitchPreference;
import com.mediatek.xlog.Xlog;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, Utils

public class TetherSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private class TetherChangeReceiver extends BroadcastReceiver
    {

        final TetherSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("TetherSettings", (new StringBuilder()).append("TetherChangeReceiver - onReceive, action is ").append(s).toString());
            if (s.equals("android.net.conn.TETHER_STATE_CHANGED"))
            {
                ArrayList arraylist = intent.getStringArrayListExtra("availableArray");
                ArrayList arraylist1 = intent.getStringArrayListExtra("activeArray");
                ArrayList arraylist2 = intent.getStringArrayListExtra("erroredArray");
                mUsbUnTetherDone = intent.getBooleanExtra("UnTetherDone", false);
                mUsbTetherDone = intent.getBooleanExtra("TetherDone", false);
                mUsbTetherFail = intent.getBooleanExtra("TetherFail", false);
                Xlog.d("TetherSettings", (new StringBuilder()).append("mUsbUnTetherDone? :").append(mUsbUnTetherDone).append(" , mUsbTetherDonel? :").append(mUsbTetherDone).append(" , tether fail? :").append(mUsbTetherFail).toString());
                updateState((String[])arraylist.toArray(new String[arraylist.size()]), (String[])arraylist1.toArray(new String[arraylist1.size()]), (String[])arraylist2.toArray(new String[arraylist2.size()]));
            } else
            {
                if (s.equals("android.intent.action.MEDIA_SHARED"))
                {
                    mMassStorageActive = true;
                    updateState();
                    return;
                }
                if (s.equals("android.intent.action.MEDIA_UNSHARED"))
                {
                    mMassStorageActive = false;
                    updateState();
                    return;
                }
                if (s.equals("android.hardware.usb.action.USB_STATE"))
                {
                    mUsbConnected = intent.getBooleanExtra("connected", false);
                    mUsbConfigured = intent.getBooleanExtra("configured", false);
                    mUsbHwDisconnected = intent.getBooleanExtra("USB_HW_DISCONNECTED", false);
                    mIsPcKnowMe = intent.getBooleanExtra("USB_IS_PC_KNOW_ME", true);
                    Xlog.d("TetherSettings", (new StringBuilder()).append("TetherChangeReceiver - ACTION_USB_STATE mUsbConnected: ").append(mUsbConnected).append(", mUsbConfigured:  ").append(mUsbConfigured).append(", mUsbHwDisconnected: ").append(mUsbHwDisconnected).toString());
                    updateState();
                    return;
                }
                if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
                {
                    if (mBluetoothEnableForTether)
                        switch (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000))
                        {
                        default:
                            break;

                        case -2147483648: 
                        case 10: // '\n'
                            mBluetoothEnableForTether = false;
                            break;

                        case 12: // '\f'
                            BluetoothPan bluetoothpan = (BluetoothPan)mBluetoothPan.get();
                            if (bluetoothpan != null)
                            {
                                bluetoothpan.setBluetoothTethering(true);
                                mBluetoothEnableForTether = false;
                            }
                            if (mBluetoothDun != null)
                            {
                                mBluetoothDun.setBluetoothTethering(true);
                                mBluetoothEnableForTether = false;
                            }
                            break;
                        }
                    updateState();
                    return;
                }
                if (s.equals("mediatek.intent.action.USB_DATA_STATE"))
                {
                    String s1 = intent.getStringExtra("apn");
                    com.android.internal.telephony.PhoneConstants.DataState datastate = (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, intent.getStringExtra("state"));
                    Xlog.d("TetherSettings", "receive USB_DATA_STATE");
                    Xlog.d("TetherSettings", (new StringBuilder()).append("dataApnKey = ").append(s1).append(", state = ").append(datastate).toString());
                    if ("internet".equals(s1))
                    {
                        if (datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED)
                            mUsbInternetSharing = true;
                        else
                            mUsbInternetSharing = false;
                        updateState();
                        return;
                    }
                } else
                if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(s))
                {
                    int i = intent.getIntExtra("wifi_state", 14);
                    if (i == 13 || i == 11)
                    {
                        updateIpv6Preference();
                        return;
                    }
                } else
                if (s.equals("android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED") || s.equals("android.bluetooth.profilemanager.action.STATE_CHANGED"))
                {
                    updateState();
                    return;
                }
            }
        }

        private TetherChangeReceiver()
        {
            this$0 = TetherSettings.this;
            super();
        }

    }


    private static final int BLUETOOTH_TETHERING = 2;
    private static final int DIALOG_AP_SETTINGS = 1;
    private static final String ENABLE_BLUETOOTH_TETHERING = "enable_bluetooth_tethering";
    private static final int INVALID = -1;
    private static final int PROVISION_REQUEST = 0;
    private static final String TAG = "TetherSettings";
    private static final String TETHERED_IPV6 = "tethered_ipv6";
    private static final String TETHER_APN_SETTING = "tether_apn_settings";
    private static final String USB_DATA_STATE = "mediatek.intent.action.USB_DATA_STATE";
    private static final int USB_TETHERING = 1;
    private static final String USB_TETHERING_TYPE = "usb_tethering_type";
    private static final String USB_TETHER_SETTINGS = "usb_tether_settings";
    private static final String WIFI_SWITCH_SETTINGS = "wifi_tether_settings";
    private BluetoothDun mBluetoothDun;
    private boolean mBluetoothEnableForTether;
    private AtomicReference mBluetoothPan;
    private String mBluetoothRegexs[];
    private CheckBoxPreference mBluetoothTether;
    private int mBtErrorIpv4;
    private int mBtErrorIpv6;
    ISettingsMiscExt mExt;
    private boolean mIsPcKnowMe;
    private boolean mMassStorageActive;
    private IMountService mMountService;
    private android.bluetooth.BluetoothProfile.ServiceListener mProfileServiceListener;
    private String mProvisionApp[];
    private String mSecurityType[];
    private Preference mTetherApnSetting;
    private BroadcastReceiver mTetherChangeReceiver;
    private int mTetherChoice;
    private ListPreference mTetherIpv6;
    private boolean mUsbConfigured;
    private boolean mUsbConnected;
    private boolean mUsbHwDisconnected;
    private boolean mUsbInternetSharing;
    private String mUsbRegexs[];
    private CheckBoxPreference mUsbTether;
    private boolean mUsbTetherCheckEnable;
    private boolean mUsbTetherDone;
    private boolean mUsbTetherFail;
    private ListPreference mUsbTetherType;
    private boolean mUsbTethering;
    private boolean mUsbUnTetherDone;
    private WebView mView;
    private WifiApEnabler mWifiApEnabler;
    private String mWifiRegexs[];
    private HotspotSwitchPreference mWifiTether;

    public TetherSettings()
    {
        mBluetoothPan = new AtomicReference();
        mUsbTethering = false;
        mUsbTetherCheckEnable = false;
        mUsbUnTetherDone = true;
        mUsbTetherDone = true;
        mUsbTetherFail = false;
        mIsPcKnowMe = true;
        mUsbInternetSharing = false;
        mMountService = null;
        mTetherChoice = -1;
        mProfileServiceListener = new android.bluetooth.BluetoothProfile.ServiceListener() {

            final TetherSettings this$0;

            public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
            {
                mBluetoothPan.set((BluetoothPan)bluetoothprofile);
            }

            public void onServiceDisconnected(int i)
            {
                mBluetoothPan.set(null);
            }

            
            {
                this$0 = TetherSettings.this;
                super();
            }
        }
;
    }

    private static String findIface(String as[], String as1[])
    {
        int i = as.length;
        for (int j = 0; j < i; j++)
        {
            String s = as[j];
            int k = as1.length;
            for (int l = 0; l < k; l++)
                if (s.matches(as1[l]))
                    return s;

        }

        return null;
    }

    private IMountService getMountService()
    {
        this;
        JVM INSTR monitorenter ;
        android.os.IBinder ibinder;
        if (mMountService != null)
            break MISSING_BLOCK_LABEL_27;
        ibinder = ServiceManager.getService("mount");
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_36;
        mMountService = android.os.storage.IMountService.Stub.asInterface(ibinder);
_L1:
        IMountService imountservice = mMountService;
        this;
        JVM INSTR monitorexit ;
        return imountservice;
        Xlog.e("TetherSettings", "Can't get mount service");
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    private boolean isUMSEnabled()
    {
        if (mMountService == null)
        {
            Xlog.d("TetherSettings", " mMountService is null, return");
            return false;
        }
        boolean flag;
        try
        {
            flag = mMountService.isUsbMassStorageEnabled();
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("TetherSettings", (new StringBuilder()).append("Util:RemoteException when isUsbMassStorageEnabled: ").append(remoteexception).toString());
            return false;
        }
        return flag;
    }

    private void setUsbTethering(boolean flag)
    {
        if (((ConnectivityManager)getSystemService("connectivity")).setUsbTethering(flag) != 0)
        {
            mUsbTether.setChecked(false);
            mUsbTether.setSummary(0x7f0b05d7);
            return;
        } else
        {
            mUsbTether.setSummary("");
            return;
        }
    }

    private void startProvisioningIfNecessary(int i)
    {
        mTetherChoice = i;
        if (isProvisioningNeeded())
        {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClassName(mProvisionApp[0], mProvisionApp[1]);
            startActivityForResult(intent, 0);
            return;
        } else
        {
            startTethering();
            return;
        }
    }

    private void startTethering()
    {
        switch (mTetherChoice)
        {
        case 1: // '\001'
            setUsbTethering(true);
            return;

        case 2: // '\002'
            BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
            if (bluetoothadapter.getState() == 10)
            {
                mBluetoothEnableForTether = true;
                bluetoothadapter.enable();
                mBluetoothTether.setSummary(0x7f0b02e9);
                mBluetoothTether.setEnabled(false);
                return;
            }
            BluetoothPan bluetoothpan = (BluetoothPan)mBluetoothPan.get();
            if (bluetoothpan != null)
                bluetoothpan.setBluetoothTethering(true);
            if (mBluetoothDun != null)
                mBluetoothDun.setBluetoothTethering(true);
            String s = getString(0x7f0b05d9);
            mBluetoothTether.setSummary((new StringBuilder()).append(s).append(getIPV6String(mBtErrorIpv4, mBtErrorIpv6)).toString());
            return;
        }
    }

    private void updateBluetoothState(String as[], String as1[], String as2[])
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        mBtErrorIpv4 = 0;
        mBtErrorIpv6 = 16;
        int i = as.length;
        for (int j = 0; j < i; j++)
        {
            String s4 = as[j];
            String as4[] = mBluetoothRegexs;
            int i2 = as4.length;
            for (int j2 = 0; j2 < i2; j2++)
            {
                if (!s4.matches(as4[j2]) || connectivitymanager == null)
                    continue;
                if (mBtErrorIpv4 == 0)
                    mBtErrorIpv4 = 0xf & connectivitymanager.getLastTetherError(s4);
                if (mBtErrorIpv6 == 16)
                    mBtErrorIpv6 = 0xf0 & connectivitymanager.getLastTetherError(s4);
            }

        }

        boolean flag = false;
        int k = as2.length;
        for (int l = 0; l < k; l++)
        {
            String s3 = as2[l];
            String as3[] = mBluetoothRegexs;
            int k1 = as3.length;
            for (int l1 = 0; l1 < k1; l1++)
                if (s3.matches(as3[l1]))
                    flag = true;

        }

        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter == null)
            return;
        int i1 = bluetoothadapter.getState();
        Xlog.d("TetherSettings", (new StringBuilder()).append("btState = ").append(i1).toString());
        if (i1 == 13)
        {
            mBluetoothTether.setEnabled(false);
            mBluetoothTether.setSummary(0x7f0b02ea);
            return;
        }
        if (i1 == 11)
        {
            mBluetoothTether.setEnabled(false);
            mBluetoothTether.setSummary(0x7f0b02e9);
            return;
        }
        BluetoothPan bluetoothpan = (BluetoothPan)mBluetoothPan.get();
        if (i1 != 12 || (bluetoothpan == null || !bluetoothpan.isTetheringOn()) && (mBluetoothDun == null || !mBluetoothDun.isTetheringOn()))
        {
            mBluetoothTether.setEnabled(true);
            mBluetoothTether.setChecked(false);
            mBluetoothTether.setSummary(0x7f0b05dc);
            return;
        }
        mBluetoothTether.setChecked(true);
        mBluetoothTether.setEnabled(true);
        int j1 = 0;
        if (bluetoothpan != null)
        {
            boolean flag1 = bluetoothpan.isTetheringOn();
            j1 = 0;
            if (flag1)
            {
                j1 = bluetoothpan.getConnectedDevices().size();
                Xlog.d("TetherSettings", (new StringBuilder()).append("bluetooth Tethered PAN devices = ").append(j1).toString());
            }
        }
        if (mBluetoothDun != null && mBluetoothDun.isTetheringOn())
        {
            j1 += mBluetoothDun.getConnectedDevices().size();
            Xlog.d("TetherSettings", (new StringBuilder()).append("bluetooth tethered total devices = ").append(j1).toString());
        }
        if (j1 > 1)
        {
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(j1);
            String s2 = getString(0x7f0b05db, aobj);
            mBluetoothTether.setSummary((new StringBuilder()).append(s2).append(getIPV6String(mBtErrorIpv4, mBtErrorIpv6)).toString());
            return;
        }
        if (j1 == 1)
        {
            String s1 = getString(0x7f0b05da);
            mBluetoothTether.setSummary((new StringBuilder()).append(s1).append(getIPV6String(mBtErrorIpv4, mBtErrorIpv6)).toString());
            return;
        }
        if (flag)
        {
            mBluetoothTether.setSummary(0x7f0b05dd);
            return;
        } else
        {
            String s = getString(0x7f0b05d9);
            mBluetoothTether.setSummary((new StringBuilder()).append(s).append(getIPV6String(mBtErrorIpv4, mBtErrorIpv6)).toString());
            return;
        }
    }

    private void updateIpv6Preference()
    {
        if (mTetherIpv6 != null)
        {
            ListPreference listpreference = mTetherIpv6;
            boolean flag;
            if (!mUsbTether.isChecked() && !mBluetoothTether.isChecked() && !mWifiTether.isChecked())
                flag = true;
            else
                flag = false;
            listpreference.setEnabled(flag);
            ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
            if (connectivitymanager != null)
            {
                int i;
                if (connectivitymanager.getTetheringIpv6Enable())
                    i = 1;
                else
                    i = 0;
                mTetherIpv6.setValueIndex(i);
                mTetherIpv6.setSummary(getResources().getStringArray(0x7f070086)[i]);
            }
        }
    }

    private void updateState()
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        updateState(connectivitymanager.getTetherableIfaces(), connectivitymanager.getTetheredIfaces(), connectivitymanager.getTetheringErroredIfaces());
    }

    private void updateState(String as[], String as1[], String as2[])
    {
        if (mUsbInternetSharing)
        {
            mUsbTether.setEnabled(false);
            mBluetoothTether.setEnabled(false);
            Xlog.d("TetherSettings", "usb internet is connected, return");
            return;
        }
        Xlog.d("TetherSettings", (new StringBuilder()).append("=======> updateState - mUsbConnected: ").append(mUsbConnected).append(", mUsbConfigured:  ").append(mUsbConfigured).append(", mUsbHwDisconnected: ").append(mUsbHwDisconnected).append(", checked: ").append(mUsbTether.isChecked()).append(", mUsbUnTetherDone: ").append(mUsbUnTetherDone).append(", mUsbTetherDone: ").append(mUsbTetherDone).append(", tetherfail: ").append(mUsbTetherFail).append(", mIsPcKnowMe: ").append(mIsPcKnowMe).toString());
        if (mUsbTether.isChecked())
        {
            if (mUsbConnected && mUsbConfigured && !mUsbHwDisconnected)
            {
                if (mUsbTetherFail || mUsbTetherDone || !mIsPcKnowMe)
                    mUsbTetherCheckEnable = true;
            } else
            {
                mUsbTetherCheckEnable = false;
            }
        } else
        if (mUsbConnected && !mUsbHwDisconnected)
        {
            if (mUsbUnTetherDone || mUsbTetherFail)
                mUsbTetherCheckEnable = true;
        } else
        {
            mUsbTetherCheckEnable = false;
        }
        updateUsbState(as, as1, as2);
        updateBluetoothState(as, as1, as2);
        updateIpv6Preference();
    }

    private void updateUsbState(String as[], String as1[], String as2[])
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        boolean flag;
        if (mUsbConnected && !mMassStorageActive)
            flag = true;
        else
            flag = false;
        int i = 0;
        int j = 16;
        int k = as.length;
        for (int l = 0; l < k; l++)
        {
            String s3 = as[l];
            String as5[] = mUsbRegexs;
            int i3 = as5.length;
            for (int j3 = 0; j3 < i3; j3++)
            {
                if (!s3.matches(as5[j3]) || connectivitymanager == null)
                    continue;
                if (i == 0)
                    i = 0xf & connectivitymanager.getLastTetherError(s3);
                if (j == 16)
                    j = 0xf0 & connectivitymanager.getLastTetherError(s3);
            }

        }

        boolean flag1 = false;
        int i1 = as1.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            String s2 = as1[j1];
            String as4[] = mUsbRegexs;
            int k2 = as4.length;
            for (int l2 = 0; l2 < k2; l2++)
            {
                if (!s2.matches(as4[l2]))
                    continue;
                flag1 = true;
                if (connectivitymanager != null && j == 16)
                    j = 0xf0 & connectivitymanager.getLastTetherError(s2);
            }

        }

        boolean flag2 = false;
        int k1 = as2.length;
        for (int l1 = 0; l1 < k1; l1++)
        {
            String s1 = as2[l1];
            String as3[] = mUsbRegexs;
            int i2 = as3.length;
            for (int j2 = 0; j2 < i2; j2++)
                if (s1.matches(as3[j2]))
                    flag2 = true;

        }

        Xlog.d("TetherSettings", (new StringBuilder()).append("updateUsbState - usbTethered : ").append(flag1).append(" usbErrored: ").append(flag2).append(" usbAvailable: ").append(flag).toString());
        if (flag1)
        {
            Xlog.d("TetherSettings", "updateUsbState: usbTethered ! mUsbTether checkbox setEnabled & checked ");
            mUsbTether.setEnabled(true);
            mUsbTether.setChecked(true);
            String s = getString(0x7f0b05d4);
            mUsbTether.setSummary((new StringBuilder()).append(s).append(getIPV6String(i, j)).toString());
            mUsbTethering = false;
            mUsbTetherType.setEnabled(false);
            Xlog.d("TetherSettings", (new StringBuilder()).append("updateUsbState - usbTethered - mUsbTetherCheckEnable: ").append(mUsbTetherCheckEnable).toString());
            return;
        }
        if (flag)
        {
            if (i != 0 && i != 16)
                mUsbTether.setSummary(0x7f0b05d7);
            else
                mUsbTether.setSummary(0x7f0b05d3);
            if (mUsbTetherCheckEnable)
            {
                Xlog.d("TetherSettings", "updateUsbState - mUsbTetherCheckEnable, mUsbTether checkbox setEnabled, and set unchecked ");
                mUsbTether.setEnabled(true);
                mUsbTether.setChecked(false);
                mUsbTethering = false;
                mUsbTetherType.setEnabled(true);
            }
            Xlog.d("TetherSettings", (new StringBuilder()).append("updateUsbState - usbAvailable - mUsbConfigured:  ").append(mUsbConfigured).append(" mUsbTethering: ").append(mUsbTethering).append(" mUsbTetherCheckEnable: ").append(mUsbTetherCheckEnable).toString());
            return;
        }
        if (flag2)
        {
            mUsbTether.setSummary(0x7f0b05d7);
            mUsbTether.setEnabled(false);
            mUsbTether.setChecked(false);
            mUsbTethering = false;
            return;
        }
        if (mMassStorageActive)
        {
            mUsbTether.setSummary(0x7f0b05d5);
            mUsbTether.setEnabled(false);
            mUsbTether.setChecked(false);
            mUsbTethering = false;
            return;
        }
        if (!mUsbHwDisconnected && (mUsbHwDisconnected || mUsbConnected || mUsbConfigured))
        {
            Xlog.d("TetherSettings", "updateUsbState - else, mUsbTether checkbox setEnabled, and set unchecked ");
            mUsbTether.setSummary(0x7f0b05d3);
            mUsbTether.setEnabled(true);
            mUsbTether.setChecked(false);
            mUsbTethering = false;
            mUsbTetherType.setEnabled(true);
        } else
        {
            mUsbTether.setSummary(0x7f0b05d6);
            mUsbTether.setEnabled(false);
            mUsbTether.setChecked(false);
            mUsbTethering = false;
        }
        Xlog.d("TetherSettings", (new StringBuilder()).append("updateUsbState- usbAvailable- mUsbHwDisconnected:").append(mUsbHwDisconnected).toString());
    }

    public int getHelpResource()
    {
        return 0x7f0b0933;
    }

    public String getIPV6String(int i, int j)
    {
        String s = "";
        if (mTetherIpv6 != null && "1".equals(mTetherIpv6.getValue()))
        {
            Xlog.d("TetherSettings", (new StringBuilder()).append("[errorIpv4 =").append(i).append("];").append("[errorIpv6 =").append(j).append("];").toString());
            if (i == 0 && j == 32)
            {
                s = getResources().getString(0x7f0b0153);
            } else
            {
                if (i == 0)
                    return getResources().getString(0x7f0b0155);
                if (j == 32)
                    return getResources().getString(0x7f0b0154);
            }
        }
        return s;
    }

    boolean isProvisioningNeeded()
    {
        return !SystemProperties.getBoolean("net.tethering.noprovisioning", false) && mProvisionApp.length == 2;
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            super.onActivityResult(i, j, intent);
            if (i == 0)
            {
                if (j != -1)
                    break label0;
                startTethering();
            }
            return;
        }
        switch (mTetherChoice)
        {
        case 1: // '\001'
            mUsbTether.setChecked(false);
            break;

        case 2: // '\002'
            mBluetoothTether.setChecked(false);
            break;
        }
        mTetherChoice = -1;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05003d);
        mExt = Utils.getMiscPlugin(getActivity());
        Activity activity = getActivity();
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter != null)
            bluetoothadapter.getProfileProxy(activity.getApplicationContext(), mProfileServiceListener, 5);
        mBluetoothDun = new BluetoothDun(getActivity().getApplicationContext());
        mWifiTether = (HotspotSwitchPreference)findPreference("wifi_tether_settings");
        mWifiTether.setChecked(false);
        mUsbTether = (CheckBoxPreference)findPreference("usb_tether_settings");
        mBluetoothTether = (CheckBoxPreference)findPreference("enable_bluetooth_tethering");
        mTetherApnSetting = findPreference("tether_apn_settings");
        mTetherIpv6 = (ListPreference)findPreference("tethered_ipv6");
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        mUsbTetherType = (ListPreference)findPreference("usb_tethering_type");
        getPreferenceScreen().removePreference(mUsbTetherType);
        mUsbRegexs = connectivitymanager.getTetherableUsbRegexs();
        mWifiRegexs = connectivitymanager.getTetherableWifiRegexs();
        mBluetoothRegexs = connectivitymanager.getTetherableBluetoothRegexs();
        boolean flag;
        if (mUsbRegexs.length != 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mWifiRegexs.length != 0)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (mBluetoothRegexs.length != 0)
            flag2 = true;
        else
            flag2 = false;
        if (!flag || Utils.isMonkeyRunning())
        {
            getPreferenceScreen().removePreference(mUsbTether);
            getPreferenceScreen().removePreference(mUsbTetherType);
        }
        if (flag1 && !Utils.isMonkeyRunning())
        {
            mWifiApEnabler = new WifiApEnabler(activity, mWifiTether);
            mWifiApEnabler.setTetherSettings(this);
        } else
        {
            getPreferenceScreen().removePreference(mWifiTether);
        }
        if (!flag2)
        {
            getPreferenceScreen().removePreference(mBluetoothTether);
        } else
        {
            BluetoothPan bluetoothpan = (BluetoothPan)mBluetoothPan.get();
            if ((bluetoothpan == null || !bluetoothpan.isTetheringOn()) && (mBluetoothDun == null || !mBluetoothDun.isTetheringOn()))
                mBluetoothTether.setChecked(false);
            else
                mBluetoothTether.setChecked(true);
        }
        mExt.removeTetherApnSettings(getPreferenceScreen(), mTetherApnSetting);
        mProvisionApp = getResources().getStringArray(0x107001e);
        mView = new WebView(activity);
        if (mTetherIpv6 != null)
            mTetherIpv6.setOnPreferenceChangeListener(this);
        getMountService();
    }

    public void onPause()
    {
        super.onPause();
        if (mWifiApEnabler != null)
            mWifiApEnabler.pause();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        Xlog.d("TetherSettings", (new StringBuilder()).append("onPreferenceChange key=").append(s).toString());
        if ("tethered_ipv6".equals(s))
        {
            ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
            int j = Integer.parseInt(String.valueOf(obj));
            if (connectivitymanager != null)
            {
                boolean flag;
                if (j == 1)
                    flag = true;
                else
                    flag = false;
                connectivitymanager.setTetheringIpv6Enable(flag);
            }
            mTetherIpv6.setValueIndex(j);
            mTetherIpv6.setSummary(getResources().getStringArray(0x7f070086)[j]);
        } else
        if ("usb_tethering_type".equals(s))
        {
            int i = Integer.parseInt((String)obj);
            android.provider.Settings.System.putInt(getContentResolver(), "usb_tethering_type", i);
            mUsbTetherType.setSummary(getResources().getStringArray(0x7f070088)[i]);
            Xlog.d("TetherSettings", (new StringBuilder()).append("onPreferenceChange USB_TETHERING_TYPE value = ").append(i).toString());
            return true;
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag;
label0:
        {
            flag = true;
            ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
            if (preference == mUsbTether)
            {
                if (mUsbTethering)
                    break label0;
                boolean flag2 = mUsbTether.isChecked();
                mUsbTether.setEnabled(false);
                mUsbTetherType.setEnabled(false);
                mUsbTethering = flag;
                mUsbTetherCheckEnable = false;
                if (flag2)
                    mUsbTetherDone = false;
                else
                    mUsbUnTetherDone = false;
                mUsbTetherFail = false;
                Xlog.d("TetherSettings", (new StringBuilder()).append("onPreferenceTreeClick - setusbTethering(").append(flag2).append(") mUsbTethering:  ").append(mUsbTethering).toString());
                if (flag2)
                    startProvisioningIfNecessary(flag);
                else
                    setUsbTethering(flag2);
            } else
            if (preference == mBluetoothTether)
            {
                if (mBluetoothTether.isChecked())
                {
                    startProvisioningIfNecessary(2);
                } else
                {
                    String s = findIface(connectivitymanager.getTetheredIfaces(), mBluetoothRegexs);
                    boolean flag1 = false;
                    if (s != null)
                    {
                        int i = connectivitymanager.untether(s);
                        flag1 = false;
                        if (i != 0)
                            flag1 = true;
                    }
                    BluetoothPan bluetoothpan = (BluetoothPan)mBluetoothPan.get();
                    if (bluetoothpan != null)
                        bluetoothpan.setBluetoothTethering(false);
                    if (mBluetoothDun != null)
                        mBluetoothDun.setBluetoothTethering(false);
                    if (flag1)
                        mBluetoothTether.setSummary(0x7f0b05dd);
                    else
                        mBluetoothTether.setSummary(0x7f0b05dc);
                }
                updateIpv6Preference();
            } else
            if (preference == mTetherApnSetting)
            {
                Intent intent = new Intent();
                intent.setClassName("com.android.phone", "com.mediatek.settings.MultipleSimActivity");
                intent.putExtra("TARGET_CLASS", "com.android.settings.TetherApnSettings");
                startActivity(intent);
            }
            flag = super.onPreferenceTreeClick(preferencescreen, preference);
        }
        return flag;
    }

    public void onResume()
    {
        super.onResume();
        if (mWifiApEnabler != null)
            mWifiApEnabler.resume();
        IntentFilter intentfilter = new IntentFilter("android.net.wifi.WIFI_AP_STATE_CHANGED");
        getActivity().registerReceiver(mTetherChangeReceiver, intentfilter);
    }

    public void onStart()
    {
        super.onStart();
        Activity activity = getActivity();
        mMassStorageActive = isUMSEnabled();
        Xlog.d("TetherSettings", (new StringBuilder()).append("mMassStorageActive = ").append(mMassStorageActive).toString());
        mTetherChangeReceiver = new TetherChangeReceiver();
        IntentFilter intentfilter = new IntentFilter("android.net.conn.TETHER_STATE_CHANGED");
        Intent intent = activity.registerReceiver(mTetherChangeReceiver, intentfilter);
        IntentFilter intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.hardware.usb.action.USB_STATE");
        activity.registerReceiver(mTetherChangeReceiver, intentfilter1);
        IntentFilter intentfilter2 = new IntentFilter();
        intentfilter2.addAction("android.intent.action.MEDIA_SHARED");
        intentfilter2.addAction("android.intent.action.MEDIA_UNSHARED");
        intentfilter2.addDataScheme("file");
        activity.registerReceiver(mTetherChangeReceiver, intentfilter2);
        IntentFilter intentfilter3 = new IntentFilter();
        intentfilter3.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        activity.registerReceiver(mTetherChangeReceiver, intentfilter3);
        IntentFilter intentfilter4 = new IntentFilter();
        intentfilter4.addAction("mediatek.intent.action.USB_DATA_STATE");
        activity.registerReceiver(mTetherChangeReceiver, intentfilter4);
        IntentFilter intentfilter5 = new IntentFilter();
        intentfilter5.addAction("android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED");
        intentfilter5.addAction("android.bluetooth.profilemanager.action.STATE_CHANGED");
        activity.registerReceiver(mTetherChangeReceiver, intentfilter5);
        if (intent != null)
            mTetherChangeReceiver.onReceive(activity, intent);
        if (mUsbTetherType != null)
        {
            mUsbTetherType.setOnPreferenceChangeListener(this);
            int i = android.provider.Settings.System.getInt(getContentResolver(), "usb_tethering_type", 0);
            mUsbTetherType.setValue(String.valueOf(i));
            mUsbTetherType.setSummary(getResources().getStringArray(0x7f070088)[i]);
        }
        updateState();
    }

    public void onStop()
    {
        super.onStop();
        getActivity().unregisterReceiver(mTetherChangeReceiver);
        mTetherChangeReceiver = null;
    }




/*
    static boolean access$1002(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mIsPcKnowMe = flag;
        return flag;
    }

*/


/*
    static boolean access$102(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbUnTetherDone = flag;
        return flag;
    }

*/



/*
    static boolean access$1102(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mBluetoothEnableForTether = flag;
        return flag;
    }

*/



/*
    static boolean access$1302(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbInternetSharing = flag;
        return flag;
    }

*/




/*
    static boolean access$202(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbTetherDone = flag;
        return flag;
    }

*/



/*
    static boolean access$302(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbTetherFail = flag;
        return flag;
    }

*/



/*
    static boolean access$502(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mMassStorageActive = flag;
        return flag;
    }

*/




/*
    static boolean access$702(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbConnected = flag;
        return flag;
    }

*/



/*
    static boolean access$802(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbConfigured = flag;
        return flag;
    }

*/



/*
    static boolean access$902(TetherSettings tethersettings, boolean flag)
    {
        tethersettings.mUsbHwDisconnected = flag;
        return flag;
    }

*/
}
