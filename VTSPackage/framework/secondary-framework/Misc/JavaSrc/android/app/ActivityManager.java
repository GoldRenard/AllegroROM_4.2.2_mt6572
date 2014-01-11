// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.hardware.display.DisplayManagerGlobal;
import android.os.*;
import android.text.TextUtils;
import android.util.*;
import android.view.Display;
import com.android.internal.app.IUsageStats;
import com.android.internal.os.PkgUsageStats;
import com.android.internal.util.MemInfoReader;
import java.util.*;

// Referenced classes of package android.app:
//            AppGlobals, ActivityManagerNative, IActivityManager, PendingIntent, 
//            IThumbnailReceiver, IThumbnailRetriever

public class ActivityManager
{
    public static class MemoryInfo
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public MemoryInfo createFromParcel(Parcel parcel)
            {
                return new MemoryInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public MemoryInfo[] newArray(int i)
            {
                return new MemoryInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public long availMem;
        public long foregroundAppThreshold;
        public long hiddenAppThreshold;
        public boolean lowMemory;
        public long secondaryServerThreshold;
        public long threshold;
        public long totalMem;
        public long visibleAppThreshold;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            availMem = parcel.readLong();
            totalMem = parcel.readLong();
            threshold = parcel.readLong();
            boolean flag;
            if (parcel.readInt() != 0)
                flag = true;
            else
                flag = false;
            lowMemory = flag;
            hiddenAppThreshold = parcel.readLong();
            secondaryServerThreshold = parcel.readLong();
            visibleAppThreshold = parcel.readLong();
            foregroundAppThreshold = parcel.readLong();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeLong(availMem);
            parcel.writeLong(totalMem);
            parcel.writeLong(threshold);
            int j;
            if (lowMemory)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
            parcel.writeLong(hiddenAppThreshold);
            parcel.writeLong(secondaryServerThreshold);
            parcel.writeLong(visibleAppThreshold);
            parcel.writeLong(foregroundAppThreshold);
        }



        private MemoryInfo(Parcel parcel)
        {
            readFromParcel(parcel);
        }

    }

