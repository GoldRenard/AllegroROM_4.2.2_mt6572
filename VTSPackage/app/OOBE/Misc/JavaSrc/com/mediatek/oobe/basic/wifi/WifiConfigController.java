// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.content.Context;
import android.content.res.Resources;
import android.net.*;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.os.Handler;
import android.os.SystemProperties;
import android.security.KeyStore;
import android.telephony.TelephonyManager;
import android.text.*;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.PhoneConstants;
import com.mediatek.oobe.ext.IWifiExt;
import com.mediatek.oobe.utils.Utf8ByteLengthFilter;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.mediatek.oobe.basic.wifi:
//            AccessPoint, WifiConfigUiBase, Summary

public class WifiConfigController
    implements TextWatcher, android.view.View.OnClickListener, android.widget.AdapterView.OnItemSelectedListener
{

    private static final int BUFFER_LENGTH = 40;
    private static final String DEFAULT_WLAN_PROP = "wifi-wapi";
    private static final int DHCP = 0;
    private static final Pattern EXCLUSION_PATTERN = Pattern.compile("^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$");
    private static final String EXCLUSION_REGEXP = "^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$";
    private static final Pattern HOSTNAME_PATTERN = Pattern.compile("^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$");
    private static final String HOSTNAME_REGEXP = "^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$";
    private static final int IPV4_ADDRESS_LENGTH = 4;
    private static final int IPV6_ADDRESS_LENGTH = 16;
    private static final String KEYSTORE_SPACE = "keystore://";
    private static final int MCC_SUB_BEG = 0;
    private static final int MNC_SUB_BEG = 3;
    private static final int MNC_SUB_END = 5;
    private static final String PHASE2_PREFIX = "auth=";
    public static final int PROXY_NONE = 0;
    public static final int PROXY_STATIC = 1;
    private static final int SSID_MAX_LEN = 32;
    private static final int STATIC_IP = 1;
    private static final String TAG = "WifiConfigController";
    private static final String WAPI = "wapi";
    private static final String WIFI = "wifi";
    public static final int WIFI_EAP_METHOD_AKA = 4;
    public static final int WIFI_EAP_METHOD_PEAP = 0;
    public static final int WIFI_EAP_METHOD_PWD = 5;
    public static final int WIFI_EAP_METHOD_SIM = 3;
    public static final int WIFI_EAP_METHOD_TLS = 1;
    public static final int WIFI_EAP_METHOD_TTLS = 2;
    private static final String WIFI_WAPI = "wifi-wapi";
    private static final String WLAN_PROP_KEY = "persist.sys.wlan";
    private final AccessPoint mAccessPoint;
    private int mAccessPointSecurity;
    private final WifiConfigUiBase mConfigUi;
    private TextView mDns1View;
    private TextView mDns2View;
    private TextView mEapAnonymousView;
    private Spinner mEapCaCertSpinner;
    private TextView mEapIdentityView;
    private Spinner mEapMethodSpinner;
    private Spinner mEapUserCertSpinner;
    private boolean mEdit;
    IWifiExt mExt;
    private TextView mGatewayView;
    private boolean mHex;
    private TextView mIpAddressView;
    private android.net.wifi.WifiConfiguration.IpAssignment mIpAssignment;
    private Spinner mIpSettingsSpinner;
    private LinkProperties mLinkProperties;
    private TextView mNetworkPrefixLengthView;
    private TextView mPasswordView;
    private Spinner mPhase2Spinner;
    private TextView mProxyExclusionListView;
    private TextView mProxyHostView;
    private TextView mProxyPortView;
    private android.net.wifi.WifiConfiguration.ProxySettings mProxySettings;
    private Spinner mProxySettingsSpinner;
    private Spinner mSecuritySpinner;
    private Spinner mSimSlot;
    private TextView mSsidView;
    private TelephonyManagerEx mTelephonyManagerEx;
    private final Handler mTextViewChangedHandler = new Handler();
    private TelephonyManager mTm;
    private final View mView;
    private Spinner mWEPKeyIndex;
    private Spinner mWEPKeyType;
    private Spinner mWapiAsCert;
    private Spinner mWapiClientCert;

    public WifiConfigController(WifiConfigUiBase wificonfiguibase, View view, AccessPoint accesspoint, boolean flag)
    {
        mIpAssignment = android.net.wifi.WifiConfiguration.IpAssignment.UNASSIGNED;
        mProxySettings = android.net.wifi.WifiConfiguration.ProxySettings.UNASSIGNED;
        mLinkProperties = new LinkProperties();
        mConfigUi = wificonfiguibase;
        mView = view;
        mAccessPoint = accesspoint;
        int i;
        if (accesspoint == null)
            i = 0;
        else
            i = accesspoint.mSecurity;
        mAccessPointSecurity = i;
        mEdit = flag;
        Context context = mConfigUi.getContext();
        Resources resources = context.getResources();
        mTm = (TelephonyManager)context.getSystemService("phone");
        mTelephonyManagerEx = TelephonyManagerEx.getDefault();
        mExt = Utils.getWifiPlugin(context);
        mIpSettingsSpinner = (Spinner)mView.findViewById(0x7f0b0089);
        mIpSettingsSpinner.setOnItemSelectedListener(this);
        mProxySettingsSpinner = (Spinner)mView.findViewById(0x7f0b0081);
        mProxySettingsSpinner.setOnItemSelectedListener(this);
        if (mAccessPoint == null)
        {
            mConfigUi.setTitle(0x7f0900a9);
            mSsidView = (TextView)mView.findViewById(0x7f0b005b);
            mSsidView.addTextChangedListener(this);
            TextView textview = mSsidView;
            InputFilter ainputfilter[] = new InputFilter[1];
            ainputfilter[0] = new Utf8ByteLengthFilter(32);
            textview.setFilters(ainputfilter);
            TextView textview1 = (TextView)view.findViewById(0x7f0b005c);
            mExt.setSecurityText(textview1);
            mSecuritySpinner = (Spinner)mView.findViewById(0x7f0b005d);
            mSecuritySpinner.setOnItemSelectedListener(this);
            mView.findViewById(0x7f0b005a).setVisibility(0);
            int l = 0x7f060007;
            String s = SystemProperties.get("persist.sys.wlan", "wifi-wapi");
            if (s.equals("wifi-wapi"))
            {
                if (AccessPoint.isWFATestSupported())
                    l = 0x7f060015;
                else
                    l = 0x7f060007;
            } else
            if (s.equals("wifi"))
            {
                if (AccessPoint.isWFATestSupported())
                    l = 0x7f060017;
                else
                    l = 0x7f060016;
            } else
            if (s.equals("wapi"))
                l = 0x7f060018;
            ArrayAdapter arrayadapter = new ArrayAdapter(context, 0x1090008, context.getResources().getStringArray(l));
            arrayadapter.setDropDownViewResource(0x1090009);
            mSecuritySpinner.setAdapter(arrayadapter);
            showIpConfigFields();
            showProxyFields();
            mView.findViewById(0x7f0b006a).setVisibility(0);
            mView.findViewById(0x7f0b006b).setOnClickListener(this);
            mConfigUi.setSubmitButton(context.getString(0x7f0900c8));
        } else
        {
            mConfigUi.setTitle(mAccessPoint.mSsid);
            ViewGroup viewgroup = (ViewGroup)mView.findViewById(0x7f0b0059);
            android.net.NetworkInfo.DetailedState detailedstate = mAccessPoint.getState();
            if (detailedstate != null)
                addRow(viewgroup, 0x7f0900b2, Summary.get(mConfigUi.getContext(), detailedstate));
            int j = mAccessPoint.getLevel();
            if (j != -1)
                addRow(viewgroup, 0x7f0900b1, resources.getStringArray(0x7f060009)[j]);
            WifiInfo wifiinfo = mAccessPoint.getInfo();
            if (wifiinfo != null && wifiinfo.getLinkSpeed() != -1)
                addRow(viewgroup, 0x7f0900b3, (new StringBuilder()).append(wifiinfo.getLinkSpeed()).append("Mbps").toString());
            View view1 = mConfigUi.getLayoutInflater().inflate(0x7f03001c, viewgroup, false);
            ((TextView)view1.findViewById(0x7f0b0090)).setText(mExt.getSecurityText(0x7f0900b0));
            ((TextView)view1.findViewById(0x7f0b0091)).setText(mAccessPoint.getSecurityString(false));
            viewgroup.addView(view1);
            int k = mAccessPoint.mNetworkId;
            boolean flag1 = false;
            if (k != -1)
            {
                WifiConfiguration wificonfiguration = mAccessPoint.getConfig();
                if (wificonfiguration.ipAssignment == android.net.wifi.WifiConfiguration.IpAssignment.STATIC)
                {
                    mIpSettingsSpinner.setSelection(1);
                    flag1 = true;
                } else
                {
                    mIpSettingsSpinner.setSelection(0);
                    flag1 = false;
                }
                Iterator iterator = wificonfiguration.linkProperties.getAddresses().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    InetAddress inetaddress = (InetAddress)iterator.next();
                    Xlog.d("WifiConfigController", (new StringBuilder()).append("HostAddress : ").append(inetaddress.getHostAddress()).toString());
                    Xlog.d("WifiConfigController", (new StringBuilder()).append("Address Length : ").append(inetaddress.getAddress().length).toString());
                    if (inetaddress.getAddress().length == 4)
                        addRow(viewgroup, 0x7f090122, inetaddress.getHostAddress());
                    else
                    if (inetaddress.getAddress().length == 16)
                        addRow(viewgroup, 0x7f090123, inetaddress.getHostAddress());
                } while (true);
                if (wificonfiguration.proxySettings == android.net.wifi.WifiConfiguration.ProxySettings.STATIC)
                {
                    mProxySettingsSpinner.setSelection(1);
                    flag1 = true;
                } else
                {
                    mProxySettingsSpinner.setSelection(0);
                }
            }
            if (mAccessPoint.mNetworkId == -1 || mEdit)
            {
                showSecurityFields();
                showIpConfigFields();
                showProxyFields();
                mView.findViewById(0x7f0b006a).setVisibility(0);
                mView.findViewById(0x7f0b006b).setOnClickListener(this);
                if (flag1)
                {
                    ((CheckBox)mView.findViewById(0x7f0b006b)).setChecked(true);
                    mView.findViewById(0x7f0b006c).setVisibility(0);
                }
            }
            if (mEdit)
            {
                mConfigUi.setSubmitButton(context.getString(0x7f0900c8));
            } else
            {
                if (detailedstate == null && j != -1)
                    mConfigUi.setSubmitButton(context.getString(0x7f0900c6));
                else
                    mView.findViewById(0x7f0b0088).setVisibility(8);
                if (mAccessPoint.mNetworkId != -1 && mExt.shouldAddForgetButton(mAccessPoint.mSsid, mAccessPoint.mSecurity))
                    mConfigUi.setForgetButton(context.getString(0x7f0900c7));
            }
        }
        mConfigUi.setCancelButton(context.getString(0x7f0900c9));
        if (mConfigUi.getSubmitButton() != null)
            enableSubmitIfAppropriate();
    }

    public static String addQuote(String s)
    {
        return (new StringBuilder()).append("\"").append(s).append("\"").toString();
    }

    private void addRow(ViewGroup viewgroup, int i, String s)
    {
        View view = mConfigUi.getLayoutInflater().inflate(0x7f03001c, viewgroup, false);
        ((TextView)view.findViewById(0x7f0b0090)).setText(i);
        ((TextView)view.findViewById(0x7f0b0091)).setText(s);
        viewgroup.addView(view);
    }

    private void eapSimAkaConfig(WifiConfiguration wificonfiguration)
    {
        String s = (String)mEapMethodSpinner.getSelectedItem();
        if (PhoneConstants.GEMINI_SIM_NUM > 1)
        {
            simSlotConfig(wificonfiguration, s);
            Xlog.d("WifiConfigController", (new StringBuilder()).append("eap-sim, choose sim_slot").append((String)mSimSlot.getSelectedItem()).toString());
        } else
        {
            wificonfiguration.imsi = makeNAI(mTm.getSubscriberId(), s);
            Xlog.d("WifiConfigController", (new StringBuilder()).append("config.imsi: ").append(wificonfiguration.imsi).toString());
            wificonfiguration.simSlot = addQuote("0");
            wificonfiguration.pcsc = addQuote("rild");
        }
        Xlog.d("WifiConfigController", (new StringBuilder()).append("eap-sim, config.imsi: ").append(wificonfiguration.imsi).toString());
        Xlog.d("WifiConfigController", (new StringBuilder()).append("eap-sim, config.simSlot: ").append(wificonfiguration.simSlot).toString());
    }

    private boolean ipAndProxyFieldsAreValid()
    {
        int j;
        mLinkProperties.clear();
        android.net.wifi.WifiConfiguration.IpAssignment ipassignment;
        if (mIpSettingsSpinner != null && mIpSettingsSpinner.getSelectedItemPosition() == 1)
            ipassignment = android.net.wifi.WifiConfiguration.IpAssignment.STATIC;
        else
            ipassignment = android.net.wifi.WifiConfiguration.IpAssignment.DHCP;
        mIpAssignment = ipassignment;
        if (mIpAssignment == android.net.wifi.WifiConfiguration.IpAssignment.STATIC && validateIpConfigFields(mLinkProperties) != 0)
            return false;
        android.net.wifi.WifiConfiguration.ProxySettings proxysettings;
        String s;
        String s1;
        String s2;
        int i;
        ProxyProperties proxyproperties;
        int k;
        if (mProxySettingsSpinner != null && mProxySettingsSpinner.getSelectedItemPosition() == 1)
            proxysettings = android.net.wifi.WifiConfiguration.ProxySettings.STATIC;
        else
            proxysettings = android.net.wifi.WifiConfiguration.ProxySettings.NONE;
        mProxySettings = proxysettings;
        if (mProxySettings != android.net.wifi.WifiConfiguration.ProxySettings.STATIC || mProxyHostView == null) goto _L2; else goto _L1
_L1:
        s = mProxyHostView.getText().toString();
        s1 = mProxyPortView.getText().toString();
        s2 = mProxyExclusionListView.getText().toString();
        i = 0;
        i = Integer.parseInt(s1);
        k = validate(s, s1, s2);
        j = k;
_L4:
        if (j != 0)
            break; /* Loop/switch isn't completed */
        proxyproperties = new ProxyProperties(s, i, s2);
        mLinkProperties.setHttpProxy(proxyproperties);
_L2:
        return true;
        NumberFormatException numberformatexception;
        numberformatexception;
        j = 0x7f090110;
        if (true) goto _L4; else goto _L3
_L3:
        return false;
    }

    private boolean isWEPKeyValid(String s)
    {
        boolean flag = true;
        if (s != null && s.length() != 0)
        {
            Spinner spinner = mWEPKeyType;
            int i = 0;
            if (spinner != null)
            {
                int k = mWEPKeyType.getSelectedItemPosition();
                i = 0;
                if (k != -1)
                    i = mWEPKeyType.getSelectedItemPosition();
            }
            int j = s.length();
            if ((j != 10 && j != 26 && j != 32 || !s.matches("[0-9A-Fa-f]*") || i != 0 && i != 2) && (j != 5 && j != 13 && j != 16 || i != 0 && i != flag))
                return false;
        } else
        {
            flag = false;
        }
        return flag;
    }

    private void loadCertificates(Spinner spinner, String s)
    {
        Context context = mConfigUi.getContext();
        String s1 = context.getString(0x7f0900c0);
        String as[] = KeyStore.getInstance().saw(s);
        String as1[];
        if (as != null && as.length != 0)
        {
            String as2[] = new String[1 + as.length];
            as2[0] = s1;
            System.arraycopy(as, 0, as2, 1, as.length);
            as1 = as2;
        } else
        {
            as1 = (new String[] {
                s1
            });
        }
        ArrayAdapter arrayadapter = new ArrayAdapter(context, 0x1090008, as1);
        arrayadapter.setDropDownViewResource(0x1090009);
        spinner.setAdapter(arrayadapter);
    }

    public static String makeNAI(String s, String s1)
    {
        if (s == null)
            return addQuote("error");
        StringBuffer stringbuffer = new StringBuffer(40);
        System.out.println("".length());
        if (s1.equals("SIM"))
            stringbuffer.append("1");
        else
        if (s1.equals("AKA"))
            stringbuffer.append("0");
        stringbuffer.append(s);
        stringbuffer.append("@wlan.mnc");
        stringbuffer.append("0");
        stringbuffer.append(s.substring(3, 5));
        stringbuffer.append(".mcc");
        stringbuffer.append(s.substring(0, 3));
        stringbuffer.append(".3gppnetwork.org");
        Xlog.d("WifiConfigController", stringbuffer.toString());
        Xlog.d("WifiConfigController", (new StringBuilder()).append("\"").append(stringbuffer.toString()).append("\"").toString());
        return addQuote(stringbuffer.toString());
    }

    static boolean requireKeyStore(WifiConfiguration wificonfiguration)
    {
        if (wificonfiguration != null)
        {
            if (!TextUtils.isEmpty(wificonfiguration.key_id.value()))
                return true;
            String as[] = new String[2];
            as[0] = wificonfiguration.ca_cert.value();
            as[1] = wificonfiguration.client_cert.value();
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s = as[j];
                if (s != null && s.startsWith("keystore://"))
                    return true;
            }

        }
        return false;
    }

    private void setCertificate(Spinner spinner, String s, String s1)
    {
        if (s1 != null && s1.startsWith(s))
            setSelection(spinner, s1.substring(s.length()));
    }

    private void setSelection(Spinner spinner, String s)
    {
        if (s == null) goto _L2; else goto _L1
_L1:
        ArrayAdapter arrayadapter;
        int i;
        arrayadapter = (ArrayAdapter)spinner.getAdapter();
        i = -1 + arrayadapter.getCount();
_L7:
        if (i < 0) goto _L2; else goto _L3
_L3:
        if (!s.equals(arrayadapter.getItem(i))) goto _L5; else goto _L4
_L4:
        spinner.setSelection(i);
_L2:
        return;
_L5:
        i--;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void showIpConfigFields()
    {
        mView.findViewById(0x7f0b0088).setVisibility(0);
        AccessPoint accesspoint = mAccessPoint;
        WifiConfiguration wificonfiguration = null;
        if (accesspoint != null)
        {
            int i = mAccessPoint.mNetworkId;
            wificonfiguration = null;
            if (i != -1)
                wificonfiguration = mAccessPoint.getConfig();
        }
        if (mIpSettingsSpinner.getSelectedItemPosition() == 1)
        {
            mView.findViewById(0x7f0b008a).setVisibility(0);
            if (mIpAddressView == null)
            {
                mIpAddressView = (TextView)mView.findViewById(0x7f0b008b);
                mIpAddressView.addTextChangedListener(this);
                mGatewayView = (TextView)mView.findViewById(0x7f0b008c);
                mGatewayView.addTextChangedListener(this);
                mNetworkPrefixLengthView = (TextView)mView.findViewById(0x7f0b008d);
                mNetworkPrefixLengthView.addTextChangedListener(this);
                mDns1View = (TextView)mView.findViewById(0x7f0b008e);
                mDns1View.addTextChangedListener(this);
                mDns2View = (TextView)mView.findViewById(0x7f0b008f);
                mDns2View.addTextChangedListener(this);
            }
            if (wificonfiguration != null)
            {
                LinkProperties linkproperties = wificonfiguration.linkProperties;
                Iterator iterator = linkproperties.getLinkAddresses().iterator();
                if (iterator.hasNext())
                {
                    LinkAddress linkaddress = (LinkAddress)iterator.next();
                    mIpAddressView.setText(linkaddress.getAddress().getHostAddress());
                    mNetworkPrefixLengthView.setText(Integer.toString(linkaddress.getNetworkPrefixLength()));
                }
                Iterator iterator1 = linkproperties.getRoutes().iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    RouteInfo routeinfo = (RouteInfo)iterator1.next();
                    if (!routeinfo.isDefaultRoute())
                        continue;
                    mGatewayView.setText(routeinfo.getGateway().getHostAddress());
                    break;
                } while (true);
                Iterator iterator2 = linkproperties.getDnses().iterator();
                if (iterator2.hasNext())
                    mDns1View.setText(((InetAddress)iterator2.next()).getHostAddress());
                if (iterator2.hasNext())
                    mDns2View.setText(((InetAddress)iterator2.next()).getHostAddress());
            }
            return;
        } else
        {
            mView.findViewById(0x7f0b008a).setVisibility(8);
            return;
        }
    }

    private void showProxyFields()
    {
        mView.findViewById(0x7f0b007f).setVisibility(0);
        AccessPoint accesspoint = mAccessPoint;
        WifiConfiguration wificonfiguration = null;
        if (accesspoint != null)
        {
            int i = mAccessPoint.mNetworkId;
            wificonfiguration = null;
            if (i != -1)
                wificonfiguration = mAccessPoint.getConfig();
        }
        if (mProxySettingsSpinner.getSelectedItemPosition() == 1)
        {
            mView.findViewById(0x7f0b0082).setVisibility(0);
            mView.findViewById(0x7f0b0083).setVisibility(0);
            if (mProxyHostView == null)
            {
                mProxyHostView = (TextView)mView.findViewById(0x7f0b0084);
                mProxyHostView.addTextChangedListener(this);
                mProxyPortView = (TextView)mView.findViewById(0x7f0b0085);
                mProxyPortView.addTextChangedListener(this);
                mProxyExclusionListView = (TextView)mView.findViewById(0x7f0b0087);
                mProxyExclusionListView.addTextChangedListener(this);
                TextView textview = (TextView)mView.findViewById(0x7f0b0086);
                mExt.setProxyText(textview);
            }
            if (wificonfiguration != null)
            {
                ProxyProperties proxyproperties = wificonfiguration.linkProperties.getHttpProxy();
                if (proxyproperties != null)
                {
                    mProxyHostView.setText(proxyproperties.getHost());
                    mProxyPortView.setText(Integer.toString(proxyproperties.getPort()));
                    mProxyExclusionListView.setText(proxyproperties.getExclusionList());
                }
            }
            return;
        } else
        {
            mView.findViewById(0x7f0b0082).setVisibility(8);
            mView.findViewById(0x7f0b0083).setVisibility(8);
            return;
        }
    }

    private void showSecurityFields()
    {
        if (mAccessPoint == null && mAccessPointSecurity != 5)
        {
            mView.findViewById(0x7f0b006a).setVisibility(8);
            mView.findViewById(0x7f0b006c).setVisibility(8);
        }
        if (mAccessPointSecurity == 0)
        {
            mView.findViewById(0x7f0b005e).setVisibility(8);
            mView.findViewById(0x7f0b0066).setVisibility(8);
        } else
        {
            mView.findViewById(0x7f0b005e).setVisibility(0);
            mView.findViewById(0x7f0b0065).setVisibility(8);
            if (mAccessPointSecurity == 6)
            {
                mView.findViewById(0x7f0b0065).setVisibility(0);
                ((CheckBox)mView.findViewById(0x7f0b0065)).setChecked(mHex);
            }
            if (mAccessPointSecurity != 1);
            if (mAccessPointSecurity == 7)
            {
                mView.findViewById(0x7f0b005e).setVisibility(8);
                mView.findViewById(0x7f0b0066).setVisibility(0);
                mWapiAsCert = (Spinner)mView.findViewById(0x7f0b0067);
                mWapiClientCert = (Spinner)mView.findViewById(0x7f0b0068);
                mWapiAsCert.setOnItemSelectedListener(this);
                mWapiClientCert.setOnItemSelectedListener(this);
                loadCertificates(mWapiAsCert, "WAPIASCERT_");
                loadCertificates(mWapiClientCert, "WAPIUSERCERT_");
                if (mAccessPoint != null && mAccessPoint.mNetworkId != -1)
                {
                    WifiConfiguration wificonfiguration2 = mAccessPoint.getConfig();
                    setCertificate(mWapiAsCert, "WAPIASCERT_", wificonfiguration2.ca_cert2.value());
                    setCertificate(mWapiClientCert, "WAPIUSERCERT_", wificonfiguration2.client_cert.value());
                    return;
                }
            } else
            {
                mView.findViewById(0x7f0b0066).setVisibility(8);
                if (mPasswordView == null)
                {
                    mPasswordView = (TextView)mView.findViewById(0x7f0b0063);
                    mPasswordView.addTextChangedListener(this);
                    ((CheckBox)mView.findViewById(0x7f0b0064)).setOnClickListener(this);
                    ((CheckBox)mView.findViewById(0x7f0b0065)).setOnClickListener(this);
                    if (mAccessPoint != null && mAccessPoint.mNetworkId != -1)
                        mPasswordView.setHint(0x7f0900bf);
                }
                if (mAccessPointSecurity != 5)
                {
                    mPasswordView.setEnabled(true);
                    ((CheckBox)mView.findViewById(0x7f0b0064)).setEnabled(true);
                    mView.findViewById(0x7f0b006d).setVisibility(8);
                    mView.findViewById(0x7f0b005f).setVisibility(8);
                    return;
                }
                mView.findViewById(0x7f0b006d).setVisibility(0);
                mView.findViewById(0x7f0b005f).setVisibility(0);
                View view = mView.findViewById(0x7f0b006a);
                if (mAccessPoint == null && !view.isShown())
                {
                    Xlog.d("WifiConfigController", "add network,Security is AccessPoint.SECURITY_EAP");
                    mView.findViewById(0x7f0b006a).setVisibility(0);
                    mView.findViewById(0x7f0b006b).setOnClickListener(this);
                    ((CheckBox)mView.findViewById(0x7f0b006b)).setChecked(false);
                    mView.findViewById(0x7f0b006c).setVisibility(8);
                }
                if (mEapMethodSpinner == null)
                {
                    mEapMethodSpinner = (Spinner)mView.findViewById(0x7f0b006f);
                    Context context1 = mConfigUi.getContext();
                    ArrayAdapter arrayadapter1 = new ArrayAdapter(context1, 0x1090008, context1.getResources().getStringArray(0x7f06001c));
                    arrayadapter1.setDropDownViewResource(0x1090009);
                    mEapMethodSpinner.setAdapter(arrayadapter1);
                    mEapMethodSpinner.setOnItemSelectedListener(this);
                    mPhase2Spinner = (Spinner)mView.findViewById(0x7f0b0073);
                    mEapCaCertSpinner = (Spinner)mView.findViewById(0x7f0b0075);
                    mEapUserCertSpinner = (Spinner)mView.findViewById(0x7f0b0077);
                    mEapIdentityView = (TextView)mView.findViewById(0x7f0b0061);
                    mEapAnonymousView = (TextView)mView.findViewById(0x7f0b0079);
                    loadCertificates(mEapCaCertSpinner, "CACERT_");
                    loadCertificates(mEapUserCertSpinner, "USRPKEY_");
                    if (mAccessPoint != null && mAccessPoint.mNetworkId != -1)
                    {
                        WifiConfiguration wificonfiguration1 = mAccessPoint.getConfig();
                        setSelection(mEapMethodSpinner, wificonfiguration1.eap.value());
                        String s1 = wificonfiguration1.phase2.value();
                        if (s1 != null && s1.startsWith("auth="))
                            setSelection(mPhase2Spinner, s1.substring("auth=".length()));
                        else
                            setSelection(mPhase2Spinner, s1);
                        setCertificate(mEapCaCertSpinner, "keystore://CACERT_", wificonfiguration1.ca_cert.value());
                        setCertificate(mEapUserCertSpinner, "USRPKEY_", wificonfiguration1.key_id.value());
                        mEapIdentityView.setText(wificonfiguration1.identity.value());
                        mEapAnonymousView.setText(wificonfiguration1.anonymous_identity.value());
                    }
                }
                mView.findViewById(0x7f0b006e).setVisibility(0);
                mView.findViewById(0x7f0b0060).setVisibility(0);
                if (mEapMethodSpinner.getSelectedItemPosition() >= 3)
                {
                    mView.findViewById(0x7f0b0072).setVisibility(8);
                    mView.findViewById(0x7f0b0074).setVisibility(8);
                    mView.findViewById(0x7f0b0076).setVisibility(8);
                    mView.findViewById(0x7f0b0078).setVisibility(8);
                } else
                {
                    mView.findViewById(0x7f0b0072).setVisibility(0);
                    mView.findViewById(0x7f0b0074).setVisibility(0);
                    mView.findViewById(0x7f0b0076).setVisibility(0);
                    mView.findViewById(0x7f0b0078).setVisibility(0);
                }
                if (mEapMethodSpinner.getSelectedItemPosition() != 3 && mEapMethodSpinner.getSelectedItemPosition() != 4)
                {
                    mEapIdentityView.setEnabled(true);
                    mPasswordView.setEnabled(true);
                    ((CheckBox)mView.findViewById(0x7f0b0064)).setEnabled(true);
                    mView.findViewById(0x7f0b0070).setVisibility(8);
                    return;
                }
                mEapIdentityView.setEnabled(false);
                mPasswordView.setEnabled(false);
                ((CheckBox)mView.findViewById(0x7f0b0064)).setEnabled(false);
                mView.findViewById(0x7f0b0070).setVisibility(0);
                mSimSlot = (Spinner)mView.findViewById(0x7f0b0071);
                Context context = mConfigUi.getContext();
                String as[] = context.getResources().getStringArray(0x7f060019);
                int i = 1 + PhoneConstants.GEMINI_SIM_NUM;
                Xlog.d("WifiConfigController", (new StringBuilder()).append("the num of sim slot is :").append(i - 1).toString());
                String as1[] = new String[i];
                String s = context.getResources().getString(0x7f0900f5);
                for (int j = 0; j < i; j++)
                    if (j < as.length)
                        as1[j] = as[j];
                    else
                        as1[j] = (new StringBuilder()).append(s).append(" ").append(String.valueOf(j)).toString();

                ArrayAdapter arrayadapter = new ArrayAdapter(context, 0x1090008, as1);
                arrayadapter.setDropDownViewResource(0x1090009);
                mSimSlot.setAdapter(arrayadapter);
                if (mAccessPoint != null && mAccessPoint.mNetworkId != -1)
                {
                    WifiConfiguration wificonfiguration = mAccessPoint.getConfig();
                    if (wificonfiguration != null && wificonfiguration.simSlot != null)
                    {
                        String as2[] = wificonfiguration.simSlot.split("\"");
                        if (as2.length > 1)
                        {
                            int k = Integer.parseInt(as2[1]);
                            mSimSlot.setSelection(k);
                            return;
                        }
                    }
                }
            }
        }
    }

    private void simSlotConfig(WifiConfiguration wificonfiguration, String s)
    {
        int i = -1 + mSimSlot.getSelectedItemPosition();
        if (i > -1)
        {
            wificonfiguration.imsi = makeNAI(mTm.getSubscriberIdGemini(i), s);
            Xlog.d("WifiConfigController", (new StringBuilder()).append("config.imsi: ").append(wificonfiguration.imsi).toString());
            wificonfiguration.simSlot = addQuote((new StringBuilder()).append("").append(i).toString());
            Xlog.d("WifiConfigController", (new StringBuilder()).append("config.simSlot ").append(addQuote((new StringBuilder()).append("").append(i).toString())).toString());
            wificonfiguration.pcsc = addQuote("rild");
            Xlog.d("WifiConfigController", (new StringBuilder()).append("config.pcsc: ").append(addQuote("rild")).toString());
        }
    }

    public static int validate(String s, String s1, String s2)
    {
        int i;
        Matcher matcher;
        String as[];
        i = 0x7f090110;
        matcher = HOSTNAME_PATTERN.matcher(s);
        as = s2.split(",");
        if (matcher.matches()) goto _L2; else goto _L1
_L1:
        i = 0x7f09010c;
_L4:
        return i;
_L2:
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s3 = as[k];
            if (!EXCLUSION_PATTERN.matcher(s3).matches())
                return 0x7f09010d;
        }

        if (s.length() > 0 && s1.length() == 0)
            return 0x7f09010e;
        if (s1.length() <= 0)
            break; /* Loop/switch isn't completed */
        if (s.length() == 0)
            return 0x7f09010f;
        int l;
        try
        {
            l = Integer.parseInt(s1);
        }
        catch (NumberFormatException numberformatexception)
        {
            return i;
        }
        if (l <= 0 || l > 65535) goto _L4; else goto _L3
