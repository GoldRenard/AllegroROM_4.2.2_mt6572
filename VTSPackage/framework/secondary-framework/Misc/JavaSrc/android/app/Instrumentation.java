// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.hardware.input.InputManager;
import android.os.*;
import android.util.AndroidRuntimeException;
import android.util.Log;
import android.view.*;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.app:
//            Application, ActivityThread, Activity, IApplicationThread, 
//            ActivityManagerNative, IActivityManager, Fragment, IInstrumentationWatcher

public class Instrumentation
{
    class _cls1ContextMenuRunnable
        implements Runnable
    {

        private final Activity activity;
        private final int flags;
        private final int identifier;
        boolean returnValue;
        final Instrumentation this$0;

        public void run()
        {
            returnValue = activity.getWindow().performContextMenuIdentifierAction(identifier, flags);
        }

        public _cls1ContextMenuRunnable(Activity activity1, int i, int j)
        {
            this$0 = Instrumentation.this;
            super();
            activity = activity1;
            identifier = i;
            flags = j;
        }
    }

    class _cls1MenuRunnable
        implements Runnable
    {

        private final Activity activity;
        private final int flags;
        private final int identifier;
        boolean returnValue;
        final Instrumentation this$0;

        public void run()
        {
            returnValue = activity.getWindow().performPanelIdentifierAction(0, identifier, flags);
        }

        public _cls1MenuRunnable(Activity activity1, int i, int j)
        {
            this$0 = Instrumentation.this;
            super();
            activity = activity1;
            identifier = i;
            flags = j;
        }
    }

