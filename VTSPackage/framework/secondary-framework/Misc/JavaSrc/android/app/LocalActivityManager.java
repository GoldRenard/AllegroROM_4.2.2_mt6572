// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ComponentInfo;
import android.os.Binder;
import android.os.Bundle;
import android.util.Log;
import android.view.Window;
import java.util.*;

// Referenced classes of package android.app:
//            ActivityThread, Activity

public class LocalActivityManager
{
    private static class LocalActivityRecord extends Binder
    {

        Activity activity;
        ActivityInfo activityInfo;
        int curState;
        final String id;
        Bundle instanceState;
        Intent intent;
        Window window;

        LocalActivityRecord(String s, Intent intent1)
        {
            curState = 0;
            id = s;
            intent = intent1;
        }
    }


    static final int CREATED = 2;
    static final int DESTROYED = 5;
    static final int INITIALIZING = 1;
    static final int RESTORED = 0;
    static final int RESUMED = 4;
    static final int STARTED = 3;
    private static final String TAG = "LocalActivityManager";
    private static final boolean localLOGV;
    private final Map mActivities = new HashMap();
    private final ArrayList mActivityArray = new ArrayList();
    private final ActivityThread mActivityThread = ActivityThread.currentActivityThread();
    private int mCurState;
    private boolean mFinishing;
    private final Activity mParent;
    private LocalActivityRecord mResumed;
    private boolean mSingleMode;

    public LocalActivityManager(Activity activity, boolean flag)
    {
        mCurState = 1;
        mParent = activity;
        mSingleMode = flag;
    }

    private void moveToState(LocalActivityRecord localactivityrecord, int i)
    {
label0:
        {
            if (localactivityrecord.curState != 0 && localactivityrecord.curState != 5)
                if (localactivityrecord.curState == 1)
                {
                    HashMap hashmap = mParent.getLastNonConfigurationChildInstances();
                    Object obj = null;
                    if (hashmap != null)
                        obj = hashmap.get(localactivityrecord.id);
                    Activity.NonConfigurationInstances nonconfigurationinstances = null;
                    if (obj != null)
                    {
                        nonconfigurationinstances = new Activity.NonConfigurationInstances();
                        nonconfigurationinstances.activity = obj;
                    }
                    if (localactivityrecord.activityInfo == null)
                        localactivityrecord.activityInfo = mActivityThread.resolveActivityInfo(localactivityrecord.intent);
                    localactivityrecord.activity = mActivityThread.startActivityNow(mParent, localactivityrecord.id, localactivityrecord.intent, localactivityrecord.activityInfo, localactivityrecord, localactivityrecord.instanceState, nonconfigurationinstances);
                    if (localactivityrecord.activity != null)
                    {
                        localactivityrecord.window = localactivityrecord.activity.getWindow();
                        localactivityrecord.instanceState = null;
                        localactivityrecord.curState = 3;
                        if (i == 4)
                        {
                            mActivityThread.performResumeActivity(localactivityrecord, true);
                            localactivityrecord.curState = 4;
                            return;
                        }
                    }
                } else
                {
                    switch (localactivityrecord.curState)
                    {
                    default:
                        break label0;

                    case 4: // '\004'
                        if (i == 3)
                        {
                            performPause(localactivityrecord, mFinishing);
                            localactivityrecord.curState = 3;
                        }
                        if (i == 2)
                        {
                            performPause(localactivityrecord, mFinishing);
                            mActivityThread.performStopActivity(localactivityrecord, false);
                            localactivityrecord.curState = 2;
                            return;
                        }
                        break;

                    case 3: // '\003'
                        if (i == 4)
                        {
                            mActivityThread.performResumeActivity(localactivityrecord, true);
                            localactivityrecord.instanceState = null;
                            localactivityrecord.curState = 4;
                        }
                        if (i == 2)
                        {
                            mActivityThread.performStopActivity(localactivityrecord, false);
                            localactivityrecord.curState = 2;
                            return;
                        }
                        break;

                    case 2: // '\002'
                        if (i == 3)
                        {
                            mActivityThread.performRestartActivity(localactivityrecord);
                            localactivityrecord.curState = 3;
                        }
                        if (i == 4)
                        {
                            mActivityThread.performRestartActivity(localactivityrecord);
                            mActivityThread.performResumeActivity(localactivityrecord, true);
                            localactivityrecord.curState = 4;
                            return;
                        }
                        break;
                    }
                }
            return;
        }
    }

