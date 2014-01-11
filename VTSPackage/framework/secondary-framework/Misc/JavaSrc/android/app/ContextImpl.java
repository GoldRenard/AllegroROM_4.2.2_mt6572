// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.accounts.AccountManager;
import android.app.admin.DevicePolicyManager;
import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.*;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.hardware.SerialManager;
import android.hardware.SystemSensorManager;
import android.hardware.display.DisplayManager;
import android.hardware.input.InputManager;
import android.hardware.usb.UsbManager;
import android.location.CountryDetector;
import android.location.LocationManager;
import android.media.AudioManager;
import android.media.MediaRouter;
import android.net.*;
import android.net.nsd.NsdManager;
import android.net.wifi.WifiManager;
import android.net.wifi.p2p.WifiP2pManager;
import android.nfc.NfcManager;
import android.os.*;
import android.os.storage.StorageManager;
import android.telephony.TelephonyManager;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.view.inputmethod.InputMethodManager;
import android.view.textservice.TextServicesManager;
import com.android.internal.policy.PolicyManager;
import com.android.internal.util.Preconditions;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.agps.MtkAgpsManager;
import com.mediatek.common.audioprofile.IAudioProfileManager;
import com.mediatek.common.epo.MtkEpoClientManager;
import com.mediatek.common.search.ISearchEngineManager;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

// Referenced classes of package android.app:
//            LoadedApk, WallpaperManager, ActivityThread, ActivityManagerNative, 
//            IActivityManager, ApplicationPackageManager, ReceiverRestrictedContext, SharedPreferencesImpl, 
//            Activity, Instrumentation, DownloadManager, KeyguardManager, 
//            NotificationManager, SearchManager, StatusBarManager, UiModeManager, 
//            ActivityManager, AlarmManager

class ContextImpl extends Context
{
    private static final class ApplicationContentResolver extends ContentResolver
    {

        private final ActivityThread mMainThread;
        private final UserHandle mUser;

        public boolean AddToQueryHistory(String s, Throwable throwable, int i)
        {
            return mMainThread.AddToQueryHistory(s, throwable, i);
        }

        public void RemoveFromQueryHistory(int i)
        {
            mMainThread.RemoveFromQueryHistory(i);
        }

        protected IContentProvider acquireExistingProvider(Context context, String s)
        {
            return mMainThread.acquireExistingProvider(context, s, mUser.getIdentifier(), true);
        }

        protected IContentProvider acquireProvider(Context context, String s)
        {
            return mMainThread.acquireProvider(context, s, mUser.getIdentifier(), true);
        }

        protected IContentProvider acquireUnstableProvider(Context context, String s)
        {
            return mMainThread.acquireProvider(context, s, mUser.getIdentifier(), false);
        }

        public boolean releaseProvider(IContentProvider icontentprovider)
        {
            return mMainThread.releaseProvider(icontentprovider, true);
        }

        public boolean releaseUnstableProvider(IContentProvider icontentprovider)
        {
            return mMainThread.releaseProvider(icontentprovider, false);
        }

        public void unstableProviderDied(IContentProvider icontentprovider)
        {
            mMainThread.handleUnstableProviderDied(icontentprovider.asBinder(), true);
        }

        public ApplicationContentResolver(Context context, ActivityThread activitythread, UserHandle userhandle)
        {
            super(context);
            mMainThread = (ActivityThread)Preconditions.checkNotNull(activitythread);
            mUser = (UserHandle)Preconditions.checkNotNull(userhandle);
        }
    }

    static class ServiceFetcher
    {

        int mContextCacheIndex;

        public Object createService(ContextImpl contextimpl)
        {
            throw new RuntimeException("Not implemented");
        }

        public Object getService(ContextImpl contextimpl)
        {
            ArrayList arraylist = contextimpl.mServiceCache;
            arraylist;
            JVM INSTR monitorenter ;
            if (arraylist.size() != 0) goto _L2; else goto _L1
_L1:
            int i = 0;
_L4:
            if (i >= ContextImpl.sNextPerContextServiceCacheIndex)
                break; /* Loop/switch isn't completed */
            arraylist.add(null);
            i++;
            if (true) goto _L4; else goto _L3
_L2:
            Object obj1 = arraylist.get(mContextCacheIndex);
            if (obj1 == null) goto _L3; else goto _L5
_L5:
            arraylist;
            JVM INSTR monitorexit ;
            return obj1;
_L3:
            Object obj;
            obj = createService(contextimpl);
            arraylist.set(mContextCacheIndex, obj);
            arraylist;
            JVM INSTR monitorexit ;
            return obj;
            Exception exception;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        ServiceFetcher()
        {
            mContextCacheIndex = -1;
        }
    }

    static abstract class StaticServiceFetcher extends ServiceFetcher
    {

        private Object mCachedInstance;

        public abstract Object createStaticService();

        public final Object getService(ContextImpl contextimpl)
        {
            this;
            JVM INSTR monitorenter ;
            Object obj = mCachedInstance;
            if (obj == null)
                break MISSING_BLOCK_LABEL_15;
            this;
            JVM INSTR monitorexit ;
            return obj;
            Object obj1;
            obj1 = createStaticService();
            mCachedInstance = obj1;
            this;
            JVM INSTR monitorexit ;
            return obj1;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

    }


    private static final boolean DEBUG = false;
    private static final String EMPTY_FILE_LIST[] = new String[0];
    private static final HashMap SYSTEM_SERVICE_MAP = new HashMap();
    private static final String TAG = "ContextImpl";
    private static ServiceFetcher WALLPAPER_FETCHER;
    private static int sNextPerContextServiceCacheIndex = 0;
    private static final HashMap sSharedPrefs = new HashMap();
    private IBinder mActivityToken;
    private String mBasePackageName;
    private File mCacheDir;
    private ApplicationContentResolver mContentResolver;
    private File mDatabasesDir;
    private Display mDisplay;
    private File mExternalCacheDir;
    private File mExternalFilesDir;
    private File mFilesDir;
    ActivityThread mMainThread;
    private File mObbDir;
    private Context mOuterContext;
    LoadedApk mPackageInfo;
    private PackageManager mPackageManager;
    private File mPreferencesDir;
    private Context mReceiverRestrictedContext;
    private Resources mResources;
    private boolean mRestricted;
    final ArrayList mServiceCache;
    private final Object mSync;
    private android.content.res.Resources.Theme mTheme;
    private int mThemeResource;
    private UserHandle mUser;

    ContextImpl()
    {
        mActivityToken = null;
        mThemeResource = 0;
        mTheme = null;
        mReceiverRestrictedContext = null;
        mSync = new Object();
        mServiceCache = new ArrayList();
        mOuterContext = this;
    }

