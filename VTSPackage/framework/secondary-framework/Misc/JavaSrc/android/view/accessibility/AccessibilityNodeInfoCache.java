// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.os.Build;
import android.util.*;
import java.util.*;

// Referenced classes of package android.view.accessibility:
//            AccessibilityNodeInfo, AccessibilityEvent

public class AccessibilityNodeInfoCache
{

    private static final boolean CHECK_INTEGRITY = true;
    private static final boolean DEBUG = false;
    private static final boolean ENABLED = true;
    private static final String LOG_TAG = android/view/accessibility/AccessibilityNodeInfoCache.getSimpleName();
    private final LongSparseArray mCacheImpl = new LongSparseArray();
    private final Object mLock = new Object();
    private int mWindowId;


    private void checkIntegrity()
    {
label0:
        {
            synchronized (mLock)
            {
                if (mCacheImpl.size() > 0)
                    break label0;
            }
            return;
        }
        AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)mCacheImpl.valueAt(0);
        AccessibilityNodeInfo accessibilitynodeinfo1 = accessibilitynodeinfo;
_L1:
        if (accessibilitynodeinfo1 == null)
            break MISSING_BLOCK_LABEL_63;
        accessibilitynodeinfo = accessibilitynodeinfo1;
        accessibilitynodeinfo1 = (AccessibilityNodeInfo)mCacheImpl.get(accessibilitynodeinfo1.getParentNodeId());
          goto _L1
        int i = accessibilitynodeinfo.getWindowId();
        AccessibilityNodeInfo accessibilitynodeinfo2;
        AccessibilityNodeInfo accessibilitynodeinfo3;
        accessibilitynodeinfo2 = null;
        accessibilitynodeinfo3 = null;
        HashSet hashset;
        LinkedList linkedlist;
        hashset = new HashSet();
        linkedlist = new LinkedList();
        linkedlist.add(accessibilitynodeinfo);
_L13:
        if (linkedlist.isEmpty()) goto _L3; else goto _L2
_L2:
        AccessibilityNodeInfo accessibilitynodeinfo5 = (AccessibilityNodeInfo)linkedlist.poll();
        if (hashset.add(accessibilitynodeinfo5)) goto _L5; else goto _L4
_L4:
        Log.e(LOG_TAG, (new StringBuilder()).append("Duplicate node: ").append(accessibilitynodeinfo5).toString());
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L5:
        if (!accessibilitynodeinfo5.isAccessibilityFocused()) goto _L7; else goto _L6
_L6:
        if (accessibilitynodeinfo2 == null) goto _L9; else goto _L8
_L8:
        Log.e(LOG_TAG, (new StringBuilder()).append("Duplicate accessibility focus:").append(accessibilitynodeinfo5).toString());
_L7:
        if (!accessibilitynodeinfo5.isFocused()) goto _L11; else goto _L10
_L10:
        if (accessibilitynodeinfo3 == null)
            break MISSING_BLOCK_LABEL_448;
        Log.e(LOG_TAG, (new StringBuilder()).append("Duplicate input focus: ").append(accessibilitynodeinfo5).toString());
_L11:
        SparseLongArray sparselongarray;
        int l;
        sparselongarray = accessibilitynodeinfo5.getChildNodeIds();
        l = sparselongarray.size();
        int i1 = 0;
_L17:
        if (i1 >= l) goto _L13; else goto _L12
_L12:
        AccessibilityNodeInfo accessibilitynodeinfo6;
        long l1 = sparselongarray.valueAt(i1);
        accessibilitynodeinfo6 = (AccessibilityNodeInfo)mCacheImpl.get(l1);
        if (accessibilitynodeinfo6 == null) goto _L15; else goto _L14
_L14:
        linkedlist.add(accessibilitynodeinfo6);
          goto _L15
_L3:
        int j = mCacheImpl.size();
        AccessibilityNodeInfo accessibilitynodeinfo4;
        for (int k = 0; k >= j; k++)
            break MISSING_BLOCK_LABEL_432;

