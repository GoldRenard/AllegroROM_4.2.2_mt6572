// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.*;
import android.os.*;
import android.util.Slog;
import android.view.CompatibilityInfoHolder;
import com.android.internal.util.ArrayUtils;
import java.io.*;
import java.lang.ref.WeakReference;
import java.net.URL;
import java.util.*;

// Referenced classes of package android.app:
//            ActivityThread, ContextImpl, ApplicationLoaders, Instrumentation, 
//            IntentReceiverLeaked, ActivityManagerNative, IActivityManager, ServiceConnectionLeaked, 
//            Application, IServiceConnection

public final class LoadedApk
{
    static final class ReceiverDispatcher
    {

        final Handler mActivityThread;
        final Context mContext;
        boolean mForgotten;
        final android.content.IIntentReceiver.Stub mIIntentReceiver;
        final Instrumentation mInstrumentation;
        final IntentReceiverLeaked mLocation = new IntentReceiverLeaked(null);
        final BroadcastReceiver mReceiver;
        final boolean mRegistered;
        RuntimeException mUnregisterLocation;

        IIntentReceiver getIIntentReceiver()
        {
            return mIIntentReceiver;
        }

        BroadcastReceiver getIntentReceiver()
        {
            return mReceiver;
        }

        IntentReceiverLeaked getLocation()
        {
            return mLocation;
        }

        RuntimeException getUnregisterLocation()
        {
            return mUnregisterLocation;
        }

        public void performReceive(Intent intent, int i, String s, Bundle bundle, boolean flag, boolean flag1, int j)
        {
            Args args = new Args(intent, i, s, bundle, flag, flag1, j);
            if (!mActivityThread.post(args) && mRegistered && flag)
                args.sendFinished(ActivityManagerNative.getDefault());
        }

        void setUnregisterLocation(RuntimeException runtimeexception)
        {
            mUnregisterLocation = runtimeexception;
        }

        void validate(Context context, Handler handler)
        {
            if (mContext != context)
                throw new IllegalStateException((new StringBuilder()).append("Receiver ").append(mReceiver).append(" registered with differing Context (was ").append(mContext).append(" now ").append(context).append(")").toString());
            if (mActivityThread != handler)
                throw new IllegalStateException((new StringBuilder()).append("Receiver ").append(mReceiver).append(" registered with differing handler (was ").append(mActivityThread).append(" now ").append(handler).append(")").toString());
            else
                return;
        }

        ReceiverDispatcher(BroadcastReceiver broadcastreceiver, Context context, Handler handler, Instrumentation instrumentation, boolean flag)
        {
            if (handler == null)
                throw new NullPointerException("Handler must not be null");
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            mIIntentReceiver = new InnerReceiver(this, flag1);
            mReceiver = broadcastreceiver;
            mContext = context;
            mActivityThread = handler;
            mInstrumentation = instrumentation;
            mRegistered = flag;
            mLocation.fillInStackTrace();
        }
    }

    final class ReceiverDispatcher.Args extends android.content.BroadcastReceiver.PendingResult
        implements Runnable
    {

        private Intent mCurIntent;
        private final boolean mOrdered;
        final ReceiverDispatcher this$0;

        public void run()
        {
            BroadcastReceiver broadcastreceiver;
            boolean flag;
            IActivityManager iactivitymanager;
            Intent intent;
            broadcastreceiver = mReceiver;
            flag = mOrdered;
            iactivitymanager = ActivityManagerNative.getDefault();
            intent = mCurIntent;
            mCurIntent = null;
            if (broadcastreceiver == null || mForgotten)
            {
                if (mRegistered && flag)
                {
                    if (!ActivityThread.mIsUserBuild)
                        Slog.d("ActivityThread", (new StringBuilder()).append("BDC-Finishing null broadcast: intent=").append(intent).append(", ordered=true").append(", receiver=").append(broadcastreceiver).append(", IIntentReceiver=").append(Integer.toHexString(System.identityHashCode(mIIntentReceiver.asBinder()))).toString());
                    sendFinished(iactivitymanager);
                }
                return;
            }
            Trace.traceBegin(64L, "broadcastReceiveReg");
            ClassLoader classloader = mReceiver.getClass().getClassLoader();
            intent.setExtrasClassLoader(classloader);
            setExtrasClassLoader(classloader);
            broadcastreceiver.setPendingResult(this);
            if (ActivityThread.mIsUserBuild || !mRegistered || !flag)
                break MISSING_BLOCK_LABEL_271;
            if (!mRegistered || !flag);
            Slog.d("ActivityThread", (new StringBuilder()).append("BDC-Calling onReceive: intent=").append(intent).append(", ordered=true").append(", receiver=").append(broadcastreceiver).append(", IIntentReceiver=").append(Integer.toHexString(System.identityHashCode(mIIntentReceiver.asBinder()))).toString());
            broadcastreceiver.onReceive(mContext, intent);
_L2:
            if (broadcastreceiver.getPendingResult() != null)
                finish();
            Trace.traceEnd(64L);
            return;
            Exception exception;
            exception;
            if (mRegistered && flag)
                sendFinished(iactivitymanager);
            if (mInstrumentation == null || !mInstrumentation.onException(mReceiver, exception))
            {
                Trace.traceEnd(64L);
                throw new RuntimeException((new StringBuilder()).append("Error receiving broadcast ").append(intent).append(" in ").append(mReceiver).toString(), exception);
            }
            if (true) goto _L2; else goto _L1
_L1:
        }

        public ReceiverDispatcher.Args(Intent intent, int i, String s, Bundle bundle, boolean flag, boolean flag1, 
                int j)
        {
            this$0 = ReceiverDispatcher.this;
            byte byte0;
            if (mRegistered)
                byte0 = 1;
            else
                byte0 = 2;
            super(i, s, bundle, byte0, flag, flag1, mIIntentReceiver.asBinder(), j);
            mCurIntent = intent;
            mOrdered = flag;
        }
    }

