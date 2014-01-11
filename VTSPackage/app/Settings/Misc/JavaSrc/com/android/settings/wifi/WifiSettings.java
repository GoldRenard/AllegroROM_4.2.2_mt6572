// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.*;
import android.preference.*;
import android.security.Credentials;
import android.security.KeyStore;
import android.telephony.TelephonyManager;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.android.settings.wifi.p2p.WifiP2pSettings;
import com.mediatek.settings.ext.IWifiSettingsExt;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

// Referenced classes of package com.android.settings.wifi:
//            AccessPoint, WifiDialog, WifiConfigController, WifiEnabler, 
//            WpsDialog, AdvancedWifiSettings

public class WifiSettings extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener
{
    private class Multimap
    {

        private HashMap store;
        final WifiSettings this$0;

        List getAll(Object obj)
        {
            List list = (List)store.get(obj);
            if (list != null)
                return list;
            else
                return Collections.emptyList();
        }

        void put(Object obj, Object obj1)
        {
            Object obj2 = (List)store.get(obj);
            if (obj2 == null)
            {
                obj2 = new ArrayList(3);
                store.put(obj, obj2);
            }
            ((List) (obj2)).add(obj1);
        }

        private Multimap()
        {
            this$0 = WifiSettings.this;
            super();
            store = new HashMap();
        }

    }

    public static class ProportionalOuterFrame extends RelativeLayout
    {

        protected void onMeasure(int i, int j)
        {
            int k = android.view.View.MeasureSpec.getSize(i);
            int l = android.view.View.MeasureSpec.getSize(j);
            Resources resources = getContext().getResources();
            float f = resources.getFraction(0x7f0d0010, 1, 1);
            float f1 = resources.getFraction(0x7f0d0011, 1, 1);
            int i1 = resources.getDimensionPixelSize(0x7f0d0012);
            setPadding((int)(f1 * (float)k), 0, (int)(f1 * (float)k), i1);
            View view = findViewById(0x7f080171);
            if (view != null)
                view.setMinimumHeight((int)(f * (float)l));
            super.onMeasure(i, j);
        }

        public ProportionalOuterFrame(Context context)
        {
            super(context);
        }

        public ProportionalOuterFrame(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }

        public ProportionalOuterFrame(Context context, AttributeSet attributeset, int i)
        {
            super(context, attributeset, i);
        }
    }

    private class Scanner extends Handler
    {

        private int mRetry;
        final WifiSettings this$0;

        void forceScan()
        {
            removeMessages(0);
            sendEmptyMessage(0);
        }

        public void handleMessage(Message message)
        {
label0:
            {
                if (mWifiManager.startScanActive())
                {
                    mRetry = 0;
                } else
                {
                    int i = 1 + mRetry;
                    mRetry = i;
                    if (i >= 3)
                    {
                        mRetry = 0;
                        Activity activity = getActivity();
                        if (activity != null)
                        {
                            Toast.makeText(activity, 0x7f0b043b, 1).show();
                            return;
                        }
                        break label0;
                    }
                }
                sendEmptyMessageDelayed(0, 6000L);
            }
        }

        void pause()
        {
            mRetry = 0;
            removeMessages(0);
        }

        void resume()
        {
            if (!hasMessages(0))
                sendEmptyMessage(0);
        }

        private Scanner()
        {
            this$0 = WifiSettings.this;
            super();
            mRetry = 0;
        }

    }


    private static final String CONFIGED_AP = "configed_access_points";
    private static final String EXTRA_AUTO_FINISH_ON_CONNECT = "wifi_auto_finish_on_connect";
    private static final String EXTRA_ENABLE_NEXT_ON_CONNECT = "wifi_enable_next_on_connect";
    private static final String EXTRA_IS_FIRST_RUN = "firstRun";
    protected static final String EXTRA_SHOW_CUSTOM_BUTTON = "wifi_show_custom_button";
    protected static final String EXTRA_SHOW_WIFI_REQUIRED_INFO = "wifi_show_wifi_required_info";
    private static final int IMAGE_GRAY = 75;
    private static final int MENU_ID_ADD_NETWORK = 4;
    private static final int MENU_ID_ADVANCED = 5;
    private static final int MENU_ID_CONNECT = 7;
    private static final int MENU_ID_DISCONNECT = 10;
    private static final int MENU_ID_FORGET = 8;
    private static final int MENU_ID_MODIFY = 9;
    private static final int MENU_ID_P2P = 3;
    private static final int MENU_ID_SCAN = 6;
    private static final int MENU_ID_WPS_PBC = 1;
    private static final int MENU_ID_WPS_PIN = 2;
    private static final String NEW_AP = "new_access_points";
    private static final int ORIGIINAL_IMAGE = 255;
    private static final String SAVE_DIALOG_ACCESS_POINT_STATE = "wifi_ap_state";
    private static final String SAVE_DIALOG_EDIT_MODE = "edit_mode";
    private static final String TAG = "WifiSettings";
    private static final String TRUST_AP = "trust_access_points";
    private static final int WIFI_AND_MOBILE_SKIPPED_DIALOG_ID = 5;
    private static final int WIFI_DIALOG_ID = 1;
    private static final int WIFI_RESCAN_INTERVAL_MS = 6000;
    private static final int WIFI_SKIPPED_DIALOG_ID = 4;
    private static final String WLAN_AP_AND_GPRS = "access_points_and_gprs";
    private static final int WPS_PBC_DIALOG_ID = 2;
    private static final int WPS_PIN_DIALOG_ID = 3;
    private Bundle mAccessPointSavedState;
    private boolean mAutoFinishOnConnection;
    private PreferenceCategory mConfigedAPCategory;
    private android.net.wifi.WifiManager.ActionListener mConnectListener;
    private AtomicBoolean mConnected;
    private WifiDialog mDialog;
    private AccessPoint mDlgAccessPoint;
    private boolean mDlgEdit;
    private TextView mEmptyView;
    private boolean mEnableNextOnConnection;
    IWifiSettingsExt mExt;
    private final IntentFilter mFilter = new IntentFilter();
    private android.net.wifi.WifiManager.ActionListener mForgetListener;
    private int mKeyStoreNetworkId;
    private WifiInfo mLastInfo;
    private android.net.NetworkInfo.DetailedState mLastState;
    private boolean mManuallyConnect;
    private PreferenceCategory mNewAPCategory;
    private boolean mP2pSupported;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final WifiSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            handleEvent(context, intent);
        }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
    }
