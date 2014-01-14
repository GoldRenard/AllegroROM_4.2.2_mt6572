// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.app.Activity;
import android.content.*;
import android.hardware.usb.UsbAccessory;
import android.hardware.usb.UsbDevice;

class UsbDisconnectedReceiver extends BroadcastReceiver
{

    private UsbAccessory mAccessory;
    private final Activity mActivity;
    private UsbDevice mDevice;

    public UsbDisconnectedReceiver(Activity activity, UsbAccessory usbaccessory)
    {
        mActivity = activity;
        mAccessory = usbaccessory;
        activity.registerReceiver(this, new IntentFilter("android.hardware.usb.action.USB_ACCESSORY_DETACHED"));
    }

    public UsbDisconnectedReceiver(Activity activity, UsbDevice usbdevice)
    {
        mActivity = activity;
        mDevice = usbdevice;
        activity.registerReceiver(this, new IntentFilter("android.hardware.usb.action.USB_DEVICE_DETACHED"));
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        if ("android.hardware.usb.action.USB_DEVICE_DETACHED".equals(s))
        {
            UsbDevice usbdevice = (UsbDevice)intent.getParcelableExtra("device");
            if (usbdevice != null && usbdevice.equals(mDevice))
                mActivity.finish();
        } else
        if ("android.hardware.usb.action.USB_ACCESSORY_DETACHED".equals(s))
        {
            UsbAccessory usbaccessory = (UsbAccessory)intent.getParcelableExtra("accessory");
            if (usbaccessory != null && usbaccessory.equals(mAccessory))
            {
                mActivity.finish();
                return;
            }
        }
    }
}
