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
import android.view.IWindowManager;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.internal.app.IBatteryStats;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.PhoneConstants;
import com.android.internal.util.AsyncChannel;
import com.android.server.am.BatteryStatsService;
import com.android.systemui.statusbar.phone.CarrierLabelGemini;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.systemui.ext.*;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            TelephonyIconsGemini, AccessibilityContentDescriptions, WifiIcons, WimaxIcons, 
//            TelephonyIcons

public class NetworkControllerCoolpad extends BroadcastReceiver
{
    public static interface SignalCluster
    {

        public abstract void apply();

        public abstract void setDataNetType3G(int i, NetworkType networktype);

        public abstract void setIsAirplaneMode(boolean flag);

        public abstract void setMobileDataIndicators(int i, boolean flag, IconIdWrapper aiconidwrapper[], IconIdWrapper iconidwrapper, IconIdWrapper iconidwrapper1, String s, String s1);

        public abstract void setRoamingFlagandResource(boolean aflag[], int ai[]);

        public abstract void setShowSimIndicator(int i, boolean flag, int j);

        public abstract void setWifiIndicators(boolean flag, int i, int j, String s);
    }

    class WifiHandler extends Handler
    {

        final NetworkControllerCoolpad this$0;

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
                Xlog.e("NetworkControllerCoolpad", "Failed to connect to wifi");
                return;
            }
        }

        WifiHandler()
        {
            this$0 = NetworkControllerCoolpad.this;
            super();
        }
    }

    private class myPhoneStateListener extends PhoneStateListener
    {

        final NetworkControllerCoolpad this$0;

        public void onCallStateChanged(int i, String s)
        {
            int j = Arrays.asList(mPhoneStateListener).indexOf(this);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onCallStateChanged, sim").append(j).append(" before.").toString());
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onCallStateChanged, state=").append(i).toString());
            if (isCdma(j))
            {
                updateDataNetType(j);
                updateTelephonySignalStrength(j);
                refreshViews(j);
            }
            updateDataIcon();
            updateDataNetType();
            refreshViews();
            Xlog.d("NetworkControllerCoolpad", "PhoneStateListener:onCallStateChanged, sim1 after.");
        }

        public void onDataActivity(int i)
        {
            int j = Arrays.asList(mPhoneStateListener).indexOf(this);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataActivity, sim").append(j).append(" before.").toString());
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataActivity, direction=").append(i).toString());
            mDataActivity[j] = i;
            updateDataIcon(j);
            refreshViews(j);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataActivity, sim").append(j).append(" after.").toString());
        }

        public void onDataConnectionStateChanged(int i, int j)
        {
            int k = Arrays.asList(mPhoneStateListener).indexOf(this);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataConnectionStateChanged, sim").append(k).append(" before.").toString());
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataConnectionStateChanged, state=").append(i).append(" type=").append(j).toString());
            mDataState[k] = i;
            mDataNetType[k] = j;
            updateDataNetType(k);
            updateDataIcon(k);
            refreshViews(k);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onDataConnectionStateChanged, sim").append(k).append(" after.").toString());
        }

        public void onServiceStateChanged(ServiceState servicestate)
        {
            int i = Arrays.asList(mPhoneStateListener).indexOf(this);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onServiceStateChanged, sim").append(i).append(" before.").toString());
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onServiceStateChanged, state=").append(servicestate.getState()).toString());
            mServiceState[i] = servicestate;
            TelephonyManager telephonymanager = TelephonyManager.getDefault();
            mDataNetType[i] = telephonymanager.getNetworkTypeGemini(i);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onServiceStateChanged sim").append(i).append(" mDataNetType: ").append(mDataNetType[i]).toString());
            updateDataNetType(i);
            updateTelephonySignalStrength(i);
            updateDataIcon(i);
            refreshViews(i);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onServiceStateChanged, sim").append(i).append(" after.").toString());
        }

        public void onSignalStrengthsChanged(SignalStrength signalstrength)
        {
            int i = Arrays.asList(mPhoneStateListener).indexOf(this);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onSignalStrengthsChanged, sim").append(i).append(" before.").toString());
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onSignalStrengthsChanged, signalStrength=").append(signalstrength.getLevel()).toString());
            mSignalStrength[i] = signalstrength;
            updateDataNetType(i);
            updateTelephonySignalStrength(i);
            refreshViews(i);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("PhoneStateListener:onSignalStrengthsChanged, sim").append(i).append(" after.").toString());
        }

        private myPhoneStateListener()
        {
            this$0 = NetworkControllerCoolpad.this;
            super();
        }

    }


    private static final String ACTION_BOOT_IPO = "android.intent.action.ACTION_PREBOOT_IPO";
    static final boolean CHATTY = false;
    static final boolean DEBUG = false;
    private static final int INET_CONDITION_THRESHOLD = 50;
    static final String TAG = "NetworkControllerCoolpad";
    private boolean mAirplaneMode;
    private boolean mAlwaysShowCdmaRssi;
    private IBatteryStats mBatteryStats;
    private int mBluetoothTetherIconId;
    private boolean mBluetoothTethered;
    private CarrierLabelGemini mCarrier1;
    private CarrierLabelGemini mCarrier2;
    private View mCarrierDivider;
    private ArrayList mCarrierList;
    private ArrayList mCombinedLabelViews;
    private ArrayList mCombinedSignalIconViews;
    private boolean mConnected;
    private int mConnectedNetworkType;
    private String mConnectedNetworkTypeName;
    private String mContentDescriptionDataType[];
    private String mContentDescriptionPhoneSignal[];
    private String mContentDescriptionWifi;
    private String mContentDescriptionWimax;
    private Context mContext;
    private boolean mDataActive;
    private int mDataActivity[];
    private boolean mDataAndWifiStacked;
    private boolean mDataConnected[];
    private int mDataDirectionIconId[];
    private ArrayList mDataDirectionIconViews;
    private ArrayList mDataDirectionOverlayIconViews;
    private IconIdWrapper mDataIconList[][];
    private int mDataIconListNum;
    private int mDataNetType[];
    private NetworkType mDataNetType3G[];
    private IconIdWrapper mDataSignalIconId[];
    private int mDataState[];
    private IconIdWrapper mDataTypeIconId[];
    private ArrayList mDataTypeIconViews;
    private ArrayList mDividerList;
    private ArrayList mEmergencyLabelViews;
    private int mGeminiSimNum;
    private boolean mHasMobileDataFeature;
    private boolean mHspaDataDistinguishable;
    private int mInetCondition;
    private boolean mIsRoaming[];
    private int mIsRoamingId[];
    private boolean mIsScreenLarge;
    private boolean mIsWimaxEnabled;
    private boolean mLastAirplaneMode;
    private String mLastCombinedLabel;
    private int mLastCombinedSignalIconId;
    private int mLastDataDirectionIconId;
    private int mLastDataDirectionOverlayIconId;
    private int mLastDataTypeIconId[];
    private int mLastMobileActivityIconId[];
    private int mLastPhoneSignalIconId[][];
    private int mLastWifiIconId;
    private int mLastWimaxIconId;
    private IconIdWrapper mMobileActivityIconId[];
    private ArrayList mMobileLabelViews;
    private String mNetworkName[];
    private String mNetworkNameDefault;
    private String mNetworkNameSeparator;
    private final TelephonyManagerEx mPhone;
    private IconIdWrapper mPhoneSignalIconId[][];
    private int mPhoneSignalIconIdNum;
    private ArrayList mPhoneSignalIconViews;
    private myPhoneStateListener mPhoneStateListener[];
    private ServiceState mServiceState[];
    private boolean mShowAtLeastThreeGees;
    private ArrayList mSignalClusters;
    private SignalStrength mSignalStrength[];
    private boolean mSimCardReady;
    private boolean mSimIndicatorFlag[];
    private int mSimIndicatorResId[];
    private com.android.internal.telephony.IccCardConstants.State mSimState[];
    private int mWifiActivity;
    private int mWifiActivityIconId;
    private AsyncChannel mWifiChannel;
    private boolean mWifiConnected;
    private boolean mWifiEnabled;
    private int mWifiIconId;
    private ArrayList mWifiIconViews;
    private ArrayList mWifiLabelViews;
    private int mWifiLevel;
    private final WifiManager mWifiManager;
    private int mWifiRssi;
    private String mWifiSsid;
    private boolean mWimaxConnected;
    private int mWimaxExtraState;
    private int mWimaxIconId;
    private ArrayList mWimaxIconViews;
    private boolean mWimaxIdle;
    private int mWimaxSignal;
    private int mWimaxState;
    private boolean mWimaxSupported;

    public NetworkControllerCoolpad(Context context)
    {
        Resources resources;
        IWindowManager iwindowmanager;
        mShowAtLeastThreeGees = false;
        mAlwaysShowCdmaRssi = false;
        mDataIconListNum = 4;
        mPhoneSignalIconIdNum = 2;
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
        mLastAirplaneMode = false;
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
        mLastDataDirectionIconId = -1;
        mLastDataDirectionOverlayIconId = -1;
        mLastWifiIconId = -1;
        mLastWimaxIconId = -1;
        mLastCombinedSignalIconId = -1;
        mLastCombinedLabel = "";
        mDataAndWifiStacked = false;
        mIsScreenLarge = false;
        mSimCardReady = false;
        mCarrier1 = null;
        mCarrier2 = null;
        mCarrierDivider = null;
        mCarrierList = new ArrayList();
        mDividerList = new ArrayList();
        mContext = context;
        resources = context.getResources();
        mHasMobileDataFeature = ((ConnectivityManager)mContext.getSystemService("connectivity")).isNetworkSupported(0);
        mShowAtLeastThreeGees = resources.getBoolean(0x7f0a0005);
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("NetworkControllerCoolpad, mShowAtLeastThreeGees=").append(mShowAtLeastThreeGees).toString());
        iwindowmanager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        if (!iwindowmanager.hasSystemNavBar()) goto _L2; else goto _L1