    private final class ActivityGoing
        implements android.os.MessageQueue.IdleHandler
    {

        private final ActivityWaiter mWaiter;
        final Instrumentation this$0;

        public final boolean queueIdle()
        {
            synchronized (mSync)
            {
                mWaitingActivities.remove(mWaiter);
                mSync.notifyAll();
            }
            return false;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public ActivityGoing(ActivityWaiter activitywaiter)
        {
            this$0 = Instrumentation.this;
            super();
            mWaiter = activitywaiter;
        }
    }

    public static class ActivityMonitor
    {

        private final boolean mBlock;
        private final String mClass;
        int mHits;
        Activity mLastActivity;
        private final ActivityResult mResult;
        private final IntentFilter mWhich;

        public final IntentFilter getFilter()
        {
            return mWhich;
        }

        public final int getHits()
        {
            return mHits;
        }

        public final Activity getLastActivity()
        {
            return mLastActivity;
        }

        public final ActivityResult getResult()
        {
            return mResult;
        }

        public final boolean isBlocking()
        {
            return mBlock;
        }

        final boolean match(Context context, Activity activity, Intent intent)
        {
            this;
            JVM INSTR monitorenter ;
            if (mWhich == null || mWhich.match(context.getContentResolver(), intent, true, "Instrumentation") >= 0)
                break MISSING_BLOCK_LABEL_31;
            this;
            JVM INSTR monitorexit ;
            return false;
            if (mClass == null) goto _L2; else goto _L1
_L1:
            if (activity == null) goto _L4; else goto _L3
_L3:
            String s = activity.getClass().getName();
_L5:
            if (s == null)
                break MISSING_BLOCK_LABEL_68;
            if (mClass.equals(s))
                break; /* Loop/switch isn't completed */
            this;
            JVM INSTR monitorexit ;
            return false;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
_L4:
            ComponentName componentname = intent.getComponent();
            s = null;
            if (componentname == null)
                continue; /* Loop/switch isn't completed */
            s = intent.getComponent().getClassName();
            if (true) goto _L5; else goto _L2
_L2:
            if (activity == null)
                break MISSING_BLOCK_LABEL_118;
            mLastActivity = activity;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            return true;
        }

        public final Activity waitForActivity()
        {
            this;
            JVM INSTR monitorenter ;
_L2:
            Activity activity = mLastActivity;
            if (activity != null)
                break; /* Loop/switch isn't completed */
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception) { }
            if (true) goto _L2; else goto _L1
_L1:
            Activity activity1;
            activity1 = mLastActivity;
            mLastActivity = null;
            this;
            JVM INSTR monitorexit ;
            return activity1;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public final Activity waitForActivityWithTimeout(long l)
        {
            this;
            JVM INSTR monitorenter ;
            Activity activity = mLastActivity;
            if (activity != null)
                break MISSING_BLOCK_LABEL_18;
            Exception exception;
            Activity activity1;
            try
            {
                wait(l);
            }
            catch (InterruptedException interruptedexception) { }
            if (mLastActivity != null)
                break MISSING_BLOCK_LABEL_29;
            this;
            JVM INSTR monitorexit ;
            return null;
            activity1 = mLastActivity;
            mLastActivity = null;
            this;
            JVM INSTR monitorexit ;
            return activity1;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public ActivityMonitor(IntentFilter intentfilter, ActivityResult activityresult, boolean flag)
        {
            mHits = 0;
            mLastActivity = null;
            mWhich = intentfilter;
            mClass = null;
            mResult = activityresult;
            mBlock = flag;
        }

        public ActivityMonitor(String s, ActivityResult activityresult, boolean flag)
        {
            mHits = 0;
            mLastActivity = null;
            mWhich = null;
            mClass = s;
            mResult = activityresult;
            mBlock = flag;
        }
    }

    public static final class ActivityResult
    {

        private final int mResultCode;
        private final Intent mResultData;

        public int getResultCode()
        {
            return mResultCode;
        }

        public Intent getResultData()
        {
            return mResultData;
        }

        public ActivityResult(int i, Intent intent)
        {
            mResultCode = i;
            mResultData = intent;
        }
    }

    private static final class ActivityWaiter
    {

        public Activity activity;
        public final Intent intent;

        public ActivityWaiter(Intent intent1)
        {
            intent = intent1;
        }
    }

    private static final class EmptyRunnable
        implements Runnable
    {

        public void run()
        {
        }

        private EmptyRunnable()
        {
        }

    }

    private static final class Idler
        implements android.os.MessageQueue.IdleHandler
    {

        private final Runnable mCallback;
        private boolean mIdle;

        public final boolean queueIdle()
        {
            if (mCallback != null)
                mCallback.run();
            this;
            JVM INSTR monitorenter ;
            mIdle = true;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            return false;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void waitForIdle()
        {
            this;
            JVM INSTR monitorenter ;
_L2:
            boolean flag = mIdle;
            if (flag)
                break; /* Loop/switch isn't completed */
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception) { }
            if (true) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Idler(Runnable runnable)
        {
            mCallback = runnable;
            mIdle = false;
        }
    }

    private final class InstrumentationThread extends Thread
    {

        final Instrumentation this$0;

        public void run()
        {
            ActivityManagerNative.getDefault();
            try
            {
                Process.setThreadPriority(-8);
            }
            catch (RuntimeException runtimeexception)
            {
                Log.w("Instrumentation", (new StringBuilder()).append("Exception setting priority of instrumentation thread ").append(Process.myTid()).toString(), runtimeexception);
            }
            if (mAutomaticPerformanceSnapshots)
                startPerformanceSnapshot();
            onStart();
        }

        public InstrumentationThread(String s)
        {
            this$0 = Instrumentation.this;
            super(s);
        }
    }

    private static final class SyncRunnable
        implements Runnable
    {

        private boolean mComplete;
        private final Runnable mTarget;

        public void run()
        {
            mTarget.run();
            this;
            JVM INSTR monitorenter ;
            mComplete = true;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void waitForComplete()
        {
            this;
            JVM INSTR monitorenter ;
_L2:
            boolean flag = mComplete;
            if (flag)
                break; /* Loop/switch isn't completed */
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception) { }
            if (true) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SyncRunnable(Runnable runnable)
        {
            mTarget = runnable;
        }
    }


    public static final String REPORT_KEY_IDENTIFIER = "id";
    public static final String REPORT_KEY_STREAMRESULT = "stream";
    private static final String TAG = "Instrumentation";
    private List mActivityMonitors;
    private Context mAppContext;
    private boolean mAutomaticPerformanceSnapshots;
    private ComponentName mComponent;
    private Context mInstrContext;
    private MessageQueue mMessageQueue;
    private Bundle mPerfMetrics;
    private PerformanceCollector mPerformanceCollector;
    private Thread mRunner;
    private final Object mSync = new Object();
    private ActivityThread mThread;
    private List mWaitingActivities;
    private IInstrumentationWatcher mWatcher;

    public Instrumentation()
    {
        mThread = null;
        mMessageQueue = null;
        mAutomaticPerformanceSnapshots = false;
        mPerfMetrics = new Bundle();
    }

    private void addValue(String s, int i, Bundle bundle)
    {
        if (bundle.containsKey(s))
        {
            ArrayList arraylist1 = bundle.getIntegerArrayList(s);
            if (arraylist1 != null)
                arraylist1.add(Integer.valueOf(i));
            return;
        } else
        {
            ArrayList arraylist = new ArrayList();
            arraylist.add(Integer.valueOf(i));
            bundle.putIntegerArrayList(s, arraylist);
            return;
        }
    }

    static void checkStartActivityResult(int i, Object obj)
    {
        if (i >= 0)
            return;
        switch (i)
        {
        case -5: 
            throw new IllegalArgumentException("PendingIntent is not an activity");

        case -3: 
            throw new AndroidRuntimeException("FORWARD_RESULT_FLAG used while also requesting a result");

        case -4: 
            throw new SecurityException((new StringBuilder()).append("Not allowed to start activity ").append(obj).toString());

        case -2: 
        case -1: 
            if ((obj instanceof Intent) && ((Intent)obj).getComponent() != null)
                throw new ActivityNotFoundException((new StringBuilder()).append("Unable to find explicit activity class ").append(((Intent)obj).getComponent().toShortString()).append("; have you declared this activity in your AndroidManifest.xml?").toString());
            else
                throw new ActivityNotFoundException((new StringBuilder()).append("No Activity found to handle ").append(obj).toString());
        }
        throw new AndroidRuntimeException((new StringBuilder()).append("Unknown error code ").append(i).append(" when starting ").append(obj).toString());
    }

    public static Application newApplication(Class class1, Context context)
        throws InstantiationException, IllegalAccessException, ClassNotFoundException
    {
        Application application = (Application)class1.newInstance();
        application.attach(context);
        return application;
    }

    private final void validateNotAppThread()
    {
        if (ActivityThread.currentActivityThread() != null)
            throw new RuntimeException("This method can not be called from the main application thread");
        else
            return;
    }

    public ActivityMonitor addMonitor(IntentFilter intentfilter, ActivityResult activityresult, boolean flag)
    {
        ActivityMonitor activitymonitor = new ActivityMonitor(intentfilter, activityresult, flag);
        addMonitor(activitymonitor);
        return activitymonitor;
    }

    public ActivityMonitor addMonitor(String s, ActivityResult activityresult, boolean flag)
    {
        ActivityMonitor activitymonitor = new ActivityMonitor(s, activityresult, flag);
        addMonitor(activitymonitor);
        return activitymonitor;
    }

    public void addMonitor(ActivityMonitor activitymonitor)
    {
        synchronized (mSync)
        {
            if (mActivityMonitors == null)
                mActivityMonitors = new ArrayList();
            mActivityMonitors.add(activitymonitor);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void callActivityOnCreate(Activity activity, Bundle bundle)
    {
        if (mWaitingActivities == null) goto _L2; else goto _L1
_L1:
        Object obj1 = mSync;
        obj1;
        JVM INSTR monitorenter ;
        int k = mWaitingActivities.size();
        int l = 0;
_L9:
        if (l >= k) goto _L4; else goto _L3
_L3:
        ActivityWaiter activitywaiter = (ActivityWaiter)mWaitingActivities.get(l);
        if (activitywaiter.intent.filterEquals(activity.getIntent()))
        {
            activitywaiter.activity = activity;
            mMessageQueue.addIdleHandler(new ActivityGoing(activitywaiter));
        }
          goto _L5
_L4:
        obj1;
        JVM INSTR monitorexit ;
_L2:
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onCreate +");
        activity.performCreate(bundle);
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onCreate -");
        if (mActivityMonitors == null)
            break; /* Loop/switch isn't completed */
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int i = mActivityMonitors.size();
        int j = 0;
_L7:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((ActivityMonitor)mActivityMonitors.get(j)).match(activity, activity, activity.getIntent());
        j++;
        if (true) goto _L7; else goto _L6
        Exception exception1;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
_L6:
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L5:
        l++;
        if (true) goto _L9; else goto _L8
_L8:
    }

    public void callActivityOnDestroy(Activity activity)
    {
        activity.performDestroy();
        if (mActivityMonitors == null)
            break MISSING_BLOCK_LABEL_77;
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int i = mActivityMonitors.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((ActivityMonitor)mActivityMonitors.get(j)).match(activity, activity, activity.getIntent());
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void callActivityOnNewIntent(Activity activity, Intent intent)
    {
        activity.onNewIntent(intent);
    }

    public void callActivityOnPause(Activity activity)
    {
        activity.performPause();
    }

    public void callActivityOnPostCreate(Activity activity, Bundle bundle)
    {
        activity.onPostCreate(bundle);
    }

    public void callActivityOnRestart(Activity activity)
    {
        activity.onRestart();
    }

    public void callActivityOnRestoreInstanceState(Activity activity, Bundle bundle)
    {
        activity.performRestoreInstanceState(bundle);
    }

    public void callActivityOnResume(Activity activity)
    {
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onResume +");
        activity.mResumed = true;
        activity.onResume();
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onResume -");
        if (mActivityMonitors == null)
            break MISSING_BLOCK_LABEL_98;
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int i = mActivityMonitors.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((ActivityMonitor)mActivityMonitors.get(j)).match(activity, activity, activity.getIntent());
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void callActivityOnSaveInstanceState(Activity activity, Bundle bundle)
    {
        activity.performSaveInstanceState(bundle);
    }

    public void callActivityOnStart(Activity activity)
    {
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onStart +");
        activity.onStart();
        ActivityThread.logAppLaunchTime("Instrumentation", "activity.onStart -");
    }

    public void callActivityOnStop(Activity activity)
    {
        activity.onStop();
    }

    public void callActivityOnUserLeaving(Activity activity)
    {
        activity.performUserLeaving();
    }

    public void callApplicationOnCreate(Application application)
    {
        application.onCreate();
    }

    public boolean checkMonitorHit(ActivityMonitor activitymonitor, int i)
    {
label0:
        {
            waitForIdleSync();
            synchronized (mSync)
            {
                if (activitymonitor.getHits() >= i)
                    break label0;
            }
            return false;
        }
        mActivityMonitors.remove(activitymonitor);
        obj;
        JVM INSTR monitorexit ;
        return true;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void endPerformanceSnapshot()
    {
        if (!isProfiling())
            mPerfMetrics = mPerformanceCollector.endSnapshot();
    }

    public void execStartActivities(Context context, IBinder ibinder, IBinder ibinder1, Activity activity, Intent aintent[], Bundle bundle)
    {
        execStartActivitiesAsUser(context, ibinder, ibinder1, activity, aintent, bundle, UserHandle.myUserId());
    }

    public void execStartActivitiesAsUser(Context context, IBinder ibinder, IBinder ibinder1, Activity activity, Intent aintent[], Bundle bundle, int i)
    {
        IApplicationThread iapplicationthread = (IApplicationThread)ibinder;
        if (mActivityMonitors == null) goto _L2; else goto _L1
_L1:
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int k = mActivityMonitors.size();
        int l = 0;
_L11:
        if (l >= k) goto _L4; else goto _L3
_L3:
        ActivityMonitor activitymonitor = (ActivityMonitor)mActivityMonitors.get(l);
        if (!activitymonitor.match(context, null, aintent[0])) goto _L6; else goto _L5
_L5:
        activitymonitor.mHits = 1 + activitymonitor.mHits;
        if (!activitymonitor.isBlocking()) goto _L4; else goto _L7
_L7:
        obj;
        JVM INSTR monitorexit ;
        return;
_L4:
        obj;
        JVM INSTR monitorexit ;
_L2:
        String as[];
        int j;
        Exception exception;
        try
        {
            as = new String[aintent.length];
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        j = 0;
        if (j >= aintent.length)
            break; /* Loop/switch isn't completed */
        aintent[j].setAllowFds(false);
        as[j] = aintent[j].resolveTypeIfNeeded(context.getContentResolver());
        j++;
        if (true) goto _L9; else goto _L8
_L9:
        break MISSING_BLOCK_LABEL_111;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L8:
        checkStartActivityResult(ActivityManagerNative.getDefault().startActivities(iapplicationthread, aintent, as, ibinder1, bundle, i), aintent[0]);
        return;
_L6:
        l++;
        if (true) goto _L11; else goto _L10
_L10:
    }

    public ActivityResult execStartActivity(Context context, IBinder ibinder, IBinder ibinder1, Activity activity, Intent intent, int i, Bundle bundle)
    {
        IApplicationThread iapplicationthread = (IApplicationThread)ibinder;
        if (mActivityMonitors == null) goto _L2; else goto _L1
_L1:
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int j = mActivityMonitors.size();
        int k = 0;
_L16:
        if (k >= j) goto _L4; else goto _L3
_L3:
        ActivityMonitor activitymonitor = (ActivityMonitor)mActivityMonitors.get(k);
        if (!activitymonitor.match(context, null, intent)) goto _L6; else goto _L5
_L5:
        activitymonitor.mHits = 1 + activitymonitor.mHits;
        if (!activitymonitor.isBlocking()) goto _L4; else goto _L7
_L7:
        if (i < 0) goto _L9; else goto _L8
_L8:
        ActivityResult activityresult = activitymonitor.getResult();
_L14:
        obj;
        JVM INSTR monitorexit ;
        return activityresult;
_L4:
        obj;
        JVM INSTR monitorexit ;
_L2:
        IActivityManager iactivitymanager;
        String s;
        intent.setAllowFds(false);
        intent.migrateExtraStreamToClipData();
        iactivitymanager = ActivityManagerNative.getDefault();
        s = intent.resolveTypeIfNeeded(context.getContentResolver());
        if (activity == null) goto _L11; else goto _L10
_L10:
        String s1 = activity.mEmbeddedID;
_L12:
        checkStartActivityResult(iactivitymanager.startActivity(iapplicationthread, intent, s, ibinder1, s1, i, 0, null, null, bundle), intent);
_L13:
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L11:
        s1 = null;
          goto _L12
        RemoteException remoteexception;
        remoteexception;
          goto _L13
_L9:
        activityresult = null;
          goto _L14
_L6:
        k++;
        if (true) goto _L16; else goto _L15
_L15:
    }

    public ActivityResult execStartActivity(Context context, IBinder ibinder, IBinder ibinder1, Activity activity, Intent intent, int i, Bundle bundle, 
            UserHandle userhandle)
    {
        IApplicationThread iapplicationthread = (IApplicationThread)ibinder;
        if (mActivityMonitors == null) goto _L2; else goto _L1
_L1:
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int j = mActivityMonitors.size();
        int k = 0;
_L16:
        if (k >= j) goto _L4; else goto _L3
_L3:
        ActivityMonitor activitymonitor = (ActivityMonitor)mActivityMonitors.get(k);
        if (!activitymonitor.match(context, null, intent)) goto _L6; else goto _L5
_L5:
        activitymonitor.mHits = 1 + activitymonitor.mHits;
        if (!activitymonitor.isBlocking()) goto _L4; else goto _L7
_L7:
        if (i < 0) goto _L9; else goto _L8
_L8:
        ActivityResult activityresult = activitymonitor.getResult();
_L14:
        obj;
        JVM INSTR monitorexit ;
        return activityresult;
_L4:
        obj;
        JVM INSTR monitorexit ;
_L2:
        IActivityManager iactivitymanager;
        String s;
        intent.setAllowFds(false);
        intent.migrateExtraStreamToClipData();
        iactivitymanager = ActivityManagerNative.getDefault();
        s = intent.resolveTypeIfNeeded(context.getContentResolver());
        if (activity == null) goto _L11; else goto _L10
_L10:
        String s1 = activity.mEmbeddedID;
_L12:
        checkStartActivityResult(iactivitymanager.startActivityAsUser(iapplicationthread, intent, s, ibinder1, s1, i, 0, null, null, bundle, userhandle.getIdentifier()), intent);
_L13:
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L11:
        s1 = null;
          goto _L12
        RemoteException remoteexception;
        remoteexception;
          goto _L13
_L9:
        activityresult = null;
          goto _L14
_L6:
        k++;
        if (true) goto _L16; else goto _L15
_L15:
    }

    public ActivityResult execStartActivity(Context context, IBinder ibinder, IBinder ibinder1, Fragment fragment, Intent intent, int i, Bundle bundle)
    {
        IApplicationThread iapplicationthread = (IApplicationThread)ibinder;
        if (mActivityMonitors == null) goto _L2; else goto _L1
_L1:
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        int j = mActivityMonitors.size();
        int k = 0;
_L16:
        if (k >= j) goto _L4; else goto _L3
_L3:
        ActivityMonitor activitymonitor = (ActivityMonitor)mActivityMonitors.get(k);
        if (!activitymonitor.match(context, null, intent)) goto _L6; else goto _L5
_L5:
        activitymonitor.mHits = 1 + activitymonitor.mHits;
        if (!activitymonitor.isBlocking()) goto _L4; else goto _L7
_L7:
        if (i < 0) goto _L9; else goto _L8
_L8:
        ActivityResult activityresult = activitymonitor.getResult();
_L14:
        obj;
        JVM INSTR monitorexit ;
        return activityresult;
_L4:
        obj;
        JVM INSTR monitorexit ;
_L2:
        IActivityManager iactivitymanager;
        String s;
        intent.setAllowFds(false);
        intent.migrateExtraStreamToClipData();
        iactivitymanager = ActivityManagerNative.getDefault();
        s = intent.resolveTypeIfNeeded(context.getContentResolver());
        if (fragment == null) goto _L11; else goto _L10
_L10:
        String s1 = fragment.mWho;
_L12:
        checkStartActivityResult(iactivitymanager.startActivity(iapplicationthread, intent, s, ibinder1, s1, i, 0, null, null, bundle), intent);
_L13:
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L11:
        s1 = null;
          goto _L12
        RemoteException remoteexception;
        remoteexception;
          goto _L13
_L9:
        activityresult = null;
          goto _L14
_L6:
        k++;
        if (true) goto _L16; else goto _L15
_L15:
    }

    public void finish(int i, Bundle bundle)
    {
        if (mAutomaticPerformanceSnapshots)
            endPerformanceSnapshot();
        if (mPerfMetrics != null)
            bundle.putAll(mPerfMetrics);
        mThread.finishInstrumentation(i, bundle);
    }

    public Bundle getAllocCounts()
    {
        Bundle bundle = new Bundle();
        bundle.putLong("global_alloc_count", Debug.getGlobalAllocCount());
        bundle.putLong("global_alloc_size", Debug.getGlobalAllocSize());
        bundle.putLong("global_freed_count", Debug.getGlobalFreedCount());
        bundle.putLong("global_freed_size", Debug.getGlobalFreedSize());
        bundle.putLong("gc_invocation_count", Debug.getGlobalGcInvocationCount());
        return bundle;
    }

    public Bundle getBinderCounts()
    {
        Bundle bundle = new Bundle();
        bundle.putLong("sent_transactions", Debug.getBinderSentTransactions());
        bundle.putLong("received_transactions", Debug.getBinderReceivedTransactions());
        return bundle;
    }

    public ComponentName getComponentName()
    {
        return mComponent;
    }

    public Context getContext()
    {
        return mInstrContext;
    }

    public Context getTargetContext()
    {
        return mAppContext;
    }

    final void init(ActivityThread activitythread, Context context, Context context1, ComponentName componentname, IInstrumentationWatcher iinstrumentationwatcher)
    {
        mThread = activitythread;
        mThread.getLooper();
        mMessageQueue = Looper.myQueue();
        mInstrContext = context;
        mAppContext = context1;
        mComponent = componentname;
        mWatcher = iinstrumentationwatcher;
    }

    public boolean invokeContextMenuAction(Activity activity, int i, int j)
    {
        validateNotAppThread();
        sendKeySync(new KeyEvent(0, 23));
        waitForIdleSync();
        _cls1ContextMenuRunnable _lcls1contextmenurunnable;
        try
        {
            Thread.sleep(ViewConfiguration.getLongPressTimeout());
        }
        catch (InterruptedException interruptedexception)
        {
            Log.e("Instrumentation", "Could not sleep for long press timeout", interruptedexception);
            return false;
        }
        sendKeySync(new KeyEvent(1, 23));
        waitForIdleSync();
        _lcls1contextmenurunnable = new _cls1ContextMenuRunnable(activity, i, j);
        runOnMainSync(_lcls1contextmenurunnable);
        return _lcls1contextmenurunnable.returnValue;
    }

    public boolean invokeMenuActionSync(Activity activity, int i, int j)
    {
        _cls1MenuRunnable _lcls1menurunnable = new _cls1MenuRunnable(activity, i, j);
        runOnMainSync(_lcls1menurunnable);
        return _lcls1menurunnable.returnValue;
    }

    public boolean isProfiling()
    {
        return mThread.isProfiling();
    }

    public Activity newActivity(Class class1, Context context, IBinder ibinder, Application application, Intent intent, ActivityInfo activityinfo, CharSequence charsequence, 
            Activity activity, String s, Object obj)
        throws InstantiationException, IllegalAccessException
    {
        Activity activity1 = (Activity)class1.newInstance();
        activity1.attach(context, null, this, ibinder, application, intent, activityinfo, charsequence, activity, s, (Activity.NonConfigurationInstances)obj, new Configuration());
        return activity1;
    }

    public Activity newActivity(ClassLoader classloader, String s, Intent intent)
        throws InstantiationException, IllegalAccessException, ClassNotFoundException
    {
        return (Activity)classloader.loadClass(s).newInstance();
    }

    public Application newApplication(ClassLoader classloader, String s, Context context)
        throws InstantiationException, IllegalAccessException, ClassNotFoundException
    {
        return newApplication(classloader.loadClass(s), context);
    }

    public void onCreate(Bundle bundle)
    {
    }

    public void onDestroy()
    {
    }

    public boolean onException(Object obj, Throwable throwable)
    {
        return false;
    }

    public void onStart()
    {
    }

    public void removeMonitor(ActivityMonitor activitymonitor)
    {
        synchronized (mSync)
        {
            mActivityMonitors.remove(activitymonitor);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void runOnMainSync(Runnable runnable)
    {
        validateNotAppThread();
        SyncRunnable syncrunnable = new SyncRunnable(runnable);
        mThread.getHandler().post(syncrunnable);
        syncrunnable.waitForComplete();
    }

    public void sendCharacterSync(int i)
    {
        sendKeySync(new KeyEvent(0, i));
        sendKeySync(new KeyEvent(1, i));
    }

    public void sendKeyDownUpSync(int i)
    {
        sendKeySync(new KeyEvent(0, i));
        sendKeySync(new KeyEvent(1, i));
    }

    public void sendKeySync(KeyEvent keyevent)
    {
        validateNotAppThread();
        long l = keyevent.getDownTime();
        long l1 = keyevent.getEventTime();
        int i = keyevent.getAction();
        int j = keyevent.getKeyCode();
        int k = keyevent.getRepeatCount();
        int i1 = keyevent.getMetaState();
        int j1 = keyevent.getDeviceId();
        int k1 = keyevent.getScanCode();
        int i2 = keyevent.getSource();
        int j2 = keyevent.getFlags();
        if (i2 == 0)
            i2 = 257;
        if (l1 == 0L)
            l1 = SystemClock.uptimeMillis();
        if (l == 0L)
            l = l1;
        KeyEvent keyevent1 = new KeyEvent(l, l1, i, j, k, i1, j1, k1, j2 | 8, i2);
        InputManager.getInstance().injectInputEvent(keyevent1, 2);
    }

    public void sendPointerSync(MotionEvent motionevent)
    {
        validateNotAppThread();
        if ((2 & motionevent.getSource()) == 0)
            motionevent.setSource(4098);
        InputManager.getInstance().injectInputEvent(motionevent, 2);
    }

    public void sendStatus(int i, Bundle bundle)
    {
        if (mWatcher == null)
            break MISSING_BLOCK_LABEL_22;
        mWatcher.instrumentationStatus(mComponent, i, bundle);
        return;
        RemoteException remoteexception;
        remoteexception;
        mWatcher = null;
        return;
    }

    public void sendStringSync(String s)
    {
        if (s != null)
        {
            KeyEvent akeyevent[] = KeyCharacterMap.load(-1).getEvents(s.toCharArray());
            if (akeyevent != null)
            {
                for (int i = 0; i < akeyevent.length; i++)
                    sendKeySync(KeyEvent.changeTimeRepeat(akeyevent[i], SystemClock.uptimeMillis(), 0));

            }
        }
    }

    public void sendTrackballEventSync(MotionEvent motionevent)
    {
        validateNotAppThread();
        if ((4 & motionevent.getSource()) == 0)
            motionevent.setSource(0x10004);
        InputManager.getInstance().injectInputEvent(motionevent, 2);
    }

    public void setAutomaticPerformanceSnapshots()
    {
        mAutomaticPerformanceSnapshots = true;
        mPerformanceCollector = new PerformanceCollector();
    }

    public void setInTouchMode(boolean flag)
    {
        try
        {
            android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window")).setInTouchMode(flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void start()
    {
        if (mRunner != null)
        {
            throw new RuntimeException("Instrumentation already started");
        } else
        {
            mRunner = new InstrumentationThread((new StringBuilder()).append("Instr: ").append(getClass().getName()).toString());
            mRunner.start();
            return;
        }
    }

    public Activity startActivitySync(Intent intent)
    {
        validateNotAppThread();
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        Intent intent1 = new Intent(intent);
        ActivityInfo activityinfo = intent1.resolveActivityInfo(getTargetContext().getPackageManager(), 0);
        if (activityinfo != null) goto _L2; else goto _L1
_L1:
        throw new RuntimeException((new StringBuilder()).append("Unable to resolve activity for: ").append(intent1).toString());
        Exception exception;
        exception;
_L4:
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        ActivityWaiter activitywaiter;
        String s = mThread.getProcessName();
        if (!activityinfo.processName.equals(s))
            throw new RuntimeException((new StringBuilder()).append("Intent in process ").append(s).append(" resolved to different process ").append(activityinfo.processName).append(": ").append(intent1).toString());
        intent1.setComponent(new ComponentName(((ComponentInfo) (activityinfo)).applicationInfo.packageName, ((ComponentInfo) (activityinfo)).name));
        activitywaiter = new ActivityWaiter(intent1);
        if (mWaitingActivities == null)
            mWaitingActivities = new ArrayList();
        mWaitingActivities.add(activitywaiter);
        getTargetContext().startActivity(intent1);
        Activity activity;
        do
            try
            {
                mSync.wait();
            }
            catch (InterruptedException interruptedexception) { }
        while (mWaitingActivities.contains(activitywaiter));
        activity = activitywaiter.activity;
        obj;
        JVM INSTR monitorexit ;
        return activity;
        exception;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void startAllocCounting()
    {
        Runtime.getRuntime().gc();
        Runtime.getRuntime().runFinalization();
        Runtime.getRuntime().gc();
        Debug.resetAllCounts();
        Debug.startAllocCounting();
    }

    public void startPerformanceSnapshot()
    {
        if (!isProfiling())
            mPerformanceCollector.beginSnapshot(null);
    }

    public void startProfiling()
    {
        if (mThread.isProfiling())
        {
            File file = new File(mThread.getProfileFilePath());
            file.getParentFile().mkdirs();
            Debug.startMethodTracing(file.toString(), 0x800000);
        }
    }

    public void stopAllocCounting()
    {
        Runtime.getRuntime().gc();
        Runtime.getRuntime().runFinalization();
        Runtime.getRuntime().gc();
        Debug.stopAllocCounting();
    }

    public void stopProfiling()
    {
        if (mThread.isProfiling())
            Debug.stopMethodTracing();
    }

    public void waitForIdle(Runnable runnable)
    {
        mMessageQueue.addIdleHandler(new Idler(runnable));
        mThread.getHandler().post(new EmptyRunnable());
    }

    public void waitForIdleSync()
    {
        validateNotAppThread();
        Idler idler = new Idler(null);
        mMessageQueue.addIdleHandler(idler);
        mThread.getHandler().post(new EmptyRunnable());
        idler.waitForIdle();
    }

    public Activity waitForMonitor(ActivityMonitor activitymonitor)
    {
        Activity activity = activitymonitor.waitForActivity();
        synchronized (mSync)
        {
            mActivityMonitors.remove(activitymonitor);
        }
        return activity;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Activity waitForMonitorWithTimeout(ActivityMonitor activitymonitor, long l)
    {
        Activity activity = activitymonitor.waitForActivityWithTimeout(l);
        synchronized (mSync)
        {
            mActivityMonitors.remove(activitymonitor);
        }
        return activity;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }



}
