// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.Context;
import android.content.pm.ResolveInfo;
import android.os.*;
import android.util.Log;
import android.view.IWindow;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

// Referenced classes of package android.view.accessibility:
//            IAccessibilityManager, IAccessibilityManagerClient, AccessibilityEvent, IAccessibilityInteractionConnection

public final class AccessibilityManager
{
    public static interface AccessibilityStateChangeListener
    {

        public abstract void onAccessibilityStateChanged(boolean flag);
    }

    class MyHandler extends Handler
    {

        final AccessibilityManager this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 10: // '\n'
                setState(message.arg1);
                return;
            }
            Log.w("AccessibilityManager", (new StringBuilder()).append("Unknown message type: ").append(message.what).toString());
        }

        MyHandler(Looper looper)
        {
            this$0 = AccessibilityManager.this;
            super(looper);
        }
    }


    private static final boolean DEBUG = false;
    private static final int DO_SET_STATE = 10;
    private static final String LOG_TAG = "AccessibilityManager";
    public static final int STATE_FLAG_ACCESSIBILITY_ENABLED = 1;
    public static final int STATE_FLAG_TOUCH_EXPLORATION_ENABLED = 2;
    private static AccessibilityManager sInstance;
    static final Object sInstanceSync = new Object();
    final CopyOnWriteArrayList mAccessibilityStateChangeListeners = new CopyOnWriteArrayList();
    final IAccessibilityManagerClient.Stub mClient = new IAccessibilityManagerClient.Stub() {

        final AccessibilityManager this$0;

        public void setState(int j)
        {
            mHandler.obtainMessage(10, j, 0).sendToTarget();
        }

            
            {
                this$0 = AccessibilityManager.this;
                super();
            }
    }
