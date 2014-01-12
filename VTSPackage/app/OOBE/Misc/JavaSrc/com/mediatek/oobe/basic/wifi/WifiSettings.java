// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.*;
import android.preference.*;
import android.security.Credentials;
import android.security.KeyStore;
import android.telephony.TelephonyManager;
import android.view.*;
import android.widget.*;
import com.mediatek.oobe.ext.IWifiSettingsExt;
import com.mediatek.oobe.utils.*;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

// Referenced classes of package com.mediatek.oobe.basic.wifi:
//            AccessPoint, WifiDialog, WifiConfigController, WifiEnabler

public class WifiSettings extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener
{
    private class Multimap
    {

        private HashMap mStore;
        final WifiSettings this$0;

        List getAll(Object obj)
        {
            List list = (List)mStore.get(obj);
            if (list != null)
                return list;
            else
                return Collections.emptyList();
        }

        void put(Object obj, Object obj1)
        {
            Object obj2 = (List)mStore.get(obj);
            if (obj2 == null)
            {
                obj2 = new ArrayList(3);
                mStore.put(obj, obj2);
            }
            ((List) (obj2)).add(obj1);
        }

        private Multimap()
        {
            this$0 = WifiSettings.this;
            super();
            mStore = new HashMap();
        }

    }

    private class Scanner extends Handler
    {

        private int mRetry;
        final WifiSettings this$0;

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
                            Toast.makeText(activity, 0x7f0900a6, 1).show();
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


    private static final String EXTRA_AUTO_FINISH_ON_CONNECT = "wifi_auto_finish_on_connect";
    private static final String EXTRA_ENABLE_NEXT_ON_CONNECT = "wifi_enable_next_on_connect";
    private static final String EXTRA_IS_FIRST_RUN = "firstRun";
    protected static final String EXTRA_SHOW_CUSTOM_BUTTON = "wifi_show_custom_button";
    protected static final String EXTRA_SHOW_WIFI_REQUIRED_INFO = "wifi_show_wifi_required_info";
    private static final int MENU_ID_ADD_NETWORK = 4;
    private static final int MENU_ID_ADVANCED = 5;
    private static final int MENU_ID_CONNECT = 7;
    private static final int MENU_ID_FORGET = 8;
    private static final int MENU_ID_MODIFY = 9;
    private static final int MENU_ID_SCAN = 6;
    private static final String SAVE_DIALOG_ACCESS_POINT_STATE = "wifi_ap_state";
    private static final String SAVE_DIALOG_EDIT_MODE = "edit_mode";
    private static final String TAG = "WifiSettings";
    private static final int WIFI_AND_MOBILE_SKIPPED_DIALOG_ID = 5;
    private static final int WIFI_DIALOG_ID = 1;
    private static final int WIFI_RESCAN_INTERVAL_MS = 6000;
    private static final int WIFI_SKIPPED_DIALOG_ID = 4;
    private static final String WIFI_SWITCH_ENABLER = "wifi_switch";
    private Bundle mAccessPointSavedState;
    private ButtonPreference mAddNetworkButton;
    com.mediatek.oobe.utils.ButtonPreference.PrefButtonClickedListener mAddNetworkButtonCbk;
    private boolean mAutoFinishOnConnection;
    private android.net.wifi.WifiManager.ActionListener mConnectListener;
    private AtomicBoolean mConnected;
    private WifiDialog mDialog;
    private AccessPoint mDlgAccessPoint;
    private boolean mDlgEdit;
    private TextView mEmptyView;
    private boolean mEnableNextOnConnection;
    private IWifiSettingsExt mExt;
    private final IntentFilter mFilter = new IntentFilter();
    private android.net.wifi.WifiManager.ActionListener mForgetListener;
    private int mKeyStoreNetworkId;
    private WifiInfo mLastInfo;
    private android.net.NetworkInfo.DetailedState mLastState;
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
    private PreferenceCategory mWifiApCategory;
    private WifiEnabler mWifiEnabler;
    private Preference mWifiEnablerPref;
    private WifiManager mWifiManager;

    public WifiSettings()
    {
        mConnected = new AtomicBoolean(false);
        mKeyStoreNetworkId = -1;
        mAddNetworkButtonCbk = new com.mediatek.oobe.utils.ButtonPreference.PrefButtonClickedListener() {

            final WifiSettings this$0;

            public void onPreButtonClicked()
            {
                onAddNetworkPressed();
            }

            
            {
                this$0 = WifiSettings.this;
                super();
            }
        }
;
        mFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        mFilter.addAction("android.net.wifi.SCAN_RESULTS");
        mFilter.addAction("android.net.wifi.NETWORK_IDS_CHANGED");
        mFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        mFilter.addAction("android.net.wifi.CONFIGURED_NETWORKS_CHANGE");
        mFilter.addAction("android.net.wifi.LINK_CONFIGURATION_CHANGED");
        mFilter.addAction("android.net.wifi.STATE_CHANGE");
        mFilter.addAction("android.net.wifi.RSSI_CHANGED");
        mFilter.addAction("android.net.wifi.NO_CERTIFICATION");
    }

