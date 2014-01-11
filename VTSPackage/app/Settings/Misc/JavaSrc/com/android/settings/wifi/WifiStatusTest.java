// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

// Referenced classes of package com.android.settings.wifi:
//            Summary

public class WifiStatusTest extends Activity
{

    private static final String TAG = "WifiStatusTest";
    private TextView mBSSID;
    private TextView mHiddenSSID;
    private TextView mHttpClientTest;
    private String mHttpClientTestResult;
    private TextView mIPAddr;
    private TextView mLinkSpeed;
    private TextView mMACAddr;
    private TextView mNetworkId;
    private TextView mNetworkState;
    android.view.View.OnClickListener mPingButtonHandler;
    private TextView mPingHostname;
    private String mPingHostnameResult;
    private TextView mPingIpAddr;
    private String mPingIpAddrResult;
    private TextView mRSSI;
    private TextView mSSID;
    private TextView mScanList;
    private TextView mSupplicantState;
    private WifiManager mWifiManager;
    private TextView mWifiState;
    private IntentFilter mWifiStateFilter;
    private final BroadcastReceiver mWifiStateReceiver = new BroadcastReceiver() {

        final WifiStatusTest this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.net.wifi.WIFI_STATE_CHANGED"))
            {
                handleWifiStateChanged(intent.getIntExtra("wifi_state", 4));
            } else
            {
                if (intent.getAction().equals("android.net.wifi.STATE_CHANGE"))
                {
                    handleNetworkStateChanged((NetworkInfo)intent.getParcelableExtra("networkInfo"));
                    return;
                }
                if (intent.getAction().equals("android.net.wifi.SCAN_RESULTS"))
                {
                    handleScanResultsAvailable();
                    return;
                }
                if (!intent.getAction().equals("android.net.wifi.supplicant.CONNECTION_CHANGE"))
                {
                    if (intent.getAction().equals("android.net.wifi.supplicant.STATE_CHANGE"))
                    {
                        handleSupplicantStateChanged((SupplicantState)intent.getParcelableExtra("newState"), intent.hasExtra("supplicantError"), intent.getIntExtra("supplicantError", 0));
                        return;
                    }
                    if (intent.getAction().equals("android.net.wifi.RSSI_CHANGED"))
                    {
                        handleSignalChanged(intent.getIntExtra("newRssi", 0));
                        return;
                    }
                    if (!intent.getAction().equals("android.net.wifi.NETWORK_IDS_CHANGED"))
                    {
                        Log.e("WifiStatusTest", "Received an unknown Wifi Intent");
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = WifiStatusTest.this;
                super();
            }
    }
;
    private Button pingTestButton;
    private Button updateButton;
    android.view.View.OnClickListener updateButtonHandler;

    public WifiStatusTest()
    {
        mPingButtonHandler = new android.view.View.OnClickListener() {

            final WifiStatusTest this$0;

            public void onClick(View view)
            {
                updatePingState();
            }

            
            {
                this$0 = WifiStatusTest.this;
                super();
            }
        }
;
        updateButtonHandler = new android.view.View.OnClickListener() {

            final WifiStatusTest this$0;

            public void onClick(View view)
            {
                WifiInfo wifiinfo = mWifiManager.getConnectionInfo();
                setWifiStateText(mWifiManager.getWifiState());
                mBSSID.setText(wifiinfo.getBSSID());
                mHiddenSSID.setText(String.valueOf(wifiinfo.getHiddenSSID()));
                int i = wifiinfo.getIpAddress();
                StringBuffer stringbuffer = new StringBuffer();
                StringBuffer stringbuffer1 = stringbuffer.append(i & 0xff).append('.');
                int j = i >>> 8;
                StringBuffer stringbuffer2 = stringbuffer1.append(j & 0xff).append('.');
                int k = j >>> 8;
                stringbuffer2.append(k & 0xff).append('.').append(0xff & k >>> 8);
                mIPAddr.setText(stringbuffer);
                mLinkSpeed.setText((new StringBuilder()).append(String.valueOf(wifiinfo.getLinkSpeed())).append(" Mbps").toString());
                mMACAddr.setText(wifiinfo.getMacAddress());
                mNetworkId.setText(String.valueOf(wifiinfo.getNetworkId()));
                mRSSI.setText(String.valueOf(wifiinfo.getRssi()));
                mSSID.setText(wifiinfo.getSSID());
                SupplicantState supplicantstate = wifiinfo.getSupplicantState();
                setSupplicantStateText(supplicantstate);
            }

            
            {
                this$0 = WifiStatusTest.this;
                super();
            }
        }
;
    }

    private void handleNetworkStateChanged(NetworkInfo networkinfo)
    {
        if (mWifiManager.isWifiEnabled())
        {
            String s = Summary.get(this, mWifiManager.getConnectionInfo().getSSID(), networkinfo.getDetailedState());
            mNetworkState.setText(s);
        }
    }

    private void handleScanResultsAvailable()
    {
        List list = mWifiManager.getScanResults();
        StringBuffer stringbuffer = new StringBuffer();
        if (list != null)
        {
            for (int i = -1 + list.size(); i >= 0; i--)
            {
                ScanResult scanresult = (ScanResult)list.get(i);
                if (scanresult != null && !TextUtils.isEmpty(scanresult.SSID))
                    stringbuffer.append((new StringBuilder()).append(scanresult.SSID).append(" ").toString());
            }

        }
        mScanList.setText(stringbuffer);
    }

    private void handleSignalChanged(int i)
    {
        mRSSI.setText(String.valueOf(i));
    }

    private void handleSupplicantStateChanged(SupplicantState supplicantstate, boolean flag, int i)
    {
        if (flag)
        {
            mSupplicantState.setText("ERROR AUTHENTICATING");
            return;
        } else
        {
            setSupplicantStateText(supplicantstate);
            return;
        }
    }

    private void handleWifiStateChanged(int i)
    {
        setWifiStateText(i);
    }

    private void httpClientTest()
    {
        DefaultHttpClient defaulthttpclient = new DefaultHttpClient();
        HttpGet httpget;
        HttpResponse httpresponse;
        httpget = new HttpGet("http://www.google.com");
        httpresponse = defaulthttpclient.execute(httpget);
        if (httpresponse.getStatusLine().getStatusCode() != 200)
            break MISSING_BLOCK_LABEL_58;
        mHttpClientTestResult = "Pass";
_L1:
        httpget.abort();
        return;
        try
        {
            mHttpClientTestResult = (new StringBuilder()).append("Fail: Code: ").append(String.valueOf(httpresponse)).toString();
        }
        catch (IOException ioexception)
        {
            mHttpClientTestResult = "Fail: IOException";
            return;
        }
          goto _L1
    }

    private final void pingHostname()
    {
        if (Runtime.getRuntime().exec("ping -c 1 -w 100 www.google.com").waitFor() == 0)
        {
            mPingHostnameResult = "Pass";
            return;
        }
        try
        {
            mPingHostnameResult = "Fail: Host unreachable";
            return;
        }
        catch (UnknownHostException unknownhostexception)
        {
            mPingHostnameResult = "Fail: Unknown Host";
            return;
        }
        catch (IOException ioexception)
        {
            mPingHostnameResult = "Fail: IOException";
            return;
        }
        catch (InterruptedException interruptedexception)
        {
            mPingHostnameResult = "Fail: InterruptedException";
        }
        return;
    }

    private final void pingIpAddr()
    {
        if (Runtime.getRuntime().exec((new StringBuilder()).append("ping -c 1 -w 100 ").append("74.125.47.104").toString()).waitFor() == 0)
        {
            mPingIpAddrResult = "Pass";
            return;
        }
        try
        {
            mPingIpAddrResult = "Fail: IP addr not reachable";
            return;
        }
        catch (IOException ioexception)
        {
            mPingIpAddrResult = "Fail: IOException";
            return;
        }
        catch (InterruptedException interruptedexception)
        {
            mPingIpAddrResult = "Fail: InterruptedException";
        }
        return;
    }

    private void setSupplicantStateText(SupplicantState supplicantstate)
    {
        if (SupplicantState.FOUR_WAY_HANDSHAKE.equals(supplicantstate))
        {
            mSupplicantState.setText("FOUR WAY HANDSHAKE");
            return;
        }
        if (SupplicantState.ASSOCIATED.equals(supplicantstate))
        {
            mSupplicantState.setText("ASSOCIATED");
            return;
        }
        if (SupplicantState.ASSOCIATING.equals(supplicantstate))
        {
            mSupplicantState.setText("ASSOCIATING");
            return;
        }
        if (SupplicantState.COMPLETED.equals(supplicantstate))
        {
            mSupplicantState.setText("COMPLETED");
            return;
        }
        if (SupplicantState.DISCONNECTED.equals(supplicantstate))
        {
            mSupplicantState.setText("DISCONNECTED");
            return;
        }
        if (SupplicantState.DORMANT.equals(supplicantstate))
        {
            mSupplicantState.setText("DORMANT");
            return;
        }
        if (SupplicantState.GROUP_HANDSHAKE.equals(supplicantstate))
        {
            mSupplicantState.setText("GROUP HANDSHAKE");
            return;
        }
        if (SupplicantState.INACTIVE.equals(supplicantstate))
        {
            mSupplicantState.setText("INACTIVE");
            return;
        }
        if (SupplicantState.INVALID.equals(supplicantstate))
        {
            mSupplicantState.setText("INVALID");
            return;
        }
        if (SupplicantState.SCANNING.equals(supplicantstate))
        {
            mSupplicantState.setText("SCANNING");
            return;
        }
        if (SupplicantState.UNINITIALIZED.equals(supplicantstate))
        {
            mSupplicantState.setText("UNINITIALIZED");
            return;
        } else
        {
            mSupplicantState.setText("BAD");
            Log.e("WifiStatusTest", "supplicant state is bad");
            return;
        }
    }

    private void setWifiStateText(int i)
    {
        String s;
        switch (i)
        {
        case 4: // '\004'
            s = getString(0x7f0b04dc);
            break;

        case 3: // '\003'
            s = getString(0x7f0b04db);
            break;

        case 2: // '\002'
            s = getString(0x7f0b04da);
            break;

        case 1: // '\001'
            s = getString(0x7f0b04d9);
            break;

        case 0: // '\0'
            s = getString(0x7f0b04d8);
            break;

        default:
            s = "BAD";
            Log.e("WifiStatusTest", "wifi state is bad");
            break;
        }
        mWifiState.setText(s);
    }

    private final void updatePingState()
    {
        final Handler handler = new Handler();
        mPingIpAddrResult = getResources().getString(0x7f0b028c);
        mPingHostnameResult = getResources().getString(0x7f0b028c);
        mHttpClientTestResult = getResources().getString(0x7f0b028c);
        mPingIpAddr.setText(mPingIpAddrResult);
        mPingHostname.setText(mPingHostnameResult);
        mHttpClientTest.setText(mHttpClientTestResult);
        final Runnable updatePingResults = new Runnable() {

            final WifiStatusTest this$0;

            public void run()
            {
                mPingIpAddr.setText(mPingIpAddrResult);
                mPingHostname.setText(mPingHostnameResult);
                mHttpClientTest.setText(mHttpClientTestResult);
            }

            
            {
                this$0 = WifiStatusTest.this;
                super();
            }
        }
;
        (new Thread() {

            final WifiStatusTest this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                pingIpAddr();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = WifiStatusTest.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
        (new Thread() {

            final WifiStatusTest this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                pingHostname();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = WifiStatusTest.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
        (new Thread() {

            final WifiStatusTest this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                httpClientTest();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = WifiStatusTest.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mWifiManager = (WifiManager)getApplicationContext().getSystemService("wifi");
        mWifiStateFilter = new IntentFilter("android.net.wifi.WIFI_STATE_CHANGED");
        mWifiStateFilter.addAction("android.net.wifi.STATE_CHANGE");
        mWifiStateFilter.addAction("android.net.wifi.SCAN_RESULTS");
        mWifiStateFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        mWifiStateFilter.addAction("android.net.wifi.RSSI_CHANGED");
        mWifiStateFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        registerReceiver(mWifiStateReceiver, mWifiStateFilter);
        setContentView(0x7f0400b0);
        updateButton = (Button)findViewById(0x7f080238);
        updateButton.setOnClickListener(updateButtonHandler);
        mWifiState = (TextView)findViewById(0x7f080239);
        mNetworkState = (TextView)findViewById(0x7f08023a);
        mSupplicantState = (TextView)findViewById(0x7f08023b);
        mRSSI = (TextView)findViewById(0x7f08023c);
        mBSSID = (TextView)findViewById(0x7f08023d);
        mSSID = (TextView)findViewById(0x7f0801d7);
        mHiddenSSID = (TextView)findViewById(0x7f08023e);
        mIPAddr = (TextView)findViewById(0x7f08023f);
        mMACAddr = (TextView)findViewById(0x7f080240);
        mNetworkId = (TextView)findViewById(0x7f080241);
        mLinkSpeed = (TextView)findViewById(0x7f080242);
        mScanList = (TextView)findViewById(0x7f080243);
        mPingIpAddr = (TextView)findViewById(0x7f08013b);
        mPingHostname = (TextView)findViewById(0x7f08013c);
        mHttpClientTest = (TextView)findViewById(0x7f08013d);
        pingTestButton = (Button)findViewById(0x7f08013a);
        pingTestButton.setOnClickListener(mPingButtonHandler);
    }

    protected void onPause()
    {
        super.onPause();
        unregisterReceiver(mWifiStateReceiver);
    }

    protected void onResume()
    {
        super.onResume();
        registerReceiver(mWifiStateReceiver, mWifiStateFilter);
    }


























}
