// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.hid;

import android.bluetooth.BluetoothDevice;
import android.content.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.bluetooth.hid:
//            BluetoothHidActivity

public class BluetoothHidReceiver extends BroadcastReceiver
{

    private static final boolean DEBUG = true;
    private static final String TAG = "[BT][HID][BluetoothHidReceiver]";


    private void restorePreferenceList(Context context, BluetoothDevice bluetoothdevice)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("BT_HID_SETTING_INFO", 0);
        int i = sharedpreferences.getInt("preferenceCount", 0);
        Xlog.i("[BT][HID][BluetoothHidReceiver]", (new StringBuilder()).append("restorePreferenceList,preferenceCount=").append(i).toString());
        int j;
        for (j = 0; j < i; j++)
            if (sharedpreferences.getString((new StringBuilder()).append("deviceAddr").append(Integer.toString(j)).toString(), "BT_HID_NOT_FOUNT").equals(bluetoothdevice.getAddress()))
            {
                Xlog.i("[BT][HID][BluetoothHidReceiver]", (new StringBuilder()).append("restorePreferenceList,already exist:").append(bluetoothdevice.getName()).toString());
                sharedpreferences.edit().putString((new StringBuilder()).append("newAdd").append(Integer.toString(j)).toString(), "TRUE").commit();
                return;
            }

        int k = i + 1;
        sharedpreferences.edit().putString((new StringBuilder()).append("deviceAddr").append(Integer.toString(j)).toString(), bluetoothdevice.getAddress()).putString((new StringBuilder()).append("newAdd").append(Integer.toString(j)).toString(), "TRUE").commit();
        sharedpreferences.edit().putInt("preferenceCount", k).commit();
        context.sendBroadcast(new Intent("com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED"));
    }

    public void onReceive(Context context, Intent intent)
    {
        Xlog.v("[BT][HID][BluetoothHidReceiver]", "HID broadcast receiver receives intent");
        String s = intent.getAction();
        if (s.equals("android.bluetooth.devicepicker.action.DEVICE_SELECTED"))
        {
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (bluetoothdevice == null)
            {
                Xlog.e("[BT][HID][BluetoothHidReceiver]", "ERROR: remoteDevice null");
            } else
            {
                Xlog.v("[BT][HID][BluetoothHidReceiver]", (new StringBuilder()).append("Received BT device selected intent, bt device: ").append(bluetoothdevice.getAddress()).toString());
                restorePreferenceList(context, bluetoothdevice);
                return;
            }
        } else
        if (s.equals("android.provider.Telephony.SECRET_CODE"))
        {
            Intent intent1 = new Intent(context, com/mediatek/bluetooth/hid/BluetoothHidActivity);
            intent1.putExtra("BLUETOOTH_HID_PTS", "TRUE");
            intent1.addFlags(0x10000000);
            context.startActivity(intent1);
            return;
        }
    }
}