    public static class ProcessErrorStateInfo
        implements Parcelable
    {

        public static final int CRASHED = 1;
        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public ProcessErrorStateInfo createFromParcel(Parcel parcel)
            {
                return new ProcessErrorStateInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public ProcessErrorStateInfo[] newArray(int i)
            {
                return new ProcessErrorStateInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public static final int NOT_RESPONDING = 2;
        public static final int NO_ERROR;
        public int condition;
        public byte crashData[];
        public String longMsg;
        public int pid;
        public String processName;
        public String shortMsg;
        public String stackTrace;
        public String tag;
        public int uid;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            condition = parcel.readInt();
            processName = parcel.readString();
            pid = parcel.readInt();
            uid = parcel.readInt();
            tag = parcel.readString();
            shortMsg = parcel.readString();
            longMsg = parcel.readString();
            stackTrace = parcel.readString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(condition);
            parcel.writeString(processName);
            parcel.writeInt(pid);
            parcel.writeInt(uid);
            parcel.writeString(tag);
            parcel.writeString(shortMsg);
            parcel.writeString(longMsg);
            parcel.writeString(stackTrace);
        }


        public ProcessErrorStateInfo()
        {
            crashData = null;
        }

        private ProcessErrorStateInfo(Parcel parcel)
        {
            crashData = null;
            readFromParcel(parcel);
        }

    }

    public static class RecentTaskInfo
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public RecentTaskInfo createFromParcel(Parcel parcel)
            {
                return new RecentTaskInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public RecentTaskInfo[] newArray(int i)
            {
                return new RecentTaskInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public Intent baseIntent;
        public CharSequence description;
        public int id;
        public ComponentName origActivity;
        public int persistentId;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            id = parcel.readInt();
            persistentId = parcel.readInt();
            if (parcel.readInt() != 0)
                baseIntent = (Intent)Intent.CREATOR.createFromParcel(parcel);
            else
                baseIntent = null;
            origActivity = ComponentName.readFromParcel(parcel);
            description = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(id);
            parcel.writeInt(persistentId);
            if (baseIntent != null)
            {
                parcel.writeInt(1);
                baseIntent.writeToParcel(parcel, 0);
            } else
            {
                parcel.writeInt(0);
            }
            ComponentName.writeToParcel(origActivity, parcel);
            TextUtils.writeToParcel(description, parcel, 1);
        }



        private RecentTaskInfo(Parcel parcel)
        {
            readFromParcel(parcel);
        }

    }

    public static class RunningAppProcessInfo
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public RunningAppProcessInfo createFromParcel(Parcel parcel)
            {
                return new RunningAppProcessInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public RunningAppProcessInfo[] newArray(int i)
            {
                return new RunningAppProcessInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public static final int FLAG_CANT_SAVE_STATE = 1;
        public static final int FLAG_HAS_ACTIVITIES = 4;
        public static final int FLAG_PERSISTENT = 2;
        public static final int IMPORTANCE_BACKGROUND = 400;
        public static final int IMPORTANCE_CANT_SAVE_STATE = 170;
        public static final int IMPORTANCE_EMPTY = 500;
        public static final int IMPORTANCE_FOREGROUND = 100;
        public static final int IMPORTANCE_PERCEPTIBLE = 130;
        public static final int IMPORTANCE_PERSISTENT = 50;
        public static final int IMPORTANCE_SERVICE = 300;
        public static final int IMPORTANCE_VISIBLE = 200;
        public static final int REASON_PROVIDER_IN_USE = 1;
        public static final int REASON_SERVICE_IN_USE = 2;
        public static final int REASON_UNKNOWN;
        public int flags;
        public int importance;
        public int importanceReasonCode;
        public ComponentName importanceReasonComponent;
        public int importanceReasonImportance;
        public int importanceReasonPid;
        public int lastTrimLevel;
        public int lru;
        public int pid;
        public String pkgList[];
        public String processName;
        public int uid;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            processName = parcel.readString();
            pid = parcel.readInt();
            uid = parcel.readInt();
            pkgList = parcel.readStringArray();
            flags = parcel.readInt();
            lastTrimLevel = parcel.readInt();
            importance = parcel.readInt();
            lru = parcel.readInt();
            importanceReasonCode = parcel.readInt();
            importanceReasonPid = parcel.readInt();
            importanceReasonComponent = ComponentName.readFromParcel(parcel);
            importanceReasonImportance = parcel.readInt();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeString(processName);
            parcel.writeInt(pid);
            parcel.writeInt(uid);
            parcel.writeStringArray(pkgList);
            parcel.writeInt(flags);
            parcel.writeInt(lastTrimLevel);
            parcel.writeInt(importance);
            parcel.writeInt(lru);
            parcel.writeInt(importanceReasonCode);
            parcel.writeInt(importanceReasonPid);
            ComponentName.writeToParcel(importanceReasonComponent, parcel);
            parcel.writeInt(importanceReasonImportance);
        }


        public RunningAppProcessInfo()
        {
            importance = 100;
            importanceReasonCode = 0;
        }

        private RunningAppProcessInfo(Parcel parcel)
        {
            readFromParcel(parcel);
        }


        public RunningAppProcessInfo(String s, int i, String as[])
        {
            processName = s;
            pid = i;
            pkgList = as;
        }
    }

    public static class RunningServiceInfo
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public RunningServiceInfo createFromParcel(Parcel parcel)
            {
                return new RunningServiceInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public RunningServiceInfo[] newArray(int i)
            {
                return new RunningServiceInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public static final int FLAG_FOREGROUND = 2;
        public static final int FLAG_PERSISTENT_PROCESS = 8;
        public static final int FLAG_STARTED = 1;
        public static final int FLAG_SYSTEM_PROCESS = 4;
        public long activeSince;
        public int clientCount;
        public int clientLabel;
        public String clientPackage;
        public int crashCount;
        public int flags;
        public boolean foreground;
        public long lastActivityTime;
        public int pid;
        public String process;
        public long restarting;
        public ComponentName service;
        public boolean started;
        public int uid;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            boolean flag = true;
            service = ComponentName.readFromParcel(parcel);
            pid = parcel.readInt();
            uid = parcel.readInt();
            process = parcel.readString();
            boolean flag1;
            if (parcel.readInt() != 0)
                flag1 = flag;
            else
                flag1 = false;
            foreground = flag1;
            activeSince = parcel.readLong();
            if (parcel.readInt() == 0)
                flag = false;
            started = flag;
            clientCount = parcel.readInt();
            crashCount = parcel.readInt();
            lastActivityTime = parcel.readLong();
            restarting = parcel.readLong();
            flags = parcel.readInt();
            clientPackage = parcel.readString();
            clientLabel = parcel.readInt();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            int j = 1;
            ComponentName.writeToParcel(service, parcel);
            parcel.writeInt(pid);
            parcel.writeInt(uid);
            parcel.writeString(process);
            int k;
            if (foreground)
                k = j;
            else
                k = 0;
            parcel.writeInt(k);
            parcel.writeLong(activeSince);
            if (!started)
                j = 0;
            parcel.writeInt(j);
            parcel.writeInt(clientCount);
            parcel.writeInt(crashCount);
            parcel.writeLong(lastActivityTime);
            parcel.writeLong(restarting);
            parcel.writeInt(flags);
            parcel.writeString(clientPackage);
            parcel.writeInt(clientLabel);
        }



        private RunningServiceInfo(Parcel parcel)
        {
            readFromParcel(parcel);
        }

    }

    public static class RunningTaskInfo
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public RunningTaskInfo createFromParcel(Parcel parcel)
            {
                return new RunningTaskInfo(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public RunningTaskInfo[] newArray(int i)
            {
                return new RunningTaskInfo[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public ComponentName baseActivity;
        public CharSequence description;
        public int id;
        public int numActivities;
        public int numRunning;
        public Bitmap thumbnail;
        public ComponentName topActivity;

        public int describeContents()
        {
            return 0;
        }

        public void readFromParcel(Parcel parcel)
        {
            id = parcel.readInt();
            baseActivity = ComponentName.readFromParcel(parcel);
            topActivity = ComponentName.readFromParcel(parcel);
            if (parcel.readInt() != 0)
                thumbnail = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
            else
                thumbnail = null;
            description = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            numActivities = parcel.readInt();
            numRunning = parcel.readInt();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(id);
            ComponentName.writeToParcel(baseActivity, parcel);
            ComponentName.writeToParcel(topActivity, parcel);
            if (thumbnail != null)
            {
                parcel.writeInt(1);
                thumbnail.writeToParcel(parcel, 0);
            } else
            {
                parcel.writeInt(0);
            }
            TextUtils.writeToParcel(description, parcel, 1);
            parcel.writeInt(numActivities);
            parcel.writeInt(numRunning);
        }



        private RunningTaskInfo(Parcel parcel)
        {
            readFromParcel(parcel);
        }

    }

    public static class TaskThumbnails
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public TaskThumbnails createFromParcel(Parcel parcel)
            {
                return new TaskThumbnails(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public TaskThumbnails[] newArray(int i)
            {
                return new TaskThumbnails[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public Bitmap mainThumbnail;
        public int numSubThumbbails;
        public IThumbnailRetriever retriever;

        public int describeContents()
        {
            return 0;
        }

        public Bitmap getSubThumbnail(int i)
        {
            Bitmap bitmap;
            try
            {
                bitmap = retriever.getThumbnail(i);
            }
            catch (RemoteException remoteexception)
            {
                return null;
            }
            return bitmap;
        }

        public void readFromParcel(Parcel parcel)
        {
            if (parcel.readInt() != 0)
                mainThumbnail = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
            else
                mainThumbnail = null;
            numSubThumbbails = parcel.readInt();
            retriever = IThumbnailRetriever.Stub.asInterface(parcel.readStrongBinder());
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            if (mainThumbnail != null)
            {
                parcel.writeInt(1);
                mainThumbnail.writeToParcel(parcel, 0);
            } else
            {
                parcel.writeInt(0);
            }
            parcel.writeInt(numSubThumbbails);
            parcel.writeStrongInterface(retriever);
        }



        private TaskThumbnails(Parcel parcel)
        {
            readFromParcel(parcel);
        }

    }


    public static final int BROADCAST_STICKY_CANT_HAVE_PERMISSION = -1;
    public static final int BROADCAST_SUCCESS = 0;
    public static final int COMPAT_MODE_ALWAYS = -1;
    public static final int COMPAT_MODE_DISABLED = 0;
    public static final int COMPAT_MODE_ENABLED = 1;
    public static final int COMPAT_MODE_NEVER = -2;
    public static final int COMPAT_MODE_TOGGLE = 2;
    public static final int COMPAT_MODE_UNKNOWN = -3;
    public static final int INTENT_SENDER_ACTIVITY = 2;
    public static final int INTENT_SENDER_ACTIVITY_RESULT = 3;
    public static final int INTENT_SENDER_BROADCAST = 1;
    public static final int INTENT_SENDER_SERVICE = 4;
    public static final int MOVE_TASK_NO_USER_ACTION = 2;
    public static final int MOVE_TASK_WITH_HOME = 1;
    public static final int RECENT_IGNORE_UNAVAILABLE = 2;
    public static final int RECENT_WITH_EXCLUDED = 1;
    public static final int REMOVE_TASK_KILL_PROCESS = 1;
    public static final int START_CANCELED = -6;
    public static final int START_CLASS_NOT_FOUND = -2;
    public static final int START_DELIVERED_TO_TOP = 3;
    public static final int START_FLAG_AUTO_STOP_PROFILER = 8;
    public static final int START_FLAG_DEBUG = 2;
    public static final int START_FLAG_ONLY_IF_NEEDED = 1;
    public static final int START_FLAG_OPENGL_TRACES = 4;
    public static final int START_FORWARD_AND_REQUEST_CONFLICT = -3;
    public static final int START_INTENT_NOT_RESOLVED = -1;
    public static final int START_NOT_ACTIVITY = -5;
    public static final int START_PERMISSION_DENIED = -4;
    public static final int START_RETURN_INTENT_TO_CALLER = 1;
    public static final int START_SUCCESS = 0;
    public static final int START_SWITCHES_CANCELED = 4;
    public static final int START_TASK_TO_FRONT = 2;
    private static String TAG = "ActivityManager";
    public static final int USER_OP_IS_CURRENT = -2;
    public static final int USER_OP_SUCCESS = 0;
    public static final int USER_OP_UNKNOWN_USER = -1;
    private static boolean localLOGV = false;
    private final Context mContext;
    private final Handler mHandler;

    ActivityManager(Context context, Handler handler)
    {
        mContext = context;
        mHandler = handler;
    }

    public static int checkComponentPermission(String s, int i, int j, boolean flag)
    {
        byte byte0 = -1;
        if (i == 0 || i == 1000)
            byte0 = 0;
        else
        if (!UserHandle.isIsolated(i))
        {
            if (j >= 0 && UserHandle.isSameApp(i, j))
                return 0;
            if (!flag)
            {
                Slog.w(TAG, (new StringBuilder()).append("Permission denied: checkComponentPermission() owningUid=").append(j).toString());
                return byte0;
            }
            if (s == null)
                return 0;
            int k;
            try
            {
                k = AppGlobals.getPackageManager().checkUidPermission(s, i);
            }
            catch (RemoteException remoteexception)
            {
                Slog.e(TAG, "PackageManager is dead?!?", remoteexception);
                return byte0;
            }
            return k;
        }
        return byte0;
    }

    public static int checkUidPermission(String s, int i)
    {
        int j;
        try
        {
            j = AppGlobals.getPackageManager().checkUidPermission(s, i);
        }
        catch (RemoteException remoteexception)
        {
            Slog.e(TAG, "PackageManager is dead?!?", remoteexception);
            return -1;
        }
        return j;
    }

    public static int getCurrentUser()
    {
        UserInfo userinfo;
        int i;
        try
        {
            userinfo = ActivityManagerNative.getDefault().getCurrentUser();
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        i = 0;
        if (userinfo == null)
            break MISSING_BLOCK_LABEL_20;
        i = userinfo.id;
        return i;
    }

    public static void getMyMemoryState(RunningAppProcessInfo runningappprocessinfo)
    {
        try
        {
            ActivityManagerNative.getDefault().getMyMemoryState(runningappprocessinfo);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public static int handleIncomingUser(int i, int j, int k, boolean flag, boolean flag1, String s, String s1)
    {
        if (UserHandle.getUserId(j) == k)
            return k;
        int l;
        try
        {
            l = ActivityManagerNative.getDefault().handleIncomingUser(i, j, k, flag, flag1, s, s1);
        }
        catch (RemoteException remoteexception)
        {
            throw new SecurityException("Failed calling activity manager", remoteexception);
        }
        return l;
    }

    public static boolean isHighEndGfx()
    {
        MemInfoReader meminforeader = new MemInfoReader();
        meminforeader.readMemInfo();
        if (meminforeader.getTotalSize() < 0x20000000L)
        {
            Display display = DisplayManagerGlobal.getInstance().getRealDisplay(0);
            Point point = new Point();
            display.getRealSize(point);
            if (point.x * point.y < 0x96000)
                return false;
        }
        return true;
    }

    public static boolean isLargeRAM()
    {
        MemInfoReader meminforeader = new MemInfoReader();
        meminforeader.readMemInfo();
        return meminforeader.getTotalSize() >= 0x28000000L;
    }

    public static boolean isRunningInTestHarness()
    {
        return SystemProperties.getBoolean("ro.test_harness", false);
    }

    public static boolean isUserAMonkey()
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isUserAMonkey();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public static int staticGetLargeMemoryClass()
    {
        String s = SystemProperties.get("dalvik.vm.heapsize", "16m");
        return Integer.parseInt(s.substring(0, -1 + s.length()));
    }

    public static int staticGetMemoryClass()
    {
        String s = SystemProperties.get("dalvik.vm.heapgrowthlimit", "");
        if (s != null && !"".equals(s))
            return Integer.parseInt(s.substring(0, -1 + s.length()));
        else
            return staticGetLargeMemoryClass();
    }

    public boolean clearApplicationUserData(String s, IPackageDataObserver ipackagedataobserver)
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().clearApplicationUserData(s, ipackagedataobserver, UserHandle.myUserId());
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public void forceStopPackage(String s)
    {
        try
        {
            ActivityManagerNative.getDefault().forceStopPackage(s, UserHandle.myUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public Map getAllPackageLaunchCounts()
    {
        PkgUsageStats apkgusagestats[];
        IUsageStats iusagestats;
        HashMap hashmap;
        try
        {
            iusagestats = com.android.internal.app.IUsageStats.Stub.asInterface(ServiceManager.getService("usagestats"));
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, "Could not query launch counts", remoteexception);
            return new HashMap();
        }
        if (iusagestats != null)
            break MISSING_BLOCK_LABEL_22;
        return new HashMap();
        apkgusagestats = iusagestats.getAllPkgUsageStats();
        if (apkgusagestats != null)
            break MISSING_BLOCK_LABEL_67;
        hashmap = new HashMap();
        return hashmap;
        HashMap hashmap1;
        int i;
        hashmap1 = new HashMap();
        i = apkgusagestats.length;
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        PkgUsageStats pkgusagestats = apkgusagestats[j];
        hashmap1.put(pkgusagestats.packageName, Integer.valueOf(pkgusagestats.launchCount));
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        return hashmap1;
    }

    public PkgUsageStats[] getAllPackageUsageStats()
    {
        IUsageStats iusagestats = com.android.internal.app.IUsageStats.Stub.asInterface(ServiceManager.getService("usagestats"));
        if (iusagestats == null)
            break MISSING_BLOCK_LABEL_37;
        PkgUsageStats apkgusagestats[] = iusagestats.getAllPkgUsageStats();
        return apkgusagestats;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Could not query usage stats", remoteexception);
        return new PkgUsageStats[0];
    }

    public ConfigurationInfo getDeviceConfigurationInfo()
    {
        ConfigurationInfo configurationinfo;
        try
        {
            configurationinfo = ActivityManagerNative.getDefault().getDeviceConfigurationInfo();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return configurationinfo;
    }

    public int getFrontActivityScreenCompatMode()
    {
        int i;
        try
        {
            i = ActivityManagerNative.getDefault().getFrontActivityScreenCompatMode();
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public int getLargeMemoryClass()
    {
        return staticGetLargeMemoryClass();
    }

    public int getLauncherLargeIconDensity()
    {
        Resources resources = mContext.getResources();
        int i = resources.getDisplayMetrics().densityDpi;
        if (resources.getConfiguration().smallestScreenWidthDp < 600)
            return i;
        switch (i)
        {
        case 480: 
            return 640;

        case 320: 
            return 480;

        case 240: 
            return 320;

        case 213: 
            return 320;

        case 160: 
            return 240;

        case 120: // 'x'
            return 160;
        }
        return (int)(0.5F + 1.5F * (float)i);
    }

    public int getLauncherLargeIconSize()
    {
        Resources resources = mContext.getResources();
        int i = resources.getDimensionPixelSize(0x1050000);
        if (resources.getConfiguration().smallestScreenWidthDp < 600)
            return i;
        switch (resources.getDisplayMetrics().densityDpi)
        {
        case 480: 
            return (2 * (i * 320)) / 480;

        case 320: 
            return (i * 480) / 320;

        case 240: 
            return (i * 320) / 240;

        case 213: 
            return (i * 320) / 240;

        case 160: 
            return (i * 240) / 160;

        case 120: // 'x'
            return (i * 160) / 120;
        }
        return (int)(0.5F + 1.5F * (float)i);
    }

    public int getMemoryClass()
    {
        return staticGetMemoryClass();
    }

    public void getMemoryInfo(MemoryInfo memoryinfo)
    {
        try
        {
            ActivityManagerNative.getDefault().getMemoryInfo(memoryinfo);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean getPackageAskScreenCompat(String s)
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().getPackageAskScreenCompat(s);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public int getPackageScreenCompatMode(String s)
    {
        int i;
        try
        {
            i = ActivityManagerNative.getDefault().getPackageScreenCompatMode(s);
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public android.os.Debug.MemoryInfo[] getProcessMemoryInfo(int ai[])
    {
        android.os.Debug.MemoryInfo amemoryinfo[];
        try
        {
            amemoryinfo = ActivityManagerNative.getDefault().getProcessMemoryInfo(ai);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return amemoryinfo;
    }

    public List getProcessesInErrorState()
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getProcessesInErrorState();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public List getRecentTasks(int i, int j)
        throws SecurityException
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getRecentTasks(i, j, UserHandle.myUserId());
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public List getRecentTasksForUser(int i, int j, int k)
        throws SecurityException
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getRecentTasks(i, j, k);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public List getRunningAppProcesses()
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getRunningAppProcesses();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public List getRunningExternalApplications()
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getRunningExternalApplications();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public PendingIntent getRunningServiceControlPanel(ComponentName componentname)
        throws SecurityException
    {
        PendingIntent pendingintent;
        try
        {
            pendingintent = ActivityManagerNative.getDefault().getRunningServiceControlPanel(componentname);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return pendingintent;
    }

    public List getRunningServices(int i)
        throws SecurityException
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getServices(i, 0);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public List getRunningTasks(int i)
        throws SecurityException
    {
        return getRunningTasks(i, 0, null);
    }

    public List getRunningTasks(int i, int j, IThumbnailReceiver ithumbnailreceiver)
        throws SecurityException
    {
        List list;
        try
        {
            list = ActivityManagerNative.getDefault().getTasks(i, j, ithumbnailreceiver);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return list;
    }

    public TaskThumbnails getTaskThumbnails(int i)
        throws SecurityException
    {
        TaskThumbnails taskthumbnails;
        try
        {
            taskthumbnails = ActivityManagerNative.getDefault().getTaskThumbnails(i);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return taskthumbnails;
    }

    public Bitmap getTaskTopThumbnail(int i)
        throws SecurityException
    {
        Bitmap bitmap;
        try
        {
            bitmap = ActivityManagerNative.getDefault().getTaskTopThumbnail(i);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return bitmap;
    }

    public boolean isUserRunning(int i)
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isUserRunning(i, false);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public void killBackgroundProcesses(String s)
    {
        try
        {
            ActivityManagerNative.getDefault().killBackgroundProcesses(s, UserHandle.myUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void moveTaskToFront(int i, int j)
    {
        moveTaskToFront(i, j, null);
    }

    public void moveTaskToFront(int i, int j, Bundle bundle)
    {
        try
        {
            ActivityManagerNative.getDefault().moveTaskToFront(i, j, bundle);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean removeSubTask(int i, int j)
        throws SecurityException
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().removeSubTask(i, j);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public boolean removeTask(int i, int j)
        throws SecurityException
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().removeTask(i, j);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public void restartPackage(String s)
    {
        killBackgroundProcesses(s);
    }

    public void setFrontActivityScreenCompatMode(int i)
    {
        try
        {
            ActivityManagerNative.getDefault().setFrontActivityScreenCompatMode(i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setPackageAskScreenCompat(String s, boolean flag)
    {
        try
        {
            ActivityManagerNative.getDefault().setPackageAskScreenCompat(s, flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setPackageScreenCompatMode(String s, int i)
    {
        try
        {
            ActivityManagerNative.getDefault().setPackageScreenCompatMode(s, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean switchUser(int i)
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().switchUser(i);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

}
