// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.app.ActivityManager;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

// Referenced classes of package com.android.systemui.recent:
//            RecentsPanelView, TaskDescription

public class RecentTasksLoader
    implements android.view.View.OnTouchListener
{
    private static final class State extends Enum
    {

        private static final State $VALUES[];
        public static final State CANCELLED;
        public static final State LOADED;
        public static final State LOADING;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(com/android/systemui/recent/RecentTasksLoader$State, s);
        }

        public static State[] values()
        {
            return (State[])$VALUES.clone();
        }

        static 
        {
            LOADING = new State("LOADING", 0);
            LOADED = new State("LOADED", 1);
            CANCELLED = new State("CANCELLED", 2);
            State astate[] = new State[3];
            astate[0] = LOADING;
            astate[1] = LOADED;
            astate[2] = CANCELLED;
            $VALUES = astate;
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    static final boolean DEBUG = false;
    private static final int DISPLAY_TASKS = 20;
    private static final int MAX_TASKS = 21;
    static final String TAG = "RecentTasksLoader";
    private static RecentTasksLoader sInstance;
    boolean mCancelPreloadingFirstTask;
    private Context mContext;
    private Bitmap mDefaultIconBackground;
    private Bitmap mDefaultThumbnailBackground;
    private boolean mFirstScreenful;
    private TaskDescription mFirstTask;
    private boolean mFirstTaskLoaded;
    private Object mFirstTaskLock;
    private Handler mHandler;
    private int mIconDpi;
    private ArrayList mLoadedTasks;
    private int mNumTasksInFirstScreenful;
    Runnable mPreloadTasksRunnable;
    boolean mPreloadingFirstTask;
    private RecentsPanelView mRecentsPanel;
    private State mState;
    private AsyncTask mTaskLoader;
    private AsyncTask mThumbnailLoader;

    private RecentTasksLoader(Context context)
    {
        mFirstTaskLock = new Object();
        mNumTasksInFirstScreenful = 0x7fffffff;
        mState = State.CANCELLED;
        mPreloadTasksRunnable = new Runnable() {

            final RecentTasksLoader this$0;

            public void run()
            {
                loadTasksInBackground();
            }

            
            {
                this$0 = RecentTasksLoader.this;
                super();
            }
        }
;
        mContext = context;
        mHandler = new Handler();
        Resources resources = context.getResources();
        if (resources.getBoolean(0x7f0a0000))
            mIconDpi = ((ActivityManager)context.getSystemService("activity")).getLauncherLargeIconDensity();
        else
            mIconDpi = resources.getDisplayMetrics().densityDpi;
        int i = (resources.getDimensionPixelSize(0x1050000) * mIconDpi) / resources.getDisplayMetrics().densityDpi;
        mDefaultIconBackground = Bitmap.createBitmap(i, i, android.graphics.Bitmap.Config.ARGB_8888);
        int j = resources.getDimensionPixelSize(0x1050002);
        int k = resources.getDimensionPixelSize(0x1050001);
        int l = resources.getColor(0x7f02025d);
        mDefaultThumbnailBackground = Bitmap.createBitmap(j, k, android.graphics.Bitmap.Config.ARGB_8888);
        (new Canvas(mDefaultThumbnailBackground)).drawColor(l);
    }

    private void cancelLoadingThumbnailsAndIcons()
    {
        if (mTaskLoader != null)
        {
            mTaskLoader.cancel(false);
            mTaskLoader = null;
        }
        if (mThumbnailLoader != null)
        {
            mThumbnailLoader.cancel(false);
            mThumbnailLoader = null;
        }
        mLoadedTasks = null;
        if (mRecentsPanel != null)
            mRecentsPanel.onTaskLoadingCancelled();
        mFirstScreenful = false;
        mState = State.CANCELLED;
    }

    private void clearFirstTask()
    {
        synchronized (mFirstTaskLock)
        {
            mFirstTask = null;
            mFirstTaskLoaded = false;
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private Drawable getFullResIcon(ResolveInfo resolveinfo, PackageManager packagemanager)
    {
        Resources resources1 = packagemanager.getResourcesForApplication(resolveinfo.activityInfo.applicationInfo);
        Resources resources = resources1;
_L2:
        if (resources != null)
        {
            int i = resolveinfo.activityInfo.getIconResource();
            if (i != 0)
                return getFullResIcon(resources, i);
        }
        break; /* Loop/switch isn't completed */
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        resources = null;
        if (true) goto _L2; else goto _L1
_L1:
        return getFullResDefaultActivityIcon();
    }

    public static RecentTasksLoader getInstance(Context context)
    {
        if (sInstance == null)
            sInstance = new RecentTasksLoader(context);
        return sInstance;
    }

    private boolean isCurrentHomeActivity(ComponentName componentname, ActivityInfo activityinfo)
    {
        if (activityinfo == null)
        {
            PackageManager packagemanager = mContext.getPackageManager();
            activityinfo = (new Intent("android.intent.action.MAIN")).addCategory("android.intent.category.HOME").resolveActivityInfo(packagemanager, 0);
        }
        boolean flag = false;
        if (activityinfo != null)
        {
            boolean flag1 = activityinfo.packageName.equals(componentname.getPackageName());
            flag = false;
            if (flag1)
            {
                boolean flag2 = activityinfo.name.equals(componentname.getClassName());
                flag = false;
                if (flag2)
                    flag = true;
            }
        }
        return flag;
    }

    private void loadThumbnailsAndIconsInBackground(final BlockingQueue tasksWaitingForThumbnails)
    {
        mThumbnailLoader = new AsyncTask() {

            final RecentTasksLoader this$0;
            final BlockingQueue val$tasksWaitingForThumbnails;

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            protected transient Void doInBackground(Void avoid[])
            {
                int i;
                i = Process.getThreadPriority(Process.myTid());
                Process.setThreadPriority(10);
_L5:
                if (!isCancelled()) goto _L2; else goto _L1
_L1:
                Process.setThreadPriority(i);
                return null;
_L2:
                for (TaskDescription taskdescription = null; taskdescription == null;)
                    try
                    {
                        taskdescription = (TaskDescription)tasksWaitingForThumbnails.take();
                    }
                    catch (InterruptedException interruptedexception) { }

                if (!taskdescription.isNull())
                    break; /* Loop/switch isn't completed */
                publishProgress(new TaskDescription[] {
                    taskdescription
                });
                if (true) goto _L1; else goto _L3
_L3:
                loadThumbnailAndIcon(taskdescription);
                publishProgress(new TaskDescription[] {
                    taskdescription
                });
                if (true) goto _L5; else goto _L4
_L4:
            }

            protected transient void onProgressUpdate(TaskDescription ataskdescription[])
            {
                if (!isCancelled())
                {
                    TaskDescription taskdescription = ataskdescription[0];
                    if (taskdescription.isNull())
                        mState = State.LOADED;
                    else
                    if (mRecentsPanel != null)
                    {
                        mRecentsPanel.onTaskThumbnailLoaded(taskdescription);
                        return;
                    }
                }
            }

            protected volatile void onProgressUpdate(Object aobj[])
            {
                onProgressUpdate((TaskDescription[])aobj);
            }

            
            {
                this$0 = RecentTasksLoader.this;
                tasksWaitingForThumbnails = blockingqueue;
                super();
            }
        }
;
        mThumbnailLoader.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public void cancelLoadingThumbnailsAndIcons(RecentsPanelView recentspanelview)
    {
        if (mRecentsPanel == recentspanelview)
            cancelLoadingThumbnailsAndIcons();
    }

    public void cancelPreloadingFirstTask()
    {
        Object obj = mFirstTaskLock;
        obj;
        JVM INSTR monitorenter ;
        if (!mPreloadingFirstTask)
            break MISSING_BLOCK_LABEL_22;
        mCancelPreloadingFirstTask = true;
_L2:
        return;
        clearFirstTask();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void cancelPreloadingRecentTasksList()
    {
        cancelLoadingThumbnailsAndIcons();
        mHandler.removeCallbacks(mPreloadTasksRunnable);
    }

    TaskDescription createTaskDescription(int i, int j, Intent intent, ComponentName componentname, CharSequence charsequence)
    {
        Intent intent1 = new Intent(intent);
        if (componentname != null)
            intent1.setComponent(componentname);
        PackageManager packagemanager = mContext.getPackageManager();
        intent1.setFlags(0x10000000 | 0xffdfffff & intent1.getFlags());
        ResolveInfo resolveinfo = packagemanager.resolveActivity(intent1, 0);
        if (resolveinfo != null)
        {
            ActivityInfo activityinfo = resolveinfo.activityInfo;
            String s = activityinfo.loadLabel(packagemanager).toString();
            if (s != null && s.length() > 0)
            {
                TaskDescription taskdescription = new TaskDescription(i, j, resolveinfo, intent, activityinfo.packageName, charsequence);
                taskdescription.setLabel(s);
                return taskdescription;
            }
        }
        return null;
    }

    public Bitmap getDefaultIcon()
    {
        return mDefaultIconBackground;
    }

    public Bitmap getDefaultThumbnail()
    {
        return mDefaultThumbnailBackground;
    }

    public TaskDescription getFirstTask()
    {
_L2:
label0:
        {
            TaskDescription taskdescription1;
            synchronized (mFirstTaskLock)
            {
                if (!mFirstTaskLoaded)
                    break label0;
                taskdescription1 = mFirstTask;
            }
            return taskdescription1;
        }
        TaskDescription taskdescription;
        if (mFirstTaskLoaded || mPreloadingFirstTask)
            break MISSING_BLOCK_LABEL_68;
        mFirstTask = loadFirstTask();
        mFirstTaskLoaded = true;
        taskdescription = mFirstTask;
        obj;
        JVM INSTR monitorexit ;
        return taskdescription;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        obj;
        JVM INSTR monitorexit ;
        try
        {
            Thread.sleep(3L);
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
    }

    Drawable getFullResDefaultActivityIcon()
    {
        return getFullResIcon(Resources.getSystem(), 0x10d0000);
    }

    Drawable getFullResIcon(Resources resources, int i)
    {
        Drawable drawable;
        try
        {
            drawable = resources.getDrawableForDensity(i, mIconDpi);
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            return getFullResDefaultActivityIcon();
        }
        return drawable;
    }

    public ArrayList getLoadedTasks()
    {
        return mLoadedTasks;
    }

    public boolean isFirstScreenful()
    {
        return mFirstScreenful;
    }

    public TaskDescription loadFirstTask()
    {
        List list = ((ActivityManager)mContext.getSystemService("activity")).getRecentTasksForUser(1, 2, UserHandle.CURRENT.getIdentifier());
        if (list.size() > 0)
        {
            android.app.ActivityManager.RecentTaskInfo recenttaskinfo = (android.app.ActivityManager.RecentTaskInfo)list.get(0);
            Intent intent = new Intent(recenttaskinfo.baseIntent);
            if (recenttaskinfo.origActivity != null)
                intent.setComponent(recenttaskinfo.origActivity);
            if (!isCurrentHomeActivity(intent.getComponent(), null) && !intent.getComponent().getPackageName().equals(mContext.getPackageName()))
            {
                TaskDescription taskdescription = createTaskDescription(recenttaskinfo.id, recenttaskinfo.persistentId, recenttaskinfo.baseIntent, recenttaskinfo.origActivity, recenttaskinfo.description);
                if (taskdescription != null)
                    loadThumbnailAndIcon(taskdescription);
                return taskdescription;
            }
        }
        return null;
    }

    public void loadTasksInBackground()
    {
        loadTasksInBackground(false);
    }

    public void loadTasksInBackground(boolean flag)
    {
        if (mState != State.CANCELLED)
        {
            return;
        } else
        {
            mState = State.LOADING;
            mFirstScreenful = true;
            final LinkedBlockingQueue tasksWaitingForThumbnails = new LinkedBlockingQueue();
            mTaskLoader = new AsyncTask() {

                final RecentTasksLoader this$0;
                final LinkedBlockingQueue val$tasksWaitingForThumbnails;

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected transient Void doInBackground(Void avoid[])
                {
                    int i;
                    List list;
                    int j;
                    ActivityInfo activityinfo;
                    boolean flag1;
                    ArrayList arraylist;
                    int k;
                    int l;
                    i = Process.getThreadPriority(Process.myTid());
                    Process.setThreadPriority(10);
                    PackageManager packagemanager = mContext.getPackageManager();
                    list = ((ActivityManager)mContext.getSystemService("activity")).getRecentTasks(21, 2);
                    j = list.size();
                    activityinfo = (new Intent("android.intent.action.MAIN")).addCategory("android.intent.category.HOME").resolveActivityInfo(packagemanager, 0);
                    flag1 = true;
                    arraylist = new ArrayList();
                    k = 0;
                    l = 0;
_L4:
                    if (k < j && l < 21 && !isCancelled()) goto _L2; else goto _L1
_L1:
                    if (!isCancelled())
                    {
                        publishProgress(new ArrayList[] {
                            arraylist
                        });
                        if (flag1)
                        {
                            ArrayList aarraylist[] = new ArrayList[1];
                            aarraylist[0] = new ArrayList();
                            publishProgress(aarraylist);
                        }
                    }
_L8:
                    tasksWaitingForThumbnails.put(new TaskDescription());
                    Process.setThreadPriority(i);
                    return null;
_L2:
                    android.app.ActivityManager.RecentTaskInfo recenttaskinfo;
                    Intent intent;
                    recenttaskinfo = (android.app.ActivityManager.RecentTaskInfo)list.get(k);
                    intent = new Intent(recenttaskinfo.baseIntent);
                    if (recenttaskinfo.origActivity != null)
                        intent.setComponent(recenttaskinfo.origActivity);
                      goto _L3
_L6:
                    k++;
                      goto _L4
_L3:
                    if (isCurrentHomeActivity(intent.getComponent(), activityinfo) || intent.getComponent().getPackageName().equals(mContext.getPackageName())) goto _L6; else goto _L5
_L5:
                    TaskDescription taskdescription = createTaskDescription(recenttaskinfo.id, recenttaskinfo.persistentId, recenttaskinfo.baseIntent, recenttaskinfo.origActivity, recenttaskinfo.description);
                    if (taskdescription == null) goto _L6; else goto _L7
_L7:
                    tasksWaitingForThumbnails.put(taskdescription);
                    arraylist.add(taskdescription);
                    if (flag1 && arraylist.size() == mNumTasksInFirstScreenful)
                    {
                        publishProgress(new ArrayList[] {
                            arraylist
                        });
                        arraylist = new ArrayList();
                        flag1 = false;
                    }
                    l++;
                      goto _L6
                    InterruptedException interruptedexception;
                    interruptedexception;
                      goto _L8
                    InterruptedException interruptedexception1;
                    interruptedexception1;
                      goto _L7
                }

                protected volatile void onProgressUpdate(Object aobj[])
                {
                    onProgressUpdate((ArrayList[])aobj);
                }

                protected transient void onProgressUpdate(ArrayList aarraylist[])
                {
                    if (!isCancelled())
                    {
                        ArrayList arraylist = aarraylist[0];
                        if (mRecentsPanel != null)
                            mRecentsPanel.onTasksLoaded(arraylist, mFirstScreenful);
                        if (mLoadedTasks == null)
                            mLoadedTasks = new ArrayList();
                        mLoadedTasks.addAll(arraylist);
                        mFirstScreenful = false;
                    }
                }

            
            {
                this$0 = RecentTasksLoader.this;
                tasksWaitingForThumbnails = linkedblockingqueue;
                super();
            }
            }
;
            mTaskLoader.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
            loadThumbnailsAndIconsInBackground(tasksWaitingForThumbnails);
            return;
        }
    }

    void loadThumbnailAndIcon(TaskDescription taskdescription)
    {
        PackageManager packagemanager;
        Bitmap bitmap;
        ActivityManager activitymanager = (ActivityManager)mContext.getSystemService("activity");
        packagemanager = mContext.getPackageManager();
        bitmap = activitymanager.getTaskTopThumbnail(taskdescription.persistentTaskId);
        Drawable drawable = getFullResIcon(taskdescription.resolveInfo, packagemanager);
        taskdescription;
        JVM INSTR monitorenter ;
        if (bitmap == null) goto _L2; else goto _L1
_L1:
        taskdescription.setThumbnail(bitmap);
_L4:
        if (drawable == null)
            break MISSING_BLOCK_LABEL_66;
        taskdescription.setIcon(drawable);
        taskdescription.setLoaded(true);
        taskdescription;
        JVM INSTR monitorexit ;
        return;
_L2:
        taskdescription.setThumbnail(mDefaultThumbnailBackground);
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        taskdescription;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        int i = 0xff & motionevent.getAction();
        if (i == 0)
            preloadRecentTasksList();
        else
        if (i == 3)
            cancelPreloadingRecentTasksList();
        else
        if (i == 1)
        {
            mHandler.removeCallbacks(mPreloadTasksRunnable);
            if (!view.isPressed())
                cancelLoadingThumbnailsAndIcons();
        }
        return false;
    }

    public void preloadFirstTask()
    {
        Thread thread = new Thread() {

            final RecentTasksLoader this$0;

            public void run()
            {
                TaskDescription taskdescription = loadFirstTask();
                Object obj1 = mFirstTaskLock;
                obj1;
                JVM INSTR monitorenter ;
                if (!mCancelPreloadingFirstTask)
                    break MISSING_BLOCK_LABEL_46;
                clearFirstTask();
_L2:
                mPreloadingFirstTask = false;
                return;
                mFirstTask = taskdescription;
                mFirstTaskLoaded = true;
                if (true) goto _L2; else goto _L1
_L1:
                Exception exception1;
                exception1;
                obj1;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            
            {
                this$0 = RecentTasksLoader.this;
                super();
            }
        }
;
        synchronized (mFirstTaskLock)
        {
            if (!mPreloadingFirstTask)
            {
                clearFirstTask();
                mPreloadingFirstTask = true;
                thread.start();
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void preloadRecentTasksList()
    {
        mHandler.post(mPreloadTasksRunnable);
    }

    public void remove(TaskDescription taskdescription)
    {
        mLoadedTasks.remove(taskdescription);
    }

    public void setRecentsPanel(RecentsPanelView recentspanelview, RecentsPanelView recentspanelview1)
    {
        if (recentspanelview != null || mRecentsPanel == recentspanelview1)
        {
            mRecentsPanel = recentspanelview;
            if (mRecentsPanel != null)
                mNumTasksInFirstScreenful = mRecentsPanel.numItemsInOneScreenful();
        }
    }




/*
    static State access$1002(RecentTasksLoader recenttasksloader, State state)
    {
        recenttasksloader.mState = state;
        return state;
    }

*/


/*
    static TaskDescription access$202(RecentTasksLoader recenttasksloader, TaskDescription taskdescription)
    {
        recenttasksloader.mFirstTask = taskdescription;
        return taskdescription;
    }

*/


/*
    static boolean access$302(RecentTasksLoader recenttasksloader, boolean flag)
    {
        recenttasksloader.mFirstTaskLoaded = flag;
        return flag;
    }

*/




/*
    static boolean access$502(RecentTasksLoader recenttasksloader, boolean flag)
    {
        recenttasksloader.mFirstScreenful = flag;
        return flag;
    }

*/



/*
    static ArrayList access$602(RecentTasksLoader recenttasksloader, ArrayList arraylist)
    {
        recenttasksloader.mLoadedTasks = arraylist;
        return arraylist;
    }

*/



}
