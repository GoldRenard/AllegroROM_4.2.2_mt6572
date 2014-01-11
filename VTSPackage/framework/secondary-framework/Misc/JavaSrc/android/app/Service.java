// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;

// Referenced classes of package android.app:
//            IActivityManager, Application, ActivityThread, Notification

public abstract class Service extends ContextWrapper
    implements ComponentCallbacks2
{

    public static final int START_CONTINUATION_MASK = 15;
    public static final int START_FLAG_REDELIVERY = 1;
    public static final int START_FLAG_RETRY = 2;
    public static final int START_NOT_STICKY = 2;
    public static final int START_REDELIVER_INTENT = 3;
    public static final int START_STICKY = 1;
    public static final int START_STICKY_COMPATIBILITY = 0;
    public static final int START_TASK_REMOVED_COMPLETE = 1000;
    private static final String TAG = "Service";
    private IActivityManager mActivityManager;
    private Application mApplication;
    private String mClassName;
    private boolean mStartCompatibility;
    private ActivityThread mThread;
    private IBinder mToken;

    public Service()
    {
        super(null);
        mThread = null;
        mClassName = null;
        mToken = null;
        mApplication = null;
        mActivityManager = null;
        mStartCompatibility = false;
    }

    public final void attach(Context context, ActivityThread activitythread, String s, IBinder ibinder, Application application, Object obj)
    {
        attachBaseContext(context);
        mThread = activitythread;
        mClassName = s;
        mToken = ibinder;
        mApplication = application;
        mActivityManager = (IActivityManager)obj;
        boolean flag;
        if (getApplicationInfo().targetSdkVersion < 5)
            flag = true;
        else
            flag = false;
        mStartCompatibility = flag;
    }

    protected void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.println("nothing to dump");
    }

    public final Application getApplication()
    {
        return mApplication;
    }

    final String getClassName()
    {
        return mClassName;
    }

    public abstract IBinder onBind(Intent intent);

    public void onConfigurationChanged(Configuration configuration)
    {
    }

    public void onCreate()
    {
    }

    public void onDestroy()
    {
    }

    public void onLowMemory()
    {
    }

    public void onRebind(Intent intent)
    {
    }

    public void onStart(Intent intent, int i)
    {
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        onStart(intent, j);
        return !mStartCompatibility ? 1 : 0;
    }

    public void onTaskRemoved(Intent intent)
    {
    }

    public void onTrimMemory(int i)
    {
    }

    public boolean onUnbind(Intent intent)
    {
        return false;
    }

    public final void setForeground(boolean flag)
    {
        Log.w("Service", (new StringBuilder()).append("setForeground: ignoring old API call on ").append(getClass().getName()).toString());
    }

    public final void startForeground(int i, Notification notification)
    {
        try
        {
            mActivityManager.setServiceForeground(new ComponentName(this, mClassName), mToken, i, notification, true);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public final void stopForeground(boolean flag)
    {
        try
        {
            mActivityManager.setServiceForeground(new ComponentName(this, mClassName), mToken, 0, null, flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public final void stopSelf()
    {
        stopSelf(-1);
    }

    public final void stopSelf(int i)
    {
        if (mActivityManager == null)
            return;
        try
        {
            mActivityManager.stopServiceToken(new ComponentName(this, mClassName), mToken, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public final boolean stopSelfResult(int i)
    {
        if (mActivityManager == null)
            return false;
        boolean flag;
        try
        {
            flag = mActivityManager.stopServiceToken(new ComponentName(this, mClassName), mToken, i);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }
}
