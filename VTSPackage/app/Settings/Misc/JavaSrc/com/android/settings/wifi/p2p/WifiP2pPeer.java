// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi.p2p;

import android.content.Context;
import android.content.res.Resources;
import android.net.wifi.WifiManager;
import android.net.wifi.p2p.WifiP2pDevice;
import android.preference.Preference;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;

public class WifiP2pPeer extends Preference
{

    private static final int SIGNAL_LEVELS = 4;
    private static final int STATE_SECURED[] = {
        0x7f010000
    };
    public WifiP2pDevice device;
    private int mRssi;
    private ImageView mSignal;

    public WifiP2pPeer(Context context, WifiP2pDevice wifip2pdevice)
    {
        super(context);
        device = wifip2pdevice;
        setWidgetLayoutResource(0x7f04007b);
        mRssi = 60;
    }

    private void refresh()
    {
        if (mSignal == null)
        {
            return;
        } else
        {
            Context context = getContext();
            mSignal.setImageLevel(getLevel());
            setSummary(context.getResources().getStringArray(0x7f070017)[device.status]);
            return;
        }
    }

    public int compareTo(Preference preference)
    {
        WifiP2pPeer wifip2ppeer;
label0:
        {
            if (preference instanceof WifiP2pPeer)
            {
                wifip2ppeer = (WifiP2pPeer)preference;
                if (device.status == wifip2ppeer.device.status)
                    break label0;
                if (device.status < wifip2ppeer.device.status)
                    return -1;
            }
            return 1;
        }
        if (device.deviceName != null)
            return device.deviceName.compareToIgnoreCase(wifip2ppeer.device.deviceName);
        else
            return device.deviceAddress.compareToIgnoreCase(wifip2ppeer.device.deviceAddress);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    int getLevel()
    {
        if (mRssi == 0x7fffffff)
            return -1;
        else
            return WifiManager.calculateSignalLevel(mRssi, 4);
    }

    protected void onBindView(View view)
    {
        if (TextUtils.isEmpty(device.deviceName))
            setTitle(device.deviceAddress);
        else
            setTitle(device.deviceName);
        mSignal = (ImageView)view.findViewById(0x7f080130);
        if (mRssi == 0x7fffffff)
        {
            mSignal.setImageDrawable(null);
        } else
        {
            mSignal.setImageResource(0x7f0200d8);
            mSignal.setImageState(STATE_SECURED, true);
        }
        refresh();
        super.onBindView(view);
    }

}