_L3:
        return 0;
    }

    private int validateIpConfigFields(LinkProperties linkproperties)
    {
        if (mIpAddressView == null)
            return 0;
        String s = mIpAddressView.getText().toString();
        if (TextUtils.isEmpty(s))
            return 0x7f0900cf;
        InetAddress inetaddress;
        int i;
        NumberFormatException numberformatexception;
        String s1;
        IllegalArgumentException illegalargumentexception1;
        InetAddress inetaddress1;
        String s2;
        IllegalArgumentException illegalargumentexception2;
        InetAddress inetaddress2;
        String s3;
        IllegalArgumentException illegalargumentexception3;
        InetAddress inetaddress3;
        UnknownHostException unknownhostexception;
        RuntimeException runtimeexception;
        byte abyte0[];
        try
        {
            inetaddress = NetworkUtils.numericToInetAddress(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return 0x7f0900cf;
        }
        i = -1;
        i = Integer.parseInt(mNetworkPrefixLengthView.getText().toString());
        if (i >= 0 && i <= 32)
        {
            try
            {
                linkproperties.addLinkAddress(new LinkAddress(inetaddress, i));
            }
            // Misplaced declaration of an exception variable
            catch (NumberFormatException numberformatexception)
            {
                mNetworkPrefixLengthView.setText(mConfigUi.getContext().getString(0x7f0900da));
            }
            s1 = mGatewayView.getText().toString();
            if (TextUtils.isEmpty(s1))
            {
                try
                {
                    abyte0 = NetworkUtils.getNetworkPart(inetaddress, i).getAddress();
                    abyte0[-1 + abyte0.length] = 1;
                    mGatewayView.setText(InetAddress.getByAddress(abyte0).getHostAddress());
                }
                // Misplaced declaration of an exception variable
                catch (RuntimeException runtimeexception)
                {
                    runtimeexception.printStackTrace();
                }
                // Misplaced declaration of an exception variable
                catch (UnknownHostException unknownhostexception)
                {
                    unknownhostexception.printStackTrace();
                }
            } else
            {
                try
                {
                    inetaddress1 = NetworkUtils.numericToInetAddress(s1);
                }
                // Misplaced declaration of an exception variable
                catch (IllegalArgumentException illegalargumentexception1)
                {
                    return 0x7f0900d0;
                }
                linkproperties.addRoute(new RouteInfo(inetaddress1));
            }
            s2 = mDns1View.getText().toString();
            if (TextUtils.isEmpty(s2))
            {
                mDns1View.setText(mConfigUi.getContext().getString(0x7f0900d4));
            } else
            {
                try
                {
                    inetaddress2 = NetworkUtils.numericToInetAddress(s2);
                }
                // Misplaced declaration of an exception variable
                catch (IllegalArgumentException illegalargumentexception2)
                {
                    return 0x7f0900d1;
                }
                linkproperties.addDns(inetaddress2);
            }
            if (mDns2View.length() > 0)
            {
                s3 = mDns2View.getText().toString();
                try
                {
                    inetaddress3 = NetworkUtils.numericToInetAddress(s3);
                }
                // Misplaced declaration of an exception variable
                catch (IllegalArgumentException illegalargumentexception3)
                {
                    return 0x7f0900d1;
                }
                linkproperties.addDns(inetaddress3);
            }
            return 0;
        } else
        {
            return 0x7f0900d2;
        }
    }

    public void afterTextChanged(Editable editable)
    {
        mTextViewChangedHandler.post(new Runnable() {

            final WifiConfigController this$0;

            public void run()
            {
                enableSubmitIfAppropriate();
            }

            
            {
                this$0 = WifiConfigController.this;
                super();
            }
        }
);
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void closeSpinnerDialog()
    {
        if (mSecuritySpinner != null && mSecuritySpinner.isPopupShowing())
        {
            mSecuritySpinner.dismissPopup();
        } else
        {
            if (mEapMethodSpinner != null && mEapMethodSpinner.isPopupShowing())
            {
                mEapMethodSpinner.dismissPopup();
                return;
            }
            if (mEapCaCertSpinner != null && mEapCaCertSpinner.isPopupShowing())
            {
                mEapCaCertSpinner.dismissPopup();
                return;
            }
            if (mPhase2Spinner != null && mPhase2Spinner.isPopupShowing())
            {
                mPhase2Spinner.dismissPopup();
                return;
            }
            if (mEapUserCertSpinner != null && mEapUserCertSpinner.isPopupShowing())
            {
                mEapUserCertSpinner.dismissPopup();
                return;
            }
            if (mIpSettingsSpinner != null && mIpSettingsSpinner.isPopupShowing())
            {
                mIpSettingsSpinner.dismissPopup();
                return;
            }
            if (mProxySettingsSpinner != null && mProxySettingsSpinner.isPopupShowing())
            {
                mProxySettingsSpinner.dismissPopup();
                return;
            }
            if (mSimSlot != null && mSimSlot.isPopupShowing())
            {
                mSimSlot.dismissPopup();
                return;
            }
            if (mWapiAsCert != null && mWapiAsCert.isPopupShowing())
            {
                mWapiAsCert.dismissPopup();
                return;
            }
            if (mWapiClientCert != null && mWapiClientCert.isPopupShowing())
            {
                mWapiClientCert.dismissPopup();
                return;
            }
        }
    }

    void enableSubmitIfAppropriate()
    {
        Button button;
        boolean flag;
label0:
        {
            button = mConfigUi.getSubmitButton();
            if (button == null)
                return;
            TextView textview = mPasswordView;
            flag = false;
            if (textview == null)
                break label0;
            if ((mAccessPointSecurity != 1 || isWEPKeyValid(mPasswordView.getText().toString())) && (mAccessPointSecurity != 2 && mAccessPointSecurity != 3 && mAccessPointSecurity != 4 || mPasswordView.length() >= 8))
            {
                int i = mAccessPointSecurity;
                flag = false;
                if (i != 6)
                    break label0;
                if (mPasswordView.length() >= 8 && 64 >= mPasswordView.length())
                {
                    boolean flag2 = mHex;
                    flag = false;
                    if (!flag2)
                        break label0;
                    boolean flag3 = mPasswordView.getText().toString().matches("[0-9A-Fa-f]*");
                    flag = false;
                    if (flag3)
                        break label0;
                }
            }
            flag = true;
        }
        if (mAccessPointSecurity == 7 && (mWapiAsCert != null && mWapiAsCert.getSelectedItemPosition() == 0 || mWapiClientCert != null && mWapiClientCert.getSelectedItemPosition() == 0))
            flag = true;
        boolean flag1;
        if ((mSsidView == null || mSsidView.length() != 0) && (mAccessPoint != null && mAccessPoint.mNetworkId != -1 || !flag))
        {
            if (ipAndProxyFieldsAreValid())
                flag1 = true;
            else
                flag1 = false;
        } else
        {
            flag1 = false;
        }
        button.setEnabled(flag1);
    }

    WifiConfiguration getConfig()
    {
label0:
        {
            boolean flag = true;
            mConfigUi.getContext();
            if (mAccessPoint != null && mAccessPoint.mNetworkId != -1 && !mEdit)
                return null;
            WifiConfiguration wificonfiguration = new WifiConfiguration();
            wificonfiguration.imsi = addQuote("none");
            wificonfiguration.simSlot = addQuote("-1");
            wificonfiguration.pcsc = addQuote("none");
            if (mAccessPoint == null)
            {
                wificonfiguration.SSID = AccessPoint.convertToQuotedString(mSsidView.getText().toString());
                wificonfiguration.hiddenSSID = flag;
            } else
            if (mAccessPoint.mNetworkId == -1)
            {
                wificonfiguration.SSID = AccessPoint.convertToQuotedString(mAccessPoint.mSsid);
                wificonfiguration.BSSID = mAccessPoint.mBssid;
            } else
            {
                wificonfiguration.networkId = mAccessPoint.mNetworkId;
            }
            switch (mAccessPointSecurity)
            {
            default:
                break label0;

            case 7: // '\007'
                wificonfiguration.allowedKeyManagement.set(6);
                wificonfiguration.allowedProtocols.set(2);
                wificonfiguration.allowedPairwiseCiphers.set(3);
                wificonfiguration.allowedGroupCiphers.set(4);
                android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield8 = wificonfiguration.ca_cert2;
                String s11;
                if (mWapiAsCert.getSelectedItemPosition() == 0)
                    s11 = "";
                else
                    s11 = (new StringBuilder()).append("keystore://WAPIASCERT_").append((String)mWapiAsCert.getSelectedItem()).toString();
                enterprisefield8.setValue(s11);
                android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield9 = wificonfiguration.client_cert;
                String s12;
                if (mWapiClientCert.getSelectedItemPosition() == 0)
                    s12 = "";
                else
                    s12 = (new StringBuilder()).append("keystore://WAPIUSERCERT_").append((String)mWapiClientCert.getSelectedItem()).toString();
                enterprisefield9.setValue(s12);
                boolean flag1;
                if (mWapiClientCert.getSelectedItemPosition() == 0)
                    flag1 = flag;
                else
                    flag1 = false;
                android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield10 = wificonfiguration.key_id;
                String s13;
                if (flag1)
                    s13 = "";
                else
                    s13 = (new StringBuilder()).append("keystore://WAPIUSERCERT_").append((String)mWapiClientCert.getSelectedItem()).toString();
                enterprisefield10.setValue(s13);
                android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield11 = wificonfiguration.engine;
                String s14;
                if (flag1)
                    s14 = "0";
                else
                    s14 = "1";
                enterprisefield11.setValue(s14);
                android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield12 = wificonfiguration.engine_id;
                String s15;
                if (flag1)
                    s15 = "";
                else
                    s15 = "keystore";
                enterprisefield12.setValue(s15);
                break;

            case 6: // '\006'
                wificonfiguration.allowedKeyManagement.set(5);
                wificonfiguration.allowedProtocols.set(2);
                wificonfiguration.allowedPairwiseCiphers.set(3);
                wificonfiguration.allowedGroupCiphers.set(4);
                if (mPasswordView.length() == 0)
                    break;
                String s10 = mPasswordView.getText().toString();
                Xlog.v("WifiConfigController", (new StringBuilder()).append("getConfig(), mHex=").append(mHex).toString());
                if (mHex)
                    wificonfiguration.preSharedKey = s10;
                else
                    wificonfiguration.preSharedKey = (new StringBuilder()).append('"').append(s10).append('"').toString();
                break;

            case 5: // '\005'
                wificonfiguration.allowedKeyManagement.set(2);
                wificonfiguration.allowedKeyManagement.set(3);
                wificonfiguration.eap.setValue((String)mEapMethodSpinner.getSelectedItem());
                if (!"AKA".equals((String)mEapMethodSpinner.getSelectedItem()) && !"SIM".equals((String)mEapMethodSpinner.getSelectedItem()))
                {
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield = wificonfiguration.phase2;
                    String s2;
                    if (mPhase2Spinner.getSelectedItemPosition() == 0)
                        s2 = "";
                    else
                        s2 = (new StringBuilder()).append("auth=").append(mPhase2Spinner.getSelectedItem()).toString();
                    enterprisefield.setValue(s2);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield1 = wificonfiguration.ca_cert;
                    String s3;
                    if (mEapCaCertSpinner.getSelectedItemPosition() == 0)
                        s3 = "";
                    else
                        s3 = (new StringBuilder()).append("keystore://CACERT_").append((String)mEapCaCertSpinner.getSelectedItem()).toString();
                    enterprisefield1.setValue(s3);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield2 = wificonfiguration.client_cert;
                    String s4;
                    if (mEapUserCertSpinner.getSelectedItemPosition() == 0)
                        s4 = "";
                    else
                        s4 = (new StringBuilder()).append("keystore://USRCERT_").append((String)mEapUserCertSpinner.getSelectedItem()).toString();
                    enterprisefield2.setValue(s4);
                    if (mEapUserCertSpinner.getSelectedItemPosition() != 0)
                        flag = false;
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield3 = wificonfiguration.key_id;
                    String s5;
                    if (flag)
                        s5 = "";
                    else
                        s5 = (new StringBuilder()).append("USRPKEY_").append((String)mEapUserCertSpinner.getSelectedItem()).toString();
                    enterprisefield3.setValue(s5);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield4 = wificonfiguration.engine;
                    String s6;
                    if (flag)
                        s6 = "0";
                    else
                        s6 = "1";
                    enterprisefield4.setValue(s6);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield5 = wificonfiguration.engine_id;
                    String s7;
                    if (flag)
                        s7 = "";
                    else
                        s7 = "keystore";
                    enterprisefield5.setValue(s7);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield6 = wificonfiguration.identity;
                    String s8;
                    if (mEapIdentityView.length() == 0)
                        s8 = "";
                    else
                        s8 = mEapIdentityView.getText().toString();
                    enterprisefield6.setValue(s8);
                    android.net.wifi.WifiConfiguration.EnterpriseField enterprisefield7 = wificonfiguration.anonymous_identity;
                    String s9;
                    if (mEapAnonymousView.length() == 0)
                        s9 = "";
                    else
                        s9 = mEapAnonymousView.getText().toString();
                    enterprisefield7.setValue(s9);
                    if (mPasswordView.length() != 0)
                        wificonfiguration.password.setValue(mPasswordView.getText().toString());
                } else
                {
                    eapSimAkaConfig(wificonfiguration);
                }
                Xlog.d("WifiConfigController", (new StringBuilder()).append("eap-sim/aka, config.toString(): ").append(wificonfiguration.toString()).toString());
                break;

            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
                wificonfiguration.allowedKeyManagement.set(flag);
                if (mPasswordView.length() == 0)
                    break;
                String s1 = mPasswordView.getText().toString();
                if (s1.matches("[0-9A-Fa-f]{64}"))
                    wificonfiguration.preSharedKey = s1;
                else
                    wificonfiguration.preSharedKey = (new StringBuilder()).append('"').append(s1).append('"').toString();
                break;

            case 1: // '\001'
                wificonfiguration.allowedKeyManagement.set(0);
                wificonfiguration.allowedAuthAlgorithms.set(0);
                wificonfiguration.allowedAuthAlgorithms.set(flag);
                if (mPasswordView.length() == 0)
                    break;
                int i = mPasswordView.length();
                String s = mPasswordView.getText().toString();
                Spinner spinner = mWEPKeyIndex;
                int j = 0;
                if (spinner != null)
                {
                    int k = mWEPKeyIndex.getSelectedItemPosition();
                    j = 0;
                    if (k != -1)
                        j = mWEPKeyIndex.getSelectedItemPosition();
                }
                if ((i == 10 || i == 26 || i == 32) && s.matches("[0-9A-Fa-f]*"))
                    wificonfiguration.wepKeys[j] = s;
                else
                    wificonfiguration.wepKeys[j] = (new StringBuilder()).append('"').append(s).append('"').toString();
                wificonfiguration.wepTxKeyIndex = j;
                break;

            case 0: // '\0'
                wificonfiguration.allowedKeyManagement.set(0);
                break;
            }
            wificonfiguration.proxySettings = mProxySettings;
            wificonfiguration.ipAssignment = mIpAssignment;
            wificonfiguration.linkProperties = new LinkProperties(mLinkProperties);
            return wificonfiguration;
        }
        return null;
    }

    public boolean isEdit()
    {
        return mEdit;
    }

    public void onClick(View view)
    {
        if (view.getId() == 0x7f0b0064)
        {
            int i = mPasswordView.getSelectionEnd();
            TextView textview = mPasswordView;
            char c;
            if (((CheckBox)view).isChecked())
                c = '\220';
            else
                c = '\200';
            textview.setInputType(c | '\001');
            if (i >= 0)
                ((EditText)mPasswordView).setSelection(i);
        } else
        {
            if (view.getId() == 0x7f0b006b)
                if (((CheckBox)view).isChecked())
                {
                    mView.findViewById(0x7f0b006c).setVisibility(0);
                    return;
                } else
                {
                    mView.findViewById(0x7f0b006c).setVisibility(8);
                    return;
                }
            if (view.getId() == 0x7f0b0065)
            {
                mHex = ((CheckBox)view).isChecked();
                enableSubmitIfAppropriate();
                Xlog.d("WifiConfigController", (new StringBuilder()).append("onClick mHex is=").append(mHex).append(",enableSubmitIfAppropriate").toString());
                return;
            }
            if (view.getId() == 0x7f0b007e)
            {
                enableSubmitIfAppropriate();
                return;
            }
        }
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        if (adapterview == mSecuritySpinner)
        {
            mAccessPointSecurity = i;
            if (SystemProperties.get("persist.sys.wlan", "wifi-wapi").equals("wapi"))
            {
                if (mAccessPointSecurity > 0)
                    mAccessPointSecurity = 5 + mAccessPointSecurity;
            } else
            if (!AccessPoint.isWFATestSupported())
            {
                if (mAccessPointSecurity > 2)
                    mAccessPointSecurity = 2 + mAccessPointSecurity;
            } else
            if (mAccessPointSecurity > 1)
                mAccessPointSecurity = 1 + mAccessPointSecurity;
            showSecurityFields();
        } else
        if (adapterview == mEapMethodSpinner)
            showSecurityFields();
        else
        if (adapterview == mProxySettingsSpinner)
            showProxyFields();
        else
        if (adapterview == mIpSettingsSpinner)
            showIpConfigFields();
        enableSubmitIfAppropriate();
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

}