    public ContextImpl(ContextImpl contextimpl)
    {
        mActivityToken = null;
        mThemeResource = 0;
        mTheme = null;
        mReceiverRestrictedContext = null;
        mSync = new Object();
        mServiceCache = new ArrayList();
        mPackageInfo = contextimpl.mPackageInfo;
        mBasePackageName = contextimpl.mBasePackageName;
        mResources = contextimpl.mResources;
        mMainThread = contextimpl.mMainThread;
        mContentResolver = contextimpl.mContentResolver;
        mUser = contextimpl.mUser;
        mDisplay = contextimpl.mDisplay;
        mOuterContext = this;
    }

    static DropBoxManager createDropBoxManager()
    {
        com.android.internal.os.IDropBoxManagerService idropboxmanagerservice = com.android.internal.os.IDropBoxManagerService.Stub.asInterface(ServiceManager.getService("dropbox"));
        if (idropboxmanagerservice == null)
            return null;
        else
            return new DropBoxManager(idropboxmanagerservice);
    }

    static ContextImpl createSystemContext(ActivityThread activitythread)
    {
        ContextImpl contextimpl = new ContextImpl();
        contextimpl.init(Resources.getSystem(), activitythread, Process.myUserHandle());
        return contextimpl;
    }

    private void enforce(String s, int i, boolean flag, int j, String s1)
    {
        if (i != 0)
        {
            StringBuilder stringbuilder = new StringBuilder();
            String s2;
            if (s1 != null)
                s2 = (new StringBuilder()).append(s1).append(": ").toString();
            else
                s2 = "";
            StringBuilder stringbuilder1 = stringbuilder.append(s2);
            String s3;
            if (flag)
                s3 = (new StringBuilder()).append("Neither user ").append(j).append(" nor current process has ").toString();
            else
                s3 = (new StringBuilder()).append("uid ").append(j).append(" does not have ").toString();
            throw new SecurityException(stringbuilder1.append(s3).append(s).append(".").toString());
        } else
        {
            return;
        }
    }

    private void enforceForUri(int i, int j, boolean flag, int k, Uri uri, String s)
    {
        if (j != 0)
        {
            StringBuilder stringbuilder = new StringBuilder();
            String s1;
            if (s != null)
                s1 = (new StringBuilder()).append(s).append(": ").toString();
            else
                s1 = "";
            StringBuilder stringbuilder1 = stringbuilder.append(s1);
            String s2;
            if (flag)
                s2 = (new StringBuilder()).append("Neither user ").append(k).append(" nor current process has ").toString();
            else
                s2 = (new StringBuilder()).append("User ").append(k).append(" does not have ").toString();
            throw new SecurityException(stringbuilder1.append(s2).append(uriModeFlagToString(i)).append(" permission on ").append(uri).append(".").toString());
        } else
        {
            return;
        }
    }

    private File getDataDirFile()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getDataDirFile();
        else
            throw new RuntimeException("Not supported in system context");
    }

    private File getDatabasesDir()
    {
        File file;
        synchronized (mSync)
        {
            if (mDatabasesDir == null)
                mDatabasesDir = new File(getDataDirFile(), "databases");
            if (mDatabasesDir.getPath().equals("databases"))
                mDatabasesDir = new File("/data/system");
            file = mDatabasesDir;
        }
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private int getDisplayId()
    {
        if (mDisplay != null)
            return mDisplay.getDisplayId();
        else
            return 0;
    }

    static ContextImpl getImpl(Context context)
    {
        do
        {
            if (!(context instanceof ContextWrapper))
                break;
            Context context1 = ((ContextWrapper)context).getBaseContext();
            if (context1 == null)
                break;
            context = context1;
        } while (true);
        return (ContextImpl)context;
    }

    private File getPreferencesDir()
    {
        File file;
        synchronized (mSync)
        {
            if (mPreferencesDir == null)
                mPreferencesDir = new File(getDataDirFile(), "shared_prefs");
            file = mPreferencesDir;
        }
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private WallpaperManager getWallpaperManager()
    {
        return (WallpaperManager)WALLPAPER_FETCHER.getService(this);
    }

    private File makeFilename(File file, String s)
    {
        if (s.indexOf(File.separatorChar) < 0)
            return new File(file, s);
        else
            throw new IllegalArgumentException((new StringBuilder()).append("File ").append(s).append(" contains a path separator").toString());
    }

    private Intent registerReceiverInternal(BroadcastReceiver broadcastreceiver, int i, IntentFilter intentfilter, String s, Handler handler, Context context)
    {
        android.content.IIntentReceiver iintentreceiver = null;
        Intent intent;
        if (broadcastreceiver != null)
            if (mPackageInfo != null && context != null)
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                LoadedApk loadedapk = mPackageInfo;
                Instrumentation instrumentation = mMainThread.getInstrumentation();
                iintentreceiver = loadedapk.getReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, true);
            } else
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                iintentreceiver = (new LoadedApk.ReceiverDispatcher(broadcastreceiver, context, handler, null, true)).getIIntentReceiver();
            }
        try
        {
            intent = ActivityManagerNative.getDefault().registerReceiver(mMainThread.getApplicationThread(), mBasePackageName, iintentreceiver, intentfilter, s, i);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return intent;
    }

    private static void registerService(String s, ServiceFetcher servicefetcher)
    {
        if (!(servicefetcher instanceof StaticServiceFetcher))
        {
            int i = sNextPerContextServiceCacheIndex;
            sNextPerContextServiceCacheIndex = i + 1;
            servicefetcher.mContextCacheIndex = i;
        }
        SYSTEM_SERVICE_MAP.put(s, servicefetcher);
    }

    static void setFilePermissionsFromMode(String s, int i, int j)
    {
        int k = j | 0x1b0;
        if ((i & 1) != 0)
            k |= 4;
        if ((i & 2) != 0)
            k |= 2;
        FileUtils.setPermissions(s, k, -1, -1);
    }

    private String uriModeFlagToString(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return "write";

        case 1: // '\001'
            return "read";

        case 3: // '\003'
            return "read and write";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown permission mode flags: ").append(i).toString());
    }

    private File validateFilePath(String s, boolean flag)
    {
        File file;
        File file1;
        if (s.charAt(0) == File.separatorChar)
        {
            file = new File(s.substring(0, s.lastIndexOf(File.separatorChar)));
            file1 = new File(file, s.substring(s.lastIndexOf(File.separatorChar)));
        } else
        {
            file = getDatabasesDir();
            file1 = makeFilename(file, s);
        }
        if (flag && !file.isDirectory() && file.mkdir())
            FileUtils.setPermissions(file.getPath(), 505, -1, -1);
        return file1;
    }

    private void warnIfCallingFromSystemProcess()
    {
        if (Process.myUid() == 1000)
            Slog.w("ContextImpl", (new StringBuilder()).append("Calling a method in the system process without a qualified user: ").append(Debug.getCallers(5)).toString());
    }

    public boolean bindService(Intent intent, ServiceConnection serviceconnection, int i)
    {
        warnIfCallingFromSystemProcess();
        return bindService(intent, serviceconnection, i, UserHandle.getUserId(Process.myUid()));
    }

