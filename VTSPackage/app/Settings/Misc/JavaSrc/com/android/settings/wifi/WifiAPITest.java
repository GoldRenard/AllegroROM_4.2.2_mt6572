// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.content.DialogInterface;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.*;
import android.widget.EditText;

public class WifiAPITest extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceClickListener
{

    private static final String KEY_DISABLE_NETWORK = "disable_network";
    private static final String KEY_DISCONNECT = "disconnect";
    private static final String KEY_ENABLE_NETWORK = "enable_network";
    private static final String TAG = "WifiAPITest";
    private Preference mWifiDisableNetwork;
    private Preference mWifiDisconnect;
    private Preference mWifiEnableNetwork;
    private WifiManager mWifiManager;
    private int netid;


    private void onCreatePreferences()
    {
        addPreferencesFromResource(0x7f0400a7);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mWifiDisconnect = preferencescreen.findPreference("disconnect");
        mWifiDisconnect.setOnPreferenceClickListener(this);
        mWifiDisableNetwork = preferencescreen.findPreference("disable_network");
        mWifiDisableNetwork.setOnPreferenceClickListener(this);
        mWifiEnableNetwork = preferencescreen.findPreference("enable_network");
        mWifiEnableNetwork.setOnPreferenceClickListener(this);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        onCreatePreferences();
        mWifiManager = (WifiManager)getApplicationContext().getSystemService("wifi");
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mWifiDisconnect)
            mWifiManager.disconnect();
        else
        if (preference == mWifiDisableNetwork)
        {
            android.app.AlertDialog.Builder builder1 = new android.app.AlertDialog.Builder(this);
            builder1.setTitle("Input");
            builder1.setMessage("Enter Network ID");
            final EditText input = new EditText(this);
            input.setInputType(3);
            builder1.setView(input);
            builder1.setPositiveButton("Ok", new android.content.DialogInterface.OnClickListener() {

                final WifiAPITest this$0;
                final EditText val$input;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    android.text.Editable editable;
                    editable = input.getText();
                    if (editable == null || editable.toString().equals(""))
                        break MISSING_BLOCK_LABEL_57;
                    netid = Integer.parseInt(editable.toString());
                    mWifiManager.disableNetwork(netid);
                    return;
                    NumberFormatException numberformatexception;
                    numberformatexception;
                }

            
            {
                this$0 = WifiAPITest.this;
                input = edittext;
                super();
            }
            }
);
            builder1.setNegativeButton("Cancel", new android.content.DialogInterface.OnClickListener() {

                final WifiAPITest this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                }

            
            {
                this$0 = WifiAPITest.this;
                super();
            }
            }
);
            builder1.show();
        } else
        if (preference == mWifiEnableNetwork)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            builder.setTitle("Input");
            builder.setMessage("Enter Network ID");
            final EditText input = new EditText(this);
            input.setInputType(3);
            builder.setView(input);
            builder.setPositiveButton("Ok", new android.content.DialogInterface.OnClickListener() {

                final WifiAPITest this$0;
                final EditText val$input;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    android.text.Editable editable;
                    editable = input.getText();
                    if (editable == null || editable.toString().equals(""))
                        break MISSING_BLOCK_LABEL_58;
                    netid = Integer.parseInt(editable.toString());
                    mWifiManager.enableNetwork(netid, false);
                    return;
                    NumberFormatException numberformatexception;
                    numberformatexception;
                }

            
            {
                this$0 = WifiAPITest.this;
                input = edittext;
                super();
            }
            }
);
            builder.setNegativeButton("Cancel", new android.content.DialogInterface.OnClickListener() {

                final WifiAPITest this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                }

            
            {
                this$0 = WifiAPITest.this;
                super();
            }
            }
);
            builder.show();
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        super.onPreferenceTreeClick(preferencescreen, preference);
        return false;
    }



/*
    static int access$002(WifiAPITest wifiapitest, int i)
    {
        wifiapitest.netid = i;
        return i;
    }

*/

}
