// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.*;
import android.os.*;
import android.telephony.*;
import android.telephony.cdma.CdmaCellLocation;
import android.telephony.gsm.GsmCellLocation;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.*;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

// Referenced classes of package com.android.settings:
//            BandMode

public class RadioInfo extends Activity
{

    static final String DISABLE_DATA_STR = "Disable data connection";
    static final String ENABLE_DATA_STR = "Enable data connection";
    private static final int EVENT_CFI_CHANGED = 302;
    private static final int EVENT_PHONE_STATE_CHANGED = 100;
    private static final int EVENT_QUERY_NEIGHBORING_CIDS_DONE = 1002;
    private static final int EVENT_QUERY_PREFERRED_TYPE_DONE = 1000;
    private static final int EVENT_QUERY_SMSC_DONE = 1005;
    private static final int EVENT_SERVICE_STATE_CHANGED = 300;
    private static final int EVENT_SET_PREFERRED_TYPE_DONE = 1001;
    private static final int EVENT_SIGNAL_STRENGTH_CHANGED = 200;
    private static final int EVENT_UPDATE_SMSC_DONE = 1006;
    private static final int MENU_ITEM_GET_PDP_LIST = 4;
    private static final int MENU_ITEM_SELECT_BAND = 0;
    private static final int MENU_ITEM_TOGGLE_DATA = 5;
    private static final int MENU_ITEM_VIEW_ADN = 1;
    private static final int MENU_ITEM_VIEW_FDN = 2;
    private static final int MENU_ITEM_VIEW_SDN = 3;
    static final String PROPERTY_IMS_REG_REQUIRED = "persist.radio.imsregrequired";
    static final String PROPERTY_LTE_RAM_DUMP = "persist.radio.ramdump";
    static final String PROPERTY_SMS_OVER_IMS = "persist.radio.imsallowmtsms";
    private final String TAG = "phone";
    private TextView attempts;
    private TextView callState;
    private TextView dBm;
    private TextView disconnects;
    private TextView dnsCheckState;
    private Button dnsCheckToggleButton;
    private TextView gprsState;
    private TextView gsmState;
    private Button imsRegRequiredButton;
    private Button lteRamDumpButton;
    private TextView mCellInfo;
    private List mCellInfoValue;
    private TextView mCfi;
    private boolean mCfiValue;
    private TextView mDeviceId;
    android.view.View.OnClickListener mDnsCheckButtonHandler;
    private android.view.MenuItem.OnMenuItemClickListener mGetPdpList;
    private Handler mHandler;
    private TextView mHttpClientTest;
    private String mHttpClientTestResult;
    android.view.View.OnClickListener mImsRegRequiredHandler;
    private TextView mLocation;
    android.view.View.OnClickListener mLteRamDumpHandler;
    private TextView mMwi;
    private boolean mMwiValue;
    private TextView mNeighboringCids;
    android.view.View.OnClickListener mOemInfoButtonHandler;
    private PhoneStateListener mPhoneStateListener;
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    android.view.View.OnClickListener mPingButtonHandler;
    private TextView mPingHostname;
    private String mPingHostnameResult;
    private TextView mPingIpAddr;
    private String mPingIpAddrResult;
    android.view.View.OnClickListener mPowerButtonHandler;
    android.widget.AdapterView.OnItemSelectedListener mPreferredNetworkHandler;
    private String mPreferredNetworkLabels[] = {
        "WCDMA preferred", "GSM only", "WCDMA only", "GSM auto (PRL)", "CDMA auto (PRL)", "CDMA only", "EvDo only", "GSM/CDMA auto (PRL)", "LTE/CDMA auto (PRL)", "LTE/GSM auto (PRL)", 
        "LTE/GSM/CDMA auto (PRL)", "LTE only", "Unknown"
    };
    android.view.View.OnClickListener mRefreshSmscButtonHandler;
    private android.view.MenuItem.OnMenuItemClickListener mSelectBandCallback;
    android.view.View.OnClickListener mSmsOverImsHandler;
    private TelephonyManager mTelephonyManager;
    private android.view.MenuItem.OnMenuItemClickListener mToggleData;
    android.view.View.OnClickListener mUpdateSmscButtonHandler;
    private android.view.MenuItem.OnMenuItemClickListener mViewADNCallback;
    private android.view.MenuItem.OnMenuItemClickListener mViewFDNCallback;
    private android.view.MenuItem.OnMenuItemClickListener mViewSDNCallback;
    private TextView network;
    private TextView number;
    private Button oemInfoButton;
    private TextView operatorName;
    private Phone phone;
    private Button pingTestButton;
    private Spinner preferredNetworkType;
    private Button radioPowerButton;
    private TextView received;
    private Button refreshSmscButton;
    private TextView resets;
    private TextView roamingState;
    private TextView sent;
    private TextView sentSinceReceived;
    private Button smsOverImsButton;
    private EditText smsc;
    private TextView successes;
    private Button updateSmscButton;