    static final class ReceiverDispatcher.InnerReceiver extends android.content.IIntentReceiver.Stub
    {

        final WeakReference mDispatcher;
        final ReceiverDispatcher mStrongRef;

        public void performReceive(Intent intent, int i, String s, Bundle bundle, boolean flag, boolean flag1, int j)
        {
            IActivityManager iactivitymanager;
            ReceiverDispatcher receiverdispatcher = (ReceiverDispatcher)mDispatcher.get();
            if (receiverdispatcher != null)
            {
                receiverdispatcher.performReceive(intent, i, s, bundle, flag, flag1, j);
                return;
            }
            iactivitymanager = ActivityManagerNative.getDefault();
            if (bundle == null)
                break MISSING_BLOCK_LABEL_51;
            bundle.setAllowFds(false);
            if (ActivityThread.mIsUserBuild || !flag)
                break MISSING_BLOCK_LABEL_96;
            Slog.d("ActivityThread", (new StringBuilder()).append("BDC-Calling finishReceiver: IIntentReceiver=").append(Integer.toHexString(System.identityHashCode(asBinder()))).toString());
            iactivitymanager.finishReceiver(this, i, s, bundle, false);
            return;
            RemoteException remoteexception;
            remoteexception;
            Slog.w("ActivityThread", "Couldn't finish broadcast to unregistered receiver");
            return;
        }

        ReceiverDispatcher.InnerReceiver(ReceiverDispatcher receiverdispatcher, boolean flag)
        {
            mDispatcher = new WeakReference(receiverdispatcher);
            if (!flag)
                receiverdispatcher = null;
            mStrongRef = receiverdispatcher;
        }
    }

    static final class ServiceDispatcher
    {

        private final HashMap mActiveConnections = new HashMap();
        private final Handler mActivityThread;
        private final ServiceConnection mConnection;
        private final Context mContext;
        private boolean mDied;
        private final int mFlags;
        private boolean mForgotten;
        private final InnerConnection mIServiceConnection = new InnerConnection(this);
        private final ServiceConnectionLeaked mLocation = new ServiceConnectionLeaked(null);
        private RuntimeException mUnbindLocation;

        public void connected(ComponentName componentname, IBinder ibinder)
        {
            if (mActivityThread != null)
            {
                mActivityThread.post(new RunConnection(componentname, ibinder, 0));
                return;
            } else
            {
                doConnected(componentname, ibinder);
                return;
            }
        }