        accessibilitynodeinfo4 = (AccessibilityNodeInfo)mCacheImpl.valueAt(k);
        if (hashset.contains(accessibilitynodeinfo4))
            break MISSING_BLOCK_LABEL_455;
        if (accessibilitynodeinfo4.getWindowId() == i)
        {
            Log.e(LOG_TAG, "Disconneced node: ");
            break MISSING_BLOCK_LABEL_455;
        }
        Log.e(LOG_TAG, (new StringBuilder()).append("Node from: ").append(accessibilitynodeinfo4.getWindowId()).append(" not from:").append(i).append(" ").append(accessibilitynodeinfo4).toString());
        break MISSING_BLOCK_LABEL_455;
        obj;
        JVM INSTR monitorexit ;
        return;
_L15:
        i1++;
        if (true) goto _L17; else goto _L16
_L16:
          goto _L13
_L9:
        accessibilitynodeinfo2 = accessibilitynodeinfo5;
          goto _L7
        accessibilitynodeinfo3 = accessibilitynodeinfo5;
          goto _L11
    }

    private void clearSubTreeLocked(long l)
    {
        AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)mCacheImpl.get(l);
        if (accessibilitynodeinfo != null)
        {
            mCacheImpl.remove(l);
            SparseLongArray sparselongarray = accessibilitynodeinfo.getChildNodeIds();
            int i = sparselongarray.size();
            for (int j = 0; j < i; j++)
                clearSubTreeLocked(sparselongarray.valueAt(j));

        }
    }

    private void clearSubtreeWithOldAccessibilityFocusLocked(long l)
    {
        int i = mCacheImpl.size();
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)mCacheImpl.valueAt(j);
                    long l1 = accessibilitynodeinfo.getSourceNodeId();
                    if (l1 == l || !accessibilitynodeinfo.isAccessibilityFocused())
                        break label0;
                    clearSubTreeLocked(l1);
                }
                return;
            }
            j++;
        } while (true);
    }

    private void clearSubtreeWithOldInputFocusLocked(long l)
    {
        int i = mCacheImpl.size();
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)mCacheImpl.valueAt(j);
                    long l1 = accessibilitynodeinfo.getSourceNodeId();
                    if (l1 == l || !accessibilitynodeinfo.isFocused())
                        break label0;
                    clearSubTreeLocked(l1);
                }
                return;
            }
            j++;
        } while (true);
    }

    public void add(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        long l;
        AccessibilityNodeInfo accessibilitynodeinfo1;
        l = accessibilitynodeinfo.getSourceNodeId();
        accessibilitynodeinfo1 = (AccessibilityNodeInfo)mCacheImpl.get(l);
        if (accessibilitynodeinfo1 == null) goto _L2; else goto _L1
_L1:
        SparseLongArray sparselongarray;
        SparseLongArray sparselongarray1;
        int i;
        sparselongarray = accessibilitynodeinfo1.getChildNodeIds();
        sparselongarray1 = accessibilitynodeinfo.getChildNodeIds();
        i = sparselongarray.size();
        int j = 0;
_L7:
        if (j >= i) goto _L4; else goto _L3
_L3:
        long l1 = sparselongarray.valueAt(j);
        if (sparselongarray1.indexOfValue(l1) < 0)
            clearSubTreeLocked(l1);
          goto _L5
_L4:
        long l2 = accessibilitynodeinfo1.getParentNodeId();
        if (accessibilitynodeinfo.getParentNodeId() != l2)
            clearSubTreeLocked(l2);
_L2:
        AccessibilityNodeInfo accessibilitynodeinfo2 = AccessibilityNodeInfo.obtain(accessibilitynodeinfo);
        mCacheImpl.put(l, accessibilitynodeinfo2);
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void clear()
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        int i = mCacheImpl.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((AccessibilityNodeInfo)mCacheImpl.valueAt(j)).recycle();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        mCacheImpl.clear();
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public AccessibilityNodeInfo get(long l)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)mCacheImpl.get(l);
        if (accessibilitynodeinfo == null)
            break MISSING_BLOCK_LABEL_32;
        accessibilitynodeinfo = AccessibilityNodeInfo.obtain(accessibilitynodeinfo);
        obj;
        JVM INSTR monitorexit ;
        return accessibilitynodeinfo;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        int i = accessibilityevent.getEventType();
        i;
        JVM INSTR lookupswitch 10: default 96
    //                   4: 150
    //                   8: 150
    //                   16: 150
    //                   32: 107
    //                   128: 122
    //                   256: 122
    //                   2048: 209
    //                   4096: 209
    //                   8192: 150
    //                   32768: 150;
           goto _L1 _L2 _L2 _L2 _L3 _L4 _L4 _L5 _L5 _L2 _L2
_L1:
        if (Build.IS_DEBUGGABLE)
            checkIntegrity();
        return;
_L3:
        mWindowId = accessibilityevent.getWindowId();
        clear();
        continue; /* Loop/switch isn't completed */
_L4:
        int j = accessibilityevent.getWindowId();
        if (mWindowId != j)
        {
            mWindowId = j;
            clear();
        }
        continue; /* Loop/switch isn't completed */
_L2:
        Object obj1 = mLock;
        obj1;
        JVM INSTR monitorenter ;
        long l;
        l = accessibilityevent.getSourceNodeId();
        clearSubTreeLocked(l);
        if (i != 8)
            break MISSING_BLOCK_LABEL_183;
        clearSubtreeWithOldInputFocusLocked(l);
        if (i != 32768)
            break MISSING_BLOCK_LABEL_195;
        clearSubtreeWithOldAccessibilityFocusLocked(l);
        obj1;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        Exception exception1;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
_L5:
        synchronized (mLock)
        {
            clearSubTreeLocked(accessibilityevent.getSourceNodeId());
        }
        if (true) goto _L1; else goto _L6
_L6:
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

}
