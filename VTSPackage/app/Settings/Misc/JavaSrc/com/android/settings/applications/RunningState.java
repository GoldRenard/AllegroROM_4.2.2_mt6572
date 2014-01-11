// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.*;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.text.format.Formatter;
import android.util.Log;
import android.util.SparseArray;
import com.android.internal.util.MemInfoReader;
import com.android.settings.users.UserUtils;
import java.util.*;

// Referenced classes of package com.android.settings.applications:
//            InterestingConfigChanges

public class RunningState
{
    static class AppProcessInfo
    {

        boolean hasForegroundServices;
        boolean hasServices;
        final android.app.ActivityManager.RunningAppProcessInfo info;

        AppProcessInfo(android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo)
        {
            info = runningappprocessinfo;
        }
    }

    final class BackgroundHandler extends Handler
    {

        final RunningState this$0;

        public void handleMessage(Message message)
        {
            Object obj;
            switch (message.what)
            {
            default:
                return;

            case 1: // '\001'
                reset();
                return;

            case 2: // '\002'
                obj = mLock;
                break;
            }
            obj;
            JVM INSTR monitorenter ;
            if (mResumed)
                break MISSING_BLOCK_LABEL_65;
            obj;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
            obj;
            JVM INSTR monitorexit ;
            Message message1 = mHandler.obtainMessage(3);
            int i;
            if (update(mApplicationContext, mAm))
                i = 1;
            else
                i = 0;
            message1.arg1 = i;
            mHandler.sendMessage(message1);
            removeMessages(2);
            sendMessageDelayed(obtainMessage(2), 2000L);
            return;
        }

        public BackgroundHandler(Looper looper)
        {
            this$0 = RunningState.this;
            super(looper);
        }
    }

    static class BaseItem
    {

        long mActiveSince;
        boolean mBackground;
        int mCurSeq;
        String mCurSizeStr;
        String mDescription;
        CharSequence mDisplayLabel;
        final boolean mIsProcess;
        String mLabel;
        boolean mNeedDivider;
        PackageItemInfo mPackageInfo;
        long mSize;
        String mSizeStr;
        final int mUserId;

        public Drawable loadIcon(Context context, RunningState runningstate)
        {
            if (mPackageInfo != null)
                return mPackageInfo.loadIcon(runningstate.mPm);
            else
                return null;
        }

        public BaseItem(boolean flag, int i)
        {
            mIsProcess = flag;
            mUserId = i;
        }
    }

    static class MergedItem extends BaseItem
    {

        final ArrayList mChildren = new ArrayList();
        private int mLastNumProcesses;
        private int mLastNumServices;
        final ArrayList mOtherProcesses = new ArrayList();
        ProcessItem mProcess;
        final ArrayList mServices = new ArrayList();
        UserState mUser;

        private void setDescription(Context context, int i, int j)
        {
            if (mLastNumProcesses != i || mLastNumServices != j)
            {
                mLastNumProcesses = i;
                mLastNumServices = j;
                int k = 0x7f0b06a4;
                if (i != 1)
                {
                    if (j != 1)
                        k = 0x7f0b06a7;
                    else
                        k = 0x7f0b06a6;
                } else
                if (j != 1)
                    k = 0x7f0b06a5;
                Resources resources = context.getResources();
                Object aobj[] = new Object[2];
                aobj[0] = Integer.valueOf(i);
                aobj[1] = Integer.valueOf(j);
                super.mDescription = resources.getString(k, aobj);
            }
        }

        public Drawable loadIcon(Context context, RunningState runningstate)
        {
            if (mUser == null)
                return super.loadIcon(context, runningstate);
            if (mUser.mIcon != null)
                return mUser.mIcon.getConstantState().newDrawable();
            else
                return context.getResources().getDrawable(0x1080326);
        }

        boolean update(Context context, boolean flag)
        {
            super.mBackground = flag;
            if (mUser != null)
            {
                super.mPackageInfo = ((BaseItem) (((MergedItem)mChildren.get(0)).mProcess)).mPackageInfo;
                String s;
                if (mUser != null)
                    s = mUser.mLabel;
                else
                    s = null;
                super.mLabel = s;
                super.mDisplayLabel = super.mLabel;
                int k = 0;
                int l = 0;
                super.mActiveSince = -1L;
                for (int i1 = 0; i1 < mChildren.size(); i1++)
                {
                    MergedItem mergeditem = (MergedItem)mChildren.get(i1);
                    k += mergeditem.mLastNumProcesses;
                    l += mergeditem.mLastNumServices;
                    if (((BaseItem) (mergeditem)).mActiveSince >= 0L && super.mActiveSince < ((BaseItem) (mergeditem)).mActiveSince)
                        super.mActiveSince = ((BaseItem) (mergeditem)).mActiveSince;
                }

                if (!super.mBackground)
                    setDescription(context, k, l);
            } else
            {
                super.mPackageInfo = ((BaseItem) (mProcess)).mPackageInfo;
                super.mDisplayLabel = ((BaseItem) (mProcess)).mDisplayLabel;
                super.mLabel = ((BaseItem) (mProcess)).mLabel;
                if (!super.mBackground)
                {
                    int j;
                    if (mProcess.mPid > 0)
                        j = 1;
                    else
                        j = 0;
                    setDescription(context, j + mOtherProcesses.size(), mServices.size());
                }
                super.mActiveSince = -1L;
                for (int i = 0; i < mServices.size(); i++)
                {
                    ServiceItem serviceitem = (ServiceItem)mServices.get(i);
                    if (((BaseItem) (serviceitem)).mActiveSince >= 0L && super.mActiveSince < ((BaseItem) (serviceitem)).mActiveSince)
                        super.mActiveSince = ((BaseItem) (serviceitem)).mActiveSince;
                }

            }
            return false;
        }

        boolean updateSize(Context context)
        {
            if (mUser != null)
            {
                super.mSize = 0L;
                for (int j = 0; j < mChildren.size(); j++)
                {
                    MergedItem mergeditem = (MergedItem)mChildren.get(j);
                    mergeditem.updateSize(context);
                    super.mSize = super.mSize + ((BaseItem) (mergeditem)).mSize;
                }

            } else
            {
                super.mSize = ((BaseItem) (mProcess)).mSize;
                for (int i = 0; i < mOtherProcesses.size(); i++)
                    super.mSize = super.mSize + ((BaseItem) ((ProcessItem)mOtherProcesses.get(i))).mSize;

            }
            String s = Formatter.formatShortFileSize(context, super.mSize);
            if (!s.equals(super.mSizeStr))
                super.mSizeStr = s;
            return false;
        }