        public void death(ComponentName componentname, IBinder ibinder)
        {
            this;
            JVM INSTR monitorenter ;
            ConnectionInfo connectioninfo;
            mDied = true;
            connectioninfo = (ConnectionInfo)mActiveConnections.remove(componentname);
            if (connectioninfo == null)
                break MISSING_BLOCK_LABEL_34;
            if (connectioninfo.binder == ibinder)
                break MISSING_BLOCK_LABEL_37;
            this;
            JVM INSTR monitorexit ;
            return;
            connectioninfo.binder.unlinkToDeath(connectioninfo.deathMonitor, 0);
            this;
            JVM INSTR monitorexit ;
            Exception exception;
            if (mActivityThread != null)
            {
                mActivityThread.post(new RunConnection(componentname, ibinder, 1));
                return;
            } else
            {
                doDeath(componentname, ibinder);
                return;
            }
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void doConnected(ComponentName componentname, IBinder ibinder)
        {
            this;
            JVM INSTR monitorenter ;
            if (!mForgotten)
                break MISSING_BLOCK_LABEL_12;
            this;
            JVM INSTR monitorexit ;
            return;
            ConnectionInfo connectioninfo = (ConnectionInfo)mActiveConnections.get(componentname);
            if (connectioninfo == null)
                break MISSING_BLOCK_LABEL_47;
            if (connectioninfo.binder != ibinder)
                break MISSING_BLOCK_LABEL_47;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            if (ibinder == null)
                break MISSING_BLOCK_LABEL_179;
            ConnectionInfo connectioninfo1;
            mDied = false;
            connectioninfo1 = new ConnectionInfo();
            connectioninfo1.binder = ibinder;
            connectioninfo1.deathMonitor = new DeathMonitor(componentname, ibinder);
            ibinder.linkToDeath(connectioninfo1.deathMonitor, 0);
            mActiveConnections.put(componentname, connectioninfo1);
_L1:
            if (connectioninfo == null)
                break MISSING_BLOCK_LABEL_132;
            connectioninfo.binder.unlinkToDeath(connectioninfo.deathMonitor, 0);
            this;
            JVM INSTR monitorexit ;
            if (connectioninfo != null)
                mConnection.onServiceDisconnected(componentname);
            RemoteException remoteexception;
            if (ibinder != null)
            {
                mConnection.onServiceConnected(componentname, ibinder);
                return;
            } else
            {
                return;
            }
            remoteexception;
            mActiveConnections.remove(componentname);
            this;
            JVM INSTR monitorexit ;
            return;
            mActiveConnections.remove(componentname);
              goto _L1
        }

        public void doDeath(ComponentName componentname, IBinder ibinder)
        {
            mConnection.onServiceDisconnected(componentname);
        }

        void doForget()
        {
            this;
            JVM INSTR monitorenter ;
            ConnectionInfo connectioninfo;
            for (Iterator iterator = mActiveConnections.values().iterator(); iterator.hasNext(); connectioninfo.binder.unlinkToDeath(connectioninfo.deathMonitor, 0))
                connectioninfo = (ConnectionInfo)iterator.next();

            break MISSING_BLOCK_LABEL_57;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            mActiveConnections.clear();
            mForgotten = true;
            this;
            JVM INSTR monitorexit ;
        }

        int getFlags()
        {
            return mFlags;
        }

        IServiceConnection getIServiceConnection()
        {
            return mIServiceConnection;
        }

        ServiceConnectionLeaked getLocation()
        {
            return mLocation;
        }

        ServiceConnection getServiceConnection()
        {
            return mConnection;
        }

        RuntimeException getUnbindLocation()
        {
            return mUnbindLocation;
        }

        void setUnbindLocation(RuntimeException runtimeexception)
        {
            mUnbindLocation = runtimeexception;
        }

        void validate(Context context, Handler handler)
        {
            if (mContext != context)
                throw new RuntimeException((new StringBuilder()).append("ServiceConnection ").append(mConnection).append(" registered with differing Context (was ").append(mContext).append(" now ").append(context).append(")").toString());
            if (mActivityThread != handler)
                throw new RuntimeException((new StringBuilder()).append("ServiceConnection ").append(mConnection).append(" registered with differing handler (was ").append(mActivityThread).append(" now ").append(handler).append(")").toString());
            else
                return;
        }

        ServiceDispatcher(ServiceConnection serviceconnection, Context context, Handler handler, int i)
        {
            mConnection = serviceconnection;
            mContext = context;
            mActivityThread = handler;
            mLocation.fillInStackTrace();
            mFlags = i;
        }
    }

    private static class ServiceDispatcher.ConnectionInfo
    {

        IBinder binder;
        android.os.IBinder.DeathRecipient deathMonitor;

        private ServiceDispatcher.ConnectionInfo()
        {
        }

    }

    private final class ServiceDispatcher.DeathMonitor
        implements android.os.IBinder.DeathRecipient
    {

        final ComponentName mName;
        final IBinder mService;
        final ServiceDispatcher this$0;

        public void binderDied()
        {
            death(mName, mService);
        }

        ServiceDispatcher.DeathMonitor(ComponentName componentname, IBinder ibinder)
        {
            this$0 = ServiceDispatcher.this;
            super();
            mName = componentname;
            mService = ibinder;
        }
    }

    private static class ServiceDispatcher.InnerConnection extends IServiceConnection.Stub
    {

        final WeakReference mDispatcher;

        public void connected(ComponentName componentname, IBinder ibinder)
            throws RemoteException
        {
            ServiceDispatcher servicedispatcher = (ServiceDispatcher)mDispatcher.get();
            if (servicedispatcher != null)
                servicedispatcher.connected(componentname, ibinder);
        }

        ServiceDispatcher.InnerConnection(ServiceDispatcher servicedispatcher)
        {
            mDispatcher = new WeakReference(servicedispatcher);
        }
    }

    private final class ServiceDispatcher.RunConnection
        implements Runnable
    {

        final int mCommand;
        final ComponentName mName;
        final IBinder mService;
        final ServiceDispatcher this$0;

        public void run()
        {
            if (mCommand == 0)
                doConnected(mName, mService);
            else
            if (mCommand == 1)
            {
                doDeath(mName, mService);
                return;
            }
        }

        ServiceDispatcher.RunConnection(ComponentName componentname, IBinder ibinder, int i)
        {
            this$0 = ServiceDispatcher.this;
            super();
            mName = componentname;
            mService = ibinder;
            mCommand = i;
        }
    }

