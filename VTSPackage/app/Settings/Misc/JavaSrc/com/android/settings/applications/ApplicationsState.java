// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.Application;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.text.format.Formatter;
import java.io.File;
import java.text.Collator;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.android.settings.applications:
//            InterestingConfigChanges, CanBeOnSdCardChecker

public class ApplicationsState
{
    public static class AppEntry extends SizeInfo
    {

        final File apkFile;
        long externalSize;
        String externalSizeStr;
        Drawable icon;
        final long id;
        ApplicationInfo info;
        long internalSize;
        String internalSizeStr;
        String label;
        boolean mounted;
        String normalizedLabel;
        long size;
        long sizeLoadStart;
        boolean sizeStale;
        String sizeStr;

        boolean ensureIconLocked(Context context, PackageManager packagemanager)
        {
            if (icon == null)
            {
                if (apkFile.exists())
                {
                    icon = info.loadIcon(packagemanager);
                    return true;
                }
                mounted = false;
                icon = context.getResources().getDrawable(0x108058b);
            } else
            if (!mounted && apkFile.exists())
            {
                mounted = true;
                icon = info.loadIcon(packagemanager);
                return true;
            }
            return false;
        }

        void ensureLabel(Context context)
        {
label0:
            {
                if (label == null || !mounted)
                {
                    if (apkFile.exists())
                        break label0;
                    mounted = false;
                    label = ((PackageItemInfo) (info)).packageName;
                }
                return;
            }
            mounted = true;
            CharSequence charsequence = info.loadLabel(context.getPackageManager());
            String s;
            if (charsequence != null)
                s = charsequence.toString();
            else
                s = ((PackageItemInfo) (info)).packageName;
            label = s;
        }

        String getNormalizedLabel()
        {
            if (normalizedLabel != null)
            {
                return normalizedLabel;
            } else
            {
                normalizedLabel = ApplicationsState.normalize(label);
                return normalizedLabel;
            }
        }

        AppEntry(Context context, ApplicationInfo applicationinfo, long l)
        {
            apkFile = new File(applicationinfo.sourceDir);
            id = l;
            info = applicationinfo;
            size = -1L;
            sizeStale = true;
            ensureLabel(context);
        }
    }

    public static interface AppFilter
    {

        public abstract boolean filterApp(ApplicationInfo applicationinfo);

        public abstract void init();
    }

    class BackgroundHandler extends Handler
    {

        static final int MSG_LOAD_ENTRIES = 2;
        static final int MSG_LOAD_ICONS = 3;
        static final int MSG_LOAD_SIZES = 4;
        static final int MSG_REBUILD_LIST = 1;
        boolean mRunning;
        final android.content.pm.IPackageStatsObserver.Stub mStatsObserver = new _cls1();
        final ApplicationsState this$0;

