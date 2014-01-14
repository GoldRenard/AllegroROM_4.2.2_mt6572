// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.app.ActivityManager;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.os.storage.StorageVolume;
import android.util.Log;
import android.util.SparseLongArray;
import com.android.internal.app.IMediaContainerService;
import com.google.android.collect.Maps;
import com.google.common.collect.Sets;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.*;

public class StorageMeasurement
{
    static class FileInfo
        implements Comparable
    {

        final String mFileName;
        final long mId;
        final long mSize;

        public int compareTo(FileInfo fileinfo)
        {
            if (this != fileinfo && mSize != fileinfo.mSize)
                return mSize >= fileinfo.mSize ? -1 : 1;
            else
                return 0;
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((FileInfo)obj);
        }

        public String toString()
        {
            return (new StringBuilder()).append(mFileName).append(" : ").append(mSize).append(", id:").append(mId).toString();
        }

        FileInfo(String s, long l, long l1)
        {
            mFileName = s;
            mSize = l;
            mId = l1;
        }
    }

    public static class MeasurementDetails
    {

        public long appsSize;
        public long availSize;
        public long cacheSize;
        public HashMap mediaSize;
        public long miscSize;
        public long totalSize;
        public SparseLongArray usersSize;

        public MeasurementDetails()
        {
            mediaSize = Maps.newHashMap();
            usersSize = new SparseLongArray();
        }
    }

    private class MeasurementHandler extends Handler
    {

        public static final int MSG_COMPLETED = 4;
        public static final int MSG_CONNECTED = 2;
        public static final int MSG_DISCONNECT = 3;
        public static final int MSG_INVALIDATE = 5;
        public static final int MSG_MEASURE = 1;
        private volatile boolean mBound;
        private MeasurementDetails mCached;
        private final WeakReference mContext;
        private final ServiceConnection mDefContainerConn = new _cls1();
        private IMediaContainerService mDefaultContainer;
        private Object mLock;
        final StorageMeasurement this$0;

        private void measureApproximateStorage(IMediaContainerService imediacontainerservice)
        {
            String s;
            if (mVolume != null)
                s = mVolume.getPath();
            else
                s = Environment.getDataDirectory().getPath();
            Log.d("StorageMeasurement", (new StringBuilder()).append("measureApproximateStorage, path is ").append(s).toString());
            try
            {
                long al[] = imediacontainerservice.getFileSystemStats(s);
                mTotalSize = al[0];
                mAvailSize = al[1];
            }
            catch (Exception exception)
            {
                Log.w("StorageMeasurement", "Problem in container service", exception);
            }
            sendInternalApproximateUpdate();
        }

