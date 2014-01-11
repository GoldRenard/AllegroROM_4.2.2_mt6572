// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.content.Context;
import android.net.wifi.*;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.Preference;
import android.view.View;
import android.widget.ImageView;
import com.mediatek.oobe.ext.IWifiExt;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.xlog.Xlog;
import java.util.BitSet;

// Referenced classes of package com.mediatek.oobe.basic.wifi:
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
            return (PskType)Enum.valueOf(com/mediatek/oobe/basic/wifi/AccessPoint$PskType, s);
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
    static final String TAG = "OOBE.AccessPoint";
    static IWifiExt sExt = null;
    private static String sWFATestFlag = null;
    String mBssid;
    private WifiConfiguration mConfig;
    private WifiInfo mInfo;
    int mNetworkId;
    PskType mPskType;
    private int mRssi;
    ScanResult mScanResult;
    int mSecurity;
    String mSsid;
    private android.net.NetworkInfo.DetailedState mState;
    boolean mWpsAvailable;

    AccessPoint(Context context, ScanResult scanresult)
    {
        super(context);
        mWpsAvailable = false;
        mPskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f030013);
        loadResult(scanresult);
        refresh();
        if (sExt == null)
            sExt = Utils.getWifiPlugin(getContext());
    }

    AccessPoint(Context context, WifiConfiguration wificonfiguration)
    {
        super(context);
        mWpsAvailable = false;
        mPskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f030013);
        loadConfig(wificonfiguration);
        refresh();
        if (sExt == null)
            sExt = Utils.getWifiPlugin(getContext());
    }

    AccessPoint(Context context, Bundle bundle)
    {
        super(context);
        mWpsAvailable = false;
        mPskType = PskType.UNKNOWN;
        setWidgetLayoutResource(0x7f030013);
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
            sExt = Utils.getWifiPlugin(getContext());
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
            Xlog.w("OOBE.AccessPoint", (new StringBuilder()).append("Received abnormal flag string: ").append(scanresult.capabilities).toString());
            return PskType.UNKNOWN;
        }
    }

    private static int getSecurity(ScanResult scanresult)
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
            Xlog.d("OOBE.AccessPoint", (new StringBuilder()).append("isWFATestSupported(), sWFATestFlag=").append(sWFATestFlag).toString());
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
        mSsid = s;
        mBssid = wificonfiguration.BSSID;
        mSecurity = getSecurity(wificonfiguration);
        mNetworkId = wificonfiguration.networkId;
        mRssi = 0x7fffffff;
        mConfig = wificonfiguration;
    }

    private void loadResult(ScanResult scanresult)
    {
        mSsid = scanresult.SSID;
        mBssid = scanresult.BSSID;
        mSecurity = getSecurity(scanresult);
        boolean flag;
        if (mSecurity != 5 && scanresult.capabilities.contains("WPS"))
            flag = true;
        else
            flag = false;
        mWpsAvailable = flag;
        if (mSecurity == 2)
            mPskType = getPskType(scanresult);
        mNetworkId = -1;
        mRssi = scanresult.level;
        mScanResult = scanresult;
    }

    private void refresh()
    {
        setTitle(mSsid);
        Context context = getContext();
        if (mState != null)
        {
            setSummary(Summary.get(context, mState));
            return;
        }
        if (mRssi == 0x7fffffff)
        {
            setSummary(context.getString(0x7f0900c5));
            return;
        }
        if (mConfig != null && mConfig.status == 1)
        {
            switch (mConfig.disableReason)
            {
            case 1: // '\001'
            case 2: // '\002'
                setSummary(context.getString(0x7f0900c3));
                return;

            case 3: // '\003'
                setSummary(context.getString(0x7f0900c4));
                return;

            case 0: // '\0'
                setSummary(context.getString(0x7f0900c2));
                return;
            }
            return;
        }
        StringBuilder stringbuilder = new StringBuilder();
        if (mConfig != null)
            stringbuilder.append(context.getString(0x7f0900c1));
        if (mSecurity != 0)
        {
            String s;
            if (stringbuilder.length() == 0)
                s = context.getString(0x7f0900e6);
            else
                s = context.getString(0x7f0900e7);
            Object aobj[] = new Object[1];
            aobj[0] = getSecurityString(true);
            stringbuilder.append(String.format(s, aobj));
        }
        if (mConfig == null && mWpsAvailable)
            if (stringbuilder.length() == 0)
                stringbuilder.append(context.getString(0x7f0900e4));
            else
                stringbuilder.append(context.getString(0x7f0900e5));
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
        AccessPoint accesspoint;
label0:
        {
            byte byte0 = -1;
            if (!(preference instanceof AccessPoint))
            {
                byte0 = 1;
            } else
            {
                accesspoint = (AccessPoint)preference;
                if (mInfo != accesspoint.mInfo)
                {
                    if (mInfo == null)
                        return 1;
                } else
                {
                    int i = sExt.getApOrder(mSsid, mSecurity, accesspoint.mSsid, accesspoint.mSecurity);
                    if (i != 0)
                        return i;
                    if ((mRssi ^ accesspoint.mRssi) < 0)
                    {
                        if (mRssi == 0x7fffffff)
                            return 1;
                    } else
                    {
                        if ((mNetworkId ^ accesspoint.mNetworkId) >= 0)
                            break label0;
                        if (mNetworkId == byte0)
                            return 1;
                    }
                }
            }
            return byte0;
        }
        int j = WifiManager.compareSignalLevel(accesspoint.mRssi, mRssi);
        if (j != 0)
            return j;
        else
            return mSsid.compareToIgnoreCase(accesspoint.mSsid);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    protected void generateOpenNetworkConfig()
    {
        if (mSecurity != 0)
            throw new IllegalStateException();
        if (mConfig != null)
        {
            return;
        } else
        {
            mConfig = new WifiConfiguration();
            mConfig.SSID = convertToQuotedString(mSsid);
            mConfig.BSSID = mBssid;
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
        switch (mSecurity)
        {
        case 7: // '\007'
            return context.getString(0x7f09011b);

        case 6: // '\006'
            return context.getString(0x7f09011a);

        case 1: // '\001'
            if (flag)
                return context.getString(0x7f0900e8);
            else
                return context.getString(0x7f0900ef);

        case 2: // '\002'
            static class _cls1
            {

                static final int $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType[];

                static 
                {
                    $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType = new int[PskType.values().length];
                    try
                    {
                        $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType[PskType.WPA.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType[PskType.WPA2.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType[PskType.WPA_WPA2.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType[PskType.UNKNOWN.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3)
                    {
                        return;
                    }
                }
            }

            switch (_cls1..SwitchMap.com.mediatek.oobe.basic.wifi.AccessPoint.PskType[mPskType.ordinal()])
            {
            case 3: // '\003'
                if (flag)
                    return context.getString(0x7f0900eb);
                else
                    return context.getString(0x7f0900f2);

            case 2: // '\002'
                if (flag)
                    return context.getString(0x7f0900ea);
                else
                    return context.getString(0x7f0900f1);

            case 1: // '\001'
                if (flag)
                    return context.getString(0x7f0900e9);
                else
                    return context.getString(0x7f0900f0);
            }
            if (flag)
                return context.getString(0x7f0900ec);
            else
                return context.getString(0x7f0900f3);

        case 5: // '\005'
            if (flag)
                return context.getString(0x7f0900ed);
            else
                return context.getString(0x7f0900f4);
        }
        if (flag)
            return "";
        else
            return context.getString(0x7f0900ee);
    }

    android.net.NetworkInfo.DetailedState getState()
    {
        return mState;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        ImageView imageview = (ImageView)view.findViewById(0x7f0b002f);
        if (mRssi == 0x7fffffff)
        {
            imageview.setImageDrawable(null);
            return;
        }
        imageview.setImageLevel(getLevel());
        imageview.setImageResource(0x7f020039);
        int ai[];
        if (mSecurity != 0)
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
        if (wifiinfo != null && mNetworkId != -1 && mNetworkId == wifiinfo.getNetworkId())
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
        if (mSsid.equals(scanresult.SSID) && mSecurity == getSecurity(scanresult))
        {
            if (WifiManager.compareSignalLevel(scanresult.level, mRssi) > 0)
            {
                int i = getLevel();
                mRssi = scanresult.level;
                if (getLevel() != i)
                    notifyChanged();
            }
            if (mSecurity == 2)
                mPskType = getPskType(scanresult);
            refresh();
            return true;
        } else
        {
            return false;
        }
    }

}