_L1:
        mIsScreenLarge = true;
_L6:
        int i;
        mAlwaysShowCdmaRssi = resources.getBoolean(0x111003a);
        updateWifiIcons();
        updateWimaxIcons();
        mPhone = SIMHelper.getDefault(context);
        mGeminiSimNum = PhoneConstants.GEMINI_SIM_NUM;
        mNetworkNameSeparator = mContext.getString(0x7f0b005b);
        mNetworkNameDefault = mContext.getString(0x10402e6);
        mIsRoaming = new boolean[mGeminiSimNum];
        mIsRoamingId = new int[mGeminiSimNum];
        mSignalStrength = new SignalStrength[mGeminiSimNum];
        mServiceState = new ServiceState[mGeminiSimNum];
        mDataNetType = new int[mGeminiSimNum];
        mDataState = new int[mGeminiSimNum];
        mDataConnected = new boolean[mGeminiSimNum];
        mSimState = new com.android.internal.telephony.IccCardConstants.State[mGeminiSimNum];
        mDataDirectionIconId = new int[mGeminiSimNum];
        mDataActivity = new int[mGeminiSimNum];
        mDataNetType3G = new NetworkType[mGeminiSimNum];
        mContentDescriptionPhoneSignal = new String[mGeminiSimNum];
        mDataSignalIconId = new IconIdWrapper[mGeminiSimNum];
        mContentDescriptionDataType = new String[mGeminiSimNum];
        mNetworkName = new String[mGeminiSimNum];
        mPhoneSignalIconId = (IconIdWrapper[][])Array.newInstance(com/mediatek/systemui/ext/IconIdWrapper, new int[] {
            mGeminiSimNum, mPhoneSignalIconIdNum
        });
        mDataTypeIconId = new IconIdWrapper[mGeminiSimNum];
        mMobileActivityIconId = new IconIdWrapper[mGeminiSimNum];
        mDataIconList = (IconIdWrapper[][])Array.newInstance(com/mediatek/systemui/ext/IconIdWrapper, new int[] {
            mGeminiSimNum, mDataIconListNum
        });
        mLastPhoneSignalIconId = new int[mGeminiSimNum][];
        mLastDataTypeIconId = new int[mGeminiSimNum];
        mLastMobileActivityIconId = new int[mGeminiSimNum];
        mSimIndicatorFlag = new boolean[mGeminiSimNum];
        mSimIndicatorResId = new int[mGeminiSimNum];
        mPhoneStateListener = new myPhoneStateListener[mGeminiSimNum];
        mSimCardReady = SystemProperties.getBoolean("gsm.siminfo.ready", false);
        PluginFactory.getStatusBarPlugin(mContext).getDataTypeIconListGemini(false, DataType.Type_G);
        i = 0;
