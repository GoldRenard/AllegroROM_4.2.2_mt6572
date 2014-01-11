// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.*;
import android.telephony.*;
import android.util.Slog;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.internal.app.IBatteryStats;
import com.android.internal.util.AsyncChannel;
import com.android.server.am.BatteryStatsService;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.systemui.ext.*;
import com.mediatek.xlog.Xlog;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            TelephonyIcons, AccessibilityContentDescriptions, WifiIcons, WimaxIcons

public class NetworkController extends BroadcastReceiver
{
    public static interface SignalCluster
    {

        public abstract void setIsAirplaneMode(boolean flag, int i);

        public abstract void setMobileDataIndicators(boolean flag, IconIdWrapper iconidwrapper, IconIdWrapper iconidwrapper1, int i, String s, String s1);

        public abstract void setRoamingFlagandResource(boolean flag, int i);

        public abstract void setShowSimIndicator(boolean flag, int i);

        public abstract void setWifiIndicators(boolean flag, int i, int j, String s);
    }

    class WifiHandler extends Handler
    {

        final NetworkController this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                if (message.arg1 != mWifiActivity)
                {
                    mWifiActivity = message.arg1;
                    refreshViews();
                    return;
                }
                // fall through

            default:
                return;

            case 69632: 
                break;
            }
            if (message.arg1 == 0)
            {
                mWifiChannel.sendMessage(Message.obtain(this, 0x11001));
                return;
            } else
            {
                Slog.e("StatusBar.NetworkController", "Failed to connect to wifi");
                return;
            }
        }

        WifiHandler()
        {
            this$0 = NetworkController.this;
            super();
        }
    }


    static final boolean CHATTY = false;
    static final boolean DEBUG = false;
    private static final int INET_CONDITION_THRESHOLD = 50;
    static final String TAG = "StatusBar.NetworkController";
    int mAirplaneIconId;
    private boolean mAirplaneMode;
    boolean mAlwaysShowCdmaRssi;
    IBatteryStats mBatteryStats;
    private int mBluetoothTetherIconId;
    private boolean mBluetoothTethered;
    ArrayList mCombinedLabelViews;
    ArrayList mCombinedSignalIconViews;
    private boolean mConnected;
    private int mConnectedNetworkType;
    private String mConnectedNetworkTypeName;
    String mContentDescriptionCombinedSignal;
    String mContentDescriptionDataType;
    String mContentDescriptionPhoneSignal;
    String mContentDescriptionWifi;
    String mContentDescriptionWimax;
    Context mContext;
    boolean mDataActive;
    int mDataActivity;
    boolean mDataAndWifiStacked;
    boolean mDataConnected;
    int mDataDirectionIconId;
    ArrayList mDataDirectionIconViews;
    ArrayList mDataDirectionOverlayIconViews;
    int mDataIconList[];
    int mDataNetType;
    IconIdWrapper mDataSignalIconId;
    int mDataState;
    int mDataTypeIconId;
    ArrayList mDataTypeIconViews;
    ArrayList mEmergencyLabelViews;
    private boolean mHasMobileDataFeature;
    boolean mHspaDataDistinguishable;
    private int mInetCondition;
    private boolean mIsRoaming;
    private boolean mIsWimaxEnabled;
    private boolean mLastAirplaneMode;
    String mLastCombinedLabel;
    int mLastCombinedSignalIconId;
    int mLastDataDirectionIconId;
    int mLastDataDirectionOverlayIconId;
    int mLastDataTypeIconId;
    int mLastPhoneSignalIconId;
    int mLastSignalLevel;
    int mLastWifiIconId;
    int mLastWimaxIconId;
    IconIdWrapper mMobileActivityIconId;
    ArrayList mMobileLabelViews;
    String mNetworkName;
    String mNetworkNameDefault;
    String mNetworkNameSeparator;
    final TelephonyManager mPhone;
    IconIdWrapper mPhoneSignalIconId;
    ArrayList mPhoneSignalIconViews;
    int mPhoneState;
    PhoneStateListener mPhoneStateListener;
    private int mRoamIconId;
    ServiceState mServiceState;
    boolean mShowAtLeastThreeGees;
    boolean mShowPhoneRSSIForData;
    ArrayList mSignalClusters;
    SignalStrength mSignalStrength;
    private boolean mSimIndicatorFlag;
    private int mSimIndicatorResId;
    com.android.internal.telephony.IccCardConstants.State mSimState;
    int mWifiActivity;
    int mWifiActivityIconId;
    AsyncChannel mWifiChannel;
    boolean mWifiConnected;
    boolean mWifiEnabled;
    int mWifiIconId;
    ArrayList mWifiIconViews;
    ArrayList mWifiLabelViews;
    int mWifiLevel;
    final WifiManager mWifiManager;
    int mWifiRssi;
    String mWifiSsid;
    private boolean mWimaxConnected;
    private int mWimaxExtraState;
    private int mWimaxIconId;
    ArrayList mWimaxIconViews;
    private boolean mWimaxIdle;
    private int mWimaxSignal;
    private int mWimaxState;
    private boolean mWimaxSupported;

    public NetworkController(Context context)
    {
        mSimState = com.android.internal.telephony.IccCardConstants.State.READY;
        mPhoneState = 0;
        mDataNetType = 0;
        mDataState = 0;
        mDataActivity = 0;
        mDataIconList = TelephonyIcons.DATA_G[0];
        mPhoneSignalIconId = new IconIdWrapper();
        mDataSignalIconId = new IconIdWrapper();
        mMobileActivityIconId = new IconIdWrapper();
        mShowPhoneRSSIForData = false;
        mShowAtLeastThreeGees = false;
        mAlwaysShowCdmaRssi = false;
        mWifiIconId = 0;
        mWifiActivityIconId = 0;
        mWifiActivity = 0;
        mBluetoothTethered = false;
        mBluetoothTetherIconId = 0x1080564;
        mWimaxSupported = false;
        mIsWimaxEnabled = false;
        mWimaxConnected = false;
        mWimaxIdle = false;
        mWimaxIconId = 0;
        mWimaxSignal = 0;
        mWimaxState = 0;
        mWimaxExtraState = 0;
        mConnected = false;
        mConnectedNetworkType = -1;
        mInetCondition = 0;
        mAirplaneMode = false;
        mLastAirplaneMode = true;
        mPhoneSignalIconViews = new ArrayList();
        mDataDirectionIconViews = new ArrayList();
        mDataDirectionOverlayIconViews = new ArrayList();
        mWifiIconViews = new ArrayList();
        mWimaxIconViews = new ArrayList();
        mCombinedSignalIconViews = new ArrayList();
        mDataTypeIconViews = new ArrayList();
        mCombinedLabelViews = new ArrayList();
        mMobileLabelViews = new ArrayList();
        mWifiLabelViews = new ArrayList();
        mEmergencyLabelViews = new ArrayList();
        mSignalClusters = new ArrayList();
        mLastPhoneSignalIconId = -1;
        mLastDataDirectionIconId = -1;
        mLastDataDirectionOverlayIconId = -1;
        mLastWifiIconId = -1;
        mLastWimaxIconId = -1;
        mLastCombinedSignalIconId = -1;
        mLastDataTypeIconId = -1;
        mLastCombinedLabel = "";
        mDataAndWifiStacked = false;
        mPhoneStateListener = new PhoneStateListener() {

            final NetworkController this$0;

            public void onCallStateChanged(int i, String s)
            {
                if (isCdma())
                {
                    updateTelephonySignalStrength();
                    refreshViews();
                }
            }

            public void onDataActivity(int i)
            {
                mDataActivity = i;
                updateDataIcon();
                refreshViews();
            }

            public void onDataConnectionStateChanged(int i, int j)
            {
                mDataState = i;
                mDataNetType = j;
                updateDataNetType();
                updateDataIcon();
                refreshViews();
            }

            public void onServiceStateChanged(ServiceState servicestate)
            {
                mServiceState = servicestate;
                updateTelephonySignalStrength();
                updateDataNetType();
                updateDataIcon();
                refreshViews();
            }

            public void onSignalStrengthsChanged(SignalStrength signalstrength)
            {
                mSignalStrength = signalstrength;
                updateTelephonySignalStrength();
                refreshViews();
            }

            
            {
                this$0 = NetworkController.this;
                super();
            }
        }
;
        mSimIndicatorFlag = false;
        mSimIndicatorResId = 0;
        mIsRoaming = false;
        mRoamIconId = 0;
        mContext = context;
        Resources resources = context.getResources();
        mHasMobileDataFeature = ((ConnectivityManager)mContext.getSystemService("connectivity")).isNetworkSupported(0);
        mShowPhoneRSSIForData = resources.getBoolean(0x7f0a0004);
        mShowAtLeastThreeGees = resources.getBoolean(0x7f0a0005);
        mAlwaysShowCdmaRssi = resources.getBoolean(0x111003a);
        updateWifiIcons();
        updateWimaxIcons();
        mPhone = (TelephonyManager)context.getSystemService("phone");
        mPhone.listen(mPhoneStateListener, 481);
        boolean flag;
        if (mContext.getResources().getBoolean(0x7f0a0002) && PluginFactory.getStatusBarPlugin(mContext).isHspaDataDistinguishable())
            flag = true;
        else
            flag = false;
        mHspaDataDistinguishable = flag;
        mNetworkNameSeparator = mContext.getString(0x7f0b005b);
        mNetworkNameDefault = mContext.getString(0x10402e6);
        mNetworkName = mNetworkNameDefault;
        mWifiManager = (WifiManager)context.getSystemService("wifi");
        WifiHandler wifihandler = new WifiHandler();
        mWifiChannel = new AsyncChannel();
        android.os.Messenger messenger = mWifiManager.getWifiServiceMessenger();
        if (messenger != null)
            mWifiChannel.connect(mContext, wifihandler, messenger);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.net.wifi.RSSI_CHANGED");
        intentfilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        intentfilter.addAction("android.net.wifi.STATE_CHANGE");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
        intentfilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        intentfilter.addAction("android.net.conn.INET_CONDITION_ACTION");
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        mWimaxSupported = mContext.getResources().getBoolean(0x111003f);
        if (mWimaxSupported)
        {
            intentfilter.addAction("android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED");
            intentfilter.addAction("android.net.wimax.SIGNAL_LEVEL_CHANGED");
            intentfilter.addAction("android.net.fourG.NET_4G_STATE_CHANGED");
        }
        context.registerReceiver(this, intentfilter);
        updateAirplaneMode();
        mBatteryStats = BatteryStatsService.getService();
    }

    private String getResourceName(int i)
    {
        if (i != 0)
        {
            Resources resources = mContext.getResources();
            String s;
            try
            {
                s = resources.getResourceName(i);
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                return "(unknown)";
            }
            return s;
        } else
        {
            return "(null)";
        }
    }

    private boolean hasService()
    {
        ServiceState servicestate = mServiceState;
        boolean flag = false;
        if (servicestate != null)
        {
            int i = mServiceState.getState();
            flag = false;
            switch (i)
            {
            case 2: // '\002'
            default:
                flag = true;
                break;

            case 1: // '\001'
            case 3: // '\003'
                break;
            }
        }
        return flag;
    }

    private String huntForSsid(WifiInfo wifiinfo)
    {
        String s = wifiinfo.getSSID();
        if (s != null)
            return s;
        for (Iterator iterator = mWifiManager.getConfiguredNetworks().iterator(); iterator.hasNext();)
        {
            WifiConfiguration wificonfiguration = (WifiConfiguration)iterator.next();
            if (wificonfiguration.networkId == wifiinfo.getNetworkId())
                return wificonfiguration.SSID;
        }

        return null;
    }

    private boolean isCdma()
    {
        return mSignalStrength != null && !mSignalStrength.isGsm();
    }

    private void updateAirplaneMode()
    {
        boolean flag = true;
        if (android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != flag)
            flag = false;
        mAirplaneMode = flag;
    }

    private void updateConnectivity(Intent intent)
    {
        int i = 1;
        NetworkInfo networkinfo = ((ConnectivityManager)mContext.getSystemService("connectivity")).getActiveNetworkInfo();
        boolean flag;
        if (networkinfo != null && networkinfo.isConnected())
            flag = i;
        else
            flag = false;
        mConnected = flag;
        if (mConnected)
        {
            mConnectedNetworkType = networkinfo.getType();
            mConnectedNetworkTypeName = networkinfo.getTypeName();
        } else
        {
            mConnectedNetworkType = -1;
            mConnectedNetworkTypeName = null;
        }
        int j = intent.getIntExtra("inetCondition", 0);
        Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("updateConnectivity: connectionStatus=").append(j).toString());
        if (j <= 50)
            i = 0;
        mInetCondition = i;
        if (networkinfo != null && networkinfo.getType() == 7)
            mBluetoothTethered = networkinfo.isConnected();
        else
            mBluetoothTethered = false;
        updateDataNetType();
        updateWimaxIcons();
        updateDataIcon();
        updateTelephonySignalStrength();
        updateWifiIcons();
    }

    private final void updateDataIcon()
    {
        boolean flag = true;
        if (isCdma()) goto _L2; else goto _L1
_L1:
        if (mSimState != com.android.internal.telephony.IccCardConstants.State.READY && mSimState != com.android.internal.telephony.IccCardConstants.State.UNKNOWN) goto _L4; else goto _L3
_L3:
        if (!hasService() || mDataState != 2) goto _L6; else goto _L5
_L5:
        mDataActivity;
        JVM INSTR tableswitch 1 3: default 76
    //                   1 162
    //                   2 172
    //                   3 182;
           goto _L7 _L8 _L9 _L10
_L7:
        int i = mDataIconList[0];
_L15:
        mDataDirectionIconId = i;
_L11:
        long l;
        Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("updateDataIcon, iconId=").append(i).append(", visible=").append(flag).toString());
        l = Binder.clearCallingIdentity();
        mBatteryStats.notePhoneDataConnectionState(mPhone.getNetworkType(), flag);
        Binder.restoreCallingIdentity(l);
