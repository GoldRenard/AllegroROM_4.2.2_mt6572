// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.content.res.Resources;
import android.os.PowerManager;
import android.text.TextUtils;

// Referenced classes of package com.android.settings.bluetooth:
//            BluetoothPairingDialog, LocalBluetoothPreferences

public final class BluetoothPairingRequest extends BroadcastReceiver
{

    private static final int NOTIFICATION_ID = 0x1080080;


    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        if (s.equals("android.bluetooth.device.action.PAIRING_REQUEST"))
        {
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            int i = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_VARIANT", 0x80000000);
            Intent intent1 = new Intent();
            intent1.setClass(context, com/android/settings/bluetooth/BluetoothPairingDialog);
            intent1.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
            intent1.putExtra("android.bluetooth.device.extra.PAIRING_VARIANT", i);
            if (i == 2 || i == 4 || i == 5)
                intent1.putExtra("android.bluetooth.device.extra.PAIRING_KEY", intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", 0x80000000));
            intent1.setAction("android.bluetooth.device.action.PAIRING_REQUEST");
            intent1.setFlags(0x10000000);
            PowerManager powermanager = (PowerManager)context.getSystemService("power");
            String s1;
            if (bluetoothdevice != null)
                s1 = bluetoothdevice.getAddress();
            else
                s1 = null;
            if (powermanager.isScreenOn() && LocalBluetoothPreferences.shouldShowDialogInForeground(context, s1))
            {
                context.startActivity(intent1);
            } else
            {
                Resources resources = context.getResources();
                android.app.Notification.Builder builder = (new android.app.Notification.Builder(context)).setSmallIcon(0x1080080).setTicker(resources.getString(0x7f0b02de));
                PendingIntent pendingintent = PendingIntent.getActivity(context, 0, intent1, 0x8000000);
                String s2 = intent.getStringExtra("android.bluetooth.device.extra.NAME");
                if (TextUtils.isEmpty(s2))
                    if (bluetoothdevice != null)
                        s2 = bluetoothdevice.getAliasName();
                    else
                        s2 = context.getString(0x104000e);
                builder.setContentTitle(resources.getString(0x7f0b02df)).setContentText(resources.getString(0x7f0b02e0, new Object[] {
                    s2
                })).setContentIntent(pendingintent).setAutoCancel(true).setDefaults(1);
                ((NotificationManager)context.getSystemService("notification")).notify(0x1080080, builder.getNotification());
                return;
            }
        } else
        {
            if (s.equals("android.bluetooth.device.action.PAIRING_CANCEL"))
            {
                ((NotificationManager)context.getSystemService("notification")).cancel(0x1080080);
                return;
            }
            if (s.equals("android.bluetooth.device.action.BOND_STATE_CHANGED") && intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", 0x80000000) == 10)
            {
                ((NotificationManager)context.getSystemService("notification")).cancel(0x1080080);
                return;
            }
        }
    }
}
