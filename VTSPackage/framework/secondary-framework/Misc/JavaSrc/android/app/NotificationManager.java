// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.net.Uri;
import android.os.*;
import android.util.Log;

// Referenced classes of package android.app:
//            INotificationManager, Notification

public class NotificationManager
{

    private static String TAG = "NotificationManager";
    private static boolean localLOGV = false;
    private static INotificationManager sService;
    private Context mContext;

    NotificationManager(Context context, Handler handler)
    {
        mContext = context;
    }

    public static NotificationManager from(Context context)
    {
        return (NotificationManager)context.getSystemService("notification");
    }

    public static INotificationManager getService()
    {
        if (sService != null)
        {
            return sService;
        } else
        {
            sService = INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
            return sService;
        }
    }

    public void cancel(int i)
    {
        cancel(null, i);
    }

    public void cancel(String s, int i)
    {
        INotificationManager inotificationmanager = getService();
        String s1 = mContext.getPackageName();
        if (localLOGV)
            Log.v(TAG, (new StringBuilder()).append(s1).append(": cancel(").append(i).append(")").toString());
        try
        {
            inotificationmanager.cancelNotificationWithTag(s1, s, i, UserHandle.myUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void cancelAll()
    {
        INotificationManager inotificationmanager = getService();
        String s = mContext.getPackageName();
        if (localLOGV)
            Log.v(TAG, (new StringBuilder()).append(s).append(": cancelAll()").toString());
        try
        {
            inotificationmanager.cancelAllNotifications(s, UserHandle.myUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void cancelAsUser(String s, int i, UserHandle userhandle)
    {
        INotificationManager inotificationmanager = getService();
        String s1 = mContext.getPackageName();
        if (localLOGV)
            Log.v(TAG, (new StringBuilder()).append(s1).append(": cancel(").append(i).append(")").toString());
        try
        {
            inotificationmanager.cancelNotificationWithTag(s1, s, i, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void notify(int i, Notification notification)
    {
        notify(null, i, notification);
    }

    public void notify(String s, int i, Notification notification)
    {
        int ai[] = new int[1];
        INotificationManager inotificationmanager = getService();
        String s1 = mContext.getPackageName();
        if (notification.sound != null)
            notification.sound = notification.sound.getCanonicalUri();
        if (localLOGV)
            Log.v(TAG, (new StringBuilder()).append(s1).append(": notify(").append(i).append(", ").append(notification).append(")").toString());
        try
        {
            inotificationmanager.enqueueNotificationWithTag(s1, s, i, notification, ai, UserHandle.myUserId());
            if (i != ai[0])
                Log.w(TAG, (new StringBuilder()).append("notify: id corrupted: sent ").append(i).append(", got back ").append(ai[0]).toString());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void notifyAsUser(String s, int i, Notification notification, UserHandle userhandle)
    {
        int ai[] = new int[1];
        INotificationManager inotificationmanager = getService();
        String s1 = mContext.getPackageName();
        if (notification.sound != null)
            notification.sound = notification.sound.getCanonicalUri();
        if (localLOGV)
            Log.v(TAG, (new StringBuilder()).append(s1).append(": notify(").append(i).append(", ").append(notification).append(")").toString());
        try
        {
            inotificationmanager.enqueueNotificationWithTag(s1, s, i, notification, ai, userhandle.getIdentifier());
            if (i != ai[0])
                Log.w(TAG, (new StringBuilder()).append("notify: id corrupted: sent ").append(i).append(", got back ").append(ai[0]).toString());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

}