_L12:
        mDataDirectionIconId = i;
        mDataConnected = flag;
        return;
_L8:
        i = mDataIconList[0];
        continue; /* Loop/switch isn't completed */
_L9:
        i = mDataIconList[0];
        continue; /* Loop/switch isn't completed */
_L10:
        i = mDataIconList[0];
        continue; /* Loop/switch isn't completed */
_L6:
        if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn() && hasService())
        {
            i = mDataIconList[0];
            Slog.d("StatusBar.NetworkController", "updateDataIcon(): for OP01 project data network type is shown even if switch off data connection.");
            flag = false;
        } else
        {
            i = 0;
            flag = false;
        }
          goto _L11
_L4:
        i = 0x7f0201fb;
        flag = false;
          goto _L11
_L2:
        if (hasService() && mDataState == 2)
        {
            switch (mDataActivity)
            {
            default:
                i = mDataIconList[0];
                break;

            case 1: // '\001'
                i = mDataIconList[0];
                break;

            case 2: // '\002'
                i = mDataIconList[0];
                break;

            case 3: // '\003'
                i = mDataIconList[0];
                break;
            }
        } else
        {
            i = 0;
            flag = false;
        }
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Binder.restoreCallingIdentity(l);
          goto _L12
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        break MISSING_BLOCK_LABEL_360;
        if (true) goto _L11; else goto _L13