;
    final Handler mHandler;
    boolean mIsEnabled;
    boolean mIsTouchExplorationEnabled;
    final IAccessibilityManager mService;
    final int mUserId;

    public AccessibilityManager(Context context, IAccessibilityManager iaccessibilitymanager, int i)
    {
        mHandler = new MyHandler(context.getMainLooper());
        mService = iaccessibilitymanager;
        mUserId = i;
        try
        {
            setState(mService.addClient(mClient, i));
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("AccessibilityManager", "AccessibilityManagerService is dead", remoteexception);
        }
    }

    public static void createAsSharedAcrossUsers(Context context)
    {
        Object obj = sInstanceSync;
        obj;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            throw new IllegalStateException("AccessibilityManager already created.");
        break MISSING_BLOCK_LABEL_27;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        createSingletonInstance(context, -2);
        obj;
        JVM INSTR monitorexit ;
    }

    private static void createSingletonInstance(Context context, int i)
    {
        sInstance = new AccessibilityManager(context, IAccessibilityManager.Stub.asInterface(ServiceManager.getService("accessibility")), i);
    }

    public static AccessibilityManager getInstance(Context context)
    {
        synchronized (sInstanceSync)
        {
            if (sInstance == null)
                createSingletonInstance(context, UserHandle.myUserId());
        }
        return sInstance;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void notifyAccessibilityStateChanged()
    {
        int i = mAccessibilityStateChangeListeners.size();
        for (int j = 0; j < i; j++)
            ((AccessibilityStateChangeListener)mAccessibilityStateChangeListeners.get(j)).onAccessibilityStateChanged(mIsEnabled);

    }

    private void setAccessibilityState(boolean flag)
    {
        synchronized (mHandler)
        {
            if (flag != mIsEnabled)
            {
                mIsEnabled = flag;
                notifyAccessibilityStateChanged();
            }
        }
        return;
        exception;
        handler;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void setState(int i)
    {
        boolean flag = true;
        boolean flag1;
        if ((i & 1) != 0)
            flag1 = flag;
        else
            flag1 = false;
        setAccessibilityState(flag1);
        if ((i & 2) == 0)
            flag = false;
        mIsTouchExplorationEnabled = flag;
    }

    public int addAccessibilityInteractionConnection(IWindow iwindow, IAccessibilityInteractionConnection iaccessibilityinteractionconnection)
    {
        int i;
        try
        {
            i = mService.addAccessibilityInteractionConnection(iwindow, iaccessibilityinteractionconnection, mUserId);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("AccessibilityManager", "Error while adding an accessibility interaction connection. ", remoteexception);
            return -1;
        }
        return i;
    }

    public boolean addAccessibilityStateChangeListener(AccessibilityStateChangeListener accessibilitystatechangelistener)
    {
        return mAccessibilityStateChangeListeners.add(accessibilitystatechangelistener);
    }

    public List getAccessibilityServiceList()
    {
        List list = getInstalledAccessibilityServiceList();
        ArrayList arraylist = new ArrayList();
        int i = list.size();
        for (int j = 0; j < i; j++)
            arraylist.add(((AccessibilityServiceInfo)list.get(j)).getResolveInfo().serviceInfo);

        return Collections.unmodifiableList(arraylist);
    }

    public IAccessibilityManagerClient getClient()
    {
        return (IAccessibilityManagerClient)mClient.asBinder();
    }

    public List getEnabledAccessibilityServiceList(int i)
    {
        List list1 = mService.getEnabledAccessibilityServiceList(i, mUserId);
        List list = list1;
_L2:
        return Collections.unmodifiableList(list);
        RemoteException remoteexception;
        remoteexception;
        Log.e("AccessibilityManager", "Error while obtaining the installed AccessibilityServices. ", remoteexception);
        list = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public List getInstalledAccessibilityServiceList()
    {
        List list1 = mService.getInstalledAccessibilityServiceList(mUserId);
        List list = list1;
_L2:
        return Collections.unmodifiableList(list);
        RemoteException remoteexception;
        remoteexception;
        Log.e("AccessibilityManager", "Error while obtaining the installed AccessibilityServices. ", remoteexception);
        list = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void interrupt()
    {
        if (!mIsEnabled)
            throw new IllegalStateException("Accessibility off. Did you forget to check that?");
        try
        {
            mService.interrupt(mUserId);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("AccessibilityManager", "Error while requesting interrupt from all services. ", remoteexception);
        }
    }

    public boolean isEnabled()
    {
        boolean flag;
        synchronized (mHandler)
        {
            flag = mIsEnabled;
        }
        return flag;
        exception;
        handler;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isTouchExplorationEnabled()
    {
        boolean flag;
        synchronized (mHandler)
        {
            flag = mIsTouchExplorationEnabled;
        }
        return flag;
        exception;
        handler;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void removeAccessibilityInteractionConnection(IWindow iwindow)
    {
        try
        {
            mService.removeAccessibilityInteractionConnection(iwindow);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("AccessibilityManager", "Error while removing an accessibility interaction connection. ", remoteexception);
        }
    }

    public boolean removeAccessibilityStateChangeListener(AccessibilityStateChangeListener accessibilitystatechangelistener)
    {
        return mAccessibilityStateChangeListeners.remove(accessibilitystatechangelistener);
    }

    public void sendAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        boolean flag;
        if (!mIsEnabled)
            throw new IllegalStateException("Accessibility off. Did you forget to check that?");
        flag = false;
        accessibilityevent.setEventTime(SystemClock.uptimeMillis());
        long l = Binder.clearCallingIdentity();
        flag = mService.sendAccessibilityEvent(accessibilityevent, mUserId);
        Binder.restoreCallingIdentity(l);
        if (!flag) goto _L2; else goto _L1
_L1:
        accessibilityevent.recycle();
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("AccessibilityManager", (new StringBuilder()).append("Error during sending ").append(accessibilityevent).append(" ").toString(), remoteexception);
        if (!flag) goto _L2; else goto _L1
        Exception exception;
        exception;
        if (flag)
            accessibilityevent.recycle();
        throw exception;
    }


}
