// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi.hotspot;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.wifi.WifiManager;
import android.net.wifi.WpsInfo;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.mediatek.xlog.Xlog;

public class WifiApWpsDialog extends AlertDialog
    implements android.content.DialogInterface.OnClickListener, android.widget.AdapterView.OnItemSelectedListener
{

    private static final int PIN_FROM_CLIENT = 1;
    private static final int PUSH_BUTTON = 0;
    public static final String TAG = "WifiApWpsDialog";
    private Context mContext;
    private View mView;
    private WifiManager mWifiManager;
    private int mWpsMode;
    private Spinner mWpsModeSpinner;

    public WifiApWpsDialog(Context context)
    {
        super(context);
        mWpsMode = 0;
        mContext = context;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            WpsInfo wpsinfo = new WpsInfo();
            if (mWpsMode == 0)
            {
                wpsinfo.setup = 0;
                wpsinfo.BSSID = "any";
            } else
            if (mWpsMode == 1)
            {
                wpsinfo.setup = 1;
                wpsinfo.pin = ((EditText)mView.findViewById(0x7f0801e4)).getText().toString();
            }
            mWifiManager.startApWps(wpsinfo);
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Xlog.d("WifiApWpsDialog", "onCreate, return dialog");
        mView = getLayoutInflater().inflate(0x7f0400a6, null);
        setView(mView);
        setInverseBackgroundForced(true);
        setTitle(0x7f0b015f);
        mWpsModeSpinner = (Spinner)mView.findViewById(0x7f0801e2);
        mWpsModeSpinner.setOnItemSelectedListener(this);
        setButton(-1, mContext.getString(0x7f0b048a), this);
        setButton(-2, mContext.getString(0x7f0b0490), this);
        mWifiManager = (WifiManager)getContext().getApplicationContext().getSystemService("wifi");
        super.onCreate(bundle);
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        if (adapterview.equals(mWpsModeSpinner))
        {
            mWpsMode = i;
            if (mWpsMode == 0)
                mView.findViewById(0x7f0801e3).setVisibility(8);
            else
            if (mWpsMode == 1)
            {
                mView.findViewById(0x7f0801e3).setVisibility(0);
                return;
            }
        }
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }
}