    private static class WarningContextClassLoader extends ClassLoader
    {

        private static boolean warned = false;

        private void warn(String s)
        {
            if (warned)
            {
                return;
            } else
            {
                warned = true;
                Thread.currentThread().setContextClassLoader(getParent());
                Slog.w("ActivityThread", (new StringBuilder()).append("ClassLoader.").append(s).append(": ").append("The class loader returned by ").append("Thread.getContextClassLoader() may fail for processes ").append("that host multiple applications. You should explicitly ").append("specify a context class loader. For example: ").append("Thread.setContextClassLoader(getClass().getClassLoader());").toString());
                return;
            }
        }

        public void clearAssertionStatus()
        {
            warn("clearAssertionStatus");
            getParent().clearAssertionStatus();
        }

        public URL getResource(String s)
        {
            warn("getResource");
            return getParent().getResource(s);
        }

        public InputStream getResourceAsStream(String s)
        {
            warn("getResourceAsStream");
            return getParent().getResourceAsStream(s);
        }

        public Enumeration getResources(String s)
            throws IOException
        {
            warn("getResources");
            return getParent().getResources(s);
        }

        public Class loadClass(String s)
            throws ClassNotFoundException
        {
            warn("loadClass");
            return getParent().loadClass(s);
        }

        public void setClassAssertionStatus(String s, boolean flag)
        {
            warn("setClassAssertionStatus");
            getParent().setClassAssertionStatus(s, flag);
        }

        public void setDefaultAssertionStatus(boolean flag)
        {
            warn("setDefaultAssertionStatus");
            getParent().setDefaultAssertionStatus(flag);
        }

        public void setPackageAssertionStatus(String s, boolean flag)
        {
            warn("setPackageAssertionStatus");
            getParent().setPackageAssertionStatus(s, flag);
        }


        private WarningContextClassLoader()
        {
        }

    }


    private static final String TAG = "LoadedApk";
    private final ActivityThread mActivityThread;
    private final String mAppDir;
    private Application mApplication;
    private final ApplicationInfo mApplicationInfo;
    private final ClassLoader mBaseClassLoader;
    private ClassLoader mClassLoader;
    int mClientCount;
    public final CompatibilityInfoHolder mCompatibilityInfo;
    private final String mDataDir;
    private final File mDataDirFile;
    private final boolean mIncludeCode;
    private final String mLibDir;
    final String mPackageName;
    private final HashMap mReceivers;
    private final String mResDir;
    Resources mResources;
    private final boolean mSecurityViolation;
    private final HashMap mServices;
    private final String mSharedLibraries[];
    private final HashMap mUnboundServices;
    private final HashMap mUnregisteredReceivers;

    public LoadedApk(ActivityThread activitythread, ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo, ActivityThread activitythread1, ClassLoader classloader, boolean flag, boolean flag1)
    {
        mCompatibilityInfo = new CompatibilityInfoHolder();
        mReceivers = new HashMap();
        mUnregisteredReceivers = new HashMap();
        mServices = new HashMap();
        mUnboundServices = new HashMap();
        mClientCount = 0;
        mActivityThread = activitythread;
        mApplicationInfo = applicationinfo;
        mPackageName = applicationinfo.packageName;
        mAppDir = applicationinfo.sourceDir;
        int i = Process.myUid();
        String s;
        if (applicationinfo.uid == i)
            s = applicationinfo.sourceDir;
        else
            s = applicationinfo.publicSourceDir;
        mResDir = s;
        if (!UserHandle.isSameUser(applicationinfo.uid, i) && !Process.isIsolated())
            applicationinfo.dataDir = PackageManager.getDataDirForUser(UserHandle.getUserId(i), mPackageName);
        mSharedLibraries = applicationinfo.sharedLibraryFiles;
        mDataDir = applicationinfo.dataDir;
        File file;
        if (mDataDir != null)
            file = new File(mDataDir);
        else
            file = null;
        mDataDirFile = file;
        mLibDir = applicationinfo.nativeLibraryDir;
        mBaseClassLoader = classloader;
        mSecurityViolation = flag;
        mIncludeCode = flag1;
        mCompatibilityInfo.set(compatibilityinfo);
        if (mAppDir == null)
        {
            if (ActivityThread.mSystemContext == null)
            {
                ActivityThread.mSystemContext = ContextImpl.createSystemContext(activitythread1);
                ActivityThread.mSystemContext.getResources().updateConfiguration(activitythread1.getConfiguration(), activitythread1.getDisplayMetricsLocked(0, compatibilityinfo), compatibilityinfo);
            }
            mClassLoader = ActivityThread.mSystemContext.getClassLoader();
            mResources = ActivityThread.mSystemContext.getResources();
        }
    }