    public RadioInfo()
    {
        phone = null;
        mMwiValue = false;
        mCfiValue = false;
        mPhoneStateListener = new PhoneStateListener() {

            final RadioInfo this$0;

            public void onCallForwardingIndicatorChanged(boolean flag)
            {
                mCfiValue = flag;
                updateCallRedirect();
            }

            public void onCellInfoChanged(List list)
            {
                Log.d("phone", (new StringBuilder()).append("[RadioInfo] onCellInfoChanged: arrayCi=").append(list).toString());
                mCellInfoValue = list;
                updateCellInfoTv();
            }

            public void onCellLocationChanged(CellLocation celllocation)
            {
                updateLocation(celllocation);
            }

            public void onDataActivity(int i)
            {
                updateDataStats2();
            }

            public void onDataConnectionStateChanged(int i)
            {
                updateDataState();
                updateDataStats();
                updatePdpList();
                updateNetworkType();
            }

            public void onMessageWaitingIndicatorChanged(boolean flag)
            {
                mMwiValue = flag;
                updateMessageWaiting();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final RadioInfo this$0;

            public void handleMessage(Message message)
            {
label0:
                {
label1:
                    {
label2:
                        {
label3:
                            {
                                switch (message.what)
                                {
                                default:
                                    break;

                                case 100: // 'd'
                                    break label0;

                                case 200: 
                                    break label1;

                                case 300: 
                                    break label2;

                                case 1000: 
                                    break label3;

                                case 1006: 
                                    updateSmscButton.setEnabled(true);
                                    if (((AsyncResult)message.obj).exception != null)
                                    {
                                        smsc.setText("update error");
                                        return;
                                    }
                                    break;

                                case 1005: 
                                    AsyncResult asyncresult2 = (AsyncResult)message.obj;
                                    if (asyncresult2.exception != null)
                                    {
                                        smsc.setText("refresh error");
                                        return;
                                    } else
                                    {
                                        smsc.setText((String)asyncresult2.result);
                                        return;
                                    }

                                case 1002: 
                                    AsyncResult asyncresult1 = (AsyncResult)message.obj;
                                    if (asyncresult1.exception == null)
                                    {
                                        updateNeighboringCids((ArrayList)asyncresult1.result);
                                        return;
                                    } else
                                    {
                                        mNeighboringCids.setText("unknown");
                                        return;
                                    }

                                case 1001: 
                                    if (((AsyncResult)message.obj).exception != null)
                                    {
                                        phone.getPreferredNetworkType(obtainMessage(1000));
                                        return;
                                    }
                                    break;
                                }
                                return;
                            }
                            AsyncResult asyncresult = (AsyncResult)message.obj;
                            if (asyncresult.exception == null)
                            {
                                int i = ((int[])(int[])asyncresult.result)[0];
                                if (i >= mPreferredNetworkLabels.length)
                                {
                                    Log.e("phone", (new StringBuilder()).append("[RadioInfo] EVENT_QUERY_PREFERRED_TYPE_DONE: unknown type=").append(i).toString());
                                    i = -1 + mPreferredNetworkLabels.length;
                                }
                                preferredNetworkType.setSelection(i, true);
                                return;
                            } else
                            {
                                preferredNetworkType.setSelection(-1 + mPreferredNetworkLabels.length, true);
                                return;
                            }
                        }
                        updateServiceState();
                        updatePowerState();
                        return;
                    }
                    updateSignalStrength();
                    return;
                }
                updatePhoneState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mViewADNCallback = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setClassName("com.android.phone", "com.android.phone.SimContacts");
                startActivity(intent);
                return true;
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mViewFDNCallback = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setClassName("com.android.phone", "com.android.phone.FdnList");
                startActivity(intent);
                return true;
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mViewSDNCallback = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("content://icc/sdn"));
                intent.setClassName("com.android.phone", "com.android.phone.ADNList");
                startActivity(intent);
                return true;
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mGetPdpList = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                phone.getDataCallList(null);
                return true;
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mSelectBandCallback = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                Intent intent = new Intent();
                intent.setClass(RadioInfo.this, com/android/settings/BandMode);
                startActivity(intent);
                return true;
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mToggleData = new android.view.MenuItem.OnMenuItemClickListener() {

            final RadioInfo this$0;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
                switch (mTelephonyManager.getDataState())
                {
                case 0: // '\0'
                    connectivitymanager.setMobileDataEnabled(true);
                    return true;

                case 2: // '\002'
                    connectivitymanager.setMobileDataEnabled(false);
                    return true;

                case 1: // '\001'
                default:
                    return true;
                }
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mPowerButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                Phone phone1 = phone;
                boolean flag;
                if (!isRadioOn())
                    flag = true;
                else
                    flag = false;
                phone1.setRadioPower(flag);
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mImsRegRequiredHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                int i = 1;
                Object aobj[] = new Object[2];
                aobj[0] = "persist.radio.imsregrequired";
                String s;
                if (isImsRegRequired())
                    s = "on";
                else
                    s = "off";
                aobj[i] = s;
                Log.d("phone", String.format("toggle %s: currently %s", aobj));
                if (isImsRegRequired())
                    i = 0;
                String s1;
                if (i != 0)
                    s1 = "1";
                else
                    s1 = "0";
                SystemProperties.set("persist.radio.imsregrequired", s1);
                updateImsRegRequiredState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mSmsOverImsHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                int i = 1;
                Object aobj[] = new Object[2];
                aobj[0] = "persist.radio.imsallowmtsms";
                String s;
                if (isSmsOverImsEnabled())
                    s = "on";
                else
                    s = "off";
                aobj[i] = s;
                Log.d("phone", String.format("toggle %s: currently %s", aobj));
                if (isSmsOverImsEnabled())
                    i = 0;
                String s1;
                if (i != 0)
                    s1 = "1";
                else
                    s1 = "0";
                SystemProperties.set("persist.radio.imsallowmtsms", s1);
                updateSmsOverImsState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mLteRamDumpHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                int i = 1;
                Object aobj[] = new Object[2];
                aobj[0] = "persist.radio.ramdump";
                String s;
                if (isSmsOverImsEnabled())
                    s = "on";
                else
                    s = "off";
                aobj[i] = s;
                Log.d("phone", String.format("toggle %s: currently %s", aobj));
                if (isLteRamDumpEnabled())
                    i = 0;
                String s1;
                if (i != 0)
                    s1 = "1";
                else
                    s1 = "0";
                SystemProperties.set("persist.radio.ramdump", s1);
                updateLteRamDumpState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mDnsCheckButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                Phone phone1 = phone;
                boolean flag;
                if (!phone.isDnsCheckDisabled())
                    flag = true;
                else
                    flag = false;
                phone1.disableDnsCheck(flag);
                updateDnsCheckState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mOemInfoButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                Intent intent = new Intent("com.android.settings.OEM_RADIO_INFO");
                try
                {
                    startActivity(intent);
                    return;
                }
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    Log.d("phone", (new StringBuilder()).append("OEM-specific Info/Settings Activity Not Found : ").append(activitynotfoundexception).toString());
                }
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mPingButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                updatePingState();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mUpdateSmscButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                updateSmscButton.setEnabled(false);
                phone.setSmscAddress(smsc.getText().toString(), mHandler.obtainMessage(1006));
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mRefreshSmscButtonHandler = new android.view.View.OnClickListener() {

            final RadioInfo this$0;

            public void onClick(View view)
            {
                refreshSmsc();
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        mPreferredNetworkHandler = new android.widget.AdapterView.OnItemSelectedListener() {

            final RadioInfo this$0;

            public void onItemSelected(AdapterView adapterview, View view, int i, long l)
            {
                Message message = mHandler.obtainMessage(1001);
                if (i >= 0 && i <= -2 + mPreferredNetworkLabels.length)
                    phone.setPreferredNetworkType(i, message);
            }

            public void onNothingSelected(AdapterView adapterview)
            {
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
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

    private boolean isImsRegRequired()
    {
        return SystemProperties.getBoolean("persist.radio.imsregrequired", false);
    }

    private boolean isLteRamDumpEnabled()
    {
        return SystemProperties.getBoolean("persist.radio.ramdump", false);
    }

    private boolean isRadioOn()
    {
        return phone.getServiceState().getState() != 3;
    }

    private boolean isSmsOverImsEnabled()
    {
        return SystemProperties.getBoolean("persist.radio.imsallowmtsms", false);
    }

    private final void pingHostname()
    {
        if (Runtime.getRuntime().exec("ping -c 1 www.google.com").waitFor() == 0)
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
        if (Runtime.getRuntime().exec((new StringBuilder()).append("ping -c 1 ").append("74.125.47.104").toString()).waitFor() == 0)
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

    private void refreshSmsc()
    {
        phone.getSmscAddress(mHandler.obtainMessage(1005));
    }

    private final void updateCallRedirect()
    {
        mCfi.setText(String.valueOf(mCfiValue));
    }

    private final void updateCellInfoTv()
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (mCellInfoValue != null)
        {
            int i = 0;
            Iterator iterator = mCellInfoValue.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                CellInfo cellinfo = (CellInfo)iterator.next();
                stringbuilder.append('[');
                stringbuilder.append(i);
                stringbuilder.append("]=");
                stringbuilder.append(cellinfo.toString());
                if (++i < mCellInfoValue.size())
                    stringbuilder.append("\n");
            } while (true);
        }
        mCellInfo.setText(stringbuilder.toString());
    }

    private final void updateDataState()
    {
        int i = mTelephonyManager.getDataState();
        Resources resources = getResources();
        String s = resources.getString(0x7f0b028c);
        switch (i)
        {
        case 3: // '\003'
            s = resources.getString(0x7f0b028b);
            break;

        case 0: // '\0'
            s = resources.getString(0x7f0b0288);
            break;

        case 1: // '\001'
            s = resources.getString(0x7f0b0289);
            break;

        case 2: // '\002'
            s = resources.getString(0x7f0b028a);
            break;
        }
        gprsState.setText(s);
    }

    private final void updateDataStats()
    {
        String s = SystemProperties.get("net.gsm.radio-reset", "0");
        resets.setText(s);
        String s1 = SystemProperties.get("net.gsm.attempt-gprs", "0");
        attempts.setText(s1);
        String s2 = SystemProperties.get("net.gsm.succeed-gprs", "0");
        successes.setText(s2);
        String s3 = SystemProperties.get("net.ppp.reset-by-timeout", "0");
        sentSinceReceived.setText(s3);
    }

    private final void updateDataStats2()
    {
        Resources resources = getResources();
        long l = TrafficStats.getMobileTxPackets();
        long l1 = TrafficStats.getMobileRxPackets();
        long l2 = TrafficStats.getMobileTxBytes();
        long l3 = TrafficStats.getMobileRxBytes();
        String s = resources.getString(0x7f0b028d);
        String s1 = resources.getString(0x7f0b028e);
        sent.setText((new StringBuilder()).append(l).append(" ").append(s).append(", ").append(l2).append(" ").append(s1).toString());
        received.setText((new StringBuilder()).append(l1).append(" ").append(s).append(", ").append(l3).append(" ").append(s1).toString());
    }

    private void updateDnsCheckState()
    {
        TextView textview = dnsCheckState;
        String s;
        if (phone.isDnsCheckDisabled())
            s = "0.0.0.0 allowed";
        else
            s = "0.0.0.0 not allowed";
        textview.setText(s);
    }

    private void updateImsRegRequiredState()
    {
        Log.d("phone", (new StringBuilder()).append("updateImsRegRequiredState isImsRegRequired()=").append(isImsRegRequired()).toString());
        String s;
        if (isImsRegRequired())
            s = getString(0x7f0b0278);
        else
            s = getString(0x7f0b0277);
        imsRegRequiredButton.setText(s);
    }

    private final void updateLocation(CellLocation celllocation)
    {
        Resources resources = getResources();
        if (celllocation instanceof GsmCellLocation)
        {
            GsmCellLocation gsmcelllocation = (GsmCellLocation)celllocation;
            int j1 = gsmcelllocation.getLac();
            int k1 = gsmcelllocation.getCid();
            TextView textview1 = mLocation;
            StringBuilder stringbuilder5 = (new StringBuilder()).append(resources.getString(0x7f0b0291)).append(" = ");
            String s5;
            if (j1 == -1)
                s5 = "unknown";
            else
                s5 = Integer.toHexString(j1);
            StringBuilder stringbuilder6 = stringbuilder5.append(s5).append("   ").append(resources.getString(0x7f0b0292)).append(" = ");
            String s6;
            if (k1 == -1)
                s6 = "unknown";
            else
                s6 = Integer.toHexString(k1);
            textview1.setText(stringbuilder6.append(s6).toString());
            return;
        }
        if (celllocation instanceof CdmaCellLocation)
        {
            CdmaCellLocation cdmacelllocation = (CdmaCellLocation)celllocation;
            int i = cdmacelllocation.getBaseStationId();
            int j = cdmacelllocation.getSystemId();
            int k = cdmacelllocation.getNetworkId();
            int l = cdmacelllocation.getBaseStationLatitude();
            int i1 = cdmacelllocation.getBaseStationLongitude();
            TextView textview = mLocation;
            StringBuilder stringbuilder = (new StringBuilder()).append("BID = ");
            String s;
            if (i == -1)
                s = "unknown";
            else
                s = Integer.toHexString(i);
            StringBuilder stringbuilder1 = stringbuilder.append(s).append("   ").append("SID = ");
            String s1;
            if (j == -1)
                s1 = "unknown";
            else
                s1 = Integer.toHexString(j);
            StringBuilder stringbuilder2 = stringbuilder1.append(s1).append("   ").append("NID = ");
            String s2;
            if (k == -1)
                s2 = "unknown";
            else
                s2 = Integer.toHexString(k);
            StringBuilder stringbuilder3 = stringbuilder2.append(s2).append("\n").append("LAT = ");
            String s3;
            if (l == -1)
                s3 = "unknown";
            else
                s3 = Integer.toHexString(l);
            StringBuilder stringbuilder4 = stringbuilder3.append(s3).append("   ").append("LONG = ");
            String s4;
            if (i1 == -1)
                s4 = "unknown";
            else
                s4 = Integer.toHexString(i1);
            textview.setText(stringbuilder4.append(s4).toString());
            return;
        } else
        {
            mLocation.setText("unknown");
            return;
        }
    }

    private void updateLteRamDumpState()
    {
        Log.d("phone", (new StringBuilder()).append("updateLteRamDumpState isLteRamDumpEnabled()=").append(isLteRamDumpEnabled()).toString());
        String s;
        if (isLteRamDumpEnabled())
            s = getString(0x7f0b027a);
        else
            s = getString(0x7f0b0279);
        lteRamDumpButton.setText(s);
    }

    private final void updateMessageWaiting()
    {
        mMwi.setText(String.valueOf(mMwiValue));
    }

    private final void updateNeighboringCids(ArrayList arraylist)
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (arraylist != null)
        {
            if (arraylist.isEmpty())
            {
                stringbuilder.append("no neighboring cells");
            } else
            {
                for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); stringbuilder.append(((NeighboringCellInfo)iterator.next()).toString()).append(" "));
            }
        } else
        {
            stringbuilder.append("unknown");
        }
        mNeighboringCids.setText(stringbuilder.toString());
    }

    private final void updateNetworkType()
    {
        String s = SystemProperties.get("gsm.network.type", getResources().getString(0x7f0b028c));
        network.setText(s);
    }

    private final void updatePdpList()
    {
        StringBuilder stringbuilder = new StringBuilder("========DATA=======\n");
        disconnects.setText(stringbuilder.toString());
    }

    private final void updatePhoneState()
    {
        com.android.internal.telephony.PhoneConstants.State state = mPhoneStateReceiver.getPhoneState();
        Resources resources = getResources();
        String s = resources.getString(0x7f0b028c);
        static class _cls23
        {

            static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$State[];

            static 
            {
                $SwitchMap$com$android$internal$telephony$PhoneConstants$State = new int[com.android.internal.telephony.PhoneConstants.State.values().length];
                try
                {
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.IDLE.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.RINGING.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.OFFHOOK.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        switch (_cls23..SwitchMap.com.android.internal.telephony.PhoneConstants.State[state.ordinal()])
        {
        case 3: // '\003'
            s = resources.getString(0x7f0b0287);
            break;

        case 2: // '\002'
            s = resources.getString(0x7f0b0286);
            break;

        case 1: // '\001'
            s = resources.getString(0x7f0b0285);
            break;
        }
        callState.setText(s);
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

            final RadioInfo this$0;

            public void run()
            {
                mPingIpAddr.setText(mPingIpAddrResult);
                mPingHostname.setText(mPingHostnameResult);
                mHttpClientTest.setText(mHttpClientTestResult);
            }

            
            {
                this$0 = RadioInfo.this;
                super();
            }
        }
;
        (new Thread() {

            final RadioInfo this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                pingIpAddr();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = RadioInfo.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
        (new Thread() {

            final RadioInfo this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                pingHostname();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = RadioInfo.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
        (new Thread() {

            final RadioInfo this$0;
            final Handler val$handler;
            final Runnable val$updatePingResults;

            public void run()
            {
                httpClientTest();
                handler.post(updatePingResults);
            }

            
            {
                this$0 = RadioInfo.this;
                handler = handler1;
                updatePingResults = runnable;
                super();
            }
        }
).start();
    }

    private void updatePowerState()
    {
        String s;
        if (isRadioOn())
            s = getString(0x7f0b0274);
        else
            s = getString(0x7f0b0273);
        radioPowerButton.setText(s);
    }

    private final void updateProperties()
    {
        Resources resources = getResources();
        String s = phone.getDeviceId();
        if (s == null)
            s = resources.getString(0x7f0b028c);
        mDeviceId.setText(s);
        String s1 = phone.getLine1Number();
        if (s1 == null)
            s1 = resources.getString(0x7f0b028c);
        number.setText(s1);
    }

    private final void updateServiceState()
    {
        ServiceState servicestate = mPhoneStateReceiver.getServiceState();
        int i = servicestate.getState();
        Resources resources = getResources();
        String s = resources.getString(0x7f0b028c);
        switch (i)
        {
        case 3: // '\003'
            s = resources.getString(0x7f0b0282);
            break;

        case 1: // '\001'
        case 2: // '\002'
            s = resources.getString(0x7f0b0281);
            break;

        case 0: // '\0'
            s = resources.getString(0x7f0b027f);
            break;
        }
        gsmState.setText(s);
        if (servicestate.getRoaming())
            roamingState.setText(0x7f0b0283);
        else
            roamingState.setText(0x7f0b0284);
        operatorName.setText(servicestate.getOperatorAlphaLong());
    }

    private final void updateSignalStrength()
    {
        int i = mPhoneStateReceiver.getServiceState().getState();
        Resources resources = getResources();
        if (1 == i || 3 == i)
            dBm.setText("0");
        int j = mPhoneStateReceiver.getSignalStrengthDbm();
        if (-1 == j)
            j = 0;
        int k = mPhoneStateReceiver.getSignalStrengthLevelAsu();
        if (-1 == k)
            k = 0;
        dBm.setText((new StringBuilder()).append(String.valueOf(j)).append(" ").append(resources.getString(0x7f0b028f)).append("   ").append(String.valueOf(k)).append(" ").append(resources.getString(0x7f0b0290)).toString());
    }

    private void updateSmsOverImsState()
    {
        Log.d("phone", (new StringBuilder()).append("updateSmsOverImsState isSmsOverImsEnabled()=").append(isSmsOverImsEnabled()).toString());
        String s;
        if (isSmsOverImsEnabled())
            s = getString(0x7f0b0276);
        else
            s = getString(0x7f0b0275);
        smsOverImsButton.setText(s);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f04007e);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        phone = PhoneFactory.getDefaultPhone();
        mDeviceId = (TextView)findViewById(0x7f080137);
        number = (TextView)findViewById(0x7f080138);
        callState = (TextView)findViewById(0x7f080148);
        operatorName = (TextView)findViewById(0x7f080139);
        roamingState = (TextView)findViewById(0x7f080142);
        gsmState = (TextView)findViewById(0x7f080143);
        gprsState = (TextView)findViewById(0x7f080144);
        network = (TextView)findViewById(0x7f080145);
        dBm = (TextView)findViewById(0x7f08013e);
        mMwi = (TextView)findViewById(0x7f080146);
        mCfi = (TextView)findViewById(0x7f080147);
        mLocation = (TextView)findViewById(0x7f08013f);
        mNeighboringCids = (TextView)findViewById(0x7f080140);
        mCellInfo = (TextView)findViewById(0x7f080141);
        resets = (TextView)findViewById(0x7f080149);
        attempts = (TextView)findViewById(0x7f08014a);
        successes = (TextView)findViewById(0x7f08014b);
        disconnects = (TextView)findViewById(0x7f08014c);
        sentSinceReceived = (TextView)findViewById(0x7f08014f);
        sent = (TextView)findViewById(0x7f08014d);
        received = (TextView)findViewById(0x7f08014e);
        smsc = (EditText)findViewById(0x7f080158);
        dnsCheckState = (TextView)findViewById(0x7f08015a);
        mPingIpAddr = (TextView)findViewById(0x7f08013b);
        mPingHostname = (TextView)findViewById(0x7f08013c);
        mHttpClientTest = (TextView)findViewById(0x7f08013d);
        preferredNetworkType = (Spinner)findViewById(0x7f080150);
        ArrayAdapter arrayadapter = new ArrayAdapter(this, 0x1090008, mPreferredNetworkLabels);
        arrayadapter.setDropDownViewResource(0x1090009);
        preferredNetworkType.setAdapter(arrayadapter);
        preferredNetworkType.setOnItemSelectedListener(mPreferredNetworkHandler);
        radioPowerButton = (Button)findViewById(0x7f080151);
        radioPowerButton.setOnClickListener(mPowerButtonHandler);
        imsRegRequiredButton = (Button)findViewById(0x7f080152);
        imsRegRequiredButton.setOnClickListener(mImsRegRequiredHandler);
        smsOverImsButton = (Button)findViewById(0x7f080153);
        smsOverImsButton.setOnClickListener(mSmsOverImsHandler);
        lteRamDumpButton = (Button)findViewById(0x7f080154);
        lteRamDumpButton.setOnClickListener(mLteRamDumpHandler);
        pingTestButton = (Button)findViewById(0x7f08013a);
        pingTestButton.setOnClickListener(mPingButtonHandler);
        updateSmscButton = (Button)findViewById(0x7f080156);
        updateSmscButton.setOnClickListener(mUpdateSmscButtonHandler);
        refreshSmscButton = (Button)findViewById(0x7f080157);
        refreshSmscButton.setOnClickListener(mRefreshSmscButtonHandler);
        dnsCheckToggleButton = (Button)findViewById(0x7f080159);
        dnsCheckToggleButton.setOnClickListener(mDnsCheckButtonHandler);
        oemInfoButton = (Button)findViewById(0x7f08015b);
        oemInfoButton.setOnClickListener(mOemInfoButtonHandler);
        if (getPackageManager().queryIntentActivities(new Intent("com.android.settings.OEM_RADIO_INFO"), 0).size() == 0)
            oemInfoButton.setEnabled(false);
        mPhoneStateReceiver = new PhoneStateIntentReceiver(this, mHandler);
        mPhoneStateReceiver.notifySignalStrength(200);
        mPhoneStateReceiver.notifyServiceState(300);
        mPhoneStateReceiver.notifyPhoneCallState(100);
        phone.getPreferredNetworkType(mHandler.obtainMessage(1000));
        phone.getNeighboringCids(mHandler.obtainMessage(1002));
        CellLocation.requestLocationUpdate();
        mCellInfoValue = mTelephonyManager.getAllCellInfo();
        Log.d("phone", (new StringBuilder()).append("[RadioInfo] onCreate: mCellInfoValue=").append(mCellInfoValue).toString());
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        menu.add(0, 0, 0, 0x7f0b0324).setOnMenuItemClickListener(mSelectBandCallback).setAlphabeticShortcut('b');
        menu.add(1, 1, 0, 0x7f0b027b).setOnMenuItemClickListener(mViewADNCallback);
        menu.add(1, 2, 0, 0x7f0b027c).setOnMenuItemClickListener(mViewFDNCallback);
        menu.add(1, 3, 0, 0x7f0b027d).setOnMenuItemClickListener(mViewSDNCallback);
        menu.add(1, 4, 0, 0x7f0b027e).setOnMenuItemClickListener(mGetPdpList);
        menu.add(1, 5, 0, "Disable data connection").setOnMenuItemClickListener(mToggleData);
        return true;
    }

    public void onPause()
    {
        super.onPause();
        Log.i("phone", "[RadioInfo] onPause: unregister phone & data intents");
        mPhoneStateReceiver.unregisterIntent();
        mTelephonyManager.listen(mPhoneStateListener, 0);
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.findItem(5);
        int i = mTelephonyManager.getDataState();
        boolean flag = true;
        switch (i)
        {
        case 0: // '\0'
            menuitem.setTitle("Enable data connection");
            break;

        case 2: // '\002'
        case 3: // '\003'
            menuitem.setTitle("Disable data connection");
            break;

        case 1: // '\001'
        default:
            flag = false;
            break;
        }
        menuitem.setVisible(flag);
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        updatePhoneState();
        updateSignalStrength();
        updateMessageWaiting();
        updateCallRedirect();
        updateServiceState();
        updateLocation(mTelephonyManager.getCellLocation());
        updateDataState();
        updateDataStats();
        updateDataStats2();
        updatePowerState();
        updateImsRegRequiredState();
        updateSmsOverImsState();
        updateLteRamDumpState();
        updateProperties();
        updateDnsCheckState();
        Log.i("phone", "[RadioInfo] onResume: register phone & data intents");
        mPhoneStateReceiver.registerIntent();
        mTelephonyManager.listen(mPhoneStateListener, 1244);
    }




/*
    static List access$1002(RadioInfo radioinfo, List list)
    {
        radioinfo.mCellInfoValue = list;
        return list;
    }

*/







































/*
    static boolean access$602(RadioInfo radioinfo, boolean flag)
    {
        radioinfo.mMwiValue = flag;
        return flag;
    }

*/



/*
    static boolean access$802(RadioInfo radioinfo, boolean flag)
    {
        radioinfo.mCfiValue = flag;
        return flag;
    }

*/

}