    public boolean bindService(Intent intent, ServiceConnection serviceconnection, int i, int j)
    {
        IServiceConnection iserviceconnection;
        if (serviceconnection == null)
            throw new IllegalArgumentException("connection is null");
        if (mPackageInfo == null)
            break MISSING_BLOCK_LABEL_161;
        iserviceconnection = mPackageInfo.getServiceDispatcher(serviceconnection, getOuterContext(), mMainThread.getHandler(), i);
        if (getActivityToken() != null || (i & 1) != 0)
            break MISSING_BLOCK_LABEL_84;
        if (mPackageInfo != null && mPackageInfo.getApplicationInfo().targetSdkVersion < 14)
            i |= 0x20;
        int k;
        try
        {
            intent.setAllowFds(false);
            k = ActivityManagerNative.getDefault().bindService(mMainThread.getApplicationThread(), getActivityToken(), intent, intent.resolveTypeIfNeeded(getContentResolver()), iserviceconnection, i, j);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        if (k >= 0)
            break MISSING_BLOCK_LABEL_172;
        throw new SecurityException((new StringBuilder()).append("Not allowed to bind to service ").append(intent).toString());
        throw new RuntimeException("Not supported in system context");
        return k != 0;
    }

    public int checkCallingOrSelfPermission(String s)
    {
        if (s == null)
            throw new IllegalArgumentException("permission is null");
        else
            return checkPermission(s, Binder.getCallingPid(), Binder.getCallingUid());
    }

    public int checkCallingOrSelfUriPermission(Uri uri, int i)
    {
        return checkUriPermission(uri, Binder.getCallingPid(), Binder.getCallingUid(), i);
    }

    public int checkCallingPermission(String s)
    {
        if (s == null)
            throw new IllegalArgumentException("permission is null");
        int i = Binder.getCallingPid();
        if (i != Process.myPid())
            return checkPermission(s, i, Binder.getCallingUid());
        else
            return -1;
    }

    public int checkCallingUriPermission(Uri uri, int i)
    {
        int j = Binder.getCallingPid();
        if (j != Process.myPid())
            return checkUriPermission(uri, j, Binder.getCallingUid(), i);
        else
            return -1;
    }

    public int checkPermission(String s, int i, int j)
    {
        if (s == null)
            throw new IllegalArgumentException("permission is null");
        int k;
        try
        {
            k = ActivityManagerNative.getDefault().checkPermission(s, i, j);
        }
        catch (RemoteException remoteexception)
        {
            return -1;
        }
        return k;
    }

    public int checkUriPermission(Uri uri, int i, int j, int k)
    {
        int l;
        try
        {
            l = ActivityManagerNative.getDefault().checkUriPermission(uri, i, j, k);
        }
        catch (RemoteException remoteexception)
        {
            return -1;
        }
        return l;
    }

    public int checkUriPermission(Uri uri, String s, String s1, int i, int j, int k)
    {
        if (((k & 1) == 0 || s != null && checkPermission(s, i, j) != 0) && ((k & 2) == 0 || s1 != null && checkPermission(s1, i, j) != 0))
        {
            if (uri != null)
                return checkUriPermission(uri, i, j, k);
            else
                return -1;
        } else
        {
            return 0;
        }
    }

    public void clearWallpaper()
        throws IOException
    {
        getWallpaperManager().clear();
    }

    public Context createConfigurationContext(Configuration configuration)
    {
        if (configuration == null)
        {
            throw new IllegalArgumentException("overrideConfiguration must not be null");
        } else
        {
            ContextImpl contextimpl = new ContextImpl();
            contextimpl.init(mPackageInfo, ((IBinder) (null)), mMainThread);
            contextimpl.mResources = mMainThread.getTopLevelResources(mPackageInfo.getResDir(), getDisplayId(), configuration, mResources.getCompatibilityInfo());
            return contextimpl;
        }
    }

    public Context createDisplayContext(Display display)
    {
        if (display == null)
            throw new IllegalArgumentException("display must not be null");
        int i = display.getDisplayId();
        CompatibilityInfo compatibilityinfo = CompatibilityInfo.DEFAULT_COMPATIBILITY_INFO;
        CompatibilityInfoHolder compatibilityinfoholder = getCompatibilityInfo(i);
        if (compatibilityinfoholder != null)
            compatibilityinfo = compatibilityinfoholder.get();
        ContextImpl contextimpl = new ContextImpl();
        contextimpl.init(mPackageInfo, ((IBinder) (null)), mMainThread);
        contextimpl.mDisplay = display;
        contextimpl.mResources = mMainThread.getTopLevelResources(mPackageInfo.getResDir(), i, null, compatibilityinfo);
        return contextimpl;
    }

    public Context createPackageContext(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        UserHandle userhandle;
        if (mUser != null)
            userhandle = mUser;
        else
            userhandle = Process.myUserHandle();
        return createPackageContextAsUser(s, i, userhandle);
    }

    public Context createPackageContextAsUser(String s, int i, UserHandle userhandle)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ContextImpl contextimpl1;
label0:
        {
            boolean flag = true;
            if (!s.equals("system") && !s.equals("android"))
            {
                LoadedApk loadedapk = mMainThread.getPackageInfo(s, mResources.getCompatibilityInfo(), i, userhandle.getIdentifier());
                if (loadedapk != null)
                {
                    contextimpl1 = new ContextImpl();
                    if ((i & 4) != 4)
                        flag = false;
                    contextimpl1.mRestricted = flag;
                    contextimpl1.init(loadedapk, null, mMainThread, mResources, mBasePackageName, userhandle);
                    if (contextimpl1.mResources != null)
                        break label0;
                }
                throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("Application package ").append(s).append(" not found").toString());
            }
            ContextImpl contextimpl = new ContextImpl(mMainThread.getSystemContext());
            if ((i & 4) != 4)
                flag = false;
            contextimpl.mRestricted = flag;
            contextimpl.init(mPackageInfo, null, mMainThread, mResources, mBasePackageName, userhandle);
            contextimpl1 = contextimpl;
        }
        return contextimpl1;
    }

    public String[] databaseList()
    {
        String as[] = getDatabasesDir().list();
        if (as != null)
            return as;
        else
            return EMPTY_FILE_LIST;
    }

    public boolean deleteDatabase(String s)
    {
        boolean flag;
        try
        {
            flag = SQLiteDatabase.deleteDatabase(validateFilePath(s, false));
        }
        catch (Exception exception)
        {
            return false;
        }
        return flag;
    }

    public boolean deleteFile(String s)
    {
        return makeFilename(getFilesDir(), s).delete();
    }

    public void enforceCallingOrSelfPermission(String s, String s1)
    {
        enforce(s, checkCallingOrSelfPermission(s), true, Binder.getCallingUid(), s1);
    }

    public void enforceCallingOrSelfUriPermission(Uri uri, int i, String s)
    {
        enforceForUri(i, checkCallingOrSelfUriPermission(uri, i), true, Binder.getCallingUid(), uri, s);
    }