        MergedItem(int i)
        {
            super(false, i);
            mLastNumProcesses = -1;
            mLastNumServices = -1;
        }
    }

    static interface OnRefreshUiListener
    {

        public static final int REFRESH_DATA = 1;
        public static final int REFRESH_STRUCTURE = 2;
        public static final int REFRESH_TIME;

        public abstract void onRefreshUi(int i);
    }

    static class ProcessItem extends BaseItem
    {

        long mActiveSince;
        ProcessItem mClient;
        final SparseArray mDependentProcesses = new SparseArray();
        boolean mInteresting;
        boolean mIsStarted;
        boolean mIsSystem;
        int mLastNumDependentProcesses;
        MergedItem mMergedItem;
        int mPid;
        final String mProcessName;
        android.app.ActivityManager.RunningAppProcessInfo mRunningProcessInfo;
        int mRunningSeq;
        final HashMap mServices = new HashMap();
        final int mUid;

        void addDependentProcesses(ArrayList arraylist, ArrayList arraylist1)
        {
            int i = mDependentProcesses.size();
            for (int j = 0; j < i; j++)
            {
                ProcessItem processitem = (ProcessItem)mDependentProcesses.valueAt(j);
                processitem.addDependentProcesses(arraylist, arraylist1);
                arraylist.add(processitem);
                if (processitem.mPid > 0)
                    arraylist1.add(processitem);
            }

        }

        boolean buildDependencyChain(Context context, PackageManager packagemanager, int i)
        {
            int j = mDependentProcesses.size();
            boolean flag = false;
            for (int k = 0; k < j; k++)
            {
                ProcessItem processitem = (ProcessItem)mDependentProcesses.valueAt(k);
                if (processitem.mClient != this)
                {
                    flag = true;
                    processitem.mClient = this;
                }
                processitem.mCurSeq = i;
                processitem.ensureLabel(packagemanager);
                flag |= processitem.buildDependencyChain(context, packagemanager, i);
            }

            if (mLastNumDependentProcesses != mDependentProcesses.size())
            {
                flag = true;
                mLastNumDependentProcesses = mDependentProcesses.size();
            }
            return flag;
        }

        void ensureLabel(PackageManager packagemanager)
        {
            String as[];
            int i;
            int j;
            if (super.mLabel != null)
                return;
            try
            {
                ApplicationInfo applicationinfo2 = packagemanager.getApplicationInfo(mProcessName, 8192);
                if (applicationinfo2.uid == mUid)
                {
                    super.mDisplayLabel = applicationinfo2.loadLabel(packagemanager);
                    super.mLabel = super.mDisplayLabel.toString();
                    super.mPackageInfo = applicationinfo2;
                    return;
                }
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
            as = packagemanager.getPackagesForUid(mUid);
            if (as.length == 1)
                try
                {
                    ApplicationInfo applicationinfo1 = packagemanager.getApplicationInfo(as[0], 8192);
                    super.mDisplayLabel = applicationinfo1.loadLabel(packagemanager);
                    super.mLabel = super.mDisplayLabel.toString();
                    super.mPackageInfo = applicationinfo1;
                    return;
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception3) { }
            i = as.length;
            j = 0;
_L3:
            if (j >= i) goto _L2; else goto _L1
_L1:
            String s = as[j];
            PackageInfo packageinfo;
            CharSequence charsequence;
            packageinfo = packagemanager.getPackageInfo(s, 0);
            if (packageinfo.sharedUserLabel == 0)
                continue; /* Loop/switch isn't completed */
            charsequence = packagemanager.getText(s, packageinfo.sharedUserLabel, packageinfo.applicationInfo);
            if (charsequence == null)
                continue; /* Loop/switch isn't completed */
            try
            {
                super.mDisplayLabel = charsequence;
                super.mLabel = charsequence.toString();
                super.mPackageInfo = packageinfo.applicationInfo;
                return;
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception2)
            {
                j++;
            }
              goto _L3
_L2:
            if (mServices.size() > 0)
            {
                super.mPackageInfo = ((ServiceItem)mServices.values().iterator().next()).mServiceInfo.applicationInfo;
                super.mDisplayLabel = super.mPackageInfo.loadLabel(packagemanager);
                super.mLabel = super.mDisplayLabel.toString();
                return;
            }
            try
            {
                ApplicationInfo applicationinfo = packagemanager.getApplicationInfo(as[0], 8192);
                super.mDisplayLabel = applicationinfo.loadLabel(packagemanager);
                super.mLabel = super.mDisplayLabel.toString();
                super.mPackageInfo = applicationinfo;
                return;
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1)
            {
                return;
            }
        }

        boolean updateService(Context context, android.app.ActivityManager.RunningServiceInfo runningserviceinfo)
        {
            PackageManager packagemanager = context.getPackageManager();
            ServiceItem serviceitem = (ServiceItem)mServices.get(runningserviceinfo.service);
            boolean flag = false;
            if (serviceitem == null)
            {
                flag = true;
                serviceitem = new ServiceItem(super.mUserId);
                serviceitem.mRunningService = runningserviceinfo;
                long l;
                android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
                String s;
                String s1;
                try
                {
                    serviceitem.mServiceInfo = ActivityThread.getPackageManager().getServiceInfo(runningserviceinfo.service, 8192, UserHandle.getUserId(runningserviceinfo.uid));
                }
                catch (RemoteException remoteexception) { }
                serviceitem.mDisplayLabel = RunningState.makeLabel(packagemanager, serviceitem.mRunningService.service.getClassName(), serviceitem.mServiceInfo);
                if (super.mDisplayLabel != null)
                    s1 = super.mDisplayLabel.toString();
                else
                    s1 = null;
                super.mLabel = s1;
                serviceitem.mPackageInfo = serviceitem.mServiceInfo.applicationInfo;
                mServices.put(runningserviceinfo.service, serviceitem);
            }
            serviceitem.mCurSeq = super.mCurSeq;
            serviceitem.mRunningService = runningserviceinfo;
            if (runningserviceinfo.restarting == 0L)
                l = runningserviceinfo.activeSince;
            else
                l = -1L;
            if (((BaseItem) (serviceitem)).mActiveSince != l)
            {
                serviceitem.mActiveSince = l;
                flag = true;
            }
            if (runningserviceinfo.clientPackage != null && runningserviceinfo.clientLabel != 0)
            {
                if (serviceitem.mShownAsStarted)
                {
                    serviceitem.mShownAsStarted = false;
                    flag = true;
                }
                try
                {
                    s = packagemanager.getResourcesForApplication(runningserviceinfo.clientPackage).getString(runningserviceinfo.clientLabel);
                    serviceitem.mDescription = context.getResources().getString(0x7f0b069d, new Object[] {
                        s
                    });
                }
                // Misplaced declaration of an exception variable
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                {
                    serviceitem.mDescription = null;
                    return flag;
                }
                return flag;
            }
            if (!serviceitem.mShownAsStarted)
            {
                serviceitem.mShownAsStarted = true;
                flag = true;
            }
            serviceitem.mDescription = context.getResources().getString(0x7f0b069c);
            return flag;
        }

        boolean updateSize(Context context, long l, int i)
        {
            super.mSize = 1024L * l;
            if (super.mCurSeq == i)
            {
                String s = Formatter.formatShortFileSize(context, super.mSize);
                if (!s.equals(super.mSizeStr))
                    super.mSizeStr = s;
            }
            return false;
        }

        public ProcessItem(Context context, int i, String s)
        {
            super(true, UserHandle.getUserId(i));
            super.mDescription = context.getResources().getString(0x7f0b06a1, new Object[] {
                s
            });
            mUid = i;
            mProcessName = s;
        }
    }

