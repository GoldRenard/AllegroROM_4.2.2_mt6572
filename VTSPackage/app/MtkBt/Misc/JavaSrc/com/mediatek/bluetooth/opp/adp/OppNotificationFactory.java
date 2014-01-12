// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.format.Formatter;
import com.mediatek.bluetooth.opp.mmi.OppCancelActivity;
import com.mediatek.bluetooth.opp.mmi.OppLog;
import com.mediatek.bluetooth.share.BluetoothShareTask;

public class OppNotificationFactory
{

    public static final int NID_TRANSFER_MGMT = 0xf423f;
    private static final Intent NULL_INTENT = new Intent();


    private static PendingIntent createCancelIntent(Context context, int i)
    {
        Intent intent = new Intent(context, com/mediatek/bluetooth/opp/mmi/OppCancelActivity);
        intent.setData(Uri.withAppendedPath(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI, Integer.toString(i)));
        return PendingIntent.getActivity(context, 0, intent, 0);
    }

    private static PendingIntent createCancelingIntent(Context context, int i)
    {
        Intent intent = new Intent("com.mediatek.bluetooth.receiver.action.SHOW_TOAST");
        intent.putExtra("com.mediatek.bluetooth.receiver.extra.TEXT", context.getString(0x7f050031));
        return PendingIntent.getBroadcast(context, i, intent, 0x8000000);
    }

    public static Notification getOppIncomingNotification(Context context, BluetoothShareTask bluetoothsharetask)
    {
        Intent intent = new Intent("com.mediatek.bluetooth.opp.action.PUSH_REQUEST");
        intent.setFlags(0x10000000);
        intent.putExtra("com.mediatek.bluetooth.opp.extra.PEER_NAME", bluetoothsharetask.getPeerName());
        intent.putExtra("com.mediatek.bluetooth.opp.extra.OBJECT_NAME", bluetoothsharetask.getObjectName());
        intent.putExtra("com.mediatek.bluetooth.opp.extra.TOTAL_BYTES", bluetoothsharetask.getTotalBytes());
        intent.putExtra("com.mediatek.bluetooth.opp.extra.TASK_ID", bluetoothsharetask.getId());
        int i = bluetoothsharetask.getId();
        long l = bluetoothsharetask.getCreationDate();
        String s = context.getString(0x7f050026);
        Object aobj[] = new Object[1];
        aobj[0] = bluetoothsharetask.getPeerName();
        Notification notification = getSimpleNotification(i, 0x7f020001, l, s, context.getString(0x7f050027, aobj), context.getString(0x7f050028), PendingIntent.getActivity(context, bluetoothsharetask.getId(), intent, 0x40000000), context);
        notification.flags = 2 | notification.flags;
        notification.defaults = 3;
        return notification;
    }

    public static Notification getOppOngoingNotification(Context context, BluetoothShareTask bluetoothsharetask)
    {
        com.mediatek.bluetooth.share.BluetoothShareTask.Direction direction;
label0:
        {
            direction = bluetoothsharetask.getDirection();
            int i;
            int j;
            int k;
            if (direction == com.mediatek.bluetooth.share.BluetoothShareTask.Direction.in)
            {
                i = 0x7f020001;
                j = 0x7f050029;
                k = 0x7f05002a;
            } else
            {
                if (direction != com.mediatek.bluetooth.share.BluetoothShareTask.Direction.out)
                    break label0;
                i = 0x7f020002;
                j = 0x7f05002b;
                k = 0x7f05002c;
            }
            long l = bluetoothsharetask.getTotalBytes();
            int i1;
            if (l == 0L)
                i1 = 0;
            else
                i1 = (int)((100L * bluetoothsharetask.getDoneBytes()) / l);
            int j1 = bluetoothsharetask.getId();
            long l1 = bluetoothsharetask.getCreationDate();
            String s = context.getString(j);
            String s1 = (new StringBuilder()).append(i1).append("%").toString();
            Object aobj[] = new Object[2];
            aobj[0] = bluetoothsharetask.getObjectName();
            aobj[1] = Formatter.formatFileSize(context, l);
            return getProgressNotification(j1, i, l1, s, s1, context.getString(k, aobj), 100, i1, createCancelIntent(context, bluetoothsharetask.getId()), context);
        }
        OppLog.e((new StringBuilder()).append("unsupport feature for getOppOngoingNotification():").append(direction.toString()).toString());
        throw new IllegalArgumentException((new StringBuilder()).append("unsupported feature: ").append(direction.toString()).toString());
    }

    protected static Notification getProgressNotification(int i, int j, long l, String s, String s1, String s2, int k, 
            int i1, PendingIntent pendingintent, Context context)
    {
        android.app.Notification.Builder builder = new android.app.Notification.Builder(context);
        builder.setSmallIcon(j);
        builder.setWhen(l);
        builder.setTicker(s);
        builder.setContentInfo(s1);
        builder.setContentTitle(s2);
        builder.setContentIntent(pendingintent);
        boolean flag;
        if (k < 1)
            flag = true;
        else
            flag = false;
        builder.setProgress(k, i1, flag);
        builder.setOngoing(true);
        return builder.getNotification();
    }

    protected static Notification getSimpleNotification(int i, int j, long l, String s, String s1, String s2, PendingIntent pendingintent, 
            Context context)
    {
        android.app.Notification.Builder builder = new android.app.Notification.Builder(context);
        builder.setSmallIcon(j);
        builder.setWhen(l);
        builder.setTicker(s);
        builder.setContentTitle(s1);
        builder.setContentText(s2);
        builder.setContentIntent(pendingintent);
        builder.setOngoing(true);
        return builder.getNotification();
    }

}
