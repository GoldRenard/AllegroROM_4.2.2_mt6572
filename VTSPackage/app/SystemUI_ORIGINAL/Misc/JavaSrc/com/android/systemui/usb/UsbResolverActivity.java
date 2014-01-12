// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.*;
import android.content.res.Resources;
import android.hardware.usb.*;
import android.os.*;
import android.util.Log;
import android.widget.CheckBox;
import com.android.internal.app.ResolverActivity;

// Referenced classes of package com.android.systemui.usb:
//            UsbDisconnectedReceiver

public class UsbResolverActivity extends ResolverActivity
{

    public static final String EXTRA_RESOLVE_INFOS = "rlist";
    public static final String TAG = "UsbResolverActivity";
    private UsbAccessory mAccessory;
    private UsbDevice mDevice;
    private UsbDisconnectedReceiver mDisconnectedReceiver;


    protected void onCreate(Bundle bundle)
    {
        Intent intent = getIntent();
        android.os.Parcelable parcelable = intent.getParcelableExtra("android.intent.extra.INTENT");
        if (!(parcelable instanceof Intent))
        {
            Log.w("UsbResolverActivity", (new StringBuilder()).append("Target is not an intent: ").append(parcelable).toString());
            finish();
            return;
        }
        Intent intent1 = (Intent)parcelable;
        java.util.ArrayList arraylist = intent.getParcelableArrayListExtra("rlist");
        super.onCreate(bundle, intent1, getResources().getText(0x10403d1), null, arraylist, true);
        CheckBox checkbox = (CheckBox)findViewById(0x1020266);
        if (checkbox != null)
            if (mDevice == null)
                checkbox.setText(0x7f0b0067);
            else
                checkbox.setText(0x7f0b0066);
        mDevice = (UsbDevice)intent1.getParcelableExtra("device");
        if (mDevice != null)
        {
            mDisconnectedReceiver = new UsbDisconnectedReceiver(this, mDevice);
            return;
        }
        mAccessory = (UsbAccessory)intent1.getParcelableExtra("accessory");
        if (mAccessory == null)
        {
            Log.e("UsbResolverActivity", "no device or accessory");
            finish();
            return;
        } else
        {
            mDisconnectedReceiver = new UsbDisconnectedReceiver(this, mAccessory);
            return;
        }
    }

    protected void onDestroy()
    {
        if (mDisconnectedReceiver != null)
            unregisterReceiver(mDisconnectedReceiver);
        super.onDestroy();
    }

    protected void onIntentSelected(ResolveInfo resolveinfo, Intent intent, boolean flag)
    {
        IUsbManager iusbmanager;
        int i;
        int j;
        iusbmanager = android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb"));
        i = resolveinfo.activityInfo.applicationInfo.uid;
        j = UserHandle.myUserId();
        if (mDevice == null) goto _L2; else goto _L1
_L1:
        iusbmanager.grantDevicePermission(mDevice, i);
        if (!flag) goto _L4; else goto _L3
_L3:
        iusbmanager.setDevicePackage(mDevice, resolveinfo.activityInfo.packageName, j);
_L6:
        startActivityAsUser(intent, new UserHandle(j));
        return;
_L4:
        try
        {
            iusbmanager.setDevicePackage(mDevice, null, j);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("UsbResolverActivity", "onIntentSelected failed", remoteexception);
            return;
        }
        continue; /* Loop/switch isn't completed */
_L2:
        if (mAccessory == null)
            continue; /* Loop/switch isn't completed */
        iusbmanager.grantAccessoryPermission(mAccessory, i);
        if (!flag)
            break MISSING_BLOCK_LABEL_163;
        iusbmanager.setAccessoryPackage(mAccessory, resolveinfo.activityInfo.packageName, j);
        continue; /* Loop/switch isn't completed */
        iusbmanager.setAccessoryPackage(mAccessory, null, j);
        if (true) goto _L6; else goto _L5
_L5:
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Log.e("UsbResolverActivity", "startActivity failed", activitynotfoundexception);
        return;
    }
}
