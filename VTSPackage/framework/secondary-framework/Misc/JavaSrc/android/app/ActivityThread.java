// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.app.backup.BackupAgent;
import android.content.*;
import android.content.pm.*;
import android.content.res.*;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDebug;
import android.ddm.DdmHandleAppName;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.hardware.display.DisplayManagerGlobal;
import android.net.IConnectivityManager;
import android.net.Proxy;
import android.opengl.GLUtils;
import android.os.*;
import android.renderscript.RenderScript;
import android.util.*;
import android.view.*;
import com.android.internal.os.*;
import com.android.internal.util.Objects;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.aee.IExceptionLog;
import dalvik.system.CloseGuard;
import dalvik.system.VMRuntime;
import java.io.*;
import java.lang.ref.WeakReference;
import java.net.InetAddress;
import java.util.*;
import java.util.regex.Pattern;
import libcore.io.*;
import org.apache.harmony.xnet.provider.jsse.OpenSSLSocketImpl;

// Referenced classes of package android.app:
//            ActivityManagerNative, IActivityManager, Instrumentation, ContextImpl, 
//            Application, LoadedApk, Activity, FragmentManagerImpl, 
//            ResultInfo, ActivityManager, Service, SuperNotCalledException, 
//            QueuedWork, ANRAppManager, ApplicationPackageManager, OnActivityPausedListener, 
//            IInstrumentationWatcher, ApplicationThreadNative, RemoteServiceException

public final class ActivityThread
{
    static final class ActivityClientRecord
    {

        Activity activity;
        ActivityInfo activityInfo;
        boolean autoStopProfiler;
        CompatibilityInfo compatInfo;
        Configuration createdConfig;
        String embeddedID;
        boolean hideForNow;
        int ident;
        Intent intent;
        boolean isForward;
        Activity.NonConfigurationInstances lastNonConfigurationInstances;
        View mPendingRemoveWindow;
        WindowManager mPendingRemoveWindowManager;
        Configuration newConfig;
        ActivityClientRecord nextIdle;
        boolean onlyLocalRequest;
        LoadedApk packageInfo;
        Activity parent;
        boolean paused;
        int pendingConfigChanges;
        List pendingIntents;
        List pendingResults;
        ParcelFileDescriptor profileFd;
        String profileFile;
        boolean startsNotResumed;
        Bundle state;
        boolean stopped;
        IBinder token;
        Window window;

        public boolean isPreHoneycomb()
        {
            Activity activity1 = activity;
            boolean flag = false;
            if (activity1 != null)
            {
                int i = activity.getApplicationInfo().targetSdkVersion;
                flag = false;
                if (i < 11)
                    flag = true;
            }
            return flag;
        }

        public String toString()
        {
            ComponentName componentname;
            if (intent != null)
                componentname = intent.getComponent();
            else
                componentname = null;
            StringBuilder stringbuilder = (new StringBuilder()).append("ActivityRecord{").append(Integer.toHexString(System.identityHashCode(this))).append(" token=").append(token).append(" ");
            String s;
            if (componentname == null)
                s = "no component name";
            else
                s = componentname.toShortString();
            return stringbuilder.append(s).append("}").toString();
        }

        ActivityClientRecord()
        {
            parent = null;
            embeddedID = null;
            paused = false;
            stopped = false;
            hideForNow = false;
            nextIdle = null;
        }
    }

    static final class AppBindData
    {

        ApplicationInfo appInfo;
        CompatibilityInfo compatInfo;
        Configuration config;
        int debugMode;
        boolean enableOpenGlTrace;
        LoadedApk info;
        boolean initAutoStopProfiler;
        ParcelFileDescriptor initProfileFd;
        String initProfileFile;
        Bundle instrumentationArgs;
        ComponentName instrumentationName;
        IInstrumentationWatcher instrumentationWatcher;
        boolean persistent;
        String processName;
        List providers;
        boolean restrictedBackupMode;

        public String toString()
        {
            return (new StringBuilder()).append("AppBindData{appInfo=").append(appInfo).append("}").toString();
        }

    }

    private class ApplicationThread extends ApplicationThreadNative
    {

        private static final int ACTIVITY_THREAD_CHECKIN_VERSION = 1;
        private static final String DB_INFO_FORMAT = "  %8s %8s %14s %14s  %s";
        private static final String HEAP_COLUMN = "%13s %8s %8s %8s %8s %8s %8s";
        private static final String ONE_COUNT_COLUMN = "%21s %8d";
        private static final String TWO_COUNT_COLUMNS = "%21s %8d %21s %8d";
        final ActivityThread this$0;

