// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.accessibilityservice.IAccessibilityServiceConnection;
import android.graphics.Rect;
import android.os.*;
import android.util.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package android.view.accessibility:
//            AccessibilityNodeInfoCache, AccessibilityNodeInfo, AccessibilityEvent

public final class AccessibilityInteractionClient extends IAccessibilityInteractionConnectionCallback.Stub
{

    private static final boolean CHECK_INTEGRITY = true;
    private static final boolean DEBUG = false;
    private static final String LOG_TAG = "AccessibilityInteractionClient";
    public static final int NO_ID = -1;
    private static final long TIMEOUT_INTERACTION_MILLIS = 5000L;
    private static final AccessibilityNodeInfoCache sAccessibilityNodeInfoCache = new AccessibilityNodeInfoCache();
    private static final LongSparseArray sClients = new LongSparseArray();
    private static final SparseArray sConnectionCache = new SparseArray();
    private static final Object sStaticLock = new Object();
    private AccessibilityNodeInfo mFindAccessibilityNodeInfoResult;
    private List mFindAccessibilityNodeInfosResult;
    private final Object mInstanceLock = new Object();
    private volatile int mInteractionId;
    private final AtomicInteger mInteractionIdCounter = new AtomicInteger();
    private boolean mPerformAccessibilityActionResult;
    private Message mSameThreadMessage;
    private final Rect mTempBounds = new Rect();

    private AccessibilityInteractionClient()
    {
        mInteractionId = -1;
    }

    private void applyCompatibilityScaleIfNeeded(AccessibilityNodeInfo accessibilitynodeinfo, float f)
    {
        if (f == 1.0F)
        {
            return;
        } else
        {
            Rect rect = mTempBounds;
            accessibilitynodeinfo.getBoundsInParent(rect);
            rect.scale(f);
            accessibilitynodeinfo.setBoundsInParent(rect);
            accessibilitynodeinfo.getBoundsInScreen(rect);
            rect.scale(f);
            accessibilitynodeinfo.setBoundsInScreen(rect);
            return;
        }
    }

    private void checkFindAccessibilityNodeInfoResultIntegrity(List list)
    {
        if (list.size() == 0) goto _L2; else goto _L1
_L1:
        AccessibilityNodeInfo accessibilitynodeinfo;
        int i;
        int j;
        accessibilitynodeinfo = (AccessibilityNodeInfo)list.get(0);
        i = list.size();
        j = 1;
_L4:
        if (j < i)
        {
            int k1 = j;
            do
            {
label0:
                {
                    if (k1 < i)
                    {
                        AccessibilityNodeInfo accessibilitynodeinfo3 = (AccessibilityNodeInfo)list.get(k1);
                        if (accessibilitynodeinfo.getParentNodeId() != accessibilitynodeinfo3.getSourceNodeId())
                            break label0;
                        accessibilitynodeinfo = accessibilitynodeinfo3;
                    }
                    j++;
                    continue; /* Loop/switch isn't completed */
                }
                k1++;
            } while (true);
        }
        if (accessibilitynodeinfo == null)
            Log.e("AccessibilityInteractionClient", "No root.");
        HashSet hashset = new HashSet();
        LinkedList linkedlist = new LinkedList();
        linkedlist.add(accessibilitynodeinfo);
        while (!linkedlist.isEmpty()) 
        {
            AccessibilityNodeInfo accessibilitynodeinfo1 = (AccessibilityNodeInfo)linkedlist.poll();
            if (!hashset.add(accessibilitynodeinfo1))
            {
                Log.e("AccessibilityInteractionClient", "Duplicate node.");
                return;
            }
            SparseLongArray sparselongarray = accessibilitynodeinfo1.getChildNodeIds();
            int l = sparselongarray.size();
            int i1 = 0;
            while (i1 < l) 
            {
                long l1 = sparselongarray.valueAt(i1);
                for (int j1 = 0; j1 < i; j1++)
                {
                    AccessibilityNodeInfo accessibilitynodeinfo2 = (AccessibilityNodeInfo)list.get(j1);
                    if (accessibilitynodeinfo2.getSourceNodeId() == l1)
                        linkedlist.add(accessibilitynodeinfo2);
                }

                i1++;
            }
        }
        int k = list.size() - hashset.size();
        if (k > 0)
        {
            Log.e("AccessibilityInteractionClient", (new StringBuilder()).append(k).append(" Disconnected nodes.").toString());
            return;
        }
_L2:
        return;
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void clearResultLocked()
    {
        mInteractionId = -1;
        mFindAccessibilityNodeInfoResult = null;
        mFindAccessibilityNodeInfosResult = null;
        mPerformAccessibilityActionResult = false;
    }

    private void finalizeAndCacheAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo, int i, float f)
    {
        if (accessibilitynodeinfo != null)
        {
            applyCompatibilityScaleIfNeeded(accessibilitynodeinfo, f);
            accessibilitynodeinfo.setConnectionId(i);
            accessibilitynodeinfo.setSealed(true);
            sAccessibilityNodeInfoCache.add(accessibilitynodeinfo);
        }
    }

