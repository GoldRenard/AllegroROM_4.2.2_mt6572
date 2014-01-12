// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Resources;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.SystemProperties;
import android.text.*;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.settings.Utils;
import com.mediatek.custom.CustomProperties;
import com.mediatek.settings.ext.IWifiApDialogExt;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings.wifi:
//            Utf8ByteLengthFilter

public class WifiApDialog extends AlertDialog
    implements android.view.View.OnClickListener, TextWatcher, android.widget.AdapterView.OnItemSelectedListener
{

    private static final int AP_SSID_MAX_LENGTH_BYTES = 32;
    static final int BUTTON_SUBMIT = -1;
    private static final String KEY_PROP_WPS2_SUPPORT = "persist.radio.wifi.wps2support";
    public static final int OPEN_INDEX = 0;
    private static final String TAG = "WifiApDialog";
    public static final int WPA2_INDEX = 2;
    public static final int WPA_INDEX = 1;
    private int mChannel;
    private String mChannelList[];
    private int mChannelWidth;
    private Context mContext;
    IWifiApDialogExt mExt;
    private LinearLayout mLinearLayout;
    private final android.content.DialogInterface.OnClickListener mListener;
    private Spinner mMaxConnSpinner;
    private EditText mPassword;
    private Spinner mSecurity;
    private int mSecurityTypeIndex;
    private TextView mSsid;
    private View mView;
    WifiConfiguration mWifiConfig;
    private WifiManager mWifiManager;
    private boolean mWpaNonsupport;

    public WifiApDialog(Context context, android.content.DialogInterface.OnClickListener onclicklistener, WifiConfiguration wificonfiguration)
    {
        super(context);
        mSecurityTypeIndex = 0;
        mChannel = 0;
        mChannelWidth = 0;
        mContext = context;
        mListener = onclicklistener;
        mWifiConfig = wificonfiguration;
        if (wificonfiguration != null)
            mSecurityTypeIndex = getSecurityTypeIndex(wificonfiguration);
    }

    public static int getSecurityTypeIndex(WifiConfiguration wificonfiguration)
    {
        if (wificonfiguration.allowedKeyManagement.get(1))
            return 1;
        return !wificonfiguration.allowedKeyManagement.get(4) ? 0 : 2;
    }

    private boolean isWpa2Only()
    {
        int i = mExt.getSecurityType(0);
        boolean flag = false;
        if (i == 1)
        {
            boolean flag1 = mWpaNonsupport;
            flag = false;
            if (flag1)
                flag = true;
        }
        return flag;
    }

    private void showSecurityFields()
    {
        if (mSecurityTypeIndex == 0)
        {
            mView.findViewById(0x7f0801dd).setVisibility(8);
            return;
        } else
        {
            mView.findViewById(0x7f0801dd).setVisibility(0);
            return;
        }
    }

    private void validate()
    {
        if ((mSsid == null || mSsid.length() != 0) && (mSecurityTypeIndex != 1 && mSecurityTypeIndex != 2 || mPassword.length() >= 8))
        {
            getButton(-1).setEnabled(true);
            return;
        } else
        {
            getButton(-1).setEnabled(false);
            return;
        }
    }

    public void afterTextChanged(Editable editable)
    {
        validate();
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void closeSpinnerDialog()
    {
        if (mSecurity != null && mSecurity.isPopupShowing())
            mSecurity.dismissPopup();
    }

    public WifiConfiguration getConfig()
    {
        WifiConfiguration wificonfiguration = new WifiConfiguration();
        wificonfiguration.SSID = mSsid.getText().toString();
        wificonfiguration.channel = mChannel;
        wificonfiguration.channelWidth = mChannelWidth;
        switch (mSecurityTypeIndex)
        {
        case 2: // '\002'
            wificonfiguration.allowedKeyManagement.set(4);
            wificonfiguration.allowedAuthAlgorithms.set(0);
            if (mPassword.length() != 0)
            {
                wificonfiguration.preSharedKey = mPassword.getText().toString();
                return wificonfiguration;
            }
            break;

        case 1: // '\001'
            wificonfiguration.allowedKeyManagement.set(1);
            wificonfiguration.allowedAuthAlgorithms.set(0);
            if (mPassword.length() != 0)
            {
                wificonfiguration.preSharedKey = mPassword.getText().toString();
                return wificonfiguration;
            }
            break;

        case 0: // '\0'
            wificonfiguration.allowedKeyManagement.set(0);
            return wificonfiguration;

        default:
            wificonfiguration = null;
            break;
        }
        return wificonfiguration;
    }

    public void onClick(View view)
    {
        if (view.getId() == 0x7f0801de)
        {
            EditText edittext = mPassword;
            char c;
            if (((CheckBox)view).isChecked())
                c = '\220';
            else
                c = '\200';
            edittext.setInputType(c | '\001');
        } else
        if (view.getId() == 0x7f0801df)
        {
            String s = CustomProperties.getString("wlan", "SSID", mContext.getString(0x104040c));
            mSsid.setText(s);
            mSecurityTypeIndex = 2;
            if (mWpaNonsupport)
            {
                if (isWpa2Only())
                    mSecurity.setSelection(0);
                else
                    mSecurity.setSelection(-1 + mSecurityTypeIndex);
            } else
            {
                mSecurity.setSelection(mExt.getSelection(mSecurityTypeIndex));
            }
            String s1 = UUID.randomUUID().toString();
            String s2 = (new StringBuilder()).append(s1.substring(0, 8)).append(s1.substring(9, 13)).toString();
            mPassword.setText(s2);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Context context = getContext();
        mView = getLayoutInflater().inflate(0x7f0400a5, null);
        mSecurity = (Spinner)mView.findViewById(0x7f0801dc);
        mExt = Utils.getWifiApDialogPlugin(context);
        mWpaNonsupport = "true".equals(SystemProperties.get("persist.radio.wifi.wps2support", "false"));
        if (mWpaNonsupport)
        {
            String as1[] = context.getResources().getStringArray(0x7f070014);
            ArrayAdapter arrayadapter1 = new ArrayAdapter(context, 0x1090008);
            arrayadapter1.setDropDownViewResource(0x1090009);
            if (!isWpa2Only())
                arrayadapter1.add(as1[0]);
            arrayadapter1.add(as1[2]);
            mSecurity.setAdapter(arrayadapter1);
        } else
        {
            mExt.setAdapter(context, mSecurity, 0x7f070014);
        }
        mMaxConnSpinner = (Spinner)mView.findViewById(0x7f0801e0);
        mMaxConnSpinner.setOnItemSelectedListener(this);
        setView(mView);
        setInverseBackgroundForced(true);
        setTitle(0x7f0b04c0);
        mView.findViewById(0x7f0801a7).setVisibility(0);
        mSsid = (TextView)mView.findViewById(0x7f0801d7);
        mPassword = (EditText)mView.findViewById(0x7f0801bb);
        setButton(-1, context.getString(0x7f0b048e), mListener);
        setButton(-2, context.getString(0x7f0b0490), mListener);
        if (mWifiConfig != null)
        {
            mSsid.setText(mWifiConfig.SSID);
            if (mWpaNonsupport)
            {
                if (isWpa2Only())
                    mSecurity.setSelection(0);
                else
                    mSecurity.setSelection(-1 + mSecurityTypeIndex);
            } else
            {
                mSecurity.setSelection(mExt.getSelection(mSecurityTypeIndex));
            }
            if (mSecurityTypeIndex == 1 || mSecurityTypeIndex == 2)
                mPassword.setText(mWifiConfig.preSharedKey);
            mChannel = mWifiConfig.channel;
            mChannelWidth = mWifiConfig.channelWidth;
        }
        mWifiManager = (WifiManager)mContext.getApplicationContext().getSystemService("wifi");
        Spinner spinner = (Spinner)mView.findViewById(0x7f0801d9);
        Spinner spinner1 = (Spinner)mView.findViewById(0x7f0801db);
        if (SystemProperties.getInt("mediatek.wlan.channelselect", 0) != 0 && mWifiManager.getWifiApState() == 13)
        {
            mLinearLayout = (LinearLayout)mView.findViewById(0x7f0801a7);
            mLinearLayout.removeView(mView.findViewById(0x7f0801da));
            mLinearLayout.removeView(mView.findViewById(0x7f0801db));
            ArrayList arraylist = new ArrayList();
            arraylist.add(context.getString(0x7f0b013a));
            String as[] = mWifiManager.getAccessPointPreferredChannels();
            int j = as.length;
            for (int k = 0; k < j; k++)
                arraylist.add(as[k]);

            mChannelList = (String[])(String[])arraylist.toArray(new String[arraylist.size()]);
            if (mChannelList != null)
            {
                ArrayAdapter arrayadapter = new ArrayAdapter(mContext, 0x1090008, mChannelList);
                arrayadapter.setDropDownViewResource(0x1090009);
                spinner.setAdapter(arrayadapter);
                int l = mChannel;
                int i1 = 0;
                if (l != 0)
                {
                    for (i1 = 1; i1 < mChannelList.length && !mChannelList[i1].equals((new StringBuilder()).append(mChannel).append("").toString()); i1++);
                    if (i1 == mChannelList.length)
                        i1 = 0;
                }
                spinner.setSelection(i1);
                android.widget.AdapterView.OnItemSelectedListener onitemselectedlistener1 = new android.widget.AdapterView.OnItemSelectedListener() {

                    final WifiApDialog this$0;

                    public void onItemSelected(AdapterView adapterview, View view, int j1, long l1)
                    {
                        if (j1 == 0)
                        {
                            try
                            {
                                mChannel = 0;
                                return;
                            }
                            catch (NumberFormatException numberformatexception)
                            {
                                numberformatexception.printStackTrace();
                            }
                            break MISSING_BLOCK_LABEL_42;
                        }
                        mChannel = Integer.parseInt(mChannelList[j1]);
                        return;
                    }

                    public void onNothingSelected(AdapterView adapterview)
                    {
                    }

            
            {
                this$0 = WifiApDialog.this;
                super();
            }
                }
;
                spinner.setOnItemSelectedListener(onitemselectedlistener1);
            }
            spinner1.setSelection(mChannelWidth);
            if (spinner1 != null)
            {
                android.widget.AdapterView.OnItemSelectedListener onitemselectedlistener = new android.widget.AdapterView.OnItemSelectedListener() {

                    final WifiApDialog this$0;

                    public void onItemSelected(AdapterView adapterview, View view, int j1, long l1)
                    {
                        if (j1 == 0)
                        {
                            mChannelWidth = 0;
                            return;
                        } else
                        {
                            mChannelWidth = 1;
                            return;
                        }
                    }

                    public void onNothingSelected(AdapterView adapterview)
                    {
                    }

            
            {
                this$0 = WifiApDialog.this;
                super();
            }
                }
;
                spinner1.setOnItemSelectedListener(onitemselectedlistener);
            }
        } else
        {
            mLinearLayout = (LinearLayout)mView.findViewById(0x7f0801a7);
            mLinearLayout.removeView(mView.findViewById(0x7f0801d8));
            mLinearLayout.removeView(mView.findViewById(0x7f0801da));
            mLinearLayout.removeView(mView.findViewById(0x7f0801d9));
            mLinearLayout.removeView(mView.findViewById(0x7f0801db));
        }
        TextView textview = mSsid;
        InputFilter ainputfilter[] = new InputFilter[1];
        ainputfilter[0] = new Utf8ByteLengthFilter(32);
        textview.setFilters(ainputfilter);
        ((Button)mView.findViewById(0x7f0801df)).setOnClickListener(this);
        int i = android.provider.Settings.System.getInt(mContext.getContentResolver(), "wifi_hotspot_max_client_num", 5);
        mMaxConnSpinner.setSelection(i - 1);
        mSsid.addTextChangedListener(this);
        mPassword.addTextChangedListener(this);
        ((CheckBox)mView.findViewById(0x7f0801de)).setOnClickListener(this);
        mSecurity.setOnItemSelectedListener(this);
        super.onCreate(bundle);
        showSecurityFields();
        validate();
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        if (adapterview.equals(mSecurity))
        {
            if (mWpaNonsupport)
            {
                if (isWpa2Only())
                {
                    mSecurityTypeIndex = 2;
                } else
                {
                    if (i > 0)
                        i++;
                    mSecurityTypeIndex = i;
                }
            } else
            {
                mSecurityTypeIndex = mExt.getSecurityType(i);
            }
            Xlog.d("WifiApDialog", (new StringBuilder()).append("mSecurityTypeIndex: ").append(mSecurityTypeIndex).toString());
            showSecurityFields();
            validate();
        } else
        if (adapterview.equals(mMaxConnSpinner))
        {
            int j = i + 1;
            android.provider.Settings.System.putInt(mContext.getContentResolver(), "wifi_hotspot_max_client_num", j);
            return;
        }
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }


/*
    static int access$002(WifiApDialog wifiapdialog, int i)
    {
        wifiapdialog.mChannel = i;
        return i;
    }

*/



/*
    static int access$202(WifiApDialog wifiapdialog, int i)
    {
        wifiapdialog.mChannelWidth = i;
        return i;
    }

*/
}