    static class ServiceItem extends BaseItem
    {

        MergedItem mMergedItem;
        android.app.ActivityManager.RunningServiceInfo mRunningService;
        ServiceInfo mServiceInfo;
        boolean mShownAsStarted;

        public ServiceItem(int i)
        {
            super(false, i);
        }
    }

    class ServiceProcessComparator
        implements Comparator
    {

        final RunningState this$0;

        public int compare(ProcessItem processitem, ProcessItem processitem1)
        {
label0:
            {
                int i = 1;
                if (((BaseItem) (processitem)).mUserId != ((BaseItem) (processitem1)).mUserId)
                {
                    if (((BaseItem) (processitem)).mUserId != mMyUserId)
                    {
                        if (((BaseItem) (processitem1)).mUserId == mMyUserId)
                            return i;
                        if (((BaseItem) (processitem)).mUserId >= ((BaseItem) (processitem1)).mUserId)
                            return i;
                    }
                } else
                if (processitem.mIsStarted != processitem1.mIsStarted)
                {
                    if (!processitem.mIsStarted)
                        return i;
                } else
                {
                    if (processitem.mIsSystem != processitem1.mIsSystem)
                    {
                        if (!processitem.mIsSystem)
                            i = -1;
                        return i;
                    }
                    if (processitem.mActiveSince == processitem1.mActiveSince)
                        break label0;
                    if (processitem.mActiveSince <= processitem1.mActiveSince)
                        return i;
                }
                return -1;
            }
            return 0;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((ProcessItem)obj, (ProcessItem)obj1);
        }

        ServiceProcessComparator()
        {
            this$0 = RunningState.this;
            super();
        }
    }

    static class UserState
    {

        Drawable mIcon;
        UserInfo mInfo;
        String mLabel;

    }


    static final long CONTENTS_UPDATE_DELAY = 2000L;
    static final boolean DEBUG_COMPARE = false;
    static final int MAX_SERVICES = 100;
    static final int MSG_REFRESH_UI = 3;
    static final int MSG_RESET_CONTENTS = 1;
    static final int MSG_UPDATE_CONTENTS = 2;
    static final int MSG_UPDATE_TIME = 4;
    static final String TAG = "RunningState";
    static final long TIME_UPDATE_DELAY = 1000L;
    static Object sGlobalLock = new Object();
    static RunningState sInstance;
    final ArrayList mAllProcessItems = new ArrayList();
    final ActivityManager mAm;
    final Context mApplicationContext;
    final Comparator mBackgroundComparator = new Comparator() {

        final RunningState this$0;

        public int compare(MergedItem mergeditem, MergedItem mergeditem1)
        {
            int i = 1;
            if (((BaseItem) (mergeditem)).mUserId != ((BaseItem) (mergeditem1)).mUserId)
            {
                if (((BaseItem) (mergeditem)).mUserId != mMyUserId)
                {
                    if (((BaseItem) (mergeditem1)).mUserId == mMyUserId)
                        return i;
                    if (((BaseItem) (mergeditem)).mUserId >= ((BaseItem) (mergeditem1)).mUserId)
                        return i;
                }
            } else
            if (mergeditem.mProcess == mergeditem1.mProcess)
            {
                if (((BaseItem) (mergeditem)).mLabel == ((BaseItem) (mergeditem1)).mLabel)
                    return 0;
                if (((BaseItem) (mergeditem)).mLabel != null)
                    return ((BaseItem) (mergeditem)).mLabel.compareTo(((BaseItem) (mergeditem1)).mLabel);
            } else
            if (mergeditem.mProcess != null)
            {
                if (mergeditem1.mProcess == null)
                    return i;
                android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo = mergeditem.mProcess.mRunningProcessInfo;
                android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo1 = mergeditem1.mProcess.mRunningProcessInfo;
                int j;
                if (runningappprocessinfo.importance >= 400)
                    j = i;
                else
                    j = 0;
                int k;
                if (runningappprocessinfo1.importance >= 400)
                    k = i;
                else
                    k = 0;
                if (j != k)
                {
                    if (j == 0)
                        i = -1;
                    return i;
                }
                int l;
                if ((4 & runningappprocessinfo.flags) != 0)
                    l = i;
                else
                    l = 0;
                int i1;
                if ((4 & runningappprocessinfo1.flags) != 0)
                    i1 = i;
                else
                    i1 = 0;
                if (l != i1)
                {
                    if (l == 0)
                        return i;
                } else
                if (runningappprocessinfo.lru != runningappprocessinfo1.lru)
                {
                    if (runningappprocessinfo.lru >= runningappprocessinfo1.lru)
                        return i;
                } else
                {
                    if (((BaseItem) (mergeditem.mProcess)).mLabel == ((BaseItem) (mergeditem1.mProcess)).mLabel)
                        return 0;
                    if (((BaseItem) (mergeditem.mProcess)).mLabel == null)
                        return i;
                    if (((BaseItem) (mergeditem1.mProcess)).mLabel != null)
                        return ((BaseItem) (mergeditem.mProcess)).mLabel.compareTo(((BaseItem) (mergeditem1.mProcess)).mLabel);
                }
            }
            return -1;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((MergedItem)obj, (MergedItem)obj1);
        }

            
            {
                this$0 = RunningState.this;
                super();
            }
    }
;
    final BackgroundHandler mBackgroundHandler;
    ArrayList mBackgroundItems;
    long mBackgroundProcessMemory;
    final HandlerThread mBackgroundThread = new HandlerThread("RunningState:Background");
    long mForegroundProcessMemory;
    final Handler mHandler = new Handler() {

        int mNextUpdate;
        final RunningState this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 3 4: default 28
        //                       3 29
        //                       4 52;
               goto _L1 _L2 _L3
_L1:
            return;
_L2:
            int i;
            if (message.arg1 != 0)
                i = 2;
            else
                i = 1;
            mNextUpdate = i;
            return;
_L3:
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            if (!mResumed)
                return;
              goto _L4
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
_L4:
            obj;
            JVM INSTR monitorexit ;
            removeMessages(4);
            sendMessageDelayed(obtainMessage(4), 1000L);
            if (mRefreshUiListener != null)
            {
                mRefreshUiListener.onRefreshUi(mNextUpdate);
                mNextUpdate = 0;
                return;
            }
            if (true) goto _L1; else goto _L5
_L5:
        }

            
            {
                this$0 = RunningState.this;
                super();
                mNextUpdate = 0;
            }
    }
;
    boolean mHaveData;
    final InterestingConfigChanges mInterestingConfigChanges = new InterestingConfigChanges();
    final ArrayList mInterestingProcesses = new ArrayList();
    ArrayList mItems;
    final Object mLock = new Object();
    ArrayList mMergedItems;
    final int mMyUserId = UserHandle.myUserId();
    int mNumBackgroundProcesses;
    int mNumForegroundProcesses;
    int mNumServiceProcesses;
    final SparseArray mOtherUserBackgroundItems = new SparseArray();
    final SparseArray mOtherUserMergedItems = new SparseArray();
    final PackageManager mPm;
    final ArrayList mProcessItems = new ArrayList();
    OnRefreshUiListener mRefreshUiListener;
    boolean mResumed;
    final SparseArray mRunningProcesses = new SparseArray();
    int mSequence;
    final ServiceProcessComparator mServiceProcessComparator = new ServiceProcessComparator();
    long mServiceProcessMemory;
    final SparseArray mServiceProcessesByName = new SparseArray();
    final SparseArray mServiceProcessesByPid = new SparseArray();
    final SparseArray mTmpAppProcesses = new SparseArray();
    final UserManager mUm;
    ArrayList mUserBackgroundItems;
    final SparseArray mUsers = new SparseArray();
    boolean mWatchingBackgroundItems;