_L4:
        if (i >= mGeminiSimNum)
            break; /* Loop/switch isn't completed */
        mDataNetType[i] = 0;
        mDataState[i] = 0;
        mSimState[i] = com.android.internal.telephony.IccCardConstants.State.READY;
        mDataActivity[i] = 0;
        mNetworkName[i] = mNetworkNameDefault;
        mLastPhoneSignalIconId[i] = (new int[] {
            -1, -1
        });
        mLastDataTypeIconId[i] = -1;
        mLastMobileActivityIconId[i] = -1;
        mPhoneStateListener[i] = new myPhoneStateListener();
        mMobileActivityIconId[i] = new IconIdWrapper();
        mDataTypeIconId[i] = new IconIdWrapper(0);
        mDataSignalIconId[i] = new IconIdWrapper(0);
        RemoteException remoteexception;
        for (int j = 0; j < mDataIconListNum; j++)
        {
            mDataIconList[i][j] = new IconIdWrapper(0);
            mDataIconList[i][j].setResources(null);
            mDataIconList[i][j].setIconId(TelephonyIconsGemini.DATA_G[j]);
        }

        for (int k = 0; k < mPhoneSignalIconIdNum; k++)
            mPhoneSignalIconId[i][k] = new IconIdWrapper(0);

        mPhoneSignalIconId[i][0].setResources(null);
        mPhoneSignalIconId[i][0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
        SIMHelper.listen(mPhoneStateListener[i], 481, i);
        i++;
        continue; /* Loop/switch isn't completed */
_L2:
        try
        {
            mIsScreenLarge = false;
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            Xlog.w("NetworkControllerCoolpad", "Failing checking whether status bar is visible");
        }
        continue; /* Loop/switch isn't completed */
        if (true) goto _L4; else goto _L3
_L3:
        boolean flag;
        WifiHandler wifihandler;
        android.os.Messenger messenger;
        IntentFilter intentfilter;
        if (mContext.getResources().getBoolean(0x7f0a0002) && PluginFactory.getStatusBarPlugin(mContext).isHspaDataDistinguishable())
            flag = true;
        else
            flag = false;
        mHspaDataDistinguishable = flag;
        mWifiManager = (WifiManager)context.getSystemService("wifi");
        wifihandler = new WifiHandler();
        mWifiChannel = new AsyncChannel();
        messenger = mWifiManager.getWifiServiceMessenger();
        if (messenger != null)
            mWifiChannel.connect(mContext, wifihandler, messenger);
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.net.wifi.RSSI_CHANGED");
        intentfilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        intentfilter.addAction("android.net.wifi.STATE_CHANGE");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
        intentfilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        intentfilter.addAction("android.net.conn.INET_CONDITION_ACTION");
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.ACTION_PREBOOT_IPO");
        mWimaxSupported = mContext.getResources().getBoolean(0x111003f);
        if (mWimaxSupported)
        {
            intentfilter.addAction("android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED");
            intentfilter.addAction("android.net.wimax.SIGNAL_LEVEL_CHANGED");
            intentfilter.addAction("android.net.fourG.NET_4G_STATE_CHANGED");
        }
        intentfilter.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INSERTED_STATUS");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        context.registerReceiver(this, intentfilter);
        updateAirplaneMode();
        mBatteryStats = BatteryStatsService.getService();
        return;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private int GetCurNetWorkTypeForSignal(int i)
    {
        switch (mDataNetType[i])
        {
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
        case 15: // '\017'
            return 4;

        case 3: // '\003'
            return 3;

        case 2: // '\002'
            return 2;

        case 1: // '\001'
            return 1;

        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        case 7: // '\007'
        case 11: // '\013'
        case 12: // '\f'
        case 13: // '\r'
        case 14: // '\016'
        default:
            return 0;
        }
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

    private boolean hasService(int i)
    {
        ServiceState servicestate = mServiceState[i];
        boolean flag = false;
        if (servicestate != null)
        {
            int j = servicestate.getState();
            flag = false;
            switch (j)
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

    private boolean isCdma(int i)
    {
        SignalStrength signalstrength = mSignalStrength[i];
        return signalstrength != null && !signalstrength.isGsm();
    }

    private boolean isSimInserted(int i)
    {
        ITelephony itelephony;
        boolean flag;
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
        flag = false;
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_28;
        boolean flag1 = itelephony.isSimInsert(i);
        flag = flag1;
_L2:
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("isSimInserted(").append(i).append("), SimInserted=").append(flag).toString());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private boolean isWifiOnlyDevice()
    {
        boolean flag = ((ConnectivityManager)mContext.getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    private void updateAirplaneMode()
    {
        boolean flag = true;
        if (android.provider.Settings.System.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != flag)
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
        if (intent.getIntExtra("inetCondition", 0) <= 50)
            i = 0;
        mInetCondition = i;
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateConnectivity, mInetCondition=").append(mInetCondition).toString());
        if (networkinfo != null && networkinfo.getType() == 7)
            mBluetoothTethered = networkinfo.isConnected();
        else
            mBluetoothTethered = false;
        int j = intent.getIntExtra("simId", 0);
        updateDataNetType(j);
        updateWimaxIcons();
        updateDataIcon(j);
        updateTelephonySignalStrength(j);
        updateWifiIcons();
    }

    private final void updateDataIcon()
    {
        for (int i = 0; i < mGeminiSimNum; i++)
            updateDataIcon(i);

    }

    private final void updateDataIcon(int i)
    {
        boolean flag;
        ITelephony itelephony;
        IconIdWrapper aiconidwrapper[];
        int j;
        com.android.internal.telephony.IccCardConstants.State state;
        NetworkType networktype;
        boolean flag1;
        int i1;
        flag = true;
        itelephony = SIMHelper.getITelephony();
        aiconidwrapper = new IconIdWrapper[4];
        aiconidwrapper[0] = new IconIdWrapper();
        aiconidwrapper[1] = new IconIdWrapper();
        aiconidwrapper[2] = new IconIdWrapper();
        aiconidwrapper[3] = new IconIdWrapper();
        j = mDataState[i];
        state = mSimState[i];
        int k = mDataActivity[i];
        networktype = mDataNetType3G[i];
        for (int l = 0; l < mDataIconListNum; l++)
            aiconidwrapper[l] = mDataIconList[i][l].clone();

        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataIcon(").append(i).append("), SimState=").append(state).append(", DataState=").append(j).append(", DataActivity=").append(k).append(", tempNetType3G=").append(networktype).toString());
        flag1 = isCdma(i);
        i1 = 0;
        if (flag1) goto _L2; else goto _L1
_L1:
        if (state != com.android.internal.telephony.IccCardConstants.State.READY && state != com.android.internal.telephony.IccCardConstants.State.UNKNOWN) goto _L4; else goto _L3
_L3:
        int ai[];
        boolean flag2;
        ai = new int[mGeminiSimNum];
        flag2 = true;
        int k1 = 0;
        while (k1 < mGeminiSimNum) 
        {
            try
            {
                ai[k1] = itelephony.getCallStateGemini(k1);
            }
            catch (Exception exception1)
            {
                exception1.printStackTrace();
            }
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataIcon(").append(i).append("), callState(").append(k1).append(") is ").append(ai[k1]).toString());
            if (ai[k1] != 0)
                flag2 = false;
            k1++;
        }
        if (networktype == NetworkType.Type_3G) goto _L6; else goto _L5
_L5:
        long l1;
        if (hasService(i) && j == 2 && flag2 && android.provider.Settings.System.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != 1)
        {
            int i3 = SIMHelper.getSIMColorIdBySlot(mContext, i);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataIcon(").append(i).append("), simColorId=").append(i3).toString());
            i1 = 0;
            if (i3 > -1)
                i1 = aiconidwrapper[i3].getIconId();
        } else
        {
            i1 = 0;
            flag = false;
        }
_L2:
        l1 = Binder.clearCallingIdentity();
        mBatteryStats.notePhoneDataConnectionState(mPhone.getNetworkType(i), flag);
        Binder.restoreCallingIdentity(l1);
        break MISSING_BLOCK_LABEL_477;
_L6:
        itelephony1 = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
        flag3 = true;
        i2 = 0;
        if (itelephony1 == null)
            break MISSING_BLOCK_LABEL_615;
        l2 = itelephony1.get3GCapabilitySIM();
        i2 = l2;
        break MISSING_BLOCK_LABEL_615;
        remoteexception1;
        remoteexception1.printStackTrace();
        i2 = 0;
        int j2 = 0;
        do
        {
            if (j2 >= mGeminiSimNum)
                break;
            RemoteException remoteexception1;
            if (i2 != j2 && ai[j2] != 0)
                flag3 = false;
            j2++;
        } while (true);
        if (hasService(i) && j == 2 && flag3 && android.provider.Settings.System.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != 1)
        {
            int k2 = SIMHelper.getSIMColorIdBySlot(mContext, i);
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataIcon(").append(i).append("), simColorId=").append(k2).toString());
            i1 = 0;
            if (k2 > -1)
                i1 = aiconidwrapper[k2].getIconId();
        } else
        {
            i1 = 0;
            flag = false;
        }
        continue; /* Loop/switch isn't completed */
_L4:
        i1 = 0x7f0201fb;
        flag = false;
        continue; /* Loop/switch isn't completed */
        remoteexception;
        Xlog.d("NetworkControllerCoolpad", "RemoteException");
        Binder.restoreCallingIdentity(l1);
          goto _L7
        exception;
        Binder.restoreCallingIdentity(l1);
        throw exception;
_L7:
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataIcon(").append(i).append("), iconId=").append(i1).append(", visible=").append(flag).toString());
        mDataConnected[i] = flag;
        mDataDirectionIconId[i] = i1;
        if (mDataConnected[i])
        {
            int j1 = 0;
            while (j1 < mGeminiSimNum) 
            {
                Exception exception;
                RemoteException remoteexception;
                ITelephony itelephony1;
                boolean flag3;
                int i2;
                int l2;
                if (j1 != i)
                    mDataConnected[j1] = false;
                j1++;
            }
        }
        return;
        if (true) goto _L2; else goto _L8
_L8:
    }

    private final void updateDataNetType()
    {
        for (int i = 0; i < mGeminiSimNum; i++)
            updateDataNetType(i);

    }

    private final void updateDataNetType(int i)
    {
        NetworkType networktype = NetworkType.Type_G;
        int j = mDataNetType[i];
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateDataNetType(").append(i).append("), DataNetType=").append(j).append(".").toString());
        if (mPhone.isNetworkRoaming(i))
        {
            mIsRoaming[i] = true;
            mIsRoamingId[i] = TelephonyIconsGemini.getTelephonySignalRoamingIcon(i);
        } else
        {
            mIsRoaming[i] = false;
            mIsRoamingId[i] = 0;
        }
        String s;
        if (mIsWimaxEnabled && mWimaxConnected)
        {
            DataType _tmp = DataType.Type_4G;
            s = mContext.getString(0x7f0b0095);
        } else
        {
            switch (j)
            {
            case 13: // '\r'
                DataType _tmp1 = DataType.Type_4G;
                s = mContext.getString(0x7f0b0095);
                break;

            case 5: // '\005'
            case 6: // '\006'
            case 12: // '\f'
            case 14: // '\016'
                networktype = NetworkType.Type_1X3G;
                DataType _tmp2 = DataType.Type_3G;
                s = mContext.getString(0x7f0b0093);
                break;

            case 7: // '\007'
                networktype = NetworkType.Type_1X;
                DataType _tmp3 = DataType.Type_1X;
                s = mContext.getString(0x7f0b0096);
                break;

            case 4: // '\004'
                networktype = NetworkType.Type_1X;
                DataType _tmp4 = DataType.Type_1X;
                s = mContext.getString(0x7f0b0096);
                break;

            case 15: // '\017'
                networktype = NetworkType.Type_3G;
                if (mHspaDataDistinguishable)
                {
                    DataType _tmp5 = DataType.Type_H_PLUS;
                    s = mContext.getString(0x7f0b0094);
                } else
                {
                    DataType _tmp6 = DataType.Type_3G;
                    s = mContext.getString(0x7f0b0093);
                }
                break;

            case 8: // '\b'
            case 9: // '\t'
            case 10: // '\n'
                networktype = NetworkType.Type_3G;
                if (mHspaDataDistinguishable)
                {
                    DataType _tmp7 = DataType.Type_H;
                    s = mContext.getString(0x7f0b0094);
                } else
                {
                    DataType _tmp8 = DataType.Type_3G;
                    s = mContext.getString(0x7f0b0093);
                }
                break;

            case 0: // '\0'
                if (!mShowAtLeastThreeGees)
                {
                    DataType _tmp9 = DataType.Type_G;
                    s = mContext.getString(0x7f0b0092);
                    break;
                }
                // fall through

            case 2: // '\002'
                if (!mShowAtLeastThreeGees)
                {
                    DataType _tmp10 = DataType.Type_E;
                    s = mContext.getString(0x7f0b0097);
                    break;
                }
                // fall through

            case 3: // '\003'
                networktype = NetworkType.Type_3G;
                DataType _tmp11 = DataType.Type_3G;
                s = mContext.getString(0x7f0b0093);
                break;

            case 1: // '\001'
            case 11: // '\013'
            default:
                if (!mShowAtLeastThreeGees)
                {
                    networktype = NetworkType.Type_G;
                    DataType _tmp12 = DataType.Type_G;
                    s = mContext.getString(0x7f0b0092);
                } else
                {
                    networktype = NetworkType.Type_3G;
                    DataType _tmp13 = DataType.Type_3G;
                    s = mContext.getString(0x7f0b0093);
                }
                break;
            }
        }
        IconIdWrapper aiconidwrapper[] = new IconIdWrapper[4];
        aiconidwrapper[0] = new IconIdWrapper();
        aiconidwrapper[1] = new IconIdWrapper();
        aiconidwrapper[2] = new IconIdWrapper();
        aiconidwrapper[3] = new IconIdWrapper();
        new IconIdWrapper();
        mDataNetType3G[i] = networktype;
        mContentDescriptionDataType[i] = s;
        mDataIconList[i] = aiconidwrapper;
    }

    private final void updateSimState(int i, Intent intent)
    {
        String s = intent.getStringExtra("ss");
        com.android.internal.telephony.IccCardConstants.State state;
        if ("ABSENT".equals(s))
            state = com.android.internal.telephony.IccCardConstants.State.ABSENT;
        else
        if ("READY".equals(s))
            state = com.android.internal.telephony.IccCardConstants.State.READY;
        else
        if ("LOCKED".equals(s))
        {
            String s1 = intent.getStringExtra("reason");
            if ("PIN".equals(s1))
                state = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
            else
            if ("PUK".equals(s1))
                state = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
            else
                state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
        } else
        {
            state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
        }
        if (state != null)
            mSimState[i] = state;
    }

    private final void updateTelephonySignalStrength()
    {
        for (int i = 0; i < mGeminiSimNum; i++)
            updateTelephonySignalStrength(i);

    }

    private final void updateTelephonySignalStrength(int i)
    {
        IconIdWrapper aiconidwrapper[] = new IconIdWrapper[2];
        aiconidwrapper[0] = new IconIdWrapper();
        aiconidwrapper[1] = new IconIdWrapper();
        IconIdWrapper iconidwrapper = new IconIdWrapper();
        IconIdWrapper iconidwrapper1 = new IconIdWrapper();
        String s = "";
        new int[] {
            -1, -1
        };
        SignalStrength signalstrength = mSignalStrength[i];
        ServiceState servicestate = mServiceState[i];
        boolean flag = false;
        if (true)
        {
            boolean flag2 = isSimInserted(i);
            flag = false;
            if (!flag2)
            {
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), is null signal.").toString());
                aiconidwrapper[0].setResources(null);
                aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                iconidwrapper1.setResources(null);
                iconidwrapper1.setIconId(0);
                flag = true;
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), null signal").toString());
            }
        }
        if (!mSimCardReady)
        {
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), the SIMs initialization of framework has not been ready.").toString());
            aiconidwrapper[0].setResources(null);
            aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
            iconidwrapper1.setResources(null);
            iconidwrapper1.setIconId(0);
            flag = true;
        }
        if (!flag && servicestate != null)
        {
            int j = servicestate.getRegState();
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), regState=").append(j).toString());
            if (j == 2)
            {
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append(" searching state hasService= ").append(hasService(i)).toString());
                aiconidwrapper[0].setResources(null);
                aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                flag = true;
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), searching").toString());
            }
            if (!flag && (servicestate == null || !hasService(i) && !servicestate.isEmergencyOnly()))
            {
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append(") tempServiceState = ").append(servicestate).toString());
                if (isSimInserted(i))
                {
                    Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("SimIndicatorState = ").append(SIMHelper.getSimIndicatorStateGemini(i)).toString());
                    if (1 == SIMHelper.getSimIndicatorStateGemini(i))
                    {
                        aiconidwrapper[0].setResources(null);
                        aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                        flag = true;
                    }
                }
            }
            if (!flag)
            {
                boolean flag1 = hasService(i);
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateTelephonySignalStrength(").append(i).append("), hasService=").append(flag1).toString());
                if (!flag1)
                {
                    aiconidwrapper[0].setResources(null);
                    aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                } else
                if (signalstrength == null)
                {
                    aiconidwrapper[0].setResources(null);
                    aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                    s = mContext.getString(AccessibilityContentDescriptions.PHONE_SIGNAL_STRENGTH[0]);
                } else
                {
                    int ai[] = {
                        0, 0
                    };
                    ai[0] = signalstrength.getLevel();
                    NetworkType networktype = mDataNetType3G[i];
                    iconidwrapper1.setResources(null);
                    iconidwrapper1.setIconId(TelephonyIconsGemini.getTelephonySignalNetworkTypeIcon(networktype));
                    aiconidwrapper[0].setResources(null);
                    if (ai[0] < 6)
                        aiconidwrapper[0].setIconId(TelephonyIconsGemini.getTelephonySignalStrengthIcon(i, ai[0]));
                    if (ai[0] < 6)
                        s = mContext.getString(AccessibilityContentDescriptions.PHONE_SIGNAL_STRENGTH[ai[0]]);
                    iconidwrapper = aiconidwrapper[0].clone();
                }
            }
            mDataSignalIconId[i] = iconidwrapper.clone();
            mContentDescriptionPhoneSignal[i] = s;
            mPhoneSignalIconId[i][0] = aiconidwrapper[0].clone();
            mPhoneSignalIconId[i][1] = aiconidwrapper[1].clone();
            mDataTypeIconId[i] = iconidwrapper1.clone();
            for (Iterator iterator = mSignalClusters.iterator(); iterator.hasNext(); ((SignalCluster)iterator.next()).setRoamingFlagandResource(mIsRoaming, mIsRoamingId));
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
                i = 0x7f020230;
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
                    int i = WifiManager.calculateSignalLevel(wifiinfo.getRssi(), WifiIcons.WIFI_LEVEL_COUNT);
                    if (i != mWifiLevel)
                        mWifiLevel = i;
                }
            }
        } else
        if (s.equals("android.net.wifi.RSSI_CHANGED"))
        {
            mWifiRssi = intent.getIntExtra("newRssi", -200);
            mWifiLevel = WifiManager.calculateSignalLevel(mWifiRssi, WifiIcons.WIFI_LEVEL_COUNT);
        }
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateWifiState: mWifiLevel = ").append(mWifiLevel).append("  mWifiRssi=").append(mWifiRssi).append(" mWifiConnected is ").append(mWifiConnected).toString());
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
        updateDataNetType(0);
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
        printwriter.println("NetworkControllerCoolpad state:");
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
        printwriter.println("------ telephony ------");
        for (int i = 0; i < mGeminiSimNum; i++)
        {
            Object aobj6[] = new Object[1];
            aobj6[0] = Integer.valueOf(i);
            printwriter.println(String.format("====== SlotId: %d ======", aobj6));
            printwriter.print("  hasService =");
            printwriter.println(hasService(i));
            printwriter.print("  mDataConnected =");
            printwriter.println(mDataConnected[i]);
            printwriter.print("  mSimState =");
            printwriter.println(mSimState[i]);
            printwriter.print("  mDataState =");
            printwriter.println(mDataState[i]);
            printwriter.print("  mDataActivity =");
            printwriter.println(mDataActivity[i]);
            printwriter.print("  mDataNetType =");
            printwriter.print(mDataNetType[i]);
            printwriter.print("/");
            printwriter.println(TelephonyManager.getNetworkTypeName(mDataNetType[i]));
            printwriter.print("  mServiceState =");
            printwriter.println(mServiceState[i]);
            printwriter.print("  mSignalStrength =");
            printwriter.println(mSignalStrength[i]);
            printwriter.print("  mNetworkName =");
            printwriter.println(mNetworkName[i]);
            printwriter.print("  mPhoneSignalIconId =0x");
            printwriter.print(Integer.toHexString(mPhoneSignalIconId[i][0].getIconId()));
            printwriter.print("/");
            printwriter.println(getResourceName(mPhoneSignalIconId[i][0].getIconId()));
            printwriter.print("  mDataDirectionIconId =");
            printwriter.print(Integer.toHexString(mDataDirectionIconId[i]));
            printwriter.print("/");
            printwriter.println(getResourceName(mDataDirectionIconId[i]));
            printwriter.print("  mDataSignalIconId =");
            printwriter.print(Integer.toHexString(mDataSignalIconId[i].getIconId()));
            printwriter.print("/");
            printwriter.println(getResourceName(mDataSignalIconId[i].getIconId()));
            printwriter.print("  mDataTypeIconId =");
            printwriter.print(Integer.toHexString(mDataTypeIconId[i].getIconId()));
            printwriter.print("/");
            printwriter.println(getResourceName(mDataTypeIconId[i].getIconId()));
            printwriter.print("  mLastPhoneSignalIconId[0]=0x");
            printwriter.print(Integer.toHexString(mLastPhoneSignalIconId[i][0]));
            printwriter.print("/");
            printwriter.println(getResourceName(mLastPhoneSignalIconId[i][0]));
            printwriter.print("  mLastPhoneSignalIconId[1]=0x");
            printwriter.print(Integer.toHexString(mLastPhoneSignalIconId[i][1]));
            printwriter.print("/");
            printwriter.println(getResourceName(mLastPhoneSignalIconId[i][1]));
            printwriter.print("  mLastDataTypeIconId =0x");
            printwriter.print(Integer.toHexString(mLastDataTypeIconId[i]));
            printwriter.print("/");
            printwriter.println(getResourceName(mLastDataTypeIconId[i]));
        }

        printwriter.println("------ wifi ------");
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
            printwriter.println("------ wimax ------");
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
        printwriter.println("------ Bluetooth ----");
        printwriter.print("  mBtReverseTethered=");
        printwriter.println(mBluetoothTethered);
        printwriter.println("------ connectivity ------");
        printwriter.print("  mInetCondition=");
        printwriter.println(mInetCondition);
        printwriter.println("------ icons ------");
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
        printwriter.print("  mLastCombinedLabel=");
        printwriter.print(mLastCombinedLabel);
        printwriter.println("");
    }

    public boolean hasMobileDataFeature()
    {
        return mHasMobileDataFeature;
    }

    public void hideSimIndicator(int i)
    {
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("hideSimIndicator slotId is ").append(i).toString());
        mSimIndicatorFlag[i] = false;
        updateTelephonySignalStrength(i);
        updateDataNetType(i);
        updateDataIcon(i);
        refreshViews(i);
    }

    boolean isCdmaEri(int i)
    {
label0:
        {
            ServiceState servicestate = mServiceState[i];
            if (servicestate != null && servicestate.getCdmaEriIconIndex() != 1)
            {
                int j = servicestate.getCdmaEriIconMode();
                if (j == 0 || j == 1)
                    break label0;
            }
            return false;
        }
        return true;
    }

    public boolean isEmergencyOnly()
    {
        ServiceState servicestate = mServiceState[0];
        boolean flag = false;
        if (servicestate != null)
        {
            boolean flag1 = mServiceState[0].isEmergencyOnly();
            flag = false;
            if (flag1)
                flag = true;
        }
        return flag;
    }

    public void onReceive(Context context, Intent intent)
    {
label0:
        {
            String s = intent.getAction();
            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("onReceive, intent action is ").append(s).toString());
            if (!s.equals("android.net.wifi.RSSI_CHANGED") && !s.equals("android.net.wifi.WIFI_STATE_CHANGED") && !s.equals("android.net.wifi.STATE_CHANGE"))
            {
                if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
                {
                    int i1 = intent.getIntExtra("simId", 0);
                    updateSimState(i1, intent);
                    updateDataIcon(i1);
                    refreshViews(i1);
                    return;
                }
                if (s.equals("android.provider.Telephony.SPN_STRINGS_UPDATED"))
                {
                    int l = intent.getIntExtra("simId", 0);
                    updateNetworkName(l, intent.getBooleanExtra("showSpn", false), intent.getStringExtra("spn"), intent.getBooleanExtra("showPlmn", false), intent.getStringExtra("plmn"));
                    refreshViews(l);
                    return;
                }
                if (!s.equals("android.net.conn.CONNECTIVITY_CHANGE") && !s.equals("android.net.conn.INET_CONDITION_ACTION"))
                {
                    if (s.equals("android.intent.action.CONFIGURATION_CHANGED"))
                    {
                        refreshViews();
                        return;
                    }
                    if (!s.equals("android.intent.action.AIRPLANE_MODE") && !s.equals("android.intent.action.ACTION_PREBOOT_IPO"))
                    {
                        if (!s.equals("android.net.fourG.NET_4G_STATE_CHANGED") && !s.equals("android.net.wimax.SIGNAL_LEVEL_CHANGED") && !s.equals("android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"))
                        {
                            if (s.equals("android.intent.action.SIM_SETTING_INFO_CHANGED"))
                            {
                                SIMHelper.updateSIMInfos(context);
                                int k = intent.getIntExtra("type", -1);
                                intent.getLongExtra("simid", -1L);
                                if (k == 1)
                                {
                                    updateDataNetType();
                                    updateTelephonySignalStrength();
                                    updateOperatorInfo();
                                }
                                refreshViews();
                                return;
                            }
                            if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                            {
                                int j = intent.getIntExtra("slotId", -1);
                                updateDataNetType(j);
                                updateTelephonySignalStrength(j);
                                updateOperatorInfo();
                                refreshViews();
                                return;
                            }
                            if (s.equals("android.intent.action.SIM_INSERTED_STATUS"))
                            {
                                SIMHelper.updateSIMInfos(context);
                                updateDataNetType();
                                updateTelephonySignalStrength();
                                updateOperatorInfo();
                                refreshViews();
                                return;
                            }
                            if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                            {
                                Xlog.d("NetworkControllerCoolpad", "onReceive from TelephonyIntents.ACTION_SIM_INFO_UPDATE");
                                mSimCardReady = true;
                                SIMHelper.updateSIMInfos(context);
                                updateDataNetType();
                                updateTelephonySignalStrength();
                                updateOperatorInfo();
                                refreshViews();
                                return;
                            }
                            if (s.equals("android.intent.action.ACTION_SHUTDOWN_IPO"))
                            {
                                Xlog.d("NetworkControllerCoolpad", "onReceive from android.intent.action.ACTION_SHUTDOWN_IPO");
                                mSimCardReady = false;
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
                        updateAirplaneMode();
                        refreshViews();
                        return;
                    }
                    break label0;
                }
                if (s.equals("android.net.conn.CONNECTIVITY_CHANGE"))
                {
                    NetworkInfo networkinfo = (NetworkInfo)intent.getExtra("networkInfo");
                    if (networkinfo == null)
                    {
                        Xlog.d("NetworkControllerCoolpad", "onReceive, ConnectivityManager.CONNECTIVITY_ACTION networkinfo is null.");
                        return;
                    }
                    int i = networkinfo.getType();
                    Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("onReceive, ConnectivityManager.CONNECTIVITY_ACTION network type is ").append(i).toString());
                    if (i != -1 && i != 0 && i != 7 && i != 1 && i != 9)
                        break label0;
                }
                updateConnectivity(intent);
                updateOperatorInfo();
                refreshViews();
                return;
            }
            updateWifiState(intent);
            refreshViews();
        }
    }

    public void refreshSignalCluster(SignalCluster signalcluster)
    {
        signalcluster.setRoamingFlagandResource(mIsRoaming, mIsRoamingId);
        boolean flag;
        if (!mWifiEnabled || !mWifiConnected && mHasMobileDataFeature)
            flag = false;
        else
            flag = true;
        signalcluster.setWifiIndicators(flag, mWifiIconId, mWifiActivityIconId, mContentDescriptionWifi);
        if (mIsWimaxEnabled && mWimaxConnected)
        {
            IconIdWrapper aiconidwrapper[];
            if (mAlwaysShowCdmaRssi)
            {
                aiconidwrapper = mPhoneSignalIconId[0];
            } else
            {
                aiconidwrapper = new IconIdWrapper[2];
                aiconidwrapper[0] = new IconIdWrapper(mWimaxIconId);
                aiconidwrapper[1] = new IconIdWrapper();
            }
            signalcluster.setMobileDataIndicators(0, true, aiconidwrapper, mMobileActivityIconId[0], mDataTypeIconId[0], mContentDescriptionWimax, mContentDescriptionDataType[0]);
        } else
        {
            for (int i = 0; i < mGeminiSimNum; i++)
                signalcluster.setMobileDataIndicators(i, mHasMobileDataFeature, mPhoneSignalIconId[i], mMobileActivityIconId[i], mDataTypeIconId[i], mContentDescriptionPhoneSignal[i], mContentDescriptionDataType[i]);

        }
        signalcluster.setIsAirplaneMode(mAirplaneMode);
        mLastAirplaneMode = mAirplaneMode;
        signalcluster.apply();
    }

    void refreshViews()
    {
        for (int i = 0; i < mGeminiSimNum; i++)
            refreshViews(i);

    }

    void refreshViews(int i)
    {
        IconIdWrapper iconidwrapper1;
        String s;
        boolean flag;
        String s3;
        String s5;
        String s6;
        IconIdWrapper iconidwrapper3;
        IconIdWrapper iconidwrapper4;
        int j1;
        int k1;
label0:
        {
            Context context = mContext;
            IconIdWrapper iconidwrapper = new IconIdWrapper();
            iconidwrapper1 = new IconIdWrapper();
            s = "";
            flag = isEmergencyOnly();
            new IconIdWrapper();
            IconIdWrapper aiconidwrapper[] = new IconIdWrapper[2];
            aiconidwrapper[0] = new IconIdWrapper();
            aiconidwrapper[1] = new IconIdWrapper();
            String s1 = "";
            SignalStrength _tmp = mSignalStrength[i];
            ServiceState servicestate = mServiceState[i];
            boolean flag1 = mDataConnected[i];
            int j = mDataActivity[i];
            NetworkType networktype = mDataNetType3G[i];
            IconIdWrapper iconidwrapper2 = mDataSignalIconId[i].clone();
            String s2 = mContentDescriptionPhoneSignal[i];
            s3 = mContentDescriptionDataType[i];
            aiconidwrapper[0] = mPhoneSignalIconId[i][0].clone();
            aiconidwrapper[1] = mPhoneSignalIconId[i][1].clone();
            String s4 = mNetworkName[i];
            if (!mHasMobileDataFeature)
            {
                iconidwrapper2.setResources(null);
                iconidwrapper2.setIconId(0);
                aiconidwrapper[0].setResources(null);
                aiconidwrapper[0].setIconId(0);
                aiconidwrapper[1].setResources(null);
                aiconidwrapper[1].setIconId(0);
                s5 = "";
            } else
            {
                if (!mIsScreenLarge)
                {
                    if (mDataConnected[0])
                        s5 = s4;
                    else
                    if (!mConnected && !flag)
                        s5 = context.getString(0x7f0b00a6);
                    else
                    if (!hasService(i) && !flag)
                        s5 = "";
                    else
                        s5 = s4;
                } else
                if (hasService(i))
                    s5 = s4;
                else
                    s5 = "";
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), DataConnected=").append(flag1).toString());
                if (flag1)
                {
                    iconidwrapper2.clone();
                    IconIdWrapper iconidwrapper5 = new IconIdWrapper();
                    iconidwrapper5.setResources(null);
                    switch (j)
                    {
                    case 3: // '\003'
                        iconidwrapper5.setIconId(TelephonyIconsGemini.getTelephonySignalDataActivityIcon(4, GetCurNetWorkTypeForSignal(i)));
                        break;

                    case 2: // '\002'
                        iconidwrapper5.setIconId(TelephonyIconsGemini.getTelephonySignalDataActivityIcon(3, GetCurNetWorkTypeForSignal(i)));
                        break;

                    case 1: // '\001'
                        iconidwrapper5.setIconId(TelephonyIconsGemini.getTelephonySignalDataActivityIcon(2, GetCurNetWorkTypeForSignal(i)));
                        break;

                    default:
                        iconidwrapper5.setIconId(TelephonyIconsGemini.getTelephonySignalDataActivityIcon(1, GetCurNetWorkTypeForSignal(i)));
                        break;
                    }
                    s = s5;
                    iconidwrapper1 = iconidwrapper5.clone();
                    iconidwrapper = iconidwrapper2.clone();
                    s1 = s3;
                    mMobileActivityIconId[i] = iconidwrapper5.clone();
                    int i8 = 0;
                    do
                    {
                        int j8 = mGeminiSimNum;
                        if (i8 >= j8)
                            break;
                        if (i8 == i)
                        {
                            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), mMobileActivityIconId=").append(mMobileActivityIconId[i8].getIconId()).toString());
                        } else
                        {
                            mMobileActivityIconId[i8].setResources(null);
                            mMobileActivityIconId[i8].setIconId(0);
                            Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), mMobileActivityIconId=").append(mMobileActivityIconId[i8].getIconId()).toString());
                        }
                        i8++;
                    } while (true);
                } else
                {
                    iconidwrapper1.setResources(null);
                    iconidwrapper1.setIconId(0);
                    mMobileActivityIconId[i].setResources(null);
                    mMobileActivityIconId[i].setIconId(0);
                    int k = 0;
                    do
                    {
                        int l = mGeminiSimNum;
                        if (k >= l)
                            break;
                        if (k != i)
                        {
                            mMobileActivityIconId[i].setResources(null);
                            mMobileActivityIconId[i].setIconId(0);
                        }
                        k++;
                    } while (true);
                }
            }
            if (mWifiConnected)
            {
                if (mWifiSsid == null)
                {
                    s6 = context.getString(0x7f0b00a7);
                    mWifiActivityIconId = 0;
                } else
                {
                    s6 = mWifiSsid;
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
                s = s6;
                iconidwrapper1.setResources(null);
                iconidwrapper1.setIconId(mWifiActivityIconId);
                iconidwrapper.setResources(null);
                iconidwrapper.setIconId(mWifiIconId);
                s1 = mContentDescriptionWifi;
            } else
            if (mHasMobileDataFeature)
                s6 = "";
            else
                s6 = context.getString(0x7f0b00a6);
            if (mBluetoothTethered)
            {
                s = mContext.getString(0x7f0b005c);
                iconidwrapper.setResources(null);
                iconidwrapper.setIconId(mBluetoothTetherIconId);
                s1 = mContext.getString(0x7f0b009a);
            }
            boolean flag2;
            if (mConnectedNetworkType == 9)
                flag2 = true;
            else
                flag2 = false;
            if (flag2)
                s = mConnectedNetworkTypeName;
            if (!mAirplaneMode || servicestate != null && (hasService(i) || servicestate.isEmergencyOnly()))
            {
                if (!flag1 && !mWifiConnected && !mBluetoothTethered && !mWimaxConnected && !flag2)
                {
                    s = context.getString(0x7f0b00a6);
                    if (!mIsScreenLarge)
                    {
                        if (mHasMobileDataFeature)
                        {
                            iconidwrapper = iconidwrapper2.clone();
                        } else
                        {
                            iconidwrapper.setResources(null);
                            iconidwrapper.setIconId(mWifiIconId);
                        }
                        if (mHasMobileDataFeature)
                            s1 = s3;
                        else
                            s1 = mContentDescriptionWifi;
                    } else
                    if (mHasMobileDataFeature)
                    {
                        iconidwrapper.setResources(null);
                        iconidwrapper.setIconId(mWifiIconId);
                        s1 = mContentDescriptionWifi;
                    } else
                    if (i == 1 && mDataConnected[0])
                    {
                        s = mNetworkName[0];
                        iconidwrapper = mDataSignalIconId[0].clone();
                        s1 = mContentDescriptionDataType[0];
                    } else
                    if (i == 0 && mDataConnected[1])
                    {
                        s = mNetworkName[1];
                        iconidwrapper = mDataSignalIconId[1].clone();
                        s1 = mContentDescriptionDataType[1];
                    } else
                    {
                        iconidwrapper.setResources(null);
                        iconidwrapper.setIconId(mWifiIconId);
                        s1 = s3;
                    }
                    new IconIdWrapper();
                    com.android.internal.telephony.IccCardConstants.State _tmp1 = mSimState[i];
                    if (mPhone.isNetworkRoaming(i))
                    {
                        mIsRoaming[i] = true;
                        mIsRoamingId[i] = TelephonyIconsGemini.getTelephonySignalRoamingIcon(i);
                    } else
                    {
                        mIsRoaming[i] = false;
                        mIsRoamingId[i] = 0;
                    }
                }
            } else
            {
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), AirplaneMode=").append(mAirplaneMode).toString());
                s2 = mContext.getString(0x7f0b009b);
                if (isSimInserted(i))
                {
                    mDataSignalIconId[i].setResources(null);
                    mDataSignalIconId[i].setIconId(0x7f0201d7);
                    iconidwrapper2 = mDataSignalIconId[i].clone();
                    mPhoneSignalIconId[i][0].setResources(null);
                    mPhoneSignalIconId[i][0].setIconId(TelephonyIconsGemini.getTelephonySignalNullIcon(i));
                    mDataTypeIconId[i].setResources(null);
                    mDataTypeIconId[i].setIconId(0);
                }
                if (mWifiConnected)
                {
                    s5 = "";
                } else
                {
                    if (mHasMobileDataFeature)
                    {
                        s6 = "";
                    } else
                    {
                        s6 = context.getString(0x7f0b00a6);
                        s = s6;
                    }
                    s1 = s2;
                    iconidwrapper = iconidwrapper2.clone();
                }
            }
            new IconIdWrapper();
            new IconIdWrapper();
            int i1 = mDataDirectionIconId[i];
            aiconidwrapper[0] = mPhoneSignalIconId[i][0].clone();
            aiconidwrapper[1] = mPhoneSignalIconId[i][1].clone();
            iconidwrapper3 = mDataTypeIconId[i].clone();
            iconidwrapper4 = mMobileActivityIconId[i].clone();
            int ai[] = mLastPhoneSignalIconId[i];
            j1 = mLastDataTypeIconId[i];
            k1 = mLastMobileActivityIconId[i];
            if (ai[0] != aiconidwrapper[0].getIconId() || ai[1] != aiconidwrapper[1].getIconId() || mLastDataDirectionOverlayIconId != iconidwrapper1.getIconId() || mLastWifiIconId != mWifiIconId || mLastWimaxIconId != mWimaxIconId || j1 != iconidwrapper3.getIconId() || k1 != iconidwrapper4.getIconId() || mLastAirplaneMode != mAirplaneMode)
            {
                Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), set parameters to signal cluster view.").toString());
                for (Iterator iterator = mSignalClusters.iterator(); iterator.hasNext();)
                {
                    SignalCluster signalcluster1 = (SignalCluster)iterator.next();
                    signalcluster1.setWifiIndicators(mWifiConnected, mWifiIconId, mWifiActivityIconId, mContentDescriptionWifi);
                    Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("refreshViews(").append(i).append("), tempPhoneSignalIconId.0 = ").append(aiconidwrapper[0].getIconId()).append("  tempPhoneSignalIconId.1 = ").append(aiconidwrapper[1].getIconId()).append("  tempMobileActivityIconId= ").append(iconidwrapper4.getIconId()).append("  tempDataTypeIconId= ").append(iconidwrapper3.getIconId()).toString());
                    signalcluster1.setMobileDataIndicators(i, mHasMobileDataFeature, aiconidwrapper, iconidwrapper4, iconidwrapper3, s2, s3);
                    signalcluster1.setIsAirplaneMode(mAirplaneMode);
                    mLastAirplaneMode = mAirplaneMode;
                }

            }
            SignalCluster signalcluster;
            for (Iterator iterator1 = mSignalClusters.iterator(); iterator1.hasNext(); signalcluster.setDataNetType3G(i, networktype))
            {
                signalcluster = (SignalCluster)iterator1.next();
                signalcluster.setRoamingFlagandResource(mIsRoaming, mIsRoamingId);
                signalcluster.setShowSimIndicator(i, mSimIndicatorFlag[i], mSimIndicatorResId[i]);
            }

            for (Iterator iterator2 = mSignalClusters.iterator(); iterator2.hasNext(); ((SignalCluster)iterator2.next()).apply());
            if (!mIsScreenLarge)
            {
                if (ai[0] != aiconidwrapper[0].getIconId() || ai[1] != aiconidwrapper[1].getIconId())
                {
                    mLastPhoneSignalIconId[i][0] = aiconidwrapper[0].getIconId();
                    mLastPhoneSignalIconId[i][1] = aiconidwrapper[1].getIconId();
                    int k7 = mPhoneSignalIconViews.size();
                    for (int l7 = 0; l7 < k7; l7++)
                    {
                        ImageView imageview8 = (ImageView)mPhoneSignalIconViews.get(l7);
                        if (aiconidwrapper[0].getIconId() == 0)
                        {
                            imageview8.setVisibility(8);
                        } else
                        {
                            imageview8.setVisibility(0);
                            if (aiconidwrapper[0].getResources() != null)
                                imageview8.setImageDrawable(aiconidwrapper[0].getDrawable());
                            else
                            if (aiconidwrapper[0].getIconId() == 0)
                                imageview8.setImageDrawable(null);
                            else
                                imageview8.setImageResource(aiconidwrapper[0].getIconId());
                            imageview8.setContentDescription(s2);
                        }
                    }

                }
            } else
            if (ai[0] != aiconidwrapper[0].getIconId() || ai[1] != aiconidwrapper[1].getIconId())
            {
                mLastPhoneSignalIconId[i][0] = aiconidwrapper[0].getIconId();
                mLastPhoneSignalIconId[i][1] = aiconidwrapper[1].getIconId();
                ImageView imageview = (ImageView)mPhoneSignalIconViews.get(i);
                if (imageview != null)
                    if (aiconidwrapper[0].getIconId() != 0 && hasService(i))
                    {
                        imageview.setVisibility(0);
                        if (aiconidwrapper[0].getResources() != null)
                            imageview.setImageDrawable(aiconidwrapper[0].getDrawable());
                        else
                        if (aiconidwrapper[0].getIconId() == 0)
                            imageview.setImageDrawable(null);
                        else
                            imageview.setImageResource(aiconidwrapper[0].getIconId());
                        imageview.setContentDescription(s2);
                    } else
                    {
                        imageview.setVisibility(8);
                    }
            }
            if (mLastDataDirectionIconId != i1)
            {
                mLastDataDirectionIconId = i1;
                int i7 = mDataDirectionIconViews.size();
                for (int j7 = 0; j7 < i7; j7++)
                {
                    ImageView imageview7 = (ImageView)mDataDirectionIconViews.get(j7);
                    if (i1 == 0)
                    {
                        if (!mIsScreenLarge)
                            imageview7.setVisibility(4);
                        else
                            imageview7.setVisibility(8);
                    } else
                    {
                        imageview7.setVisibility(0);
                        imageview7.setImageResource(i1);
                        imageview7.setContentDescription(s3);
                    }
                }

            }
            if (mLastWifiIconId != mWifiIconId)
            {
                mLastWifiIconId = mWifiIconId;
                int k6 = mWifiIconViews.size();
                for (int l6 = 0; l6 < k6; l6++)
                {
                    ImageView imageview6 = (ImageView)mWifiIconViews.get(l6);
                    if (mWifiIconId == 0)
                    {
                        imageview6.setVisibility(8);
                    } else
                    {
                        imageview6.setVisibility(0);
                        imageview6.setImageResource(mWifiIconId);
                        imageview6.setContentDescription(mContentDescriptionWifi);
                    }
                }

            }
            if (mLastWimaxIconId != mWimaxIconId)
            {
                mLastWimaxIconId = mWimaxIconId;
                int i6 = mWimaxIconViews.size();
                for (int j6 = 0; j6 < i6; j6++)
                {
                    ImageView imageview5 = (ImageView)mWimaxIconViews.get(j6);
                    if (mWimaxIconId == 0)
                    {
                        imageview5.setVisibility(8);
                    } else
                    {
                        imageview5.setVisibility(0);
                        imageview5.setImageResource(mWimaxIconId);
                        imageview5.setContentDescription(mContentDescriptionWimax);
                    }
                }

            }
            if (mLastCombinedSignalIconId == iconidwrapper.getIconId())
                break label0;
            mLastCombinedSignalIconId = iconidwrapper.getIconId();
            int l4 = mCombinedSignalIconViews.size();
