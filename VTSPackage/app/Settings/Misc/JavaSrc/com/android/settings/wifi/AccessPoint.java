// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.net.wifi.*;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.Preference;
import android.view.View;
import android.widget.ImageView;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IWifiExt;
import com.mediatek.xlog.Xlog;
import java.util.BitSet;

// Referenced classes of package com.android.settings.wifi:
//            Summary

class AccessPoint extends Preference
{
    static final class PskType extends Enum
    {

        private static final PskType $VALUES[];
        public static final PskType UNKNOWN;
        public static final PskType WPA;
        public static final PskType WPA2;
        public static final PskType WPA_WPA2;

        public static PskType valueOf(String s)
        {
            return (PskType)Enum.valueOf(com/android/settings/wifi/AccessPoint$PskType, s);
        }

        public static PskType[] values()
        {
            return (PskType[])$VALUES.clone();
        }

        static 
        {
            UNKNOWN = new PskType("UNKNOWN", 0);
            WPA = new PskType("WPA", 1);
            WPA2 = new PskType("WPA2", 2);
            WPA_WPA2 = new PskType("WPA_WPA2", 3);
            PskType apsktype[] = new PskType[4];
            apsktype[0] = UNKNOWN;
            apsktype[1] = WPA;
            apsktype[2] = WPA2;
            apsktype[3] = WPA_WPA2;
            $VALUES = apsktype;
        }

        private PskType(String s, int i)
        {
            super(s, i);
        }
    }


    private static final String KEY_CONFIG = "key_config";
    private static final String KEY_DETAILEDSTATE = "key_detailedstate";
    private static final String KEY_PROP_OPEN_AP_WPS = "mediatek.wlan.openap.wps";
    private static final String KEY_PROP_WFA_TEST_SUPPORT = "persist.radio.wifi.wpa2wpaalone";
    private static final String KEY_PROP_WFA_TEST_VALUE = "true";
    private static final String KEY_SCANRESULT = "key_scanresult";
    private static final String KEY_WIFIINFO = "key_wifiinfo";
    static final int SECURITY_EAP = 5;
    static final int SECURITY_NONE = 0;
    static final int SECURITY_PSK = 2;
    static final int SECURITY_WAPI_CERT = 7;
    static final int SECURITY_WAPI_PSK = 6;
    static final int SECURITY_WEP = 1;
    static final int SECURITY_WPA2_PSK = 4;
    static final int SECURITY_WPA_PSK = 3;
    private static final int STATE_NONE[] = new int[0];
    private static final int STATE_SECURED[] = {
        0x7f010000
    };
    static final String TAG = "Settings.AccessPoint";
    static IWifiExt sExt = null;
    private static String sWFATestFlag = null;
    String bssid;
    private WifiConfiguration mConfig;
    private WifiInfo mInfo;
    private int mRssi;
    ScanResult mScanResult;
    private android.net.NetworkInfo.DetailedState mState;
    int networkId;
    PskType pskType;
    int security;
    String ssid;
    boolean wpsAvailable;

