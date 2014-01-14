// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Activity;
import android.app.FragmentManager;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.*;

// Referenced classes of package com.android.settings.wifi:
//            WifiSettings, WifiConfigUiForSetupWizardXL, WifiConfigController, AccessPoint, 
//            Summary

public class WifiSettingsForSetupWizardXL extends Activity
    implements android.view.View.OnClickListener
{

    private static final boolean DEBUG = true;
    private static final String EXTRA_PREFS_LANDSCAPE_LOCK = "extra_prefs_landscape_lock";
    private static final String EXTRA_PREFS_PORTRAIT_LOCK = "extra_prefs_portrait_lock";
    private static final int SCREEN_STATE_CONNECTED = 3;
    private static final int SCREEN_STATE_CONNECTING = 2;
    private static final int SCREEN_STATE_DISCONNECTED = 0;
    private static final int SCREEN_STATE_EDITING = 1;
    private static final String TAG = "SetupWizard";
    private static final EnumMap sNetworkStateMap;
    private Button mAddNetworkButton;
    private Button mBackButton;
    private View mBottomPadding;
    private Button mConnectButton;
    private View mConnectingStatusLayout;
    private TextView mConnectingStatusView;
    private View mContentPadding;
    private CharSequence mEditingTitle;
    private InputMethodManager mInputMethodManager;
    private CharSequence mNetworkName;
    private android.net.NetworkInfo.DetailedState mPreviousNetworkState;
    private ProgressBar mProgressBar;
    private Button mRefreshButton;
    private int mScreenState;
    private Button mSkipOrNextButton;
    private TextView mTitleView;
    private View mTopDividerNoProgress;
    private View mTopPadding;
    private WifiConfigUiForSetupWizardXL mWifiConfig;
    private WifiManager mWifiManager;
    private WifiSettings mWifiSettings;
    private View mWifiSettingsFragmentLayout;

    public WifiSettingsForSetupWizardXL()
    {
        mNetworkName = "";
        mScreenState = 0;
        mPreviousNetworkState = android.net.NetworkInfo.DetailedState.DISCONNECTED;
    }

    private void hideSoftwareKeyboard()
    {
        Log.i("SetupWizard", "Hiding software keyboard.");
        View view = getCurrentFocus();
        if (view != null)
            mInputMethodManager.hideSoftInputFromWindow(view.getWindowToken(), 0);
    }

    private void initViews()
    {
        Intent intent = getIntent();
        if (intent.getBooleanExtra("firstRun", false))
            findViewById(0x7f080062).setSystemUiVisibility(0x400000);
        if (intent.getBooleanExtra("extra_prefs_landscape_lock", false))
            setRequestedOrientation(6);
        if (intent.getBooleanExtra("extra_prefs_portrait_lock", false))
            setRequestedOrientation(7);
        mTitleView = (TextView)findViewById(0x7f080225);
        mProgressBar = (ProgressBar)findViewById(0x7f080226);
        mProgressBar.setMax(2);
        mTopDividerNoProgress = findViewById(0x7f080227);
        mBottomPadding = findViewById(0x7f080231);
        mProgressBar.setVisibility(0);
        mProgressBar.setIndeterminate(true);
        mTopDividerNoProgress.setVisibility(8);
        mAddNetworkButton = (Button)findViewById(0x7f080233);
        mAddNetworkButton.setOnClickListener(this);
        mRefreshButton = (Button)findViewById(0x7f080237);
        mRefreshButton.setOnClickListener(this);
        mSkipOrNextButton = (Button)findViewById(0x7f080236);
        mSkipOrNextButton.setOnClickListener(this);
        mConnectButton = (Button)findViewById(0x7f080235);
        mConnectButton.setOnClickListener(this);
        mBackButton = (Button)findViewById(0x7f080234);
        mBackButton.setOnClickListener(this);
        mTopPadding = findViewById(0x7f080224);
        mContentPadding = findViewById(0x7f08022a);
        mWifiSettingsFragmentLayout = findViewById(0x7f08022b);
        mConnectingStatusLayout = findViewById(0x7f08022e);
        mConnectingStatusView = (TextView)findViewById(0x7f08022f);
    }

    private void onAddNetworkButtonPressed()
    {
        mWifiSettings.onAddNetworkPressed();
    }

    private void onAuthenticationFailure()
    {
        mScreenState = 1;
        mSkipOrNextButton.setVisibility(8);
        mConnectButton.setVisibility(0);
        mConnectButton.setEnabled(true);
        if (!TextUtils.isEmpty(mEditingTitle))
        {
            mTitleView.setText(mEditingTitle);
        } else
        {
            Log.w("SetupWizard", "Title during editing/adding a network was empty.");
            showEditingTitle();
        }
        ((ViewGroup)findViewById(0x7f08022d)).setVisibility(0);
        mConnectingStatusLayout.setVisibility(8);
        showDisconnectedProgressBar();
        setPaddingVisibility(8);
    }

    private void onBackButtonPressed()
    {
        if (mScreenState != 2 && mScreenState != 3)
        {
            mScreenState = 0;
            mWifiSettings.resumeWifiScan();
            restoreFirstVisibilityState();
            mAddNetworkButton.setEnabled(true);
            mRefreshButton.setEnabled(true);
            mSkipOrNextButton.setEnabled(true);
            showDisconnectedProgressBar();
            mWifiSettingsFragmentLayout.setVisibility(0);
            mBottomPadding.setVisibility(8);
        } else
        {
            Log.d("SetupWizard", "Back button pressed after connect action.");
            mScreenState = 0;
            restoreFirstVisibilityState();
            mSkipOrNextButton.setEnabled(true);
            changeNextButtonState(false);
            showScanningState();
            WifiConfiguration wificonfiguration;
            for (Iterator iterator = mWifiManager.getConfiguredNetworks().iterator(); iterator.hasNext(); mWifiManager.forget(wificonfiguration.networkId, new android.net.wifi.WifiManager.ActionListener() {

        final WifiSettingsForSetupWizardXL this$0;

        public void onFailure(int i)
        {
        }

        public void onSuccess()
        {
        }

            
            {
                this$0 = WifiSettingsForSetupWizardXL.this;
                super();
            }
    }
))
            {
                wificonfiguration = (WifiConfiguration)iterator.next();
                Object aobj[] = new Object[2];
                aobj[0] = wificonfiguration.SSID;
                aobj[1] = Integer.valueOf(wificonfiguration.networkId);
                Log.d("SetupWizard", String.format("forgeting Wi-Fi network \"%s\" (id: %d)", aobj));
            }

            mWifiSettingsFragmentLayout.setVisibility(8);
            refreshAccessPoints(true);
        }
        setPaddingVisibility(0);
        mConnectingStatusLayout.setVisibility(8);
        ViewGroup viewgroup = (ViewGroup)findViewById(0x7f08022d);
        viewgroup.removeAllViews();
        viewgroup.setVisibility(8);
        mWifiConfig = null;
    }

    private void onEapNetworkSelected()
    {
        mConnectButton.setVisibility(8);
        mBackButton.setText(0x7f0b0816);
    }

    private void refreshAccessPoints(boolean flag)
    {
        showScanningState();
        if (flag)
            mWifiManager.disconnect();
        mWifiSettings.refreshAccessPoints();
    }

    private void restoreFirstVisibilityState()
    {
        showDefaultTitle();
        mAddNetworkButton.setVisibility(0);
        mRefreshButton.setVisibility(0);
        mSkipOrNextButton.setVisibility(0);
        mConnectButton.setVisibility(8);
        mBackButton.setVisibility(8);
        setPaddingVisibility(0);
    }

    private void showAddNetworkTitle()
    {
        mNetworkName = "";
        mTitleView.setText(0x7f0b0810);
    }

    private void showConnectedProgressBar()
    {
        showTopDividerWithProgressBar();
        mProgressBar.setIndeterminate(false);
        mProgressBar.setProgress(2);
    }

    private void showConnectedState()
    {
        mScreenState = 3;
        hideSoftwareKeyboard();
        setPaddingVisibility(0);
        showConnectedTitle();
        showConnectedProgressBar();
        mWifiSettingsFragmentLayout.setVisibility(8);
        mConnectingStatusLayout.setVisibility(0);
        mConnectingStatusView.setText(0x7f0b0827);
        mConnectButton.setVisibility(8);
        mAddNetworkButton.setVisibility(8);
        mRefreshButton.setVisibility(8);
        mBackButton.setVisibility(0);
        mBackButton.setText(0x7f0b0816);
        mSkipOrNextButton.setVisibility(0);
        mSkipOrNextButton.setEnabled(true);
    }

    private void showConnectedTitle()
    {
        if (TextUtils.isEmpty(mNetworkName) && mWifiConfig != null)
            if (mWifiConfig.getController() != null && mWifiConfig.getController().getConfig() != null)
                mNetworkName = mWifiConfig.getController().getConfig().SSID;
            else
                Log.w("SetupWizard", "Unexpected null found (WifiController or WifiConfig is null). Ignore them.");
        TextView textview = mTitleView;
        Object aobj[] = new Object[1];
        aobj[0] = mNetworkName;
        textview.setText(getString(0x7f0b080f, aobj));
    }

    private void showConnectingProgressBar()
    {
        showTopDividerWithProgressBar();
        mProgressBar.setIndeterminate(false);
        mProgressBar.setProgress(1);
    }

    private void showConnectingState()
    {
        mScreenState = 2;
        mBackButton.setVisibility(0);
        mEditingTitle = mTitleView.getText();
        showConnectingTitle();
        showConnectingProgressBar();
        setPaddingVisibility(0);
    }

    private void showConnectingTitle()
    {
        if (TextUtils.isEmpty(mNetworkName) && mWifiConfig != null)
            if (mWifiConfig.getController() != null && mWifiConfig.getController().getConfig() != null)
                mNetworkName = mWifiConfig.getController().getConfig().SSID;
            else
                Log.w("SetupWizard", "Unexpected null found (WifiController or WifiConfig is null). Ignore them.");
        TextView textview = mTitleView;
        Object aobj[] = new Object[1];
        aobj[0] = mNetworkName;
        textview.setText(getString(0x7f0b080e, aobj));
    }

    private void showDefaultTitle()
    {
        mTitleView.setText(getString(0x7f0b080c));
    }

    private void showDisconnectedProgressBar()
    {
        if (mScreenState == 0)
        {
            mProgressBar.setVisibility(8);
            mProgressBar.setIndeterminate(false);
            mTopDividerNoProgress.setVisibility(0);
            return;
        } else
        {
            mProgressBar.setVisibility(0);
            mProgressBar.setIndeterminate(false);
            mProgressBar.setProgress(0);
            mTopDividerNoProgress.setVisibility(8);
            return;
        }
    }

    private void showDisconnectedState(String s)
    {
        showDisconnectedProgressBar();
        if (mScreenState == 0 && mWifiSettings.getAccessPointsCount() > 0)
        {
            mWifiSettingsFragmentLayout.setVisibility(0);
            mBottomPadding.setVisibility(8);
        }
        mAddNetworkButton.setEnabled(true);
        mRefreshButton.setEnabled(true);
    }

    private void showEditingButtonState()
    {
        mSkipOrNextButton.setVisibility(8);
        mAddNetworkButton.setVisibility(8);
        mRefreshButton.setVisibility(8);
        mBackButton.setVisibility(0);
    }

    private void showEditingTitle()
    {
        if (TextUtils.isEmpty(mNetworkName) && mWifiConfig != null)
            if (mWifiConfig.getController() != null && mWifiConfig.getController().getConfig() != null)
                mNetworkName = mWifiConfig.getController().getConfig().SSID;
            else
                Log.w("SetupWizard", "Unexpected null found (WifiController or WifiConfig is null). Ignore them.");
        TextView textview = mTitleView;
        Object aobj[] = new Object[1];
        aobj[0] = mNetworkName;
        textview.setText(getString(0x7f0b080d, aobj));
    }

    private void showScanningProgressBar()
    {
        showTopDividerWithProgressBar();
        mProgressBar.setIndeterminate(true);
    }

    private void showScanningState()
    {
        setPaddingVisibility(0);
        mWifiSettingsFragmentLayout.setVisibility(8);
        showScanningProgressBar();
    }

    private void showTopDividerWithProgressBar()
    {
        mProgressBar.setVisibility(0);
        mTopDividerNoProgress.setVisibility(8);
        mBottomPadding.setVisibility(8);
    }

    void changeNextButtonState(boolean flag)
    {
        if (flag)
        {
            mSkipOrNextButton.setText(0x7f0b0815);
            return;
        } else
        {
            mSkipOrNextButton.setText(0x7f0b0814);
            return;
        }
    }

    boolean initSecurityFields(View view, int i)
    {
        view.findViewById(0x7f0801e6).setVisibility(8);
        view.findViewById(0x7f0801e7).setVisibility(8);
        view.findViewById(0x7f0801e9).setVisibility(0);
        view.findViewById(0x7f0801ea).setVisibility(0);
        if (i == 5)
        {
            setPaddingVisibility(0);
            hideSoftwareKeyboard();
            if (view.findViewById(0x7f0801e8).getVisibility() == 0)
                view.findViewById(0x7f0801e7).setVisibility(0);
            else
                view.findViewById(0x7f0801e6).setVisibility(0);
            view.findViewById(0x7f0801eb).setVisibility(8);
            view.findViewById(0x7f0801e9).setVisibility(8);
            view.findViewById(0x7f0801ea).setVisibility(8);
            onEapNetworkSelected();
            return false;
        }
        mConnectButton.setVisibility(0);
        setPaddingVisibility(8);
        if (mWifiConfig != null)
            if (i != 2 && i != 1)
                mWifiConfig.requestFocusAndShowKeyboard(0x7f0801d7);
            else
                mWifiConfig.requestFocusAndShowKeyboard(0x7f0801bb);
        return true;
    }

    void onAccessPointsUpdated(PreferenceScreen preferencescreen, Collection collection)
    {
        if (mProgressBar.isIndeterminate() && collection.size() > 0)
        {
            showDisconnectedProgressBar();
            if (mScreenState == 0)
            {
                mWifiSettingsFragmentLayout.setVisibility(0);
                mBottomPadding.setVisibility(8);
            }
            mAddNetworkButton.setEnabled(true);
            mRefreshButton.setEnabled(true);
        }
        AccessPoint accesspoint;
        for (Iterator iterator = collection.iterator(); iterator.hasNext(); preferencescreen.addPreference(accesspoint))
        {
            accesspoint = (AccessPoint)iterator.next();
            accesspoint.setLayoutResource(0x7f040023);
        }

    }

    public void onClick(View view)
    {
        hideSoftwareKeyboard();
        if (view == mAddNetworkButton)
        {
            Log.d("SetupWizard", "AddNetwork button pressed");
            onAddNetworkButtonPressed();
        } else
        {
            if (view == mRefreshButton)
            {
                Log.d("SetupWizard", "Refresh button pressed");
                refreshAccessPoints(true);
                return;
            }
            if (view == mSkipOrNextButton)
            {
                Log.d("SetupWizard", "Skip/Next button pressed");
                if (TextUtils.equals(getString(0x7f0b0814), ((Button)view).getText()))
                {
                    mWifiManager.setWifiEnabled(false);
                    setResult(1);
                } else
                {
                    setResult(-1);
                }
                finish();
                return;
            }
            if (view == mConnectButton)
            {
                Log.d("SetupWizard", "Connect button pressed");
                onConnectButtonPressed();
                return;
            }
            if (view == mBackButton)
            {
                Log.d("SetupWizard", "Back button pressed");
                onBackButtonPressed();
                return;
            }
        }
    }

    void onConnectButtonPressed()
    {
        mScreenState = 2;
        mWifiSettings.submit(mWifiConfig.getController());
        showConnectingState();
        mBackButton.setVisibility(0);
        mBackButton.setText(0x7f0b0816);
        ((ViewGroup)findViewById(0x7f08022d)).setVisibility(8);
        mConnectingStatusLayout.setVisibility(0);
        mConnectingStatusView.setText(0x7f0b0826);
        mSkipOrNextButton.setVisibility(0);
        mSkipOrNextButton.setEnabled(false);
        mConnectButton.setVisibility(8);
        mAddNetworkButton.setVisibility(8);
        mRefreshButton.setVisibility(8);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(0x7f0400ae);
        mWifiManager = (WifiManager)getApplicationContext().getSystemService("wifi");
        mWifiManager.setWifiEnabled(true);
        mWifiSettings = (WifiSettings)getFragmentManager().findFragmentById(0x7f08022c);
        mInputMethodManager = (InputMethodManager)getSystemService("input_method");
        initViews();
        showScanningState();
    }

    void onSaveNetwork(WifiConfiguration wificonfiguration)
    {
        mWifiManager.connect(wificonfiguration, new android.net.wifi.WifiManager.ActionListener() {

            final WifiSettingsForSetupWizardXL this$0;

            public void onFailure(int i)
            {
            }

            public void onSuccess()
            {
            }

            
            {
                this$0 = WifiSettingsForSetupWizardXL.this;
                super();
            }
        }
);
    }

    void onSupplicantStateChanged(Intent intent)
    {
        if (intent.getIntExtra("supplicantError", -1) == 1)
        {
            Log.i("SetupWizard", "Received authentication error event.");
            onAuthenticationFailure();
        }
    }

    void setPaddingVisibility(int i)
    {
        mTopPadding.setVisibility(i);
        mContentPadding.setVisibility(i);
    }

    void showConfigUi(AccessPoint accesspoint, boolean flag)
    {
        mScreenState = 1;
        if (accesspoint != null && (accesspoint.security == 1 || accesspoint.security == 2))
            flag = true;
        mWifiSettings.pauseWifiScan();
        mWifiSettingsFragmentLayout.setVisibility(8);
        mConnectingStatusLayout.setVisibility(8);
        ViewGroup viewgroup = (ViewGroup)findViewById(0x7f08022d);
        viewgroup.setVisibility(0);
        viewgroup.removeAllViews();
        mWifiConfig = new WifiConfigUiForSetupWizardXL(this, viewgroup, accesspoint, flag);
        if (accesspoint == null)
        {
            showAddNetworkTitle();
            mConnectButton.setVisibility(0);
            showDisconnectedProgressBar();
            showEditingButtonState();
            return;
        }
        if (accesspoint.security == 0)
        {
            mNetworkName = accesspoint.getTitle().toString();
            mConnectButton.performClick();
            return;
        }
        mNetworkName = accesspoint.getTitle().toString();
        showEditingTitle();
        showDisconnectedProgressBar();
        showEditingButtonState();
        if (accesspoint.security == 5)
        {
            onEapNetworkSelected();
            return;
        } else
        {
            mConnectButton.setVisibility(0);
            mConnectButton.setText(0x7f0b048a);
            mBackButton.setText(0x7f0b081b);
            return;
        }
    }

    void updateConnectionState(android.net.NetworkInfo.DetailedState detailedstate)
    {
        android.net.NetworkInfo.DetailedState detailedstate1 = (android.net.NetworkInfo.DetailedState)sNetworkStateMap.get(detailedstate);
        if (detailedstate == android.net.NetworkInfo.DetailedState.FAILED)
            refreshAccessPoints(true);
        static class _cls3
        {

            static final int $SwitchMap$android$net$NetworkInfo$DetailedState[];

            static 
            {
                $SwitchMap$android$net$NetworkInfo$DetailedState = new int[android.net.NetworkInfo.DetailedState.values().length];
                try
                {
                    $SwitchMap$android$net$NetworkInfo$DetailedState[android.net.NetworkInfo.DetailedState.SCANNING.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$android$net$NetworkInfo$DetailedState[android.net.NetworkInfo.DetailedState.CONNECTING.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$android$net$NetworkInfo$DetailedState[android.net.NetworkInfo.DetailedState.CONNECTED.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        switch (_cls3..SwitchMap.android.net.NetworkInfo.DetailedState[detailedstate1.ordinal()])
        {
        case 3: // '\003'
            showConnectedState();
            break;

        case 2: // '\002'
            if (mScreenState == 2)
                showConnectingState();
            break;

        case 1: // '\001'
            if (mScreenState == 0)
            {
                if (mWifiSettings.getAccessPointsCount() == 0)
                {
                    showScanningState();
                } else
                {
                    showDisconnectedProgressBar();
                    mWifiSettingsFragmentLayout.setVisibility(0);
                    mBottomPadding.setVisibility(8);
                }
            } else
            {
                showDisconnectedProgressBar();
            }
            break;

        default:
            if (mScreenState != 3 && mWifiSettings.getAccessPointsCount() > 0)
                showDisconnectedState(Summary.get(this, detailedstate1));
            break;
        }
        mPreviousNetworkState = detailedstate1;
    }

    static 
    {
        sNetworkStateMap = new EnumMap(android/net/NetworkInfo$DetailedState);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.IDLE, android.net.NetworkInfo.DetailedState.DISCONNECTED);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.SCANNING, android.net.NetworkInfo.DetailedState.SCANNING);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.CONNECTING, android.net.NetworkInfo.DetailedState.CONNECTING);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.AUTHENTICATING, android.net.NetworkInfo.DetailedState.CONNECTING);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.OBTAINING_IPADDR, android.net.NetworkInfo.DetailedState.CONNECTING);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.CONNECTED, android.net.NetworkInfo.DetailedState.CONNECTED);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.SUSPENDED, android.net.NetworkInfo.DetailedState.SUSPENDED);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.DISCONNECTING, android.net.NetworkInfo.DetailedState.DISCONNECTED);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.DISCONNECTED, android.net.NetworkInfo.DetailedState.DISCONNECTED);
        sNetworkStateMap.put(android.net.NetworkInfo.DetailedState.FAILED, android.net.NetworkInfo.DetailedState.FAILED);
    }
}