    public LoadedApk(ActivityThread activitythread, String s, Context context, ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo)
    {
        mCompatibilityInfo = new CompatibilityInfoHolder();
        mReceivers = new HashMap();
        mUnregisteredReceivers = new HashMap();
        mServices = new HashMap();
        mUnboundServices = new HashMap();
        mClientCount = 0;
        mActivityThread = activitythread;
        if (applicationinfo == null)
            applicationinfo = new ApplicationInfo();
        mApplicationInfo = applicationinfo;
        mApplicationInfo.packageName = s;
        mPackageName = s;
        mAppDir = null;
        mResDir = null;
        mSharedLibraries = null;
        mDataDir = null;
        mDataDirFile = null;
        mLibDir = null;
        mBaseClassLoader = null;
        mSecurityViolation = false;
        mIncludeCode = true;
        mClassLoader = context.getClassLoader();
        mResources = context.getResources();
        mCompatibilityInfo.set(compatibilityinfo);
    }

    private static String combineLibs(String as[], String as1[])
    {
        StringBuilder stringbuilder = new StringBuilder(300);
        boolean flag = true;
        if (as != null)
        {
            int k = as.length;
            for (int l = 0; l < k; l++)
            {
                String s1 = as[l];
                if (flag)
                    flag = false;
                else
                    stringbuilder.append(':');
                stringbuilder.append(s1);
            }

        }
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        if (as1 != null)
        {
            int i = as1.length;
            for (int j = 0; j < i; j++)
            {
                String s = as1[j];
                if (flag1 && ArrayUtils.contains(as, s))
                    continue;
                if (flag)
                    flag = false;
                else
                    stringbuilder.append(':');
                stringbuilder.append(s);
            }

        }
        return stringbuilder.toString();
    }