        private void measureExactStorage(IMediaContainerService imediacontainerservice)
        {
            Context context;
            if (mContext != null)
                context = (Context)mContext.get();
            else
                context = null;
            if (context != null)
            {
                MeasurementDetails measurementdetails = new MeasurementDetails();
                Message message = obtainMessage(4, measurementdetails);
                measurementdetails.totalSize = mTotalSize;
                measurementdetails.availSize = mAvailSize;
                List list = ((UserManager)context.getSystemService("user")).getUsers();
                int i = ActivityManager.getCurrentUser();
                android.os.Environment.UserEnvironment userenvironment = new android.os.Environment.UserEnvironment(i);
                boolean flag;
                if ((!mIsInternal || !Environment.isExternalStorageEmulated()) && !mIsPrimary)
                    flag = false;
                else
                    flag = true;
                Log.d("StorageMeasurement", (new StringBuilder()).append("measureMedia is ").append(flag).append("mIsInternal is ").append(mIsInternal).append(" isEmulated: ").append(Environment.isExternalStorageEmulated()).append(" mIsPrimary is ").append(mIsPrimary).toString());
                if (flag)
                {
                    String s;
                    long l1;
                    for (Iterator iterator3 = StorageMeasurement.sMeasureMediaTypes.iterator(); iterator3.hasNext(); measurementdetails.mediaSize.put(s, Long.valueOf(l1)))
                    {
                        s = (String)iterator3.next();
                        l1 = StorageMeasurement.getDirectorySize(imediacontainerservice, userenvironment.getExternalStoragePublicDirectory(s));
                    }

                }
                if (mIsInternal || mIsPrimary)
                {
                    File file;
                    if (mIsInternal)
                        file = userenvironment.getExternalStorageDirectory();
                    else
                        file = mVolume.getPathFile();
                    measurementdetails.miscSize = measureMisc(imediacontainerservice, file);
                }
                UserInfo userinfo1;
                long l;
                for (Iterator iterator = list.iterator(); iterator.hasNext(); StorageMeasurement.addValue(measurementdetails.usersSize, userinfo1.id, l))
                {
                    userinfo1 = (UserInfo)iterator.next();
                    android.os.Environment.UserEnvironment userenvironment1 = new android.os.Environment.UserEnvironment(userinfo1.id);
                    l = StorageMeasurement.getDirectorySize(imediacontainerservice, userenvironment1.getExternalStorageDirectory());
                }

                PackageManager packagemanager = context.getPackageManager();
                if (!mIsInternal && !mIsPrimary)
                {
                    message.sendToTarget();
                    return;
                }
                List list1 = packagemanager.getInstalledApplications(8704);
                int j = list.size() * list1.size();
                StatsObserver statsobserver = new StatsObserver(mIsInternal, measurementdetails, i, message, j);
                for (Iterator iterator1 = list.iterator(); iterator1.hasNext();)
                {
                    UserInfo userinfo = (UserInfo)iterator1.next();
                    Iterator iterator2 = list1.iterator();
                    while (iterator2.hasNext()) 
                        packagemanager.getPackageSizeInfo(((PackageItemInfo) ((ApplicationInfo)iterator2.next())).packageName, userinfo.id, statsobserver);
                }

            }
        }

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 1 5: default 40
        //                       1 41
        //                       2 166
        //                       3 188
        //                       4 258
        //                       5 281;
               goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
            return;
_L2:
            Context context1;
            if (mCached != null)
            {
                sendExactUpdate(mCached);
                return;
            }
            WeakReference weakreference1 = mContext;
            context1 = null;
            if (weakreference1 != null)
                context1 = (Context)mContext.get();
            if (context1 == null) goto _L1; else goto _L7
_L7:
            Object obj1 = mLock;
            obj1;
            JVM INSTR monitorenter ;
            if (!mBound) goto _L9; else goto _L8
_L8:
            removeMessages(3);
            sendMessage(obtainMessage(2, mDefaultContainer));
_L10:
            return;
            Exception exception1;
            exception1;
            obj1;
            JVM INSTR monitorexit ;
            throw exception1;
_L9:
            context1.bindService((new Intent()).setComponent(StorageMeasurement.DEFAULT_CONTAINER_COMPONENT), mDefContainerConn, 1, 0);
              goto _L10
_L3:
            IMediaContainerService imediacontainerservice = (IMediaContainerService)message.obj;
            measureApproximateStorage(imediacontainerservice);
            measureExactStorage(imediacontainerservice);
            return;
_L4:
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            if (!mBound) goto _L12; else goto _L11
_L11:
            WeakReference weakreference = mContext;
            Context context = null;
            if (weakreference == null) goto _L14; else goto _L13
_L13:
            context = (Context)mContext.get();
_L14:
            if (context != null) goto _L16; else goto _L15
_L15:
            obj;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
_L16:
            mBound = false;
            context.unbindService(mDefContainerConn);
_L12:
            obj;
            JVM INSTR monitorexit ;
            return;
_L5:
            mCached = (MeasurementDetails)message.obj;
            sendExactUpdate(mCached);
            return;
_L6:
            mCached = null;
            return;
        }


/*
        static IMediaContainerService access$102(MeasurementHandler measurementhandler, IMediaContainerService imediacontainerservice)
        {
            measurementhandler.mDefaultContainer = imediacontainerservice;
            return imediacontainerservice;
        }

*/


/*
        static boolean access$202(MeasurementHandler measurementhandler, boolean flag)
        {
            measurementhandler.mBound = flag;
            return flag;
        }

*/