    private RunningState(Context context)
    {
        mSequence = 0;
        mItems = new ArrayList();
        mMergedItems = new ArrayList();
        mBackgroundItems = new ArrayList();
        mUserBackgroundItems = new ArrayList();
        mApplicationContext = context.getApplicationContext();
        mAm = (ActivityManager)mApplicationContext.getSystemService("activity");
        mPm = mApplicationContext.getPackageManager();
        mUm = (UserManager)mApplicationContext.getSystemService("user");
        mResumed = false;
        mBackgroundThread.start();
        mBackgroundHandler = new BackgroundHandler(mBackgroundThread.getLooper());
    }

    private void addOtherUserItem(Context context, ArrayList arraylist, SparseArray sparsearray, MergedItem mergeditem)
    {
        MergedItem mergeditem1 = (MergedItem)sparsearray.get(((BaseItem) (mergeditem)).mUserId);
        boolean flag;
        if (mergeditem1 != null && ((BaseItem) (mergeditem1)).mCurSeq == mSequence)
            flag = false;
        else
            flag = true;
        if (flag)
        {
            if (mergeditem1 == null)
            {
                mergeditem1 = new MergedItem(((BaseItem) (mergeditem)).mUserId);
                sparsearray.put(((BaseItem) (mergeditem)).mUserId, mergeditem1);
            } else
            {
                mergeditem1.mChildren.clear();
            }
            mergeditem1.mCurSeq = mSequence;
            UserState userstate = (UserState)mUsers.get(((BaseItem) (mergeditem)).mUserId);
            mergeditem1.mUser = userstate;
            if (userstate == null)
            {
                mergeditem1.mUser = new UserState();
                UserInfo userinfo = mUm.getUserInfo(((BaseItem) (mergeditem)).mUserId);
                mergeditem1.mUser.mInfo = userinfo;
                if (userinfo != null)
                    mergeditem1.mUser.mIcon = UserUtils.getUserIcon(mUm, userinfo, context.getResources());
                String s;
                if (userinfo != null)
                    s = userinfo.name;
                else
                    s = null;
                if (s == null)
                    s = Integer.toString(userinfo.id);
                mergeditem1.mUser.mLabel = context.getResources().getString(0x7f0b06a2, new Object[] {
                    s
                });
            }
            arraylist.add(mergeditem1);
        }
        mergeditem1.mChildren.add(mergeditem);
    }

