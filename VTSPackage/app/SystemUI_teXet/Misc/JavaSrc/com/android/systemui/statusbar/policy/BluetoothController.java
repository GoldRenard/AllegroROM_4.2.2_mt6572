// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.widget.ImageView;
import java.util.*;

public class BluetoothController extends BroadcastReceiver
{

    private static final String TAG = "StatusBar.BluetoothController";
    private Set mBondedDevices;
    private ArrayList mChangeCallbacks;
    private int mContentDescriptionId;
    private Context mContext;
    private boolean mEnabled;
    private int mIconId;
    private ArrayList mIconViews;

    public BluetoothController(Context context)
    {
        mIconViews = new ArrayList();
        mIconId = 0x7f02014e;
        mContentDescriptionId = 0;
        mEnabled = false;
        mBondedDevices = new HashSet();
        mChangeCallbacks = new ArrayList();
        mContext = context;
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        intentfilter.addAction("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED");
        intentfilter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        context.registerReceiver(this, intentfilter);
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter != null)
        {
            handleAdapterStateChange(bluetoothadapter.getState());
            handleConnectionStateChange(bluetoothadapter.getConnectionState());
        }
        refreshViews();
        updateBondedBluetoothDevices();
    }

    private void updateBondedBluetoothDevices()
    {
        mBondedDevices.clear();
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter != null)
        {
            Set set = bluetoothadapter.getBondedDevices();
            if (set != null)
            {
                Iterator iterator = set.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)iterator.next();
                    if (bluetoothdevice.getBondState() != 10)
                        mBondedDevices.add(bluetoothdevice);
                } while (true);
            }
        }
    }

    public void addIconView(ImageView imageview)
    {
        mIconViews.add(imageview);
    }

    public void addStateChangedCallback(android.bluetooth.BluetoothAdapter.BluetoothStateChangeCallback bluetoothstatechangecallback)
    {
        mChangeCallbacks.add(bluetoothstatechangecallback);
    }

    public Set getBondedBluetoothDevices()
    {
        return mBondedDevices;
    }

    public void handleAdapterStateChange(int i)
    {
        boolean flag;
        if (i == 12)
            flag = true;
        else
            flag = false;
        mEnabled = flag;
    }

    public void handleConnectionStateChange(int i)
    {
        boolean flag;
        if (i == 2)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            mIconId = 0x7f02014f;
            mContentDescriptionId = 0x7f0b0078;
            return;
        } else
        {
            mIconId = 0x7f02014e;
            mContentDescriptionId = 0x7f0b0079;
            return;
        }
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
            handleAdapterStateChange(intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000));
        else
        if (s.equals("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"))
            handleConnectionStateChange(intent.getIntExtra("android.bluetooth.adapter.extra.CONNECTION_STATE", 0));
        else
        if (!s.equals("android.bluetooth.device.action.BOND_STATE_CHANGED"));
        refreshViews();
        updateBondedBluetoothDevices();
    }

    public void refreshViews()
    {
        int i = mIconViews.size();
        for (int j = 0; j < i; j++)
        {
            ImageView imageview = (ImageView)mIconViews.get(j);
            imageview.setImageResource(mIconId);
            byte byte0;
            if (mEnabled)
                byte0 = 0;
            else
                byte0 = 8;
            imageview.setVisibility(byte0);
            String s;
            if (mContentDescriptionId == 0)
                s = null;
            else
                s = mContext.getString(mContentDescriptionId);
            imageview.setContentDescription(s);
        }

        for (Iterator iterator = mChangeCallbacks.iterator(); iterator.hasNext(); ((android.bluetooth.BluetoothAdapter.BluetoothStateChangeCallback)iterator.next()).onBluetoothStateChange(mEnabled));
    }
}
