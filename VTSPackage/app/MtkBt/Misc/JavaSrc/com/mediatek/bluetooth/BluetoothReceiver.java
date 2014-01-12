// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.net.Uri;
import android.widget.Toast;
import com.mediatek.bluetooth.util.BtLog;
import java.util.HashSet;

public class BluetoothReceiver extends BroadcastReceiver
{

    public static final String ACTION_SHOW_TOAST = "com.mediatek.bluetooth.receiver.action.SHOW_TOAST";
    private static final String AVRCP_SERVICE_CLASS = "com.mediatek.bluetooth.avrcp.BluetoothAvrcpService";
    private static final String BIP_SERVICE_CLASS = "com.mediatek.bluetooth.bip.BipService";
    private static final String DUN_SERVICE_CLASS = "com.mediatek.bluetooth.dun.BluetoothDunService";
    public static final String EXTRA_TEXT = "com.mediatek.bluetooth.receiver.extra.TEXT";
    private static final String FTP_SERVICE_CLASS = "com.mediatek.bluetooth.ftp.BluetoothFtpService";
    private static final String HID_SERVICE_CLASS = "com.mediatek.bluetooth.hid.BluetoothHidService";
    private static final String MAP_SERVICE_CLASS = "com.mediatek.bluetooth.map.BluetoothMapServerService";
    private static final String OPP_SERVICE_CLASS = "com.mediatek.bluetooth.opp.adp.OppService";
    private static final String PAN_SERVICE_CLASS = "com.mediatek.bluetooth.pan.BluetoothPanService";
    private static final String PBAP_SERVICE_CLASS = "com.mediatek.bluetooth.pbap.BluetoothPbapService";
    public static HashSet sUnmountingStorageSet = new HashSet(2);


    public static boolean isPathMounted(String s)
    {
        HashSet hashset = sUnmountingStorageSet;
        hashset;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if (!sUnmountingStorageSet.contains(s))
            flag = true;
        else
            flag = false;
        hashset;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        hashset;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void startProfileServices(Context context)
    {
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter != null && bluetoothadapter.isEnabled())
            startService(context, "com.mediatek.bluetooth.ftp.BluetoothFtpService");
        if (bluetoothadapter != null && bluetoothadapter.isEnabled())
            startService(context, "com.mediatek.bluetooth.pbap.BluetoothPbapService");
        if (bluetoothadapter != null && bluetoothadapter.isEnabled())
            startService(context, "com.mediatek.bluetooth.hid.BluetoothHidService");
    }

    private void startService(Context context, String s)
    {
        try
        {
            context.startService(new Intent(context, Class.forName(s)));
            return;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            BtLog.e((new StringBuilder()).append("start service for class[").append(s).append("] fail:").toString(), classnotfoundexception);
        }
    }

    private void startService(Context context, String s, String s1, String s2)
    {
        try
        {
            context.startService((new Intent(context, Class.forName(s))).putExtra(s1, s2));
            return;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            BtLog.e((new StringBuilder()).append("start service for class[").append(s).append("] fail:").toString(), classnotfoundexception);
        }
    }

    private void stopProfileServices(Context context)
    {
        stopService(context, "com.mediatek.bluetooth.pbap.BluetoothPbapService");
        stopService(context, "com.mediatek.bluetooth.opp.adp.OppService");
        startService(context, "com.mediatek.bluetooth.bip.BipService", "action", "com.mediatek.bluetooth.bipiservice.action.BIP_DISABLE");
        stopService(context, "com.mediatek.bluetooth.hid.BluetoothHidService");
        stopService(context, "com.mediatek.bluetooth.dun.BluetoothDunService");
        stopService(context, "com.mediatek.bluetooth.pan.BluetoothPanService");
    }

    private void stopService(Context context, String s)
    {
        try
        {
            context.stopService(new Intent(context, Class.forName(s)));
            return;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            BtLog.e((new StringBuilder()).append("stop service for class[").append(s).append("] fail:").toString(), classnotfoundexception);
        }
    }

    public void onReceive(Context context, Intent intent)
    {
        String s;
        s = intent.getAction();
        BtLog.i((new StringBuilder()).append("BluetoothReceiver receive action:").append(s).toString());
        if (!s.equals("android.bluetooth.adapter.action.STATE_CHANGED")) goto _L2; else goto _L1
_L1:
        int i = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
        if (i != 12) goto _L4; else goto _L3
_L3:
        startProfileServices(context);
_L6:
        return;
_L4:
        if (i == 13)
        {
            stopProfileServices(context);
            return;
        }
        continue; /* Loop/switch isn't completed */
_L2:
        if (s.equals("android.intent.action.BOOT_COMPLETED"))
        {
            startProfileServices(context);
            return;
        }
        if (s.equals("android.bluetooth.profilemanager.action.DISABLE_PROFILES"))
        {
            BtLog.i("BluetoothProfileManaher disable profile");
            return;
        }
        if (!"com.mediatek.bluetooth.receiver.action.SHOW_TOAST".equals(s))
            break; /* Loop/switch isn't completed */
        String s1 = intent.getStringExtra("com.mediatek.bluetooth.receiver.extra.TEXT");
        if (s1 != null)
        {
            Toast.makeText(context, s1, 0).show();
            return;
        }
        if (true) goto _L6; else goto _L5
_L5:
        Uri uri1;
        if (!"android.intent.action.MEDIA_EJECT".equals(s))
            continue; /* Loop/switch isn't completed */
        uri1 = intent.getData();
        if (uri1 == null) goto _L6; else goto _L7
_L7:
        BtLog.d((new StringBuilder()).append("BluetoothReceiver: add un-mounting path[").append(uri1.getPath()).append("] for ").append(s).toString());
        synchronized (sUnmountingStorageSet)
        {
            sUnmountingStorageSet.add(uri1.getPath());
        }
        return;
        exception1;
        hashset1;
        JVM INSTR monitorexit ;
        throw exception1;
        if (!"android.intent.action.MEDIA_UNMOUNTED".equals(s) && !"android.intent.action.MEDIA_MOUNTED".equals(s)) goto _L6; else goto _L8
_L8:
        Uri uri = intent.getData();
        if (uri == null) goto _L6; else goto _L9
_L9:
        BtLog.d((new StringBuilder()).append("BluetoothReceiver: del un-mounting path[").append(uri.getPath()).append("] for ").append(s).toString());
        synchronized (sUnmountingStorageSet)
        {
            sUnmountingStorageSet.remove(uri.getPath());
        }
        return;
        exception;
        hashset;
        JVM INSTR monitorexit ;
        throw exception;
    }

}