    static RunningState getInstance(Context context)
    {
        RunningState runningstate;
        synchronized (sGlobalLock)
        {
            if (sInstance == null)
                sInstance = new RunningState(context);
            runningstate = sInstance;
        }
        return runningstate;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean isInterestingProcess(android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo)
    {
        return (1 & runningappprocessinfo.flags) != 0 || (2 & runningappprocessinfo.flags) == 0 && runningappprocessinfo.importance >= 100 && runningappprocessinfo.importance < 170 && runningappprocessinfo.importanceReasonCode == 0;
    }

    static CharSequence makeLabel(PackageManager packagemanager, String s, PackageItemInfo packageiteminfo)
    {
        Object obj;
label0:
        {
            if (packageiteminfo != null && (packageiteminfo.labelRes != 0 || packageiteminfo.nonLocalizedLabel != null))
            {
                obj = packageiteminfo.loadLabel(packagemanager);
                if (obj != null)
                    break label0;
            }
            obj = s;
            int i = ((String) (obj)).lastIndexOf('.');
            if (i >= 0)
                return ((String) (obj)).substring(i + 1, ((String) (obj)).length());
        }
        return ((CharSequence) (obj));
    }

    private void reset()
    {
        mServiceProcessesByName.clear();
        mServiceProcessesByPid.clear();
        mInterestingProcesses.clear();
        mRunningProcesses.clear();
        mProcessItems.clear();
        mAllProcessItems.clear();
        mUsers.clear();
    }

    private boolean update(Context context, ActivityManager activitymanager)
    {
        PackageManager packagemanager;
        boolean flag;
        List list;
        int i;
        List list1;
        int k;
        int j1;
        packagemanager = context.getPackageManager();
        mSequence = 1 + mSequence;
        flag = false;
        list = activitymanager.getRunningServices(100);
        int j;
        if (list != null)
            i = list.size();
        else
            i = 0;
        j = 0;
        while (j < i) 
        {
            android.app.ActivityManager.RunningServiceInfo runningserviceinfo2 = (android.app.ActivityManager.RunningServiceInfo)list.get(j);
            if (!runningserviceinfo2.started && runningserviceinfo2.clientLabel == 0)
            {
                list.remove(j);
                j--;
                i--;
            } else
            if ((8 & runningserviceinfo2.flags) != 0)
            {
                list.remove(j);
                j--;
                i--;
            }
            j++;
        }
        list1 = activitymanager.getRunningAppProcesses();
        if (list1 != null)
            k = list1.size();
        else
            k = 0;
        mTmpAppProcesses.clear();
        for (int l = 0; l < k; l++)
        {
            android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo1 = (android.app.ActivityManager.RunningAppProcessInfo)list1.get(l);
            SparseArray sparsearray1 = mTmpAppProcesses;
            int k16 = runningappprocessinfo1.pid;
            AppProcessInfo appprocessinfo3 = new AppProcessInfo(runningappprocessinfo1);
            sparsearray1.put(k16, appprocessinfo3);
        }

        for (int i1 = 0; i1 < i; i1++)
        {
            android.app.ActivityManager.RunningServiceInfo runningserviceinfo1 = (android.app.ActivityManager.RunningServiceInfo)list.get(i1);
            if (runningserviceinfo1.restarting != 0L || runningserviceinfo1.pid <= 0)
                continue;
            AppProcessInfo appprocessinfo2 = (AppProcessInfo)mTmpAppProcesses.get(runningserviceinfo1.pid);
            if (appprocessinfo2 == null)
                continue;
            appprocessinfo2.hasServices = true;
            if (runningserviceinfo1.foreground)
                appprocessinfo2.hasForegroundServices = true;
        }

        j1 = 0;
_L31:
        if (j1 >= i) goto _L2; else goto _L1
_L1:
        android.app.ActivityManager.RunningServiceInfo runningserviceinfo = (android.app.ActivityManager.RunningServiceInfo)list.get(j1);
        if (runningserviceinfo.restarting != 0L || runningserviceinfo.pid <= 0) goto _L4; else goto _L3
_L3:
        AppProcessInfo appprocessinfo = (AppProcessInfo)mTmpAppProcesses.get(runningserviceinfo.pid);
        if (appprocessinfo == null || appprocessinfo.hasForegroundServices || appprocessinfo.info.importance >= 300) goto _L4; else goto _L5
_L5:
        AppProcessInfo appprocessinfo1 = (AppProcessInfo)mTmpAppProcesses.get(appprocessinfo.info.importanceReasonPid);
_L12:
        boolean flag7 = false;
        if (appprocessinfo1 == null) goto _L7; else goto _L6
_L6:
        if (!appprocessinfo1.hasServices && !isInterestingProcess(appprocessinfo1.info)) goto _L9; else goto _L8
_L8:
        flag7 = true;
_L7:
        if (!flag7) goto _L4; else goto _L10
_L10:
        j1++;
        continue; /* Loop/switch isn't completed */
_L9:
        appprocessinfo1 = (AppProcessInfo)mTmpAppProcesses.get(appprocessinfo1.info.importanceReasonPid);
        continue; /* Loop/switch isn't completed */
_L4:
        HashMap hashmap1 = (HashMap)mServiceProcessesByName.get(runningserviceinfo.uid);
        if (hashmap1 == null)
        {
            hashmap1 = new HashMap();
            mServiceProcessesByName.put(runningserviceinfo.uid, hashmap1);
        }
        String s1 = runningserviceinfo.process;
        ProcessItem processitem11 = (ProcessItem)hashmap1.get(s1);
        if (processitem11 == null)
        {
            flag = true;
            int j16 = runningserviceinfo.uid;
            String s2 = runningserviceinfo.process;
            processitem11 = new ProcessItem(context, j16, s2);
            String s3 = runningserviceinfo.process;
            hashmap1.put(s3, processitem11);
        }
        if (((BaseItem) (processitem11)).mCurSeq != mSequence)
        {
            int j15;
            int k15;
            int l15;
            if (runningserviceinfo.restarting == 0L)
                j15 = runningserviceinfo.pid;
            else
                j15 = 0;
            k15 = processitem11.mPid;
            if (j15 != k15)
            {
                flag = true;
                if (processitem11.mPid != j15)
                {
                    if (processitem11.mPid != 0)
                        mServiceProcessesByPid.remove(processitem11.mPid);
                    if (j15 != 0)
                        mServiceProcessesByPid.put(j15, processitem11);
                    int i16 = j15;
                    processitem11.mPid = i16;
                }
            }
            processitem11.mDependentProcesses.clear();
            l15 = mSequence;
            processitem11.mCurSeq = l15;
        }
        flag |= processitem11.updateService(context, runningserviceinfo);
        if (true) goto _L10; else goto _L2
_L2:
        int l5;
        int i6;
        int j6;
        int k1 = 0;
        while (k1 < k) 
        {
            android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo = (android.app.ActivityManager.RunningAppProcessInfo)list1.get(k1);
            ProcessItem processitem10 = (ProcessItem)mServiceProcessesByPid.get(runningappprocessinfo.pid);
            if (processitem10 == null)
            {
                processitem10 = (ProcessItem)mRunningProcesses.get(runningappprocessinfo.pid);
                if (processitem10 == null)
                {
                    flag = true;
                    int l14 = runningappprocessinfo.uid;
                    String s = runningappprocessinfo.processName;
                    processitem10 = new ProcessItem(context, l14, s);
                    int i15 = runningappprocessinfo.pid;
                    processitem10.mPid = i15;
                    mRunningProcesses.put(runningappprocessinfo.pid, processitem10);
                }
                processitem10.mDependentProcesses.clear();
            }
            int j14;
            if (isInterestingProcess(runningappprocessinfo))
            {
                if (!mInterestingProcesses.contains(processitem10))
                {
                    flag = true;
                    mInterestingProcesses.add(processitem10);
                }
                int k14 = mSequence;
                processitem10.mCurSeq = k14;
                processitem10.mInteresting = true;
                processitem10.ensureLabel(packagemanager);
            } else
            {
                processitem10.mInteresting = false;
            }
            j14 = mSequence;
            processitem10.mRunningSeq = j14;
            processitem10.mRunningProcessInfo = runningappprocessinfo;
            k1++;
        }
        int l1 = mRunningProcesses.size();
        for (int i2 = 0; i2 < l1;)
        {
            ProcessItem processitem8 = (ProcessItem)mRunningProcesses.valueAt(i2);
            if (processitem8.mRunningSeq == mSequence)
            {
                int i14 = processitem8.mRunningProcessInfo.importanceReasonPid;
                if (i14 != 0)
                {
                    ProcessItem processitem9 = (ProcessItem)mServiceProcessesByPid.get(i14);
                    if (processitem9 == null)
                        processitem9 = (ProcessItem)mRunningProcesses.get(i14);
                    if (processitem9 != null)
                        processitem9.mDependentProcesses.put(processitem8.mPid, processitem8);
                } else
                {
                    processitem8.mClient = null;
                }
                i2++;
            } else
            {
                flag = true;
                mRunningProcesses.remove(mRunningProcesses.keyAt(i2));
                l1--;
            }
        }

        int j2 = mInterestingProcesses.size();
        for (int k2 = 0; k2 < j2; k2++)
        {
            ProcessItem processitem7 = (ProcessItem)mInterestingProcesses.get(k2);
            if (!processitem7.mInteresting || mRunningProcesses.get(processitem7.mPid) == null)
            {
                flag = true;
                mInterestingProcesses.remove(k2);
                k2--;
                j2--;
            }
        }

        int l2 = mServiceProcessesByPid.size();
        for (int i3 = 0; i3 < l2; i3++)
        {
            ProcessItem processitem6 = (ProcessItem)mServiceProcessesByPid.valueAt(i3);
            if (((BaseItem) (processitem6)).mCurSeq == mSequence)
                flag |= processitem6.buildDependencyChain(context, packagemanager, mSequence);
        }

        ArrayList arraylist = null;
        int j3 = 0;
        do
        {
            int k3 = mServiceProcessesByName.size();
            if (j3 >= k3)
                break;
            HashMap hashmap = (HashMap)mServiceProcessesByName.valueAt(j3);
            Iterator iterator4 = hashmap.values().iterator();
label0:
            do
            {
                if (!iterator4.hasNext())
                    break;
                ProcessItem processitem5 = (ProcessItem)iterator4.next();
                if (((BaseItem) (processitem5)).mCurSeq == mSequence)
                {
                    processitem5.ensureLabel(packagemanager);
                    if (processitem5.mPid == 0)
                        processitem5.mDependentProcesses.clear();
                    Iterator iterator5 = processitem5.mServices.values().iterator();
                    do
                    {
                        do
                            if (!iterator5.hasNext())
                                continue label0;
                        while (((BaseItem) ((ServiceItem)iterator5.next())).mCurSeq == mSequence);
                        flag = true;
                        iterator5.remove();
                    } while (true);
                }
                flag = true;
                iterator4.remove();
                if (hashmap.size() == 0)
                {
                    if (arraylist == null)
                        arraylist = new ArrayList();
                    Integer integer = Integer.valueOf(mServiceProcessesByName.keyAt(j3));
                    arraylist.add(integer);
                }
                if (processitem5.mPid != 0)
                    mServiceProcessesByPid.remove(processitem5.mPid);
            } while (true);
            j3++;
        } while (true);
        if (arraylist != null)
        {
            int j13 = 0;
            do
            {
                int k13 = arraylist.size();
                if (j13 >= k13)
                    break;
                int l13 = ((Integer)arraylist.get(j13)).intValue();
                mServiceProcessesByName.remove(l13);
                j13++;
            } while (true);
        }
        if (flag)
        {
            ArrayList arraylist1 = new ArrayList();
            int l3 = 0;
            do
            {
                int i4 = mServiceProcessesByName.size();
                if (l3 >= i4)
                    break;
                ProcessItem processitem4;
label1:
                for (Iterator iterator2 = ((HashMap)mServiceProcessesByName.valueAt(l3)).values().iterator(); iterator2.hasNext(); arraylist1.add(processitem4))
                {
                    processitem4 = (ProcessItem)iterator2.next();
                    processitem4.mIsSystem = false;
                    processitem4.mIsStarted = true;
                    processitem4.mActiveSince = 0x7fffffffffffffffL;
                    Iterator iterator3 = processitem4.mServices.values().iterator();
                    do
                    {
                        if (!iterator3.hasNext())
                            continue label1;
                        ServiceItem serviceitem2 = (ServiceItem)iterator3.next();
                        if (serviceitem2.mServiceInfo != null && (1 & serviceitem2.mServiceInfo.applicationInfo.flags) != 0)
                            processitem4.mIsSystem = true;
                        if (serviceitem2.mRunningService != null && serviceitem2.mRunningService.clientLabel != 0)
                        {
                            processitem4.mIsStarted = false;
                            if (processitem4.mActiveSince > serviceitem2.mRunningService.activeSince)
                                processitem4.mActiveSince = serviceitem2.mRunningService.activeSince;
                        }
                    } while (true);
                }

                l3++;
            } while (true);
            Collections.sort(arraylist1, mServiceProcessComparator);
            ArrayList arraylist2 = new ArrayList();
            ArrayList arraylist3 = new ArrayList();
            mProcessItems.clear();
            int j4 = 0;
            do
            {
                int k4 = arraylist1.size();
                if (j4 >= k4)
                    break;
                ProcessItem processitem3 = (ProcessItem)arraylist1.get(j4);
                processitem3.mNeedDivider = false;
                int i12 = mProcessItems.size();
                processitem3.addDependentProcesses(arraylist2, mProcessItems);
                arraylist2.add(processitem3);
                if (processitem3.mPid > 0)
                    mProcessItems.add(processitem3);
                MergedItem mergeditem6 = null;
                boolean flag6 = false;
                Iterator iterator = processitem3.mServices.values().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    ServiceItem serviceitem1 = (ServiceItem)iterator.next();
                    serviceitem1.mNeedDivider = flag6;
                    flag6 = true;
                    arraylist2.add(serviceitem1);
                    if (serviceitem1.mMergedItem != null)
                    {
                        if (mergeditem6 != null)
                        {
                            MergedItem mergeditem7 = serviceitem1.mMergedItem;
                            if (mergeditem6 == mergeditem7);
                        }
                        mergeditem6 = serviceitem1.mMergedItem;
                    }
                } while (true);
                if (true || mergeditem6 == null || mergeditem6.mServices.size() != processitem3.mServices.size())
                {
                    int j12 = ((BaseItem) (processitem3)).mUserId;
                    mergeditem6 = new MergedItem(j12);
                    for (Iterator iterator1 = processitem3.mServices.values().iterator(); iterator1.hasNext();)
                    {
                        ServiceItem serviceitem = (ServiceItem)iterator1.next();
                        mergeditem6.mServices.add(serviceitem);
                        serviceitem.mMergedItem = mergeditem6;
                    }

                    mergeditem6.mProcess = processitem3;
                    mergeditem6.mOtherProcesses.clear();
                    int k12 = i12;
                    do
                    {
                        int i13 = -1 + mProcessItems.size();
                        if (k12 >= i13)
                            break;
                        mergeditem6.mOtherProcesses.add(mProcessItems.get(k12));
                        k12++;
                    } while (true);
                }
                mergeditem6.update(context, false);
                if (((BaseItem) (mergeditem6)).mUserId != mMyUserId)
                    addOtherUserItem(context, arraylist3, mOtherUserMergedItems, mergeditem6);
                else
                    arraylist3.add(mergeditem6);
                j4++;
            } while (true);
            int l4 = mInterestingProcesses.size();
            int i5 = 0;
            while (i5 < l4) 
            {
                ProcessItem processitem2 = (ProcessItem)mInterestingProcesses.get(i5);
                if (processitem2.mClient == null && processitem2.mServices.size() <= 0)
                {
                    if (processitem2.mMergedItem == null)
                    {
                        processitem2.mMergedItem = new MergedItem(((BaseItem) (processitem2)).mUserId);
                        processitem2.mMergedItem.mProcess = processitem2;
                    }
                    processitem2.mMergedItem.update(context, false);
                    if (((BaseItem) (processitem2.mMergedItem)).mUserId != mMyUserId)
                        addOtherUserItem(context, arraylist3, mOtherUserMergedItems, processitem2.mMergedItem);
                    else
                        arraylist3.add(0, processitem2.mMergedItem);
                    mProcessItems.add(processitem2);
                }
                i5++;
            }
            int j5 = mOtherUserMergedItems.size();
            for (int k5 = 0; k5 < j5; k5++)
            {
                MergedItem mergeditem5 = (MergedItem)mOtherUserMergedItems.valueAt(k5);
                if (((BaseItem) (mergeditem5)).mCurSeq == mSequence)
                    mergeditem5.update(context, false);
            }

            synchronized (mLock)
            {
                mItems = arraylist2;
                mMergedItems = arraylist3;
            }
        }
        mAllProcessItems.clear();
        mAllProcessItems.addAll(mProcessItems);
        l5 = 0;
        i6 = 0;
        j6 = 0;
        int k6 = mRunningProcesses.size();
        int l6 = 0;
        while (l6 < k6) 
        {
            ProcessItem processitem1 = (ProcessItem)mRunningProcesses.valueAt(l6);
            if (((BaseItem) (processitem1)).mCurSeq != mSequence)
            {
                if (processitem1.mRunningProcessInfo.importance >= 400)
                {
                    l5++;
                    mAllProcessItems.add(processitem1);
                } else
                if (processitem1.mRunningProcessInfo.importance <= 200)
                {
                    i6++;
                    mAllProcessItems.add(processitem1);
                } else
                {
                    Log.i("RunningState", (new StringBuilder()).append("Unknown non-service process: ").append(processitem1.mProcessName).append(" #").append(processitem1.mPid).toString());
                }
            } else
            {
                j6++;
            }
            l6++;
        }
        break MISSING_BLOCK_LABEL_2694;
        if (true) goto _L12; else goto _L11
_L11:
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        long l7;
        long l8;
        long l9;
        ArrayList arraylist4;
        boolean flag1;
        int i10;
        int j10;
        ArrayList arraylist6;
        ProcessItem processitem;
        MergedItem mergeditem3;
        l7 = 0L;
        l8 = 0L;
        l9 = 0L;
        arraylist4 = null;
        flag1 = false;
        int j9;
        int ai[];
        int k9;
        long al[];
        long al1[];
        MemInfoReader meminforeader;
        long l10;
        float f;
        long l11;
        float f1;
        int k10;
        int i11;
        boolean flag3;
        int j11;
        int k11;
        MergedItem mergeditem4;
        try
        {
            j9 = mAllProcessItems.size();
            ai = new int[j9];
        }
        catch (RemoteException remoteexception)
        {
            break MISSING_BLOCK_LABEL_3219;
        }
        k9 = 0;
_L14:
        if (k9 >= j9)
            break; /* Loop/switch isn't completed */
        ai[k9] = ((ProcessItem)mAllProcessItems.get(k9)).mPid;
        k9++;
        if (true) goto _L14; else goto _L13
_L13:
        al = ActivityManagerNative.getDefault().getProcessPss(ai);
        al1 = ActivityManagerNative.getDefault().getProcessPswap(ai);
        meminforeader = new MemInfoReader();
        meminforeader.readMemInfo();
        l10 = meminforeader.getTotalSize();
        f = l10;
        l11 = Process.getZramExtraTotalSize();
        f1 = f / (float)(l11 + l10);
        i10 = 0;
        j10 = 0;
        arraylist6 = null;
_L29:
        k10 = ai.length;
        if (j10 >= k10) goto _L16; else goto _L15
_L15:
        processitem = (ProcessItem)mAllProcessItems.get(j10);
        flag |= processitem.updateSize(context, (long)(f1 * (float)(al[j10] + al1[j10])), mSequence);
        if (((BaseItem) (processitem)).mCurSeq != mSequence)
            break MISSING_BLOCK_LABEL_2921;
        l9 += ((BaseItem) (processitem)).mSize;
        arraylist4 = arraylist6;
        break MISSING_BLOCK_LABEL_3709;
        if (processitem.mRunningProcessInfo.importance < 400) goto _L18; else goto _L17
_L17:
        l7 += ((BaseItem) (processitem)).mSize;
        if (arraylist6 == null) goto _L20; else goto _L19
_L19:
        i11 = ((BaseItem) (processitem)).mUserId;
        mergeditem3 = new MergedItem(i11);
        processitem.mMergedItem = mergeditem3;
        processitem.mMergedItem.mProcess = processitem;
        if (((BaseItem) (mergeditem3)).mUserId != mMyUserId)
            flag3 = true;
        else
            flag3 = false;
        flag1 |= flag3;
        arraylist6.add(mergeditem3);
        arraylist4 = arraylist6;
_L25:
        mergeditem3.update(context, true);
        mergeditem3.updateSize(context);
        i10++;
        break MISSING_BLOCK_LABEL_3709;
_L20:
        if (i10 < mBackgroundItems.size() && ((MergedItem)mBackgroundItems.get(i10)).mProcess == processitem) goto _L22; else goto _L21
_L21:
        arraylist4 = new ArrayList(l5);
        j11 = 0;
_L24:
        if (j11 >= i10)
            break; /* Loop/switch isn't completed */
        mergeditem4 = (MergedItem)mBackgroundItems.get(j11);
        ArrayList arraylist5;
        int i7;
        int j7;
        Object obj1;
        Exception exception1;
        int k7;
        int i8;
        int j8;
        int k8;
        MergedItem mergeditem;
        MergedItem mergeditem1;
        SparseArray sparsearray;
        int i9;
        MergedItem mergeditem2;
        boolean flag2;
        RemoteException remoteexception1;
        long l12;
        boolean flag4;
        boolean flag5;
        if (((BaseItem) (mergeditem4)).mUserId != mMyUserId)
            flag5 = true;
        else
            flag5 = false;
        flag1 |= flag5;
        arraylist4.add(mergeditem4);
        j11++;
        if (true) goto _L24; else goto _L23
_L23:
        k11 = ((BaseItem) (processitem)).mUserId;
        mergeditem3 = new MergedItem(k11);
        processitem.mMergedItem = mergeditem3;
        processitem.mMergedItem.mProcess = processitem;
        if (((BaseItem) (mergeditem3)).mUserId != mMyUserId)
            flag4 = true;
        else
            flag4 = false;
        flag1 |= flag4;
        arraylist4.add(mergeditem3);
          goto _L25
_L22:
        mergeditem3 = (MergedItem)mBackgroundItems.get(i10);
        arraylist4 = arraylist6;
          goto _L25
_L18:
        if (processitem.mRunningProcessInfo.importance > 200)
            break MISSING_BLOCK_LABEL_3705;
        l12 = ((BaseItem) (processitem)).mSize;
        l8 += l12;
        arraylist4 = arraylist6;
        break MISSING_BLOCK_LABEL_3709;
_L16:
        arraylist4 = arraylist6;
_L27:
        if (arraylist4 == null && mBackgroundItems.size() > l5)
        {
            arraylist4 = new ArrayList(l5);
            i9 = 0;
            while (i9 < l5) 
            {
                mergeditem2 = (MergedItem)mBackgroundItems.get(i9);
                if (((BaseItem) (mergeditem2)).mUserId != mMyUserId)
                    flag2 = true;
                else
                    flag2 = false;
                flag1 |= flag2;
                arraylist4.add(mergeditem2);
                i9++;
            }
        }
        arraylist5 = null;
        if (arraylist4 != null)
            if (!flag1)
            {
                arraylist5 = arraylist4;
            } else
            {
                arraylist5 = new ArrayList();
                k7 = arraylist4.size();
                i8 = 0;
                while (i8 < k7) 
                {
                    mergeditem1 = (MergedItem)arraylist4.get(i8);
                    if (((BaseItem) (mergeditem1)).mUserId != mMyUserId)
                    {
                        sparsearray = mOtherUserBackgroundItems;
                        addOtherUserItem(context, arraylist5, sparsearray, mergeditem1);
                    } else
                    {
                        arraylist5.add(mergeditem1);
                    }
                    i8++;
                }
                j8 = mOtherUserBackgroundItems.size();
                k8 = 0;
                while (k8 < j8) 
                {
                    mergeditem = (MergedItem)mOtherUserBackgroundItems.valueAt(k8);
                    if (((BaseItem) (mergeditem)).mCurSeq == mSequence)
                    {
                        mergeditem.update(context, true);
                        mergeditem.updateSize(context);
                    }
                    k8++;
                }
            }
        i7 = 0;
        do
        {
            j7 = mMergedItems.size();
            if (i7 >= j7)
                break;
            ((MergedItem)mMergedItems.get(i7)).updateSize(context);
            i7++;
        } while (true);
        obj1 = mLock;
        obj1;
        JVM INSTR monitorenter ;
        mNumBackgroundProcesses = l5;
        mNumForegroundProcesses = i6;
        mNumServiceProcesses = j6;
        mBackgroundProcessMemory = l7;
        mForegroundProcessMemory = l8;
        mServiceProcessMemory = l9;
        if (arraylist4 == null)
            break MISSING_BLOCK_LABEL_3663;
        mBackgroundItems = arraylist4;
        mUserBackgroundItems = arraylist5;
        if (mWatchingBackgroundItems)
            flag = true;
        if (!mHaveData)
        {
            mHaveData = true;
            mLock.notifyAll();
        }
        obj1;
        JVM INSTR monitorexit ;
        return flag;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
        remoteexception1;
        arraylist4 = arraylist6;
        if (true) goto _L27; else goto _L26
_L26:
        arraylist4 = arraylist6;
        j10++;
        arraylist6 = arraylist4;
        if (true) goto _L29; else goto _L28
_L28:
        if (true) goto _L31; else goto _L30
_L30:
    }