    public void enforceCallingPermission(String s, String s1)
    {
        enforce(s, checkCallingPermission(s), false, Binder.getCallingUid(), s1);
    }

    public void enforceCallingUriPermission(Uri uri, int i, String s)
    {
        enforceForUri(i, checkCallingUriPermission(uri, i), false, Binder.getCallingUid(), uri, s);
    }

    public void enforcePermission(String s, int i, int j, String s1)
    {
        enforce(s, checkPermission(s, i, j), false, j, s1);
    }

    public void enforceUriPermission(Uri uri, int i, int j, int k, String s)
    {
        enforceForUri(k, checkUriPermission(uri, i, j, k), false, j, uri, s);
    }

    public void enforceUriPermission(Uri uri, String s, String s1, int i, int j, int k, String s2)
    {
        enforceForUri(k, checkUriPermission(uri, s, s1, i, j, k), false, j, uri, s2);
    }

    public String[] fileList()
    {
        String as[] = getFilesDir().list();
        if (as != null)
            return as;
        else
            return EMPTY_FILE_LIST;
    }

    final IBinder getActivityToken()
    {
        return mActivityToken;
    }

    public Context getApplicationContext()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getApplication();
        else
            return mMainThread.getApplication();
    }

    public ApplicationInfo getApplicationInfo()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getApplicationInfo();
        else
            throw new RuntimeException("Not supported in system context");
    }

    public AssetManager getAssets()
    {
        return getResources().getAssets();
    }

    public File getCacheDir()
    {
label0:
        {
            synchronized (mSync)
            {
                if (mCacheDir == null)
                    mCacheDir = new File(getDataDirFile(), "cache");
                if (mCacheDir.exists())
                    break MISSING_BLOCK_LABEL_104;
                if (mCacheDir.mkdirs())
                    break label0;
                Log.w("ContextImpl", (new StringBuilder()).append("Unable to create cache directory ").append(mCacheDir.getAbsolutePath()).toString());
            }
            return null;
        }
        FileUtils.setPermissions(mCacheDir.getPath(), 505, -1, -1);
        obj;
        JVM INSTR monitorexit ;
        return mCacheDir;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public ClassLoader getClassLoader()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getClassLoader();
        else
            return ClassLoader.getSystemClassLoader();
    }

    public CompatibilityInfoHolder getCompatibilityInfo(int i)
    {
        if (i == 0)
            return mPackageInfo.mCompatibilityInfo;
        else
            return null;
    }

    public ContentResolver getContentResolver()
    {
        return mContentResolver;
    }

    public File getDatabasePath(String s)
    {
        return validateFilePath(s, false);
    }

    public File getDir(String s, int i)
    {
        String s1 = (new StringBuilder()).append("app_").append(s).toString();
        File file = makeFilename(getDataDirFile(), s1);
        if (!file.exists())
        {
            file.mkdir();
            setFilePermissionsFromMode(file.getPath(), i, 505);
        }
        return file;
    }

    public File getExternalCacheDir()
    {
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        boolean flag;
        if (mExternalCacheDir == null)
            mExternalCacheDir = Environment.getExternalStorageAppCacheDirectory(getPackageName());
        flag = mExternalCacheDir.exists();
        if (flag)
            break MISSING_BLOCK_LABEL_77;
        Exception exception;
        File file;
        try
        {
            (new File(Environment.getExternalStorageAndroidDataDir(), ".nomedia")).createNewFile();
        }
        catch (IOException ioexception) { }
        if (mExternalCacheDir.mkdirs())
            break MISSING_BLOCK_LABEL_77;
        Log.w("ContextImpl", "Unable to create external cache directory");
        obj;
        JVM INSTR monitorexit ;
        return null;
        file = mExternalCacheDir;
        obj;
        JVM INSTR monitorexit ;
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public File getExternalFilesDir(String s)
    {
        Object obj = mSync;
        obj;
        JVM INSTR monitorenter ;
        boolean flag;
        if (mExternalFilesDir == null)
            mExternalFilesDir = Environment.getExternalStorageAppFilesDirectory(getPackageName());
        flag = mExternalFilesDir.exists();
        if (flag)
            break MISSING_BLOCK_LABEL_79;
        Exception exception;
        File file;
        File file1;
        try
        {
            (new File(Environment.getExternalStorageAndroidDataDir(), ".nomedia")).createNewFile();
        }
        catch (IOException ioexception) { }
        if (mExternalFilesDir.mkdirs())
            break MISSING_BLOCK_LABEL_79;
        Log.w("ContextImpl", "Unable to create external files directory");
        obj;
        JVM INSTR monitorexit ;
        return null;
        if (s != null)
            break MISSING_BLOCK_LABEL_99;
        file = mExternalFilesDir;
        obj;
        JVM INSTR monitorexit ;
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        file1 = new File(mExternalFilesDir, s);
        if (file1.exists() || file1.mkdirs())
            break MISSING_BLOCK_LABEL_160;
        Log.w("ContextImpl", (new StringBuilder()).append("Unable to create external media directory ").append(file1).toString());
        return null;
        obj;
        JVM INSTR monitorexit ;
        return file1;
    }

    public File getFileStreamPath(String s)
    {
        return makeFilename(getFilesDir(), s);
    }

    public File getFilesDir()
    {
label0:
        {
            synchronized (mSync)
            {
                if (mFilesDir == null)
                    mFilesDir = new File(getDataDirFile(), "files");
                if (mFilesDir.exists())
                    break MISSING_BLOCK_LABEL_104;
                if (mFilesDir.mkdirs())
                    break label0;
                Log.w("ContextImpl", (new StringBuilder()).append("Unable to create files directory ").append(mFilesDir.getPath()).toString());
            }
            return null;
        }
        FileUtils.setPermissions(mFilesDir.getPath(), 505, -1, -1);
        File file = mFilesDir;
        obj;
        JVM INSTR monitorexit ;
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Looper getMainLooper()
    {
        return mMainThread.getLooper();
    }

    public File getObbDir()
    {
        File file;
        synchronized (mSync)
        {
            if (mObbDir == null)
                mObbDir = Environment.getExternalStorageAppObbDirectory(getPackageName());
            file = mObbDir;
        }
        return file;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    final Context getOuterContext()
    {
        return mOuterContext;
    }

    public String getPackageCodePath()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getAppDir();
        else
            throw new RuntimeException("Not supported in system context");
    }

    public PackageManager getPackageManager()
    {
        if (mPackageManager != null)
            return mPackageManager;
        android.content.pm.IPackageManager ipackagemanager = ActivityThread.getPackageManager();
        if (ipackagemanager != null)
        {
            ApplicationPackageManager applicationpackagemanager = new ApplicationPackageManager(this, ipackagemanager);
            mPackageManager = applicationpackagemanager;
            return applicationpackagemanager;
        } else
        {
            return null;
        }
    }

    public String getPackageName()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getPackageName();
        else
            throw new RuntimeException("Not supported in system context");
    }

    public String getPackageResourcePath()
    {
        if (mPackageInfo != null)
            return mPackageInfo.getResDir();
        else
            throw new RuntimeException("Not supported in system context");
    }

    final Context getReceiverRestrictedContext()
    {
        if (mReceiverRestrictedContext != null)
        {
            return mReceiverRestrictedContext;
        } else
        {
            ReceiverRestrictedContext receiverrestrictedcontext = new ReceiverRestrictedContext(getOuterContext());
            mReceiverRestrictedContext = receiverrestrictedcontext;
            return receiverrestrictedcontext;
        }
    }

    public Resources getResources()
    {
        return mResources;
    }

    public SharedPreferences getSharedPreferences(String s, int i)
    {
        HashMap hashmap = sSharedPrefs;
        hashmap;
        JVM INSTR monitorenter ;
        SharedPreferencesImpl sharedpreferencesimpl = (SharedPreferencesImpl)sSharedPrefs.get(s);
        if (sharedpreferencesimpl != null)
            break MISSING_BLOCK_LABEL_53;
        SharedPreferencesImpl sharedpreferencesimpl1;
        sharedpreferencesimpl1 = new SharedPreferencesImpl(getSharedPrefsFile(s), i);
        sSharedPrefs.put(s, sharedpreferencesimpl1);
        hashmap;
        JVM INSTR monitorexit ;
        return sharedpreferencesimpl1;
        hashmap;
        JVM INSTR monitorexit ;
        if ((i & 4) != 0 || getApplicationInfo().targetSdkVersion < 11)
            sharedpreferencesimpl.startReloadIfChangedUnexpectedly();
        return sharedpreferencesimpl;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public File getSharedPrefsFile(String s)
    {
        return makeFilename(getPreferencesDir(), (new StringBuilder()).append(s).append(".xml").toString());
    }

    public Object getSystemService(String s)
    {
        ServiceFetcher servicefetcher = (ServiceFetcher)SYSTEM_SERVICE_MAP.get(s);
        if (servicefetcher == null)
            return null;
        else
            return servicefetcher.getService(this);
    }

    public android.content.res.Resources.Theme getTheme()
    {
        if (mTheme == null)
        {
            mThemeResource = Resources.selectDefaultTheme(mThemeResource, getOuterContext().getApplicationInfo().targetSdkVersion);
            mTheme = mResources.newTheme();
            mTheme.applyStyle(mThemeResource, true);
        }
        return mTheme;
    }

    public int getThemeResId()
    {
        return mThemeResource;
    }

    public int getUserId()
    {
        return mUser.getIdentifier();
    }

    public Drawable getWallpaper()
    {
        return getWallpaperManager().getDrawable();
    }

    public int getWallpaperDesiredMinimumHeight()
    {
        return getWallpaperManager().getDesiredMinimumHeight();
    }

    public int getWallpaperDesiredMinimumWidth()
    {
        return getWallpaperManager().getDesiredMinimumWidth();
    }

    public void grantUriPermission(String s, Uri uri, int i)
    {
        try
        {
            ActivityManagerNative.getDefault().grantUriPermission(mMainThread.getApplicationThread(), s, uri, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    final void init(LoadedApk loadedapk, IBinder ibinder, ActivityThread activitythread)
    {
        init(loadedapk, ibinder, activitythread, null, null, Process.myUserHandle());
    }

    final void init(LoadedApk loadedapk, IBinder ibinder, ActivityThread activitythread, Resources resources, String s, UserHandle userhandle)
    {
        mPackageInfo = loadedapk;
        if (s == null)
            s = loadedapk.mPackageName;
        mBasePackageName = s;
        mResources = mPackageInfo.getResources(activitythread);
        if (mResources != null && resources != null && resources.getCompatibilityInfo().applicationScale != mResources.getCompatibilityInfo().applicationScale)
            mResources = activitythread.getTopLevelResources(mPackageInfo.getResDir(), 0, null, resources.getCompatibilityInfo());
        mMainThread = activitythread;
        mActivityToken = ibinder;
        mContentResolver = new ApplicationContentResolver(this, activitythread, userhandle);
        mUser = userhandle;
    }

    final void init(Resources resources, ActivityThread activitythread, UserHandle userhandle)
    {
        mPackageInfo = null;
        mBasePackageName = null;
        mResources = resources;
        mMainThread = activitythread;
        mContentResolver = new ApplicationContentResolver(this, activitythread, userhandle);
        mUser = userhandle;
    }

    public boolean isRestricted()
    {
        return mRestricted;
    }

    public FileInputStream openFileInput(String s)
        throws FileNotFoundException
    {
        return new FileInputStream(makeFilename(getFilesDir(), s));
    }

    public FileOutputStream openFileOutput(String s, int i)
        throws FileNotFoundException
    {
        boolean flag;
        File file;
        FileOutputStream fileoutputstream;
        if ((0x8000 & i) != 0)
            flag = true;
        else
            flag = false;
        file = makeFilename(getFilesDir(), s);
        try
        {
            fileoutputstream = new FileOutputStream(file, flag);
            setFilePermissionsFromMode(file.getPath(), i, 0);
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            File file1 = file.getParentFile();
            file1.mkdir();
            FileUtils.setPermissions(file1.getPath(), 505, -1, -1);
            FileOutputStream fileoutputstream1 = new FileOutputStream(file, flag);
            setFilePermissionsFromMode(file.getPath(), i, 0);
            return fileoutputstream1;
        }
        return fileoutputstream;
    }

    public SQLiteDatabase openOrCreateDatabase(String s, int i, android.database.sqlite.SQLiteDatabase.CursorFactory cursorfactory)
    {
        return openOrCreateDatabase(s, i, cursorfactory, null);
    }

    public SQLiteDatabase openOrCreateDatabase(String s, int i, android.database.sqlite.SQLiteDatabase.CursorFactory cursorfactory, DatabaseErrorHandler databaseerrorhandler)
    {
        File file = validateFilePath(s, true);
        int j = 0x10000000;
        if ((i & 8) != 0)
            j |= 0x20000000;
        SQLiteDatabase sqlitedatabase = SQLiteDatabase.openDatabase(file.getPath(), cursorfactory, j, databaseerrorhandler);
        setFilePermissionsFromMode(file.getPath(), i, 0);
        return sqlitedatabase;
    }

    public Drawable peekWallpaper()
    {
        return getWallpaperManager().peekDrawable();
    }

    final void performFinalCleanup(String s, String s1)
    {
        mPackageInfo.removeContextRegistrations(getOuterContext(), s, s1);
    }

    public Intent registerReceiver(BroadcastReceiver broadcastreceiver, IntentFilter intentfilter)
    {
        return registerReceiver(broadcastreceiver, intentfilter, null, null);
    }

    public Intent registerReceiver(BroadcastReceiver broadcastreceiver, IntentFilter intentfilter, String s, Handler handler)
    {
        return registerReceiverInternal(broadcastreceiver, getUserId(), intentfilter, s, handler, getOuterContext());
    }

    public Intent registerReceiverAsUser(BroadcastReceiver broadcastreceiver, UserHandle userhandle, IntentFilter intentfilter, String s, Handler handler)
    {
        return registerReceiverInternal(broadcastreceiver, userhandle.getIdentifier(), intentfilter, s, handler, getOuterContext());
    }

    public void removeStickyBroadcast(Intent intent)
    {
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        if (s != null)
        {
            Intent intent1 = new Intent(intent);
            intent1.setDataAndType(intent1.getData(), s);
            intent = intent1;
        }
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().unbroadcastIntent(mMainThread.getApplicationThread(), intent, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void removeStickyBroadcastAsUser(Intent intent, UserHandle userhandle)
    {
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        if (s != null)
        {
            Intent intent1 = new Intent(intent);
            intent1.setDataAndType(intent1.getData(), s);
            intent = intent1;
        }
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().unbroadcastIntent(mMainThread.getApplicationThread(), intent, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void revokeUriPermission(Uri uri, int i)
    {
        try
        {
            ActivityManagerNative.getDefault().revokeUriPermission(mMainThread.getApplicationThread(), uri, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    final void scheduleFinalCleanup(String s, String s1)
    {
        mMainThread.scheduleContextCleanup(this, s, s1);
    }

    public void sendBroadcast(Intent intent)
    {
        warnIfCallingFromSystemProcess();
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s, null, -1, null, null, null, false, false, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendBroadcast(Intent intent, String s)
    {
        warnIfCallingFromSystemProcess();
        String s1 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s1, null, -1, null, null, s, false, false, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendBroadcastAsUser(Intent intent, UserHandle userhandle)
    {
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s, null, -1, null, null, null, false, false, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendBroadcastAsUser(Intent intent, UserHandle userhandle, String s)
    {
        String s1 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s1, null, -1, null, null, s, false, false, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendOrderedBroadcast(Intent intent, String s)
    {
        warnIfCallingFromSystemProcess();
        String s1 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s1, null, -1, null, null, s, true, false, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendOrderedBroadcast(Intent intent, String s, BroadcastReceiver broadcastreceiver, Handler handler, int i, String s1, Bundle bundle)
    {
        warnIfCallingFromSystemProcess();
        android.content.IIntentReceiver iintentreceiver = null;
        String s2;
        if (broadcastreceiver != null)
            if (mPackageInfo != null)
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                LoadedApk loadedapk = mPackageInfo;
                Context context = getOuterContext();
                Instrumentation instrumentation = mMainThread.getInstrumentation();
                iintentreceiver = loadedapk.getReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, false);
            } else
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                iintentreceiver = (new LoadedApk.ReceiverDispatcher(broadcastreceiver, getOuterContext(), handler, null, false)).getIIntentReceiver();
            }
        s2 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s2, iintentreceiver, i, s1, bundle, s, true, false, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendOrderedBroadcastAsUser(Intent intent, UserHandle userhandle, String s, BroadcastReceiver broadcastreceiver, Handler handler, int i, String s1, 
            Bundle bundle)
    {
        android.content.IIntentReceiver iintentreceiver = null;
        String s2;
        if (broadcastreceiver != null)
            if (mPackageInfo != null)
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                LoadedApk loadedapk = mPackageInfo;
                Context context = getOuterContext();
                Instrumentation instrumentation = mMainThread.getInstrumentation();
                iintentreceiver = loadedapk.getReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, false);
            } else
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                iintentreceiver = (new LoadedApk.ReceiverDispatcher(broadcastreceiver, getOuterContext(), handler, null, false)).getIIntentReceiver();
            }
        s2 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s2, iintentreceiver, i, s1, bundle, s, true, false, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendStickyBroadcast(Intent intent)
    {
        warnIfCallingFromSystemProcess();
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s, null, -1, null, null, null, false, true, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendStickyBroadcastAsUser(Intent intent, UserHandle userhandle)
    {
        String s = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s, null, -1, null, null, null, false, true, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendStickyOrderedBroadcast(Intent intent, BroadcastReceiver broadcastreceiver, Handler handler, int i, String s, Bundle bundle)
    {
        warnIfCallingFromSystemProcess();
        android.content.IIntentReceiver iintentreceiver = null;
        String s1;
        if (broadcastreceiver != null)
            if (mPackageInfo != null)
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                LoadedApk loadedapk = mPackageInfo;
                Context context = getOuterContext();
                Instrumentation instrumentation = mMainThread.getInstrumentation();
                iintentreceiver = loadedapk.getReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, false);
            } else
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                iintentreceiver = (new LoadedApk.ReceiverDispatcher(broadcastreceiver, getOuterContext(), handler, null, false)).getIIntentReceiver();
            }
        s1 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s1, iintentreceiver, i, s, bundle, null, true, true, getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void sendStickyOrderedBroadcastAsUser(Intent intent, UserHandle userhandle, BroadcastReceiver broadcastreceiver, Handler handler, int i, String s, Bundle bundle)
    {
        android.content.IIntentReceiver iintentreceiver = null;
        String s1;
        if (broadcastreceiver != null)
            if (mPackageInfo != null)
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                LoadedApk loadedapk = mPackageInfo;
                Context context = getOuterContext();
                Instrumentation instrumentation = mMainThread.getInstrumentation();
                iintentreceiver = loadedapk.getReceiverDispatcher(broadcastreceiver, context, handler, instrumentation, false);
            } else
            {
                if (handler == null)
                    handler = mMainThread.getHandler();
                iintentreceiver = (new LoadedApk.ReceiverDispatcher(broadcastreceiver, getOuterContext(), handler, null, false)).getIIntentReceiver();
            }
        s1 = intent.resolveTypeIfNeeded(getContentResolver());
        try
        {
            intent.setAllowFds(false);
            ActivityManagerNative.getDefault().broadcastIntent(mMainThread.getApplicationThread(), intent, s1, iintentreceiver, i, s, bundle, null, true, true, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    final void setOuterContext(Context context)
    {
        mOuterContext = context;
    }

    public void setTheme(int i)
    {
        mThemeResource = i;
    }

    public void setWallpaper(Bitmap bitmap)
        throws IOException
    {
        getWallpaperManager().setBitmap(bitmap);
    }

    public void setWallpaper(InputStream inputstream)
        throws IOException
    {
        getWallpaperManager().setStream(inputstream);
    }

    public void startActivities(Intent aintent[])
    {
        warnIfCallingFromSystemProcess();
        startActivities(aintent, null);
    }

    public void startActivities(Intent aintent[], Bundle bundle)
    {
        warnIfCallingFromSystemProcess();
        if ((0x10000000 & aintent[0].getFlags()) == 0)
        {
            throw new AndroidRuntimeException("Calling startActivities() from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag on first Intent. Is this really what you want?");
        } else
        {
            mMainThread.getInstrumentation().execStartActivities(getOuterContext(), mMainThread.getApplicationThread(), null, (Activity)null, aintent, bundle);
            return;
        }
    }

    public void startActivitiesAsUser(Intent aintent[], Bundle bundle, UserHandle userhandle)
    {
        if ((0x10000000 & aintent[0].getFlags()) == 0)
        {
            throw new AndroidRuntimeException("Calling startActivities() from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag on first Intent. Is this really what you want?");
        } else
        {
            mMainThread.getInstrumentation().execStartActivitiesAsUser(getOuterContext(), mMainThread.getApplicationThread(), null, (Activity)null, aintent, bundle, userhandle.getIdentifier());
            return;
        }
    }

    public void startActivity(Intent intent)
    {
        warnIfCallingFromSystemProcess();
        startActivity(intent, null);
    }

    public void startActivity(Intent intent, Bundle bundle)
    {
        warnIfCallingFromSystemProcess();
        if ((0x10000000 & intent.getFlags()) == 0)
        {
            throw new AndroidRuntimeException("Calling startActivity() from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag. Is this really what you want?");
        } else
        {
            mMainThread.getInstrumentation().execStartActivity(getOuterContext(), mMainThread.getApplicationThread(), null, (Activity)null, intent, -1, bundle);
            return;
        }
    }

    public void startActivityAsUser(Intent intent, Bundle bundle, UserHandle userhandle)
    {
        try
        {
            ActivityManagerNative.getDefault().startActivityAsUser(mMainThread.getApplicationThread(), intent, intent.resolveTypeIfNeeded(getContentResolver()), null, null, 0, 0x10000000, null, null, bundle, userhandle.getIdentifier());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void startActivityAsUser(Intent intent, UserHandle userhandle)
    {
        startActivityAsUser(intent, null, userhandle);
    }

    public boolean startInstrumentation(ComponentName componentname, String s, Bundle bundle)
    {
        if (bundle == null)
            break MISSING_BLOCK_LABEL_10;
        bundle.setAllowFds(false);
        boolean flag = ActivityManagerNative.getDefault().startInstrumentation(componentname, s, 0, bundle, null, getUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        return false;
    }

    public void startIntentSender(IntentSender intentsender, Intent intent, int i, int j, int k)
        throws android.content.IntentSender.SendIntentException
    {
        startIntentSender(intentsender, intent, i, j, k, null);
    }

    public void startIntentSender(IntentSender intentsender, Intent intent, int i, int j, int k, Bundle bundle)
        throws android.content.IntentSender.SendIntentException
    {
        String s;
        s = null;
        if (intent == null)
            break MISSING_BLOCK_LABEL_22;
        intent.setAllowFds(false);
        s = intent.resolveTypeIfNeeded(getContentResolver());
        int l = ActivityManagerNative.getDefault().startActivityIntentSender(mMainThread.getApplicationThread(), intentsender, intent, s, null, null, 0, i, j, bundle);
        if (l != -6)
            break MISSING_BLOCK_LABEL_66;
        throw new android.content.IntentSender.SendIntentException();
        Instrumentation.checkStartActivityResult(l, null);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    public ComponentName startService(Intent intent)
    {
        warnIfCallingFromSystemProcess();
        return startServiceAsUser(intent, mUser);
    }

    public ComponentName startServiceAsUser(Intent intent, UserHandle userhandle)
    {
        ComponentName componentname;
        intent.setAllowFds(false);
        componentname = ActivityManagerNative.getDefault().startService(mMainThread.getApplicationThread(), intent, intent.resolveTypeIfNeeded(getContentResolver()), userhandle.getIdentifier());
        if (componentname != null)
            try
            {
                if (componentname.getPackageName().equals("!"))
                    throw new SecurityException((new StringBuilder()).append("Not allowed to start service ").append(intent).append(" without permission ").append(componentname.getClassName()).toString());
                if (componentname.getPackageName().equals("!!"))
                    throw new SecurityException((new StringBuilder()).append("Unable to start service ").append(intent).append(": ").append(componentname.getClassName()).toString());
            }
            catch (RemoteException remoteexception)
            {
                componentname = null;
            }
        return componentname;
    }

    public boolean stopService(Intent intent)
    {
        warnIfCallingFromSystemProcess();
        return stopServiceAsUser(intent, mUser);
    }

    public boolean stopServiceAsUser(Intent intent, UserHandle userhandle)
    {
        int i;
        intent.setAllowFds(false);
        i = ActivityManagerNative.getDefault().stopService(mMainThread.getApplicationThread(), intent, intent.resolveTypeIfNeeded(getContentResolver()), userhandle.getIdentifier());
        if (i < 0)
            try
            {
                throw new SecurityException((new StringBuilder()).append("Not allowed to stop service ").append(intent).toString());
            }
            catch (RemoteException remoteexception) { }
        else
        if (i != 0)
            return true;
        return false;
    }

    public void unbindService(ServiceConnection serviceconnection)
    {
        if (serviceconnection == null)
            throw new IllegalArgumentException("connection is null");
        if (mPackageInfo != null)
        {
            IServiceConnection iserviceconnection = mPackageInfo.forgetServiceDispatcher(getOuterContext(), serviceconnection);
            try
            {
                ActivityManagerNative.getDefault().unbindService(iserviceconnection);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        } else
        {
            throw new RuntimeException("Not supported in system context");
        }
    }

    public void unregisterReceiver(BroadcastReceiver broadcastreceiver)
    {
        if (mPackageInfo != null)
        {
            android.content.IIntentReceiver iintentreceiver = mPackageInfo.forgetReceiverDispatcher(getOuterContext(), broadcastreceiver);
            try
            {
                ActivityManagerNative.getDefault().unregisterReceiver(iintentreceiver);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        } else
        {
            throw new RuntimeException("Not supported in system context");
        }
    }

    static 
    {
        WALLPAPER_FETCHER = new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new WallpaperManager(contextimpl.getOuterContext(), contextimpl.mMainThread.getHandler());
            }

        }
;
        registerService("accessibility", new ServiceFetcher() {

            public Object getService(ContextImpl contextimpl)
            {
                return AccessibilityManager.getInstance(contextimpl);
            }

        }
);
        registerService("account", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new AccountManager(contextimpl, android.accounts.IAccountManager.Stub.asInterface(ServiceManager.getService("account")));
            }

        }
);
        registerService("activity", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new ActivityManager(contextimpl.getOuterContext(), contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("alarm", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return new AlarmManager(IAlarmManager.Stub.asInterface(ServiceManager.getService("alarm")));
            }

        }
);
        registerService("audio", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new AudioManager(contextimpl);
            }

        }
);
        registerService("audioprofile", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                IAudioProfileManager iaudioprofilemanager;
                try
                {
                    iaudioprofilemanager = (IAudioProfileManager)MediatekClassFactory.createInstance(com/mediatek/common/audioprofile/IAudioProfileManager, new Object[] {
                        contextimpl
                    });
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    return null;
                }
                return iaudioprofilemanager;
            }

        }
);
        registerService("media_router", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new MediaRouter(contextimpl);
            }

        }
);
        registerService("bluetooth", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return BluetoothAdapter.getDefaultAdapter();
            }

        }
);
        registerService("clipboard", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new ClipboardManager(contextimpl.getOuterContext(), contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("connectivity", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return new ConnectivityManager(android.net.IConnectivityManager.Stub.asInterface(ServiceManager.getService("connectivity")));
            }

        }
);
        registerService("country_detector", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return new CountryDetector(android.location.ICountryDetector.Stub.asInterface(ServiceManager.getService("country_detector")));
            }

        }
);
        registerService("device_policy", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return DevicePolicyManager.create(contextimpl, contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("download", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new DownloadManager(contextimpl.getContentResolver(), contextimpl.getPackageName());
            }

        }
);
        registerService("nfc", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new NfcManager(contextimpl);
            }

        }
);
        registerService("dropbox", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return ContextImpl.createDropBoxManager();
            }

        }
);
        registerService("input", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return InputManager.getInstance();
            }

        }
);
        registerService("display", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new DisplayManager(contextimpl.getOuterContext());
            }

        }
);
        registerService("input_method", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return InputMethodManager.getInstance(contextimpl);
            }

        }
);
        registerService("textservices", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return TextServicesManager.getInstance();
            }

        }
);
        registerService("keyguard", new ServiceFetcher() {

            public Object getService(ContextImpl contextimpl)
            {
                return new KeyguardManager();
            }

        }
);
        registerService("layout_inflater", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return PolicyManager.makeNewLayoutInflater(contextimpl.getOuterContext());
            }

        }
);
        registerService("location", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new LocationManager(contextimpl, android.location.ILocationManager.Stub.asInterface(ServiceManager.getService("location")));
            }

        }
);
        registerService("netpolicy", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new NetworkPolicyManager(android.net.INetworkPolicyManager.Stub.asInterface(ServiceManager.getService("netpolicy")));
            }

        }
);
        registerService("notification", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                Context context = contextimpl.getOuterContext();
                return new NotificationManager(new ContextThemeWrapper(context, Resources.selectSystemTheme(0, context.getApplicationInfo().targetSdkVersion, 0x103000b, 0x103006f, 0x103012e)), contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("servicediscovery", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                android.net.nsd.INsdManager insdmanager = android.net.nsd.INsdManager.Stub.asInterface(ServiceManager.getService("servicediscovery"));
                return new NsdManager(contextimpl.getOuterContext(), insdmanager);
            }

        }
);
        registerService("power", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                android.os.IPowerManager ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
                return new PowerManager(contextimpl.getOuterContext(), ipowermanager, contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("search", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new SearchManager(contextimpl.getOuterContext(), contextimpl.mMainThread.getHandler());
            }

        }
);
        registerService("search_engine", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                ISearchEngineManager isearchenginemanager;
                try
                {
                    isearchenginemanager = (ISearchEngineManager)MediatekClassFactory.createInstance(com/mediatek/common/search/ISearchEngineManager, new Object[] {
                        contextimpl
                    });
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    return null;
                }
                return isearchenginemanager;
            }

        }
);
        registerService("sensor", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new SystemSensorManager(contextimpl.mMainThread.getHandler().getLooper());
            }

        }
);
        registerService("statusbar", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new StatusBarManager(contextimpl.getOuterContext());
            }

        }
);
        registerService("storage", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                StorageManager storagemanager;
                try
                {
                    storagemanager = new StorageManager(contextimpl.mMainThread.getHandler().getLooper());
                }
                catch (RemoteException remoteexception)
                {
                    Log.e("ContextImpl", "Failed to create StorageManager", remoteexception);
                    return null;
                }
                return storagemanager;
            }

        }
);
        registerService("phone", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new TelephonyManager(contextimpl.getOuterContext());
            }

        }
);
        registerService("throttle", new StaticServiceFetcher() {

            public Object createStaticService()
            {
                return new ThrottleManager(android.net.IThrottleManager.Stub.asInterface(ServiceManager.getService("throttle")));
            }

        }
);
        registerService("uimode", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new UiModeManager();
            }

        }
);
        registerService("usb", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new UsbManager(contextimpl, android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb")));
            }

        }
);
        registerService("serial", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new SerialManager(contextimpl, android.hardware.ISerialManager.Stub.asInterface(ServiceManager.getService("serial")));
            }

        }
);
        registerService("vibrator", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new SystemVibrator();
            }

        }
);
        registerService("wallpaper", WALLPAPER_FETCHER);
        registerService("wifi", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                android.net.wifi.IWifiManager iwifimanager = android.net.wifi.IWifiManager.Stub.asInterface(ServiceManager.getService("wifi"));
                return new WifiManager(contextimpl.getOuterContext(), iwifimanager);
            }

        }
);
        registerService("wifip2p", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                return new WifiP2pManager(android.net.wifi.p2p.IWifiP2pManager.Stub.asInterface(ServiceManager.getService("wifip2p")));
            }

        }
);
        registerService("window", new ServiceFetcher() {

            public Object getService(ContextImpl contextimpl)
            {
                Display display = contextimpl.mDisplay;
                if (display == null)
                    display = ((DisplayManager)contextimpl.getOuterContext().getSystemService("display")).getDisplay(0);
                return new WindowManagerImpl(display);
            }

        }
);
        registerService("user", new ServiceFetcher() {

            public Object getService(ContextImpl contextimpl)
            {
                return new UserManager(contextimpl, android.os.IUserManager.Stub.asInterface(ServiceManager.getService("user")));
            }

        }
);
        registerService("mtk-epo-client", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                MtkEpoClientManager mtkepoclientmanager;
                try
                {
                    mtkepoclientmanager = (MtkEpoClientManager)MediatekClassFactory.createInstance(com/mediatek/common/epo/MtkEpoClientManager, new Object[] {
                        contextimpl
                    });
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    return null;
                }
                return mtkepoclientmanager;
            }

        }
);
        registerService("mtk-agps", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                MtkAgpsManager mtkagpsmanager;
                try
                {
                    mtkagpsmanager = (MtkAgpsManager)MediatekClassFactory.createInstance(com/mediatek/common/agps/MtkAgpsManager, new Object[] {
                        contextimpl
                    });
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    return null;
                }
                return mtkagpsmanager;
            }

        }
);
        registerService("voicecommand", new ServiceFetcher() {

            public Object createService(ContextImpl contextimpl)
            {
                Log.i("ContextImpl", "register voicecommand");
                IVoiceCommandManager ivoicecommandmanager;
                try
                {
                    ivoicecommandmanager = (IVoiceCommandManager)MediatekClassFactory.createInstance(com/mediatek/common/voicecommand/IVoiceCommandManager, new Object[] {
                        contextimpl
                    });
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    return null;
                }
                return ivoicecommandmanager;
            }

        }
);
    }


}