    private void finalizeAndCacheAccessibilityNodeInfos(List list, int i, float f)
    {
        if (list != null)
        {
            int j = list.size();
            for (int k = 0; k < j; k++)
                finalizeAndCacheAccessibilityNodeInfo((AccessibilityNodeInfo)list.get(k), i, f);

        }
    }

    private AccessibilityNodeInfo getFindAccessibilityNodeInfoResultAndClear(int i)
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        AccessibilityNodeInfo accessibilitynodeinfo;
        if (!waitForResultTimedLocked(i))
            break MISSING_BLOCK_LABEL_35;
        accessibilitynodeinfo = mFindAccessibilityNodeInfoResult;
_L1:
        clearResultLocked();
        return accessibilitynodeinfo;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        accessibilitynodeinfo = null;
          goto _L1
    }

    private List getFindAccessibilityNodeInfosResultAndClear(int i)
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        List list;
        if (!waitForResultTimedLocked(i))
            break MISSING_BLOCK_LABEL_42;
        list = mFindAccessibilityNodeInfosResult;
_L1:
        clearResultLocked();
        if (Build.IS_DEBUGGABLE)
            checkFindAccessibilityNodeInfoResultIntegrity(list);
        return list;
        list = Collections.emptyList();
          goto _L1
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static AccessibilityInteractionClient getInstance()
    {
        return getInstanceForThread(Thread.currentThread().getId());
    }

    public static AccessibilityInteractionClient getInstanceForThread(long l)
    {
        Object obj = sStaticLock;
        obj;
        JVM INSTR monitorenter ;
        AccessibilityInteractionClient accessibilityinteractionclient = (AccessibilityInteractionClient)sClients.get(l);
        if (accessibilityinteractionclient != null)
            break MISSING_BLOCK_LABEL_41;
        accessibilityinteractionclient = new AccessibilityInteractionClient();
        sClients.put(l, accessibilityinteractionclient);
        obj;
        JVM INSTR monitorexit ;
        return accessibilityinteractionclient;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean getPerformAccessibilityActionResultAndClear(int i)
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        boolean flag;
        if (!waitForResultTimedLocked(i))
            break MISSING_BLOCK_LABEL_35;
        flag = mPerformAccessibilityActionResult;
_L1:
        clearResultLocked();
        return flag;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        flag = false;
          goto _L1
    }

    private Message getSameProcessMessageAndClear()
    {
        Message message;
        synchronized (mInstanceLock)
        {
            message = mSameThreadMessage;
            mSameThreadMessage = null;
        }
        return message;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean waitForResultTimedLocked(int i)
    {
        long l = SystemClock.uptimeMillis();
_L2:
        Message message = getSameProcessMessageAndClear();
        if (message == null)
            break MISSING_BLOCK_LABEL_25;
        message.getTarget().handleMessage(message);
        if (mInteractionId == i)
            return true;
        long l1;
        if (mInteractionId > i)
            break; /* Loop/switch isn't completed */
        l1 = 5000L - (SystemClock.uptimeMillis() - l);
        if (l1 <= 0L)
            break; /* Loop/switch isn't completed */
        try
        {
            mInstanceLock.wait(l1);
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
        return false;
    }

    public void addConnection(int i, IAccessibilityServiceConnection iaccessibilityserviceconnection)
    {
        synchronized (sConnectionCache)
        {
            sConnectionCache.put(i, iaccessibilityserviceconnection);
        }
        return;
        exception;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void clearCache()
    {
        sAccessibilityNodeInfoCache.clear();
    }

    public AccessibilityNodeInfo findAccessibilityNodeInfoByAccessibilityId(int i, int j, long l, int k)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_117;
        AccessibilityNodeInfo accessibilitynodeinfo = sAccessibilityNodeInfoCache.get(l);
        if (accessibilitynodeinfo != null)
            return accessibilitynodeinfo;
        int i1;
        float f;
        i1 = mInteractionIdCounter.getAndIncrement();
        f = iaccessibilityserviceconnection.findAccessibilityNodeInfoByAccessibilityId(j, l, i1, this, k, Thread.currentThread().getId());
        if (f <= 0.0F)
            break MISSING_BLOCK_LABEL_117;
        List list;
        list = getFindAccessibilityNodeInfosResultAndClear(i1);
        finalizeAndCacheAccessibilityNodeInfos(list, i, f);
        if (list == null)
            break MISSING_BLOCK_LABEL_117;
        AccessibilityNodeInfo accessibilitynodeinfo1;
        if (list.isEmpty())
            break MISSING_BLOCK_LABEL_117;
        accessibilitynodeinfo1 = (AccessibilityNodeInfo)list.get(0);
        return accessibilitynodeinfo1;
        RemoteException remoteexception;
        remoteexception;
        return null;
    }

    public AccessibilityNodeInfo findAccessibilityNodeInfoByViewId(int i, int j, long l, int k)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_72;
        int i1;
        float f;
        i1 = mInteractionIdCounter.getAndIncrement();
        f = iaccessibilityserviceconnection.findAccessibilityNodeInfoByViewId(j, l, k, i1, this, Thread.currentThread().getId());
        if (f <= 0.0F)
            break MISSING_BLOCK_LABEL_72;
        AccessibilityNodeInfo accessibilitynodeinfo;
        accessibilitynodeinfo = getFindAccessibilityNodeInfoResultAndClear(i1);
        finalizeAndCacheAccessibilityNodeInfo(accessibilitynodeinfo, i, f);
        return accessibilitynodeinfo;
        RemoteException remoteexception;
        remoteexception;
        return null;
    }

    public List findAccessibilityNodeInfosByText(int i, int j, long l, String s)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_72;
        int k;
        float f;
        k = mInteractionIdCounter.getAndIncrement();
        f = iaccessibilityserviceconnection.findAccessibilityNodeInfosByText(j, l, s, k, this, Thread.currentThread().getId());
        if (f <= 0.0F)
            break MISSING_BLOCK_LABEL_72;
        List list;
        list = getFindAccessibilityNodeInfosResultAndClear(k);
        finalizeAndCacheAccessibilityNodeInfos(list, i, f);
        return list;
        RemoteException remoteexception;
        remoteexception;
        return Collections.emptyList();
    }

    public AccessibilityNodeInfo findFocus(int i, int j, long l, int k)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_72;
        int i1;
        float f;
        i1 = mInteractionIdCounter.getAndIncrement();
        f = iaccessibilityserviceconnection.findFocus(j, l, k, i1, this, Thread.currentThread().getId());
        if (f <= 0.0F)
            break MISSING_BLOCK_LABEL_72;
        AccessibilityNodeInfo accessibilitynodeinfo;
        accessibilitynodeinfo = getFindAccessibilityNodeInfoResultAndClear(i1);
        finalizeAndCacheAccessibilityNodeInfo(accessibilitynodeinfo, i, f);
        return accessibilitynodeinfo;
        RemoteException remoteexception;
        remoteexception;
        return null;
    }

    public AccessibilityNodeInfo focusSearch(int i, int j, long l, int k)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_72;
        int i1;
        float f;
        i1 = mInteractionIdCounter.getAndIncrement();
        f = iaccessibilityserviceconnection.focusSearch(j, l, k, i1, this, Thread.currentThread().getId());
        if (f <= 0.0F)
            break MISSING_BLOCK_LABEL_72;
        AccessibilityNodeInfo accessibilitynodeinfo;
        accessibilitynodeinfo = getFindAccessibilityNodeInfoResultAndClear(i1);
        finalizeAndCacheAccessibilityNodeInfo(accessibilitynodeinfo, i, f);
        return accessibilitynodeinfo;
        RemoteException remoteexception;
        remoteexception;
        return null;
    }

    public IAccessibilityServiceConnection getConnection(int i)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection;
        synchronized (sConnectionCache)
        {
            iaccessibilityserviceconnection = (IAccessibilityServiceConnection)sConnectionCache.get(i);
        }
        return iaccessibilityserviceconnection;
        exception;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public AccessibilityNodeInfo getRootInActiveWindow(int i)
    {
        return findAccessibilityNodeInfoByAccessibilityId(i, -1, AccessibilityNodeInfo.ROOT_NODE_ID, 4);
    }

    public void onAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        sAccessibilityNodeInfoCache.onAccessibilityEvent(accessibilityevent);
    }

    public boolean performAccessibilityAction(int i, int j, long l, int k, Bundle bundle)
    {
        IAccessibilityServiceConnection iaccessibilityserviceconnection = getConnection(i);
        if (iaccessibilityserviceconnection == null)
            break MISSING_BLOCK_LABEL_59;
        boolean flag;
        int i1 = mInteractionIdCounter.getAndIncrement();
        if (!iaccessibilityserviceconnection.performAccessibilityAction(j, l, k, bundle, i1, this, Thread.currentThread().getId()))
            break MISSING_BLOCK_LABEL_59;
        flag = getPerformAccessibilityActionResultAndClear(i1);
        return flag;
        RemoteException remoteexception;
        remoteexception;
        return false;
    }

    public void removeConnection(int i)
    {
        synchronized (sConnectionCache)
        {
            sConnectionCache.remove(i);
        }
        return;
        exception;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setFindAccessibilityNodeInfoResult(AccessibilityNodeInfo accessibilitynodeinfo, int i)
    {
        synchronized (mInstanceLock)
        {
            if (i > mInteractionId)
            {
                mFindAccessibilityNodeInfoResult = accessibilitynodeinfo;
                mInteractionId = i;
            }
            mInstanceLock.notifyAll();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setFindAccessibilityNodeInfosResult(List list, int i)
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        if (i <= mInteractionId) goto _L2; else goto _L1
_L1:
        if (list == null)
            break MISSING_BLOCK_LABEL_78;
        Exception exception;
        boolean flag;
        if (Binder.getCallingPid() != Process.myPid())
            flag = true;
        else
            flag = false;
        if (flag) goto _L4; else goto _L3
_L3:
        mFindAccessibilityNodeInfosResult = new ArrayList(list);
_L5:
        mInteractionId = i;
_L2:
        mInstanceLock.notifyAll();
        obj;
        JVM INSTR monitorexit ;
        return;
_L4:
        mFindAccessibilityNodeInfosResult = list;
          goto _L5
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        mFindAccessibilityNodeInfosResult = Collections.emptyList();
          goto _L5
    }

    public void setPerformAccessibilityActionResult(boolean flag, int i)
    {
        synchronized (mInstanceLock)
        {
            if (i > mInteractionId)
            {
                mPerformAccessibilityActionResult = flag;
                mInteractionId = i;
            }
            mInstanceLock.notifyAll();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setSameThreadMessage(Message message)
    {
        synchronized (mInstanceLock)
        {
            mSameThreadMessage = message;
            mInstanceLock.notifyAll();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

}