    private static String[] getLibrariesFor(String s)
    {
        ApplicationInfo applicationinfo;
        try
        {
            applicationinfo = ActivityThread.getPackageManager().getApplicationInfo(s, 1024, UserHandle.myUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new AssertionError(remoteexception);
        }
        if (applicationinfo == null)
            return null;
        else
            return applicationinfo.sharedLibraryFiles;
    }

    private void initializeJavaContextClassLoader()
    {
        IPackageManager ipackagemanager = ActivityThread.getPackageManager();
        PackageInfo packageinfo;
        boolean flag;
        boolean flag1;
        boolean flag2;
        Object obj;
        try
        {
            packageinfo = ipackagemanager.getPackageInfo(mPackageName, 0, UserHandle.myUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new AssertionError(remoteexception);
        }
        if (packageinfo.sharedUserId != null)
            flag = true;
        else
            flag = false;
        if (packageinfo.applicationInfo != null && !mPackageName.equals(packageinfo.applicationInfo.processName))
            flag1 = true;
        else
            flag1 = false;
        if (flag || flag1)
            flag2 = true;
        else
            flag2 = false;
        if (flag2)
            obj = new WarningContextClassLoader();
        else
            obj = mClassLoader;
        Thread.currentThread().setContextClassLoader(((ClassLoader) (obj)));
    }

    public IIntentReceiver forgetReceiverDispatcher(Context context, BroadcastReceiver broadcastreceiver)
    {
        HashMap hashmap = mReceivers;
        hashmap;
        JVM INSTR monitorenter ;
        HashMap hashmap1 = (HashMap)mReceivers.get(context);
        if (hashmap1 == null)
            break MISSING_BLOCK_LABEL_162;
        ReceiverDispatcher receiverdispatcher = (ReceiverDispatcher)hashmap1.get(broadcastreceiver);
        if (receiverdispatcher == null)
            break MISSING_BLOCK_LABEL_162;
        HashMap hashmap2;
        hashmap1.remove(broadcastreceiver);
        if (hashmap1.size() == 0)
            mReceivers.remove(context);
        if (!broadcastreceiver.getDebugUnregister())
            break MISSING_BLOCK_LABEL_144;
        hashmap2 = (HashMap)mUnregisteredReceivers.get(context);
        if (hashmap2 != null)
            break MISSING_BLOCK_LABEL_110;
        hashmap2 = new HashMap();
        mUnregisteredReceivers.put(context, hashmap2);
        IllegalArgumentException illegalargumentexception = new IllegalArgumentException("Originally unregistered here:");
        illegalargumentexception.fillInStackTrace();
        receiverdispatcher.setUnregisterLocation(illegalargumentexception);
        hashmap2.put(broadcastreceiver, receiverdispatcher);
        IIntentReceiver iintentreceiver;
        receiverdispatcher.mForgotten = true;
        iintentreceiver = receiverdispatcher.getIIntentReceiver();
        hashmap;
        JVM INSTR monitorexit ;
        return iintentreceiver;
        HashMap hashmap3 = (HashMap)mUnregisteredReceivers.get(context);
        if (hashmap3 == null)
            break MISSING_BLOCK_LABEL_246;
        ReceiverDispatcher receiverdispatcher1 = (ReceiverDispatcher)hashmap3.get(broadcastreceiver);
        if (receiverdispatcher1 == null)
            break MISSING_BLOCK_LABEL_246;
        RuntimeException runtimeexception = receiverdispatcher1.getUnregisterLocation();
        throw new IllegalArgumentException((new StringBuilder()).append("Unregistering Receiver ").append(broadcastreceiver).append(" that was already unregistered").toString(), runtimeexception);
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        if (context != null)
            break MISSING_BLOCK_LABEL_288;
        throw new IllegalStateException((new StringBuilder()).append("Unbinding Receiver ").append(broadcastreceiver).append(" from Context that is no longer in use: ").append(context).toString());
        throw new IllegalArgumentException((new StringBuilder()).append("Receiver not registered: ").append(broadcastreceiver).toString());
    }

    public final IServiceConnection forgetServiceDispatcher(Context context, ServiceConnection serviceconnection)
    {
        HashMap hashmap = mServices;
        hashmap;
        JVM INSTR monitorenter ;
        HashMap hashmap1 = (HashMap)mServices.get(context);
        if (hashmap1 == null)
            break MISSING_BLOCK_LABEL_164;
        ServiceDispatcher servicedispatcher = (ServiceDispatcher)hashmap1.get(serviceconnection);
        if (servicedispatcher == null)
            break MISSING_BLOCK_LABEL_164;
        HashMap hashmap2;
        hashmap1.remove(serviceconnection);
        servicedispatcher.doForget();
        if (hashmap1.size() == 0)
            mServices.remove(context);
        if ((2 & servicedispatcher.getFlags()) == 0)
            break MISSING_BLOCK_LABEL_152;
        hashmap2 = (HashMap)mUnboundServices.get(context);
        if (hashmap2 != null)
            break MISSING_BLOCK_LABEL_118;
        hashmap2 = new HashMap();
        mUnboundServices.put(context, hashmap2);
        IllegalArgumentException illegalargumentexception = new IllegalArgumentException("Originally unbound here:");
        illegalargumentexception.fillInStackTrace();
        servicedispatcher.setUnbindLocation(illegalargumentexception);
        hashmap2.put(serviceconnection, servicedispatcher);
        IServiceConnection iserviceconnection = servicedispatcher.getIServiceConnection();
        hashmap;
        JVM INSTR monitorexit ;
        return iserviceconnection;
        HashMap hashmap3 = (HashMap)mUnboundServices.get(context);
        if (hashmap3 == null)
            break MISSING_BLOCK_LABEL_248;
        ServiceDispatcher servicedispatcher1 = (ServiceDispatcher)hashmap3.get(serviceconnection);
        if (servicedispatcher1 == null)
            break MISSING_BLOCK_LABEL_248;
        RuntimeException runtimeexception = servicedispatcher1.getUnbindLocation();
        throw new IllegalArgumentException((new StringBuilder()).append("Unbinding Service ").append(serviceconnection).append(" that was already unbound").toString(), runtimeexception);
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        if (context != null)
            break MISSING_BLOCK_LABEL_290;
        throw new IllegalStateException((new StringBuilder()).append("Unbinding Service ").append(serviceconnection).append(" from Context that is no longer in use: ").append(context).toString());
        throw new IllegalArgumentException((new StringBuilder()).append("Service not registered: ").append(serviceconnection).toString());
    }

    public String getAppDir()
    {
        return mAppDir;
    }

    Application getApplication()
    {
        return mApplication;
    }

    public ApplicationInfo getApplicationInfo()
    {
        return mApplicationInfo;
    }

    public AssetManager getAssets(ActivityThread activitythread)
    {
        return getResources(activitythread).getAssets();
    }

    public ClassLoader getClassLoader()
    {
        this;
        JVM INSTR monitorenter ;
        ClassLoader classloader1;
        if (mClassLoader == null)
            break MISSING_BLOCK_LABEL_20;
        classloader1 = mClassLoader;
        this;
        JVM INSTR monitorexit ;
        return classloader1;
        if (!mIncludeCode || mPackageName.equals("android")) goto _L2; else goto _L1
_L1:
        String s;
        String s1;
        String s2;
        String s3;
        String s4;
        String s5;
        String s6;
        boolean flag1;
        s = mAppDir;
        s1 = mLibDir;
        s2 = mActivityThread.mInstrumentationAppDir;
        s3 = mActivityThread.mInstrumentationAppLibraryDir;
        s4 = mActivityThread.mInstrumentationAppPackage;
        s5 = mActivityThread.mInstrumentedAppDir;
        s6 = mActivityThread.mInstrumentedAppLibraryDir;
        if (mAppDir.equals(s2))
            break MISSING_BLOCK_LABEL_127;
        flag1 = mAppDir.equals(s5);
        String as[];
        as = null;
        if (!flag1)
            break MISSING_BLOCK_LABEL_206;
        boolean flag;
        s = (new StringBuilder()).append(s2).append(":").append(s5).toString();
        s1 = (new StringBuilder()).append(s3).append(":").append(s6).toString();
        flag = s5.equals(s2);
        as = null;
        if (flag)
            break MISSING_BLOCK_LABEL_206;
        as = getLibrariesFor(s4);
        if (mSharedLibraries == null && as == null)
            break MISSING_BLOCK_LABEL_250;
        s = (new StringBuilder()).append(combineLibs(mSharedLibraries, as)).append(':').append(s).toString();
        android.os.StrictMode.ThreadPolicy threadpolicy = StrictMode.allowThreadDiskReads();
        mClassLoader = ApplicationLoaders.getDefault().getClassLoader(s, s1, mBaseClassLoader);
        initializeJavaContextClassLoader();
        StrictMode.setThreadPolicy(threadpolicy);
_L3:
        ClassLoader classloader = mClassLoader;
        this;
        JVM INSTR monitorexit ;
        return classloader;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
label0:
        {
            if (mBaseClassLoader != null)
                break label0;
            mClassLoader = ClassLoader.getSystemClassLoader();
        }
          goto _L3
        mClassLoader = mBaseClassLoader;
          goto _L3
    }

    public String getDataDir()
    {
        return mDataDir;
    }

    public File getDataDirFile()
    {
        return mDataDirFile;
    }

    public String getLibDir()
    {
        return mLibDir;
    }

    public String getPackageName()
    {
        return mPackageName;
    }

    public IIntentReceiver getReceiverDispatcher(BroadcastReceiver broadcastreceiver, Context context, Handler handler, Instrumentation instrumentation, boolean flag)
    {
        HashMap hashmap = mReceivers;
        hashmap;
        JVM INSTR monitorenter ;
        HashMap hashmap1 = null;
        if (!flag) goto _L2; else goto _L1
_L1:
        hashmap1 = (HashMap)mReceivers.get(context);
        if (hashmap1 == null) goto _L2; else goto _L3
_L3:
        ReceiverDispatcher receiverdispatcher2 = (ReceiverDispatcher)hashmap1.get(broadcastreceiver);
        HashMap hashmap2;
        ReceiverDispatcher receiverdispatcher;
        hashmap2 = hashmap1;
        receiverdispatcher = receiverdispatcher2;
_L12:
        if (receiverdispatcher != null) goto _L5; else goto _L4
_L4:
        ReceiverDispatcher receiverdispatcher1 = new ReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, flag);
        if (!flag)
            break MISSING_BLOCK_LABEL_184;
        if (hashmap2 != null) goto _L7; else goto _L6
_L6:
        HashMap hashmap3 = new HashMap();
        mReceivers.put(context, hashmap3);
_L10:
        hashmap3.put(broadcastreceiver, receiverdispatcher1);
_L8:
        IIntentReceiver iintentreceiver;
        receiverdispatcher1.mForgotten = false;
        iintentreceiver = receiverdispatcher1.getIIntentReceiver();
        hashmap;
        JVM INSTR monitorexit ;
        return iintentreceiver;
_L5:
        receiverdispatcher.validate(context, handler);
        hashmap2;
        receiverdispatcher1 = receiverdispatcher;
          goto _L8
        Exception exception;
        exception;
_L9:
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        exception;
        hashmap2;
        receiverdispatcher;
        continue; /* Loop/switch isn't completed */
        exception;
        hashmap2;
        if (true) goto _L9; else goto _L7
_L7:
        hashmap3 = hashmap2;
          goto _L10
        hashmap2;
          goto _L8
_L2:
        hashmap2 = hashmap1;
        receiverdispatcher = null;
        if (true) goto _L12; else goto _L11
_L11:
    }

    public String getResDir()
    {
        return mResDir;
    }

    public Resources getResources(ActivityThread activitythread)
    {
        if (mResources == null)
            mResources = activitythread.getTopLevelResources(mResDir, 0, null, this);
        return mResources;
    }

    public final IServiceConnection getServiceDispatcher(ServiceConnection serviceconnection, Context context, Handler handler, int i)
    {
        HashMap hashmap = mServices;
        hashmap;
        JVM INSTR monitorenter ;
        HashMap hashmap1 = (HashMap)mServices.get(context);
        if (hashmap1 == null) goto _L2; else goto _L1
_L1:
        ServiceDispatcher servicedispatcher = (ServiceDispatcher)hashmap1.get(serviceconnection);
        ServiceDispatcher servicedispatcher1 = servicedispatcher;
_L8:
        if (servicedispatcher1 != null) goto _L4; else goto _L3
_L3:
        ServiceDispatcher servicedispatcher2 = new ServiceDispatcher(serviceconnection, context, handler, i);
        if (hashmap1 != null)
            break MISSING_BLOCK_LABEL_86;
        hashmap1 = new HashMap();
        mServices.put(context, hashmap1);
        hashmap1.put(serviceconnection, servicedispatcher2);
_L5:
        IServiceConnection iserviceconnection = servicedispatcher2.getIServiceConnection();
        hashmap;
        JVM INSTR monitorexit ;
        return iserviceconnection;
_L4:
        servicedispatcher1.validate(context, handler);
        servicedispatcher2 = servicedispatcher1;
          goto _L5
        Exception exception;
        exception;
_L6:
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        exception;
        servicedispatcher1;
        if (true) goto _L6; else goto _L2
_L2:
        servicedispatcher1 = null;
        if (true) goto _L8; else goto _L7
_L7:
    }

    public boolean isSecurityViolation()
    {
        return mSecurityViolation;
    }

    public Application makeApplication(boolean flag, Instrumentation instrumentation)
    {
        if (mApplication == null) goto _L2; else goto _L1
_L1:
        Application application = mApplication;
_L6:
        return application;
_L2:
        String s;
        application = null;
        s = mApplicationInfo.className;
        if (flag || s == null)
            s = "android.app.Application";
        ClassLoader classloader = getClassLoader();
        ContextImpl contextimpl = new ContextImpl();
        contextimpl.init(this, null, mActivityThread);
        application = mActivityThread.mInstrumentation.newApplication(classloader, s, contextimpl);
        contextimpl.setOuterContext(application);
_L4:
        mActivityThread.mAllApplications.add(application);
        mApplication = application;
        if (instrumentation == null)
            continue; /* Loop/switch isn't completed */
        try
        {
            instrumentation.callApplicationOnCreate(application);
        }
        catch (Exception exception1)
        {
            if (!instrumentation.onException(application, exception1))
                throw new RuntimeException((new StringBuilder()).append("Unable to create application ").append(application.getClass().getName()).append(": ").append(exception1.toString()).toString(), exception1);
            continue; /* Loop/switch isn't completed */
        }
        return application;
        Exception exception;
        exception;
        if (mActivityThread.mInstrumentation.onException(application, exception)) goto _L4; else goto _L3
_L3:
        throw new RuntimeException((new StringBuilder()).append("Unable to instantiate application ").append(s).append(": ").append(exception.toString()).toString(), exception);
        if (true) goto _L6; else goto _L5
_L5:
    }

    public void removeContextRegistrations(Context context, String s, String s1)
    {
        boolean flag = StrictMode.vmRegistrationLeaksEnabled();
        HashMap hashmap = (HashMap)mReceivers.remove(context);
        if (hashmap != null)
        {
            for (Iterator iterator1 = hashmap.values().iterator(); iterator1.hasNext();)
            {
                ReceiverDispatcher receiverdispatcher = (ReceiverDispatcher)iterator1.next();
                IntentReceiverLeaked intentreceiverleaked = new IntentReceiverLeaked((new StringBuilder()).append(s1).append(" ").append(s).append(" has leaked IntentReceiver ").append(receiverdispatcher.getIntentReceiver()).append(" that was ").append("originally registered here. Are you missing a ").append("call to unregisterReceiver()?").toString());
                intentreceiverleaked.setStackTrace(receiverdispatcher.getLocation().getStackTrace());
                Slog.e("ActivityThread", intentreceiverleaked.getMessage(), intentreceiverleaked);
                if (flag)
                    StrictMode.onIntentReceiverLeaked(intentreceiverleaked);
                try
                {
                    ActivityManagerNative.getDefault().unregisterReceiver(receiverdispatcher.getIIntentReceiver());
                }
                catch (RemoteException remoteexception1) { }
            }

        }
        mUnregisteredReceivers.remove(context);
        HashMap hashmap1 = (HashMap)mServices.remove(context);
        if (hashmap1 != null)
        {
            Iterator iterator = hashmap1.values().iterator();
            while (iterator.hasNext()) 
            {
                ServiceDispatcher servicedispatcher = (ServiceDispatcher)iterator.next();
                ServiceConnectionLeaked serviceconnectionleaked = new ServiceConnectionLeaked((new StringBuilder()).append(s1).append(" ").append(s).append(" has leaked ServiceConnection ").append(servicedispatcher.getServiceConnection()).append(" that was originally bound here").toString());
                serviceconnectionleaked.setStackTrace(servicedispatcher.getLocation().getStackTrace());
                Slog.e("ActivityThread", serviceconnectionleaked.getMessage(), serviceconnectionleaked);
                if (flag)
                    StrictMode.onServiceConnectionLeaked(serviceconnectionleaked);
                try
                {
                    ActivityManagerNative.getDefault().unbindService(servicedispatcher.getIServiceConnection());
                }
                catch (RemoteException remoteexception) { }
                servicedispatcher.doForget();
            }
        }
        mUnboundServices.remove(context);
    }
}