_L13:
        throw exception;
        if (true) goto _L15; else goto _L14
_L14:
    }

    private final void updateDataNetType()
    {
        int i = SIMHelper.getSIMColorIdBySlot(mContext, 0);
        Slog.d("StatusBar.NetworkController", (new StringBuilder()).append("updateDataNetType simColor = ").append(i).toString());
        if (i >= 0 && i <= 4)
        {
            if (isCdma())
            {
                if (isCdmaEri())
                {
                    mRoamIconId = TelephonyIcons.ROAMING[i];
                    mIsRoaming = true;
                }
            } else
            if (mPhone.isNetworkRoaming())
            {
                mRoamIconId = TelephonyIcons.ROAMING[i];
                mIsRoaming = true;
            } else
            {
                mRoamIconId = 0;
                mIsRoaming = false;
            }
            Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("updateDataNetType, DataNetType=").append(mDataNetType).append(" mIsRoaming = ").append(mIsRoaming).toString());
            if (mIsWimaxEnabled && mWimaxConnected)
            {
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_4G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_4G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0095);
                return;
            }
            switch (mDataNetType)
            {
            case 13: // '\r'
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_4G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_4G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0095);
                return;

            case 4: // '\004'
                if (!mShowAtLeastThreeGees)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_1X[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_1X_ROAM[i];
                    mDataTypeIconId = mDataIconList[0];
                    mContentDescriptionDataType = mContext.getString(0x7f0b0096);
                    return;
                }
                // fall through

            case 7: // '\007'
                if (!mShowAtLeastThreeGees)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_1X[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_1X_ROAM[i];
                    mDataTypeIconId = mDataIconList[0];
                    mContentDescriptionDataType = mContext.getString(0x7f0b0096);
                    return;
                }
                // fall through

            case 5: // '\005'
            case 6: // '\006'
            case 12: // '\f'
            case 14: // '\016'
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_3G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_3G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0093);
                return;

            case 15: // '\017'
                if (mHspaDataDistinguishable)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_H_PLUS[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_H_PLUS_ROAM[i];
                    mDataTypeIconId = mDataIconList[0];
                    mContentDescriptionDataType = mContext.getString(0x7f0b0094);
                    return;
                }
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_3G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_3G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0093);
                return;

            case 8: // '\b'
            case 9: // '\t'
            case 10: // '\n'
                if (mHspaDataDistinguishable)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_H[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_H_ROAM[i];
                    mDataTypeIconId = mDataIconList[0];
                    mContentDescriptionDataType = mContext.getString(0x7f0b0094);
                    return;
                }
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_3G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_3G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0093);
                return;

            case 0: // '\0'
                if (!mShowAtLeastThreeGees)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_G[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_G_ROAM[i];
                    mDataTypeIconId = 0;
                    mContentDescriptionDataType = mContext.getString(0x7f0b0092);
                    return;
                }
                // fall through

            case 2: // '\002'
                if (!mShowAtLeastThreeGees)
                {
                    if (!mIsRoaming)
                        mDataIconList = TelephonyIcons.DATA_E[i];
                    else
                        mDataIconList = TelephonyIcons.DATA_E_ROAM[i];
                    mDataTypeIconId = mDataIconList[0];
                    mContentDescriptionDataType = mContext.getString(0x7f0b0097);
                    return;
                }
                // fall through

            case 3: // '\003'
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_3G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_3G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0093);
                return;
            }
            if (!mShowAtLeastThreeGees)
            {
                if (!mIsRoaming)
                    mDataIconList = TelephonyIcons.DATA_G[i];
                else
                    mDataIconList = TelephonyIcons.DATA_G_ROAM[i];
                mDataTypeIconId = mDataIconList[0];
                mContentDescriptionDataType = mContext.getString(0x7f0b0092);
                return;
            }
            if (!mIsRoaming)
                mDataIconList = TelephonyIcons.DATA_3G[i];
            else
                mDataIconList = TelephonyIcons.DATA_3G_ROAM[i];
            mDataTypeIconId = mDataIconList[0];
            mContentDescriptionDataType = mContext.getString(0x7f0b0093);
            return;
        } else
        {
            return;
        }
    }

    private final void updateSimState(Intent intent)
    {
        String s = intent.getStringExtra("ss");
        if ("ABSENT".equals(s))
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.ABSENT;
            return;
        }
        if ("READY".equals(s))
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.READY;
            return;
        }
        if ("LOCKED".equals(s))
        {
            String s1 = intent.getStringExtra("reason");
            if ("PIN".equals(s1))
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
                return;
            }
            if ("PUK".equals(s1))
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
                return;
            } else
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                return;
            }
        } else
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            return;
        }
    }

    private final void updateTelephonySignalStrength()
    {
        if (!hasService())
        {
            mPhoneSignalIconId.setResources(null);
            mPhoneSignalIconId.setIconId(0x7f020217);
            mDataSignalIconId.setResources(null);
            mDataSignalIconId.setIconId(0x7f020217);
        } else
        {
            if (mSignalStrength == null)
            {
                mPhoneSignalIconId.setResources(null);
                mPhoneSignalIconId.setIconId(0x7f020217);
                mDataSignalIconId.setResources(null);
                mDataSignalIconId.setIconId(0x7f020217);
                mContentDescriptionPhoneSignal = mContext.getString(AccessibilityContentDescriptions.PHONE_SIGNAL_STRENGTH[0]);
                return;
            }
            int i;
            if (isCdma() && mAlwaysShowCdmaRssi)
            {
                i = mSignalStrength.getCdmaLevel();
                mLastSignalLevel = i;
            } else
            {
                i = mSignalStrength.getLevel();
                mLastSignalLevel = i;
            }
            int j = SIMHelper.getSIMColorIdBySlot(mContext, 0);
            Slog.d("StatusBar.NetworkController", (new StringBuilder()).append("athens iconLevel=").append(i).append(" mInetCondition= ").append(mInetCondition).append(" simColor = ").append(j).toString());
            if (j >= 0 && j <= 3)
            {
                if (isCdma())
                {
                    int ai2[];
                    if (isCdmaEri())
                        ai2 = TelephonyIcons.TELEPHONY_SIGNAL_STRENGTH_ROAMING[j];
                    else
                        ai2 = TelephonyIcons.TELEPHONY_SIGNAL_STRENGTH[j];
                    mPhoneSignalIconId.setResources(null);
                    if (i < 5)
                        mPhoneSignalIconId.setIconId(ai2[i]);
                } else
                if (mPhone.isNetworkRoaming())
                {
                    int i1 = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthIcon(true, j, i, false);
                    if (i1 != -1)
                    {
                        mPhoneSignalIconId.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                        mPhoneSignalIconId.setIconId(i1);
                    } else
                    {
                        int ai1[] = TelephonyIcons.TELEPHONY_SIGNAL_STRENGTH_ROAMING[j];
                        mPhoneSignalIconId.setResources(null);
                        if (i < 5)
                            mPhoneSignalIconId.setIconId(ai1[i]);
                    }
                } else
                {
                    int k = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthIcon(false, j, i, false);
                    if (k != -1)
                    {
                        mPhoneSignalIconId.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                        mPhoneSignalIconId.setIconId(k);
                    } else
                    {
                        int ai[] = TelephonyIcons.TELEPHONY_SIGNAL_STRENGTH[j];
                        mPhoneSignalIconId.setResources(null);
                        if (i < 5)
                            mPhoneSignalIconId.setIconId(ai[i]);
                    }
                }
                String s = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthDescription(i);
                if (s != null)
                    mContentDescriptionPhoneSignal = s;
                else
                if (i < 5)
                    mContentDescriptionPhoneSignal = mContext.getString(AccessibilityContentDescriptions.PHONE_SIGNAL_STRENGTH[i]);
                int l = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthIcon(false, j, i, false);
                if (l != -1)
                {
                    mDataSignalIconId.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                    mDataSignalIconId.setIconId(l);
                    return;
                }
                mDataSignalIconId.setResources(null);
                if (i < 5)
                {
                    mDataSignalIconId.setIconId(TelephonyIcons.DATA_SIGNAL_STRENGTH[j][i]);
                    return;
                }
            }
        }
    }

    private void updateWifiIcons()
    {
        if (mWifiConnected)
        {
            mWifiIconId = WifiIcons.WIFI_SIGNAL_STRENGTH[mInetCondition][mWifiLevel];
            mContentDescriptionWifi = mContext.getString(AccessibilityContentDescriptions.WIFI_CONNECTION_STRENGTH[mWifiLevel]);
            return;
        }
        if (mDataAndWifiStacked)
        {
            mWifiIconId = 0;
        } else
        {
            boolean flag = mWifiEnabled;
            int i = 0;
            if (flag)
                i = WifiIcons.WIFI_SIGNAL_STRENGTH[0][0];
            mWifiIconId = i;
        }
        mContentDescriptionWifi = mContext.getString(0x7f0b0088);
    }

    private void updateWifiState(Intent intent)
    {
        boolean flag = true;
        String s = intent.getAction();
        if (s.equals("android.net.wifi.WIFI_STATE_CHANGED"))
        {
            if (intent.getIntExtra("wifi_state", 4) != 3)
                flag = false;
            mWifiEnabled = flag;
        } else
        if (s.equals("android.net.wifi.STATE_CHANGE"))
        {
            NetworkInfo networkinfo = (NetworkInfo)intent.getParcelableExtra("networkInfo");
            boolean flag1 = mWifiConnected;
            if (networkinfo == null || !networkinfo.isConnected())
                flag = false;
            mWifiConnected = flag;
            if (mWifiConnected && !flag1)
            {
                WifiInfo wifiinfo1 = (WifiInfo)intent.getParcelableExtra("wifiInfo");
                if (wifiinfo1 == null)
                    wifiinfo1 = mWifiManager.getConnectionInfo();
                if (wifiinfo1 != null)
                    mWifiSsid = huntForSsid(wifiinfo1);
                else
                    mWifiSsid = null;
            } else
            if (!mWifiConnected)
                mWifiSsid = null;
            if (mWifiConnected)
            {
                WifiInfo wifiinfo = ((WifiManager)mContext.getSystemService("wifi")).getConnectionInfo();
                if (wifiinfo != null)
                {
                    int i = wifiinfo.getRssi();
                    int j = WifiManager.calculateSignalLevel(i, WifiIcons.WIFI_LEVEL_COUNT);
                    Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("updateWifiState: mWifiLevel = ").append(mWifiLevel).append("  newRssi=").append(i).append(" newSignalLevel = ").append(j).toString());
                    if (j != mWifiLevel)
                        mWifiLevel = j;
                }
            }
        } else
        if (s.equals("android.net.wifi.RSSI_CHANGED"))
        {
            mWifiRssi = intent.getIntExtra("newRssi", -200);
            mWifiLevel = WifiManager.calculateSignalLevel(mWifiRssi, WifiIcons.WIFI_LEVEL_COUNT);
        }
        updateWifiIcons();
    }

    private void updateWimaxIcons()
    {
        if (mIsWimaxEnabled)
        {
            if (mWimaxConnected)
            {
                if (mWimaxIdle)
                    mWimaxIconId = WimaxIcons.WIMAX_IDLE;
                else
                    mWimaxIconId = WimaxIcons.WIMAX_SIGNAL_STRENGTH[mInetCondition][mWimaxSignal];
                mContentDescriptionWimax = mContext.getString(AccessibilityContentDescriptions.WIMAX_CONNECTION_STRENGTH[mWimaxSignal]);
                return;
            } else
            {
                mWimaxIconId = WimaxIcons.WIMAX_DISCONNECTED;
                mContentDescriptionWimax = mContext.getString(0x7f0b008d);
                return;
            }
        } else
        {
            mWimaxIconId = 0;
            return;
        }
    }

    private final void updateWimaxState(Intent intent)
    {
        boolean flag = true;
        String s = intent.getAction();
        boolean _tmp = mWimaxConnected;
        if (s.equals("android.net.fourG.NET_4G_STATE_CHANGED"))
        {
            if (intent.getIntExtra("4g_state", 4) != 3)
                flag = false;
            mIsWimaxEnabled = flag;
        } else
        if (s.equals("android.net.wimax.SIGNAL_LEVEL_CHANGED"))
            mWimaxSignal = intent.getIntExtra("newSignalLevel", 0);
        else
        if (s.equals("android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"))
        {
            mWimaxState = intent.getIntExtra("WimaxState", 4);
            mWimaxExtraState = intent.getIntExtra("WimaxStateDetail", 4);
            boolean flag1;
            if (mWimaxState == 7)
                flag1 = flag;
            else
                flag1 = false;
            mWimaxConnected = flag1;
            if (mWimaxExtraState != 6)
                flag = false;
            mWimaxIdle = flag;
        }
        updateDataNetType();
        updateWimaxIcons();
    }

    public void addCombinedLabelView(TextView textview)
    {
        mCombinedLabelViews.add(textview);
    }

    public void addCombinedSignalIconView(ImageView imageview)
    {
        mCombinedSignalIconViews.add(imageview);
    }

    public void addDataDirectionIconView(ImageView imageview)
    {
        mDataDirectionIconViews.add(imageview);
    }

    public void addDataDirectionOverlayIconView(ImageView imageview)
    {
        mDataDirectionOverlayIconViews.add(imageview);
    }

    public void addDataTypeIconView(ImageView imageview)
    {
        mDataTypeIconViews.add(imageview);
    }

    public void addEmergencyLabelView(TextView textview)
    {
        mEmergencyLabelViews.add(textview);
    }

    public void addMobileLabelView(TextView textview)
    {
        mMobileLabelViews.add(textview);
    }

    public void addPhoneSignalIconView(ImageView imageview)
    {
        mPhoneSignalIconViews.add(imageview);
    }

    public void addSignalCluster(SignalCluster signalcluster)
    {
        mSignalClusters.add(signalcluster);
        refreshSignalCluster(signalcluster);
    }

    public void addWifiIconView(ImageView imageview)
    {
        mWifiIconViews.add(imageview);
    }

    public void addWifiLabelView(TextView textview)
    {
        mWifiLabelViews.add(textview);
    }

    public void addWimaxIconView(ImageView imageview)
    {
        mWimaxIconViews.add(imageview);
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.println("NetworkController state:");
        Object aobj[] = new Object[3];
        String s;
        if (mConnected)
            s = "CONNECTED";
        else
            s = "DISCONNECTED";
        aobj[0] = s;
        aobj[1] = Integer.valueOf(mConnectedNetworkType);
        aobj[2] = mConnectedNetworkTypeName;
        printwriter.println(String.format("  %s network type %d (%s)", aobj));
        printwriter.println("  - telephony ------");
        printwriter.print("  hasService()=");
        printwriter.println(hasService());
        printwriter.print("  mHspaDataDistinguishable=");
        printwriter.println(mHspaDataDistinguishable);
        printwriter.print("  mDataConnected=");
        printwriter.println(mDataConnected);
        printwriter.print("  mSimState=");
        printwriter.println(mSimState);
        printwriter.print("  mPhoneState=");
        printwriter.println(mPhoneState);
        printwriter.print("  mDataState=");
        printwriter.println(mDataState);
        printwriter.print("  mDataActivity=");
        printwriter.println(mDataActivity);
        printwriter.print("  mDataNetType=");
        printwriter.print(mDataNetType);
        printwriter.print("/");
        printwriter.println(TelephonyManager.getNetworkTypeName(mDataNetType));
        printwriter.print("  mServiceState=");
        printwriter.println(mServiceState);
        printwriter.print("  mSignalStrength=");
        printwriter.println(mSignalStrength);
        printwriter.print("  mLastSignalLevel=");
        printwriter.println(mLastSignalLevel);
        printwriter.print("  mNetworkName=");
        printwriter.println(mNetworkName);
        printwriter.print("  mNetworkNameDefault=");
        printwriter.println(mNetworkNameDefault);
        printwriter.print("  mNetworkNameSeparator=");
        printwriter.println(mNetworkNameSeparator.replace("\n", "\\n"));
        printwriter.print("  mPhoneSignalIconId=0x");
        printwriter.print(Integer.toHexString(mPhoneSignalIconId.getIconId()));
        printwriter.print("/");
        printwriter.println(getResourceName(mPhoneSignalIconId.getIconId()));
        printwriter.print("  mDataDirectionIconId=");
        printwriter.print(Integer.toHexString(mDataDirectionIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mDataDirectionIconId));
        printwriter.print("  mDataSignalIconId=");
        printwriter.print(Integer.toHexString(mDataSignalIconId.getIconId()));
        printwriter.print("/");
        printwriter.println(getResourceName(mDataSignalIconId.getIconId()));
        printwriter.print("  mDataTypeIconId=");
        printwriter.print(Integer.toHexString(mDataTypeIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mDataTypeIconId));
        printwriter.print("/");
        printwriter.println("  - wifi ------");
        printwriter.print("  mWifiEnabled=");
        printwriter.println(mWifiEnabled);
        printwriter.print("  mWifiConnected=");
        printwriter.println(mWifiConnected);
        printwriter.print("  mWifiRssi=");
        printwriter.println(mWifiRssi);
        printwriter.print("  mWifiLevel=");
        printwriter.println(mWifiLevel);
        printwriter.print("  mWifiSsid=");
        printwriter.println(mWifiSsid);
        Object aobj1[] = new Object[2];
        aobj1[0] = Integer.valueOf(mWifiIconId);
        aobj1[1] = getResourceName(mWifiIconId);
        printwriter.println(String.format("  mWifiIconId=0x%08x/%s", aobj1));
        printwriter.print("  mWifiActivity=");
        printwriter.println(mWifiActivity);
        if (mWimaxSupported)
        {
            printwriter.println("  - wimax ------");
            printwriter.print("  mIsWimaxEnabled=");
            printwriter.println(mIsWimaxEnabled);
            printwriter.print("  mWimaxConnected=");
            printwriter.println(mWimaxConnected);
            printwriter.print("  mWimaxIdle=");
            printwriter.println(mWimaxIdle);
            Object aobj2[] = new Object[2];
            aobj2[0] = Integer.valueOf(mWimaxIconId);
            aobj2[1] = getResourceName(mWimaxIconId);
            printwriter.println(String.format("  mWimaxIconId=0x%08x/%s", aobj2));
            Object aobj3[] = new Object[1];
            aobj3[0] = Integer.valueOf(mWimaxSignal);
            printwriter.println(String.format("  mWimaxSignal=%d", aobj3));
            Object aobj4[] = new Object[1];
            aobj4[0] = Integer.valueOf(mWimaxState);
            printwriter.println(String.format("  mWimaxState=%d", aobj4));
            Object aobj5[] = new Object[1];
            aobj5[0] = Integer.valueOf(mWimaxExtraState);
            printwriter.println(String.format("  mWimaxExtraState=%d", aobj5));
        }
        printwriter.println("  - Bluetooth ----");
        printwriter.print("  mBtReverseTethered=");
        printwriter.println(mBluetoothTethered);
        printwriter.println("  - connectivity ------");
        printwriter.print("  mInetCondition=");
        printwriter.println(mInetCondition);
        printwriter.println("  - icons ------");
        printwriter.print("  mLastPhoneSignalIconId=0x");
        printwriter.print(Integer.toHexString(mLastPhoneSignalIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastPhoneSignalIconId));
        printwriter.print("  mLastDataDirectionIconId=0x");
        printwriter.print(Integer.toHexString(mLastDataDirectionIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastDataDirectionIconId));
        printwriter.print("  mLastDataDirectionOverlayIconId=0x");
        printwriter.print(Integer.toHexString(mLastDataDirectionOverlayIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastDataDirectionOverlayIconId));
        printwriter.print("  mLastWifiIconId=0x");
        printwriter.print(Integer.toHexString(mLastWifiIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastWifiIconId));
        printwriter.print("  mLastCombinedSignalIconId=0x");
        printwriter.print(Integer.toHexString(mLastCombinedSignalIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastCombinedSignalIconId));
        printwriter.print("  mLastDataTypeIconId=0x");
        printwriter.print(Integer.toHexString(mLastDataTypeIconId));
        printwriter.print("/");
        printwriter.println(getResourceName(mLastDataTypeIconId));
        printwriter.print("  mLastCombinedLabel=");
        printwriter.print(mLastCombinedLabel);
        printwriter.println("");
    }

    public boolean hasMobileDataFeature()
    {
        return mHasMobileDataFeature;
    }

    public void hideSimIndicator()
    {
        Xlog.d("StatusBar.NetworkController", "hideSimIndicator.");
        mSimIndicatorFlag = false;
        updateTelephonySignalStrength();
        updateDataNetType();
        updateDataIcon();
        refreshViews();
    }

    boolean isCdmaEri()
    {
label0:
        {
            if (mServiceState != null && mServiceState.getCdmaEriIconIndex() != 1)
            {
                int i = mServiceState.getCdmaEriIconMode();
                if (i == 0 || i == 1)
                    break label0;
            }
            return false;
        }
        return true;
    }

    public boolean isEmergencyOnly()
    {
        return mServiceState != null && mServiceState.isEmergencyOnly();
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("onReceive(): action = ").append(s).toString());
        if (!s.equals("android.net.wifi.RSSI_CHANGED") && !s.equals("android.net.wifi.WIFI_STATE_CHANGED") && !s.equals("android.net.wifi.STATE_CHANGE"))
        {
            if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
            {
                SIMHelper.updateSimInsertedStatus();
                updateSimState(intent);
                updateDataIcon();
                refreshViews();
                return;
            }
            if (s.equals("android.provider.Telephony.SPN_STRINGS_UPDATED"))
            {
                updateNetworkName(intent.getBooleanExtra("showSpn", false), intent.getStringExtra("spn"), intent.getBooleanExtra("showPlmn", false), intent.getStringExtra("plmn"));
                refreshViews();
                return;
            }
            if (!s.equals("android.net.conn.CONNECTIVITY_CHANGE") && !s.equals("android.net.conn.INET_CONDITION_ACTION"))
            {
                if (s.equals("android.intent.action.CONFIGURATION_CHANGED"))
                {
                    refreshViews();
                    return;
                }
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    updateAirplaneMode();
                    refreshViews();
                    return;
                }
                if (!s.equals("android.net.fourG.NET_4G_STATE_CHANGED") && !s.equals("android.net.wimax.SIGNAL_LEVEL_CHANGED") && !s.equals("android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"))
                {
                    if (s.equals("android.intent.action.SIM_SETTING_INFO_CHANGED"))
                    {
                        SIMHelper.updateSIMInfos(context);
                        int i = intent.getIntExtra("type", -1);
                        intent.getLongExtra("simid", -1L);
                        if (i == 1)
                        {
                            updateDataNetType();
                            updateTelephonySignalStrength();
                        }
                        refreshViews();
                        return;
                    }
                } else
                {
                    updateWimaxState(intent);
                    refreshViews();
                    return;
                }
            } else
            {
                updateConnectivity(intent);
                refreshViews();
                return;
            }
        } else
        {
            updateWifiState(intent);
            refreshViews();
        }
    }

    public void refreshSignalCluster(SignalCluster signalcluster)
    {
        boolean flag;
        if (!mWifiEnabled || !mWifiConnected && mHasMobileDataFeature)
            flag = false;
        else
            flag = true;
        signalcluster.setWifiIndicators(flag, mWifiIconId, mWifiActivityIconId, mContentDescriptionWifi);
        if (mIsWimaxEnabled && mWimaxConnected)
        {
            IconIdWrapper iconidwrapper1;
            if (mAlwaysShowCdmaRssi)
                iconidwrapper1 = mPhoneSignalIconId;
            else
                iconidwrapper1 = new IconIdWrapper(mWimaxIconId);
            signalcluster.setMobileDataIndicators(true, iconidwrapper1, mMobileActivityIconId, mDataTypeIconId, mContentDescriptionWimax, mContentDescriptionDataType);
        } else
        {
            boolean flag1 = mHasMobileDataFeature;
            IconIdWrapper iconidwrapper;
            if (mShowPhoneRSSIForData)
                iconidwrapper = mPhoneSignalIconId;
            else
                iconidwrapper = mDataSignalIconId;
            signalcluster.setMobileDataIndicators(flag1, iconidwrapper, mMobileActivityIconId, mDataTypeIconId, mContentDescriptionPhoneSignal, mContentDescriptionDataType);
        }
        signalcluster.setIsAirplaneMode(mAirplaneMode, mAirplaneIconId);
    }

    void refreshViews()
    {
        Context context = mContext;
        IconIdWrapper iconidwrapper = new IconIdWrapper(0);
        IconIdWrapper iconidwrapper1 = new IconIdWrapper(0);
        String s = "";
        int i = SIMHelper.getSIMColorIdBySlot(mContext, 0);
        Slog.d("StatusBar.NetworkController", (new StringBuilder()).append("refreshView simColor = ").append(i).toString());
        boolean flag = isEmergencyOnly();
        String s1;
        if (!mHasMobileDataFeature)
        {
            mPhoneSignalIconId.setResources(null);
            mPhoneSignalIconId.setIconId(0);
            mDataSignalIconId.setResources(null);
            mDataSignalIconId.setIconId(0);
            s1 = "";
        } else
        {
            if (mDataConnected)
                s1 = mNetworkName;
            else
            if (!mConnected && !flag)
                s1 = context.getString(0x7f0b00a6);
            else
            if (!hasService() && !flag)
                s1 = "";
            else
                s1 = mNetworkName;
            if (mDataConnected && i >= 0 && i <= 3)
            {
                mDataSignalIconId.clone();
                int ai[] = PluginFactory.getStatusBarPlugin(mContext).getDataActivityIconList(i, false);
                if (ai != null)
                {
                    mMobileActivityIconId.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                    mMobileActivityIconId.setIconId(ai[mDataActivity]);
                } else
                {
                    mMobileActivityIconId.setResources(null);
                    switch (mDataActivity)
                    {
                    case 3: // '\003'
                        mMobileActivityIconId.setIconId(0x7f020212);
                        break;

                    case 2: // '\002'
                        mMobileActivityIconId.setIconId(0x7f020218);
                        break;

                    case 1: // '\001'
                        mMobileActivityIconId.setIconId(0x7f02020d);
                        break;

                    default:
                        mMobileActivityIconId.setIconId(0);
                        break;
                    }
                }
                s = s1;
                iconidwrapper1 = mMobileActivityIconId.clone();
                iconidwrapper = mDataSignalIconId.clone();
                mContentDescriptionCombinedSignal = mContentDescriptionDataType;
            } else
            {
                if (!PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
                    mMobileActivityIconId.setResources(null);
                mMobileActivityIconId.setIconId(0);
                Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("refreshViews(): mDataConnected = ").append(mDataConnected).append(" mDataActivity = ").append(mDataActivity).append(" mMobileActivityIconId= ").append(mMobileActivityIconId).append(" mMobileActivityIconId.getIconId= ").append(mMobileActivityIconId.getIconId()).append(" mMobileActivityIconId.getResources= ").append(mMobileActivityIconId.getResources()).append(".").toString());
            }
        }
        String s2;
        if (mWifiConnected)
        {
            if (mWifiSsid == null)
            {
                s2 = context.getString(0x7f0b00a7);
                mWifiActivityIconId = 0;
            } else
            {
                s2 = mWifiSsid;
                switch (mWifiActivity)
                {
                case 3: // '\003'
                    mWifiActivityIconId = 0x7f020225;
                    break;

                case 2: // '\002'
                    mWifiActivityIconId = 0x7f020226;
                    break;

                case 1: // '\001'
                    mWifiActivityIconId = 0x7f020224;
                    break;

                case 0: // '\0'
                    mWifiActivityIconId = 0;
                    break;
                }
            }
            iconidwrapper1.setResources(null);
            iconidwrapper1.setIconId(mWifiActivityIconId);
            s = s2;
            iconidwrapper.setResources(null);
            iconidwrapper.setIconId(mWifiIconId);
            mContentDescriptionCombinedSignal = mContentDescriptionWifi;
        } else
        if (mHasMobileDataFeature)
            s2 = "";
        else
            s2 = context.getString(0x7f0b00a6);
        if (mBluetoothTethered)
        {
            s = mContext.getString(0x7f0b005c);
            iconidwrapper.setResources(null);
            iconidwrapper.setIconId(mBluetoothTetherIconId);
            mContentDescriptionCombinedSignal = mContext.getString(0x7f0b009a);
        }
        boolean flag1;
        if (mConnectedNetworkType == 9)
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
            s = mConnectedNetworkTypeName;
        if (!mAirplaneMode || mServiceState != null && (hasService() || mServiceState.isEmergencyOnly()))
        {
            if (!mDataConnected && !mWifiConnected && !mBluetoothTethered && !mWimaxConnected && !flag1)
            {
                s = context.getString(0x7f0b00a6);
                if (mHasMobileDataFeature)
                {
                    iconidwrapper = mDataSignalIconId.clone();
                } else
                {
                    iconidwrapper.setResources(null);
                    iconidwrapper.setIconId(mWifiIconId);
                }
                String s3;
                if (mHasMobileDataFeature)
                    s3 = mContentDescriptionDataType;
                else
                    s3 = mContentDescriptionWifi;
                mContentDescriptionCombinedSignal = s3;
                int l5 = mDataTypeIconId;
                mDataTypeIconId = 0;
                if (isCdma())
                {
                    if (isCdmaEri() && i >= 0 && i <= 3)
                    {
                        mRoamIconId = TelephonyIcons.ROAMING[i];
                        mIsRoaming = true;
                    }
                } else
                if (mPhone.isNetworkRoaming() && i >= 0 && i <= 3)
                {
                    mRoamIconId = TelephonyIcons.ROAMING[i];
                    mIsRoaming = true;
                } else
                {
                    mRoamIconId = 0;
                    mIsRoaming = false;
                }
                if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
                {
                    if (hasService() && (mSimState == com.android.internal.telephony.IccCardConstants.State.READY || mSimState == com.android.internal.telephony.IccCardConstants.State.UNKNOWN))
                        mDataTypeIconId = l5;
                    iconidwrapper1.setResources(null);
                    iconidwrapper1.setIconId(0);
                }
                Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("refreshViews(): mDataConnected = ").append(mDataConnected).append(" mWifiConnected = ").append(mWifiConnected).append(" mDataTypeIconId = ").append(mDataTypeIconId).append(".").toString());
            }
        } else
        {
            mContentDescriptionPhoneSignal = mContext.getString(0x7f0b009b);
            mAirplaneIconId = 0x7f02020c;
            mPhoneSignalIconId.setResources(null);
            mPhoneSignalIconId.setIconId(0x7f02020c);
            mDataSignalIconId.setResources(null);
            mDataSignalIconId.setIconId(0x7f02020c);
            mDataTypeIconId = 0;
            if (mWifiConnected)
            {
                s1 = "";
            } else
            {
                if (mHasMobileDataFeature)
                {
                    s2 = "";
                } else
                {
                    s2 = context.getString(0x7f0b00a6);
                    s = s2;
                }
                mContentDescriptionCombinedSignal = mContentDescriptionPhoneSignal;
                iconidwrapper = mDataSignalIconId.clone();
            }
        }
        SignalCluster signalcluster;
        for (Iterator iterator = mSignalClusters.iterator(); iterator.hasNext(); signalcluster.setRoamingFlagandResource(mIsRoaming, mRoamIconId))
        {
            signalcluster = (SignalCluster)iterator.next();
            signalcluster.setShowSimIndicator(mSimIndicatorFlag, mSimIndicatorResId);
        }

        if (mLastPhoneSignalIconId != mPhoneSignalIconId.getIconId() || mLastDataDirectionOverlayIconId != iconidwrapper1.getIconId() || mLastWifiIconId != mWifiIconId || mLastWimaxIconId != mWimaxIconId || mLastDataTypeIconId != mDataTypeIconId || mLastAirplaneMode != mAirplaneMode)
        {
            for (Iterator iterator1 = mSignalClusters.iterator(); iterator1.hasNext(); refreshSignalCluster((SignalCluster)iterator1.next()));
        }
        if (mLastAirplaneMode != mAirplaneMode)
            mLastAirplaneMode = mAirplaneMode;
        if (mLastPhoneSignalIconId != mPhoneSignalIconId.getIconId())
        {
            mLastPhoneSignalIconId = mPhoneSignalIconId.getIconId();
            int j5 = mPhoneSignalIconViews.size();
            for (int k5 = 0; k5 < j5; k5++)
            {
                ImageView imageview6 = (ImageView)mPhoneSignalIconViews.get(k5);
                if (mPhoneSignalIconId.getIconId() == 0)
                {
                    imageview6.setVisibility(8);
                    continue;
                }
                imageview6.setVisibility(0);
                if (mPhoneSignalIconId.getResources() != null)
                    imageview6.setImageDrawable(mPhoneSignalIconId.getDrawable());
                else
                if (mPhoneSignalIconId.getIconId() == 0)
                    imageview6.setImageDrawable(null);
                else
                    imageview6.setImageResource(mPhoneSignalIconId.getIconId());
                imageview6.setContentDescription(mContentDescriptionPhoneSignal);
            }

        }
        if (mLastDataDirectionIconId != mDataDirectionIconId)
        {
            mLastDataDirectionIconId = mDataDirectionIconId;
            int l4 = mDataDirectionIconViews.size();
            for (int i5 = 0; i5 < l4; i5++)
            {
                ImageView imageview5 = (ImageView)mDataDirectionIconViews.get(i5);
                imageview5.setImageResource(mDataDirectionIconId);
                imageview5.setContentDescription(mContentDescriptionDataType);
            }

        }
        if (mLastWifiIconId != mWifiIconId)
        {
            mLastWifiIconId = mWifiIconId;
            int j4 = mWifiIconViews.size();
            for (int k4 = 0; k4 < j4; k4++)
            {
                ImageView imageview4 = (ImageView)mWifiIconViews.get(k4);
                if (mWifiIconId == 0)
                {
                    imageview4.setVisibility(8);
                } else
                {
                    imageview4.setVisibility(0);
                    imageview4.setImageResource(mWifiIconId);
                    imageview4.setContentDescription(mContentDescriptionWifi);
                }
            }

        }
        if (mLastWimaxIconId != mWimaxIconId)
        {
            mLastWimaxIconId = mWimaxIconId;
            int l3 = mWimaxIconViews.size();
            for (int i4 = 0; i4 < l3; i4++)
            {
                ImageView imageview3 = (ImageView)mWimaxIconViews.get(i4);
                if (mWimaxIconId == 0)
                {
                    imageview3.setVisibility(8);
                } else
                {
                    imageview3.setVisibility(0);
                    imageview3.setImageResource(mWimaxIconId);
                    imageview3.setContentDescription(mContentDescriptionWimax);
                }
            }

        }
        if (mLastCombinedSignalIconId != iconidwrapper.getIconId())
        {
            mLastCombinedSignalIconId = iconidwrapper.getIconId();
            int j3 = mCombinedSignalIconViews.size();
            for (int k3 = 0; k3 < j3; k3++)
            {
                ImageView imageview2 = (ImageView)mCombinedSignalIconViews.get(k3);
                if (iconidwrapper.getResources() != null)
                    imageview2.setImageDrawable(iconidwrapper.getDrawable());
                else
                if (iconidwrapper.getIconId() == 0)
                    imageview2.setImageDrawable(null);
                else
                    imageview2.setImageResource(iconidwrapper.getIconId());
                imageview2.setContentDescription(mContentDescriptionCombinedSignal);
            }

        }
        if (mLastDataTypeIconId != mDataTypeIconId)
        {
            mLastDataTypeIconId = mDataTypeIconId;
            int l2 = mDataTypeIconViews.size();
            Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("refreshViews(): mLastDataTypeIconId = ").append(mLastDataTypeIconId).append(" N = ").append(l2).append(".").toString());
            for (int i3 = 0; i3 < l2; i3++)
            {
                ImageView imageview1 = (ImageView)mDataTypeIconViews.get(i3);
                if (mDataTypeIconId == 0)
                {
                    imageview1.setVisibility(8);
                } else
                {
                    imageview1.setVisibility(0);
                    imageview1.setImageResource(mDataTypeIconId);
                    imageview1.setContentDescription(mContentDescriptionDataType);
                }
            }

        }
        if (mLastDataDirectionOverlayIconId != iconidwrapper1.getIconId())
        {
            mLastDataDirectionOverlayIconId = iconidwrapper1.getIconId();
            int j2 = mDataDirectionOverlayIconViews.size();
            for (int k2 = 0; k2 < j2; k2++)
            {
                ImageView imageview = (ImageView)mDataDirectionOverlayIconViews.get(k2);
                if (iconidwrapper1.getIconId() == 0)
                {
                    imageview.setVisibility(8);
                    continue;
                }
                imageview.setVisibility(0);
                if (iconidwrapper1.getResources() != null)
                    imageview.setImageDrawable(iconidwrapper1.getDrawable());
                else
                if (iconidwrapper1.getIconId() == 0)
                    imageview.setImageDrawable(null);
                else
                    imageview.setImageResource(iconidwrapper1.getIconId());
                imageview.setContentDescription(mContentDescriptionDataType);
            }

        }
        if (!mLastCombinedLabel.equals(s))
        {
            mLastCombinedLabel = s;
            int l1 = mCombinedLabelViews.size();
            for (int i2 = 0; i2 < l1; i2++)
                ((TextView)mCombinedLabelViews.get(i2)).setText(s);

        }
        int j = mWifiLabelViews.size();
        for (int k = 0; k < j; k++)
        {
            TextView textview2 = (TextView)mWifiLabelViews.get(k);
            textview2.setText(s2);
            if ("".equals(s2))
                textview2.setVisibility(8);
            else
                textview2.setVisibility(0);
        }

        int l = mMobileLabelViews.size();
        for (int i1 = 0; i1 < l; i1++)
        {
            TextView textview1 = (TextView)mMobileLabelViews.get(i1);
            textview1.setText(s1);
            if ("".equals(s1))
                textview1.setVisibility(8);
            else
                textview1.setVisibility(0);
        }

        int j1 = mEmergencyLabelViews.size();
        for (int k1 = 0; k1 < j1; k1++)
        {
            TextView textview = (TextView)mEmergencyLabelViews.get(k1);
            if (!flag)
            {
                textview.setVisibility(8);
            } else
            {
                textview.setText(s1);
                textview.setVisibility(0);
            }
        }

    }

    public void setStackedMode(boolean flag)
    {
        mDataAndWifiStacked = true;
    }

    public void showSimIndicator()
    {
        int i = SIMHelper.getSIMColorIdBySlot(mContext, 0);
        if (i > -1 && i < 4)
            mSimIndicatorResId = TelephonyIcons.SIM_INDICATOR_BACKGROUND[i];
        Xlog.d("StatusBar.NetworkController", (new StringBuilder()).append("showSimIndicator simColor = ").append(i).append(" mSimIndicatorResId = ").append(mSimIndicatorResId).toString());
        mSimIndicatorFlag = true;
        updateTelephonySignalStrength();
        updateDataNetType();
        updateDataIcon();
        refreshViews();
    }

    void updateNetworkName(boolean flag, String s, boolean flag1, String s1)
    {
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag2 = false;
        if (flag1)
        {
            flag2 = false;
            if (s1 != null)
            {
                stringbuilder.append(s1);
                flag2 = true;
            }
        }
        if (flag && s != null)
        {
            if (flag2)
                stringbuilder.append(mNetworkNameSeparator);
            stringbuilder.append(s);
            flag2 = true;
        }
        if (flag2)
        {
            mNetworkName = stringbuilder.toString();
            return;
        } else
        {
            mNetworkName = mNetworkNameDefault;
            return;
        }
    }




}
