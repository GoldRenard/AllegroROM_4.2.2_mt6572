// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.app.*;
import android.content.*;
import android.os.RemoteException;
import android.os.UserHandle;
import com.mediatek.xlog.Xlog;

public class LocationController extends BroadcastReceiver
{

    private static final int GPS_NOTIFICATION_ID = 0x3d8d7;
    private static final String TAG = "StatusBar.LocationController";
    private Context mContext;
    private INotificationManager mNotificationService;
    private boolean mPrivacy;

    public LocationController(Context context)
    {
        mPrivacy = false;
        mContext = context;
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.location.GPS_ENABLED_CHANGE");
        intentfilter.addAction("android.location.GPS_FIX_CHANGE");
        intentfilter.addAction("android.location.PRIVACY_OVERWRITE");
        context.registerReceiver(this, intentfilter);
        NotificationManager _tmp = (NotificationManager)context.getSystemService("notification");
        mNotificationService = NotificationManager.getService();
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        boolean flag = intent.getBooleanExtra("enabled", false);
        int i;
        int j;
        boolean flag1;
        if (s.equals("android.location.GPS_FIX_CHANGE") && flag)
        {
            i = 0x108054e;
            j = 0x7f0b00a9;
            flag1 = true;
        } else
        if (s.equals("android.location.GPS_ENABLED_CHANGE") && !flag)
        {
            i = 0;
            j = 0;
            flag1 = false;
        } else
        {
            if (s.equals("android.location.PRIVACY_OVERWRITE"))
            {
                Xlog.d("StatusBar.LocationController", "[MtkAgpsManagerService] recv android.location.PRIVACY_OVERWRITE");
                mPrivacy = true;
                return;
            }
            if (mPrivacy)
            {
                Xlog.d("StatusBar.LocationController", "[MtkAgpsManagerService] This session is privacy overwrite, don't show the GPS icon in status bar");
                mPrivacy = false;
                return;
            }
            i = 0x7f0201f8;
            j = 0x7f0b00a8;
            flag1 = true;
        }
        if (flag1)
            try
            {
                Intent intent1 = new Intent("android.settings.LOCATION_SOURCE_SETTINGS");
                intent1.setFlags(0x10000000);
                PendingIntent pendingintent = PendingIntent.getActivityAsUser(context, 0, intent1, 0, null, UserHandle.CURRENT);
                String s1 = mContext.getText(j).toString();
                Notification notification = (new android.app.Notification.Builder(mContext)).setSmallIcon(i).setContentTitle(s1).setOngoing(true).setContentIntent(pendingintent).getNotification();
                notification.tickerView = null;
                notification.tickerText = null;
                notification.priority = 1;
                int ai[] = new int[1];
                mNotificationService.enqueueNotificationWithTag(mContext.getPackageName(), null, 0x3d8d7, notification, ai, -1);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        mNotificationService.cancelNotificationWithTag(mContext.getPackageName(), null, 0x3d8d7, -1);
        return;
    }
}