    private void addMessagePreference(int i)
    {
        if (mEmptyView != null)
            mEmptyView.setText(i);
        mWifiApCategory.removeAll();
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
                    AccessPoint accesspoint1;
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
                    accesspoint1 = new AccessPoint(getActivity(), wificonfiguration);
                    accesspoint1.update(mLastInfo, mLastState);
                    arraylist.add(accesspoint1);
                    multimap.put(accesspoint1.mSsid, accesspoint1);
                    continue label0;
                } while (mExt.isTustAP(AccessPoint.removeDoubleQuotes(wificonfiguration.SSID), AccessPoint.getSecurity(wificonfiguration)));
                Xlog.d("WifiSettings", "user change or remove usim card");
                Xlog.d("WifiSettings", " >> mWifiManager.removeNetwork(config.networkId);");
                boolean flag2 = mWifiManager.removeNetwork(wificonfiguration.networkId);
                Xlog.d("WifiSettings", (new StringBuilder()).append(" << mWifiManager.removeNetwork(config.networkId); s: ").append(flag2).toString());
                Xlog.d("WifiSettings", "   >>saveNetworks();");
                boolean flag3 = mWifiManager.saveConfiguration();
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
                        multimap.put(accesspoint.mSsid, accesspoint);
                    }
                }
            } while (true);
        }
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
            Xlog.d("WifiSettings", (new StringBuilder()).append("action = ").append(s).toString());
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
                            s1 = (new StringBuilder()).append("[").append(mSelectedAccessPoint.mSsid).append("] ").toString();
                        Xlog.i("WifiSettings", (new StringBuilder()).append("Receive  no certification broadcast for AP ").append(s1).toString());
                        String s2 = (new StringBuilder()).append(getResources().getString(0x7f09011c)).append(s1).toString();
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
        if (getActivity() == null)
            return;
        switch (mWifiManager.getWifiState())
        {
        case 1: // '\001'
            addMessagePreference(0x7f090093);
            getPreferenceScreen().removePreference(mWifiApCategory);
            getPreferenceScreen().removePreference(mAddNetworkButton);
            return;

        case 2: // '\002'
            mWifiApCategory.removeAll();
            return;

        case 3: // '\003'
            List list = constructAccessPoints();
            mWifiApCategory.removeAll();
            if (list.size() == 0)
                addMessagePreference(0x7f090094);
            AccessPoint accesspoint;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); mWifiApCategory.addPreference(accesspoint))
                accesspoint = (AccessPoint)iterator.next();

            getPreferenceScreen().addPreference(mWifiApCategory);
            getPreferenceScreen().addPreference(mAddNetworkButton);
            return;

        case 0: // '\0'
            addMessagePreference(0x7f0900a1);
            getPreferenceScreen().removePreference(mWifiApCategory);
            getPreferenceScreen().removePreference(mAddNetworkButton);
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
            if (detailedstate == android.net.NetworkInfo.DetailedState.OBTAINING_IPADDR)
                mScanner.pause();
            else
                mScanner.resume();
            mLastInfo = mWifiManager.getConnectionInfo();
            if (detailedstate != null)
                mLastState = detailedstate;
            for (int i = -1 + mWifiApCategory.getPreferenceCount(); i >= 0; i--)
            {
                Preference preference = mWifiApCategory.getPreference(i);
                if (preference instanceof AccessPoint)
                    ((AccessPoint)preference).update(mLastInfo, mLastState);
            }

        }
    }

    private void updateWifiState(int i)
    {
label0:
        {
            switch (i)
            {
            default:
                break;

            case 1: // '\001'
                addMessagePreference(0x7f090093);
                getPreferenceScreen().removePreference(mAddNetworkButton);
                break;

            case 3: // '\003'
                break label0;

            case 2: // '\002'
                addMessagePreference(0x7f0900a0);
                break;
            }
            mLastInfo = null;
            mLastState = null;
            mScanner.pause();
            return;
        }
        mScanner.resume();
    }

    void forget()
    {
        if (mSelectedAccessPoint.mNetworkId == -1)
        {
            Xlog.e("WifiSettings", (new StringBuilder()).append("Failed to forget invalid network ").append(mSelectedAccessPoint.getConfig()).toString());
            return;
        }
        mWifiManager.forget(mSelectedAccessPoint.mNetworkId, mForgetListener);
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
        updateAccessPoints();
        changeNextButtonState(false);
    }

    protected boolean hasSimProblem()
    {
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        return telephonymanager != null && telephonymanager.getCurrentPhoneType() == 1 && telephonymanager.getSimState() != 5 && telephonymanager.getSimState() != 0;
    }

    public void onActivityCreated(Bundle bundle)
    {
label0:
        {
            super.onActivityCreated(bundle);
            mExt = Utils.getWifiSettingsPlugin(getActivity());
            mTelephonyManagerEx = TelephonyManagerEx.getDefault();
            mWifiManager = (WifiManager)getActivity().getApplicationContext().getSystemService("wifi");
            mConnectListener = new android.net.wifi.WifiManager.ActionListener() {

                final WifiSettings this$0;

                public void onFailure(int i)
                {
                    Activity activity1 = getActivity();
                    if (activity1 != null)
                        Toast.makeText(activity1, 0x7f090113, 0).show();
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
                        Toast.makeText(activity1, 0x7f090114, 0).show();
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
                        Toast.makeText(activity1, 0x7f090115, 0).show();
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
                    break label0;
                }
            }
            mEnableNextOnConnection = intent.getBooleanExtra("wifi_enable_next_on_connect", false);
            if (mEnableNextOnConnection && hasNextButton())
            {
                ConnectivityManager connectivitymanager = (ConnectivityManager)activity.getSystemService("connectivity");
                if (connectivitymanager != null)
                    changeNextButtonState(connectivitymanager.getNetworkInfo(1).isConnected());
            }
            addPreferencesFromResource(0x7f05000b);
            mWifiEnablerPref = getPreferenceScreen().findPreference("wifi_switch");
            mWifiApCategory = (PreferenceCategory)getPreferenceScreen().findPreference("wifi_aplist");
            mAddNetworkButton = (ButtonPreference)getPreferenceScreen().findPreference("add_network_button");
            mAddNetworkButton.setPrefButtonCallback(mAddNetworkButtonCbk);
            getPreferenceScreen().removePreference(mAddNetworkButton);
            mWifiEnabler = new WifiEnabler(activity, mWifiEnablerPref);
            if (mSetupWizardMode)
                getView().setSystemUiVisibility(0x1e40000);
            if (!mSetupWizardMode)
            {
                Switch switch1 = new Switch(activity);
                if (activity instanceof PreferenceActivity)
                {
                    PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
                    if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane())
                    {
                        switch1.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f080000), 0);
                        activity.getActionBar().setDisplayOptions(16, 16);
                        activity.getActionBar().setCustomView(switch1, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
                    }
                }
            }
            mEmptyView = (TextView)getView().findViewById(0x1020004);
            getListView().setEmptyView(mEmptyView);
            if (!mSetupWizardMode)
            {
                registerForContextMenu(getListView());
                return;
            }
        }
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

                    case 9: // '\t'
                        showDialog(mSelectedAccessPoint, flag);
                        return flag;

                    case 8: // '\b'
                        mWifiManager.forget(mSelectedAccessPoint.mNetworkId, mForgetListener);
                        return flag;

                    case 7: // '\007'
                        break;
                    }
                    if (mSelectedAccessPoint.mNetworkId == -1)
                        break label1;
                    if (!requireKeyStore(mSelectedAccessPoint.getConfig()))
                    {
                        mWifiManager.connect(mSelectedAccessPoint.mNetworkId, mConnectListener);
                        return flag;
                    }
                }
                return flag;
            }
            if (mSelectedAccessPoint.mSecurity == 0)
            {
                mSelectedAccessPoint.generateOpenNetworkConfig();
                mWifiManager.connect(mSelectedAccessPoint.getConfig(), mConnectListener);
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
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        if (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo)
        {
            Preference preference = (Preference)getListView().getItemAtPosition(((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).position);
            if (preference instanceof AccessPoint)
            {
                mSelectedAccessPoint = (AccessPoint)preference;
                contextmenu.setHeaderTitle(mSelectedAccessPoint.mSsid);
                if (mSelectedAccessPoint.getLevel() != -1 && mSelectedAccessPoint.getState() == null)
                    contextmenu.add(0, 7, 0, 0x7f0900ac);
                if (mSelectedAccessPoint.mNetworkId != -1)
                {
                    if (mExt.shouldAddForgetMenu(mSelectedAccessPoint.mSsid, mSelectedAccessPoint.mSecurity))
                        contextmenu.add(0, 8, 0, 0x7f0900ad);
                    contextmenu.add(0, 9, 0, 0x7f0900ae);
                }
            }
        }
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 5: // '\005'
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(0x7f090099).setCancelable(false).setNegativeButton(0x7f090096, new android.content.DialogInterface.OnClickListener() {

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
).setPositiveButton(0x7f090097, new android.content.DialogInterface.OnClickListener() {

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
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(0x7f090098).setCancelable(false).setNegativeButton(0x7f090096, new android.content.DialogInterface.OnClickListener() {

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
).setPositiveButton(0x7f090097, new android.content.DialogInterface.OnClickListener() {

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

        case 1: // '\001'
            AccessPoint accesspoint = mDlgAccessPoint;
            if (accesspoint == null && mAccessPointSavedState != null)
            {
                accesspoint = new AccessPoint(getActivity(), mAccessPointSavedState);
                mDlgAccessPoint = accesspoint;
            }
            mSelectedAccessPoint = accesspoint;
            mDialog = new WifiDialog(getActivity(), this, accesspoint, mDlgEdit);
            return mDialog;

        case 2: // '\002'
        case 3: // '\003'
        default:
            return super.onCreateDialog(i);
        }
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        if (mSetupWizardMode)
        {
            View view = layoutinflater.inflate(0x7f030018, viewgroup, false);
            view.findViewById(0x7f0b004f).setOnClickListener(new android.view.View.OnClickListener() {

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
            Intent intent = getActivity().getIntent();
            if (intent.getBooleanExtra("wifi_show_custom_button", false))
            {
                view.findViewById(0x7f0b004a).setVisibility(0);
                view.findViewById(0x7f0b0052).setVisibility(4);
                view.findViewById(0x7f0b0054).setVisibility(4);
                view.findViewById(0x7f0b0055).setVisibility(4);
                Button button = (Button)view.findViewById(0x7f0b0053);
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
                view.findViewById(0x7f0b004d).setVisibility(0);
            return view;
        } else
        {
            return super.onCreateView(layoutinflater, viewgroup, bundle);
        }
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
            if (mSelectedAccessPoint.mSecurity == 0 && mSelectedAccessPoint.mNetworkId == -1)
            {
                mSelectedAccessPoint.generateOpenNetworkConfig();
                mWifiManager.connect(mSelectedAccessPoint.getConfig(), mConnectListener);
            } else
            {
                showDialog(mSelectedAccessPoint, false);
            }
            return true;
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

    void submit(WifiConfigController wificonfigcontroller)
    {
        WifiConfiguration wificonfiguration = wificonfigcontroller.getConfig();
        if (wificonfiguration == null) goto _L2; else goto _L1
_L1:
        if (wificonfiguration.imsi == null || !wificonfiguration.toString().contains("eap: SIM") && !wificonfiguration.toString().contains("eap: AKA")) goto _L2; else goto _L3
_L3:
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", 0) == 1)
        {
            Toast.makeText(getActivity(), 0x7f09011f, 1).show();
            return;
        }
        if (wificonfiguration.imsi.equals("\"error\""))
        {
            Toast.makeText(getActivity(), 0x7f090120, 1).show();
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
        Xlog.d("WifiSettings", "onClick() >>if ((mConfig.SSID).equals(mSelectedAccessPoint.mSsid)) {");
        Xlog.d("WifiSettings", (new StringBuilder()).append("onClick()").append(wificonfiguration1.SSID).toString());
        Xlog.d("WifiSettings", (new StringBuilder()).append("onClick() ").append(mSelectedAccessPoint.mSsid).toString());
        if (wificonfiguration1 == null || wificonfiguration1.SSID == null || !wificonfiguration1.SSID.equals(WifiDialog.addQuote(mSelectedAccessPoint.mSsid)) || android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", 0) != 1 || !wificonfiguration1.toString().contains("eap: SIM") && !wificonfiguration1.toString().contains("eap: AKA")) goto _L11; else goto _L10
_L10:
        Xlog.d("WifiSettings", "remind user: cannot user eap-sim/aka under airplane mode");
        Toast.makeText(getActivity(), 0x7f09011f, 1).show();
        return;
_L4:
        if (!wificonfiguration.imsi.equals("\"none\"")) goto _L2; else goto _L12
_L12:
        Toast.makeText(getActivity(), 0x7f090121, 1).show();
        return;
_L8:
        if (mSelectedAccessPoint != null && !requireKeyStore(mSelectedAccessPoint.getConfig()) && mSelectedAccessPoint.mNetworkId != -1 && mSelectedAccessPoint.getState() == null)
            mWifiManager.connect(mSelectedAccessPoint.mNetworkId, mConnectListener);
_L14:
        if (mWifiManager.isWifiEnabled())
            mScanner.resume();
        updateAccessPoints();
        return;
_L6:
        if (wificonfiguration.networkId != -1)
        {
            if (mSelectedAccessPoint != null)
                mWifiManager.save(wificonfiguration, mSaveListener);
        } else
        if (wificonfigcontroller.isEdit() || requireKeyStore(wificonfiguration))
            mWifiManager.save(wificonfiguration, mSaveListener);
        else
            mWifiManager.connect(wificonfiguration, mConnectListener);
        if (true) goto _L14; else goto _L13
_L13:
    }





}