        public void handleMessage(Message message)
        {
            HashMap hashmap = mEntriesMap;
            hashmap;
            JVM INSTR monitorenter ;
            int i = mRebuildingSessions.size();
            ArrayList arraylist;
            arraylist = null;
            if (i <= 0)
                break MISSING_BLOCK_LABEL_60;
            ArrayList arraylist1 = new ArrayList(mRebuildingSessions);
            mRebuildingSessions.clear();
            arraylist = arraylist1;
            hashmap;
            JVM INSTR monitorexit ;
            if (arraylist != null)
            {
                for (int l1 = 0; l1 < arraylist.size(); l1++)
                    ((Session)arraylist.get(l1)).handleRebuildList();

            }
              goto _L1
            Exception exception;
            exception;
_L22:
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
_L1:
            message.what;
            JVM INSTR tableswitch 1 4: default 140
        //                       1 140
        //                       2 141
        //                       3 311
        //                       4 530;
               goto _L2 _L2 _L3 _L4 _L5
_L2:
            return;
_L3:
            int j1 = 0;
            HashMap hashmap3 = mEntriesMap;
            hashmap3;
            JVM INSTR monitorenter ;
            int k1 = 0;
_L23:
            if (k1 >= mApplications.size() || j1 >= 6) goto _L7; else goto _L6
_L6:
            ApplicationInfo applicationinfo;
            if (!mRunning)
            {
                mRunning = true;
                Message message4 = mMainHandler.obtainMessage(6, Integer.valueOf(1));
                mMainHandler.sendMessage(message4);
            }
            applicationinfo = (ApplicationInfo)mApplications.get(k1);
            if (mEntriesMap.get(((PackageItemInfo) (applicationinfo)).packageName) != null) goto _L9; else goto _L8
_L8:
            j1++;
            getEntryLocked(applicationinfo);
              goto _L9
_L7:
            hashmap3;
            JVM INSTR monitorexit ;
            Exception exception4;
            if (j1 >= 6)
            {
                sendEmptyMessage(2);
                return;
            } else
            {
                sendEmptyMessage(3);
                return;
            }
            exception4;
            hashmap3;
            JVM INSTR monitorexit ;
            throw exception4;
_L4:
            int k = 0;
            HashMap hashmap2 = mEntriesMap;
            hashmap2;
            JVM INSTR monitorenter ;
            int i1 = 0;
_L24:
            if (i1 >= mAppEntries.size() || k >= 2) goto _L11; else goto _L10
_L10:
            AppEntry appentry1 = (AppEntry)mAppEntries.get(i1);
            if (appentry1.icon != null && appentry1.mounted) goto _L13; else goto _L12
_L12:
            appentry1;
            JVM INSTR monitorenter ;
            if (!appentry1.ensureIconLocked(mContext, mPm)) goto _L15; else goto _L14
_L14:
            if (!mRunning)
            {
                mRunning = true;
                Message message3 = mMainHandler.obtainMessage(6, Integer.valueOf(1));
                mMainHandler.sendMessage(message3);
            }
              goto _L16
_L15:
            appentry1;
            JVM INSTR monitorexit ;
              goto _L13
            Exception exception3;
            exception3;
            appentry1;
            JVM INSTR monitorexit ;
            throw exception3;
            Exception exception2;
            exception2;
            hashmap2;
            JVM INSTR monitorexit ;
            throw exception2;
_L11:
            hashmap2;
            JVM INSTR monitorexit ;
            if (k > 0 && !mMainHandler.hasMessages(3))
                mMainHandler.sendEmptyMessage(3);
            if (k >= 2)
            {
                sendEmptyMessage(3);
                return;
            } else
            {
                sendEmptyMessage(4);
                return;
            }
_L5:
            HashMap hashmap1 = mEntriesMap;
            hashmap1;
            JVM INSTR monitorenter ;
            if (mCurComputingSizePkg != null)
                return;
              goto _L17
            Exception exception1;
            exception1;
            hashmap1;
            JVM INSTR monitorexit ;
            throw exception1;
_L17:
            long l = SystemClock.uptimeMillis();
            int j = 0;
_L25:
            if (j >= mAppEntries.size()) goto _L19; else goto _L18
_L18:
            AppEntry appentry = (AppEntry)mAppEntries.get(j);
            if (appentry.size != -1L && !appentry.sizeStale) goto _L21; else goto _L20
_L20:
            if (appentry.sizeLoadStart == 0L || appentry.sizeLoadStart < l - 20000L)
            {
                if (!mRunning)
                {
                    mRunning = true;
                    Message message2 = mMainHandler.obtainMessage(6, Integer.valueOf(1));
                    mMainHandler.sendMessage(message2);
                }
                appentry.sizeLoadStart = l;
                mCurComputingSizePkg = ((PackageItemInfo) (appentry.info)).packageName;
                mPm.getPackageSizeInfo(mCurComputingSizePkg, mStatsObserver);
            }
            hashmap1;
            JVM INSTR monitorexit ;
            return;
_L19:
            if (!mMainHandler.hasMessages(5))
            {
                mMainHandler.sendEmptyMessage(5);
                mRunning = false;
                Message message1 = mMainHandler.obtainMessage(6, Integer.valueOf(0));
                mMainHandler.sendMessage(message1);
            }
            hashmap1;
            JVM INSTR monitorexit ;
            return;
            exception;
              goto _L22
_L9:
            k1++;
              goto _L23
_L16:
            k++;
              goto _L15
_L13:
            i1++;
              goto _L24
_L21:
            j++;
              goto _L25
        }

        BackgroundHandler(Looper looper)
        {
            this$0 = ApplicationsState.this;
            super(looper);
        }
    }

    public static interface Callbacks
    {

        public abstract void onAllSizesComputed();