        public MeasurementHandler(Context context, Looper looper)
        {
            this$0 = StorageMeasurement.this;
            super(looper);
            mLock = new Object();
            mBound = false;
            mContext = new WeakReference(context);
        }
    }

    public static interface MeasurementReceiver
    {

        public abstract void updateApproximate(StorageMeasurement storagemeasurement, long l, long l1);

        public abstract void updateDetails(StorageMeasurement storagemeasurement, MeasurementDetails measurementdetails);
    }

    private static class StatsObserver extends android.content.pm.IPackageStatsObserver.Stub
    {

        private final int mCurrentUser;
        private final MeasurementDetails mDetails;
        private final Message mFinished;
        private final boolean mIsInternal;
        private int mRemaining;

        private void addStatsLocked(PackageStats packagestats)
        {
            if (mIsInternal)
            {
                long l = packagestats.codeSize;
                long l1 = packagestats.dataSize;
                long l2 = packagestats.cacheSize;
                if (Environment.isExternalStorageEmulated())
                {
                    l += packagestats.externalCodeSize + packagestats.externalObbSize;
                    l1 += packagestats.externalDataSize + packagestats.externalMediaSize;
                    l2 += packagestats.externalCacheSize;
                }
                if (packagestats.userHandle == mCurrentUser)
                {
                    MeasurementDetails measurementdetails3 = mDetails;
                    measurementdetails3.appsSize = l + measurementdetails3.appsSize;
                    MeasurementDetails measurementdetails4 = mDetails;
                    measurementdetails4.appsSize = l1 + measurementdetails4.appsSize;
                }
                StorageMeasurement.addValue(mDetails.usersSize, packagestats.userHandle, l1);
                MeasurementDetails measurementdetails2 = mDetails;
                measurementdetails2.cacheSize = l2 + measurementdetails2.cacheSize;
                return;
            } else
            {
                MeasurementDetails measurementdetails = mDetails;
                measurementdetails.appsSize = measurementdetails.appsSize + (packagestats.externalCodeSize + packagestats.externalDataSize + packagestats.externalMediaSize + packagestats.externalObbSize);
                MeasurementDetails measurementdetails1 = mDetails;
                measurementdetails1.cacheSize = measurementdetails1.cacheSize + packagestats.externalCacheSize;
                return;
            }
        }

        public void onGetStatsCompleted(PackageStats packagestats, boolean flag)
        {
            MeasurementDetails measurementdetails = mDetails;
            measurementdetails;
            JVM INSTR monitorenter ;
            if (!flag)
                break MISSING_BLOCK_LABEL_16;
            addStatsLocked(packagestats);
            int i;
            i = -1 + mRemaining;
            mRemaining = i;
            if (i != 0)
                break MISSING_BLOCK_LABEL_42;
            mFinished.sendToTarget();
            measurementdetails;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            measurementdetails;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public StatsObserver(boolean flag, MeasurementDetails measurementdetails, int i, Message message, int j)
        {
            mIsInternal = flag;
            mDetails = measurementdetails;
            mCurrentUser = i;
            mFinished = message;
            mRemaining = j;
        }
    }


    public static final ComponentName DEFAULT_CONTAINER_COMPONENT = new ComponentName("com.android.defcontainer", "com.android.defcontainer.DefaultContainerService");
    private static final String DEFAULT_CONTAINER_PACKAGE = "com.android.defcontainer";
    private static final boolean LOCAL_LOGV = true;
    static final boolean LOGV = Log.isLoggable("StorageMeasurement", 2);
    private static final String TAG = "StorageMeasurement";
    private static HashMap sInstances = Maps.newHashMap();
    private static final Set sMeasureMediaTypes;
    private long mAvailSize;
    List mFileInfoForMisc;
    private final MeasurementHandler mHandler;
    private final boolean mIsInternal;
    private final boolean mIsPrimary;
    private volatile WeakReference mReceiver;
    private long mTotalSize;
    private final StorageVolume mVolume;

    private StorageMeasurement(Context context, StorageVolume storagevolume)
    {
        mVolume = storagevolume;
        boolean flag;
        if (storagevolume == null)
            flag = true;
        else
            flag = false;
        mIsInternal = flag;
        boolean flag1 = false;
        if (storagevolume != null)
            flag1 = storagevolume.isPrimary();
        mIsPrimary = flag1;
        HandlerThread handlerthread = new HandlerThread("MemoryMeasurement");
        handlerthread.start();
        mHandler = new MeasurementHandler(context, handlerthread.getLooper());
    }

    private static void addValue(SparseLongArray sparselongarray, int i, long l)
    {
        sparselongarray.put(i, l + sparselongarray.get(i));
    }

    private static long getDirectorySize(IMediaContainerService imediacontainerservice, File file)
    {
        long l;
        try
        {
            l = imediacontainerservice.calculateDirectorySize(file.toString());
            Log.d("StorageMeasurement", (new StringBuilder()).append("getDirectorySize(").append(file).append(") returned ").append(l).toString());
        }
        catch (Exception exception)
        {
            Log.w("StorageMeasurement", (new StringBuilder()).append("Could not read memory from default container service for ").append(file).toString(), exception);
            return 0L;
        }
        return l;
    }

    public static StorageMeasurement getInstance(Context context, StorageVolume storagevolume)
    {
        HashMap hashmap = sInstances;
        hashmap;
        JVM INSTR monitorenter ;
        StorageMeasurement storagemeasurement = (StorageMeasurement)sInstances.get(storagevolume);
        if (storagemeasurement != null)
            break MISSING_BLOCK_LABEL_47;
        storagemeasurement = new StorageMeasurement(context.getApplicationContext(), storagevolume);
        sInstances.put(storagevolume, storagemeasurement);
        hashmap;
        JVM INSTR monitorexit ;
        return storagemeasurement;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private long measureMisc(IMediaContainerService imediacontainerservice, File file)
    {
        mFileInfoForMisc = new ArrayList();
        File afile[] = file.listFiles();
        if (afile == null)
            return 0L;
        long l = 0L;
        long l1 = 0L;
        int i = afile.length;
        for (int j = 0; j < i; j++)
        {
            File file1 = afile[j];
            String s = file1.getAbsolutePath();
            String s1 = file1.getName();
            if (sMeasureMediaTypes.contains(s1))
                continue;
            if (file1.isFile())
            {
                long l4 = file1.length();
                List list1 = mFileInfoForMisc;
                long l5 = l + 1L;
                list1.add(new FileInfo(s, l4, l));
                l1 += l4;
                l = l5;
                continue;
            }
            if (file1.isDirectory())
            {
                long l2 = getDirectorySize(imediacontainerservice, file1);
                List list = mFileInfoForMisc;
                long l3 = l + 1L;
                list.add(new FileInfo(s, l2, l));
                l1 += l2;
                l = l3;
            }
        }

        Collections.sort(mFileInfoForMisc);
        return l1;
    }

    private void sendExactUpdate(MeasurementDetails measurementdetails)
    {
        MeasurementReceiver measurementreceiver;
        if (mReceiver != null)
            measurementreceiver = (MeasurementReceiver)mReceiver.get();
        else
            measurementreceiver = null;
        if (measurementreceiver == null)
        {
            if (LOGV)
                Log.i("StorageMeasurement", "measurements dropped because receiver is null! wasted effort");
            return;
        } else
        {
            measurementreceiver.updateDetails(this, measurementdetails);
            return;
        }
    }

    private void sendInternalApproximateUpdate()
    {
        MeasurementReceiver measurementreceiver;
        if (mReceiver != null)
            measurementreceiver = (MeasurementReceiver)mReceiver.get();
        else
            measurementreceiver = null;
        if (measurementreceiver == null)
        {
            return;
        } else
        {
            measurementreceiver.updateApproximate(this, mTotalSize, mAvailSize);
            return;
        }
    }

    public void cleanUp()
    {
        mReceiver = null;
        mHandler.removeMessages(1);
        mHandler.sendEmptyMessage(3);
    }

    public void invalidate()
    {
        mHandler.sendEmptyMessage(5);
    }

    public void measure()
    {
        if (!mHandler.hasMessages(1))
            mHandler.sendEmptyMessage(1);
    }

    public void setReceiver(MeasurementReceiver measurementreceiver)
    {
        if (mReceiver == null || mReceiver.get() == null)
            mReceiver = new WeakReference(measurementreceiver);
    }

    static 
    {
        String as[] = new String[10];
        as[0] = Environment.DIRECTORY_DCIM;
        as[1] = Environment.DIRECTORY_MOVIES;
        as[2] = Environment.DIRECTORY_PICTURES;
        as[3] = Environment.DIRECTORY_MUSIC;
        as[4] = Environment.DIRECTORY_ALARMS;
        as[5] = Environment.DIRECTORY_NOTIFICATIONS;
        as[6] = Environment.DIRECTORY_RINGTONES;
        as[7] = Environment.DIRECTORY_PODCASTS;
        as[8] = Environment.DIRECTORY_DOWNLOADS;
        as[9] = Environment.DIRECTORY_ANDROID;
        sMeasureMediaTypes = Sets.newHashSet(as);
    }









/*
    static long access$502(StorageMeasurement storagemeasurement, long l)
    {
        storagemeasurement.mTotalSize = l;
        return l;
    }

*/



/*
    static long access$602(StorageMeasurement storagemeasurement, long l)
    {
        storagemeasurement.mAvailSize = l;
        return l;
    }

*/




    // Unreferenced inner class com/android/settings/deviceinfo/StorageMeasurement$MeasurementHandler$1

/* anonymous class */
    class MeasurementHandler._cls1
        implements ServiceConnection
    {

        final MeasurementHandler this$1;

        public void onServiceConnected(ComponentName componentname, IBinder ibinder)
        {
            IMediaContainerService imediacontainerservice = com.android.internal.app.IMediaContainerService.Stub.asInterface(ibinder);
            mDefaultContainer = imediacontainerservice;
            mBound = true;
            sendMessage(obtainMessage(2, imediacontainerservice));
        }

        public void onServiceDisconnected(ComponentName componentname)
        {
            mBound = false;
            removeMessages(2);
        }

            
            {
                this$1 = MeasurementHandler.this;
                super();
            }
    }

}
