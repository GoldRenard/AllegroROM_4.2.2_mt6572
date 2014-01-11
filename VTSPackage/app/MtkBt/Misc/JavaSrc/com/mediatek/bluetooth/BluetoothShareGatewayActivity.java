// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelUuid;
import android.util.Log;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.bluetooth:
//            BluetoothUuidEx, BluetoothShareGatewayReceiver

public class BluetoothShareGatewayActivity extends Activity
{

    public static final String ACTION_DEVICE_SELECTED = "com.mediatek.bluetooth.sharegateway.action.DEVICE_SELECTED";
    public static final String ACTION_SEND = "com.mediatek.bluetooth.sharegateway.action.SEND";
    private static final String ACTION_SEND_BIP_FILES = "com.mediatek.bluetooth.sharegateway.action.ACTION_SEND_BIP_FILES";
    public static final String ACTION_SETTINGS = "com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS";
    public static final ParcelUuid BIP_PROFILE_UUIDS[];
    private static final int BLUETOOTH_DEVICE_REQUEST = 1;
    public static final String EXTRA_DEVICE_ADDRESS = "android.bluetooth.device.extra.DEVICE";
    private static final String KEY_INTENT = "intent";
    private static final String TAG = "BluetoothShareGatewayActivity";
    private static BluetoothAdapter sAdapter;
    private static boolean sBip;
    private static Intent sIntent;
    private static boolean sReentry = false;
    private static String sType;


    private void profileDispatcher(BluetoothDevice bluetoothdevice)
    {
        sIntent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        bluetoothdevice.getUuids();
        Xlog.v("BluetoothShareGatewayActivity", "OPP is supported");
        sIntent.setClassName("com.mediatek.bluetooth", "com.mediatek.bluetooth.opp.mmi.OppClientActivity");
        startActivity(sIntent);
    }