    private Window performDestroy(LocalActivityRecord localactivityrecord, boolean flag)
    {
        Window window = localactivityrecord.window;
        if (localactivityrecord.curState == 4 && !flag)
            performPause(localactivityrecord, flag);
        mActivityThread.performDestroyActivity(localactivityrecord, flag);
        localactivityrecord.activity = null;
        localactivityrecord.window = null;
        if (flag)
            localactivityrecord.instanceState = null;
        localactivityrecord.curState = 5;
        return window;
    }

    private void performPause(LocalActivityRecord localactivityrecord, boolean flag)
    {
        boolean flag1;
        if (localactivityrecord.instanceState == null)
            flag1 = true;
        else
            flag1 = false;
        Bundle bundle = mActivityThread.performPauseActivity(localactivityrecord, flag, flag1);
        if (flag1)
            localactivityrecord.instanceState = bundle;
    }

    public Window destroyActivity(String s, boolean flag)
    {
        LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivities.get(s);
        Window window = null;
        if (localactivityrecord != null)
        {
            window = performDestroy(localactivityrecord, flag);
            if (flag)
            {
                mActivities.remove(s);
                mActivityArray.remove(localactivityrecord);
            }
        }
        return window;
    }

    public void dispatchCreate(Bundle bundle)
    {
        if (bundle == null) goto _L2; else goto _L1
_L1:
        Iterator iterator = bundle.keySet().iterator();
_L3:
        String s;
        if (!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        s = (String)iterator.next();
        Bundle bundle1;
        LocalActivityRecord localactivityrecord;
        bundle1 = bundle.getBundle(s);
        localactivityrecord = (LocalActivityRecord)mActivities.get(s);
        if (localactivityrecord != null)
        {
            try
            {
                localactivityrecord.instanceState = bundle1;
            }
            catch (Exception exception)
            {
                Log.e("LocalActivityManager", "Exception thrown when restoring LocalActivityManager state", exception);
            }
            continue; /* Loop/switch isn't completed */
        }
        LocalActivityRecord localactivityrecord1 = new LocalActivityRecord(s, null);
        localactivityrecord1.instanceState = bundle1;
        mActivities.put(s, localactivityrecord1);
        mActivityArray.add(localactivityrecord1);
        if (true) goto _L3; else goto _L2
_L2:
        mCurState = 2;
        return;
    }

    public void dispatchDestroy(boolean flag)
    {
        int i = mActivityArray.size();
        for (int j = 0; j < i; j++)
        {
            LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivityArray.get(j);
            mActivityThread.performDestroyActivity(localactivityrecord, flag);
        }

        mActivities.clear();
        mActivityArray.clear();
    }

    public void dispatchPause(boolean flag)
    {
        if (flag)
            mFinishing = true;
        mCurState = 3;
        if (mSingleMode)
        {
            if (mResumed != null)
                moveToState(mResumed, 3);
        } else
        {
            int i = mActivityArray.size();
            for (int j = 0; j < i; j++)
            {
                LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivityArray.get(j);
                if (localactivityrecord.curState == 4)
                    moveToState(localactivityrecord, 3);
            }

        }
    }

    public void dispatchResume()
    {
        mCurState = 4;
        if (mSingleMode)
        {
            if (mResumed != null)
                moveToState(mResumed, 4);
        } else
        {
            int i = mActivityArray.size();
            for (int j = 0; j < i; j++)
                moveToState((LocalActivityRecord)mActivityArray.get(j), 4);

        }
    }

    public HashMap dispatchRetainNonConfigurationInstance()
    {
        HashMap hashmap = null;
        int i = mActivityArray.size();
        for (int j = 0; j < i; j++)
        {
            LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivityArray.get(j);
            if (localactivityrecord == null || localactivityrecord.activity == null)
                continue;
            Object obj = localactivityrecord.activity.onRetainNonConfigurationInstance();
            if (obj == null)
                continue;
            if (hashmap == null)
                hashmap = new HashMap();
            hashmap.put(localactivityrecord.id, obj);
        }

        return hashmap;
    }

    public void dispatchStop()
    {
        mCurState = 2;
        int i = mActivityArray.size();
        for (int j = 0; j < i; j++)
            moveToState((LocalActivityRecord)mActivityArray.get(j), 2);

    }

    public Activity getActivity(String s)
    {
        LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivities.get(s);
        if (localactivityrecord != null)
            return localactivityrecord.activity;
        else
            return null;
    }

    public Activity getCurrentActivity()
    {
        if (mResumed != null)
            return mResumed.activity;
        else
            return null;
    }

    public String getCurrentId()
    {
        if (mResumed != null)
            return mResumed.id;
        else
            return null;
    }

    public void removeAllActivities()
    {
        dispatchDestroy(true);
    }

    public Bundle saveInstanceState()
    {
        Bundle bundle = null;
        int i = mActivityArray.size();
        for (int j = 0; j < i; j++)
        {
            LocalActivityRecord localactivityrecord = (LocalActivityRecord)mActivityArray.get(j);
            if (bundle == null)
                bundle = new Bundle();
            if ((localactivityrecord.instanceState != null || localactivityrecord.curState == 4) && localactivityrecord.activity != null)
            {
                Bundle bundle1 = new Bundle();
                localactivityrecord.activity.performSaveInstanceState(bundle1);
                localactivityrecord.instanceState = bundle1;
            }
            if (localactivityrecord.instanceState != null)
                bundle.putBundle(localactivityrecord.id, localactivityrecord.instanceState);
        }

        return bundle;
    }

    public Window startActivity(String s, Intent intent)
    {
        LocalActivityRecord localactivityrecord;
label0:
        {
            if (mCurState == 1)
                throw new IllegalStateException("Activities can't be added until the containing group has been created.");
            boolean flag = false;
            ActivityInfo activityinfo = null;
            localactivityrecord = (LocalActivityRecord)mActivities.get(s);
            boolean flag1;
            if (localactivityrecord == null)
            {
                localactivityrecord = new LocalActivityRecord(s, intent);
                flag1 = true;
            } else
            {
                Intent intent1 = localactivityrecord.intent;
                activityinfo = null;
                flag1 = false;
                flag = false;
                if (intent1 != null)
                {
                    flag = localactivityrecord.intent.filterEquals(intent);
                    activityinfo = null;
                    flag1 = false;
                    if (flag)
                    {
                        activityinfo = localactivityrecord.activityInfo;
                        flag1 = false;
                    }
                }
            }
            if (activityinfo == null)
                activityinfo = mActivityThread.resolveActivityInfo(intent);
            if (mSingleMode)
            {
                LocalActivityRecord localactivityrecord1 = mResumed;
                if (localactivityrecord1 != null && localactivityrecord1 != localactivityrecord && mCurState == 4)
                    moveToState(localactivityrecord1, 3);
            }
            if (flag1)
            {
                mActivities.put(s, localactivityrecord);
                mActivityArray.add(localactivityrecord);
            } else
            if (localactivityrecord.activityInfo != null)
            {
                if (activityinfo == localactivityrecord.activityInfo || ((ComponentInfo) (activityinfo)).name.equals(((ComponentInfo) (localactivityrecord.activityInfo)).name) && activityinfo.packageName.equals(localactivityrecord.activityInfo.packageName))
                {
                    if (activityinfo.launchMode != 0 || (0x20000000 & intent.getFlags()) != 0)
                        break label0;
                    if (flag && (0x4000000 & intent.getFlags()) == 0)
                    {
                        localactivityrecord.intent = intent;
                        moveToState(localactivityrecord, mCurState);
                        if (mSingleMode)
                            mResumed = localactivityrecord;
                        return localactivityrecord.window;
                    }
                }
                performDestroy(localactivityrecord, true);
            }
            localactivityrecord.intent = intent;
            localactivityrecord.curState = 1;
            localactivityrecord.activityInfo = activityinfo;
            moveToState(localactivityrecord, mCurState);
            if (mSingleMode)
                mResumed = localactivityrecord;
            return localactivityrecord.window;
        }
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(intent);
        mActivityThread.performNewIntents(localactivityrecord, arraylist);
        localactivityrecord.intent = intent;
        moveToState(localactivityrecord, mCurState);
        if (mSingleMode)
            mResumed = localactivityrecord;
        return localactivityrecord.window;
    }
}
