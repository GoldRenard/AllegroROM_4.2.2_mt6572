// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.*;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.PowerManager;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, CachedBluetoothDeviceManager, CachedBluetoothDevice, BluetoothPermissionActivity, 
//            LocalBluetoothPreferences

public final class BluetoothPermissionRequest extends BroadcastReceiver
{

    private static final boolean DEBUG = false;
    public static final int NOTIFICATION_ID = 0x1080080;
    private static final String TAG = "BluetoothPermissionRequest";
    Context mContext;
    BluetoothDevice mDevice;
    int mRequestType;
    String mReturnClass;
    String mReturnPackage;

    public BluetoothPermissionRequest()
    {
        mReturnPackage = null;
        mReturnClass = null;
    }

    private boolean checkUserChoice()
    {
        if (mRequestType != 2)
            return false;
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(mContext);
        CachedBluetoothDeviceManager cachedbluetoothdevicemanager = localbluetoothmanager.getCachedDeviceManager();
        CachedBluetoothDevice cachedbluetoothdevice = cachedbluetoothdevicemanager.findDevice(mDevice);
        if (cachedbluetoothdevice == null)
            cachedbluetoothdevice = cachedbluetoothdevicemanager.addDevice(localbluetoothmanager.getBluetoothAdapter(), localbluetoothmanager.getProfileManager(), mDevice);
        int i = cachedbluetoothdevice.getPhonebookPermissionChoice();
        if (i == 0)
            return false;
        boolean flag;
        if (i == 1)
        {
            sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", true, "android.bluetooth.device.extra.ALWAYS_ALLOWED", true);
            flag = true;
        } else
        if (i == 2)
        {
            sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", false, null, false);
            flag = true;
        } else
        {
            Log.e("BluetoothPermissionRequest", (new StringBuilder()).append("Bad phonebookPermission: ").append(i).toString());
            flag = false;
        }
        return flag;
    }

    private void sendIntentToReceiver(String s, boolean flag, String s1, boolean flag1)
    {
        Intent intent = new Intent(s);
        if (mReturnPackage != null && mReturnClass != null)
            intent.setClassName(mReturnPackage, mReturnClass);
        byte byte0;
        if (flag)
            byte0 = 1;
        else
            byte0 = 2;
        intent.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", byte0);
        if (s1 != null)
            intent.putExtra(s1, flag1);
        intent.putExtra("android.bluetooth.device.extra.DEVICE", mDevice);
        mContext.sendBroadcast(intent, "android.permission.BLUETOOTH_ADMIN");
    }

    public void onReceive(Context context, Intent intent)
    {
        mContext = context;
        String s = intent.getAction();
        if (s.equals("android.bluetooth.device.action.CONNECTION_ACCESS_REQUEST"))
        {
            mDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            mRequestType = intent.getIntExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", 1);
            mReturnPackage = intent.getStringExtra("android.bluetooth.device.extra.PACKAGE_NAME");
            mReturnClass = intent.getStringExtra("android.bluetooth.device.extra.CLASS_NAME");
            Intent intent1 = new Intent(s);
            intent1.setClass(context, com/android/settings/bluetooth/BluetoothPermissionActivity);
            intent1.setFlags(0x10000000);
            intent1.putExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", mRequestType);
            intent1.putExtra("android.bluetooth.device.extra.DEVICE", mDevice);
            intent1.putExtra("android.bluetooth.device.extra.PACKAGE_NAME", mReturnPackage);
            intent1.putExtra("android.bluetooth.device.extra.CLASS_NAME", mReturnClass);
            if (!checkUserChoice())
            {
                String s1;
                if (mDevice != null)
                    s1 = mDevice.getAddress();
                else
                    s1 = null;
                if (((PowerManager)context.getSystemService("power")).isScreenOn() && LocalBluetoothPreferences.shouldShowDialogInForeground(context, s1))
                {
                    context.startActivity(intent1);
                    return;
                }
                Intent intent2 = new Intent("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY");
                intent2.putExtra("android.bluetooth.device.extra.DEVICE", mDevice);
                intent2.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", 2);
                Notification notification = new Notification(0x1080080, context.getString(0x7f0b02ec), System.currentTimeMillis());
                String s2;
                if (mDevice != null)
                    s2 = mDevice.getAliasName();
                else
                    s2 = null;
                notification.setLatestEventInfo(context, context.getString(0x7f0b02ec), context.getString(0x7f0b02ed, new Object[] {
                    s2
                }), PendingIntent.getActivity(context, 0, intent1, 0));
                notification.flags = 24;
                notification.defaults = 1;
                notification.deleteIntent = PendingIntent.getBroadcast(context, 0, intent2, 0);
                ((NotificationManager)context.getSystemService("notification")).notify(0x1080080, notification);
                return;
            }
        } else
        if (s.equals("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL"))
        {
            ((NotificationManager)context.getSystemService("notification")).cancel(0x1080080);
            return;
        }
    }
}