        public abstract void onPackageIconChanged();

        public abstract void onPackageListChanged();

        public abstract void onPackageSizeChanged(String s);

        public abstract void onRebuildComplete(ArrayList arraylist);

        public abstract void onRunningStateChanged(boolean flag);
    }

    class MainHandler extends Handler
    {

        static final int MSG_ALL_SIZES_COMPUTED = 5;
        static final int MSG_PACKAGE_ICON_CHANGED = 3;
        static final int MSG_PACKAGE_LIST_CHANGED = 2;
        static final int MSG_PACKAGE_SIZE_CHANGED = 4;
        static final int MSG_REBUILD_COMPLETE = 1;
        static final int MSG_RUNNING_STATE_CHANGED = 6;
        final ApplicationsState this$0;

        public void handleMessage(Message message)
        {
            rebuildActiveSessions();
            switch (message.what)
            {
            default:
                break;

            case 6: // '\006'
                for (int i1 = 0; i1 < mActiveSessions.size(); i1++)
                {
                    Callbacks callbacks = ((Session)mActiveSessions.get(i1)).mCallbacks;
                    boolean flag;
                    if (message.arg1 != 0)
                        flag = true;
                    else
                        flag = false;
                    callbacks.onRunningStateChanged(flag);
                }

                break;

            case 5: // '\005'
                for (int l = 0; l < mActiveSessions.size(); l++)
                    ((Session)mActiveSessions.get(l)).mCallbacks.onAllSizesComputed();

                break;

            case 4: // '\004'
                for (int k = 0; k < mActiveSessions.size(); k++)
                    ((Session)mActiveSessions.get(k)).mCallbacks.onPackageSizeChanged((String)message.obj);

                break;

            case 3: // '\003'
                for (int j = 0; j < mActiveSessions.size(); j++)
                    ((Session)mActiveSessions.get(j)).mCallbacks.onPackageIconChanged();

                break;

            case 2: // '\002'
                for (int i = 0; i < mActiveSessions.size(); i++)
                    ((Session)mActiveSessions.get(i)).mCallbacks.onPackageListChanged();

                break;

            case 1: // '\001'
                Session session = (Session)message.obj;
                if (mActiveSessions.contains(session))
                {
                    session.mCallbacks.onRebuildComplete(session.mLastAppList);
                    return;
                }
                break;
            }
        }

        MainHandler()
        {
            this$0 = ApplicationsState.this;
            super();
        }
    }

    private class PackageIntentReceiver extends BroadcastReceiver
    {

        final ApplicationsState this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if ("android.intent.action.PACKAGE_ADDED".equals(s))
            {
                String s4 = intent.getData().getEncodedSchemeSpecificPart();
                addPackage(s4);
            } else
            {
                if ("android.intent.action.PACKAGE_REMOVED".equals(s))
                {
                    String s3 = intent.getData().getEncodedSchemeSpecificPart();
                    removePackage(s3);
                    return;
                }
                if ("android.intent.action.PACKAGE_CHANGED".equals(s))
                {
                    String s2 = intent.getData().getEncodedSchemeSpecificPart();
                    invalidatePackage(s2);
                    return;
                }
                if ("android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE".equals(s) || "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE".equals(s))
                {
                    String as[] = intent.getStringArrayExtra("android.intent.extra.changed_package_list");
                    if (as != null && as.length != 0 && "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE".equals(s))
                    {
                        int i = as.length;
                        for (int j = 0; j < i; j++)
                        {
                            String s1 = as[j];
                            invalidatePackage(s1);
                        }

                    }
                }
            }
        }

        void registerReceiver()
        {
            IntentFilter intentfilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
            intentfilter.addAction("android.intent.action.PACKAGE_REMOVED");
            intentfilter.addAction("android.intent.action.PACKAGE_CHANGED");
            intentfilter.addDataScheme("package");
            mContext.registerReceiver(this, intentfilter);
            IntentFilter intentfilter1 = new IntentFilter();
            intentfilter1.addAction("android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE");
            intentfilter1.addAction("android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE");
            mContext.registerReceiver(this, intentfilter1);
        }

        void unregisterReceiver()
        {
            mContext.unregisterReceiver(this);
        }

