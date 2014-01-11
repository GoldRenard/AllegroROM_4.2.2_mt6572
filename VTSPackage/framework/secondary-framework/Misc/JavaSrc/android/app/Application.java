// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.res.Configuration;
import android.os.Bundle;
import java.util.ArrayList;

// Referenced classes of package android.app:
//            ContextImpl, LoadedApk, Activity

public class Application extends ContextWrapper
    implements ComponentCallbacks2
{
    public static interface ActivityLifecycleCallbacks
    {

        public abstract void onActivityCreated(Activity activity, Bundle bundle);

        public abstract void onActivityDestroyed(Activity activity);

        public abstract void onActivityPaused(Activity activity);

        public abstract void onActivityResumed(Activity activity);

        public abstract void onActivitySaveInstanceState(Activity activity, Bundle bundle);

        public abstract void onActivityStarted(Activity activity);

        public abstract void onActivityStopped(Activity activity);
    }


    private ArrayList mActivityLifecycleCallbacks;
    private ArrayList mComponentCallbacks;
    public LoadedApk mLoadedApk;

    public Application()
    {
        super(null);
        mComponentCallbacks = new ArrayList();
        mActivityLifecycleCallbacks = new ArrayList();
    }

    private Object[] collectActivityLifecycleCallbacks()
    {
        ArrayList arraylist = mActivityLifecycleCallbacks;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mActivityLifecycleCallbacks.size();
        Object aobj[];
        aobj = null;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_31;
        aobj = mActivityLifecycleCallbacks.toArray();
        arraylist;
        JVM INSTR monitorexit ;
        return aobj;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private Object[] collectComponentCallbacks()
    {
        ArrayList arraylist = mComponentCallbacks;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mComponentCallbacks.size();
        Object aobj[];
        aobj = null;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_31;
        aobj = mComponentCallbacks.toArray();
        arraylist;
        JVM INSTR monitorexit ;
        return aobj;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    final void attach(Context context)
    {
        attachBaseContext(context);
        mLoadedApk = ContextImpl.getImpl(context).mPackageInfo;
    }

    void dispatchActivityCreated(Activity activity, Bundle bundle)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityCreated(activity, bundle);

        }
    }

    void dispatchActivityDestroyed(Activity activity)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityDestroyed(activity);

        }
    }

    void dispatchActivityPaused(Activity activity)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityPaused(activity);

        }
    }

    void dispatchActivityResumed(Activity activity)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityResumed(activity);

        }
    }

    void dispatchActivitySaveInstanceState(Activity activity, Bundle bundle)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivitySaveInstanceState(activity, bundle);

        }
    }

    void dispatchActivityStarted(Activity activity)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityStarted(activity);

        }
    }

    void dispatchActivityStopped(Activity activity)
    {
        Object aobj[] = collectActivityLifecycleCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ActivityLifecycleCallbacks)aobj[i]).onActivityStopped(activity);

        }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        Object aobj[] = collectComponentCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ComponentCallbacks)aobj[i]).onConfigurationChanged(configuration);

        }
    }

    public void onCreate()
    {
    }

    public void onLowMemory()
    {
        Object aobj[] = collectComponentCallbacks();
        if (aobj != null)
        {
            for (int i = 0; i < aobj.length; i++)
                ((ComponentCallbacks)aobj[i]).onLowMemory();

        }
    }

    public void onTerminate()
    {
    }

    public void onTrimMemory(int i)
    {
        Object aobj[] = collectComponentCallbacks();
        if (aobj != null)
        {
            for (int j = 0; j < aobj.length; j++)
            {
                Object obj = aobj[j];
                if (obj instanceof ComponentCallbacks2)
                    ((ComponentCallbacks2)obj).onTrimMemory(i);
            }

        }
    }

    public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks activitylifecyclecallbacks)
    {
        synchronized (mActivityLifecycleCallbacks)
        {
            mActivityLifecycleCallbacks.add(activitylifecyclecallbacks);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void registerComponentCallbacks(ComponentCallbacks componentcallbacks)
    {
        synchronized (mComponentCallbacks)
        {
            mComponentCallbacks.add(componentcallbacks);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void unregisterActivityLifecycleCallbacks(ActivityLifecycleCallbacks activitylifecyclecallbacks)
    {
        synchronized (mActivityLifecycleCallbacks)
        {
            mActivityLifecycleCallbacks.remove(activitylifecyclecallbacks);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void unregisterComponentCallbacks(ComponentCallbacks componentcallbacks)
    {
        synchronized (mComponentCallbacks)
        {
            mComponentCallbacks.remove(componentcallbacks);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }
}