label1:
            for (int i5 = 0; i5 < l4; i5++)
            {
                ImageView imageview4 = (ImageView)mCombinedSignalIconViews.get(i5);
                if (!mIsScreenLarge)
                {
                    if (iconidwrapper.getResources() != null)
                        imageview4.setImageDrawable(iconidwrapper.getDrawable());
                    else
                    if (iconidwrapper.getIconId() == 0)
                        imageview4.setImageDrawable(null);
                    else
                        imageview4.setImageResource(iconidwrapper.getIconId());
                    imageview4.setContentDescription(s1);
                    continue;
                }
                if (mWifiConnected)
                {
                    int j5 = 0;
                    do
                    {
label2:
                        {
                            int k5 = mGeminiSimNum;
                            int l5 = j5;
                            boolean flag3 = false;
                            if (l5 < k5)
                            {
                                if (!mDataConnected[j5])
                                    break label2;
                                flag3 = true;
                            }
                            if (flag3)
                            {
                                imageview4.setVisibility(0);
                                if (iconidwrapper.getResources() != null)
                                    imageview4.setImageDrawable(iconidwrapper.getDrawable());
                                else
                                if (iconidwrapper.getIconId() == 0)
                                    imageview4.setImageDrawable(null);
                                else
                                    imageview4.setImageResource(iconidwrapper.getIconId());
                                imageview4.setContentDescription(s1);
                            }
                            imageview4.setContentDescription(s1);
                            continue label1;
                        }
                        j5++;
                    } while (true);
                }
                imageview4.setVisibility(8);
            }

        }
        if (!mIsScreenLarge)
        {
            if (j1 != iconidwrapper3.getIconId() || mWifiConnected && mIsScreenLarge)
            {
                mLastDataTypeIconId[i] = iconidwrapper3.getIconId();
                int j4 = mDataTypeIconViews.size();
                for (int k4 = 0; k4 < j4; k4++)
                {
                    ImageView imageview3 = (ImageView)mDataTypeIconViews.get(k4);
                    if (iconidwrapper3.getIconId() == 0 && mIsScreenLarge)
                        imageview3.setVisibility(8);
                    else
                    if (!mIsScreenLarge || iconidwrapper3.getIconId() != 0 && !mWifiConnected)
                    {
                        imageview3.setVisibility(0);
                        if (iconidwrapper3.getResources() != null)
                            imageview3.setImageDrawable(iconidwrapper3.getDrawable());
                        else
                        if (iconidwrapper3.getIconId() == 0)
                            imageview3.setImageDrawable(null);
                        else
                            imageview3.setImageResource(iconidwrapper3.getIconId());
                        imageview3.setContentDescription(s3);
                    } else
                    {
                        imageview3.setVisibility(8);
                    }
                }

            }
        } else
        {
            mLastDataTypeIconId[i] = iconidwrapper3.getIconId();
            ImageView imageview1 = (ImageView)mDataTypeIconViews.get(i);
            if (j1 != iconidwrapper3.getIconId() || mWifiConnected && mIsScreenLarge)
                if (iconidwrapper3.getIconId() == 0 && mIsScreenLarge)
                    imageview1.setVisibility(8);
                else
                if (!mIsScreenLarge || iconidwrapper3.getIconId() != 0 && !mWifiConnected)
                {
                    imageview1.setVisibility(0);
                    if (iconidwrapper3.getResources() != null)
                        imageview1.setImageDrawable(iconidwrapper3.getDrawable());
                    else
                    if (iconidwrapper3.getIconId() == 0)
                        imageview1.setImageDrawable(null);
                    else
                        imageview1.setImageResource(iconidwrapper3.getIconId());
                    imageview1.setContentDescription(s3);
                } else
                {
                    imageview1.setVisibility(8);
                }
        }
        if (k1 != iconidwrapper4.getIconId())
            mLastMobileActivityIconId[i] = iconidwrapper4.getIconId();
        if (mLastDataDirectionOverlayIconId != iconidwrapper1.getIconId())
        {
            mLastDataDirectionOverlayIconId = iconidwrapper1.getIconId();
            int l3 = mDataDirectionOverlayIconViews.size();
            for (int i4 = 0; i4 < l3; i4++)
            {
                ImageView imageview2 = (ImageView)mDataDirectionOverlayIconViews.get(i4);
                if (iconidwrapper1.getIconId() == 0)
                {
                    if (!mIsScreenLarge)
                        imageview2.setVisibility(4);
                    else
                        imageview2.setVisibility(8);
                    continue;
                }
                imageview2.setVisibility(0);
                if (iconidwrapper1.getResources() != null)
                    imageview2.setImageDrawable(iconidwrapper1.getDrawable());
                else
                if (iconidwrapper1.getIconId() == 0)
                    imageview2.setImageDrawable(null);
                else
                    imageview2.setImageResource(iconidwrapper1.getIconId());
                imageview2.setContentDescription(s3);
            }

        }
        if (!mLastCombinedLabel.equals(s))
        {
            mLastCombinedLabel = s;
            int j3 = mCombinedLabelViews.size();
            for (int k3 = 0; k3 < j3; k3++)
                ((TextView)mCombinedLabelViews.get(k3)).setText(s);

        }
        int l1 = mWifiLabelViews.size();
        for (int i2 = 0; i2 < l1; i2++)
        {
            TextView textview3 = (TextView)mWifiLabelViews.get(i2);
            if ("".equals(s6))
            {
                textview3.setVisibility(8);
            } else
            {
                textview3.setVisibility(0);
                textview3.setText(s6);
            }
        }

        if (!mIsScreenLarge)
        {
            int l2 = mMobileLabelViews.size();
            for (int i3 = 0; i3 < l2; i3++)
            {
                TextView textview2 = (TextView)mMobileLabelViews.get(i3);
                if ("".equals(s5))
                {
                    textview2.setVisibility(8);
                } else
                {
                    textview2.setVisibility(0);
                    textview2.setText(s5);
                }
            }

        } else
        {
            TextView textview;
            if (i == 0)
                textview = (TextView)mMobileLabelViews.get(0);
            else
                textview = (TextView)mMobileLabelViews.get(1);
            if (textview != null)
                if ("".equals(s5))
                {
                    textview.setVisibility(8);
                } else
                {
                    textview.setVisibility(0);
                    textview.setText(s5);
                }
        }
        int j2 = mEmergencyLabelViews.size();
        for (int k2 = 0; k2 < j2; k2++)
        {
            TextView textview1 = (TextView)mEmergencyLabelViews.get(k2);
            if (!flag)
            {
                textview1.setVisibility(8);
            } else
            {
                textview1.setText(s5);
                textview1.setVisibility(0);
            }
        }

    }

    public void setCarrierGemini(CarrierLabelGemini carrierlabelgemini, CarrierLabelGemini carrierlabelgemini1, View view)
    {
        mCarrierList.clear();
        mCarrierList.add(carrierlabelgemini);
        mCarrierList.add(carrierlabelgemini1);
        mDividerList.clear();
        mDividerList.add(view);
    }

    public void setCarrierGemini(CarrierLabelGemini carrierlabelgemini, CarrierLabelGemini carrierlabelgemini1, CarrierLabelGemini carrierlabelgemini2, View view, View view1)
    {
        mCarrierList.clear();
        mCarrierList.add(carrierlabelgemini);
        mCarrierList.add(carrierlabelgemini1);
        mCarrierList.add(carrierlabelgemini2);
        mDividerList.clear();
        mDividerList.add(view);
        mDividerList.add(view1);
    }

    public void setCarrierGemini(CarrierLabelGemini carrierlabelgemini, CarrierLabelGemini carrierlabelgemini1, CarrierLabelGemini carrierlabelgemini2, CarrierLabelGemini carrierlabelgemini3, View view, View view1, View view2)
    {
        mCarrierList.clear();
        mCarrierList.add(carrierlabelgemini);
        mCarrierList.add(carrierlabelgemini1);
        mCarrierList.add(carrierlabelgemini2);
        mCarrierList.add(carrierlabelgemini3);
        mDividerList.clear();
        mDividerList.add(view);
        mDividerList.add(view1);
        mDividerList.add(view2);
    }

    public void setStackedMode(boolean flag)
    {
        mDataAndWifiStacked = true;
    }

    public void showSimIndicator(int i)
    {
        int j = SIMHelper.getSIMColorIdBySlot(mContext, i);
        if (j > -1 && j < 4)
            mSimIndicatorResId[i] = TelephonyIcons.SIM_INDICATOR_BACKGROUND[j];
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("showSimIndicator slotId is ").append(i).append(" simColor = ").append(j).toString());
        mSimIndicatorFlag[i] = true;
        updateTelephonySignalStrength(i);
        updateDataNetType(i);
        updateDataIcon(i);
        refreshViews(i);
    }

    void updateNetworkName(int i, boolean flag, String s, boolean flag1, String s1)
    {
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateNetworkName(").append(i).append("), showSpn=").append(flag).append(" spn=").append(s).append(" showPlmn=").append(flag1).append(" plmn=").append(s1).toString());
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
            mNetworkName[i] = stringbuilder.toString();
        else
            mNetworkName[i] = mNetworkNameDefault;
        Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateNetworkName(").append(i).append("), mNetworkName=").append(mNetworkName[i]).toString());
    }

    public void updateOperatorInfo()
    {
        if (mCarrierList.size() > 0 && mDividerList.size() > 0)
        {
            for (Iterator iterator = mCarrierList.iterator(); iterator.hasNext();)
                if ((CarrierLabelGemini)iterator.next() == null)
                    return;

            Iterator iterator1 = mDividerList.iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                View view = (View)iterator1.next();
                if (view != null)
                    view.setVisibility(8);
            } while (true);
            if (isWifiOnlyDevice())
            {
                Iterator iterator2 = mCarrierList.iterator();
                do
                {
                    if (!iterator2.hasNext())
                        break;
                    CarrierLabelGemini carrierlabelgemini4 = (CarrierLabelGemini)iterator2.next();
                    if (carrierlabelgemini4 != null)
                        carrierlabelgemini4.setVisibility(8);
                } while (true);
            } else
            {
                int i = 0;
                CarrierLabelGemini carrierlabelgemini = null;
                CarrierLabelGemini carrierlabelgemini1 = null;
                for (int j = 0; j < mCarrierList.size(); j++)
                {
                    CarrierLabelGemini carrierlabelgemini3 = (CarrierLabelGemini)mCarrierList.get(j);
                    if (carrierlabelgemini3 == null)
                        continue;
                    boolean flag = isSimInserted(carrierlabelgemini3.getSlotId());
                    Xlog.d("NetworkControllerCoolpad", (new StringBuilder()).append("updateOperatorInfo, simInserted is ").append(flag).append(", SIM slod id is ").append(carrierlabelgemini3.getSlotId()).append(".").toString());
                    if (flag)
                    {
                        carrierlabelgemini3.setVisibility(0);
                        if (++i == 1)
                            carrierlabelgemini = carrierlabelgemini3;
                        else
                        if (i == 2)
                            carrierlabelgemini1 = carrierlabelgemini3;
                        if (i >= 2 && j - 1 >= 0)
                            ((View)mDividerList.get(j - 1)).setVisibility(0);
                    } else
                    {
                        carrierlabelgemini3.setVisibility(8);
                    }
                    carrierlabelgemini3.setGravity(17);
                }

                if (i == 2)
                {
                    carrierlabelgemini.setGravity(5);
                    carrierlabelgemini1.setGravity(3);
                    return;
                }
                if (i == 0)
                {
                    CarrierLabelGemini carrierlabelgemini2 = (CarrierLabelGemini)mCarrierList.get(0);
                    if (carrierlabelgemini2 != null)
                        carrierlabelgemini2.setVisibility(0);
                    Xlog.d("NetworkControllerCoolpad", "updateOperatorInfo, force the slotId 0 to visible.");
                    return;
                }
            }
        }
    }








/*
    static int access$1402(NetworkControllerCoolpad networkcontrollercoolpad, int i)
    {
        networkcontrollercoolpad.mWifiActivity = i;
        return i;
    }

*/








}
