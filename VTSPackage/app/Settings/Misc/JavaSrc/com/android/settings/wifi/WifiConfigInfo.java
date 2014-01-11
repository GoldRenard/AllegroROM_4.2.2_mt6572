// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Activity;
import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.widget.TextView;
import java.util.List;

public class WifiConfigInfo extends Activity
{

    private static final String TAG = "WifiConfigInfo";
    private TextView mConfigList;
    private WifiManager mWifiManager;


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mWifiManager = (WifiManager)getApplicationContext().getSystemService("wifi");
        setContentView(0x7f0400a8);
        mConfigList = (TextView)findViewById(0x7f0801e5);
    }

    protected void onResume()
    {
        super.onResume();
        List list = mWifiManager.getConfiguredNetworks();
        if (list == null)
            return;
        StringBuffer stringbuffer = new StringBuffer();
        for (int i = -1 + list.size(); i >= 0; i--)
            stringbuffer.append(list.get(i));

        mConfigList.setText(stringbuffer);
    }
}