    AccessPoint(Context context, ScanResult scanresult)
    {
        super(context);
        wpsAvailable = false;
        pskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f04007b);
        loadResult(scanresult);
        refresh();
        if (sExt == null)
            sExt = Utils.getWifiPlugin(getContext().getApplicationContext());
    }

    AccessPoint(Context context, WifiConfiguration wificonfiguration)
    {
        super(context);
        wpsAvailable = false;
        pskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f04007b);
        loadConfig(wificonfiguration);
        refresh();
        if (sExt == null)
            sExt = Utils.getWifiPlugin(getContext().getApplicationContext());
    }

    AccessPoint(Context context, Bundle bundle)
    {
        super(context);
        wpsAvailable = false;
        pskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f04007b);
        mConfig = (WifiConfiguration)bundle.getParcelable("key_config");
        if (mConfig != null)
            loadConfig(mConfig);
        mScanResult = (ScanResult)bundle.getParcelable("key_scanresult");
        if (mScanResult != null)
            loadResult(mScanResult);
        mInfo = (WifiInfo)bundle.getParcelable("key_wifiinfo");
        if (bundle.containsKey("key_detailedstate"))
            mState = android.net.NetworkInfo.DetailedState.valueOf(bundle.getString("key_detailedstate"));
        update(mInfo, mState);
        if (sExt == null)
            sExt = Utils.getWifiPlugin(getContext().getApplicationContext());
    }

    static String convertToQuotedString(String s)
    {
        return (new StringBuilder()).append("\"").append(s).append("\"").toString();
    }

    private static PskType getPskType(ScanResult scanresult)
    {
        boolean flag = scanresult.capabilities.contains("WPA-PSK");
        boolean flag1 = scanresult.capabilities.contains("WPA2-PSK");
        if (flag1 && flag)
            return PskType.WPA_WPA2;
        if (flag1)
            return PskType.WPA2;
        if (flag)
        {
            return PskType.WPA;
        } else
        {
            Xlog.d("Settings.AccessPoint", (new StringBuilder()).append("Received abnormal flag string: ").append(scanresult.capabilities).toString());
            return PskType.UNKNOWN;
        }
    }

    static int getSecurity(ScanResult scanresult)
    {
        if (scanresult.capabilities.contains("WAPI-PSK"))
            return 6;
        if (scanresult.capabilities.contains("WAPI-CERT"))
            return 7;
        if (scanresult.capabilities.contains("WEP"))
            return 1;
        if (scanresult.capabilities.contains("PSK"))
            return 2;
        return !scanresult.capabilities.contains("EAP") ? 0 : 5;
    }

    static int getSecurity(WifiConfiguration wificonfiguration)
    {
label0:
        {
            int i = 1;
            if (wificonfiguration.allowedKeyManagement.get(i))
            {
                i = 2;
            } else
            {
                if (wificonfiguration.allowedKeyManagement.get(2) || wificonfiguration.allowedKeyManagement.get(3))
                    break label0;
                if (wificonfiguration.allowedKeyManagement.get(5))
                    return 6;
                if (wificonfiguration.allowedKeyManagement.get(6))
                    return 7;
                if ((wificonfiguration.wepTxKeyIndex < 0 || wificonfiguration.wepTxKeyIndex >= wificonfiguration.wepKeys.length || wificonfiguration.wepKeys[wificonfiguration.wepTxKeyIndex] == null) && wificonfiguration.wepKeys[0] == null)
                    return 0;
            }
            return i;
        }
        return 5;
    }

    public static boolean isWFATestSupported()
    {
        if (sWFATestFlag == null)
        {
            sWFATestFlag = SystemProperties.get("persist.radio.wifi.wpa2wpaalone", "");
            Xlog.d("Settings.AccessPoint", (new StringBuilder()).append("isWFATestSupported(), sWFATestFlag=").append(sWFATestFlag).toString());
        }
        return "true".equals(sWFATestFlag);
    }

    private void loadConfig(WifiConfiguration wificonfiguration)
    {
        String s;
        if (wificonfiguration.SSID == null)
            s = "";
        else
            s = removeDoubleQuotes(wificonfiguration.SSID);
        ssid = s;
        bssid = wificonfiguration.BSSID;
        security = getSecurity(wificonfiguration);
        networkId = wificonfiguration.networkId;
        mRssi = 0x7fffffff;
        mConfig = wificonfiguration;
    }

    private void loadResult(ScanResult scanresult)
    {
        ssid = scanresult.SSID;
        bssid = scanresult.BSSID;
        security = getSecurity(scanresult);
        boolean flag;
        if (security != 5 && scanresult.capabilities.contains("WPS"))
            flag = true;
        else
            flag = false;
        wpsAvailable = flag;
        if (security == 2)
            pskType = getPskType(scanresult);
        networkId = -1;
        mRssi = scanresult.level;
        mScanResult = scanresult;
    }

    private void refresh()
    {
        setTitle(ssid);
        Context context = getContext();
        if (mState != null)
        {
            setSummary(Summary.get(context, mState));
            return;
        }
        if (mRssi == 0x7fffffff)
        {
            setSummary(context.getString(0x7f0b0478));
            return;
        }
        if (mConfig != null && mConfig.status == 1)
        {
            switch (mConfig.disableReason)
            {
            case 1: // '\001'
            case 2: // '\002'
                setSummary(context.getString(0x7f0b0476));
                return;

            case 3: // '\003'
                setSummary(context.getString(0x7f0b0477));
                return;

            case 0: // '\0'
                setSummary(context.getString(0x7f0b0475));
                return;
            }
            return;
        }
        StringBuilder stringbuilder = new StringBuilder();
        if (mConfig != null)
            stringbuilder.append(context.getString(0x7f0b0474));
        if (security != 0)
        {
            String s;
            if (stringbuilder.length() == 0)
                s = context.getString(0x7f0b047b);
            else
                s = context.getString(0x7f0b047c);
            Object aobj[] = new Object[1];
            aobj[0] = getSecurityString(true);
            stringbuilder.append(String.format(s, aobj));
        }
        if (mConfig == null && wpsAvailable)
            if (stringbuilder.length() == 0)
                stringbuilder.append(context.getString(0x7f0b0479));
            else
                stringbuilder.append(context.getString(0x7f0b047a));
        setSummary(stringbuilder.toString());
    }

    static String removeDoubleQuotes(String s)
    {
        int i = s.length();
        if (i > 1 && s.charAt(0) == '"' && s.charAt(i - 1) == '"')
            s = s.substring(1, i - 1);
        return s;
    }

    public static void resetWFAFlag()
    {
        sWFATestFlag = null;
    }

    public int compareTo(Preference preference)
    {
        int i;
        if (!(preference instanceof AccessPoint))
        {
            i = 1;
        } else
        {
            AccessPoint accesspoint = (AccessPoint)preference;
            if (mInfo != null && accesspoint.mInfo == null)
                return -1;
            if (mInfo == null && accesspoint.mInfo != null)
                return 1;
            i = sExt.getApOrder(ssid, security, accesspoint.ssid, accesspoint.security);
            if (i == 0)
            {
                if (mRssi != 0x7fffffff && accesspoint.mRssi == 0x7fffffff)
                    return -1;
                if (mRssi == 0x7fffffff && accesspoint.mRssi != 0x7fffffff)
                    return 1;
                if (networkId != -1 && accesspoint.networkId == -1)
                    return -1;
                if (networkId == -1 && accesspoint.networkId != -1)
                    return 1;
                int j = WifiManager.compareSignalLevel(accesspoint.mRssi, mRssi);
                if (j != 0)
                    return j;
                int k = accesspoint.security - security;
                if (k != 0)
                    return k;
                else
                    return ssid.compareToIgnoreCase(accesspoint.ssid);
            }
        }
        return i;
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    public boolean equals(Object obj)
    {
        return (obj instanceof AccessPoint) && compareTo((AccessPoint)obj) == 0;
    }

    protected void generateOpenNetworkConfig()
    {
        if (security != 0)
            throw new IllegalStateException();
        if (mConfig != null)
        {
            return;
        } else
        {
            mConfig = new WifiConfiguration();
            mConfig.SSID = convertToQuotedString(ssid);
            mConfig.BSSID = bssid;
            mConfig.allowedKeyManagement.set(0);
            return;
        }
    }

    WifiConfiguration getConfig()
    {
        return mConfig;
    }

    WifiInfo getInfo()
    {
        return mInfo;
    }

    int getLevel()
    {
        if (mRssi == 0x7fffffff)
            return -1;
        else
            return WifiManager.calculateSignalLevel(mRssi, 4);
    }

    public String getSecurityString(boolean flag)
    {
        Context context = getContext();
        switch (security)
        {
        case 7: // '\007'
            return context.getString(0x7f0b0127);

        case 6: // '\006'
            return context.getString(0x7f0b0126);

        case 1: // '\001'
            if (flag)
                return context.getString(0x7f0b047d);
            else
                return context.getString(0x7f0b0484);

        case 2: // '\002'
            static class _cls1
            {

                static final int $SwitchMap$com$android$settings$wifi$AccessPoint$PskType[];

                static 
                {
                    $SwitchMap$com$android$settings$wifi$AccessPoint$PskType = new int[PskType.values().length];
                    try
                    {
                        $SwitchMap$com$android$settings$wifi$AccessPoint$PskType[PskType.WPA.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$settings$wifi$AccessPoint$PskType[PskType.WPA2.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$settings$wifi$AccessPoint$PskType[PskType.WPA_WPA2.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$android$settings$wifi$AccessPoint$PskType[PskType.UNKNOWN.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3)
                    {
                        return;
                    }
                }
            }

            switch (_cls1..SwitchMap.com.android.settings.wifi.AccessPoint.PskType[pskType.ordinal()])
            {
            case 3: // '\003'
                if (flag)
                    return context.getString(0x7f0b0480);
                else
                    return context.getString(0x7f0b0487);

            case 2: // '\002'
                if (flag)
                    return context.getString(0x7f0b047f);
                else
                    return context.getString(0x7f0b0486);

            case 1: // '\001'
                if (flag)
                    return context.getString(0x7f0b047e);
                else
                    return context.getString(0x7f0b0485);
            }
            if (flag)
                return context.getString(0x7f0b0481);
            else
                return context.getString(0x7f0b0488);

        case 5: // '\005'
            if (flag)
                return context.getString(0x7f0b0482);
            else
                return context.getString(0x7f0b0489);
        }
        if (flag)
            return "";
        else
            return context.getString(0x7f0b0483);
    }

    android.net.NetworkInfo.DetailedState getState()
    {
        return mState;
    }

    public int hashCode()
    {
        WifiInfo wifiinfo = mInfo;
        int i = 0;
        if (wifiinfo != null)
            i = 0 + 13 * mInfo.hashCode();
        return i + 19 * mRssi + 23 * networkId + 29 * ssid.hashCode();
    }

    public boolean isOpenApWPSSupported()
    {
        boolean flag = wpsAvailable;
        boolean flag1 = false;
        if (flag)
            flag1 = "true".equals(SystemProperties.get("mediatek.wlan.openap.wps", "false"));
        return flag1;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        ImageView imageview = (ImageView)view.findViewById(0x7f080130);
        if (mRssi == 0x7fffffff)
        {
            imageview.setImageDrawable(null);
            return;
        }
        imageview.setImageLevel(getLevel());
        imageview.setImageResource(0x7f0200d8);
        int ai[];
        if (security != 0)
            ai = STATE_SECURED;
        else
            ai = STATE_NONE;
        imageview.setImageState(ai, true);
    }

    public void saveWifiState(Bundle bundle)
    {
        bundle.putParcelable("key_config", mConfig);
        bundle.putParcelable("key_scanresult", mScanResult);
        bundle.putParcelable("key_wifiinfo", mInfo);
        if (mState != null)
            bundle.putString("key_detailedstate", mState.toString());
    }

    void update(WifiInfo wifiinfo, android.net.NetworkInfo.DetailedState detailedstate)
    {
        boolean flag;
        if (wifiinfo != null && networkId != -1 && networkId == wifiinfo.getNetworkId())
        {
            if (mInfo == null)
                flag = true;
            else
                flag = false;
            mRssi = wifiinfo.getRssi();
            mInfo = wifiinfo;
            mState = detailedstate;
            refresh();
        } else
        {
            WifiInfo wifiinfo1 = mInfo;
            flag = false;
            if (wifiinfo1 != null)
            {
                flag = true;
                mInfo = null;
                mState = null;
                refresh();
            }
        }
        if (flag)
            notifyHierarchyChanged();
    }

    boolean update(ScanResult scanresult)
    {
        if (ssid.equals(scanresult.SSID) && security == getSecurity(scanresult))
        {
            if (WifiManager.compareSignalLevel(scanresult.level, mRssi) > 0)
            {
                int i = getLevel();
                mRssi = scanresult.level;
                if (getLevel() != i)
                    notifyChanged();
            }
            if (security == 2)
                pskType = getPskType(scanresult);
            refresh();
            return true;
        } else
        {
            return false;
        }
    }

}