        private android.os.Debug.MemoryInfo dumpMemInfo(PrintWriter printwriter, boolean flag, boolean flag1)
        {
            long l = Debug.getNativeHeapSize() / 1024L;
            long l1 = Debug.getNativeHeapAllocatedSize() / 1024L;
            long l2 = Debug.getNativeHeapFreeSize() / 1024L;
            android.os.Debug.MemoryInfo memoryinfo = new android.os.Debug.MemoryInfo();
            Debug.getMemoryInfo(memoryinfo);
            if (flag1)
            {
                Runtime runtime = Runtime.getRuntime();
                long l3 = runtime.totalMemory() / 1024L;
                long l4 = runtime.freeMemory() / 1024L;
                long l5 = l3 - l4;
                long l6 = ViewDebug.getViewInstanceCount();
                long l7 = ViewDebug.getViewRootImplCount();
                long l8 = Debug.countInstancesOfClass(android/app/ContextImpl);
                long l9 = Debug.countInstancesOfClass(android/app/Activity);
                int i = AssetManager.getGlobalAssetCount();
                int j = AssetManager.getGlobalAssetManagerCount();
                int k = Debug.getBinderLocalObjectCount();
                int i1 = Debug.getBinderProxyObjectCount();
                int j1 = Debug.getBinderDeathObjectCount();
                long l10 = Debug.countInstancesOfClass(org/apache/harmony/xnet/provider/jsse/OpenSSLSocketImpl);
                android.database.sqlite.SQLiteDebug.PagerStats pagerstats = SQLiteDebug.getDatabaseInfo();
                if (flag)
                {
                    String s4;
                    if (mBoundApplication != null)
                        s4 = mBoundApplication.processName;
                    else
                        s4 = "unknown";
                    printwriter.print(1);
                    printwriter.print(',');
                    printwriter.print(Process.myPid());
                    printwriter.print(',');
                    printwriter.print(s4);
                    printwriter.print(',');
                    printwriter.print(l);
                    printwriter.print(',');
                    printwriter.print(l3);
                    printwriter.print(',');
                    printwriter.print("N/A,");
                    printwriter.print(l + l3);
                    printwriter.print(',');
                    printwriter.print(l1);
                    printwriter.print(',');
                    printwriter.print(l5);
                    printwriter.print(',');
                    printwriter.print("N/A,");
                    printwriter.print(l1 + l5);
                    printwriter.print(',');
                    printwriter.print(l2);
                    printwriter.print(',');
                    printwriter.print(l4);
                    printwriter.print(',');
                    printwriter.print("N/A,");
                    printwriter.print(l2 + l4);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativePss);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.dalvikPss);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.otherPss);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativePss + memoryinfo.dalvikPss + memoryinfo.otherPss);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativeSharedDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.dalvikSharedDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.otherSharedDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativeSharedDirty + memoryinfo.dalvikSharedDirty + memoryinfo.otherSharedDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativePrivateDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.dalvikPrivateDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.otherPrivateDirty);
                    printwriter.print(',');
                    printwriter.print(memoryinfo.nativePrivateDirty + memoryinfo.dalvikPrivateDirty + memoryinfo.otherPrivateDirty);
                    printwriter.print(',');
                    printwriter.print(l6);
                    printwriter.print(',');
                    printwriter.print(l7);
                    printwriter.print(',');
                    printwriter.print(l8);
                    printwriter.print(',');
                    printwriter.print(l9);
                    printwriter.print(',');
                    printwriter.print(i);
                    printwriter.print(',');
                    printwriter.print(j);
                    printwriter.print(',');
                    printwriter.print(k);
                    printwriter.print(',');
                    printwriter.print(i1);
                    printwriter.print(',');
                    printwriter.print(j1);
                    printwriter.print(',');
                    printwriter.print(l10);
                    printwriter.print(',');
                    printwriter.print(pagerstats.memoryUsed / 1024);
                    printwriter.print(',');
                    printwriter.print(pagerstats.memoryUsed / 1024);
                    printwriter.print(',');
                    printwriter.print(pagerstats.pageCacheOverflow / 1024);
                    printwriter.print(',');
                    printwriter.print(pagerstats.largestMemAlloc / 1024);
                    int k3 = 0;
                    do
                    {
                        int i4 = pagerstats.dbStats.size();
                        if (k3 < i4)
                        {
                            android.database.sqlite.SQLiteDebug.DbStats dbstats1 = (android.database.sqlite.SQLiteDebug.DbStats)pagerstats.dbStats.get(k3);
                            printwriter.print(',');
                            printwriter.print(dbstats1.dbName);
                            printwriter.print(',');
                            printwriter.print(dbstats1.pageSize);
                            printwriter.print(',');
                            printwriter.print(dbstats1.dbSize);
                            printwriter.print(',');
                            printwriter.print(dbstats1.lookaside);
                            printwriter.print(',');
                            printwriter.print(dbstats1.cache);
                            printwriter.print(',');
                            printwriter.print(dbstats1.cache);
                            k3++;
                        } else
                        {
                            printwriter.println();
                            return memoryinfo;
                        }
                    } while (true);
                }
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", new Object[] {
                    "", "", "Shared", "Private", "Heap", "Heap", "Heap"
                });
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", new Object[] {
                    "", "Pss", "Dirty", "Dirty", "Size", "Alloc", "Free"
                });
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", new Object[] {
                    "", "------", "------", "------", "------", "------", "------"
                });
                Object aobj[] = new Object[7];
                aobj[0] = "Native";
                aobj[1] = Integer.valueOf(memoryinfo.nativePss);
                aobj[2] = Integer.valueOf(memoryinfo.nativeSharedDirty);
                aobj[3] = Integer.valueOf(memoryinfo.nativePrivateDirty);
                aobj[4] = Long.valueOf(l);
                aobj[5] = Long.valueOf(l1);
                aobj[6] = Long.valueOf(l2);
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", aobj);
                Object aobj1[] = new Object[7];
                aobj1[0] = "Dalvik";
                aobj1[1] = Integer.valueOf(memoryinfo.dalvikPss);
                aobj1[2] = Integer.valueOf(memoryinfo.dalvikSharedDirty);
                aobj1[3] = Integer.valueOf(memoryinfo.dalvikPrivateDirty);
                aobj1[4] = Long.valueOf(l3);
                aobj1[5] = Long.valueOf(l5);
                aobj1[6] = Long.valueOf(l4);
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", aobj1);
                int k1 = memoryinfo.otherPss;
                int i2 = memoryinfo.otherSharedDirty;
                int j2 = memoryinfo.otherPrivateDirty;
                for (int k2 = 0; k2 < 9; k2++)
                {
                    Object aobj13[] = new Object[7];
                    aobj13[0] = android.os.Debug.MemoryInfo.getOtherLabel(k2);
                    aobj13[1] = Integer.valueOf(memoryinfo.getOtherPss(k2));
                    aobj13[2] = Integer.valueOf(memoryinfo.getOtherSharedDirty(k2));
                    aobj13[3] = Integer.valueOf(memoryinfo.getOtherPrivateDirty(k2));
                    aobj13[4] = "";
                    aobj13[5] = "";
                    aobj13[6] = "";
                    printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", aobj13);
                    k1 -= memoryinfo.getOtherPss(k2);
                    i2 -= memoryinfo.getOtherSharedDirty(k2);
                    j2 -= memoryinfo.getOtherPrivateDirty(k2);
                }

                Object aobj2[] = new Object[7];
                aobj2[0] = "Unknown";
                aobj2[1] = Integer.valueOf(k1);
                aobj2[2] = Integer.valueOf(i2);
                aobj2[3] = Integer.valueOf(j2);
                aobj2[4] = "";
                aobj2[5] = "";
                aobj2[6] = "";
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", aobj2);
                Object aobj3[] = new Object[7];
                aobj3[0] = "TOTAL";
                aobj3[1] = Integer.valueOf(memoryinfo.getTotalPss());
                aobj3[2] = Integer.valueOf(memoryinfo.getTotalSharedDirty());
                aobj3[3] = Integer.valueOf(memoryinfo.getTotalPrivateDirty());
                aobj3[4] = Long.valueOf(l + l3);
                aobj3[5] = Long.valueOf(l1 + l5);
                aobj3[6] = Long.valueOf(l2 + l4);
                printRow(printwriter, "%13s %8s %8s %8s %8s %8s %8s", aobj3);
                printwriter.println(" ");
                printwriter.println(" Objects");
                Object aobj4[] = new Object[4];
                aobj4[0] = "Views:";
                aobj4[1] = Long.valueOf(l6);
                aobj4[2] = "ViewRootImpl:";
                aobj4[3] = Long.valueOf(l7);
                printRow(printwriter, "%21s %8d %21s %8d", aobj4);
                Object aobj5[] = new Object[4];
                aobj5[0] = "AppContexts:";
                aobj5[1] = Long.valueOf(l8);
                aobj5[2] = "Activities:";
                aobj5[3] = Long.valueOf(l9);
                printRow(printwriter, "%21s %8d %21s %8d", aobj5);
                Object aobj6[] = new Object[4];
                aobj6[0] = "Assets:";
                aobj6[1] = Integer.valueOf(i);
                aobj6[2] = "AssetManagers:";
                aobj6[3] = Integer.valueOf(j);
                printRow(printwriter, "%21s %8d %21s %8d", aobj6);
                Object aobj7[] = new Object[4];
                aobj7[0] = "Local Binders:";
                aobj7[1] = Integer.valueOf(k);
                aobj7[2] = "Proxy Binders:";
                aobj7[3] = Integer.valueOf(i1);
                printRow(printwriter, "%21s %8d %21s %8d", aobj7);
                Object aobj8[] = new Object[2];
                aobj8[0] = "Death Recipients:";
                aobj8[1] = Integer.valueOf(j1);
                printRow(printwriter, "%21s %8d", aobj8);
                Object aobj9[] = new Object[2];
                aobj9[0] = "OpenSSL Sockets:";
                aobj9[1] = Long.valueOf(l10);
                printRow(printwriter, "%21s %8d", aobj9);
                printwriter.println(" ");
                printwriter.println(" SQL");
                Object aobj10[] = new Object[2];
                aobj10[0] = "MEMORY_USED:";
                aobj10[1] = Integer.valueOf(pagerstats.memoryUsed / 1024);
                printRow(printwriter, "%21s %8d", aobj10);
                Object aobj11[] = new Object[4];
                aobj11[0] = "PAGECACHE_OVERFLOW:";
                aobj11[1] = Integer.valueOf(pagerstats.pageCacheOverflow / 1024);
                aobj11[2] = "MALLOC_SIZE:";
                aobj11[3] = Integer.valueOf(pagerstats.largestMemAlloc / 1024);
                printRow(printwriter, "%21s %8d %21s %8d", aobj11);
                printwriter.println(" ");
                int i3 = pagerstats.dbStats.size();
                if (i3 > 0)
                {
                    printwriter.println(" DATABASES");
                    printRow(printwriter, "  %8s %8s %14s %14s  %s", new Object[] {
                        "pgsz", "dbsz", "Lookaside(b)", "cache", "Dbname"
                    });
                    for (int j3 = 0; j3 < i3; j3++)
                    {
                        android.database.sqlite.SQLiteDebug.DbStats dbstats = (android.database.sqlite.SQLiteDebug.DbStats)pagerstats.dbStats.get(j3);
                        Object aobj12[] = new Object[5];
                        String s1;
                        if (dbstats.pageSize > 0L)
                            s1 = String.valueOf(dbstats.pageSize);
                        else
                            s1 = " ";
                        aobj12[0] = s1;
                        String s2;
                        if (dbstats.dbSize > 0L)
                            s2 = String.valueOf(dbstats.dbSize);
                        else
                            s2 = " ";
                        aobj12[1] = s2;
                        String s3;
                        if (dbstats.lookaside > 0)
                            s3 = String.valueOf(dbstats.lookaside);
                        else
                            s3 = " ";
                        aobj12[2] = s3;
                        aobj12[3] = dbstats.cache;
                        aobj12[4] = dbstats.dbName;
                        printRow(printwriter, "  %8s %8s %14s %14s  %s", aobj12);
                    }

                }
                String s = AssetManager.getAssetAllocations();
                if (s != null)
                {
                    printwriter.println(" ");
                    printwriter.println(" Asset Allocations");
                    printwriter.print(s);
                    return memoryinfo;
                }
            }
            return memoryinfo;
        }

        private transient void printRow(PrintWriter printwriter, String s, Object aobj[])
        {
            printwriter.println(String.format(s, aobj));
        }

        private void updatePendingConfiguration(Configuration configuration)
        {
            synchronized (mPackages)
            {
                if (mPendingConfiguration == null || mPendingConfiguration.isOtherSeqNewer(configuration))
                    mPendingConfiguration = configuration;
            }
            return;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void ResetSL()
        {
            queueOrSendMessage(144, null);
        }

        public final void bindApplication(String s, ApplicationInfo applicationinfo, List list, ComponentName componentname, String s1, ParcelFileDescriptor parcelfiledescriptor, boolean flag, 
                Bundle bundle, IInstrumentationWatcher iinstrumentationwatcher, int i, boolean flag1, boolean flag2, boolean flag3, Configuration configuration, 
                CompatibilityInfo compatibilityinfo, Map map, Bundle bundle1)
        {
            if (map != null)
                ServiceManager.initServiceCache(map);
            setCoreSettings(bundle1);
            AppBindData appbinddata = new AppBindData();
            appbinddata.processName = s;
            appbinddata.appInfo = applicationinfo;
            appbinddata.providers = list;
            appbinddata.instrumentationName = componentname;
            appbinddata.instrumentationArgs = bundle;
            appbinddata.instrumentationWatcher = iinstrumentationwatcher;
            appbinddata.debugMode = i;
            appbinddata.enableOpenGlTrace = flag1;
            appbinddata.restrictedBackupMode = flag2;
            appbinddata.persistent = flag3;
            appbinddata.config = configuration;
            appbinddata.compatInfo = compatibilityinfo;
            appbinddata.initProfileFile = s1;
            appbinddata.initProfileFd = parcelfiledescriptor;
            appbinddata.initAutoStopProfiler = false;
            queueOrSendMessage(110, appbinddata);
        }

        public void clearDnsCache()
        {
            InetAddress.clearDnsCache();
        }

        public void dispatchPackageBroadcast(int i, String as[])
        {
            queueOrSendMessage(133, as, i);
        }

        public void dumpActivity(FileDescriptor filedescriptor, IBinder ibinder, String s, String as[])
        {
            DumpComponentInfo dumpcomponentinfo = new DumpComponentInfo();
            try
            {
                dumpcomponentinfo.fd = ParcelFileDescriptor.dup(filedescriptor);
                dumpcomponentinfo.token = ibinder;
                dumpcomponentinfo.prefix = s;
                dumpcomponentinfo.args = as;
                queueOrSendMessage(136, dumpcomponentinfo);
                return;
            }
            catch (IOException ioexception)
            {
                Slog.w("ActivityThread", "dumpActivity failed", ioexception);
            }
        }

        public void dumpDbInfo(FileDescriptor filedescriptor, String as[])
        {
            PrintWriter printwriter = new PrintWriter(new FileOutputStream(filedescriptor));
            SQLiteDebug.dump(new PrintWriterPrinter(printwriter), as);
            printwriter.flush();
        }

        public void dumpGfxInfo(FileDescriptor filedescriptor, String as[])
        {
            dumpGraphicsInfo(filedescriptor);
            WindowManagerGlobal.getInstance().dumpGfxInfo(filedescriptor);
        }

        public void dumpHeap(boolean flag, String s, ParcelFileDescriptor parcelfiledescriptor)
        {
            DumpHeapData dumpheapdata = new DumpHeapData();
            dumpheapdata.path = s;
            dumpheapdata.fd = parcelfiledescriptor;
            ActivityThread activitythread = ActivityThread.this;
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            activitythread.queueOrSendMessage(135, dumpheapdata, i);
        }

        public android.os.Debug.MemoryInfo dumpMemInfo(FileDescriptor filedescriptor, boolean flag, boolean flag1, String as[])
        {
            PrintWriter printwriter = new PrintWriter(new FileOutputStream(filedescriptor));
            android.os.Debug.MemoryInfo memoryinfo = dumpMemInfo(printwriter, flag, flag1);
            printwriter.flush();
            return memoryinfo;
            Exception exception;
            exception;
            printwriter.flush();
            throw exception;
        }

        public String dumpMessageHistory()
        {
            return ANRAppManager.dumpMessageHistory();
        }

        public void dumpProvider(FileDescriptor filedescriptor, IBinder ibinder, String as[])
        {
            DumpComponentInfo dumpcomponentinfo = new DumpComponentInfo();
            try
            {
                dumpcomponentinfo.fd = ParcelFileDescriptor.dup(filedescriptor);
                dumpcomponentinfo.token = ibinder;
                dumpcomponentinfo.args = as;
                queueOrSendMessage(141, dumpcomponentinfo);
                return;
            }
            catch (IOException ioexception)
            {
                Slog.w("ActivityThread", "dumpProvider failed", ioexception);
            }
        }

        public void dumpService(FileDescriptor filedescriptor, IBinder ibinder, String as[])
        {
            DumpComponentInfo dumpcomponentinfo = new DumpComponentInfo();
            try
            {
                dumpcomponentinfo.fd = ParcelFileDescriptor.dup(filedescriptor);
                dumpcomponentinfo.token = ibinder;
                dumpcomponentinfo.args = as;
                queueOrSendMessage(123, dumpcomponentinfo);
                return;
            }
            catch (IOException ioexception)
            {
                Slog.w("ActivityThread", "dumpService failed", ioexception);
            }
        }

        public void enableLooperLog()
        {
            ActivityThread.enableLooperLog();
        }

        public void getMemoryInfo(android.os.Debug.MemoryInfo memoryinfo)
        {
            Debug.getMemoryInfo(memoryinfo);
        }

        public void processInBackground()
        {
            mH.removeMessages(120);
            mH.sendMessage(mH.obtainMessage(120));
        }

        public void profilerControl(boolean flag, String s, ParcelFileDescriptor parcelfiledescriptor, int i)
        {
            ProfilerControlData profilercontroldata = new ProfilerControlData();
            profilercontroldata.path = s;
            profilercontroldata.fd = parcelfiledescriptor;
            ActivityThread activitythread = ActivityThread.this;
            int j;
            if (flag)
                j = 1;
            else
                j = 0;
            activitythread.queueOrSendMessage(127, profilercontroldata, j, i);
        }

        public void requestThumbnail(IBinder ibinder)
        {
            queueOrSendMessage(117, ibinder);
        }

        public void scheduleActivityConfigurationChanged(IBinder ibinder)
        {
            queueOrSendMessage(125, ibinder);
        }

        public final void scheduleBindService(IBinder ibinder, Intent intent, boolean flag)
        {
            BindServiceData bindservicedata = new BindServiceData();
            bindservicedata.token = ibinder;
            bindservicedata.intent = intent;
            bindservicedata.rebind = flag;
            queueOrSendMessage(121, bindservicedata);
        }

        public void scheduleConfigurationChanged(Configuration configuration)
        {
            updatePendingConfiguration(configuration);
            queueOrSendMessage(118, configuration);
        }

        public void scheduleCrash(String s)
        {
            queueOrSendMessage(134, s);
        }

        public final void scheduleCreateBackupAgent(ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo, int i)
        {
            CreateBackupAgentData createbackupagentdata = new CreateBackupAgentData();
            createbackupagentdata.appInfo = applicationinfo;
            createbackupagentdata.compatInfo = compatibilityinfo;
            createbackupagentdata.backupMode = i;
            queueOrSendMessage(128, createbackupagentdata);
        }

        public final void scheduleCreateService(IBinder ibinder, ServiceInfo serviceinfo, CompatibilityInfo compatibilityinfo)
        {
            CreateServiceData createservicedata = new CreateServiceData();
            createservicedata.token = ibinder;
            createservicedata.info = serviceinfo;
            createservicedata.compatInfo = compatibilityinfo;
            queueOrSendMessage(114, createservicedata);
        }

        public final void scheduleDestroyActivity(IBinder ibinder, boolean flag, int i)
        {
            ActivityThread activitythread = ActivityThread.this;
            int j;
            if (flag)
                j = 1;
            else
                j = 0;
            activitythread.queueOrSendMessage(109, ibinder, j, i);
        }

        public final void scheduleDestroyBackupAgent(ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo)
        {
            CreateBackupAgentData createbackupagentdata = new CreateBackupAgentData();
            createbackupagentdata.appInfo = applicationinfo;
            createbackupagentdata.compatInfo = compatibilityinfo;
            queueOrSendMessage(129, createbackupagentdata);
        }

        public final void scheduleExit()
        {
            queueOrSendMessage(111, null);
        }

        public final void scheduleLaunchActivity(Intent intent, IBinder ibinder, int i, ActivityInfo activityinfo, Configuration configuration, CompatibilityInfo compatibilityinfo, Bundle bundle, 
                List list, List list1, boolean flag, boolean flag1, String s, ParcelFileDescriptor parcelfiledescriptor, boolean flag2)
        {
            ActivityClientRecord activityclientrecord = new ActivityClientRecord();
            activityclientrecord.token = ibinder;
            activityclientrecord.ident = i;
            activityclientrecord.intent = intent;
            activityclientrecord.activityInfo = activityinfo;
            activityclientrecord.compatInfo = compatibilityinfo;
            activityclientrecord.state = bundle;
            activityclientrecord.pendingResults = list;
            activityclientrecord.pendingIntents = list1;
            activityclientrecord.startsNotResumed = flag;
            activityclientrecord.isForward = flag1;
            activityclientrecord.profileFile = s;
            activityclientrecord.profileFd = parcelfiledescriptor;
            activityclientrecord.autoStopProfiler = flag2;
            updatePendingConfiguration(configuration);
            queueOrSendMessage(100, activityclientrecord);
        }

        public void scheduleLowMemory()
        {
            queueOrSendMessage(124, null);
        }

        public final void scheduleNewIntent(List list, IBinder ibinder)
        {
            NewIntentData newintentdata = new NewIntentData();
            newintentdata.intents = list;
            newintentdata.token = ibinder;
            queueOrSendMessage(112, newintentdata);
        }

        public final void schedulePauseActivity(IBinder ibinder, boolean flag, boolean flag1, int i)
        {
            ActivityThread activitythread = ActivityThread.this;
            byte byte0;
            if (flag)
                byte0 = 102;
            else
                byte0 = 101;
            int j;
            if (flag1)
                j = 1;
            else
                j = 0;
            activitythread.queueOrSendMessage(byte0, ibinder, j, i);
        }

        public final void scheduleReceiver(Intent intent, ActivityInfo activityinfo, CompatibilityInfo compatibilityinfo, int i, String s, Bundle bundle, boolean flag, 
                int j)
        {
            ReceiverData receiverdata = new ReceiverData(intent, i, s, bundle, flag, false, mAppThread.asBinder(), j);
            receiverdata.info = activityinfo;
            receiverdata.compatInfo = compatibilityinfo;
            queueOrSendMessage(113, receiverdata);
        }

        public void scheduleRegisteredReceiver(IIntentReceiver iintentreceiver, Intent intent, int i, String s, Bundle bundle, boolean flag, boolean flag1, 
                int j)
            throws RemoteException
        {
            iintentreceiver.performReceive(intent, i, s, bundle, flag, flag1, j);
        }

        public final void scheduleRelaunchActivity(IBinder ibinder, List list, List list1, int i, boolean flag, Configuration configuration)
        {
            requestRelaunchActivity(ibinder, list, list1, i, flag, configuration, true);
        }

        public final void scheduleResumeActivity(IBinder ibinder, boolean flag)
        {
            ActivityThread activitythread = ActivityThread.this;
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            activitythread.queueOrSendMessage(107, ibinder, i);
        }

        public final void scheduleSendResult(IBinder ibinder, List list)
        {
            ResultData resultdata = new ResultData();
            resultdata.token = ibinder;
            resultdata.results = list;
            queueOrSendMessage(108, resultdata);
        }

        public final void scheduleServiceArgs(IBinder ibinder, boolean flag, int i, int j, Intent intent)
        {
            ServiceArgsData serviceargsdata = new ServiceArgsData();
            serviceargsdata.token = ibinder;
            serviceargsdata.taskRemoved = flag;
            serviceargsdata.startId = i;
            serviceargsdata.flags = j;
            serviceargsdata.args = intent;
            queueOrSendMessage(115, serviceargsdata);
        }

        public final void scheduleSleeping(IBinder ibinder, boolean flag)
        {
            ActivityThread activitythread = ActivityThread.this;
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            activitythread.queueOrSendMessage(137, ibinder, i);
        }

        public final void scheduleStopActivity(IBinder ibinder, boolean flag, int i)
        {
            ActivityThread activitythread = ActivityThread.this;
            byte byte0;
            if (flag)
                byte0 = 103;
            else
                byte0 = 104;
            activitythread.queueOrSendMessage(byte0, ibinder, 0, i);
        }

        public final void scheduleStopService(IBinder ibinder)
        {
            queueOrSendMessage(116, ibinder);
        }

        public final void scheduleSuicide()
        {
            queueOrSendMessage(130, null);
        }

        public void scheduleTrimMemory(int i)
        {
            queueOrSendMessage(140, null, i);
        }

        public final void scheduleUnbindService(IBinder ibinder, Intent intent)
        {
            BindServiceData bindservicedata = new BindServiceData();
            bindservicedata.token = ibinder;
            bindservicedata.intent = intent;
            queueOrSendMessage(122, bindservicedata);
        }

        public final void scheduleWindowVisibility(IBinder ibinder, boolean flag)
        {
            ActivityThread activitythread = ActivityThread.this;
            byte byte0;
            if (flag)
                byte0 = 105;
            else
                byte0 = 106;
            activitythread.queueOrSendMessage(byte0, ibinder);
        }

        public void setCoreSettings(Bundle bundle)
        {
            queueOrSendMessage(138, bundle);
        }

        public void setHttpProxy(String s, String s1, String s2)
        {
            Proxy.setHttpProxySystemProperty(s, s1, s2);
        }

        public void setSchedulingGroup(int i)
        {
            try
            {
                Process.setProcessGroup(Process.myPid(), i);
                return;
            }
            catch (Exception exception)
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Failed setting process group to ").append(i).toString(), exception);
            }
        }

        public void setTrimMemoryFlagEx()
        {
            queueOrSendMessage(143, null);
        }

        public void unstableProviderDied(IBinder ibinder)
        {
            queueOrSendMessage(142, ibinder);
        }

        public void updatePackageCompatibilityInfo(String s, CompatibilityInfo compatibilityinfo)
        {
            UpdateCompatibilityData updatecompatibilitydata = new UpdateCompatibilityData();
            updatecompatibilitydata.pkg = s;
            updatecompatibilitydata.info = compatibilityinfo;
            queueOrSendMessage(139, updatecompatibilitydata);
        }

        public void updateTimeZone()
        {
            TimeZone.setDefault(null);
        }

        private ApplicationThread()
        {
            this$0 = ActivityThread.this;
            super();
        }

    }

    static final class BindServiceData
    {

        Intent intent;
        boolean rebind;
        IBinder token;

        public String toString()
        {
            return (new StringBuilder()).append("BindServiceData{token=").append(token).append(" intent=").append(intent).append("}").toString();
        }

    }

    static final class ContextCleanupInfo
    {

        ContextImpl context;
        String what;
        String who;

    }

    static final class CreateBackupAgentData
    {

        ApplicationInfo appInfo;
        int backupMode;
        CompatibilityInfo compatInfo;

        public String toString()
        {
            return (new StringBuilder()).append("CreateBackupAgentData{appInfo=").append(appInfo).append(" backupAgent=").append(appInfo.backupAgentName).append(" mode=").append(backupMode).append("}").toString();
        }

    }

    static final class CreateServiceData
    {

        CompatibilityInfo compatInfo;
        ServiceInfo info;
        Intent intent;
        IBinder token;

        public String toString()
        {
            return (new StringBuilder()).append("CreateServiceData{token=").append(token).append(" className=").append(((ComponentInfo) (info)).name).append(" packageName=").append(info.packageName).append(" intent=").append(intent).append("}").toString();
        }

    }

    private class DropBoxReporter
        implements libcore.io.DropBox.Reporter
    {

        private DropBoxManager dropBox;
        final ActivityThread this$0;

        public void addData(String s, byte abyte0[], int i)
        {
            dropBox.addData(s, abyte0, i);
        }

        public void addText(String s, String s1)
        {
            dropBox.addText(s, s1);
        }

        public DropBoxReporter()
        {
            this$0 = ActivityThread.this;
            super();
            dropBox = (DropBoxManager)getSystemContext().getSystemService("dropbox");
        }
    }

    static final class DumpComponentInfo
    {

        String args[];
        ParcelFileDescriptor fd;
        String prefix;
        IBinder token;

    }

    static final class DumpHeapData
    {

        ParcelFileDescriptor fd;
        String path;

    }

    private static class EventLoggingReporter
        implements libcore.io.EventLogger.Reporter
    {

        public transient void report(int i, Object aobj[])
        {
            EventLog.writeEvent(i, aobj);
        }

        private EventLoggingReporter()
        {
        }

    }

    final class GcIdler
        implements android.os.MessageQueue.IdleHandler
    {

        final ActivityThread this$0;

        public final boolean queueIdle()
        {
            doGcIfNeeded();
            return false;
        }

        GcIdler()
        {
            this$0 = ActivityThread.this;
            super();
        }
    }

    private class H extends Handler
    {

        public static final int ACTIVITY_CONFIGURATION_CHANGED = 125;
        public static final int BIND_APPLICATION = 110;
        public static final int BIND_SERVICE = 121;
        public static final int CLEAN_UP_CONTEXT = 119;
        public static final int CONFIGURATION_CHANGED = 118;
        public static final int CREATE_BACKUP_AGENT = 128;
        public static final int CREATE_SERVICE = 114;
        public static final int DESTROY_ACTIVITY = 109;
        public static final int DESTROY_BACKUP_AGENT = 129;
        public static final int DISPATCH_PACKAGE_BROADCAST = 133;
        public static final int DUMP_ACTIVITY = 136;
        public static final int DUMP_HEAP = 135;
        public static final int DUMP_PROVIDER = 141;
        public static final int DUMP_SERVICE = 123;
        public static final int ENABLE_JIT = 132;
        public static final int EXIT_APPLICATION = 111;
        public static final int GC_WHEN_IDLE = 120;
        public static final int HIDE_WINDOW = 106;
        public static final int LAUNCH_ACTIVITY = 100;
        public static final int LOW_MEMORY = 124;
        public static final int NEW_INTENT = 112;
        public static final int PAUSE_ACTIVITY = 101;
        public static final int PAUSE_ACTIVITY_FINISHING = 102;
        public static final int PROFILER_CONTROL = 127;
        public static final int RECEIVER = 113;
        public static final int RELAUNCH_ACTIVITY = 126;
        public static final int REMOVE_PROVIDER = 131;
        public static final int REQUEST_THUMBNAIL = 117;
        public static final int RESET_SL = 144;
        public static final int RESUME_ACTIVITY = 107;
        public static final int SCHEDULE_CRASH = 134;
        public static final int SEND_RESULT = 108;
        public static final int SERVICE_ARGS = 115;
        public static final int SET_CORE_SETTINGS = 138;
        public static final int SET_TRIMMEM_FLAG_EX = 143;
        public static final int SHOW_WINDOW = 105;
        public static final int SLEEPING = 137;
        public static final int STOP_ACTIVITY_HIDE = 104;
        public static final int STOP_ACTIVITY_SHOW = 103;
        public static final int STOP_SERVICE = 116;
        public static final int SUICIDE = 130;
        public static final int TRIM_MEMORY = 140;
        public static final int UNBIND_SERVICE = 122;
        public static final int UNSTABLE_PROVIDER_DIED = 142;
        public static final int UPDATE_PACKAGE_COMPATIBILITY_INFO = 139;
        final ActivityThread this$0;

        private void maybeSnapshot()
        {
            if (mBoundApplication == null || !SamplingProfilerIntegration.isEnabled()) goto _L2; else goto _L1
_L1:
            String s;
            PackageInfo packageinfo;
            s = mBoundApplication.info.mPackageName;
            packageinfo = null;
            ContextImpl contextimpl = getSystemContext();
            if (contextimpl != null) goto _L4; else goto _L3
_L3:
            PackageManager packagemanager;
            try
            {
                Log.e("ActivityThread", "cannot get a valid context");
                return;
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.e("ActivityThread", (new StringBuilder()).append("cannot get package info for ").append(s).toString(), namenotfoundexception);
            }
              goto _L5
_L4:
            packagemanager = contextimpl.getPackageManager();
            if (packagemanager != null) goto _L7; else goto _L6
_L6:
            Log.e("ActivityThread", "cannot get a valid PackageManager");
            return;
_L5:
            SamplingProfilerIntegration.writeSnapshot(mBoundApplication.processName, packageinfo);
            return;
_L7:
            PackageInfo packageinfo1 = packagemanager.getPackageInfo(s, 1);
            packageinfo = packageinfo1;
            if (true) goto _L5; else goto _L2
_L2:
        }

        String codeToString(int i)
        {
            if (!ActivityThread.mIsUserBuild)
                switch (i)
                {
                case 144: 
                    return "RESET_SL";

                case 143: 
                    return "SET_TRIMMEM_FLAG_EX";

                case 142: 
                    return "UNSTABLE_PROVIDER_DIED";

                case 141: 
                    return "DUMP_PROVIDER";

                case 140: 
                    return "TRIM_MEMORY";

                case 139: 
                    return "UPDATE_PACKAGE_COMPATIBILITY_INFO";

                case 138: 
                    return "SET_CORE_SETTINGS";

                case 137: 
                    return "SLEEPING";

                case 136: 
                    return "DUMP_ACTIVITY";

                case 135: 
                    return "DUMP_HEAP";

                case 134: 
                    return "SCHEDULE_CRASH";

                case 133: 
                    return "DISPATCH_PACKAGE_BROADCAST";

                case 132: 
                    return "ENABLE_JIT";

                case 131: 
                    return "REMOVE_PROVIDER";

                case 130: 
                    return "SUICIDE";

                case 129: 
                    return "DESTROY_BACKUP_AGENT";

                case 128: 
                    return "CREATE_BACKUP_AGENT";

                case 127: // '\177'
                    return "PROFILER_CONTROL";

                case 126: // '~'
                    return "ACT-RELAUNCH_ACTIVITY";

                case 125: // '}'
                    return "ACT-ACTIVITY_CONFIGURATION_CHANGED";

                case 124: // '|'
                    return "LOW_MEMORY";

                case 123: // '{'
                    return "SVC-DUMP_SERVICE";

                case 122: // 'z'
                    return "SVC-UNBIND_SERVICE";

                case 121: // 'y'
                    return "SVC-BIND_SERVICE";

                case 120: // 'x'
                    return "GC_WHEN_IDLE";

                case 119: // 'w'
                    return "CLEAN_UP_CONTEXT";

                case 118: // 'v'
                    return "ACT-CONFIGURATION_CHANGED";

                case 117: // 'u'
                    return "REQUEST_THUMBNAIL";

                case 116: // 't'
                    return "SVC-STOP_SERVICE";

                case 115: // 's'
                    return "SVC-SERVICE_ARGS";

                case 114: // 'r'
                    return "SVC-CREATE_SERVICE";

                case 113: // 'q'
                    return "BDC-RECEIVER";

                case 112: // 'p'
                    return "ACT-NEW_INTENT";

                case 111: // 'o'
                    return "EXIT_APPLICATION";

                case 110: // 'n'
                    return "BIND_APPLICATION";

                case 109: // 'm'
                    return "ACT-DESTROY_ACTIVITY";

                case 108: // 'l'
                    return "SEND_RESULT";

                case 107: // 'k'
                    return "ACT-RESUME_ACTIVITY";

                case 106: // 'j'
                    return "ACT-HIDE_WINDOW";

                case 105: // 'i'
                    return "ACT-SHOW_WINDOW";

                case 104: // 'h'
                    return "ACT-STOP_ACTIVITY_HIDE";

                case 103: // 'g'
                    return "ACT-STOP_ACTIVITY_SHOW";

                case 102: // 'f'
                    return "ACT-PAUSE_ACTIVITY_FINISHING";

                case 101: // 'e'
                    return "ACT-PAUSE_ACTIVITY";

                case 100: // 'd'
                    return "ACT-LAUNCH_ACTIVITY";
                }
            return Integer.toString(i);
        }

        public void handleMessage(Message message)
        {
            boolean flag = true;
            message.what;
            JVM INSTR tableswitch 100 144: default 200
        //                       100 277
        //                       101 463
        //                       102 525
        //                       103 589
        //                       104 626
        //                       105 663
        //                       106 696
        //                       107 729
        //                       108 790
        //                       109 822
        //                       110 880
        //                       111 916
        //                       112 945
        //                       113 977
        //                       114 1013
        //                       115 1109
        //                       116 1141
        //                       117 1177
        //                       118 1209
        //                       119 1259
        //                       120 1289
        //                       121 1045
        //                       122 1077
        //                       123 1299
        //                       124 1316
        //                       125 1341
        //                       126 427
        //                       127 1373
        //                       128 1411
        //                       129 1443
        //                       130 1475
        //                       131 1484
        //                       132 1516
        //                       133 1526
        //                       134 1565
        //                       135 1580
        //                       136 1606
        //                       137 1640
        //                       138 1693
        //                       139 1725
        //                       140 1742
        //                       141 1623
        //                       142 1771
        //                       143 1789
        //                       144 1814;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25 _L26 _L27 _L28 _L29 _L30 _L31 _L32 _L33 _L34 _L35 _L36 _L37 _L38 _L39 _L40 _L41 _L42 _L43 _L44 _L45 _L46
_L1:
            if (!ActivityThread.mIsUserBuild && isDebuggableMessage(message.what))
                Slog.d("ActivityThread", (new StringBuilder()).append(codeToString(message.what)).append(" handled ").append(": ").append(message.arg1).append(" / ").append(message.obj).toString());
            return;
_L2:
            ActivityClientRecord activityclientrecord1;
            if (flag == ActivityThread.mEnableAppLaunchLog && !ActivityThread.mIsUserBuild && !ActivityThread.mTraceEnabled)
                try
                {
                    if ((new FileInputStream("/proc/mtprof/status")).read() == 51)
                    {
                        Log.v("ActivityThread", "start Profiling for empty process");
                        ActivityThread.mTraceEnabled = true;
                        Debug.startMethodTracing("/data/data/applaunch");
                    }
                }
                catch (FileNotFoundException filenotfoundexception)
                {
                    Slog.e("ActivityThread", "mtprof entry can not be found", filenotfoundexception);
                }
                catch (IOException ioexception)
                {
                    Slog.e("ActivityThread", "mtprof entry open failed", ioexception);
                }
            Trace.traceBegin(64L, "activityStart");
            activityclientrecord1 = (ActivityClientRecord)message.obj;
            activityclientrecord1.packageInfo = getPackageInfoNoCheck(((ComponentInfo) (activityclientrecord1.activityInfo)).applicationInfo, activityclientrecord1.compatInfo);
            handleLaunchActivity(activityclientrecord1, null);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L28:
            Trace.traceBegin(64L, "activityRestart");
            ActivityClientRecord activityclientrecord = (ActivityClientRecord)message.obj;
            handleRelaunchActivity(activityclientrecord);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L3:
            Trace.traceBegin(64L, "activityPause");
            ActivityThread activitythread5 = ActivityThread.this;
            IBinder ibinder4 = (IBinder)message.obj;
            if (message.arg1 == 0)
                flag = false;
            activitythread5.handlePauseActivity(ibinder4, false, flag, message.arg2);
            maybeSnapshot();
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L4:
            Trace.traceBegin(64L, "activityPause");
            ActivityThread activitythread4 = ActivityThread.this;
            IBinder ibinder3 = (IBinder)message.obj;
            int j = message.arg1;
            boolean flag2 = false;
            if (j != 0)
                flag2 = flag;
            activitythread4.handlePauseActivity(ibinder3, flag, flag2, message.arg2);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L5:
            Trace.traceBegin(64L, "activityStop");
            handleStopActivity((IBinder)message.obj, flag, message.arg2);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L6:
            Trace.traceBegin(64L, "activityStop");
            handleStopActivity((IBinder)message.obj, false, message.arg2);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L7:
            Trace.traceBegin(64L, "activityShowWindow");
            handleWindowVisibility((IBinder)message.obj, flag);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L8:
            Trace.traceBegin(64L, "activityHideWindow");
            handleWindowVisibility((IBinder)message.obj, false);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L9:
            Trace.traceBegin(64L, "activityResume");
            ActivityThread activitythread3 = ActivityThread.this;
            IBinder ibinder2 = (IBinder)message.obj;
            int i = message.arg1;
            boolean flag1 = false;
            if (i != 0)
                flag1 = flag;
            activitythread3.handleResumeActivity(ibinder2, flag, flag1, flag);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L10:
            Trace.traceBegin(64L, "activityDeliverResult");
            handleSendResult((ResultData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L11:
            Trace.traceBegin(64L, "activityDestroy");
            ActivityThread activitythread2 = ActivityThread.this;
            IBinder ibinder1 = (IBinder)message.obj;
            if (message.arg1 == 0)
                flag = false;
            activitythread2.handleDestroyActivity(ibinder1, flag, message.arg2, false);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L12:
            Trace.traceBegin(64L, "bindApplication");
            AppBindData appbinddata = (AppBindData)message.obj;
            handleBindApplication(appbinddata);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L13:
            if (mInitialApplication != null)
                mInitialApplication.onTerminate();
            Looper.myLooper().quit();
            continue; /* Loop/switch isn't completed */
_L14:
            Trace.traceBegin(64L, "activityNewIntent");
            handleNewIntent((NewIntentData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L15:
            Trace.traceBegin(64L, "broadcastReceiveComp");
            handleReceiver((ReceiverData)message.obj);
            maybeSnapshot();
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L16:
            Trace.traceBegin(64L, "serviceCreate");
            handleCreateService((CreateServiceData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L23:
            Trace.traceBegin(64L, "serviceBind");
            handleBindService((BindServiceData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L24:
            Trace.traceBegin(64L, "serviceUnbind");
            handleUnbindService((BindServiceData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L17:
            Trace.traceBegin(64L, "serviceStart");
            handleServiceArgs((ServiceArgsData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L18:
            Trace.traceBegin(64L, "serviceStop");
            handleStopService((IBinder)message.obj);
            maybeSnapshot();
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L19:
            Trace.traceBegin(64L, "requestThumbnail");
            handleRequestThumbnail((IBinder)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L20:
            Trace.traceBegin(64L, "configChanged");
            mCurDefaultDisplayDpi = ((Configuration)message.obj).densityDpi;
            handleConfigurationChanged((Configuration)message.obj, null);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L21:
            ContextCleanupInfo contextcleanupinfo = (ContextCleanupInfo)message.obj;
            contextcleanupinfo.context.performFinalCleanup(contextcleanupinfo.who, contextcleanupinfo.what);
            continue; /* Loop/switch isn't completed */
_L22:
            scheduleGcIdler();
            continue; /* Loop/switch isn't completed */
_L25:
            handleDumpService((DumpComponentInfo)message.obj);
            continue; /* Loop/switch isn't completed */
_L26:
            Trace.traceBegin(64L, "lowMemory");
            handleLowMemory();
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L27:
            Trace.traceBegin(64L, "activityConfigChanged");
            handleActivityConfigurationChanged((IBinder)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L29:
            ActivityThread activitythread1 = ActivityThread.this;
            if (message.arg1 == 0)
                flag = false;
            activitythread1.handleProfilerControl(flag, (ProfilerControlData)message.obj, message.arg2);
            continue; /* Loop/switch isn't completed */
_L30:
            Trace.traceBegin(64L, "backupCreateAgent");
            handleCreateBackupAgent((CreateBackupAgentData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L31:
            Trace.traceBegin(64L, "backupDestroyAgent");
            handleDestroyBackupAgent((CreateBackupAgentData)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L32:
            Process.killProcess(Process.myPid());
            continue; /* Loop/switch isn't completed */
_L33:
            Trace.traceBegin(64L, "providerRemove");
            completeRemoveProvider((ProviderRefCount)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L34:
            ensureJitEnabled();
            continue; /* Loop/switch isn't completed */
_L35:
            Trace.traceBegin(64L, "broadcastPackage");
            handleDispatchPackageBroadcast(message.arg1, (String[])(String[])message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L36:
            throw new RemoteServiceException((String)message.obj);
_L37:
            if (message.arg1 == 0)
                flag = false;
            ActivityThread.handleDumpHeap(flag, (DumpHeapData)message.obj);
            continue; /* Loop/switch isn't completed */
_L38:
            handleDumpActivity((DumpComponentInfo)message.obj);
            continue; /* Loop/switch isn't completed */
_L43:
            handleDumpProvider((DumpComponentInfo)message.obj);
            continue; /* Loop/switch isn't completed */
_L39:
            Trace.traceBegin(64L, "sleeping");
            ActivityThread activitythread = ActivityThread.this;
            IBinder ibinder = (IBinder)message.obj;
            if (message.arg1 == 0)
                flag = false;
            activitythread.handleSleeping(ibinder, flag);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L40:
            Trace.traceBegin(64L, "setCoreSettings");
            handleSetCoreSettings((Bundle)message.obj);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L41:
            handleUpdatePackageCompatibilityInfo((UpdateCompatibilityData)message.obj);
            continue; /* Loop/switch isn't completed */
_L42:
            Trace.traceBegin(64L, "trimMemory");
            handleTrimMemory(message.arg1);
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L44:
            handleUnstableProviderDied((IBinder)message.obj, false);
            continue; /* Loop/switch isn't completed */
_L45:
            Trace.traceBegin(64L, "setTrimMemoryFlagEx");
            handlesetTrimMemoryFlagEx();
            Trace.traceEnd(64L);
            continue; /* Loop/switch isn't completed */
_L46:
            Trace.traceBegin(64L, "reset_sl");
            Runtime.getRuntime().gc3();
            Trace.traceEnd(64L);
            if (true) goto _L1; else goto _L47
_L47:
        }

        boolean isDebuggableMessage(int i)
        {
            boolean flag = true;
            switch (i)
            {
            case 144: 
                return false;

            case 143: 
                return false;

            case 140: 
                return false;

            case 139: 
                return false;

            case 138: 
                return false;

            case 137: 
                return false;

            case 136: 
                return false;

            case 135: 
                return false;

            case 134: 
                return false;

            case 133: 
                return false;

            case 132: 
                return false;

            case 131: 
                return false;

            case 130: 
                return false;

            case 129: 
                return false;

            case 128: 
                return false;

            case 127: // '\177'
                return false;

            case 125: // '}'
                return false;

            case 123: // '{'
                return false;

            case 120: // 'x'
                return false;

            case 119: // 'w'
                return false;

            case 118: // 'v'
                return false;

            case 117: // 'u'
                return false;

            case 141: 
            case 142: 
            default:
                flag = false;
                // fall through

            case 100: // 'd'
            case 101: // 'e'
            case 102: // 'f'
            case 103: // 'g'
            case 104: // 'h'
            case 105: // 'i'
            case 106: // 'j'
            case 107: // 'k'
            case 108: // 'l'
            case 109: // 'm'
            case 110: // 'n'
            case 111: // 'o'
            case 112: // 'p'
            case 113: // 'q'
            case 114: // 'r'
            case 115: // 's'
            case 116: // 't'
            case 121: // 'y'
            case 122: // 'z'
            case 124: // '|'
            case 126: // '~'
                return flag;
            }
        }

        private H()
        {
            this$0 = ActivityThread.this;
            super();
        }

    }

    private class Idler
        implements android.os.MessageQueue.IdleHandler
    {

        final ActivityThread this$0;

        public final boolean queueIdle()
        {
            ActivityClientRecord activityclientrecord = mNewActivities;
            AppBindData appbinddata = mBoundApplication;
            boolean flag = false;
            if (appbinddata != null)
            {
                ParcelFileDescriptor parcelfiledescriptor = mProfiler.profileFd;
                flag = false;
                if (parcelfiledescriptor != null)
                {
                    boolean flag1 = mProfiler.autoStopProfiler;
                    flag = false;
                    if (flag1)
                        flag = true;
                }
            }
            if (activityclientrecord != null)
            {
                mNewActivities = null;
                IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
                do
                {
                    ActivityClientRecord activityclientrecord1;
                    if (activityclientrecord.activity != null && !activityclientrecord.activity.mFinished)
                        try
                        {
                            if (ActivityThread.mTraceEnabled)
                            {
                                ActivityThread.mTraceEnabled = false;
                                Log.v("ActivityThread", "Stop profiling after 2 seconds");
                                mH.postDelayed(new Runnable() {

                                    final Idler this$1;

                                    public void run()
                                    {
                                        Log.v("ActivityThread", "Stop profiling now!");
                                        Debug.stopMethodTracing();
                                    }

            
            {
                this$1 = Idler.this;
                super();
            }
                                }
, 2000L);
                            }
                            iactivitymanager.activityIdle(activityclientrecord.token, activityclientrecord.createdConfig, flag);
                            activityclientrecord.createdConfig = null;
                        }
                        catch (RemoteException remoteexception) { }
                    activityclientrecord1 = activityclientrecord;
                    activityclientrecord = activityclientrecord.nextIdle;
                    activityclientrecord1.nextIdle = null;
                } while (activityclientrecord != null);
            }
            if (flag)
                mProfiler.stopProfiling();
            ensureJitEnabled();
            return false;
        }

        private Idler()
        {
            this$0 = ActivityThread.this;
            super();
        }

    }

    static final class NewIntentData
    {

        List intents;
        IBinder token;

        public String toString()
        {
            return (new StringBuilder()).append("NewIntentData{intents=").append(intents).append(" token=").append(token).append("}").toString();
        }

    }

    static final class Profiler
    {

        boolean autoStopProfiler;
        boolean handlingProfiling;
        ParcelFileDescriptor profileFd;
        String profileFile;
        boolean profiling;

        public void setProfiler(String s, ParcelFileDescriptor parcelfiledescriptor)
        {
            if (!profiling)
                break MISSING_BLOCK_LABEL_16;
            if (parcelfiledescriptor == null)
                break MISSING_BLOCK_LABEL_15;
            parcelfiledescriptor.close();
            return;
            IOException ioexception1;
            if (profileFd != null)
                try
                {
                    profileFd.close();
                }
                catch (IOException ioexception) { }
            profileFile = s;
            profileFd = parcelfiledescriptor;
            return;
            ioexception1;
        }

        public void startProfiling()
        {
            if (profileFd == null || profiling)
                return;
            try
            {
                Debug.startMethodTracing(profileFile, profileFd.getFileDescriptor(), 0x800000, 0);
                profiling = true;
                return;
            }
            catch (RuntimeException runtimeexception)
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Profiling failed on path ").append(profileFile).toString());
            }
            try
            {
                profileFd.close();
                profileFd = null;
                return;
            }
            catch (IOException ioexception)
            {
                Slog.w("ActivityThread", "Failure closing profile fd", ioexception);
            }
        }

        public void stopProfiling()
        {
            if (profiling)
            {
                profiling = false;
                Debug.stopMethodTracing();
                if (profileFd != null)
                    try
                    {
                        profileFd.close();
                    }
                    catch (IOException ioexception) { }
                profileFd = null;
                profileFile = null;
            }
        }

    }

    static final class ProfilerControlData
    {

        ParcelFileDescriptor fd;
        String path;

    }

    final class ProviderClientRecord
    {

        final IActivityManager.ContentProviderHolder mHolder;
        final ContentProvider mLocalProvider;
        final String mNames[];
        final IContentProvider mProvider;
        final ActivityThread this$0;

        ProviderClientRecord(String as[], IContentProvider icontentprovider, ContentProvider contentprovider, IActivityManager.ContentProviderHolder contentproviderholder)
        {
            this$0 = ActivityThread.this;
            super();
            mNames = as;
            mProvider = icontentprovider;
            mLocalProvider = contentprovider;
            mHolder = contentproviderholder;
        }
    }

    private static final class ProviderKey
    {

        final String authority;
        final int userId;

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof ProviderKey;
            boolean flag1 = false;
            if (flag)
            {
                ProviderKey providerkey = (ProviderKey)obj;
                boolean flag2 = Objects.equal(authority, providerkey.authority);
                flag1 = false;
                if (flag2)
                {
                    int i = userId;
                    int j = providerkey.userId;
                    flag1 = false;
                    if (i == j)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public int hashCode()
        {
            int i;
            if (authority != null)
                i = authority.hashCode();
            else
                i = 0;
            return i ^ userId;
        }

        public ProviderKey(String s, int i)
        {
            authority = s;
            userId = i;
        }
    }

    private static final class ProviderRefCount
    {

        public final ProviderClientRecord client;
        public final IActivityManager.ContentProviderHolder holder;
        public boolean removePending;
        public int stableCount;
        public int unstableCount;

        ProviderRefCount(IActivityManager.ContentProviderHolder contentproviderholder, ProviderClientRecord providerclientrecord, int i, int j)
        {
            holder = contentproviderholder;
            client = providerclientrecord;
            stableCount = i;
            unstableCount = j;
        }
    }

    private final class QueryHistory
    {

        private final boolean CURSOR_LEAK_DETECTER;
        private Map recordMap;
        final ActivityThread this$0;
        private Map uriMap;

        private boolean checkAeeWarningList()
        {
            int i;
            FileInputStream fileinputstream;
            i = Process.myUid();
            fileinputstream = null;
            FileInputStream fileinputstream1 = new FileInputStream("/data/system/resmon-uid.txt");
            if (fileinputstream1 == null) goto _L2; else goto _L1
_L1:
            BufferedReader bufferedreader;
            String s;
            bufferedreader = new BufferedReader(new InputStreamReader(fileinputstream1));
            s = bufferedreader.readLine();
_L3:
            if (s == null)
                break; /* Loop/switch isn't completed */
            int j = Integer.valueOf(s).intValue();
            Exception exception;
label0:
            {
                {
                    if (i != j)
                        break label0;
                    boolean flag = true;
                    IOException ioexception2;
                    IOException ioexception3;
                    String s1;
                    IOException ioexception5;
                    if (fileinputstream1 != null)
                        try
                        {
                            fileinputstream1.close();
                        }
                        catch (IOException ioexception4) { }
                }
                return flag;
            }
            s1 = bufferedreader.readLine();
            s = s1;
            if (true) goto _L3; else goto _L2
_L2:
            if (fileinputstream1 != null)
                try
                {
                    fileinputstream1.close();
                }
                catch (IOException ioexception) { }
            return false;
            ioexception5;
_L7:
            flag = false;
            if (fileinputstream != null)
            {
                try
                {
                    fileinputstream.close();
                }
                // Misplaced declaration of an exception variable
                catch (IOException ioexception2)
                {
                    return false;
                }
                return false;
            } else
            {
                break MISSING_BLOCK_LABEL_76;
            }
            exception;
_L5:
            if (fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                // Misplaced declaration of an exception variable
                catch (IOException ioexception3) { }
            throw exception;
            exception;
            fileinputstream = fileinputstream1;
            if (true) goto _L5; else goto _L4
_L4:
            IOException ioexception1;
            ioexception1;
            fileinputstream = fileinputstream1;
            if (true) goto _L7; else goto _L6
_L6:
        }

        public boolean Add(String s, Throwable throwable, int i)
        {
            Map map = recordMap;
            map;
            JVM INSTR monitorenter ;
            if (uriMap.get(s) != null)
                break MISSING_BLOCK_LABEL_351;
            uriMap.put(s, Integer.valueOf(1));
_L5:
            if (((Integer)uriMap.get(s)).intValue() >= 5)
                Log.e("CursorLeakDetecter", (new StringBuilder()).append("PossibleCursorLeak:").append(s).append(",QueryCounter:").append(uriMap.get(s)).toString(), throwable);
            if (recordMap.get(Integer.valueOf(i)) == null)
            {
                QueryHistoryRecord queryhistoryrecord = new QueryHistoryRecord(s, throwable);
                recordMap.put(Integer.valueOf(i), queryhistoryrecord);
            }
            if (CURSOR_LEAK_DETECTER)
                Log.v("CursorLeakDetecter", (new StringBuilder()).append("Cursor Open:").append(i).append(" Total Opened Cursor Count:").append(recordMap.size()).append(".").toString());
            if (recordMap.size() != 50 && recordMap.size() != 60) goto _L2; else goto _L1
_L1:
            boolean flag;
            Log.v("CursorLeakDetecter", (new StringBuilder()).append("Total Opened Cursor Count:").append(recordMap.size()).append(".").toString());
            Dump();
            flag = checkAeeWarningList();
            if (!flag) goto _L2; else goto _L3
_L3:
            IExceptionLog iexceptionlog = (IExceptionLog)MediatekClassFactory.createInstance(com/mediatek/common/aee/IExceptionLog, new Object[0]);
            if (iexceptionlog == null) goto _L2; else goto _L4
_L4:
            Exception exception;
            try
            {
                iexceptionlog.systemreport((byte)0, "CursorLeakDetecter", (new StringBuilder()).append("Total Opened Cursor Count:").append(recordMap.size()).append(".").toString(), "/data/cursorleak/traces.txt");
            }
            catch (Exception exception1) { }
_L2:
            map;
            JVM INSTR monitorexit ;
            return true;
            uriMap.put(s, Integer.valueOf(1 + ((Integer)uriMap.get(s)).intValue()));
              goto _L5
            exception;
            map;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void Dump()
        {
            Log.v("CursorLeakDetecter", (new StringBuilder()).append("Total Opened Cursor Count:").append(recordMap.size()).append(".").toString());
            QueryHistoryRecord queryhistoryrecord;
            for (Iterator iterator = recordMap.entrySet().iterator(); iterator.hasNext(); Log.v("CursorLeakDetecter", (new StringBuilder()).append("CursorQueryHistory:").append(queryhistoryrecord.mUri).toString(), queryhistoryrecord.mStackTrace))
                queryhistoryrecord = (QueryHistoryRecord)((java.util.Map.Entry)iterator.next()).getValue();

        }

        public void Remove(int i)
        {
            Map map = recordMap;
            map;
            JVM INSTR monitorenter ;
            QueryHistoryRecord queryhistoryrecord = (QueryHistoryRecord)recordMap.get(Integer.valueOf(i));
            if (queryhistoryrecord == null)
                break MISSING_BLOCK_LABEL_47;
            if (uriMap.get(queryhistoryrecord.mUri) != null)
                break MISSING_BLOCK_LABEL_80;
            Log.e("CursorLeakDetecter", (new StringBuilder()).append("bad request for cursor:").append(i).append(".").toString());
            map;
            JVM INSTR monitorexit ;
            return;
            if (((Integer)uriMap.get(queryhistoryrecord.mUri)).intValue() != 1) goto _L2; else goto _L1
_L1:
            uriMap.remove(queryhistoryrecord.mUri);
            recordMap.remove(Integer.valueOf(i));
_L4:
            if (CURSOR_LEAK_DETECTER)
                Log.v("CursorLeakDetecter", (new StringBuilder()).append("Cursor Close:").append(i).append(" Total Opened Cursor Count:").append(recordMap.size()).append(".").toString());
            map;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            map;
            JVM INSTR monitorexit ;
            throw exception;
_L2:
            if (((Integer)uriMap.get(queryhistoryrecord.mUri)).intValue() <= 1) goto _L4; else goto _L3
_L3:
            uriMap.put(queryhistoryrecord.mUri, Integer.valueOf(-1 + ((Integer)uriMap.get(queryhistoryrecord.mUri)).intValue()));
            recordMap.remove(Integer.valueOf(i));
              goto _L4
        }

        private QueryHistory()
        {
            this$0 = ActivityThread.this;
            super();
            CURSOR_LEAK_DETECTER = Log.isLoggable("Cursor_Leak_Detecter", 2);
            recordMap = new HashMap();
            uriMap = new HashMap();
        }

    }

    private final class QueryHistoryRecord
    {

        public Throwable mStackTrace;
        public String mUri;
        final ActivityThread this$0;

        QueryHistoryRecord(String s, Throwable throwable)
        {
            this$0 = ActivityThread.this;
            super();
            mUri = s;
            mStackTrace = throwable;
        }
    }

    static final class ReceiverData extends android.content.BroadcastReceiver.PendingResult
    {

        CompatibilityInfo compatInfo;
        ActivityInfo info;
        Intent intent;

        public String toString()
        {
            return (new StringBuilder()).append("ReceiverData{intent=").append(intent).append(" packageName=").append(info.packageName).append(" resultCode=").append(getResultCode()).append(" resultData=").append(getResultData()).append(" resultExtras=").append(getResultExtras(false)).append("}").toString();
        }

        public ReceiverData(Intent intent1, int i, String s, Bundle bundle, boolean flag, boolean flag1, IBinder ibinder, 
                int j)
        {
            super(i, s, bundle, 0, flag, flag1, ibinder, j);
            intent = intent1;
        }
    }

    private static class ResourcesKey
    {

        private final int mDisplayId;
        private final int mHash;
        private final Configuration mOverrideConfiguration;
        private final String mResDir;
        private final float mScale;

        public boolean equals(Object obj)
        {
            if (obj instanceof ResourcesKey)
            {
                ResourcesKey resourceskey = (ResourcesKey)obj;
                if (mResDir.equals(resourceskey.mResDir) && mDisplayId == resourceskey.mDisplayId && (mOverrideConfiguration == resourceskey.mOverrideConfiguration || mOverrideConfiguration != null && resourceskey.mOverrideConfiguration != null && mOverrideConfiguration.equals(resourceskey.mOverrideConfiguration)) && mScale == resourceskey.mScale)
                    return true;
            }
            return false;
        }

        public int hashCode()
        {
            return mHash;
        }



        ResourcesKey(String s, int i, Configuration configuration, float f)
        {
            mResDir = s;
            mDisplayId = i;
            if (configuration != null && Configuration.EMPTY.equals(configuration))
                configuration = null;
            mOverrideConfiguration = configuration;
            mScale = f;
            int j = 31 * (31 * (527 + mResDir.hashCode()) + mDisplayId);
            int k;
            if (mOverrideConfiguration != null)
                k = mOverrideConfiguration.hashCode();
            else
                k = 0;
            mHash = 31 * (j + k) + Float.floatToIntBits(mScale);
        }
    }

    static final class ResultData
    {

        List results;
        IBinder token;

        public String toString()
        {
            return (new StringBuilder()).append("ResultData{token=").append(token).append(" results").append(results).append("}").toString();
        }

    }

    static final class ServiceArgsData
    {

        Intent args;
        int flags;
        int startId;
        boolean taskRemoved;
        IBinder token;

        public String toString()
        {
            return (new StringBuilder()).append("ServiceArgsData{token=").append(token).append(" startId=").append(startId).append(" args=").append(args).append("}").toString();
        }

    }

    private static class StopInfo
        implements Runnable
    {

        ActivityClientRecord activity;
        CharSequence description;
        Bundle state;
        Bitmap thumbnail;

        public void run()
        {
            try
            {
                ActivityManagerNative.getDefault().activityStopped(activity.token, state, thumbnail, description);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        private StopInfo()
        {
        }

    }

    static final class UpdateCompatibilityData
    {

        CompatibilityInfo info;
        String pkg;

    }


    private static final boolean DEBUG_BACKUP = false;
    public static final boolean DEBUG_BROADCAST = false;
    private static final boolean DEBUG_CONFIGURATION = false;
    private static final boolean DEBUG_MEMORY_TRIM = false;
    static final boolean DEBUG_MESSAGES = false;
    private static final boolean DEBUG_PROVIDER = false;
    private static final boolean DEBUG_RESULTS = false;
    private static final boolean DEBUG_SERVICE = false;
    static final boolean IS_USER_BUILD = false;
    private static final int LOG_ON_PAUSE_CALLED = 30021;
    private static final int LOG_ON_RESUME_CALLED = 30022;
    private static final long MIN_TIME_BETWEEN_GCS = 5000L;
    private static final Pattern PATTERN_SEMICOLON;
    private static final int SQLITE_MEM_RELEASED_EVENT_LOG_TAG = 0x124fb;
    public static final String TAG = "ActivityThread";
    private static final android.graphics.Bitmap.Config THUMBNAIL_FORMAT;
    static boolean is_trim;
    static final boolean localLOGV;
    public static boolean mBooted;
    public static boolean mEnableAppLaunchLog;
    public static boolean mEnableLooperLog;
    public static boolean mIsUserBuild;
    static ContextImpl mSystemContext;
    public static boolean mTraceEnabled;
    private static final ThreadLocal sCurrentBroadcastIntent = new ThreadLocal();
    static Handler sMainThreadHandler;
    static IPackageManager sPackageManager;
    static final ThreadLocal sThreadLocal;
    final HashMap mActiveResources = new HashMap();
    final HashMap mActivities = new HashMap();
    final ArrayList mAllApplications = new ArrayList();
    final ApplicationThread mAppThread = new ApplicationThread();
    private Bitmap mAvailThumbnailBitmap;
    final HashMap mBackupAgents = new HashMap();
    AppBindData mBoundApplication;
    Configuration mCompatConfiguration;
    Configuration mConfiguration;
    Bundle mCoreSettings;
    int mCurDefaultDisplayDpi;
    final HashMap mDefaultDisplayMetrics = new HashMap();
    boolean mDensityCompatMode;
    final GcIdler mGcIdler = new GcIdler();
    boolean mGcIdlerScheduled;
    final H mH = new H();
    Application mInitialApplication;
    Instrumentation mInstrumentation;
    String mInstrumentationAppDir;
    String mInstrumentationAppLibraryDir;
    String mInstrumentationAppPackage;
    String mInstrumentedAppDir;
    String mInstrumentedAppLibraryDir;
    boolean mJitEnabled;
    final HashMap mLocalProviders = new HashMap();
    final HashMap mLocalProvidersByName = new HashMap();
    final Looper mLooper = Looper.myLooper();
    private Configuration mMainThreadConfig;
    ActivityClientRecord mNewActivities;
    int mNumVisibleActivities;
    final HashMap mOnPauseListeners = new HashMap();
    final HashMap mPackages = new HashMap();
    Configuration mPendingConfiguration;
    Profiler mProfiler;
    final HashMap mProviderMap = new HashMap();
    final HashMap mProviderRefCountMap = new HashMap();
    private QueryHistory mQueryHistory;
    final ArrayList mRelaunchingActivities = new ArrayList();
    final HashSet mRemoveProviders = new HashSet();
    CompatibilityInfo mResCompatibilityInfo;
    Configuration mResConfiguration;
    final HashMap mResourcePackages = new HashMap();
    final HashMap mServices = new HashMap();
    boolean mSystemThread;
    private Canvas mThumbnailCanvas;
    private int mThumbnailHeight;
    private int mThumbnailWidth;

    ActivityThread()
    {
        mNewActivities = null;
        mNumVisibleActivities = 0;
        mInstrumentationAppDir = null;
        mInstrumentationAppLibraryDir = null;
        mInstrumentationAppPackage = null;
        mInstrumentedAppDir = null;
        mInstrumentedAppLibraryDir = null;
        mSystemThread = false;
        mJitEnabled = false;
        mPendingConfiguration = null;
        mGcIdlerScheduled = false;
        mCoreSettings = null;
        mMainThreadConfig = new Configuration();
        mThumbnailWidth = -1;
        mThumbnailHeight = -1;
        mAvailThumbnailBitmap = null;
        mThumbnailCanvas = null;
        mQueryHistory = new QueryHistory();
    }

    private void attach(boolean flag)
    {
        sThreadLocal.set(this);
        mSystemThread = flag;
        if (mEnableAppLaunchLog && !mIsUserBuild && !mTraceEnabled)
            try
            {
                if ((new FileInputStream("/proc/mtprof/status")).read() != 48)
                {
                    Log.v("ActivityThread", "start Profiling");
                    mTraceEnabled = true;
                    Debug.startMethodTracing("/data/data/applaunch");
                }
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                Slog.e("MTPROF", "mtprof entry can not be found!", filenotfoundexception);
            }
            catch (IOException ioexception)
            {
                Slog.e("MTPROF", "mtprof entry open failed", ioexception);
            }
        if (!flag)
        {
            ViewRootImpl.addFirstDrawHandler(new Runnable() {

                final ActivityThread this$0;

                public void run()
                {
                    ensureJitEnabled();
                }

            
            {
                this$0 = ActivityThread.this;
                super();
            }
            }
);
            DdmHandleAppName.setAppName("<pre-initialized>", UserHandle.myUserId());
            RuntimeInit.setApplicationObject(mAppThread.asBinder());
            IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
            Exception exception;
            ContextImpl contextimpl;
            Application application;
            try
            {
                logAppLaunchTime("ActivityThread", "attachApplication -> AMS");
                iactivitymanager.attachApplication(mAppThread);
            }
            catch (RemoteException remoteexception) { }
        } else
        {
            DdmHandleAppName.setAppName("system_process", UserHandle.myUserId());
            try
            {
                mInstrumentation = new Instrumentation();
                contextimpl = new ContextImpl();
                contextimpl.init(getSystemContext().mPackageInfo, null, this);
                application = Instrumentation.newApplication(android/app/Application, contextimpl);
                mAllApplications.add(application);
                mInitialApplication = application;
                application.onCreate();
            }
            // Misplaced declaration of an exception variable
            catch (Exception exception)
            {
                throw new RuntimeException((new StringBuilder()).append("Unable to instantiate Application():").append(exception.toString()).toString(), exception);
            }
        }
        DropBox.setReporter(new DropBoxReporter());
        ViewRootImpl.addConfigCallback(new ComponentCallbacks2() {

            final ActivityThread this$0;

            public void onConfigurationChanged(Configuration configuration)
            {
                synchronized (mPackages)
                {
                    if (applyConfigurationToResourcesLocked(configuration, null) && (mPendingConfiguration == null || mPendingConfiguration.isOtherSeqNewer(configuration)))
                    {
                        mPendingConfiguration = configuration;
                        queueOrSendMessage(118, configuration);
                    }
                }
                return;
                exception1;
                hashmap;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            public void onLowMemory()
            {
            }

            public void onTrimMemory(int i)
            {
            }

            
            {
                this$0 = ActivityThread.this;
                super();
            }
        }
);
    }

    static final void cleanUpPendingRemoveWindows(ActivityClientRecord activityclientrecord)
    {
        if (activityclientrecord.mPendingRemoveWindow != null)
        {
            activityclientrecord.mPendingRemoveWindowManager.removeViewImmediate(activityclientrecord.mPendingRemoveWindow);
            IBinder ibinder = activityclientrecord.mPendingRemoveWindow.getWindowToken();
            if (ibinder != null)
                WindowManagerGlobal.getInstance().closeAll(ibinder, activityclientrecord.activity.getClass().getName(), "Activity");
        }
        activityclientrecord.mPendingRemoveWindow = null;
        activityclientrecord.mPendingRemoveWindowManager = null;
    }

    private Context createBaseContextForActivity(ActivityClientRecord activityclientrecord, Activity activity)
    {
        ContextImpl contextimpl;
        Object obj;
        String s;
        contextimpl = new ContextImpl();
        contextimpl.init(activityclientrecord.packageInfo, activityclientrecord.token, this);
        contextimpl.setOuterContext(activity);
        obj = contextimpl;
        s = SystemProperties.get("debug.second-display.pkg");
        if (s == null || s.isEmpty() || !activityclientrecord.packageInfo.mPackageName.contains(s)) goto _L2; else goto _L1
_L1:
        DisplayManagerGlobal displaymanagerglobal;
        int ai[];
        int i;
        int j;
        displaymanagerglobal = DisplayManagerGlobal.getInstance();
        ai = displaymanagerglobal.getDisplayIds();
        i = ai.length;
        j = 0;
_L7:
        if (j >= i) goto _L2; else goto _L3
_L3:
        int k = ai[j];
        if (k == 0) goto _L5; else goto _L4
_L4:
        obj = contextimpl.createDisplayContext(displaymanagerglobal.getRealDisplay(k));
_L2:
        return ((Context) (obj));
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private Bitmap createThumbnailBitmap(ActivityClientRecord activityclientrecord)
    {
        Bitmap bitmap = mAvailThumbnailBitmap;
        if (bitmap != null) goto _L2; else goto _L1
_L1:
        int i = mThumbnailWidth;
        if (i >= 0) goto _L4; else goto _L3
_L3:
        int j;
        Resources resources = activityclientrecord.activity.getResources();
        j = resources.getDimensionPixelSize(0x1050001);
        mThumbnailHeight = j;
        i = resources.getDimensionPixelSize(0x1050002);
        mThumbnailWidth = i;
_L7:
        if (i <= 0 || j <= 0) goto _L2; else goto _L5
_L5:
        bitmap = Bitmap.createBitmap(activityclientrecord.activity.getResources().getDisplayMetrics(), i, j, THUMBNAIL_FORMAT);
        bitmap.eraseColor(0);
_L2:
        if (bitmap == null)
            break; /* Loop/switch isn't completed */
        Canvas canvas = mThumbnailCanvas;
        if (canvas != null)
            break MISSING_BLOCK_LABEL_127;
        canvas = new Canvas();
        mThumbnailCanvas = canvas;
        canvas.setBitmap(bitmap);
        if (activityclientrecord.activity.onCreateThumbnail(bitmap, canvas))
            break MISSING_BLOCK_LABEL_153;
        mAvailThumbnailBitmap = bitmap;
        bitmap = null;
        canvas.setBitmap(null);
        return bitmap;
_L4:
        j = mThumbnailHeight;
        if (true) goto _L7; else goto _L6
        Exception exception;
        exception;
        if (!mInstrumentation.onException(activityclientrecord.activity, exception))
            throw new RuntimeException((new StringBuilder()).append("Unable to create thumbnail of ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
        bitmap = null;
_L6:
        return bitmap;
    }

    public static ActivityThread currentActivityThread()
    {
        return (ActivityThread)sThreadLocal.get();
    }

    public static Application currentApplication()
    {
        ActivityThread activitythread = currentActivityThread();
        if (activitythread != null)
            return activitythread.mInitialApplication;
        else
            return null;
    }

    public static String currentPackageName()
    {
        ActivityThread activitythread = currentActivityThread();
        if (activitythread != null && activitythread.mBoundApplication != null)
            return activitythread.mBoundApplication.processName;
        else
            return null;
    }

    private void deliverNewIntents(ActivityClientRecord activityclientrecord, List list)
    {
        int i = list.size();
        for (int j = 0; j < i; j++)
        {
            Intent intent = (Intent)list.get(j);
            intent.setExtrasClassLoader(activityclientrecord.activity.getClassLoader());
            activityclientrecord.activity.mFragments.noteStateNotSaved();
            mInstrumentation.callActivityOnNewIntent(activityclientrecord.activity, intent);
        }

    }

    private void deliverResults(ActivityClientRecord activityclientrecord, List list)
    {
        int i = list.size();
        int j = 0;
        do
        {
            if (j >= i)
                break;
            ResultInfo resultinfo = (ResultInfo)list.get(j);
            try
            {
                if (resultinfo.mData != null)
                    resultinfo.mData.setExtrasClassLoader(activityclientrecord.activity.getClassLoader());
                activityclientrecord.activity.dispatchActivityResult(resultinfo.mResultWho, resultinfo.mRequestCode, resultinfo.mResultCode, resultinfo.mData);
            }
            catch (Exception exception)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                    throw new RuntimeException((new StringBuilder()).append("Failure delivering result ").append(resultinfo).append(" to activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
            }
            j++;
        } while (true);
    }

    private native void dumpGraphicsInfo(FileDescriptor filedescriptor);

    public static void enableLooperLog()
    {
        Log.d("ActivityThread", "Enable Looper Log");
        mEnableLooperLog = true;
    }

    private void flushDisplayMetricsLocked()
    {
        mDefaultDisplayMetrics.clear();
    }

    public static Intent getIntentBeingBroadcast()
    {
        return (Intent)sCurrentBroadcastIntent.get();
    }

    private LoadedApk getPackageInfo(ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo, ClassLoader classloader, boolean flag, boolean flag1)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        if (!flag1) goto _L2; else goto _L1
_L1:
        WeakReference weakreference = (WeakReference)mPackages.get(applicationinfo.packageName);
_L10:
        if (weakreference == null) goto _L4; else goto _L3
_L3:
        LoadedApk loadedapk = (LoadedApk)weakreference.get();
_L11:
        if (loadedapk == null) goto _L6; else goto _L5
_L5:
        if (loadedapk.mResources == null || loadedapk.mResources.getAssets().isUpToDate()) goto _L7; else goto _L6
_L6:
        if (!flag1)
            break MISSING_BLOCK_LABEL_196;
        if ((4 & applicationinfo.flags) == 0)
            break MISSING_BLOCK_LABEL_196;
        boolean flag2 = true;
_L12:
        loadedapk = new LoadedApk(this, applicationinfo, compatibilityinfo, this, classloader, flag, flag2);
        if (!flag1) goto _L9; else goto _L8
_L8:
        mPackages.put(applicationinfo.packageName, new WeakReference(loadedapk));
_L7:
        hashmap;
        JVM INSTR monitorexit ;
        return loadedapk;
_L2:
        weakreference = (WeakReference)mResourcePackages.get(applicationinfo.packageName);
          goto _L10
_L9:
        mResourcePackages.put(applicationinfo.packageName, new WeakReference(loadedapk));
          goto _L7
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        loadedapk = null;
          goto _L11
        flag2 = false;
          goto _L12
    }

    public static IPackageManager getPackageManager()
    {
        if (sPackageManager != null)
        {
            return sPackageManager;
        } else
        {
            sPackageManager = android.content.pm.IPackageManager.Stub.asInterface(ServiceManager.getService("package"));
            return sPackageManager;
        }
    }

    private void handleBindApplication(AppBindData appbinddata)
    {
        mBoundApplication = appbinddata;
        mConfiguration = new Configuration(appbinddata.config);
        mCompatConfiguration = new Configuration(appbinddata.config);
        mProfiler = new Profiler();
        mProfiler.profileFile = appbinddata.initProfileFile;
        mProfiler.profileFd = appbinddata.initProfileFd;
        mProfiler.autoStopProfiler = appbinddata.initAutoStopProfiler;
        logAppLaunchTime("ActivityThread", "handleBindApplication is called");
        Process.setArgV0(appbinddata.processName);
        DdmHandleAppName.setAppName(appbinddata.processName, UserHandle.myUserId());
        if (appbinddata.persistent && !ActivityManager.isHighEndGfx())
            HardwareRenderer.disable(false);
        if (mProfiler.profileFd != null)
            mProfiler.startProfiling();
        if (appbinddata.appInfo.targetSdkVersion <= 12)
            AsyncTask.setDefaultExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        TimeZone.setDefault(null);
        Locale.setDefault(appbinddata.config.locale);
        applyConfigurationToResourcesLocked(appbinddata.config, appbinddata.compatInfo);
        mCurDefaultDisplayDpi = appbinddata.config.densityDpi;
        applyCompatConfiguration(mCurDefaultDisplayDpi);
        appbinddata.info = getPackageInfoNoCheck(appbinddata.appInfo, appbinddata.compatInfo);
        if ((0x2000 & appbinddata.appInfo.flags) == 0)
        {
            mDensityCompatMode = true;
            Bitmap.setDefaultDensity(160);
        }
        updateDefaultDensity();
        ContextImpl contextimpl = new ContextImpl();
        contextimpl.init(appbinddata.info, null, this);
        if (!Process.isIsolated())
        {
            File file1 = contextimpl.getCacheDir();
            IBinder ibinder;
            InstrumentationInfo instrumentationinfo1;
            IConnectivityManager iconnectivitymanager;
            IActivityManager iactivitymanager;
            if (file1 != null)
            {
                System.setProperty("java.io.tmpdir", file1.getAbsolutePath());
                setupGraphicsSupport(appbinddata.info, file1);
            } else
            {
                Log.e("ActivityThread", "Unable to setupGraphicsSupport due to missing cache directory");
            }
        }
        if ((0x81 & appbinddata.appInfo.flags) != 0)
            StrictMode.conditionallyEnableDebugLogging();
        if (appbinddata.appInfo.targetSdkVersion > 9)
            StrictMode.enableDeathOnNetwork();
        if (appbinddata.debugMode != 0)
        {
            Debug.changeDebugPort(8100);
            if (appbinddata.debugMode == 2)
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Application ").append(appbinddata.info.getPackageName()).append(" is waiting for the debugger on port 8100...").toString());
                iactivitymanager = ActivityManagerNative.getDefault();
                android.os.StrictMode.ThreadPolicy threadpolicy;
                Exception exception;
                Application application;
                Exception exception1;
                Exception exception2;
                List list;
                android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
                InstrumentationInfo instrumentationinfo;
                ApplicationInfo applicationinfo;
                LoadedApk loadedapk;
                ContextImpl contextimpl1;
                Exception exception3;
                File file;
                RemoteException remoteexception;
                try
                {
                    iactivitymanager.showWaitingForDebugger(mAppThread, true);
                }
                catch (RemoteException remoteexception1) { }
                Debug.waitForDebugger();
                try
                {
                    iactivitymanager.showWaitingForDebugger(mAppThread, false);
                }
                catch (RemoteException remoteexception2) { }
            } else
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Application ").append(appbinddata.info.getPackageName()).append(" can be debugged on port 8100...").toString());
            }
        }
        if (appbinddata.enableOpenGlTrace)
            GLUtils.enableTracing();
        ibinder = ServiceManager.getService("connectivity");
        if (ibinder != null)
        {
            iconnectivitymanager = android.net.IConnectivityManager.Stub.asInterface(ibinder);
            try
            {
                Proxy.setHttpProxySystemProperty(iconnectivitymanager.getProxy());
            }
            // Misplaced declaration of an exception variable
            catch (RemoteException remoteexception) { }
        }
        if (appbinddata.instrumentationName == null) goto _L2; else goto _L1
_L1:
        instrumentationinfo1 = contextimpl.getPackageManager().getInstrumentationInfo(appbinddata.instrumentationName, 0);
        instrumentationinfo = instrumentationinfo1;
_L7:
        if (instrumentationinfo == null)
            throw new RuntimeException((new StringBuilder()).append("Unable to find instrumentation info for: ").append(appbinddata.instrumentationName).toString());
        mInstrumentationAppDir = instrumentationinfo.sourceDir;
        mInstrumentationAppLibraryDir = instrumentationinfo.nativeLibraryDir;
        mInstrumentationAppPackage = instrumentationinfo.packageName;
        mInstrumentedAppDir = appbinddata.info.getAppDir();
        mInstrumentedAppLibraryDir = appbinddata.info.getLibDir();
        applicationinfo = new ApplicationInfo();
        applicationinfo.packageName = instrumentationinfo.packageName;
        applicationinfo.sourceDir = instrumentationinfo.sourceDir;
        applicationinfo.publicSourceDir = instrumentationinfo.publicSourceDir;
        applicationinfo.dataDir = instrumentationinfo.dataDir;
        applicationinfo.nativeLibraryDir = instrumentationinfo.nativeLibraryDir;
        loadedapk = getPackageInfo(applicationinfo, appbinddata.compatInfo, contextimpl.getClassLoader(), false, true);
        contextimpl1 = new ContextImpl();
        contextimpl1.init(loadedapk, null, this);
        try
        {
            mInstrumentation = (Instrumentation)contextimpl1.getClassLoader().loadClass(appbinddata.instrumentationName.getClassName()).newInstance();
        }
        // Misplaced declaration of an exception variable
        catch (Exception exception3)
        {
            throw new RuntimeException((new StringBuilder()).append("Unable to instantiate instrumentation ").append(appbinddata.instrumentationName).append(": ").append(exception3.toString()).toString(), exception3);
        }
        mInstrumentation.init(this, contextimpl1, contextimpl, new ComponentName(instrumentationinfo.packageName, instrumentationinfo.name), appbinddata.instrumentationWatcher);
        if (mProfiler.profileFile != null && !instrumentationinfo.handleProfiling && mProfiler.profileFd == null)
        {
            mProfiler.handlingProfiling = true;
            file = new File(mProfiler.profileFile);
            file.getParentFile().mkdirs();
            Debug.startMethodTracing(file.toString(), 0x800000);
        }
_L3:
        if ((0x100000 & appbinddata.appInfo.flags) != 0)
            VMRuntime.getRuntime().clearGrowthLimit();
        threadpolicy = StrictMode.allowThreadDiskWrites();
        application = appbinddata.info.makeApplication(appbinddata.restrictedBackupMode, null);
        mInitialApplication = application;
        if (appbinddata.restrictedBackupMode)
            break MISSING_BLOCK_LABEL_947;
        list = appbinddata.providers;
        if (list == null)
            break MISSING_BLOCK_LABEL_947;
        installContentProviders(application, list);
        mH.sendEmptyMessageDelayed(132, 10000L);
        mInstrumentation.onCreate(appbinddata.instrumentationArgs);
        mInstrumentation.callApplicationOnCreate(application);
_L5:
        StrictMode.setThreadPolicy(threadpolicy);
        return;
_L2:
        mInstrumentation = new Instrumentation();
          goto _L3
        exception1;
        throw new RuntimeException((new StringBuilder()).append("Exception thrown in onCreate() of ").append(appbinddata.instrumentationName).append(": ").append(exception1.toString()).toString(), exception1);
        exception;
        StrictMode.setThreadPolicy(threadpolicy);
        throw exception;
        exception2;
        if (mInstrumentation.onException(application, exception2)) goto _L5; else goto _L4
_L4:
        throw new RuntimeException((new StringBuilder()).append("Unable to create application ").append(application.getClass().getName()).append(": ").append(exception2.toString()).toString(), exception2);
        namenotfoundexception;
        instrumentationinfo = null;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void handleBindService(BindServiceData bindservicedata)
    {
        Service service;
        service = (Service)mServices.get(bindservicedata.token);
        if (service == null)
            break MISSING_BLOCK_LABEL_167;
        bindservicedata.intent.setExtrasClassLoader(service.getClassLoader());
        if (bindservicedata.rebind)
            break MISSING_BLOCK_LABEL_70;
        IBinder ibinder = service.onBind(bindservicedata.intent);
        ActivityManagerNative.getDefault().publishService(bindservicedata.token, bindservicedata.intent, ibinder);
_L2:
        ensureJitEnabled();
        return;
        service.onRebind(bindservicedata.intent);
        ActivityManagerNative.getDefault().serviceDoneExecuting(bindservicedata.token, 0, 0, 0);
        if (true) goto _L2; else goto _L1
_L1:
        RemoteException remoteexception;
        remoteexception;
        return;
        Exception exception;
        exception;
        if (!mInstrumentation.onException(service, exception))
            throw new RuntimeException((new StringBuilder()).append("Unable to bind to service ").append(service).append(" with ").append(bindservicedata.intent).append(": ").append(exception.toString()).toString(), exception);
    }

    private void handleCreateBackupAgent(CreateBackupAgentData createbackupagentdata)
    {
        LoadedApk loadedapk;
        String s;
        String s1;
        IBinder ibinder;
        try
        {
            if (getPackageManager().getPackageInfo(createbackupagentdata.appInfo.packageName, 0, UserHandle.myUserId()).applicationInfo.uid != Process.myUid())
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Asked to instantiate non-matching package ").append(createbackupagentdata.appInfo.packageName).toString());
                return;
            }
        }
        catch (RemoteException remoteexception)
        {
            Slog.e("ActivityThread", "Can't reach package manager", remoteexception);
            return;
        }
        unscheduleGcIdler();
        loadedapk = getPackageInfoNoCheck(createbackupagentdata.appInfo, createbackupagentdata.compatInfo);
        s = loadedapk.mPackageName;
        if (s == null)
        {
            Slog.d("ActivityThread", "Asked to create backup agent for nonexistent package");
            return;
        }
        if (mBackupAgents.get(s) != null)
        {
            Slog.d("ActivityThread", (new StringBuilder()).append("BackupAgent   for ").append(s).append(" already exists").toString());
            return;
        }
        s1 = createbackupagentdata.appInfo.backupAgentName;
        if (s1 == null && (createbackupagentdata.backupMode == 1 || createbackupagentdata.backupMode == 3))
            s1 = "android.app.backup.FullBackupAgent";
        ibinder = null;
        BackupAgent backupagent = (BackupAgent)loadedapk.getClassLoader().loadClass(s1).newInstance();
        ContextImpl contextimpl = new ContextImpl();
        contextimpl.init(loadedapk, null, this);
        contextimpl.setOuterContext(backupagent);
        backupagent.attach(contextimpl);
        backupagent.onCreate();
        ibinder = backupagent.onBind();
        mBackupAgents.put(s, backupagent);
_L1:
        Exception exception;
        try
        {
            ActivityManagerNative.getDefault().backupAgentCreated(s, ibinder);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        catch (Exception exception1)
        {
            throw new RuntimeException((new StringBuilder()).append("Unable to create BackupAgent ").append(s1).append(": ").append(exception1.toString()).toString(), exception1);
        }
        exception;
        Slog.e("ActivityThread", (new StringBuilder()).append("Agent threw during creation: ").append(exception).toString());
        if (createbackupagentdata.backupMode != 2 && createbackupagentdata.backupMode != 3)
            throw exception;
          goto _L1
    }

    private void handleCreateService(CreateServiceData createservicedata)
    {
        Service service;
        unscheduleGcIdler();
        LoadedApk loadedapk = getPackageInfoNoCheck(((ComponentInfo) (createservicedata.info)).applicationInfo, createservicedata.compatInfo);
        ContextImpl contextimpl;
        Application application;
        try
        {
            service = (Service)loadedapk.getClassLoader().loadClass(((ComponentInfo) (createservicedata.info)).name).newInstance();
        }
        catch (Exception exception)
        {
            boolean flag = mInstrumentation.onException(null, exception);
            service = null;
            if (!flag)
                throw new RuntimeException((new StringBuilder()).append("Unable to instantiate service ").append(((ComponentInfo) (createservicedata.info)).name).append(": ").append(exception.toString()).toString(), exception);
        }
        if (!mIsUserBuild)
            Slog.d("ActivityThread", (new StringBuilder()).append("SVC-Creating service: ").append(createservicedata).toString());
        contextimpl = new ContextImpl();
        contextimpl.init(loadedapk, null, this);
        application = loadedapk.makeApplication(false, mInstrumentation);
        contextimpl.setOuterContext(service);
        service.attach(contextimpl, this, ((ComponentInfo) (createservicedata.info)).name, createservicedata.token, application, ActivityManagerNative.getDefault());
        service.onCreate();
        mServices.put(createservicedata.token, service);
        ActivityManagerNative.getDefault().serviceDoneExecuting(createservicedata.token, 0, 0, 0);
_L1:
        return;
        Exception exception1;
        exception1;
        if (!mInstrumentation.onException(service, exception1))
            throw new RuntimeException((new StringBuilder()).append("Unable to create service ").append(((ComponentInfo) (createservicedata.info)).name).append(": ").append(exception1.toString()).toString(), exception1);
          goto _L1
        RemoteException remoteexception;
        remoteexception;
    }

    private void handleDestroyActivity(IBinder ibinder, boolean flag, int i, boolean flag1)
    {
        ActivityClientRecord activityclientrecord = performDestroyActivity(ibinder, flag, i, flag1);
        if (activityclientrecord != null)
        {
            cleanUpPendingRemoveWindows(activityclientrecord);
            WindowManager windowmanager = activityclientrecord.activity.getWindowManager();
            View view = activityclientrecord.activity.mDecor;
            if (view != null)
            {
                if (activityclientrecord.activity.mVisibleFromServer)
                    mNumVisibleActivities = -1 + mNumVisibleActivities;
                IBinder ibinder1 = view.getWindowToken();
                Context context;
                if (activityclientrecord.activity.mWindowAdded)
                    if (activityclientrecord.onlyLocalRequest)
                    {
                        activityclientrecord.mPendingRemoveWindow = view;
                        activityclientrecord.mPendingRemoveWindowManager = windowmanager;
                    } else
                    {
                        windowmanager.removeViewImmediate(view);
                    }
                if (ibinder1 != null && activityclientrecord.mPendingRemoveWindow == null)
                    WindowManagerGlobal.getInstance().closeAll(ibinder1, activityclientrecord.activity.getClass().getName(), "Activity");
                activityclientrecord.activity.mDecor = null;
            }
            if (activityclientrecord.mPendingRemoveWindow == null)
                WindowManagerGlobal.getInstance().closeAll(ibinder, activityclientrecord.activity.getClass().getName(), "Activity");
            context = activityclientrecord.activity.getBaseContext();
            if (context instanceof ContextImpl)
                ((ContextImpl)context).scheduleFinalCleanup(activityclientrecord.activity.getClass().getName(), "Activity");
        }
        if (!flag)
            break MISSING_BLOCK_LABEL_233;
        ActivityManagerNative.getDefault().activityDestroyed(ibinder);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private void handleDestroyBackupAgent(CreateBackupAgentData createbackupagentdata)
    {
        String s = getPackageInfoNoCheck(createbackupagentdata.appInfo, createbackupagentdata.compatInfo).mPackageName;
        BackupAgent backupagent = (BackupAgent)mBackupAgents.get(s);
        if (backupagent != null)
        {
            try
            {
                backupagent.onDestroy();
            }
            catch (Exception exception)
            {
                Slog.w("ActivityThread", (new StringBuilder()).append("Exception thrown in onDestroy by backup agent of ").append(createbackupagentdata.appInfo).toString());
                exception.printStackTrace();
            }
            mBackupAgents.remove(s);
            return;
        } else
        {
            Slog.w("ActivityThread", (new StringBuilder()).append("Attempt to destroy unknown backup agent ").append(createbackupagentdata).toString());
            return;
        }
    }

    private void handleDumpActivity(DumpComponentInfo dumpcomponentinfo)
    {
        android.os.StrictMode.ThreadPolicy threadpolicy = StrictMode.allowThreadDiskWrites();
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(dumpcomponentinfo.token);
        if (activityclientrecord == null)
            break MISSING_BLOCK_LABEL_86;
        if (activityclientrecord.activity != null)
        {
            PrintWriter printwriter = new PrintWriter(new FileOutputStream(dumpcomponentinfo.fd.getFileDescriptor()));
            activityclientrecord.activity.dump(dumpcomponentinfo.prefix, dumpcomponentinfo.fd.getFileDescriptor(), printwriter, dumpcomponentinfo.args);
            printwriter.flush();
        }
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        return;
        Exception exception;
        exception;
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        throw exception;
    }

    static final void handleDumpHeap(boolean flag, DumpHeapData dumpheapdata)
    {
        if (!flag) goto _L2; else goto _L1
_L1:
        try
        {
            Debug.dumpHprofData(dumpheapdata.path, dumpheapdata.fd.getFileDescriptor());
            break MISSING_BLOCK_LABEL_18;
        }
        catch (IOException ioexception1) { }
        Slog.w("ActivityThread", (new StringBuilder()).append("Managed heap dump failed on path ").append(dumpheapdata.path).append(" -- can the process access this path?").toString());
        dumpheapdata.fd.close();
        return;
        ioexception2;
        s = "ActivityThread";
        s1 = "Failure closing profile fd";
_L4:
        Slog.w(s, s1, ioexception2);
        return;
        exception;
        try
        {
            dumpheapdata.fd.close();
        }
        catch (IOException ioexception)
        {
            Slog.w("ActivityThread", "Failure closing profile fd", ioexception);
        }
        throw exception;
_L2:
        Debug.dumpNativeHeap(dumpheapdata.fd.getFileDescriptor());
        return;
        Exception exception;
        IOException ioexception2;
        String s;
        String s1;
        try
        {
            dumpheapdata.fd.close();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception2)
        {
            s = "ActivityThread";
        }
        s1 = "Failure closing profile fd";
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void handleDumpProvider(DumpComponentInfo dumpcomponentinfo)
    {
        android.os.StrictMode.ThreadPolicy threadpolicy = StrictMode.allowThreadDiskWrites();
        ProviderClientRecord providerclientrecord = (ProviderClientRecord)mLocalProviders.get(dumpcomponentinfo.token);
        if (providerclientrecord == null)
            break MISSING_BLOCK_LABEL_82;
        if (providerclientrecord.mLocalProvider != null)
        {
            PrintWriter printwriter = new PrintWriter(new FileOutputStream(dumpcomponentinfo.fd.getFileDescriptor()));
            providerclientrecord.mLocalProvider.dump(dumpcomponentinfo.fd.getFileDescriptor(), printwriter, dumpcomponentinfo.args);
            printwriter.flush();
        }
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        return;
        Exception exception;
        exception;
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        throw exception;
    }

    private void handleDumpService(DumpComponentInfo dumpcomponentinfo)
    {
        android.os.StrictMode.ThreadPolicy threadpolicy = StrictMode.allowThreadDiskWrites();
        Service service = (Service)mServices.get(dumpcomponentinfo.token);
        if (service == null)
            break MISSING_BLOCK_LABEL_71;
        PrintWriter printwriter = new PrintWriter(new FileOutputStream(dumpcomponentinfo.fd.getFileDescriptor()));
        service.dump(dumpcomponentinfo.fd.getFileDescriptor(), printwriter, dumpcomponentinfo.args);
        printwriter.flush();
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        return;
        Exception exception;
        exception;
        IoUtils.closeQuietly(dumpcomponentinfo.fd);
        StrictMode.setThreadPolicy(threadpolicy);
        throw exception;
    }

    private void handleLaunchActivity(ActivityClientRecord activityclientrecord, Intent intent)
    {
        unscheduleGcIdler();
        if (activityclientrecord.profileFd != null)
        {
            mProfiler.setProfiler(activityclientrecord.profileFile, activityclientrecord.profileFd);
            mProfiler.startProfiling();
            mProfiler.autoStopProfiler = activityclientrecord.autoStopProfiler;
        }
        logAppLaunchTime("ActivityThread", "handleLaunchActivity is called");
        handleConfigurationChanged(null, null);
        if (performLaunchActivity(activityclientrecord, intent) != null)
        {
            activityclientrecord.createdConfig = new Configuration(mConfiguration);
            Bundle bundle = activityclientrecord.state;
            IBinder ibinder = activityclientrecord.token;
            boolean flag = activityclientrecord.isForward;
            boolean flag1;
            if (!activityclientrecord.activity.mFinished && !activityclientrecord.startsNotResumed)
                flag1 = true;
            else
                flag1 = false;
            handleResumeActivity(ibinder, false, flag, flag1);
            if (!activityclientrecord.activity.mFinished && activityclientrecord.startsNotResumed)
            {
                try
                {
                    activityclientrecord.activity.mCalled = false;
                    mInstrumentation.callActivityOnPause(activityclientrecord.activity);
                    if (activityclientrecord.isPreHoneycomb())
                        activityclientrecord.state = bundle;
                    if (!activityclientrecord.activity.mCalled)
                        throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(" did not call through to super.onPause()").toString());
                }
                catch (SuperNotCalledException supernotcalledexception)
                {
                    throw supernotcalledexception;
                }
                catch (Exception exception)
                {
                    if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                        throw new RuntimeException((new StringBuilder()).append("Unable to pause activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
                }
                activityclientrecord.paused = true;
            }
            return;
        }
        try
        {
            ActivityManagerNative.getDefault().finishActivity(activityclientrecord.token, 0, null);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void handleNewIntent(NewIntentData newintentdata)
    {
        performNewIntents(newintentdata.token, newintentdata.intents);
    }

    private void handlePauseActivity(IBinder ibinder, boolean flag, boolean flag1, int i)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord == null)
            break MISSING_BLOCK_LABEL_80;
        if (flag1)
            performUserLeavingActivity(activityclientrecord);
        Activity activity = activityclientrecord.activity;
        activity.mConfigChangeFlags = i | activity.mConfigChangeFlags;
        performPauseActivity(ibinder, flag, activityclientrecord.isPreHoneycomb());
        if (activityclientrecord.isPreHoneycomb())
            QueuedWork.waitToFinish();
        ActivityManagerNative.getDefault().activityPaused(ibinder);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private void handleReceiver(ReceiverData receiverdata)
    {
        String s;
        IActivityManager iactivitymanager;
        BroadcastReceiver broadcastreceiver;
        ThreadLocal threadlocal;
        unscheduleGcIdler();
        s = receiverdata.intent.getComponent().getClassName();
        LoadedApk loadedapk = getPackageInfoNoCheck(((ComponentInfo) (receiverdata.info)).applicationInfo, receiverdata.compatInfo);
        iactivitymanager = ActivityManagerNative.getDefault();
        ContextImpl contextimpl;
        try
        {
            ClassLoader classloader = loadedapk.getClassLoader();
            receiverdata.intent.setExtrasClassLoader(classloader);
            receiverdata.setExtrasClassLoader(classloader);
            broadcastreceiver = (BroadcastReceiver)classloader.loadClass(s).newInstance();
        }
        catch (Exception exception)
        {
            receiverdata.sendFinished(iactivitymanager);
            throw new RuntimeException((new StringBuilder()).append("Unable to instantiate receiver ").append(s).append(": ").append(exception.toString()).toString(), exception);
        }
        contextimpl = (ContextImpl)loadedapk.makeApplication(false, mInstrumentation).getBaseContext();
        sCurrentBroadcastIntent.set(receiverdata.intent);
        broadcastreceiver.setPendingResult(receiverdata);
        if (!mIsUserBuild)
            Slog.d("ActivityThread", (new StringBuilder()).append("BDC-Calling onReceive: intent=").append(receiverdata.intent).append(", ordered=true").append(", receiver=").append(broadcastreceiver).toString());
        broadcastreceiver.onReceive(contextimpl.getReceiverRestrictedContext(), receiverdata.intent);
        threadlocal = sCurrentBroadcastIntent;
_L2:
        threadlocal.set(null);
        if (broadcastreceiver.getPendingResult() != null)
            receiverdata.finish();
        return;
        Exception exception2;
        exception2;
        receiverdata.sendFinished(iactivitymanager);
        if (!mInstrumentation.onException(broadcastreceiver, exception2))
            throw new RuntimeException((new StringBuilder()).append("Unable to start receiver ").append(s).append(": ").append(exception2.toString()).toString(), exception2);
        break MISSING_BLOCK_LABEL_324;
        Exception exception1;
        exception1;
        sCurrentBroadcastIntent.set(null);
        throw exception1;
        threadlocal = sCurrentBroadcastIntent;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void handleRelaunchActivity(ActivityClientRecord activityclientrecord)
    {
        int i;
        unscheduleGcIdler();
        i = 0;
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        int j;
        IBinder ibinder;
        j = mRelaunchingActivities.size();
        ibinder = activityclientrecord.token;
        ActivityClientRecord activityclientrecord1;
        int k;
        activityclientrecord1 = null;
        k = 0;
_L2:
        if (k >= j)
            break MISSING_BLOCK_LABEL_96;
        ActivityClientRecord activityclientrecord2;
        activityclientrecord2 = (ActivityClientRecord)mRelaunchingActivities.get(k);
        if (activityclientrecord2.token != ibinder)
            break MISSING_BLOCK_LABEL_535;
        activityclientrecord1 = activityclientrecord2;
        i |= activityclientrecord1.pendingConfigChanges;
        mRelaunchingActivities.remove(k);
        k--;
        j--;
        break MISSING_BLOCK_LABEL_535;
        if (activityclientrecord1 != null)
            break MISSING_BLOCK_LABEL_104;
        hashmap;
        JVM INSTR monitorexit ;
        return;
        Configuration configuration = mPendingConfiguration;
        Configuration configuration1;
        configuration1 = null;
        if (configuration == null)
            break MISSING_BLOCK_LABEL_129;
        configuration1 = mPendingConfiguration;
        mPendingConfiguration = null;
        hashmap;
        JVM INSTR monitorexit ;
        if (activityclientrecord1.createdConfig != null && (mConfiguration == null || activityclientrecord1.createdConfig.isOtherSeqNewer(mConfiguration) && mConfiguration.diff(activityclientrecord1.createdConfig) != 0) && (configuration1 == null || activityclientrecord1.createdConfig.isOtherSeqNewer(configuration1)))
            configuration1 = activityclientrecord1.createdConfig;
        if (configuration1 != null)
        {
            mCurDefaultDisplayDpi = configuration1.densityDpi;
            updateDefaultDensity();
            handleConfigurationChanged(configuration1, null);
        }
        ActivityClientRecord activityclientrecord3 = (ActivityClientRecord)mActivities.get(activityclientrecord1.token);
        if (activityclientrecord3 != null)
        {
            Activity activity = activityclientrecord3.activity;
            activity.mConfigChangeFlags = i | activity.mConfigChangeFlags;
            activityclientrecord3.onlyLocalRequest = activityclientrecord1.onlyLocalRequest;
            Intent intent = activityclientrecord3.activity.mIntent;
            activityclientrecord3.activity.mChangingConfigurations = true;
            if (!activityclientrecord3.paused)
                performPauseActivity(activityclientrecord3.token, false, activityclientrecord3.isPreHoneycomb());
            if (activityclientrecord3.state == null && !activityclientrecord3.stopped && !activityclientrecord3.isPreHoneycomb())
            {
                activityclientrecord3.state = new Bundle();
                activityclientrecord3.state.setAllowFds(false);
                mInstrumentation.callActivityOnSaveInstanceState(activityclientrecord3.activity, activityclientrecord3.state);
            }
            handleDestroyActivity(activityclientrecord3.token, false, i, true);
            activityclientrecord3.activity = null;
            activityclientrecord3.window = null;
            activityclientrecord3.hideForNow = false;
            activityclientrecord3.nextIdle = null;
            Exception exception;
            if (activityclientrecord1.pendingResults != null)
                if (activityclientrecord3.pendingResults == null)
                    activityclientrecord3.pendingResults = activityclientrecord1.pendingResults;
                else
                    activityclientrecord3.pendingResults.addAll(activityclientrecord1.pendingResults);
            if (activityclientrecord1.pendingIntents != null)
                if (activityclientrecord3.pendingIntents == null)
                    activityclientrecord3.pendingIntents = activityclientrecord1.pendingIntents;
                else
                    activityclientrecord3.pendingIntents.addAll(activityclientrecord1.pendingIntents);
            activityclientrecord3.startsNotResumed = activityclientrecord1.startsNotResumed;
            handleLaunchActivity(activityclientrecord3, intent);
            return;
        } else
        {
            return;
        }
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        k++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void handleRequestThumbnail(IBinder ibinder)
    {
        ActivityClientRecord activityclientrecord;
        Bitmap bitmap;
        activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        bitmap = createThumbnailBitmap(activityclientrecord);
        CharSequence charsequence1 = activityclientrecord.activity.onCreateDescription();
        CharSequence charsequence = charsequence1;
_L1:
        Exception exception;
        try
        {
            ActivityManagerNative.getDefault().reportThumbnail(ibinder, bitmap, charsequence);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        exception;
        boolean flag = mInstrumentation.onException(activityclientrecord.activity, exception);
        charsequence = null;
        if (!flag)
            throw new RuntimeException((new StringBuilder()).append("Unable to create description of activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
          goto _L1
    }

    private void handleSendResult(ResultData resultdata)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(resultdata.token);
        if (activityclientrecord != null)
        {
            boolean flag;
            if (!activityclientrecord.paused)
                flag = true;
            else
                flag = false;
            if (!activityclientrecord.activity.mFinished && activityclientrecord.activity.mDecor != null && activityclientrecord.hideForNow && flag)
                updateVisibility(activityclientrecord, true);
            if (flag)
                try
                {
                    activityclientrecord.activity.mCalled = false;
                    activityclientrecord.activity.mTemporaryPause = true;
                    mInstrumentation.callActivityOnPause(activityclientrecord.activity);
                    if (!activityclientrecord.activity.mCalled)
                        throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(" did not call through to super.onPause()").toString());
                }
                catch (SuperNotCalledException supernotcalledexception)
                {
                    throw supernotcalledexception;
                }
                catch (Exception exception)
                {
                    if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                        throw new RuntimeException((new StringBuilder()).append("Unable to pause activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
                }
            deliverResults(activityclientrecord, resultdata.results);
            if (flag)
            {
                activityclientrecord.activity.performResume();
                activityclientrecord.activity.mTemporaryPause = false;
            }
        }
    }

    private void handleServiceArgs(ServiceArgsData serviceargsdata)
    {
        Service service;
        service = (Service)mServices.get(serviceargsdata.token);
        if (service == null)
            break MISSING_BLOCK_LABEL_236;
        if (serviceargsdata.args != null)
            serviceargsdata.args.setExtrasClassLoader(service.getClassLoader());
        if (serviceargsdata.taskRemoved) goto _L2; else goto _L1
_L1:
        int i;
        if (!mIsUserBuild)
            Log.d("ActivityThread", (new StringBuilder()).append("SVC-Calling onStartCommand: ").append(service).append(", flags=").append(serviceargsdata.flags).append(", startId=").append(serviceargsdata.startId).toString());
        i = service.onStartCommand(serviceargsdata.args, serviceargsdata.flags, serviceargsdata.startId);
_L3:
        QueuedWork.waitToFinish();
        Exception exception;
        try
        {
            ActivityManagerNative.getDefault().serviceDoneExecuting(serviceargsdata.token, 1, serviceargsdata.startId, i);
        }
        catch (RemoteException remoteexception) { }
        ensureJitEnabled();
        return;
_L2:
        service.onTaskRemoved(serviceargsdata.args);
        i = 1000;
          goto _L3
        exception;
        if (!mInstrumentation.onException(service, exception))
            throw new RuntimeException((new StringBuilder()).append("Unable to start service ").append(service).append(" with ").append(serviceargsdata.args).append(": ").append(exception.toString()).toString(), exception);
    }

    private void handleSetCoreSettings(Bundle bundle)
    {
        synchronized (mPackages)
        {
            mCoreSettings = bundle;
        }
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleSleeping(IBinder ibinder, boolean flag)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord != null) goto _L2; else goto _L1
_L1:
        Log.w("ActivityThread", (new StringBuilder()).append("handleSleeping: no activity for token ").append(ibinder).toString());
_L8:
        return;
_L2:
        if (!flag)
            continue; /* Loop/switch isn't completed */
        if (activityclientrecord.stopped || activityclientrecord.isPreHoneycomb()) goto _L4; else goto _L3
_L3:
        activityclientrecord.activity.performStop();
_L6:
        activityclientrecord.stopped = true;
_L4:
        if (!activityclientrecord.isPreHoneycomb())
            QueuedWork.waitToFinish();
        try
        {
            ActivityManagerNative.getDefault().activitySlept(activityclientrecord.token);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        Exception exception;
        exception;
        if (mInstrumentation.onException(activityclientrecord.activity, exception)) goto _L6; else goto _L5
_L5:
        throw new RuntimeException((new StringBuilder()).append("Unable to stop activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
        if (!activityclientrecord.stopped || !activityclientrecord.activity.mVisibleFromServer) goto _L8; else goto _L7
_L7:
        activityclientrecord.activity.performRestart();
        activityclientrecord.stopped = false;
        return;
    }

    private void handleStopActivity(IBinder ibinder, boolean flag, int i)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord == null)
        {
            Log.w("ActivityThread", (new StringBuilder()).append("handleStopActivity: no activity for token ").append(ibinder).toString());
            return;
        }
        Activity activity = activityclientrecord.activity;
        activity.mConfigChangeFlags = i | activity.mConfigChangeFlags;
        StopInfo stopinfo = new StopInfo();
        performStopActivityInner(activityclientrecord, stopinfo, flag, true);
        updateVisibility(activityclientrecord, flag);
        if (!activityclientrecord.isPreHoneycomb())
            QueuedWork.waitToFinish();
        stopinfo.activity = activityclientrecord;
        stopinfo.state = activityclientrecord.state;
        mH.post(stopinfo);
    }

    private void handleStopService(IBinder ibinder)
    {
        Service service;
        service = (Service)mServices.remove(ibinder);
        if (service == null)
            break MISSING_BLOCK_LABEL_100;
        if (!mIsUserBuild)
            Slog.d("ActivityThread", (new StringBuilder()).append("SVC-Destroying service: ").append(service).toString());
        service.onDestroy();
        Context context = service.getBaseContext();
        if (context instanceof ContextImpl)
        {
            String s = service.getClassName();
            ((ContextImpl)context).scheduleFinalCleanup(s, "Service");
        }
        QueuedWork.waitToFinish();
        ActivityManagerNative.getDefault().serviceDoneExecuting(ibinder, 0, 0, 0);
_L1:
        return;
        Exception exception;
        exception;
        if (!mInstrumentation.onException(service, exception))
            throw new RuntimeException((new StringBuilder()).append("Unable to stop service ").append(service).append(": ").append(exception.toString()).toString(), exception);
          goto _L1
        RemoteException remoteexception;
        remoteexception;
    }

    private void handleUnbindService(BindServiceData bindservicedata)
    {
        Service service;
        service = (Service)mServices.get(bindservicedata.token);
        if (service == null)
            break MISSING_BLOCK_LABEL_151;
        boolean flag;
        bindservicedata.intent.setExtrasClassLoader(service.getClassLoader());
        flag = service.onUnbind(bindservicedata.intent);
        if (flag)
        {
            try
            {
                ActivityManagerNative.getDefault().unbindFinished(bindservicedata.token, bindservicedata.intent, flag);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
            catch (Exception exception)
            {
                if (!mInstrumentation.onException(service, exception))
                    throw new RuntimeException((new StringBuilder()).append("Unable to unbind to service ").append(service).append(" with ").append(bindservicedata.intent).append(": ").append(exception.toString()).toString(), exception);
            }
            break MISSING_BLOCK_LABEL_151;
        }
        ActivityManagerNative.getDefault().serviceDoneExecuting(bindservicedata.token, 0, 0, 0);
        return;
    }

    private void handleUpdatePackageCompatibilityInfo(UpdateCompatibilityData updatecompatibilitydata)
    {
        LoadedApk loadedapk = peekPackageInfo(updatecompatibilitydata.pkg, false);
        if (loadedapk != null)
            loadedapk.mCompatibilityInfo.set(updatecompatibilitydata.info);
        LoadedApk loadedapk1 = peekPackageInfo(updatecompatibilitydata.pkg, true);
        if (loadedapk1 != null)
            loadedapk1.mCompatibilityInfo.set(updatecompatibilitydata.info);
        handleConfigurationChanged(mConfiguration, updatecompatibilitydata.info);
        WindowManagerGlobal.getInstance().reportNewConfiguration(mConfiguration);
    }

    private void handleWindowVisibility(IBinder ibinder, boolean flag)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord == null)
        {
            Log.w("ActivityThread", (new StringBuilder()).append("handleWindowVisibility: no activity for token ").append(ibinder).toString());
        } else
        {
            if (!flag && !activityclientrecord.stopped)
                performStopActivityInner(activityclientrecord, null, flag, false);
            else
            if (flag && activityclientrecord.stopped)
            {
                unscheduleGcIdler();
                activityclientrecord.activity.performRestart();
                activityclientrecord.stopped = false;
            }
            if (activityclientrecord.activity.mDecor != null)
            {
                updateVisibility(activityclientrecord, flag);
                return;
            }
        }
    }

    private final void incProviderRefLocked(ProviderRefCount providerrefcount, boolean flag)
    {
        if (!flag)
            break MISSING_BLOCK_LABEL_100;
        providerrefcount.stableCount = 1 + providerrefcount.stableCount;
        if (providerrefcount.stableCount != 1)
            break MISSING_BLOCK_LABEL_87;
        byte byte0;
        if (providerrefcount.removePending)
        {
            if (mRemoveProviders.contains(providerrefcount))
            {
                mRemoveProviders.remove(providerrefcount);
                byte0 = -1;
                providerrefcount.removePending = false;
                mH.removeMessages(131, providerrefcount);
            } else
            {
                byte0 = 0;
            }
        } else
        {
            byte0 = 0;
        }
        ActivityManagerNative.getDefault().refContentProvider(providerrefcount.holder.connection, 1, byte0);
_L1:
        return;
        providerrefcount.unstableCount = 1 + providerrefcount.unstableCount;
        if (providerrefcount.unstableCount == 1)
        {
            if (providerrefcount.removePending && mRemoveProviders.contains(providerrefcount))
            {
                mRemoveProviders.remove(providerrefcount);
                providerrefcount.removePending = false;
                mH.removeMessages(131, providerrefcount);
                return;
            }
            try
            {
                ActivityManagerNative.getDefault().refContentProvider(providerrefcount.holder.connection, 0, 1);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }
          goto _L1
        RemoteException remoteexception1;
        remoteexception1;
    }

    private void installContentProviders(Context context, List list)
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            IActivityManager.ContentProviderHolder contentproviderholder = installProvider(context, null, (ProviderInfo)iterator.next(), false, true, true);
            if (contentproviderholder != null)
            {
                contentproviderholder.noReleaseNeeded = true;
                arraylist.add(contentproviderholder);
            }
        } while (true);
        try
        {
            ActivityManagerNative.getDefault().publishContentProviders(getApplicationThread(), arraylist);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private IActivityManager.ContentProviderHolder installProvider(Context context, IActivityManager.ContentProviderHolder contentproviderholder, ProviderInfo providerinfo, boolean flag, boolean flag1, boolean flag2)
    {
        Slog.d("ActivityThread", (new StringBuilder()).append("installProvider: context=").append(context).append("holder=").append(contentproviderholder).append("noisy=").append(flag).append("noReleaseNeeded=").append(flag1).append("stable=").append(flag2).toString());
        if (contentproviderholder != null && contentproviderholder.provider != null) goto _L2; else goto _L1
_L1:
        ApplicationInfo applicationinfo;
        Object obj;
        if (flag)
            Slog.d("ActivityThread", (new StringBuilder()).append("Loading provider ").append(providerinfo.authority).append(": ").append(((ComponentInfo) (providerinfo)).name).toString());
        applicationinfo = ((ComponentInfo) (providerinfo)).applicationInfo;
        Slog.d("ActivityThread", (new StringBuilder()).append("installProvider: context.getPackageName()=").append(context.getPackageName()).append("ai.packageName=").append(applicationinfo.packageName).toString());
        if (context.getPackageName().equals(applicationinfo.packageName))
        {
            obj = context;
        } else
        {
label0:
            {
                if (mInitialApplication == null || !mInitialApplication.getPackageName().equals(applicationinfo.packageName))
                    break label0;
                obj = mInitialApplication;
            }
        }
_L3:
        if (obj == null)
        {
            Slog.w("ActivityThread", (new StringBuilder()).append("Unable to get context for package ").append(applicationinfo.packageName).append(" while loading content provider ").append(((ComponentInfo) (providerinfo)).name).toString());
            return null;
        }
        break MISSING_BLOCK_LABEL_297;
        Context context1 = context.createPackageContext(applicationinfo.packageName, 1);
        obj = context1;
          goto _L3
        ContentProvider contentprovider;
        IContentProvider icontentprovider;
        Exception exception1;
        IBinder ibinder;
        ComponentName componentname;
        ProviderClientRecord providerclientrecord;
        IActivityManager.ContentProviderHolder contentproviderholder1;
        HashMap hashmap;
        try
        {
            contentprovider = (ContentProvider)((Context) (obj)).getClassLoader().loadClass(((ComponentInfo) (providerinfo)).name).newInstance();
            icontentprovider = contentprovider.getIContentProvider();
        }
        catch (Exception exception)
        {
            if (!mInstrumentation.onException(null, exception))
                throw new RuntimeException((new StringBuilder()).append("Unable to get provider ").append(((ComponentInfo) (providerinfo)).name).append(": ").append(exception.toString()).toString(), exception);
            else
                return null;
        }
        if (icontentprovider != null)
            break MISSING_BLOCK_LABEL_376;
        Slog.e("ActivityThread", (new StringBuilder()).append("Failed to instantiate class ").append(((ComponentInfo) (providerinfo)).name).append(" from sourceDir ").append(((ComponentInfo) (providerinfo)).applicationInfo.sourceDir).toString());
        return null;
        contentprovider.attachInfo(((Context) (obj)), providerinfo);
_L8:
        hashmap = mProviderMap;
        hashmap;
        JVM INSTR monitorenter ;
        ibinder = icontentprovider.asBinder();
        if (contentprovider == null) goto _L5; else goto _L4
_L4:
        componentname = new ComponentName(providerinfo.packageName, ((ComponentInfo) (providerinfo)).name);
        providerclientrecord = (ProviderClientRecord)mLocalProvidersByName.get(componentname);
        if (providerclientrecord == null) goto _L7; else goto _L6
_L6:
        providerclientrecord.mProvider;
_L9:
        contentproviderholder1 = providerclientrecord.mHolder;
_L10:
        hashmap;
        JVM INSTR monitorexit ;
        return contentproviderholder1;
_L15:
        hashmap;
        JVM INSTR monitorexit ;
        throw exception1;
_L2:
        icontentprovider = contentproviderholder.provider;
        contentprovider = null;
          goto _L8
_L7:
        IActivityManager.ContentProviderHolder contentproviderholder2 = new IActivityManager.ContentProviderHolder(providerinfo);
        contentproviderholder2.provider = icontentprovider;
        contentproviderholder2.noReleaseNeeded = true;
        providerclientrecord = installProviderAuthoritiesLocked(icontentprovider, contentprovider, contentproviderholder2);
        mLocalProviders.put(ibinder, providerclientrecord);
        mLocalProvidersByName.put(componentname, providerclientrecord);
          goto _L9
_L5:
        ProviderRefCount providerrefcount = (ProviderRefCount)mProviderRefCountMap.get(ibinder);
        if (providerrefcount == null)
            break MISSING_BLOCK_LABEL_662;
        if (flag1)
            break MISSING_BLOCK_LABEL_652;
        incProviderRefLocked(providerrefcount, flag2);
        ProviderClientRecord providerclientrecord1;
        try
        {
            ActivityManagerNative.getDefault().removeContentProvider(contentproviderholder.connection, flag2);
        }
        catch (RemoteException remoteexception) { }
        contentproviderholder1 = providerrefcount.holder;
          goto _L10
        providerclientrecord1 = installProviderAuthoritiesLocked(icontentprovider, contentprovider, contentproviderholder);
        if (!flag1) goto _L12; else goto _L11
_L11:
        providerrefcount = new ProviderRefCount(contentproviderholder, providerclientrecord1, 1000, 1000);
_L14:
        mProviderRefCountMap.put(ibinder, providerrefcount);
        break MISSING_BLOCK_LABEL_652;
_L12:
        if (!flag2)
            break MISSING_BLOCK_LABEL_733;
        providerrefcount = new ProviderRefCount(contentproviderholder, providerclientrecord1, 1, 0);
        continue; /* Loop/switch isn't completed */
        providerrefcount = new ProviderRefCount(contentproviderholder, providerclientrecord1, 0, 1);
        if (true) goto _L14; else goto _L13
_L13:
        exception1;
          goto _L15
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        obj = null;
          goto _L3
        exception1;
          goto _L15
    }

    private ProviderClientRecord installProviderAuthoritiesLocked(IContentProvider icontentprovider, ContentProvider contentprovider, IActivityManager.ContentProviderHolder contentproviderholder)
    {
        String as[] = PATTERN_SEMICOLON.split(contentproviderholder.info.authority);
        int i = UserHandle.getUserId(((ComponentInfo) (contentproviderholder.info)).applicationInfo.uid);
        ProviderClientRecord providerclientrecord = new ProviderClientRecord(as, icontentprovider, contentprovider, contentproviderholder);
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s = as[k];
            ProviderKey providerkey = new ProviderKey(s, i);
            if ((ProviderClientRecord)mProviderMap.get(providerkey) != null)
                Slog.w("ActivityThread", (new StringBuilder()).append("Content provider ").append(((ComponentInfo) (providerclientrecord.mHolder.info)).name).append(" already published as ").append(s).toString());
            else
                mProviderMap.put(providerkey, providerclientrecord);
        }

        return providerclientrecord;
    }

    public static void logAppLaunchTime(String s, String s1)
    {
        Trace.traceBegin(64L, (new StringBuilder()).append("logAppLaunchTime : ").append(s1).toString());
        if (mEnableAppLaunchLog)
            Slog.i(s, (new StringBuilder()).append("[AppLaunch] ").append(s1).toString());
        Trace.traceEnd(64L);
    }

    public static void main(String args[])
    {
        if (args != null && args.length == 4)
        {
            if (args[0].equals("enable"))
                mEnableAppLaunchLog = true;
            if (args[1].equals("true"))
                mIsUserBuild = true;
            if (args[2].equals("true"))
                mBooted = true;
            if (args[3].equals("true"))
                mEnableLooperLog = true;
            if (!mIsUserBuild)
                Slog.v("ActivityThread", (new StringBuilder()).append("MAIN-ARGS launch log: ").append(mEnableAppLaunchLog).append(", user build: ").append(mIsUserBuild).append(", booted: ").append(mBooted).append(", looper log: ").append(mEnableLooperLog).toString());
        }
        logAppLaunchTime("ActivityThread", "ActivityThread is created");
        SamplingProfilerIntegration.start();
        CloseGuard.setEnabled(false);
        Environment.initForCurrentUser();
        EventLogger.setReporter(new EventLoggingReporter());
        Process.setArgV0("<pre-initialized>");
        Looper.prepareMainLooper();
        ActivityThread activitythread = new ActivityThread();
        activitythread.attach(false);
        if (sMainThreadHandler == null)
            sMainThreadHandler = activitythread.getHandler();
        AsyncTask.init();
        if (!IS_USER_BUILD)
        {
            ANRAppManager anrappmanager = ANRAppManager.getDefault();
            Looper.myLooper().setMessageLogging(anrappmanager.newMessageLogger(mEnableLooperLog));
        }
        Looper.loop();
        throw new RuntimeException("Main thread loop unexpectedly exited");
    }

    private static void performConfigurationChanged(ComponentCallbacks2 componentcallbacks2, Configuration configuration)
    {
        Activity activity;
        if (componentcallbacks2 instanceof Activity)
            activity = (Activity)componentcallbacks2;
        else
            activity = null;
        if (activity != null)
            activity.mCalled = false;
        boolean flag;
        if (activity != null && activity.mCurrentConfig != null)
        {
            int i = activity.mCurrentConfig.diff(configuration);
            flag = false;
            if (i != 0)
            {
                int j = i & (-1 ^ activity.mActivityInfo.getRealConfigChanged());
                flag = false;
                if (j == 0)
                    flag = true;
            }
        } else
        {
            flag = true;
        }
        if (flag)
        {
            componentcallbacks2.onConfigurationChanged(configuration);
            if (activity != null)
            {
                if (!activity.mCalled)
                    throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activity.getLocalClassName()).append(" did not call through to super.onConfigurationChanged()").toString());
                activity.mConfigChangeFlags = 0;
                activity.mCurrentConfig = new Configuration(configuration);
            }
        }
    }

    private ActivityClientRecord performDestroyActivity(IBinder ibinder, boolean flag, int i, boolean flag1)
    {
        ActivityClientRecord activityclientrecord;
        Class class1;
        activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        class1 = null;
        if (activityclientrecord == null)
            break MISSING_BLOCK_LABEL_580;
        class1 = activityclientrecord.activity.getClass();
        Activity activity = activityclientrecord.activity;
        activity.mConfigChangeFlags = i | activity.mConfigChangeFlags;
        if (flag)
            activityclientrecord.activity.mFinished = true;
        if (!activityclientrecord.paused)
        {
            try
            {
                activityclientrecord.activity.mCalled = false;
                mInstrumentation.callActivityOnPause(activityclientrecord.activity);
                Object aobj[] = new Object[2];
                aobj[0] = Integer.valueOf(UserHandle.myUserId());
                aobj[1] = activityclientrecord.activity.getComponentName().getClassName();
                EventLog.writeEvent(30021, aobj);
                if (!mIsUserBuild)
                    Slog.d("ActivityThread", (new StringBuilder()).append("ACT-AM_ON_PAUSE_CALLED ").append(activityclientrecord).toString());
                if (!activityclientrecord.activity.mCalled)
                    throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(safeToComponentShortString(activityclientrecord.intent)).append(" did not call through to super.onPause()").toString());
            }
            catch (SuperNotCalledException supernotcalledexception2)
            {
                throw supernotcalledexception2;
            }
            catch (Exception exception3)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception3))
                    throw new RuntimeException((new StringBuilder()).append("Unable to pause activity ").append(safeToComponentShortString(activityclientrecord.intent)).append(": ").append(exception3.toString()).toString(), exception3);
            }
            activityclientrecord.paused = true;
        }
        if (!activityclientrecord.stopped)
        {
            SuperNotCalledException supernotcalledexception;
            try
            {
                activityclientrecord.activity.performStop();
            }
            catch (SuperNotCalledException supernotcalledexception1)
            {
                throw supernotcalledexception1;
            }
            catch (Exception exception2)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception2))
                    throw new RuntimeException((new StringBuilder()).append("Unable to stop activity ").append(safeToComponentShortString(activityclientrecord.intent)).append(": ").append(exception2.toString()).toString(), exception2);
            }
            activityclientrecord.stopped = true;
        }
        if (flag1)
            try
            {
                activityclientrecord.lastNonConfigurationInstances = activityclientrecord.activity.retainNonConfigurationInstances();
            }
            catch (Exception exception1)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception1))
                    throw new RuntimeException((new StringBuilder()).append("Unable to retain activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception1.toString()).toString(), exception1);
            }
        activityclientrecord.activity.mCalled = false;
        mInstrumentation.callActivityOnDestroy(activityclientrecord.activity);
        if (!activityclientrecord.activity.mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(safeToComponentShortString(activityclientrecord.intent)).append(" did not call through to super.onDestroy()").toString());
        try
        {
            if (activityclientrecord.window != null)
                activityclientrecord.window.closeAllPanels();
        }
        // Misplaced declaration of an exception variable
        catch (SuperNotCalledException supernotcalledexception)
        {
            throw supernotcalledexception;
        }
        catch (Exception exception)
        {
            if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                throw new RuntimeException((new StringBuilder()).append("Unable to destroy activity ").append(safeToComponentShortString(activityclientrecord.intent)).append(": ").append(exception.toString()).toString(), exception);
        }
        mActivities.remove(ibinder);
        StrictMode.decrementExpectedActivityCount(class1);
        return activityclientrecord;
    }

    private Activity performLaunchActivity(ActivityClientRecord activityclientrecord, Intent intent)
    {
        ComponentName componentname;
        Activity activity;
        ActivityInfo activityinfo = activityclientrecord.activityInfo;
        if (activityclientrecord.packageInfo == null)
            activityclientrecord.packageInfo = getPackageInfo(((ComponentInfo) (activityinfo)).applicationInfo, activityclientrecord.compatInfo, 1);
        componentname = activityclientrecord.intent.getComponent();
        if (componentname == null)
        {
            componentname = activityclientrecord.intent.resolveActivity(mInitialApplication.getPackageManager());
            activityclientrecord.intent.setComponent(componentname);
        }
        if (activityclientrecord.activityInfo.targetActivity != null)
        {
            String s = activityclientrecord.activityInfo.packageName;
            String s1 = activityclientrecord.activityInfo.targetActivity;
            componentname = new ComponentName(s, s1);
        }
        activity = null;
        ClassLoader classloader = activityclientrecord.packageInfo.getClassLoader();
        activity = mInstrumentation.newActivity(classloader, componentname.getClassName(), activityclientrecord.intent);
        StrictMode.incrementExpectedActivityCount(activity.getClass());
        activityclientrecord.intent.setExtrasClassLoader(classloader);
        if (activityclientrecord.state != null)
            activityclientrecord.state.setClassLoader(classloader);
_L2:
        Application application = activityclientrecord.packageInfo.makeApplication(false, mInstrumentation);
        if (activity == null)
            break MISSING_BLOCK_LABEL_656;
        Context context = createBaseContextForActivity(activityclientrecord, activity);
        CharSequence charsequence = activityclientrecord.activityInfo.loadLabel(context.getPackageManager());
        Configuration configuration = new Configuration(mCompatConfiguration);
        activity.attach(context, this, getInstrumentation(), activityclientrecord.token, activityclientrecord.ident, application, activityclientrecord.intent, activityclientrecord.activityInfo, charsequence, activityclientrecord.parent, activityclientrecord.embeddedID, activityclientrecord.lastNonConfigurationInstances, configuration);
        if (intent == null)
            break MISSING_BLOCK_LABEL_286;
        activity.mIntent = intent;
        int i;
        activityclientrecord.lastNonConfigurationInstances = null;
        activity.mStartedActivity = false;
        i = activityclientrecord.activityInfo.getThemeResource();
        if (i == 0)
            break MISSING_BLOCK_LABEL_318;
        activity.setTheme(i);
        SuperNotCalledException supernotcalledexception;
        activity.mCalled = false;
        mInstrumentation.callActivityOnCreate(activity, activityclientrecord.state);
        if (!activity.mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(" did not call through to super.onCreate()").toString());
        break MISSING_BLOCK_LABEL_454;
        Exception exception;
        exception;
        if (mInstrumentation.onException(activity, exception)) goto _L2; else goto _L1
_L1:
        throw new RuntimeException((new StringBuilder()).append("Unable to instantiate activity ").append(componentname).append(": ").append(exception.toString()).toString(), exception);
        Exception exception1;
        activityclientrecord.activity = activity;
        activityclientrecord.stopped = true;
        if (!activityclientrecord.activity.mFinished)
        {
            activity.performStart();
            activityclientrecord.stopped = false;
        }
        if (!activityclientrecord.activity.mFinished && activityclientrecord.state != null)
            mInstrumentation.callActivityOnRestoreInstanceState(activity, activityclientrecord.state);
        if (!activityclientrecord.activity.mFinished)
        {
            activity.mCalled = false;
            mInstrumentation.callActivityOnPostCreate(activity, activityclientrecord.state);
            if (!activity.mCalled)
                throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(" did not call through to super.onPostCreate()").toString());
        }
        try
        {
            activityclientrecord.paused = true;
            mActivities.put(activityclientrecord.token, activityclientrecord);
        }
        // Misplaced declaration of an exception variable
        catch (SuperNotCalledException supernotcalledexception)
        {
            throw supernotcalledexception;
        }
        // Misplaced declaration of an exception variable
        catch (Exception exception1)
        {
            if (!mInstrumentation.onException(activity, exception1))
                throw new RuntimeException((new StringBuilder()).append("Unable to start activity ").append(componentname).append(": ").append(exception1.toString()).toString(), exception1);
        }
        return activity;
    }

    private void performStopActivityInner(ActivityClientRecord activityclientrecord, StopInfo stopinfo, boolean flag, boolean flag1)
    {
label0:
        {
label1:
            {
                if (activityclientrecord != null)
                {
                    if (flag || !activityclientrecord.stopped)
                        break label0;
                    if (!activityclientrecord.activity.mFinished)
                        break label1;
                }
                return;
            }
            RuntimeException runtimeexception = new RuntimeException((new StringBuilder()).append("Performing stop of activity that is not resumed: ").append(activityclientrecord.intent.getComponent().toShortString()).toString());
            Slog.e("ActivityThread", runtimeexception.getMessage(), runtimeexception);
        }
        if (stopinfo != null)
            try
            {
                stopinfo.thumbnail = null;
                stopinfo.description = activityclientrecord.activity.onCreateDescription();
            }
            catch (Exception exception1)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception1))
                    throw new RuntimeException((new StringBuilder()).append("Unable to save state of activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception1.toString()).toString(), exception1);
            }
        if (!activityclientrecord.activity.mFinished && flag1)
            if (activityclientrecord.state == null)
            {
                Bundle bundle = new Bundle();
                bundle.setAllowFds(false);
                mInstrumentation.callActivityOnSaveInstanceState(activityclientrecord.activity, bundle);
                activityclientrecord.state = bundle;
            } else
            {
                Bundle _tmp = activityclientrecord.state;
            }
        if (!flag)
        {
            try
            {
                activityclientrecord.activity.performStop();
            }
            catch (Exception exception)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                    throw new RuntimeException((new StringBuilder()).append("Unable to stop activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
            }
            activityclientrecord.stopped = true;
        }
        activityclientrecord.paused = true;
    }

    private void queueOrSendMessage(int i, Object obj)
    {
        queueOrSendMessage(i, obj, 0, 0);
    }

    private void queueOrSendMessage(int i, Object obj, int j)
    {
        queueOrSendMessage(i, obj, j, 0);
    }

    private void queueOrSendMessage(int i, Object obj, int j, int k)
    {
        this;
        JVM INSTR monitorenter ;
        Message message = Message.obtain();
        message.what = i;
        message.obj = obj;
        message.arg1 = j;
        message.arg2 = k;
        mH.sendMessage(message);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static String safeToComponentShortString(Intent intent)
    {
        ComponentName componentname = intent.getComponent();
        if (componentname == null)
            return "[Unknown]";
        else
            return componentname.toShortString();
    }

    private void setupGraphicsSupport(LoadedApk loadedapk, File file)
    {
        if (!Process.isIsolated()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        String as[];
        try
        {
            int i = Process.myUid();
            as = getPackageManager().getPackagesForUid(i);
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (as == null) goto _L1; else goto _L3
_L3:
        if (as.length != 1) goto _L1; else goto _L4
_L4:
        HardwareRenderer.setupDiskCache(file);
        RenderScript.setupDiskCache(file);
        return;
    }

    public static ActivityThread systemMain()
    {
        HardwareRenderer.disable(true);
        ActivityThread activitythread = new ActivityThread();
        activitythread.attach(true);
        return activitythread;
    }

    private void updateDefaultDensity()
    {
        if (mCurDefaultDisplayDpi != 0 && mCurDefaultDisplayDpi != DisplayMetrics.DENSITY_DEVICE && !mDensityCompatMode)
        {
            Slog.i("ActivityThread", (new StringBuilder()).append("Switching default density from ").append(DisplayMetrics.DENSITY_DEVICE).append(" to ").append(mCurDefaultDisplayDpi).toString());
            DisplayMetrics.DENSITY_DEVICE = mCurDefaultDisplayDpi;
            Bitmap.setDefaultDensity(160);
        }
    }

    private void updateVisibility(ActivityClientRecord activityclientrecord, boolean flag)
    {
        View view = activityclientrecord.activity.mDecor;
        if (view != null)
            if (flag)
            {
                if (!activityclientrecord.activity.mVisibleFromServer)
                {
                    activityclientrecord.activity.mVisibleFromServer = true;
                    mNumVisibleActivities = 1 + mNumVisibleActivities;
                    if (activityclientrecord.activity.mVisibleFromClient)
                        activityclientrecord.activity.makeVisible();
                }
                if (activityclientrecord.newConfig != null)
                {
                    performConfigurationChanged(activityclientrecord.activity, activityclientrecord.newConfig);
                    freeTextLayoutCachesIfNeeded(activityclientrecord.activity.mCurrentConfig.diff(activityclientrecord.newConfig));
                    activityclientrecord.newConfig = null;
                }
            } else
            if (activityclientrecord.activity.mVisibleFromServer)
            {
                activityclientrecord.activity.mVisibleFromServer = false;
                mNumVisibleActivities = -1 + mNumVisibleActivities;
                view.setVisibility(4);
                return;
            }
    }

    public boolean AddToQueryHistory(String s, Throwable throwable, int i)
    {
        boolean flag;
        try
        {
            flag = mQueryHistory.Add(s, throwable, i);
        }
        catch (Exception exception)
        {
            Log.e("CursorLeakDetecter", "AddToQueryHistory", exception);
            return true;
        }
        return flag;
    }

    public void DumpQueryHistory()
    {
        mQueryHistory.Dump();
    }

    public void RemoveFromQueryHistory(int i)
    {
        try
        {
            mQueryHistory.Remove(i);
            return;
        }
        catch (Exception exception)
        {
            Log.e("CursorLeakDetecter", "AddToQueryHistory", exception);
        }
    }

    public final IContentProvider acquireExistingProvider(Context context, String s, int i, boolean flag)
    {
        HashMap hashmap = mProviderMap;
        hashmap;
        JVM INSTR monitorenter ;
        ProviderClientRecord providerclientrecord;
        ProviderKey providerkey = new ProviderKey(s, i);
        providerclientrecord = (ProviderClientRecord)mProviderMap.get(providerkey);
        if (providerclientrecord != null)
            break MISSING_BLOCK_LABEL_44;
        hashmap;
        JVM INSTR monitorexit ;
        return null;
        IContentProvider icontentprovider;
        IBinder ibinder;
        icontentprovider = providerclientrecord.mProvider;
        ibinder = icontentprovider.asBinder();
        if (ibinder.isBinderAlive())
            break MISSING_BLOCK_LABEL_124;
        Log.i("ActivityThread", (new StringBuilder()).append("Acquiring provider ").append(s).append(" for user ").append(i).append(": existing object's process dead").toString());
        handleUnstableProviderDiedLocked(ibinder, true);
        hashmap;
        JVM INSTR monitorexit ;
        return null;
        ProviderRefCount providerrefcount = (ProviderRefCount)mProviderRefCountMap.get(ibinder);
        if (providerrefcount == null)
            break MISSING_BLOCK_LABEL_151;
        incProviderRefLocked(providerrefcount, flag);
        hashmap;
        JVM INSTR monitorexit ;
        return icontentprovider;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final IContentProvider acquireProvider(Context context, String s, int i, boolean flag)
    {
        IContentProvider icontentprovider = acquireExistingProvider(context, s, i, flag);
        if (icontentprovider != null)
            return icontentprovider;
        IActivityManager.ContentProviderHolder contentproviderholder1 = ActivityManagerNative.getDefault().getContentProvider(getApplicationThread(), s, i, flag);
        IActivityManager.ContentProviderHolder contentproviderholder = contentproviderholder1;
_L2:
        if (contentproviderholder == null)
        {
            Slog.e("ActivityThread", (new StringBuilder()).append("Failed to find provider info for ").append(s).toString());
            return null;
        } else
        {
            return installProvider(context, contentproviderholder, contentproviderholder.info, true, contentproviderholder.noReleaseNeeded, flag).provider;
        }
        RemoteException remoteexception;
        remoteexception;
        contentproviderholder = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    final Configuration applyCompatConfiguration(int i)
    {
        Configuration configuration = mConfiguration;
        if (mCompatConfiguration == null)
            mCompatConfiguration = new Configuration();
        mCompatConfiguration.setTo(mConfiguration);
        if (mResCompatibilityInfo != null && !mResCompatibilityInfo.supportsScreen())
        {
            mResCompatibilityInfo.applyToConfiguration(i, mCompatConfiguration);
            configuration = mCompatConfiguration;
        }
        return configuration;
    }

    Configuration applyConfigCompatMainThread(int i, Configuration configuration, CompatibilityInfo compatibilityinfo)
    {
        if (configuration == null)
            return null;
        if (compatibilityinfo != null && !compatibilityinfo.supportsScreen())
        {
            mMainThreadConfig.setTo(configuration);
            configuration = mMainThreadConfig;
            compatibilityinfo.applyToConfiguration(i, configuration);
        }
        return configuration;
    }

    public final void applyConfigurationToResources(Configuration configuration)
    {
        synchronized (mPackages)
        {
            applyConfigurationToResourcesLocked(configuration, null);
        }
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    final boolean applyConfigurationToResourcesLocked(Configuration configuration, CompatibilityInfo compatibilityinfo)
    {
        if (mResConfiguration == null)
            mResConfiguration = new Configuration();
        if (!mResConfiguration.isOtherSeqNewer(configuration) && compatibilityinfo == null)
            return false;
        int i = mResConfiguration.updateFrom(configuration);
        flushDisplayMetricsLocked();
        DisplayMetrics displaymetrics = getDisplayMetricsLocked(0, null);
        if (compatibilityinfo != null && (mResCompatibilityInfo == null || !mResCompatibilityInfo.equals(compatibilityinfo)))
        {
            mResCompatibilityInfo = compatibilityinfo;
            i |= 0xd00;
        }
        if (configuration.locale != null)
            Locale.setDefault(configuration.locale);
        Resources.updateSystemConfiguration(configuration, displaymetrics, compatibilityinfo);
        ApplicationPackageManager.configurationChanged();
        Configuration configuration1 = null;
        for (Iterator iterator = mActiveResources.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            Resources resources = (Resources)((WeakReference)entry.getValue()).get();
            if (resources != null)
            {
                int j = ((ResourcesKey)entry.getKey()).mDisplayId;
                boolean flag;
                if (j == 0)
                    flag = true;
                else
                    flag = false;
                DisplayMetrics displaymetrics1 = displaymetrics;
                Configuration configuration2 = ((ResourcesKey)entry.getKey()).mOverrideConfiguration;
                if (flag && configuration2 == null)
                {
                    resources.updateConfiguration(configuration, displaymetrics1, compatibilityinfo);
                } else
                {
                    if (configuration1 == null)
                        configuration1 = new Configuration();
                    configuration1.setTo(configuration);
                    if (!flag)
                    {
                        displaymetrics1 = getDisplayMetricsLocked(j, null);
                        applyNonDefaultDisplayMetricsToConfigurationLocked(displaymetrics1, configuration1);
                    }
                    if (configuration2 != null)
                        configuration1.updateFrom(configuration2);
                    resources.updateConfiguration(configuration1, displaymetrics1, compatibilityinfo);
                }
            } else
            {
                iterator.remove();
            }
        }

        return i != 0;
    }

    final void applyNonDefaultDisplayMetricsToConfigurationLocked(DisplayMetrics displaymetrics, Configuration configuration)
    {
        configuration.touchscreen = 1;
        configuration.densityDpi = displaymetrics.densityDpi;
        configuration.screenWidthDp = (int)((float)displaymetrics.widthPixels / displaymetrics.density);
        configuration.screenHeightDp = (int)((float)displaymetrics.heightPixels / displaymetrics.density);
        int i = Configuration.resetScreenLayout(configuration.screenLayout);
        if (displaymetrics.widthPixels > displaymetrics.heightPixels)
        {
            configuration.orientation = 2;
            configuration.screenLayout = Configuration.reduceScreenLayout(i, configuration.screenWidthDp, configuration.screenHeightDp);
        } else
        {
            configuration.orientation = 1;
            configuration.screenLayout = Configuration.reduceScreenLayout(i, configuration.screenHeightDp, configuration.screenWidthDp);
        }
        configuration.smallestScreenWidthDp = configuration.screenWidthDp;
        configuration.compatScreenWidthDp = configuration.screenWidthDp;
        configuration.compatScreenHeightDp = configuration.screenHeightDp;
        configuration.compatSmallestScreenWidthDp = configuration.smallestScreenWidthDp;
    }

    ArrayList collectComponentCallbacks(boolean flag, Configuration configuration)
    {
        ArrayList arraylist = new ArrayList();
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        int i = mAllApplications.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        arraylist.add(mAllApplications.get(j));
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        Iterator iterator2;
        if (mActivities.size() <= 0)
            break MISSING_BLOCK_LABEL_192;
        iterator2 = mActivities.values().iterator();
_L7:
        ActivityClientRecord activityclientrecord;
        Activity activity;
        do
        {
            if (!iterator2.hasNext())
                break MISSING_BLOCK_LABEL_192;
            activityclientrecord = (ActivityClientRecord)iterator2.next();
            activity = activityclientrecord.activity;
        } while (activity == null);
        Configuration configuration1 = applyConfigCompatMainThread(mCurDefaultDisplayDpi, configuration, activityclientrecord.packageInfo.mCompatibilityInfo.getIfNeeded());
        if (activityclientrecord.activity.mFinished) goto _L4; else goto _L3
_L3:
        if (flag) goto _L6; else goto _L5
_L5:
        if (activityclientrecord.paused) goto _L4; else goto _L6
_L6:
        arraylist.add(activity);
          goto _L7
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        if (configuration1 == null) goto _L7; else goto _L8
_L8:
        activityclientrecord.newConfig = configuration1;
          goto _L7
        if (mServices.size() > 0)
        {
            for (Iterator iterator1 = mServices.values().iterator(); iterator1.hasNext(); arraylist.add((Service)iterator1.next()));
        }
        hashmap;
        JVM INSTR monitorexit ;
        HashMap hashmap1 = mProviderMap;
        hashmap1;
        JVM INSTR monitorenter ;
        if (mLocalProviders.size() > 0)
        {
            for (Iterator iterator = mLocalProviders.values().iterator(); iterator.hasNext(); arraylist.add(((ProviderClientRecord)iterator.next()).mLocalProvider));
        }
        break MISSING_BLOCK_LABEL_319;
        Exception exception1;
        exception1;
        hashmap1;
        JVM INSTR monitorexit ;
        throw exception1;
        hashmap1;
        JVM INSTR monitorexit ;
        return arraylist;
    }

    final void completeRemoveProvider(ProviderRefCount providerrefcount)
    {
        HashMap hashmap = mProviderMap;
        hashmap;
        JVM INSTR monitorenter ;
        if (mRemoveProviders.contains(providerrefcount))
        {
            mRemoveProviders.remove(providerrefcount);
            if (providerrefcount.removePending)
                break MISSING_BLOCK_LABEL_45;
            return;
        }
        return;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        IBinder ibinder = providerrefcount.holder.provider.asBinder();
        if ((ProviderRefCount)mProviderRefCountMap.get(ibinder) == providerrefcount)
            mProviderRefCountMap.remove(ibinder);
        Iterator iterator = mProviderMap.values().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((ProviderClientRecord)iterator.next()).mProvider.asBinder() == ibinder)
                iterator.remove();
        } while (true);
        hashmap;
        JVM INSTR monitorexit ;
        try
        {
            ActivityManagerNative.getDefault().removeContentProvider(providerrefcount.holder.connection, false);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    void doGcIfNeeded()
    {
        mGcIdlerScheduled = false;
        long l = SystemClock.uptimeMillis();
        if (5000L + BinderInternal.getLastGcTime() < l)
            BinderInternal.forceGc("bg");
    }

    void ensureJitEnabled()
    {
        if (!mJitEnabled)
        {
            mJitEnabled = true;
            VMRuntime.getRuntime().startJitCompilation();
        }
    }

    final void finishInstrumentation(int i, Bundle bundle)
    {
        IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
        if (mProfiler.profileFile != null && mProfiler.handlingProfiling && mProfiler.profileFd == null)
            Debug.stopMethodTracing();
        try
        {
            iactivitymanager.finishInstrumentation(mAppThread, i, bundle);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    final void freeTextLayoutCachesIfNeeded(int i)
    {
        if (i != 0)
        {
            boolean flag;
            if ((i & 4) != 0)
                flag = true;
            else
                flag = false;
            if (flag)
                Canvas.freeTextLayoutCaches();
        }
    }

    public final Activity getActivity(IBinder ibinder)
    {
        return ((ActivityClientRecord)mActivities.get(ibinder)).activity;
    }

    public Application getApplication()
    {
        return mInitialApplication;
    }

    public ApplicationThread getApplicationThread()
    {
        return mAppThread;
    }

    public Configuration getConfiguration()
    {
        return mResConfiguration;
    }

    DisplayMetrics getDisplayMetricsLocked(int i, CompatibilityInfo compatibilityinfo)
    {
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        DisplayMetrics displaymetrics;
        if (flag)
            displaymetrics = (DisplayMetrics)mDefaultDisplayMetrics.get(compatibilityinfo);
        else
            displaymetrics = null;
        if (displaymetrics != null)
            return displaymetrics;
        DisplayMetrics displaymetrics1 = new DisplayMetrics();
        DisplayManagerGlobal displaymanagerglobal = DisplayManagerGlobal.getInstance();
        if (displaymanagerglobal == null)
        {
            displaymetrics1.setToDefaults();
            return displaymetrics1;
        }
        if (flag)
            mDefaultDisplayMetrics.put(compatibilityinfo, displaymetrics1);
        CompatibilityInfoHolder compatibilityinfoholder = new CompatibilityInfoHolder();
        compatibilityinfoholder.set(compatibilityinfo);
        Display display = displaymanagerglobal.getCompatibleDisplay(i, compatibilityinfoholder);
        if (display != null)
            display.getMetrics(displaymetrics1);
        else
            displaymetrics1.setToDefaults();
        return displaymetrics1;
    }

    final Handler getHandler()
    {
        return mH;
    }

    public Instrumentation getInstrumentation()
    {
        return mInstrumentation;
    }

    public int getIntCoreSetting(String s, int i)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        int j;
        if (mCoreSettings == null)
            break MISSING_BLOCK_LABEL_30;
        j = mCoreSettings.getInt(s, i);
        return j;
        hashmap;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Looper getLooper()
    {
        return mLooper;
    }

    public final LoadedApk getPackageInfo(ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo, int i)
    {
        boolean flag;
        boolean flag1;
label0:
        {
            if ((i & 1) != 0)
                flag = true;
            else
                flag = false;
            flag1 = false;
            if (!flag)
                break label0;
            int j = applicationinfo.uid;
            flag1 = false;
            if (j == 0)
                break label0;
            int k = applicationinfo.uid;
            flag1 = false;
            if (k == 1000)
                break label0;
            if (mBoundApplication != null)
            {
                boolean flag2 = UserHandle.isSameApp(applicationinfo.uid, mBoundApplication.appInfo.uid);
                flag1 = false;
                if (flag2)
                    break label0;
            }
            flag1 = true;
        }
        Slog.d("ActivityThread", (new StringBuilder()).append("getPackageInfo: securityViolation=").append(flag1).toString());
        if ((i & 3) == 1 && flag1)
        {
            String s = (new StringBuilder()).append("Requesting code from ").append(applicationinfo.packageName).append(" (with uid ").append(applicationinfo.uid).append(")").toString();
            if (mBoundApplication != null)
                s = (new StringBuilder()).append(s).append(" to be run in process ").append(mBoundApplication.processName).append(" (with uid ").append(mBoundApplication.appInfo.uid).append(")").toString();
            throw new SecurityException(s);
        } else
        {
            return getPackageInfo(applicationinfo, compatibilityinfo, null, flag1, flag);
        }
    }

    public final LoadedApk getPackageInfo(String s, CompatibilityInfo compatibilityinfo, int i)
    {
        return getPackageInfo(s, compatibilityinfo, i, UserHandle.myUserId());
    }

    public final LoadedApk getPackageInfo(String s, CompatibilityInfo compatibilityinfo, int i, int j)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        if ((i & 1) == 0) goto _L2; else goto _L1
_L1:
        WeakReference weakreference = (WeakReference)mPackages.get(s);
_L10:
        if (weakreference == null) goto _L4; else goto _L3
_L3:
        LoadedApk loadedapk = (LoadedApk)weakreference.get();
_L12:
        if (loadedapk == null) goto _L6; else goto _L5
_L5:
        if (loadedapk.mResources != null && !loadedapk.mResources.getAssets().isUpToDate()) goto _L6; else goto _L7
_L7:
        if (!loadedapk.isSecurityViolation() || (i & 2) != 0) goto _L9; else goto _L8
_L8:
        throw new SecurityException((new StringBuilder()).append("Requesting code from ").append(s).append(" to be run in process ").append(mBoundApplication.processName).append("/").append(mBoundApplication.appInfo.uid).toString());
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        weakreference = (WeakReference)mResourcePackages.get(s);
          goto _L10
_L9:
        hashmap;
        JVM INSTR monitorexit ;
        return loadedapk;
_L6:
        hashmap;
        JVM INSTR monitorexit ;
        ApplicationInfo applicationinfo1 = getPackageManager().getApplicationInfo(s, 1024, j);
        ApplicationInfo applicationinfo = applicationinfo1;
_L11:
        if (applicationinfo != null)
            return getPackageInfo(applicationinfo, compatibilityinfo, i);
        else
            return null;
        RemoteException remoteexception;
        remoteexception;
        applicationinfo = null;
        if (true) goto _L11; else goto _L4
_L4:
        loadedapk = null;
          goto _L12
    }

    public final LoadedApk getPackageInfoNoCheck(ApplicationInfo applicationinfo, CompatibilityInfo compatibilityinfo)
    {
        return getPackageInfo(applicationinfo, compatibilityinfo, null, false, true);
    }

    public String getProcessName()
    {
        return mBoundApplication.processName;
    }

    public String getProfileFilePath()
    {
        return mProfiler.profileFile;
    }

    public ContextImpl getSystemContext()
    {
        this;
        JVM INSTR monitorenter ;
        if (mSystemContext == null)
        {
            ContextImpl contextimpl = ContextImpl.createSystemContext(this);
            contextimpl.init(new LoadedApk(this, "android", contextimpl, null, CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO), null, this);
            contextimpl.getResources().updateConfiguration(getConfiguration(), getDisplayMetricsLocked(0, CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO));
            mSystemContext = contextimpl;
        }
        this;
        JVM INSTR monitorexit ;
        return mSystemContext;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    Resources getTopLevelResources(String s, int i, Configuration configuration, LoadedApk loadedapk)
    {
        return getTopLevelResources(s, i, configuration, loadedapk.mCompatibilityInfo.get());
    }

    Resources getTopLevelResources(String s, int i, Configuration configuration, CompatibilityInfo compatibilityinfo)
    {
        ResourcesKey resourceskey = new ResourcesKey(s, i, configuration, compatibilityinfo.applicationScale);
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        WeakReference weakreference = (WeakReference)mActiveResources.get(resourceskey);
        if (weakreference == null) goto _L2; else goto _L1
_L1:
        Resources resources = (Resources)weakreference.get();
_L4:
        if (resources == null)
            break MISSING_BLOCK_LABEL_77;
        if (!resources.getAssets().isUpToDate())
            break MISSING_BLOCK_LABEL_77;
        hashmap;
        JVM INSTR monitorexit ;
        return resources;
        hashmap;
        JVM INSTR monitorexit ;
        Resources resources1;
        Resources resources2;
        HashMap hashmap1;
        AssetManager assetmanager = new AssetManager();
        int j = assetmanager.addAssetPath(s);
        resources1 = null;
        if (j == 0)
            break MISSING_BLOCK_LABEL_323;
        DisplayMetrics displaymetrics = getDisplayMetricsLocked(i, null);
        Exception exception;
        boolean flag;
        Configuration configuration1;
        Exception exception1;
        WeakReference weakreference1;
        Resources resources3;
        if (i == 0)
            flag = true;
        else
            flag = false;
        if (!flag || resourceskey.mOverrideConfiguration != null)
        {
            configuration1 = new Configuration(getConfiguration());
            if (!flag)
                applyNonDefaultDisplayMetricsToConfigurationLocked(displaymetrics, configuration1);
            if (resourceskey.mOverrideConfiguration != null)
                configuration1.updateFrom(resourceskey.mOverrideConfiguration);
        } else
        {
            configuration1 = getConfiguration();
        }
        resources2 = new Resources(assetmanager, displaymetrics, configuration1, compatibilityinfo);
        hashmap1 = mPackages;
        hashmap1;
        JVM INSTR monitorenter ;
        weakreference1 = (WeakReference)mActiveResources.get(resourceskey);
        resources3 = null;
        if (weakreference1 == null)
            break MISSING_BLOCK_LABEL_236;
        resources3 = (Resources)weakreference1.get();
        if (resources3 == null)
            break MISSING_BLOCK_LABEL_297;
        if (!resources3.getAssets().isUpToDate())
            break MISSING_BLOCK_LABEL_297;
        resources2.getAssets().close();
        hashmap1;
        JVM INSTR monitorexit ;
        return resources3;
        exception1;
        hashmap1;
        JVM INSTR monitorexit ;
        throw exception1;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        mActiveResources.put(resourceskey, new WeakReference(resources2));
        hashmap1;
        JVM INSTR monitorexit ;
        resources1 = resources2;
        return resources1;
_L2:
        resources = null;
        if (true) goto _L4; else goto _L3
_L3:
    }

    final void handleActivityConfigurationChanged(IBinder ibinder)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord != null && activityclientrecord.activity != null)
        {
            performConfigurationChanged(activityclientrecord.activity, mCompatConfiguration);
            freeTextLayoutCachesIfNeeded(activityclientrecord.activity.mCurrentConfig.diff(mCompatConfiguration));
            return;
        } else
        {
            return;
        }
    }

    final void handleConfigurationChanged(Configuration configuration, CompatibilityInfo compatibilityinfo)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        if (mPendingConfiguration != null)
        {
            if (!mPendingConfiguration.isOtherSeqNewer(configuration))
            {
                configuration = mPendingConfiguration;
                mCurDefaultDisplayDpi = configuration.densityDpi;
                updateDefaultDensity();
            }
            mPendingConfiguration = null;
        }
        if (configuration != null)
            break MISSING_BLOCK_LABEL_54;
        hashmap;
        JVM INSTR monitorexit ;
        return;
        applyConfigurationToResourcesLocked(configuration, compatibilityinfo);
        if (mConfiguration == null)
            mConfiguration = new Configuration();
        if (mConfiguration.isOtherSeqNewer(configuration) || compatibilityinfo != null)
            break MISSING_BLOCK_LABEL_104;
        hashmap;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        int i;
        Configuration configuration1;
        i = mConfiguration.diff(configuration);
        mConfiguration.updateFrom(configuration);
        configuration1 = applyCompatConfiguration(mCurDefaultDisplayDpi);
        hashmap;
        JVM INSTR monitorexit ;
        ArrayList arraylist = collectComponentCallbacks(false, configuration1);
        WindowManagerGlobal.getInstance().trimLocalMemory();
        freeTextLayoutCachesIfNeeded(i);
        if (arraylist != null)
        {
            int j = arraylist.size();
            for (int k = 0; k < j; k++)
                performConfigurationChanged((ComponentCallbacks2)arraylist.get(k), configuration1);

        }
        return;
    }

    final void handleDispatchPackageBroadcast(int i, String as[])
    {
        boolean flag = false;
        if (as != null)
        {
            for (int j = -1 + as.length; j >= 0; j--)
            {
                if (!flag)
                {
                    WeakReference weakreference = (WeakReference)mPackages.get(as[j]);
                    if (weakreference != null && weakreference.get() != null)
                    {
                        flag = true;
                    } else
                    {
                        WeakReference weakreference1 = (WeakReference)mResourcePackages.get(as[j]);
                        if (weakreference1 != null && weakreference1.get() != null)
                            flag = true;
                    }
                }
                mPackages.remove(as[j]);
                mResourcePackages.remove(as[j]);
            }

        }
        ApplicationPackageManager.handlePackageBroadcast(i, as, flag);
    }

    final void handleLowMemory()
    {
        ArrayList arraylist = collectComponentCallbacks(true, null);
        int i = arraylist.size();
        for (int j = 0; j < i; j++)
            ((ComponentCallbacks2)arraylist.get(j)).onLowMemory();

        if (Process.myUid() != 1000)
            EventLog.writeEvent(0x124fb, SQLiteDatabase.releaseMemory());
        Canvas.freeCaches();
        Canvas.freeTextLayoutCaches();
        BinderInternal.forceGc("mem");
    }

    final void handleProfilerControl(boolean flag, ProfilerControlData profilercontroldata, int i)
    {
        if (!flag) goto _L2; else goto _L1
_L1:
        try
        {
            mProfiler.setProfiler(profilercontroldata.path, profilercontroldata.fd);
            mProfiler.autoStopProfiler = false;
            mProfiler.startProfiling();
            break MISSING_BLOCK_LABEL_34;
        }
        catch (RuntimeException runtimeexception) { }
        Slog.w("ActivityThread", (new StringBuilder()).append("Profiling failed on path ").append(profilercontroldata.path).append(" -- can the process access this path?").toString());
        profilercontroldata.fd.close();
        return;
        ioexception1;
        s = "ActivityThread";
        s1 = "Failure closing profile fd";
_L4:
        Slog.w(s, s1, ioexception1);
        return;
        exception;
        try
        {
            profilercontroldata.fd.close();
        }
        catch (IOException ioexception)
        {
            Slog.w("ActivityThread", "Failure closing profile fd", ioexception);
        }
        throw exception;
_L2:
        mProfiler.stopProfiling();
        return;
        Exception exception;
        IOException ioexception1;
        String s;
        String s1;
        try
        {
            profilercontroldata.fd.close();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception1)
        {
            s = "ActivityThread";
        }
        s1 = "Failure closing profile fd";
        if (true) goto _L4; else goto _L3
_L3:
    }

    final void handleResumeActivity(IBinder ibinder, boolean flag, boolean flag1, boolean flag2)
    {
        ActivityClientRecord activityclientrecord;
        unscheduleGcIdler();
        activityclientrecord = performResumeActivity(ibinder, flag);
        if (activityclientrecord == null) goto _L2; else goto _L1
_L1:
        boolean flag3;
        Activity activity = activityclientrecord.activity;
        char c;
        android.view.WindowManager.LayoutParams layoutparams;
        View view;
        WindowManager windowmanager;
        android.view.WindowManager.LayoutParams layoutparams1;
        boolean flag4;
        if (flag1)
            c = '\u0100';
        else
            c = '\0';
        if (!activity.mStartedActivity)
            flag3 = true;
        else
            flag3 = false;
        if (flag3)
            break MISSING_BLOCK_LABEL_68;
        flag4 = ActivityManagerNative.getDefault().willActivityBeVisible(activity.getActivityToken());
        flag3 = flag4;
_L7:
        if (activityclientrecord.window != null || activity.mFinished || !flag3) goto _L4; else goto _L3
_L3:
        activityclientrecord.window = activityclientrecord.activity.getWindow();
        view = activityclientrecord.window.getDecorView();
        view.setVisibility(4);
        windowmanager = activity.getWindowManager();
        layoutparams1 = activityclientrecord.window.getAttributes();
        activity.mDecor = view;
        layoutparams1.type = 1;
        layoutparams1.softInputMode = c | layoutparams1.softInputMode;
        if (activity.mVisibleFromClient)
        {
            activity.mWindowAdded = true;
            windowmanager.addView(view, layoutparams1);
        }
_L5:
        cleanUpPendingRemoveWindows(activityclientrecord);
        if (!activityclientrecord.activity.mFinished && flag3 && activityclientrecord.activity.mDecor != null && !activityclientrecord.hideForNow)
        {
            if (activityclientrecord.newConfig != null)
            {
                performConfigurationChanged(activityclientrecord.activity, activityclientrecord.newConfig);
                freeTextLayoutCachesIfNeeded(activityclientrecord.activity.mCurrentConfig.diff(activityclientrecord.newConfig));
                activityclientrecord.newConfig = null;
            }
            layoutparams = activityclientrecord.window.getAttributes();
            if ((0x100 & layoutparams.softInputMode) != c)
            {
                layoutparams.softInputMode = c | 0xfffffeff & layoutparams.softInputMode;
                if (activityclientrecord.activity.mVisibleFromClient)
                    activity.getWindowManager().updateViewLayout(activityclientrecord.window.getDecorView(), layoutparams);
            }
            activityclientrecord.activity.mVisibleFromServer = true;
            mNumVisibleActivities = 1 + mNumVisibleActivities;
            if (activityclientrecord.activity.mVisibleFromClient)
                activityclientrecord.activity.makeVisible();
        }
        if (!activityclientrecord.onlyLocalRequest)
        {
            activityclientrecord.nextIdle = mNewActivities;
            mNewActivities = activityclientrecord;
            Looper.myQueue().addIdleHandler(new Idler());
        }
        activityclientrecord.onlyLocalRequest = false;
        if (!flag2)
            break MISSING_BLOCK_LABEL_441;
        ActivityManagerNative.getDefault().activityResumed(ibinder);
        return;
_L4:
        if (!flag3)
            activityclientrecord.hideForNow = true;
        if (true) goto _L5; else goto _L2
_L2:
        try
        {
            ActivityManagerNative.getDefault().finishActivity(ibinder, 0, null);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        RemoteException remoteexception1;
        remoteexception1;
        return;
        RemoteException remoteexception2;
        remoteexception2;
        if (true) goto _L7; else goto _L6
_L6:
    }

    final void handleTrimMemory(int i)
    {
        WindowManagerGlobal windowmanagerglobal = WindowManagerGlobal.getInstance();
        windowmanagerglobal.startTrimMemory(i);
        ArrayList arraylist = collectComponentCallbacks(true, null);
        int j = arraylist.size();
        for (int k = 0; k < j; k++)
            ((ComponentCallbacks2)arraylist.get(k)).onTrimMemory(i);

        windowmanagerglobal.endTrimMemory();
    }

    final void handleUnstableProviderDied(IBinder ibinder, boolean flag)
    {
        synchronized (mProviderMap)
        {
            handleUnstableProviderDiedLocked(ibinder, flag);
        }
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    final void handleUnstableProviderDiedLocked(IBinder ibinder, boolean flag)
    {
        ProviderRefCount providerrefcount;
        providerrefcount = (ProviderRefCount)mProviderRefCountMap.get(ibinder);
        if (providerrefcount == null)
            break MISSING_BLOCK_LABEL_168;
        mProviderRefCountMap.remove(ibinder);
        if (providerrefcount.client != null && providerrefcount.client.mNames != null)
        {
            String as[] = providerrefcount.client.mNames;
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s = as[j];
                ProviderClientRecord providerclientrecord = (ProviderClientRecord)mProviderMap.get(s);
                if (providerclientrecord != null && providerclientrecord.mProvider.asBinder() == ibinder)
                {
                    Slog.i("ActivityThread", (new StringBuilder()).append("Removing dead content provider: ").append(s).toString());
                    mProviderMap.remove(s);
                }
            }

        }
        if (!flag)
            break MISSING_BLOCK_LABEL_168;
        ActivityManagerNative.getDefault().unstableProviderDied(providerrefcount.holder.connection);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    final void handlesetTrimMemoryFlagEx()
    {
        is_trim = true;
    }

    public void installSystemApplicationInfo(ApplicationInfo applicationinfo)
    {
        this;
        JVM INSTR monitorenter ;
        ContextImpl contextimpl = getSystemContext();
        contextimpl.init(new LoadedApk(this, "android", contextimpl, applicationinfo, CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO), null, this);
        mProfiler = new Profiler();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final void installSystemProviders(List list)
    {
        if (list != null)
            installContentProviders(mInitialApplication, list);
    }

    public boolean isProfiling()
    {
        return mProfiler != null && mProfiler.profileFile != null && mProfiler.profileFd == null;
    }

    public final LoadedApk peekPackageInfo(String s, boolean flag)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        if (!flag) goto _L2; else goto _L1
_L1:
        WeakReference weakreference = (WeakReference)mPackages.get(s);
_L3:
        if (weakreference == null)
            break MISSING_BLOCK_LABEL_67;
        LoadedApk loadedapk = (LoadedApk)weakreference.get();
_L4:
        hashmap;
        JVM INSTR monitorexit ;
        return loadedapk;
_L2:
        weakreference = (WeakReference)mResourcePackages.get(s);
          goto _L3
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        loadedapk = null;
          goto _L4
    }

    public final ActivityClientRecord performDestroyActivity(IBinder ibinder, boolean flag)
    {
        return performDestroyActivity(ibinder, flag, 0, false);
    }

    public final void performNewIntents(IBinder ibinder, List list)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord != null)
        {
            boolean flag;
            if (!activityclientrecord.paused)
                flag = true;
            else
                flag = false;
            if (flag)
            {
                activityclientrecord.activity.mTemporaryPause = true;
                mInstrumentation.callActivityOnPause(activityclientrecord.activity);
            }
            deliverNewIntents(activityclientrecord, list);
            if (flag)
            {
                activityclientrecord.activity.performResume();
                activityclientrecord.activity.mTemporaryPause = false;
            }
        }
    }

    final Bundle performPauseActivity(ActivityClientRecord activityclientrecord, boolean flag, boolean flag1)
    {
        if (!activityclientrecord.paused) goto _L2; else goto _L1
_L1:
        if (!activityclientrecord.activity.mFinished) goto _L4; else goto _L3
_L3:
        Bundle bundle = null;
_L6:
        return bundle;
_L4:
        RuntimeException runtimeexception = new RuntimeException((new StringBuilder()).append("Performing pause of activity that is not resumed: ").append(activityclientrecord.intent.getComponent().toShortString()).toString());
        Slog.e("ActivityThread", runtimeexception.getMessage(), runtimeexception);
_L2:
        bundle = null;
        if (flag)
            activityclientrecord.activity.mFinished = true;
        boolean flag2 = activityclientrecord.activity.mFinished;
        bundle = null;
        if (flag2)
            break MISSING_BLOCK_LABEL_152;
        bundle = null;
        if (!flag1)
            break MISSING_BLOCK_LABEL_152;
        Bundle bundle1 = new Bundle();
        bundle1.setAllowFds(false);
        mInstrumentation.callActivityOnSaveInstanceState(activityclientrecord.activity, bundle1);
        activityclientrecord.state = bundle1;
        bundle = bundle1;
        activityclientrecord.activity.mCalled = false;
        mInstrumentation.callActivityOnPause(activityclientrecord.activity);
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(UserHandle.myUserId());
        aobj[1] = activityclientrecord.activity.getComponentName().getClassName();
        EventLog.writeEvent(30021, aobj);
        if (!mIsUserBuild)
            Slog.d("ActivityThread", (new StringBuilder()).append("ACT-AM_ON_PAUSE_CALLED ").append(activityclientrecord).toString());
        if (!activityclientrecord.activity.mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(" did not call through to super.onPause()").toString());
          goto _L5
        SuperNotCalledException supernotcalledexception;
        supernotcalledexception;
_L8:
        throw supernotcalledexception;
        Exception exception;
        exception;
_L7:
        if (!mInstrumentation.onException(activityclientrecord.activity, exception))
            throw new RuntimeException((new StringBuilder()).append("Unable to pause activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
_L5:
        activityclientrecord.paused = true;
        ArrayList arraylist;
        synchronized (mOnPauseListeners)
        {
            arraylist = (ArrayList)mOnPauseListeners.remove(activityclientrecord.activity);
        }
        int i = 0;
        if (arraylist != null)
            i = arraylist.size();
        int j = 0;
        while (j < i) 
        {
            ((OnActivityPausedListener)arraylist.get(j)).onPaused(activityclientrecord.activity);
            j++;
        }
          goto _L6
        exception1;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception1;
        exception;
        bundle = bundle1;
          goto _L7
        supernotcalledexception;
          goto _L8
    }

    final Bundle performPauseActivity(IBinder ibinder, boolean flag, boolean flag1)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord != null)
            return performPauseActivity(activityclientrecord, flag, flag1);
        else
            return null;
    }

    final void performRestartActivity(IBinder ibinder)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord.stopped)
        {
            activityclientrecord.activity.performRestart();
            activityclientrecord.stopped = false;
        }
    }

    public final ActivityClientRecord performResumeActivity(IBinder ibinder, boolean flag)
    {
        ActivityClientRecord activityclientrecord = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord != null && !activityclientrecord.activity.mFinished)
        {
            if (flag)
            {
                activityclientrecord.hideForNow = false;
                activityclientrecord.activity.mStartedActivity = false;
            }
            try
            {
                activityclientrecord.activity.mFragments.noteStateNotSaved();
                if (activityclientrecord.pendingIntents != null)
                {
                    deliverNewIntents(activityclientrecord, activityclientrecord.pendingIntents);
                    activityclientrecord.pendingIntents = null;
                }
                if (activityclientrecord.pendingResults != null)
                {
                    deliverResults(activityclientrecord, activityclientrecord.pendingResults);
                    activityclientrecord.pendingResults = null;
                }
                activityclientrecord.activity.performResume();
                Object aobj[] = new Object[2];
                aobj[0] = Integer.valueOf(UserHandle.myUserId());
                aobj[1] = activityclientrecord.activity.getComponentName().getClassName();
                EventLog.writeEvent(30022, aobj);
                if (!mIsUserBuild)
                    Slog.d("ActivityThread", (new StringBuilder()).append("ACT-AM_ON_RESUME_CALLED ").append(activityclientrecord).toString());
                activityclientrecord.paused = false;
                activityclientrecord.stopped = false;
                activityclientrecord.state = null;
            }
            catch (Exception exception)
            {
                if (!mInstrumentation.onException(activityclientrecord.activity, exception))
                    throw new RuntimeException((new StringBuilder()).append("Unable to resume activity ").append(activityclientrecord.intent.getComponent().toShortString()).append(": ").append(exception.toString()).toString(), exception);
            }
        }
        return activityclientrecord;
    }

    final void performStopActivity(IBinder ibinder, boolean flag)
    {
        performStopActivityInner((ActivityClientRecord)mActivities.get(ibinder), null, false, flag);
    }

    final void performUserLeavingActivity(ActivityClientRecord activityclientrecord)
    {
        mInstrumentation.callActivityOnUserLeaving(activityclientrecord.activity);
    }

    public void registerOnActivityPausedListener(Activity activity, OnActivityPausedListener onactivitypausedlistener)
    {
        HashMap hashmap = mOnPauseListeners;
        hashmap;
        JVM INSTR monitorenter ;
        ArrayList arraylist = (ArrayList)mOnPauseListeners.get(activity);
        if (arraylist != null)
            break MISSING_BLOCK_LABEL_45;
        arraylist = new ArrayList();
        mOnPauseListeners.put(activity, arraylist);
        arraylist.add(onactivitypausedlistener);
        hashmap;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final boolean releaseProvider(IContentProvider icontentprovider, boolean flag)
    {
        IBinder ibinder;
        if (icontentprovider == null)
            return false;
        ibinder = icontentprovider.asBinder();
        HashMap hashmap = mProviderMap;
        hashmap;
        JVM INSTR monitorenter ;
        ProviderRefCount providerrefcount = (ProviderRefCount)mProviderRefCountMap.get(ibinder);
        if (providerrefcount != null)
            break MISSING_BLOCK_LABEL_53;
        hashmap;
        JVM INSTR monitorexit ;
        return false;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        if (!flag) goto _L2; else goto _L1
_L1:
        if (providerrefcount.stableCount != 0)
            break MISSING_BLOCK_LABEL_70;
        hashmap;
        JVM INSTR monitorexit ;
        return false;
        int k;
        providerrefcount.stableCount = -1 + providerrefcount.stableCount;
        k = providerrefcount.stableCount;
        boolean flag1;
        flag1 = false;
        if (k != 0)
            break MISSING_BLOCK_LABEL_151;
        int l = providerrefcount.unstableCount;
        int i;
        int j;
        IActivityManager iactivitymanager;
        IBinder ibinder1;
        int i1;
        if (l == 0)
            flag1 = true;
        else
            flag1 = false;
        iactivitymanager = ActivityManagerNative.getDefault();
        ibinder1 = providerrefcount.holder.connection;
        i1 = 0;
        if (flag1)
            i1 = 1;
        try
        {
            iactivitymanager.refContentProvider(ibinder1, -1, i1);
        }
        catch (RemoteException remoteexception1) { }
        if (!flag1)
            break MISSING_BLOCK_LABEL_204;
        if (providerrefcount.removePending)
            break MISSING_BLOCK_LABEL_302;
        mRemoveProviders.add(providerrefcount);
        providerrefcount.removePending = true;
        Message message = mH.obtainMessage(131, providerrefcount);
        mH.sendMessage(message);
_L3:
        hashmap;
        JVM INSTR monitorexit ;
        return true;
_L2:
        if (providerrefcount.unstableCount != 0)
            break MISSING_BLOCK_LABEL_222;
        hashmap;
        JVM INSTR monitorexit ;
        return false;
        providerrefcount.unstableCount = -1 + providerrefcount.unstableCount;
        i = providerrefcount.unstableCount;
        flag1 = false;
        if (i != 0)
            break MISSING_BLOCK_LABEL_151;
        j = providerrefcount.stableCount;
        RemoteException remoteexception;
        if (j == 0)
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
            break MISSING_BLOCK_LABEL_151;
        try
        {
            ActivityManagerNative.getDefault().refContentProvider(providerrefcount.holder.connection, 0, -1);
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception) { }
        break MISSING_BLOCK_LABEL_151;
        Slog.w("ActivityThread", (new StringBuilder()).append("Duplicate remove pending of provider ").append(((ComponentInfo) (providerrefcount.holder.info)).name).toString());
          goto _L3
    }

    public final void requestRelaunchActivity(IBinder ibinder, List list, List list1, int i, boolean flag, Configuration configuration, boolean flag1)
    {
        HashMap hashmap = mPackages;
        hashmap;
        JVM INSTR monitorenter ;
        int j = 0;
_L15:
        int k = mRelaunchingActivities.size();
        ActivityClientRecord activityclientrecord = null;
        if (j >= k) goto _L2; else goto _L1
_L1:
        ActivityClientRecord activityclientrecord1 = (ActivityClientRecord)mRelaunchingActivities.get(j);
        if (activityclientrecord1.token != ibinder) goto _L4; else goto _L3
_L3:
        activityclientrecord = activityclientrecord1;
        if (list == null) goto _L6; else goto _L5
_L5:
        if (activityclientrecord1.pendingResults == null) goto _L8; else goto _L7
_L7:
        activityclientrecord1.pendingResults.addAll(list);
_L6:
        if (list1 == null) goto _L2; else goto _L9
_L9:
        if (activityclientrecord1.pendingIntents == null) goto _L11; else goto _L10
_L10:
        activityclientrecord1.pendingIntents.addAll(list1);
        ActivityClientRecord activityclientrecord2 = activityclientrecord;
_L14:
        if (activityclientrecord2 != null) goto _L13; else goto _L12
_L12:
        ActivityClientRecord activityclientrecord3 = new ActivityClientRecord();
        activityclientrecord3.token = ibinder;
        activityclientrecord3.pendingResults = list;
        activityclientrecord3.pendingIntents = list1;
        if (flag1)
            break MISSING_BLOCK_LABEL_181;
        ActivityClientRecord activityclientrecord4 = (ActivityClientRecord)mActivities.get(ibinder);
        if (activityclientrecord4 == null)
            break MISSING_BLOCK_LABEL_175;
        activityclientrecord3.startsNotResumed = activityclientrecord4.paused;
        activityclientrecord3.onlyLocalRequest = true;
        mRelaunchingActivities.add(activityclientrecord3);
        queueOrSendMessage(126, activityclientrecord3);
_L17:
        if (!flag1)
            break MISSING_BLOCK_LABEL_217;
        activityclientrecord3.startsNotResumed = flag;
        activityclientrecord3.onlyLocalRequest = false;
        if (configuration == null)
            break MISSING_BLOCK_LABEL_229;
        activityclientrecord3.createdConfig = configuration;
        activityclientrecord3.pendingConfigChanges = i | activityclientrecord3.pendingConfigChanges;
        hashmap;
        JVM INSTR monitorexit ;
        return;
_L8:
        activityclientrecord1.pendingResults = list;
          goto _L6
_L16:
        hashmap;
        JVM INSTR monitorexit ;
        Exception exception;
        throw exception;
_L11:
        activityclientrecord1.pendingIntents = list1;
        activityclientrecord2 = activityclientrecord;
          goto _L14
_L4:
        j++;
          goto _L15
        exception;
        activityclientrecord2;
          goto _L16
_L13:
        activityclientrecord3 = activityclientrecord2;
          goto _L17
_L2:
        activityclientrecord2 = activityclientrecord;
          goto _L14
        exception;
          goto _L16
    }

    public final ActivityInfo resolveActivityInfo(Intent intent)
    {
        ActivityInfo activityinfo = intent.resolveActivityInfo(mInitialApplication.getPackageManager(), 1024);
        if (activityinfo == null)
            Instrumentation.checkStartActivityResult(-2, intent);
        return activityinfo;
    }

    final void scheduleContextCleanup(ContextImpl contextimpl, String s, String s1)
    {
        ContextCleanupInfo contextcleanupinfo = new ContextCleanupInfo();
        contextcleanupinfo.context = contextimpl;
        contextcleanupinfo.who = s;
        contextcleanupinfo.what = s1;
        queueOrSendMessage(119, contextcleanupinfo);
    }

    void scheduleGcIdler()
    {
        if (!mGcIdlerScheduled)
        {
            mGcIdlerScheduled = true;
            Looper.myQueue().addIdleHandler(mGcIdler);
        }
        mH.removeMessages(120);
    }

    public final void sendActivityResult(IBinder ibinder, String s, int i, int j, Intent intent)
    {
        ArrayList arraylist = new ArrayList();
        arraylist.add(new ResultInfo(s, i, j, intent));
        mAppThread.scheduleSendResult(ibinder, arraylist);
    }

    public final Activity startActivityNow(Activity activity, String s, Intent intent, ActivityInfo activityinfo, IBinder ibinder, Bundle bundle, Activity.NonConfigurationInstances nonconfigurationinstances)
    {
        ActivityClientRecord activityclientrecord = new ActivityClientRecord();
        activityclientrecord.token = ibinder;
        activityclientrecord.ident = 0;
        activityclientrecord.intent = intent;
        activityclientrecord.state = bundle;
        activityclientrecord.parent = activity;
        activityclientrecord.embeddedID = s;
        activityclientrecord.activityInfo = activityinfo;
        activityclientrecord.lastNonConfigurationInstances = nonconfigurationinstances;
        return performLaunchActivity(activityclientrecord, null);
    }

    public void unregisterOnActivityPausedListener(Activity activity, OnActivityPausedListener onactivitypausedlistener)
    {
        HashMap hashmap = mOnPauseListeners;
        hashmap;
        JVM INSTR monitorenter ;
        ArrayList arraylist = (ArrayList)mOnPauseListeners.get(activity);
        if (arraylist == null)
            break MISSING_BLOCK_LABEL_32;
        arraylist.remove(onactivitypausedlistener);
        hashmap;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void unscheduleGcIdler()
    {
        if (mGcIdlerScheduled)
        {
            mGcIdlerScheduled = false;
            Looper.myQueue().removeIdleHandler(mGcIdler);
        }
        mH.removeMessages(120);
    }

    static 
    {
        boolean flag;
label0:
        {
            THUMBNAIL_FORMAT = android.graphics.Bitmap.Config.RGB_565;
            PATTERN_SEMICOLON = Pattern.compile(";");
            mIsUserBuild = false;
            is_trim = false;
            mSystemContext = null;
            sThreadLocal = new ThreadLocal();
            mTraceEnabled = false;
            mBooted = false;
            mEnableAppLaunchLog = false;
            mEnableLooperLog = false;
            if (!"user".equals(Build.TYPE))
            {
                boolean flag1 = "userdebug".equals(Build.TYPE);
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        IS_USER_BUILD = flag;
    }




























}