;
    private android.net.wifi.WifiManager.ActionListener mSaveListener;
    private final Scanner mScanner = new Scanner();
    private AccessPoint mSelectedAccessPoint;
    private boolean mSetupWizardMode;
    private TelephonyManagerEx mTelephonyManagerEx;
    private PreferenceCategory mTrustAPCategory;
    private WifiEnabler mWifiEnabler;
    private WifiManager mWifiManager;

    public WifiSettings()
    {
        mConnected = new AtomicBoolean(false);
        mKeyStoreNetworkId = -1;
        mFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        mFilter.addAction("android.net.wifi.SCAN_RESULTS");
        mFilter.addAction("android.net.wifi.NETWORK_IDS_CHANGED");
        mFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        mFilter.addAction("android.net.wifi.CONFIGURED_NETWORKS_CHANGE");
        mFilter.addAction("android.net.wifi.LINK_CONFIGURATION_CHANGED");
        mFilter.addAction("android.net.wifi.STATE_CHANGE");
        mFilter.addAction("android.net.wifi.RSSI_CHANGED");
        mFilter.addAction("android.net.wifi.NO_CERTIFICATION");
        mManuallyConnect = false;
    }

    private void addMessagePreference(int i)
    {
        if (mEmptyView != null)
            mEmptyView.setText(i);
        mExt.emptyScreen(getPreferenceScreen());
    }

    private void changeNextButtonState(boolean flag)
    {
        if (mEnableNextOnConnection && hasNextButton())
            getNextButton().setEnabled(flag);
    }

    private List constructAccessPoints()
    {
        ArrayList arraylist = new ArrayList();
        Multimap multimap = new Multimap();
        mExt.emptyCategory(getPreferenceScreen());
        List list = mWifiManager.getConfiguredNetworks();
        if (list != null)
        {
            Iterator iterator2 = list.iterator();
label0:
            do
            {
                if (!iterator2.hasNext())
                    break;
                WifiConfiguration wificonfiguration = (WifiConfiguration)iterator2.next();
                if (wificonfiguration.imsi != null && !wificonfiguration.imsi.equals("\"none\""))
                {
                    Xlog.d("WifiSettings", (new StringBuilder()).append("config.SSID ").append(wificonfiguration.SSID).toString());
                    Xlog.d("WifiSettings", (new StringBuilder()).append("config.imsi ").append(wificonfiguration.imsi).toString());
                    Xlog.d("WifiSettings", (new StringBuilder()).append("config.simSlot ").append(wificonfiguration.simSlot).toString());
                    Xlog.d("WifiSettings", (new StringBuilder()).append("config.networkId ").append(wificonfiguration.networkId).toString());
                    int i;
                    String as[];
                    if (wificonfiguration.simSlot.equals("\"0\""))
                    {
                        i = 0;
                    } else
                    {
                        boolean flag1 = wificonfiguration.simSlot.equals("\"1\"");
                        i = 0;
                        if (flag1)
                            i = 1;
                    }
                    as = wificonfiguration.simSlot.split("\"");
                    if (as.length > 1)
                        i = Integer.parseInt(as[1]);
                    if (wificonfiguration.imsi.equals("\"1232010000000000@wlan.mnc001.mcc232.3gppnetwork.org\"") || wificonfiguration.imsi.equals("\"0232010000000000@wlan.mnc001.mcc232.3gppnetwork.org\""))
                        Xlog.d("WifiSettings", "in simulator mode, skip");
                    else
                    if (wificonfiguration.toString().contains("eap: SIM"))
                    {
                        Xlog.d("WifiSettings", (new StringBuilder()).append("mTelephonyManagerEx.getSubscriberId() ").append(mTelephonyManagerEx.getSubscriberId(i)).toString());
                        Xlog.d("WifiSettings", (new StringBuilder()).append("makeNAI(mTelephonyManagerEx.getSubscriberId(), SIM); ").append(WifiDialog.makeNAI(mTelephonyManagerEx.getSubscriberId(i), "SIM")).toString());
                        if (wificonfiguration.imsi.equals(WifiDialog.makeNAI(mTelephonyManagerEx.getSubscriberId(i), "SIM")))
                            Xlog.d("WifiSettings", "user doesn't change or remove sim card");
                        else
                        if (!mExt.isTustAP(AccessPoint.removeDoubleQuotes(wificonfiguration.SSID), AccessPoint.getSecurity(wificonfiguration)))
                        {
                            Xlog.d("WifiSettings", "user change or remove sim card");
                            Xlog.d("WifiSettings", " >>mWifiManager.removeNetwork(config.networkId);");
                            boolean flag4 = mWifiManager.removeNetwork(wificonfiguration.networkId);
                            Xlog.d("WifiSettings", (new StringBuilder()).append(" <<mWifiManager.removeNetwork(config.networkId); s: ").append(flag4).toString());
                            Xlog.d("WifiSettings", "   >>saveNetworks();");
                            boolean flag5 = mWifiManager.saveConfiguration();
                            Xlog.d("WifiSettings", (new StringBuilder()).append("saveNetworks(): ").append(flag5).toString());
                            continue;
                        }
                    } else
                    if (wificonfiguration.toString().contains("eap: AKA"))
                    {
                        Xlog.d("WifiSettings", (new StringBuilder()).append("mTelephonyManagerEx.getSubscriberId() ").append(mTelephonyManagerEx.getSubscriberId(i)).toString());
                        Xlog.d("WifiSettings", (new StringBuilder()).append("makeNAI(mTelephonyManagerEx.getSubscriberId(), AKA); ").append(WifiDialog.makeNAI(mTelephonyManagerEx.getSubscriberId(i), "AKA")).toString());
                        if (!WifiDialog.makeNAI(mTelephonyManagerEx.getSubscriberId(i), "AKA").equals(wificonfiguration.imsi))
                            continue;
                        Xlog.d("WifiSettings", "user doesn't change or remove usim card");
                    }
                }
                do
                {
                    mExt.setLastPriority(wificonfiguration.priority);
                    AccessPoint accesspoint1 = new AccessPoint(getActivity(), wificonfiguration);
                    accesspoint1.update(mLastInfo, mLastState);
                    arraylist.add(accesspoint1);
                    multimap.put(accesspoint1.ssid, accesspoint1);
                    boolean flag2;
                    boolean flag3;
                    if (mExt.isCatogoryExist())
                        if (mExt.isTustAP(accesspoint1.ssid, accesspoint1.security))
                            mTrustAPCategory.addPreference(accesspoint1);
                        else
                            mConfigedAPCategory.addPreference(accesspoint1);
                    continue label0;
                } while (mExt.isTustAP(AccessPoint.removeDoubleQuotes(wificonfiguration.SSID), AccessPoint.getSecurity(wificonfiguration)));
                Xlog.d("WifiSettings", "user change or remove usim card");
                Xlog.d("WifiSettings", " >> mWifiManager.removeNetwork(config.networkId);");
                flag2 = mWifiManager.removeNetwork(wificonfiguration.networkId);
                Xlog.d("WifiSettings", (new StringBuilder()).append(" << mWifiManager.removeNetwork(config.networkId); s: ").append(flag2).toString());
                Xlog.d("WifiSettings", "   >>saveNetworks();");
                flag3 = mWifiManager.saveConfiguration();
                Xlog.d("WifiSettings", (new StringBuilder()).append("saveNetworks(): ").append(flag3).toString());
                Xlog.d("WifiSettings", "   <<saveNetworks();");
            } while (true);
        }
        List list1 = mWifiManager.getScanResults();
        if (list1 != null)
        {
            Iterator iterator = list1.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ScanResult scanresult = (ScanResult)iterator.next();
                if (scanresult.SSID != null && scanresult.SSID.length() != 0 && !scanresult.capabilities.contains("[IBSS]"))
                {
                    boolean flag = false;
                    Iterator iterator1 = multimap.getAll(scanresult.SSID).iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        if (((AccessPoint)iterator1.next()).update(scanresult))
                            flag = true;
                    } while (true);
                    if (!flag)
                    {
                        AccessPoint accesspoint = new AccessPoint(getActivity(), scanresult);
                        arraylist.add(accesspoint);
                        multimap.put(accesspoint.ssid, accesspoint);
                        if (mExt.isCatogoryExist())
                            if (mExt.isTustAP(accesspoint.ssid, accesspoint.security))
                                mTrustAPCategory.addPreference(accesspoint);
                            else
                                mNewAPCategory.addPreference(accesspoint);
                    }
                }
            } while (true);
        }
        mExt.refreshCategory(getPreferenceScreen());
        ArrayList arraylist1 = new ArrayList(arraylist.size());
        arraylist1.addAll(arraylist);
        try
        {
            Collections.sort(arraylist);
        }
        catch (ClassCastException classcastexception)
        {
            Xlog.d("WifiSettings", (new StringBuilder()).append("collection.sort exception;origAccessPoints=").append(arraylist1).toString());
            return arraylist1;
        }
        catch (UnsupportedOperationException unsupportedoperationexception)
        {
            Xlog.d("WifiSettings", (new StringBuilder()).append("collection.sort exception;origAccessPoints=").append(arraylist1).toString());
            return arraylist1;
        }
        return arraylist;
    }

    private void handleEvent(Context context, Intent intent)
    {
label0:
        {
            String s = intent.getAction();
            if ("android.net.wifi.WIFI_STATE_CHANGED".equals(s))
            {
                updateWifiState(intent.getIntExtra("wifi_state", 4));
            } else
            {
                if ("android.net.wifi.SCAN_RESULTS".equals(s) || "android.net.wifi.CONFIGURED_NETWORKS_CHANGE".equals(s) || "android.net.wifi.LINK_CONFIGURATION_CHANGED".equals(s))
                    break label0;
                if ("android.net.wifi.supplicant.STATE_CHANGE".equals(s))
                {
                    SupplicantState supplicantstate = (SupplicantState)intent.getParcelableExtra("newState");
                    if (!mConnected.get())
                    {
                        updateConnectionState(WifiInfo.getDetailedStateOf(supplicantstate));
                        return;
                    }
                } else
                if ("android.net.wifi.STATE_CHANGE".equals(s))
                {
                    NetworkInfo networkinfo = (NetworkInfo)intent.getParcelableExtra("networkInfo");
                    mConnected.set(networkinfo.isConnected());
                    changeNextButtonState(networkinfo.isConnected());
                    updateAccessPoints();
                    updateConnectionState(networkinfo.getDetailedState());
                    if (mAutoFinishOnConnection && networkinfo.isConnected())
                    {
                        Activity activity = getActivity();
                        if (activity != null)
                        {
                            activity.setResult(-1);
                            activity.finish();
                            return;
                        }
                    }
                } else
                {
                    if ("android.net.wifi.RSSI_CHANGED".equals(s))
                    {
                        updateConnectionState(null);
                        return;
                    }
                    if ("android.net.wifi.NO_CERTIFICATION".equals(s))
                    {
                        String s1 = "";
                        if (mSelectedAccessPoint != null)
                            s1 = (new StringBuilder()).append("[").append(mSelectedAccessPoint.ssid).append("] ").toString();
                        Xlog.i("WifiSettings", (new StringBuilder()).append("Receive  no certification broadcast for AP ").append(s1).toString());
                        String s2 = (new StringBuilder()).append(getResources().getString(0x7f0b011f)).append(s1).toString();
                        Toast.makeText(getActivity(), s2, 1).show();
                        return;
                    }
                }
            }
            return;
        }
        updateAccessPoints();
    }

    private boolean isPhone()
    {
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        return telephonymanager != null && telephonymanager.getPhoneType() != 0;
    }

    private boolean requireKeyStore(WifiConfiguration wificonfiguration)
    {
        if (WifiConfigController.requireKeyStore(wificonfiguration) && KeyStore.getInstance().state() != android.security.KeyStore.State.UNLOCKED)
        {
            mKeyStoreNetworkId = wificonfiguration.networkId;
            Credentials.getInstance().unlock(getActivity());
            return true;
        } else
        {
            return false;
        }
    }

    private void showDialog(AccessPoint accesspoint, boolean flag)
    {
        if (mDialog != null)
        {
            removeDialog(1);
            mDialog = null;
            mAccessPointSavedState = null;
        }
        mDlgAccessPoint = accesspoint;
        mDlgEdit = flag;
        showDialog(1);
    }

    private void updateAccessPoints()
    {
label0:
        {
label1:
            {
                if (getActivity() != null)
                    switch (mWifiManager.getWifiState())
                    {
                    default:
                        break label0;

                    case 0: // '\0'
                        break label1;

                    case 1: // '\001'
                        addMessagePreference(0x7f0b044f);
                        return;

                    case 2: // '\002'
                        mExt.emptyCategory(getPreferenceScreen());
                        return;

                    case 3: // '\003'
                        List list = constructAccessPoints();
                        if (list.size() == 0)
                            addMessagePreference(0x7f0b0450);
                        if (!mExt.isCatogoryExist())
                        {
                            AccessPoint accesspoint;
                            for (Iterator iterator = list.iterator(); iterator.hasNext(); getPreferenceScreen().addPreference(accesspoint))
                                accesspoint = (AccessPoint)iterator.next();

                        }
                        break;
                    }
                return;
            }
            addMessagePreference(0x7f0b0438);
            return;
        }
    }

    private void updateConnectionState(android.net.NetworkInfo.DetailedState detailedstate)
    {
        if (!mWifiManager.isWifiEnabled())
        {
            mScanner.pause();
        } else
        {
            if (detailedstate == android.net.NetworkInfo.DetailedState.CONNECTED)
            {
                long l1 = System.currentTimeMillis();
                Xlog.i("WifiSettings", (new StringBuilder()).append("[Performance test][Settings][wifi] wifi connect end [").append(l1).append("]").toString());
            } else
            if (detailedstate == android.net.NetworkInfo.DetailedState.DISCONNECTED)
            {
                long l = System.currentTimeMillis();
                Xlog.i("WifiSettings", (new StringBuilder()).append("[Performance test][Settings][wifi] wifi forget end [").append(l).append("]").toString());
                mManuallyConnect = false;
            }
            if (detailedstate == android.net.NetworkInfo.DetailedState.OBTAINING_IPADDR)
                mScanner.pause();
            else
                mScanner.resume();
            mLastInfo = mWifiManager.getConnectionInfo();
            if (detailedstate != null)
                mLastState = detailedstate;
            if (mExt.isCatogoryExist())
            {
                updateAP(mTrustAPCategory);
                updateAP(mConfigedAPCategory);
                updateAP(mNewAPCategory);
            } else
            {
                for (int i = -1 + getPreferenceScreen().getPreferenceCount(); i >= 0; i--)
                {
                    Preference preference = getPreferenceScreen().getPreference(i);
                    if (preference instanceof AccessPoint)
                        ((AccessPoint)preference).update(mLastInfo, mLastState);
                }

            }
            if (detailedstate == android.net.NetworkInfo.DetailedState.CONNECTED)
            {
                if (mManuallyConnect && mLastInfo != null)
                    mExt.updatePriorityAfterConnect(mLastInfo.getNetworkId());
                mManuallyConnect = false;
                return;
            }
        }
    }

    private void updateWifiState(int i)
    {
label0:
        {
            Activity activity = getActivity();
            if (activity != null)
                activity.invalidateOptionsMenu();
            switch (i)
            {
            default:
                break;

            case 1: // '\001'
                addMessagePreference(0x7f0b044f);
                break;

            case 3: // '\003'
                break label0;

            case 2: // '\002'
                addMessagePreference(0x7f0b0437);
                break;
            }
            mLastInfo = null;
            mLastState = null;
            mScanner.pause();
            return;
        }
        mScanner.resume();
        WifiInfo wifiinfo = mWifiManager.getConnectionInfo();
        if (wifiinfo != null && wifiinfo.getSSID() != null && wifiinfo.getSSID().length() > 0)
        {
            Xlog.d("WifiSettings", (new StringBuilder()).append("mCurrentConnectedInfo.getSSID() =  ").append(wifiinfo.getSSID()).toString());
            return;
        } else
        {
            mExt.updatePriority();
            return;
        }
    }

    public void addNetworkForSelector()
    {
        if (mExt.isCatogoryExist())
        {
            mSelectedAccessPoint = null;
            showDialog(null, true);
        }
    }

    void forget()
    {
        if (mSelectedAccessPoint.networkId == -1)
        {
            Log.e("WifiSettings", (new StringBuilder()).append("Failed to forget invalid network ").append(mSelectedAccessPoint.getConfig()).toString());
            return;
        }
        mWifiManager.forget(mSelectedAccessPoint.networkId, mForgetListener);
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
        updateAccessPoints();
        changeNextButtonState(false);
        mExt.updatePriority();
    }

    int getAccessPointsCount()
    {
        if (mWifiManager.isWifiEnabled())
            return mExt.getAccessPointsCount(getPreferenceScreen());
        else
            return 0;
    }

    protected boolean hasSimProblem()
    {
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        return telephonymanager != null && telephonymanager.getCurrentPhoneType() == 1 && telephonymanager.getSimState() != 5 && telephonymanager.getSimState() != 0;
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        mTelephonyManagerEx = TelephonyManagerEx.getDefault();
        mP2pSupported = getPackageManager().hasSystemFeature("android.hardware.wifi.direct");
        mWifiManager = (WifiManager)getActivity().getApplicationContext().getSystemService("wifi");
        mConnectListener = new android.net.wifi.WifiManager.ActionListener() {

            final WifiSettings this$0;

            public void onFailure(int i)
            {
                Activity activity1 = getActivity();
                if (activity1 != null)
                    Toast.makeText(activity1, 0x7f0b048b, 0).show();
            }

            public void onSuccess()
            {
            }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
        }
;
        mSaveListener = new android.net.wifi.WifiManager.ActionListener() {

            final WifiSettings this$0;

            public void onFailure(int i)
            {
                Activity activity1 = getActivity();
                if (activity1 != null)
                    Toast.makeText(activity1, 0x7f0b048f, 0).show();
            }

            public void onSuccess()
            {
            }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
        }
;
        mForgetListener = new android.net.wifi.WifiManager.ActionListener() {

            final WifiSettings this$0;

            public void onFailure(int i)
            {
                Activity activity1 = getActivity();
                if (activity1 != null)
                    Toast.makeText(activity1, 0x7f0b048d, 0).show();
            }

            public void onSuccess()
            {
            }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
        }
;
        if (bundle != null && bundle.containsKey("wifi_ap_state"))
        {
            mDlgEdit = bundle.getBoolean("edit_mode");
            mAccessPointSavedState = bundle.getBundle("wifi_ap_state");
        }
        Activity activity = getActivity();
        Intent intent = activity.getIntent();
        mAutoFinishOnConnection = intent.getBooleanExtra("wifi_auto_finish_on_connect", false);
        if (mAutoFinishOnConnection)
        {
            if (hasNextButton())
                getNextButton().setVisibility(8);
            ConnectivityManager connectivitymanager1 = (ConnectivityManager)activity.getSystemService("connectivity");
            if (connectivitymanager1 != null && connectivitymanager1.getNetworkInfo(1).isConnected())
            {
                activity.setResult(-1);
                activity.finish();
                return;
            }
        }
        mEnableNextOnConnection = intent.getBooleanExtra("wifi_enable_next_on_connect", false);
        if (mEnableNextOnConnection && hasNextButton())
        {
            ConnectivityManager connectivitymanager = (ConnectivityManager)activity.getSystemService("connectivity");
            if (connectivitymanager != null)
            {
                NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(1);
                if (networkinfo != null)
                    changeNextButtonState(networkinfo.isConnected());
            }
        }
        if (mSetupWizardMode)
            getView().setSystemUiVisibility(0x1e40000);
        if (activity.getIntent().getBooleanExtra("access_points_and_gprs", false))
            addPreferencesFromResource(0x7f05004a);
        else
            addPreferencesFromResource(0x7f05004f);
        mTrustAPCategory = (PreferenceCategory)findPreference("trust_access_points");
        mConfigedAPCategory = (PreferenceCategory)findPreference("configed_access_points");
        mNewAPCategory = (PreferenceCategory)findPreference("new_access_points");
        mExt.setCategory(mTrustAPCategory, mConfigedAPCategory, mNewAPCategory);
        mExt.emptyScreen(getPreferenceScreen());
        if (!mSetupWizardMode)
        {
            Switch switch1 = new Switch(activity);
            if (activity instanceof PreferenceActivity)
            {
                PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
                if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane())
                {
                    switch1.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f0d0002), 0);
                    activity.getActionBar().setDisplayOptions(16, 16);
                    activity.getActionBar().setCustomView(switch1, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
                }
            }
            mWifiEnabler = new WifiEnabler(activity, switch1);
        }
        mEmptyView = (TextView)getView().findViewById(0x1020004);
        getListView().setEmptyView(mEmptyView);
        if (!mSetupWizardMode)
            registerForContextMenu(getListView());
        setHasOptionsMenu(true);
        mExt.registerPriorityObserver(getContentResolver(), getActivity());
    }

    void onAddNetworkPressed()
    {
        mSelectedAccessPoint = null;
        showDialog(null, true);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -3 && mSelectedAccessPoint != null)
            forget();
        else
        if (i == -1)
        {
            submit(mDialog.getController());
            return;
        }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        if (mDialog != null)
            mDialog.closeSpinnerDialog();
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
label0:
        {
            boolean flag;
label1:
            {
                flag = true;
                if (mSelectedAccessPoint == null)
                {
                    flag = super.onContextItemSelected(menuitem);
                } else
                {
                    switch (menuitem.getItemId())
                    {
                    default:
                        break label0;

                    case 10: // '\n'
                        mExt.disconnect(mSelectedAccessPoint.networkId);
                        return flag;

                    case 9: // '\t'
                        showDialog(mSelectedAccessPoint, flag);
                        return flag;

                    case 8: // '\b'
                        mWifiManager.forget(mSelectedAccessPoint.networkId, mForgetListener);
                        return flag;

                    case 7: // '\007'
                        break;
                    }
                    if (mSelectedAccessPoint.networkId == -1)
                        break label1;
                    if (!requireKeyStore(mSelectedAccessPoint.getConfig()))
                    {
                        mWifiManager.connect(mSelectedAccessPoint.networkId, mConnectListener);
                        mManuallyConnect = flag;
                        return flag;
                    }
                }
                return flag;
            }
            if (mSelectedAccessPoint.security == 0)
            {
                mSelectedAccessPoint.generateOpenNetworkConfig();
                mWifiManager.connect(mSelectedAccessPoint.getConfig(), mConnectListener);
                mManuallyConnect = flag;
                return flag;
            } else
            {
                showDialog(mSelectedAccessPoint, false);
                return flag;
            }
        }
        return super.onContextItemSelected(menuitem);
    }

    public void onCreate(Bundle bundle)
    {
        mSetupWizardMode = getActivity().getIntent().getBooleanExtra("firstRun", false);
        super.onCreate(bundle);
        mExt = Utils.getWifiSettingsPlugin(getActivity());
        if ("tablet".equals(SystemProperties.get("ro.build.characteristics")) && getResources().getBoolean(0x1110007))
        {
            return;
        } else
        {
            getActivity().setTitle(0x7f0b0434);
            return;
        }
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        if (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo)
        {
            Preference preference = (Preference)getListView().getItemAtPosition(((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).position);
            if (preference instanceof AccessPoint)
            {
                mSelectedAccessPoint = (AccessPoint)preference;
                contextmenu.setHeaderTitle(mSelectedAccessPoint.ssid);
                if (mSelectedAccessPoint.getLevel() != -1 && mSelectedAccessPoint.getState() == null)
                    contextmenu.add(0, 7, 0, 0x7f0b044c);
                if (mSelectedAccessPoint.getState() != null && mExt.shouldAddDisconnectMenu())
                    contextmenu.add(0, 10, 0, 0x7f0b012f);
                if (mSelectedAccessPoint.networkId != -1)
                {
                    if (mExt.shouldAddForgetMenu(mSelectedAccessPoint.ssid, mSelectedAccessPoint.security))
                        contextmenu.add(0, 8, 0, 0x7f0b044d);
                    contextmenu.add(0, 9, 0, 0x7f0b044e);
                }
            }
        }
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 5: // '\005'
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(0x7f0b0494).setCancelable(false).setNegativeButton(0x7f0b0491, new android.content.DialogInterface.OnClickListener() {

                final WifiSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    getActivity().setResult(0);
                    getActivity().finish();
                }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
            }
).setPositiveButton(0x7f0b0492, new android.content.DialogInterface.OnClickListener() {

                final WifiSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
            }
).create();

        case 4: // '\004'
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(0x7f0b0493).setCancelable(false).setNegativeButton(0x7f0b0491, new android.content.DialogInterface.OnClickListener() {

                final WifiSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    getActivity().setResult(0);
                    getActivity().finish();
                }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
            }
).setPositiveButton(0x7f0b0492, new android.content.DialogInterface.OnClickListener() {

                final WifiSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
            }
).create();

        case 3: // '\003'
            return new WpsDialog(getActivity(), 1);

        case 2: // '\002'
            return new WpsDialog(getActivity(), 0);

        case 1: // '\001'
            AccessPoint accesspoint = mDlgAccessPoint;
            if (accesspoint == null && mAccessPointSavedState != null)
            {
                accesspoint = new AccessPoint(getActivity(), mAccessPointSavedState);
                mDlgAccessPoint = accesspoint;
            }
            mSelectedAccessPoint = accesspoint;
            if (mSelectedAccessPoint != null && mSelectedAccessPoint.getConfig() != null)
                mExt.recordPriority(mSelectedAccessPoint.getConfig().priority);
            else
                mExt.recordPriority(-1);
            mDialog = new WifiDialog(getActivity(), this, accesspoint, mDlgEdit);
            return mDialog;
        }
        return super.onCreateDialog(i);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        boolean flag = mWifiManager.isWifiEnabled();
        if (mSetupWizardMode)
        {
            menu.add(0, 1, 0, 0x7f0b0446).setIcon(0x7f0200b3).setEnabled(flag).setShowAsAction(2);
            menu.add(0, 4, 0, 0x7f0b0444).setEnabled(flag).setShowAsAction(2);
        } else
        {
            MenuItem menuitem = menu.add(0, 1, 0, 0x7f0b0446);
            menuitem.setIcon(0x7f0200b3).setEnabled(flag).setShowAsAction(1);
            MenuItem menuitem1 = menu.add(0, 4, 0, 0x7f0b0444);
            menuitem1.setIcon(0x7f020067).setEnabled(flag).setShowAsAction(1);
            Drawable drawable = menuitem.getIcon();
            Drawable drawable1 = menuitem1.getIcon();
            if (drawable != null && drawable1 != null)
                if (flag)
                {
                    drawable.setAlpha(255);
                    drawable1.setAlpha(255);
                } else
                {
                    drawable.setAlpha(75);
                    drawable1.setAlpha(75);
                }
            menu.add(0, 6, 0, 0x7f0b044a).setEnabled(flag).setShowAsAction(0);
            menu.add(0, 2, 0, 0x7f0b0448).setEnabled(flag).setShowAsAction(0);
            if (mP2pSupported)
                menu.add(0, 3, 0, 0x7f0b0449).setEnabled(flag).setShowAsAction(0);
            menu.add(0, 5, 0, 0x7f0b044b).setShowAsAction(0);
        }
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public View onCreateView(final LayoutInflater inflater, ViewGroup viewgroup, Bundle bundle)
    {
        if (mSetupWizardMode)
        {
            View view = inflater.inflate(0x7f04008b, viewgroup, false);
            view.findViewById(0x7f080175).setOnClickListener(new android.view.View.OnClickListener() {

                final WifiSettings this$0;

                public void onClick(View view1)
                {
                    if (mWifiManager.isWifiEnabled())
                        onAddNetworkPressed();
                }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
            }
);
            final ImageButton b = (ImageButton)view.findViewById(0x7f080173);
            if (b != null)
                b.setOnClickListener(new android.view.View.OnClickListener() {

                    final WifiSettings this$0;
                    final ImageButton val$b;
                    final LayoutInflater val$inflater;

                    public void onClick(View view1)
                    {
                        if (mWifiManager.isWifiEnabled())
                        {
                            PopupMenu popupmenu = new PopupMenu(inflater.getContext(), b);
                            popupmenu.inflate(0x7f100005);
                            popupmenu.setOnMenuItemClickListener(new android.widget.PopupMenu.OnMenuItemClickListener() {

                                final _cls3 this$1;

                                public boolean onMenuItemClick(MenuItem menuitem)
                                {
                                    if (0x7f080275 == menuitem.getItemId())
                                    {
                                        showDialog(2);
                                        return true;
                                    } else
                                    {
                                        return false;
                                    }
                                }

            
            {
                this$1 = _cls3.this;
                super();
            }
                            }
);
                            popupmenu.show();
                        }
                    }

            
            {
                this$0 = WifiSettings.this;
                inflater = layoutinflater;
                b = imagebutton;
                super();
            }
                }
);
            Intent intent = getActivity().getIntent();
            if (intent.getBooleanExtra("wifi_show_custom_button", false))
            {
                view.findViewById(0x7f080178).setVisibility(0);
                view.findViewById(0x7f080179).setVisibility(4);
                view.findViewById(0x7f08017b).setVisibility(4);
                view.findViewById(0x7f080029).setVisibility(4);
                Button button = (Button)view.findViewById(0x7f08017a);
                button.setVisibility(0);
                button.setOnClickListener(new android.view.View.OnClickListener() {

                    final WifiSettings this$0;

                    public void onClick(View view1)
                    {
                        if (isPhone() && !hasSimProblem())
                        {
                            showDialog(4);
                            return;
                        } else
                        {
                            showDialog(5);
                            return;
                        }
                    }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
                }
);
            }
            if (intent.getBooleanExtra("wifi_show_wifi_required_info", false))
                view.findViewById(0x7f080174).setVisibility(0);
            return view;
        } else
        {
            return super.onCreateView(inflater, viewgroup, bundle);
        }
    }

    public void onDestroy()
    {
        mExt.unregisterPriorityObserver(getContentResolver());
        super.onDestroy();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 5: // '\005'
            if (getActivity() instanceof PreferenceActivity)
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/wifi/AdvancedWifiSettings.getCanonicalName(), null, 0x7f0b0496, null, this, 0);
            else
                startFragment(this, com/android/settings/wifi/AdvancedWifiSettings.getCanonicalName(), -1, null);
            return true;

        case 4: // '\004'
            if (mWifiManager.isWifiEnabled())
                onAddNetworkPressed();
            return true;

        case 6: // '\006'
            if (mWifiManager.isWifiEnabled())
                mScanner.forceScan();
            return true;

        case 2: // '\002'
            showDialog(3);
            return true;

        case 3: // '\003'
            if (getActivity() instanceof PreferenceActivity)
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/wifi/p2p/WifiP2pSettings.getCanonicalName(), null, 0x7f0b04ab, null, this, 0);
            else
                startFragment(this, com/android/settings/wifi/p2p/WifiP2pSettings.getCanonicalName(), -1, null);
            return true;

        case 1: // '\001'
            showDialog(2);
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        if (mWifiEnabler != null)
            mWifiEnabler.pause();
        getActivity().unregisterReceiver(mReceiver);
        mScanner.pause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof AccessPoint)
        {
            mSelectedAccessPoint = (AccessPoint)preference;
            if (mSelectedAccessPoint.security == 0 && mSelectedAccessPoint.networkId == -1)
            {
                if (mSelectedAccessPoint.isOpenApWPSSupported())
                {
                    showDialog(mSelectedAccessPoint, false);
                    return true;
                } else
                {
                    mSelectedAccessPoint.generateOpenNetworkConfig();
                    mWifiManager.connect(mSelectedAccessPoint.getConfig(), mConnectListener);
                    mManuallyConnect = true;
                    return true;
                }
            } else
            {
                showDialog(mSelectedAccessPoint, false);
                return true;
            }
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        super.onResume();
        if (mWifiEnabler != null)
            mWifiEnabler.resume();
        getActivity().registerReceiver(mReceiver, mFilter);
        if (mKeyStoreNetworkId != -1 && KeyStore.getInstance().state() == android.security.KeyStore.State.UNLOCKED)
            mWifiManager.connect(mKeyStoreNetworkId, mConnectListener);
        mKeyStoreNetworkId = -1;
        updateAccessPoints();
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (mDialog != null && mDialog.isShowing())
        {
            bundle.putBoolean("edit_mode", mDlgEdit);
            if (mDlgAccessPoint != null)
            {
                mAccessPointSavedState = new Bundle();
                mDlgAccessPoint.saveWifiState(mAccessPointSavedState);
                bundle.putBundle("wifi_ap_state", mAccessPointSavedState);
            }
        }
    }

    void pauseWifiScan()
    {
        if (mWifiManager.isWifiEnabled())
            mScanner.pause();
    }

    void refreshAccessPoints()
    {
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
        mExt.emptyCategory(getPreferenceScreen());
    }

    void resumeWifiScan()
    {
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
    }

    void submit(WifiConfigController wificonfigcontroller)
    {
        WifiConfiguration wificonfiguration = wificonfigcontroller.getConfig();
        if (wificonfiguration == null) goto _L2; else goto _L1
_L1:
        if (wificonfiguration.imsi == null || !wificonfiguration.toString().contains("eap: SIM") && !wificonfiguration.toString().contains("eap: AKA")) goto _L2; else goto _L3
_L3:
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", 0) == 1)
        {
            Toast.makeText(getActivity(), 0x7f0b0123, 1).show();
            return;
        }
        if (wificonfiguration.imsi.equals("\"error\""))
        {
            Toast.makeText(getActivity(), 0x7f0b0124, 1).show();
            return;
        }
          goto _L4
        Exception exception;
        exception;
        Xlog.d("WifiSettings", (new StringBuilder()).append("submit exception() ").append(exception.toString()).toString());
_L2:
        if (wificonfiguration != null) goto _L6; else goto _L5
_L5:
        List list;
        Xlog.d("WifiSettings", (new StringBuilder()).append("mSelectedAccessPoint ").append(mSelectedAccessPoint).toString());
        list = mWifiManager.getConfiguredNetworks();
        if (list == null) goto _L8; else goto _L7
_L7:
        Iterator iterator = list.iterator();
_L11:
        if (!iterator.hasNext()) goto _L8; else goto _L9
_L9:
        WifiConfiguration wificonfiguration1;
        wificonfiguration1 = (WifiConfiguration)iterator.next();
        Xlog.d("WifiSettings", "onClick() >>if ((mConfig.SSID).equals(mSelectedAccessPoint.ssid)) {");
        Xlog.d("WifiSettings", (new StringBuilder()).append("onClick()").append(wificonfiguration1.SSID).toString());
        Xlog.d("WifiSettings", (new StringBuilder()).append("onClick() ").append(mSelectedAccessPoint.ssid).toString());
        if (wificonfiguration1 == null || wificonfiguration1.SSID == null || !wificonfiguration1.SSID.equals(WifiDialog.addQuote(mSelectedAccessPoint.ssid)) || android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", 0) != 1 || !wificonfiguration1.toString().contains("eap: SIM") && !wificonfiguration1.toString().contains("eap: AKA")) goto _L11; else goto _L10
_L10:
        Xlog.d("WifiSettings", "remind user: cannot user eap-sim/aka under airplane mode");
        Toast.makeText(getActivity(), 0x7f0b0123, 1).show();
        return;
_L4:
        if (!wificonfiguration.imsi.equals("\"none\"")) goto _L2; else goto _L12
_L12:
        Toast.makeText(getActivity(), 0x7f0b0125, 1).show();
        return;
_L8:
        if (mSelectedAccessPoint != null && !requireKeyStore(mSelectedAccessPoint.getConfig()) && mSelectedAccessPoint.networkId != -1)
            if (mSelectedAccessPoint.getState() == null)
            {
                mWifiManager.connect(mSelectedAccessPoint.networkId, mConnectListener);
                mManuallyConnect = true;
            } else
            {
                mExt.disconnect(mSelectedAccessPoint.networkId);
            }
_L14:
        mExt.setLastConnectedConfig(wificonfiguration);
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
        updateAccessPoints();
        return;
_L6:
        if (wificonfiguration.networkId != -1)
        {
            if (mSelectedAccessPoint != null)
            {
                mExt.setNewPriority(wificonfiguration);
                mWifiManager.save(wificonfiguration, mSaveListener);
            }
        } else
        {
            mExt.updatePriorityAfterSubmit(wificonfiguration);
            if (wificonfigcontroller.isEdit() || requireKeyStore(wificonfiguration))
            {
                mWifiManager.save(wificonfiguration, mSaveListener);
            } else
            {
                mWifiManager.connect(wificonfiguration, mConnectListener);
                mManuallyConnect = true;
            }
        }
        if (true) goto _L14; else goto _L13
_L13:
    }

    public void updateAP(PreferenceCategory preferencecategory)
    {
        for (int i = -1 + preferencecategory.getPreferenceCount(); i >= 0; i--)
        {
            Preference preference = preferencecategory.getPreference(i);
            if (preference instanceof AccessPoint)
                ((AccessPoint)preference).update(mLastInfo, mLastState);
        }

    }






}