        private PackageIntentReceiver()
        {
            this$0 = ApplicationsState.this;
            super();
        }

    }

    public class Session
    {

        final Callbacks mCallbacks;
        ArrayList mLastAppList;
        boolean mRebuildAsync;
        Comparator mRebuildComparator;
        AppFilter mRebuildFilter;
        boolean mRebuildRequested;
        ArrayList mRebuildResult;
        final Object mRebuildSync = new Object();
        boolean mResumed;
        final ApplicationsState this$0;

        void handleRebuildList()
        {
label0:
            {
                synchronized (mRebuildSync)
                {
                    if (mRebuildRequested)
                        break label0;
                }
                return;
            }
            AppFilter appfilter;
            Comparator comparator;
            appfilter = mRebuildFilter;
            comparator = mRebuildComparator;
            mRebuildRequested = false;
            mRebuildFilter = null;
            mRebuildComparator = null;
            obj;
            JVM INSTR monitorexit ;
            ArrayList arraylist1;
            Process.setThreadPriority(-2);
            if (appfilter != null)
                appfilter.init();
            ArrayList arraylist;
            synchronized (mEntriesMap)
            {
                arraylist = new ArrayList(mApplications);
            }
            arraylist1 = new ArrayList();
            for (int i = 0; i < arraylist.size(); i++)
            {
                ApplicationInfo applicationinfo = (ApplicationInfo)arraylist.get(i);
                if (appfilter == null || appfilter.filterApp(applicationinfo))
                    synchronized (mEntriesMap)
                    {
                        AppEntry appentry = getEntryLocked(applicationinfo);
                        appentry.ensureLabel(mContext);
                        arraylist1.add(appentry);
                    }
            }

            break MISSING_BLOCK_LABEL_217;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
            exception1;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception1;
            exception3;
            hashmap1;
            JVM INSTR monitorexit ;
            throw exception3;
            Collections.sort(arraylist1, comparator);
            Object obj1 = mRebuildSync;
            obj1;
            JVM INSTR monitorenter ;
            if (mRebuildRequested) goto _L2; else goto _L1
_L1:
            mLastAppList = arraylist1;
            if (mRebuildAsync) goto _L4; else goto _L3
_L3:
            mRebuildResult = arraylist1;
            mRebuildSync.notifyAll();
_L2:
            Process.setThreadPriority(10);
            return;
_L4:
            if (!mMainHandler.hasMessages(1, this))
            {
                Message message = mMainHandler.obtainMessage(1, this);
                mMainHandler.sendMessage(message);
            }
            if (true) goto _L2; else goto _L5
_L5:
            Exception exception2;
            exception2;
            obj1;
            JVM INSTR monitorexit ;
            throw exception2;
        }

        public void pause()
        {
            synchronized (mEntriesMap)
            {
                if (mResumed)
                {
                    mResumed = false;
                    mSessionsChanged = true;
                    mBackgroundHandler.removeMessages(1, this);
                    doPauseIfNeededLocked();
                }
            }
            return;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }

        ArrayList rebuild(AppFilter appfilter, Comparator comparator)
        {
            Object obj = mRebuildSync;
            obj;
            JVM INSTR monitorenter ;
            synchronized (mEntriesMap)
            {
                mRebuildingSessions.add(this);
                mRebuildRequested = true;
                mRebuildAsync = false;
                mRebuildFilter = appfilter;
                mRebuildComparator = comparator;
                mRebuildResult = null;
                if (!mBackgroundHandler.hasMessages(1))
                {
                    Message message = mBackgroundHandler.obtainMessage(1);
                    mBackgroundHandler.sendMessage(message);
                }
            }
            long l = 250L + SystemClock.uptimeMillis();
_L3:
            if (mRebuildResult != null) goto _L2; else goto _L1
_L1:
            long l1 = SystemClock.uptimeMillis();
            if (l1 < l)
                break MISSING_BLOCK_LABEL_159;
_L2:
            ArrayList arraylist;
            mRebuildAsync = true;
            arraylist = mRebuildResult;
            obj;
            JVM INSTR monitorexit ;
            return arraylist;
            exception1;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
            try
            {
                mRebuildSync.wait(l - l1);
            }
            catch (InterruptedException interruptedexception) { }
              goto _L3
        }

        public void release()
        {
            pause();
            synchronized (mEntriesMap)
            {
                mSessions.remove(this);
            }
            return;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void resume()
        {
            synchronized (mEntriesMap)
            {
                if (!mResumed)
                {
                    mResumed = true;
                    mSessionsChanged = true;
                    doResumeIfNeededLocked();
                }
            }
            return;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }

        Session(Callbacks callbacks)
        {
            this$0 = ApplicationsState.this;
            super();
            mCallbacks = callbacks;
        }
    }

    public static class SizeInfo
    {

        long cacheSize;
        long codeSize;
        long dataSize;
        long externalCacheSize;
        long externalCodeSize;
        long externalDataSize;

    }


    public static final Comparator ALPHA_COMPARATOR = new Comparator() {

        private final Collator sCollator = Collator.getInstance();

        public int compare(AppEntry appentry, AppEntry appentry1)
        {
            byte byte0 = 1;
            byte byte1;
            if (appentry.info.enabled && (0x800000 & appentry.info.flags) != 0)
                byte1 = byte0;
            else
                byte1 = 0;
            byte byte2;
            if (appentry1.info.enabled && (0x800000 & appentry1.info.flags) != 0)
                byte2 = byte0;
            else
                byte2 = 0;
            if (byte1 != byte2)
            {
                if (byte1 != 0)
                    byte0 = -1;
                return byte0;
            } else
            {
                return sCollator.compare(appentry.label, appentry1.label);
            }
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((AppEntry)obj, (AppEntry)obj1);
        }

    }
;
    static final boolean DEBUG = false;
    static final boolean DEBUG_LOCKING = false;
    public static final Comparator EXTERNAL_SIZE_COMPARATOR = new Comparator() {

        private final Collator sCollator = Collator.getInstance();

        public int compare(AppEntry appentry, AppEntry appentry1)
        {
            if (appentry.externalSize < appentry1.externalSize)
                return 1;
            if (appentry.externalSize > appentry1.externalSize)
                return -1;
            else
                return sCollator.compare(appentry.label, appentry1.label);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((AppEntry)obj, (AppEntry)obj1);
        }

    }
;
    public static final Comparator INTERNAL_SIZE_COMPARATOR = new Comparator() {

        private final Collator sCollator = Collator.getInstance();

        public int compare(AppEntry appentry, AppEntry appentry1)
        {
            if (appentry.internalSize < appentry1.internalSize)
                return 1;
            if (appentry.internalSize > appentry1.internalSize)
                return -1;
            else
                return sCollator.compare(appentry.label, appentry1.label);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((AppEntry)obj, (AppEntry)obj1);
        }

    }
;
    public static final AppFilter ON_SD_CARD_FILTER = new AppFilter() {

        final CanBeOnSdCardChecker mCanBeOnSdCardChecker = new CanBeOnSdCardChecker();

        public boolean filterApp(ApplicationInfo applicationinfo)
        {
            return mCanBeOnSdCardChecker.check(applicationinfo);
        }

        public void init()
        {
            mCanBeOnSdCardChecker.init();
        }

    }
;
    static final Pattern REMOVE_DIACRITICALS_PATTERN = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
    public static final Comparator SIZE_COMPARATOR = new Comparator() {

        private final Collator sCollator = Collator.getInstance();

        public int compare(AppEntry appentry, AppEntry appentry1)
        {
            if (appentry.size < appentry1.size)
                return 1;
            if (appentry.size > appentry1.size)
                return -1;
            else
                return sCollator.compare(appentry.label, appentry1.label);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((AppEntry)obj, (AppEntry)obj1);
        }

    }
;
    static final int SIZE_INVALID = -2;
    static final int SIZE_UNKNOWN = -1;
    static final String TAG = "ApplicationsState";
    public static final AppFilter THIRD_PARTY_FILTER = new AppFilter() {

        public boolean filterApp(ApplicationInfo applicationinfo)
        {
            return (0x80 & applicationinfo.flags) != 0 || (1 & applicationinfo.flags) == 0;
        }

        public void init()
        {
        }

    }
;
    static ApplicationsState sInstance;
    static final Object sLock = new Object();
    final ArrayList mActiveSessions;
    final ArrayList mAppEntries;
    List mApplications;
    final BackgroundHandler mBackgroundHandler;
    final Context mContext;
    String mCurComputingSizePkg;
    long mCurId;
    final HashMap mEntriesMap;
    final InterestingConfigChanges mInterestingConfigChanges;
    final MainHandler mMainHandler;
    PackageIntentReceiver mPackageIntentReceiver;
    final PackageManager mPm;
    final ArrayList mRebuildingSessions;
    boolean mResumed;
    final int mRetrieveFlags;
    final ArrayList mSessions;
    boolean mSessionsChanged;
    final HandlerThread mThread;

    private ApplicationsState(Application application)
    {
        mSessions = new ArrayList();
        mRebuildingSessions = new ArrayList();
        mInterestingConfigChanges = new InterestingConfigChanges();
        mEntriesMap = new HashMap();
        mAppEntries = new ArrayList();
        mApplications = new ArrayList();
        mCurId = 1L;
        mActiveSessions = new ArrayList();
        mMainHandler = new MainHandler();
        mContext = application;
        mPm = mContext.getPackageManager();
        mThread = new HandlerThread("ApplicationsState.Loader", 10);
        mThread.start();
        mBackgroundHandler = new BackgroundHandler(mThread.getLooper());
        if (UserHandle.myUserId() == 0)
            mRetrieveFlags = 8704;
        else
            mRetrieveFlags = 512;
        synchronized (mEntriesMap)
        {
            try
            {
                mEntriesMap.wait(1L);
            }
            // Misplaced declaration of an exception variable
            catch (InterruptedException interruptedexception) { }
        }
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        InterruptedException interruptedexception;
        throw exception;
    }

    static ApplicationsState getInstance(Application application)
    {
        ApplicationsState applicationsstate;
        synchronized (sLock)
        {
            if (sInstance == null)
                sInstance = new ApplicationsState(application);
            applicationsstate = sInstance;
        }
        return applicationsstate;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private String getSizeStr(long l)
    {
        if (l >= 0L)
            return Formatter.formatFileSize(mContext, l);
        else
            return null;
    }

    private long getTotalExternalSize(PackageStats packagestats)
    {
        if (packagestats != null)
            return packagestats.externalCodeSize + packagestats.externalDataSize + packagestats.externalCacheSize + packagestats.externalMediaSize + packagestats.externalObbSize;
        else
            return -2L;
    }

    private long getTotalInternalSize(PackageStats packagestats)
    {
        if (packagestats != null)
            return packagestats.codeSize + packagestats.dataSize;
        else
            return -2L;
    }

    public static String normalize(String s)
    {
        String s1 = Normalizer.normalize(s, java.text.Normalizer.Form.NFD);
        return REMOVE_DIACRITICALS_PATTERN.matcher(s1).replaceAll("").toLowerCase();
    }

    public static void removeInstance()
    {
        sInstance = null;
    }

    void addPackage(String s)
    {
label0:
        {
            synchronized (mEntriesMap)
            {
                if (mResumed)
                    break label0;
            }
            return;
        }
        if (indexOfApplicationInfoLocked(s) < 0)
            break MISSING_BLOCK_LABEL_37;
        hashmap;
        JVM INSTR monitorexit ;
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        try
        {
            throw exception;
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return;
        }
        ApplicationInfo applicationinfo = mPm.getApplicationInfo(s, mRetrieveFlags);
        mApplications.add(applicationinfo);
        if (!mBackgroundHandler.hasMessages(2))
            mBackgroundHandler.sendEmptyMessage(2);
        if (!mMainHandler.hasMessages(2))
            mMainHandler.sendEmptyMessage(2);
        hashmap;
        JVM INSTR monitorexit ;
    }

    void doPauseIfNeededLocked()
    {
label0:
        {
            if (!mResumed)
                break label0;
            for (int i = 0; i < mSessions.size(); i++)
                if (((Session)mSessions.get(i)).mResumed)
                    break label0;

            mResumed = false;
            if (mPackageIntentReceiver != null)
            {
                mPackageIntentReceiver.unregisterReceiver();
                mPackageIntentReceiver = null;
                return;
            }
        }
    }

    void doResumeIfNeededLocked()
    {
        if (!mResumed)
        {
            mResumed = true;
            if (mPackageIntentReceiver == null)
            {
                mPackageIntentReceiver = new PackageIntentReceiver();
                mPackageIntentReceiver.registerReceiver();
            }
            mApplications = mPm.getInstalledApplications(mRetrieveFlags);
            if (mApplications == null)
                mApplications = new ArrayList();
            if (mInterestingConfigChanges.applyNewConfig(mContext.getResources()))
            {
                mEntriesMap.clear();
                mAppEntries.clear();
            } else
            {
                for (int i = 0; i < mAppEntries.size(); i++)
                    ((AppEntry)mAppEntries.get(i)).sizeStale = true;

            }
            for (int j = 0; j < mApplications.size(); j++)
            {
                ApplicationInfo applicationinfo = (ApplicationInfo)mApplications.get(j);
                if (!applicationinfo.enabled && applicationinfo.enabledSetting != 3)
                {
                    mApplications.remove(j);
                    j--;
                    continue;
                }
                AppEntry appentry = (AppEntry)mEntriesMap.get(((PackageItemInfo) (applicationinfo)).packageName);
                if (appentry != null)
                    appentry.info = applicationinfo;
            }

            mCurComputingSizePkg = null;
            if (!mBackgroundHandler.hasMessages(2))
            {
                mBackgroundHandler.sendEmptyMessage(2);
                return;
            }
        }
    }

    void ensureIcon(AppEntry appentry)
    {
        if (appentry.icon != null)
            return;
        appentry;
        JVM INSTR monitorenter ;
        appentry.ensureIconLocked(mContext, mPm);
        appentry;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        appentry;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void exitBackgroundThread()
    {
        if (mThread != null)
        {
            Looper looper = mThread.getLooper();
            if (looper != null)
                looper.quit();
        }
    }

    AppEntry getEntry(String s)
    {
        HashMap hashmap = mEntriesMap;
        hashmap;
        JVM INSTR monitorenter ;
        AppEntry appentry = (AppEntry)mEntriesMap.get(s);
        if (appentry != null) goto _L2; else goto _L1
_L1:
        int i = 0;
_L7:
        if (i >= mApplications.size()) goto _L2; else goto _L3
_L3:
        ApplicationInfo applicationinfo = (ApplicationInfo)mApplications.get(i);
        if (!s.equals(((PackageItemInfo) (applicationinfo)).packageName)) goto _L5; else goto _L4
_L4:
        appentry = getEntryLocked(applicationinfo);
_L2:
        hashmap;
        JVM INSTR monitorexit ;
        return appentry;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
_L5:
        i++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    AppEntry getEntryLocked(ApplicationInfo applicationinfo)
    {
        AppEntry appentry = (AppEntry)mEntriesMap.get(((PackageItemInfo) (applicationinfo)).packageName);
        if (appentry == null)
        {
            Context context = mContext;
            long l = mCurId;
            mCurId = 1L + l;
            appentry = new AppEntry(context, applicationinfo, l);
            mEntriesMap.put(((PackageItemInfo) (applicationinfo)).packageName, appentry);
            mAppEntries.add(appentry);
        } else
        if (appentry.info != applicationinfo)
        {
            appentry.info = applicationinfo;
            return appentry;
        }
        return appentry;
    }

    int indexOfApplicationInfoLocked(String s)
    {
        for (int i = -1 + mApplications.size(); i >= 0; i--)
            if (((PackageItemInfo) ((ApplicationInfo)mApplications.get(i))).packageName.equals(s))
                return i;

        return -1;
    }

    void invalidatePackage(String s)
    {
        removePackage(s);
        addPackage(s);
    }

    public Session newSession(Callbacks callbacks)
    {
        Session session = new Session(callbacks);
        synchronized (mEntriesMap)
        {
            mSessions.add(session);
        }
        return session;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void rebuildActiveSessions()
    {
label0:
        {
            synchronized (mEntriesMap)
            {
                if (mSessionsChanged)
                    break label0;
            }
            return;
        }
        mActiveSessions.clear();
        int i = 0;
_L2:
        if (i < mSessions.size())
        {
            Session session = (Session)mSessions.get(i);
            if (session.mResumed)
                mActiveSessions.add(session);
            break MISSING_BLOCK_LABEL_79;
        }
        hashmap;
        JVM INSTR monitorexit ;
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        i++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    void removePackage(String s)
    {
        HashMap hashmap = mEntriesMap;
        hashmap;
        JVM INSTR monitorenter ;
        int i = indexOfApplicationInfoLocked(s);
        if (i < 0)
            break MISSING_BLOCK_LABEL_88;
        AppEntry appentry = (AppEntry)mEntriesMap.get(s);
        if (appentry == null)
            break MISSING_BLOCK_LABEL_56;
        mEntriesMap.remove(s);
        mAppEntries.remove(appentry);
        mApplications.remove(i);
        if (!mMainHandler.hasMessages(2))
            mMainHandler.sendEmptyMessage(2);
        hashmap;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void requestSize(String s)
    {
        synchronized (mEntriesMap)
        {
            if ((AppEntry)mEntriesMap.get(s) != null)
                mPm.getPackageSizeInfo(s, mBackgroundHandler.mStatsObserver);
        }
        return;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    long sumCacheSizes()
    {
        long l = 0L;
        HashMap hashmap = mEntriesMap;
        hashmap;
        JVM INSTR monitorenter ;
        int i = -1 + mAppEntries.size();
_L2:
        if (i < 0)
            break; /* Loop/switch isn't completed */
        l += ((SizeInfo) ((AppEntry)mAppEntries.get(i))).cacheSize;
        i--;
        if (true) goto _L2; else goto _L1
_L1:
        hashmap;
        JVM INSTR monitorexit ;
        return l;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }





    // Unreferenced inner class com/android/settings/applications/ApplicationsState$BackgroundHandler$1

/* anonymous class */
    class BackgroundHandler._cls1 extends android.content.pm.IPackageStatsObserver.Stub
    {

        final BackgroundHandler this$1;

        public void onGetStatsCompleted(PackageStats packagestats, boolean flag)
        {
            HashMap hashmap = mEntriesMap;
            hashmap;
            JVM INSTR monitorenter ;
            AppEntry appentry = (AppEntry)mEntriesMap.get(packagestats.packageName);
            if (appentry == null)
                break MISSING_BLOCK_LABEL_384;
            appentry;
            JVM INSTR monitorenter ;
            long l;
            long l1;
            long l2;
            int i;
            appentry.sizeStale = false;
            appentry.sizeLoadStart = 0L;
            l = packagestats.externalCodeSize + packagestats.externalObbSize;
            l1 = packagestats.externalDataSize + packagestats.externalMediaSize;
            l2 = l + l1 + getTotalInternalSize(packagestats);
            if (appentry.size != l2 || ((SizeInfo) (appentry)).cacheSize != packagestats.cacheSize || ((SizeInfo) (appentry)).codeSize != packagestats.codeSize || ((SizeInfo) (appentry)).dataSize != packagestats.dataSize || ((SizeInfo) (appentry)).externalCodeSize != l || ((SizeInfo) (appentry)).externalDataSize != l1)
                break MISSING_BLOCK_LABEL_188;
            i = ((SizeInfo) (appentry)).externalCacheSize != packagestats.externalCacheSize;
            boolean flag1;
            flag1 = false;
            if (i == 0)
                break MISSING_BLOCK_LABEL_340;
            appentry.size = l2;
            appentry.cacheSize = packagestats.cacheSize;
            appentry.codeSize = packagestats.codeSize;
            appentry.dataSize = packagestats.dataSize;
            appentry.externalCodeSize = l;
            appentry.externalDataSize = l1;
            appentry.externalCacheSize = packagestats.externalCacheSize;
            appentry.sizeStr = getSizeStr(appentry.size);
            appentry.internalSize = getTotalInternalSize(packagestats);
            appentry.internalSizeStr = getSizeStr(appentry.internalSize);
            appentry.externalSize = getTotalExternalSize(packagestats);
            appentry.externalSizeStr = getSizeStr(appentry.externalSize);
            flag1 = true;
            appentry;
            JVM INSTR monitorexit ;
            if (!flag1)
                break MISSING_BLOCK_LABEL_384;
            Message message = mMainHandler.obtainMessage(4, packagestats.packageName);
            mMainHandler.sendMessage(message);
            if (mCurComputingSizePkg == null || mCurComputingSizePkg.equals(packagestats.packageName))
            {
                mCurComputingSizePkg = null;
                sendEmptyMessage(4);
            }
            hashmap;
            JVM INSTR monitorexit ;
            return;
            Exception exception1;
            exception1;
            appentry;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$1 = BackgroundHandler.this;
                super();
            }
    }

}
