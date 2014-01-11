// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.RemoteException;

// Referenced classes of package android.app:
//            IAlarmManager, PendingIntent

public class AlarmManager
{

    public static final int ELAPSED_REALTIME = 3;
    public static final int ELAPSED_REALTIME_WAKEUP = 2;
    public static final long INTERVAL_DAY = 0x5265c00L;
    public static final long INTERVAL_FIFTEEN_MINUTES = 0xdbba0L;
    public static final long INTERVAL_HALF_DAY = 0x2932e00L;
    public static final long INTERVAL_HALF_HOUR = 0x1b7740L;
    public static final long INTERVAL_HOUR = 0x36ee80L;
    public static final int RTC = 1;
    public static final int RTC_WAKEUP;
    private final IAlarmManager mService;

    AlarmManager(IAlarmManager ialarmmanager)
    {
        mService = ialarmmanager;
    }

    public boolean bootFromPoweroffAlarm()
    {
        boolean flag;
        try
        {
            flag = mService.bootFromPoweroffAlarm();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public void cancel(PendingIntent pendingintent)
    {
        try
        {
            mService.remove(pendingintent);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void cancelPoweroffAlarm(String s)
    {
        try
        {
            mService.cancelPoweroffAlarm(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void set(int i, long l, PendingIntent pendingintent)
    {
        try
        {
            mService.set(i, l, pendingintent);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setInexactRepeating(int i, long l, long l1, PendingIntent pendingintent)
    {
        try
        {
            mService.setInexactRepeating(i, l, l1, pendingintent);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setRepeating(int i, long l, long l1, PendingIntent pendingintent)
    {
        try
        {
            mService.setRepeating(i, l, l1, pendingintent);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setTime(long l)
    {
        try
        {
            mService.setTime(l);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setTimeZone(String s)
    {
        try
        {
            mService.setTimeZone(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }
}