    ArrayList getCurrentBackgroundItems()
    {
        ArrayList arraylist;
        synchronized (mLock)
        {
            arraylist = mUserBackgroundItems;
        }
        return arraylist;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    ArrayList getCurrentItems()
    {
        ArrayList arraylist;
        synchronized (mLock)
        {
            arraylist = mItems;
        }
        return arraylist;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    ArrayList getCurrentMergedItems()
    {
        ArrayList arraylist;
        synchronized (mLock)
        {
            arraylist = mMergedItems;
        }
        return arraylist;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    boolean hasData()
    {
        boolean flag;
        synchronized (mLock)
        {
            flag = mHaveData;
        }
        return flag;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void pause()
    {
        synchronized (mLock)
        {
            mResumed = false;
            mRefreshUiListener = null;
            mHandler.removeMessages(4);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void resume(OnRefreshUiListener onrefreshuilistener)
    {
        synchronized (mLock)
        {
            mResumed = true;
            mRefreshUiListener = onrefreshuilistener;
            if (mInterestingConfigChanges.applyNewConfig(mApplicationContext.getResources()))
            {
                mHaveData = false;
                mBackgroundHandler.removeMessages(1);
                mBackgroundHandler.removeMessages(2);
                mBackgroundHandler.sendEmptyMessage(1);
            }
            if (!mBackgroundHandler.hasMessages(2))
                mBackgroundHandler.sendEmptyMessage(2);
            mHandler.sendEmptyMessage(4);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void setWatchingBackgroundItems(boolean flag)
    {
        synchronized (mLock)
        {
            mWatchingBackgroundItems = flag;
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void updateNow()
    {
        synchronized (mLock)
        {
            mBackgroundHandler.removeMessages(2);
            mBackgroundHandler.sendEmptyMessage(2);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void waitForData()
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
_L2:
        boolean flag = mHaveData;
        if (flag)
            break; /* Loop/switch isn't completed */
        try
        {
            mLock.wait(0L);
        }
        catch (InterruptedException interruptedexception) { }
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



}