    private void startDevicePicker()
    {
        Intent intent = new Intent("com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS");
        Bundle bundle = new Bundle();
        bundle.putBoolean("BipFlag", sBip);
        bundle.putString("Type", sType);
        bundle.putParcelable("Intent", sIntent);
        intent.putExtras(bundle);
        sendBroadcast(intent);
        Xlog.v("BluetoothShareGatewayActivity", "Start Device Picker!");
        sReentry = true;
        Intent intent1 = new Intent("android.bluetooth.devicepicker.action.LAUNCH");
        intent1.setFlags(0x800000);
        intent1.putExtra("android.bluetooth.devicepicker.extra.NEED_AUTH", false);
        intent1.putExtra("android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE", "com.mediatek.bluetooth");
        intent1.putExtra("android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS", com/mediatek/bluetooth/BluetoothShareGatewayReceiver.getName());
        intent1.putExtra("android.bluetooth.devicepicker.extra.FILTER_TYPE", 2);
        startActivity(intent1);
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            super.onActivityResult(i, j, intent);
            if (i == 1)
            {
                sReentry = false;
                if (-1 != j)
                    break label0;
                startDevicePicker();
            }
            return;
        }
        finish();
    }

    public void onBackPressed()
    {
        if (isResumed())
            super.onBackPressed();
    }

    public void onCreate(Bundle bundle)
    {
        Intent intent;
        String s;
label0:
        {
            super.onCreate(bundle);
            Log.v("BluetoothShareGatewayActivity", "onCreate......");
            sReentry = false;
            intent = getIntent();
            s = intent.getAction();
            Uri uri = (Uri)intent.getParcelableExtra("android.intent.extra.STREAM");
            if (uri == null)
            {
                Xlog.e("BluetoothShareGatewayActivity", "uri is null");
            } else
            {
                Xlog.v("BluetoothShareGatewayActivity", (new StringBuilder()).append("uri = ").append(uri.toString()).toString());
                sBip = false;
                if ("content".equals(uri.getScheme()) && "media".equals(uri.getAuthority()))
                    sBip = true;
            }
            ArrayList arraylist = intent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            if (arraylist == null)
            {
                Xlog.e("BluetoothShareGatewayActivity", "uris is null");
                break label0;
            }
            sBip = false;
            Iterator iterator = arraylist.iterator();
            do
            {
                if (!iterator.hasNext())
                    break label0;
                Uri uri1 = (Uri)iterator.next();
                if (uri1 == null)
                {
                    Xlog.e("BluetoothShareGatewayActivity", "uri is null in Uris arraylist");
                    finish();
                    return;
                }
                Xlog.v("BluetoothShareGatewayActivity", (new StringBuilder()).append("uri = ").append(uri1.toString()).toString());
                if (!"content".equals(uri1.getScheme()))
                    break;
                if ("media".equals(uri1.getAuthority()))
                {
                    sBip = true;
                } else
                {
                    sBip = false;
                    break label0;
                }
            } while (true);
            sBip = false;
        }
label1:
        {
label2:
            {
label3:
                {
                    if ("android.intent.action.SEND".equals(s) || "android.intent.action.SEND_MULTIPLE".equals(s) || "android.btopp.intent.action.HANDOVER_SEND".equals(s) || "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE".equals(s))
                        break label1;
                    if (!"com.mediatek.bluetooth.sharegateway.action.DEVICE_SELECTED".equals(s))
                        break label2;
                    Xlog.v("BluetoothShareGatewayActivity", "return from device picker");
                    if (sIntent == null)
                    {
                        if (bundle == null)
                            break label3;
                        sIntent = (Intent)bundle.getParcelable("intent");
                        sType = sIntent.getType();
                    }
                    BluetoothDevice bluetoothdevice1 = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    Xlog.v("BluetoothShareGatewayActivity", (new StringBuilder()).append("Received BT device selected intent, bt device: ").append(bluetoothdevice1).toString());
                    if (bluetoothdevice1 == null)
                        Xlog.e("BluetoothShareGatewayActivity", "remote device is null");
                    else
                        profileDispatcher(bluetoothdevice1);
                    finish();
                    return;
                }
                finish();
                return;
            }
            Xlog.e("BluetoothShareGatewayActivity", (new StringBuilder()).append("unsupported action: ").append(s).toString());
            finish();
            return;
        }
        if ("android.btopp.intent.action.HANDOVER_SEND".equals(s) || "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE".equals(s))
            sBip = false;
        sType = intent.getType();
        Xlog.v("BluetoothShareGatewayActivity", (new StringBuilder()).append("sType = ").append(sType).toString());
        sIntent = intent;
        sAdapter = BluetoothAdapter.getDefaultAdapter();
        if (sAdapter == null)
        {
            Xlog.e("BluetoothShareGatewayActivity", "bluetooth is not started! ");
            finish();
            return;
        }
        if (sAdapter.isEnabled())
        {
            Xlog.v("BluetoothShareGatewayActivity", "bluetooth is available");
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            Xlog.v("BluetoothShareGatewayActivity", (new StringBuilder()).append("Received BT device selected intent, bt device: ").append(bluetoothdevice).toString());
            if (bluetoothdevice == null)
            {
                Xlog.i("BluetoothShareGatewayActivity", "remote device is null");
                startDevicePicker();
                return;
            } else
            {
                profileDispatcher(bluetoothdevice);
                finish();
                return;
            }
        } else
        {
            Xlog.w("BluetoothShareGatewayActivity", "bluetooth is not available! ");
            Xlog.v("BluetoothShareGatewayActivity", "turning on bluetooth......");
            startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 1);
            return;
        }
    }

    public void onDestroy()
    {
        Xlog.v("BluetoothShareGatewayActivity", "onDestroy......");
        super.onDestroy();
    }

    public void onPause()
    {
        Xlog.v("BluetoothShareGatewayActivity", "onPause......");
        super.onPause();
    }

    public void onResume()
    {
        Xlog.v("BluetoothShareGatewayActivity", "onResume......");
        super.onResume();
        if (sReentry)
        {
            Xlog.v("BluetoothShareGatewayActivity", "onResume forget......");
            finish();
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("intent", sIntent);
    }

    public void onStart()
    {
        Xlog.v("BluetoothShareGatewayActivity", "onStart......");
        super.onStart();
    }

    public void onStop()
    {
        Xlog.v("BluetoothShareGatewayActivity", "onStop......");
        super.onStop();
    }

    static 
    {
        ParcelUuid aparceluuid[] = new ParcelUuid[1];
        aparceluuid[0] = BluetoothUuidEx.BipResponder;
        BIP_PROFILE_UUIDS = aparceluuid;
    }
}
