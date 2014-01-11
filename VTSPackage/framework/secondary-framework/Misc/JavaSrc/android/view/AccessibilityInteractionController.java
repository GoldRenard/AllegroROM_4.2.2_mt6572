// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;
import android.os.*;
import android.util.SparseLongArray;
import android.view.accessibility.AccessibilityInteractionClient;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.accessibility.IAccessibilityInteractionConnectionCallback;
import com.android.internal.os.SomeArgs;
import java.util.*;

// Referenced classes of package android.view:
//            ViewRootImpl, View, ViewGroup, ViewParent

final class AccessibilityInteractionController
{
    private class AccessibilityNodePrefetcher
    {

        private static final int MAX_ACCESSIBILITY_NODE_INFO_BATCH_SIZE = 50;
        private final ArrayList mTempViewList;
        final AccessibilityInteractionController this$0;

        private void prefetchDescendantsOfRealNode(View view, List list)
        {
            if (view instanceof ViewGroup) goto _L2; else goto _L1
_L1:
            return;
_L2:
            HashMap hashmap;
            ArrayList arraylist;
            hashmap = new HashMap();
            arraylist = mTempViewList;
            arraylist.clear();
            int i;
            view.addChildrenForAccessibility(arraylist);
            i = arraylist.size();
            Exception exception;
            int k;
            View view1;
            AccessibilityNodeProvider accessibilitynodeprovider;
            AccessibilityNodeInfo accessibilitynodeinfo;
            AccessibilityNodeInfo accessibilitynodeinfo1;
            Iterator iterator;
            java.util.Map.Entry entry;
            View view2;
            AccessibilityNodeInfo accessibilitynodeinfo2;
            for (int j = 0; j >= i; j++)
                break MISSING_BLOCK_LABEL_183;

            k = list.size();
            if (k >= 50)
            {
                arraylist.clear();
                return;
            }
            view1 = (View)arraylist.get(j);
            if (!isShown(view1))
                break MISSING_BLOCK_LABEL_286;
            accessibilitynodeprovider = view1.getAccessibilityNodeProvider();
            if (accessibilitynodeprovider != null)
                break MISSING_BLOCK_LABEL_139;
            accessibilitynodeinfo = view1.createAccessibilityNodeInfo();
            if (accessibilitynodeinfo == null)
                break MISSING_BLOCK_LABEL_286;
            list.add(accessibilitynodeinfo);
            hashmap.put(view1, null);
            break MISSING_BLOCK_LABEL_286;
            accessibilitynodeinfo1 = accessibilitynodeprovider.createAccessibilityNodeInfo(-1);
            if (accessibilitynodeinfo1 == null)
                break MISSING_BLOCK_LABEL_286;
            list.add(accessibilitynodeinfo1);
            hashmap.put(view1, accessibilitynodeinfo1);
            break MISSING_BLOCK_LABEL_286;
            exception;
            arraylist.clear();
            throw exception;
            arraylist.clear();
            if (list.size() < 50)
            {
                iterator = hashmap.entrySet().iterator();
                while (iterator.hasNext()) 
                {
                    entry = (java.util.Map.Entry)iterator.next();
                    view2 = (View)entry.getKey();
                    accessibilitynodeinfo2 = (AccessibilityNodeInfo)entry.getValue();
                    if (accessibilitynodeinfo2 == null)
                        prefetchDescendantsOfRealNode(view2, list);
                    else
                        prefetchDescendantsOfVirtualNode(accessibilitynodeinfo2, view2.getAccessibilityNodeProvider(), list);
                }
            }
            if (true) goto _L1; else goto _L3
_L3:
        }

        private void prefetchDescendantsOfVirtualNode(AccessibilityNodeInfo accessibilitynodeinfo, AccessibilityNodeProvider accessibilitynodeprovider, List list)
        {
label0:
            {
                SparseLongArray sparselongarray = accessibilitynodeinfo.getChildNodeIds();
                int i = list.size();
                int j = sparselongarray.size();
                for (int k = 0; k < j; k++)
                {
                    if (list.size() >= 50)
                        break label0;
                    AccessibilityNodeInfo accessibilitynodeinfo1 = accessibilitynodeprovider.createAccessibilityNodeInfo(AccessibilityNodeInfo.getVirtualDescendantId(sparselongarray.get(k)));
                    if (accessibilitynodeinfo1 != null)
                        list.add(accessibilitynodeinfo1);
                }

                if (list.size() < 50)
                {
                    int l = list.size() - i;
                    for (int i1 = 0; i1 < l; i1++)
                        prefetchDescendantsOfVirtualNode((AccessibilityNodeInfo)list.get(i + i1), accessibilitynodeprovider, list);

                }
            }
        }

        private void prefetchPredecessorsOfRealNode(View view, List list)
        {
            for (ViewParent viewparent = view.getParentForAccessibility(); (viewparent instanceof View) && list.size() < 50; viewparent = viewparent.getParentForAccessibility())
            {
                AccessibilityNodeInfo accessibilitynodeinfo = ((View)viewparent).createAccessibilityNodeInfo();
                if (accessibilitynodeinfo != null)
                    list.add(accessibilitynodeinfo);
            }

        }

        private void prefetchPredecessorsOfVirtualNode(AccessibilityNodeInfo accessibilitynodeinfo, View view, AccessibilityNodeProvider accessibilitynodeprovider, List list)
        {
            long l = accessibilitynodeinfo.getParentNodeId();
            for (int i = AccessibilityNodeInfo.getAccessibilityViewId(l); i != -1 && list.size() < 50; i = AccessibilityNodeInfo.getAccessibilityViewId(l))
            {
                int j = AccessibilityNodeInfo.getVirtualDescendantId(l);
                if (j == -1 && i != view.getAccessibilityViewId())
                {
                    prefetchPredecessorsOfRealNode(view, list);
                    return;
                }
                AccessibilityNodeInfo accessibilitynodeinfo1 = accessibilitynodeprovider.createAccessibilityNodeInfo(j);
                if (accessibilitynodeinfo1 != null)
                    list.add(accessibilitynodeinfo1);
                l = accessibilitynodeinfo1.getParentNodeId();
            }

        }

        private void prefetchSiblingsOfRealNode(View view, List list)
        {
            ViewParent viewparent = view.getParentForAccessibility();
            if (!(viewparent instanceof ViewGroup)) goto _L2; else goto _L1
_L1:
            ViewGroup viewgroup;
            ArrayList arraylist;
            viewgroup = (ViewGroup)viewparent;
            arraylist = mTempViewList;
            arraylist.clear();
            int i;
            viewgroup.addChildrenForAccessibility(arraylist);
            i = arraylist.size();
            int j = 0;
_L12:
            if (j >= i) goto _L4; else goto _L3
_L3:
            int k = list.size();
            if (k < 50) goto _L5; else goto _L4
_L4:
            arraylist.clear();
_L2:
            return;
_L5:
            View view1 = (View)arraylist.get(j);
            if (view1.getAccessibilityViewId() == view.getAccessibilityViewId() || !isShown(view1)) goto _L7; else goto _L6
_L6:
            AccessibilityNodeProvider accessibilitynodeprovider = view1.getAccessibilityNodeProvider();
            if (accessibilitynodeprovider != null) goto _L9; else goto _L8
_L8:
            AccessibilityNodeInfo accessibilitynodeinfo = view1.createAccessibilityNodeInfo();
_L10:
            if (accessibilitynodeinfo == null)
                break; /* Loop/switch isn't completed */
            list.add(accessibilitynodeinfo);
            break; /* Loop/switch isn't completed */
_L9:
            AccessibilityNodeInfo accessibilitynodeinfo1 = accessibilitynodeprovider.createAccessibilityNodeInfo(-1);
            accessibilitynodeinfo = accessibilitynodeinfo1;
            if (true) goto _L10; else goto _L7
            Exception exception;
            exception;
            arraylist.clear();
            throw exception;
_L7:
            j++;
            if (true) goto _L12; else goto _L11
_L11:
        }

        private void prefetchSiblingsOfVirtualNode(AccessibilityNodeInfo accessibilitynodeinfo, View view, AccessibilityNodeProvider accessibilitynodeprovider, List list)
        {
            long l = accessibilitynodeinfo.getParentNodeId();
            int i = AccessibilityNodeInfo.getAccessibilityViewId(l);
            int j = AccessibilityNodeInfo.getVirtualDescendantId(l);
            if (j == -1 && i != view.getAccessibilityViewId())
            {
                prefetchSiblingsOfRealNode(view, list);
                return;
            }
            AccessibilityNodeInfo accessibilitynodeinfo1 = accessibilitynodeprovider.createAccessibilityNodeInfo(j);
            if (accessibilitynodeinfo1 != null)
            {
                SparseLongArray sparselongarray = accessibilitynodeinfo1.getChildNodeIds();
                int k = sparselongarray.size();
                for (int i1 = 0; i1 < k && list.size() < 50; i1++)
                {
                    long l1 = sparselongarray.get(i1);
                    if (l1 == accessibilitynodeinfo.getSourceNodeId())
                        continue;
                    AccessibilityNodeInfo accessibilitynodeinfo2 = accessibilitynodeprovider.createAccessibilityNodeInfo(AccessibilityNodeInfo.getVirtualDescendantId(l1));
                    if (accessibilitynodeinfo2 != null)
                        list.add(accessibilitynodeinfo2);
                }

            }
        }

        public void prefetchAccessibilityNodeInfos(View view, int i, int j, List list)
        {
            AccessibilityNodeProvider accessibilitynodeprovider = view.getAccessibilityNodeProvider();
            if (accessibilitynodeprovider == null)
            {
                AccessibilityNodeInfo accessibilitynodeinfo1 = view.createAccessibilityNodeInfo();
                if (accessibilitynodeinfo1 != null)
                {
                    list.add(accessibilitynodeinfo1);
                    if ((j & 1) != 0)
                        prefetchPredecessorsOfRealNode(view, list);
                    if ((j & 2) != 0)
                        prefetchSiblingsOfRealNode(view, list);
                    if ((j & 4) != 0)
                        prefetchDescendantsOfRealNode(view, list);
                }
            } else
            {
                AccessibilityNodeInfo accessibilitynodeinfo = accessibilitynodeprovider.createAccessibilityNodeInfo(i);
                if (accessibilitynodeinfo != null)
                {
                    list.add(accessibilitynodeinfo);
                    if ((j & 1) != 0)
                        prefetchPredecessorsOfVirtualNode(accessibilitynodeinfo, view, accessibilitynodeprovider, list);
                    if ((j & 2) != 0)
                        prefetchSiblingsOfVirtualNode(accessibilitynodeinfo, view, accessibilitynodeprovider, list);
                    if ((j & 4) != 0)
                    {
                        prefetchDescendantsOfVirtualNode(accessibilitynodeinfo, accessibilitynodeprovider, list);
                        return;
                    }
                }
            }
        }

        private AccessibilityNodePrefetcher()
        {
            this$0 = AccessibilityInteractionController.this;
            super();
            mTempViewList = new ArrayList();
        }

    }

    private class PrivateHandler extends Handler
    {

        private static final int MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_ACCESSIBILITY_ID = 2;
        private static final int MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_TEXT = 4;
        private static final int MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_VIEW_ID = 3;
        private static final int MSG_FIND_FOCUS = 5;
        private static final int MSG_FOCUS_SEARCH = 6;
        private static final int MSG_PERFORM_ACCESSIBILITY_ACTION = 1;
        final AccessibilityInteractionController this$0;

        public String getMessageName(Message message)
        {
            int i = message.what;
            switch (i)
            {
            case 6: // '\006'
                return "MSG_FOCUS_SEARCH";

            case 5: // '\005'
                return "MSG_FIND_FOCUS";

            case 4: // '\004'
                return "MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_TEXT";

            case 3: // '\003'
                return "MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_VIEW_ID";

            case 2: // '\002'
                return "MSG_FIND_ACCESSIBLITY_NODE_INFO_BY_ACCESSIBILITY_ID";

            case 1: // '\001'
                return "MSG_PERFORM_ACCESSIBILITY_ACTION";
            }
            throw new IllegalArgumentException((new StringBuilder()).append("Unknown message type: ").append(i).toString());
        }

        public void handleMessage(Message message)
        {
            int i = message.what;
            switch (i)
            {
            case 6: // '\006'
                focusSearchUiThread(message);
                return;

            case 5: // '\005'
                findFocusUiThread(message);
                return;

            case 4: // '\004'
                findAccessibilityNodeInfosByTextUiThread(message);
                return;

            case 3: // '\003'
                findAccessibilityNodeInfoByViewIdUiThread(message);
                return;

            case 1: // '\001'
                perfromAccessibilityActionUiThread(message);
                return;

            case 2: // '\002'
                findAccessibilityNodeInfoByAccessibilityIdUiThread(message);
                return;
            }
            throw new IllegalArgumentException((new StringBuilder()).append("Unknown message type: ").append(i).toString());
        }

        public PrivateHandler(Looper looper)
        {
            this$0 = AccessibilityInteractionController.this;
            super(looper);
        }
    }


    private final Handler mHandler;
    private final long mMyLooperThreadId;
    private final int mMyProcessId = Process.myPid();
    private final AccessibilityNodePrefetcher mPrefetcher = new AccessibilityNodePrefetcher();
    private ArrayList mTempAccessibilityNodeInfoList;
    private final ArrayList mTempArrayList = new ArrayList();
    private final Rect mTempRect = new Rect();
    private final ViewRootImpl mViewRootImpl;

    public AccessibilityInteractionController(ViewRootImpl viewrootimpl)
    {
        mTempAccessibilityNodeInfoList = new ArrayList();
        Looper looper = viewrootimpl.mHandler.getLooper();
        mMyLooperThreadId = looper.getThread().getId();
        mHandler = new PrivateHandler(looper);
        mViewRootImpl = viewrootimpl;
    }

    private void applyApplicationScaleIfNeeded(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        if (accessibilitynodeinfo != null)
        {
            float f = mViewRootImpl.mAttachInfo.mApplicationScale;
            if (f != 1.0F)
            {
                Rect rect = mTempRect;
                accessibilitynodeinfo.getBoundsInParent(rect);
                rect.scale(f);
                accessibilitynodeinfo.setBoundsInParent(rect);
                accessibilitynodeinfo.getBoundsInScreen(rect);
                rect.scale(f);
                accessibilitynodeinfo.setBoundsInScreen(rect);
                return;
            }
        }
    }

    private void applyApplicationScaleIfNeeded(List list)
    {
        if (list != null && mViewRootImpl.mAttachInfo.mApplicationScale != 1.0F)
        {
            int i = list.size();
            for (int j = 0; j < i; j++)
                applyApplicationScaleIfNeeded((AccessibilityNodeInfo)list.get(j));

        }
    }

    private void findAccessibilityNodeInfoByAccessibilityIdUiThread(Message message)
    {
        int i;
        int j;
        int k;
        int l;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        ArrayList arraylist;
        i = message.arg1;
        SomeArgs someargs = (SomeArgs)message.obj;
        j = someargs.argi1;
        k = someargs.argi2;
        l = someargs.argi3;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg1;
        someargs.recycle();
        arraylist = mTempAccessibilityNodeInfoList;
        arraylist.clear();
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_81;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_117;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(arraylist);
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(arraylist, l);
            arraylist.clear();
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        int i1 = i & 8;
        flag = false;
        if (i1 != 0)
            flag = true;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (j != -1) goto _L2; else goto _L1
_L1:
        view = mViewRootImpl.mView;
_L4:
        if (view == null)
            break MISSING_BLOCK_LABEL_193;
        if (isShown(view))
            mPrefetcher.prefetchAccessibilityNodeInfos(view, k, i, arraylist);
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        applyApplicationScaleIfNeeded(arraylist);
        iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(arraylist, l);
        arraylist.clear();
        return;
_L2:
        View view1 = findViewByAccessibilityId(j);
        view = view1;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(arraylist);
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(arraylist, l);
            arraylist.clear();
        }
        catch (RemoteException remoteexception) { }
        throw exception;
    }

    private void findAccessibilityNodeInfoByViewIdUiThread(Message message)
    {
        int i;
        int j;
        int k;
        int l;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        i = message.arg1;
        j = message.arg2;
        SomeArgs someargs = (SomeArgs)message.obj;
        k = someargs.argi1;
        l = someargs.argi2;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg1;
        someargs.recycle();
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_72;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_99;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        AccessibilityNodeInfo accessibilitynodeinfo;
        View view1;
        boolean flag1;
        AccessibilityNodeInfo accessibilitynodeinfo1;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, l);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        int i1 = i & 8;
        flag = false;
        if (i1 != 0)
            flag = true;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (j == -1) goto _L2; else goto _L1
_L1:
        view = findViewByAccessibilityId(j);
_L4:
        accessibilitynodeinfo = null;
        if (view == null)
            break MISSING_BLOCK_LABEL_196;
        view1 = view.findViewById(k);
        accessibilitynodeinfo = null;
        if (view1 == null)
            break MISSING_BLOCK_LABEL_196;
        flag1 = isShown(view1);
        accessibilitynodeinfo = null;
        if (!flag1)
            break MISSING_BLOCK_LABEL_196;
        accessibilitynodeinfo1 = view1.createAccessibilityNodeInfo();
        accessibilitynodeinfo = accessibilitynodeinfo1;
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        applyApplicationScaleIfNeeded(accessibilitynodeinfo);
        iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(accessibilitynodeinfo, l);
        return;
_L2:
        view = mViewRootImpl.mView;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, l);
        }
        catch (RemoteException remoteexception) { }
        throw exception;
    }

    private void findAccessibilityNodeInfosByTextUiThread(Message message)
    {
        int i;
        String s;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        int j;
        int k;
        int l;
        Object obj;
        i = message.arg1;
        SomeArgs someargs = (SomeArgs)message.obj;
        s = (String)someargs.arg1;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg2;
        j = someargs.argi1;
        k = someargs.argi2;
        l = someargs.argi3;
        someargs.recycle();
        obj = null;
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_80;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_107;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        boolean flag1;
        AccessibilityNodeProvider accessibilitynodeprovider;
        List list;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((List) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(null, l);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        if ((i & 8) != 0)
            flag = true;
        else
            flag = false;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (j == -1) goto _L2; else goto _L1
_L1:
        view = findViewByAccessibilityId(j);
_L8:
        obj = null;
        if (view == null) goto _L4; else goto _L3
_L3:
        flag1 = isShown(view);
        obj = null;
        if (!flag1) goto _L4; else goto _L5
_L5:
        accessibilitynodeprovider = view.getAccessibilityNodeProvider();
        if (accessibilitynodeprovider == null) goto _L7; else goto _L6
_L6:
        list = accessibilitynodeprovider.findAccessibilityNodeInfosByText(s, k);
        obj = list;
_L4:
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        applyApplicationScaleIfNeeded(((List) (obj)));
        iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(((List) (obj)), l);
        return;
_L2:
        view = mViewRootImpl.mView;
          goto _L8
_L7:
        obj = null;
        if (k != -1) goto _L4; else goto _L9
_L9:
        ArrayList arraylist;
        boolean flag2;
        arraylist = mTempArrayList;
        arraylist.clear();
        view.findViewsWithText(arraylist, s, 7);
        flag2 = arraylist.isEmpty();
        obj = null;
        if (flag2) goto _L4; else goto _L10
_L10:
        int i1;
        obj = mTempAccessibilityNodeInfoList;
        ((List) (obj)).clear();
        i1 = arraylist.size();
        int j1 = 0;
_L12:
        if (j1 >= i1) goto _L4; else goto _L11
_L11:
        View view1;
        AccessibilityNodeProvider accessibilitynodeprovider1;
        view1 = (View)arraylist.get(j1);
        if (!isShown(view1))
            break MISSING_BLOCK_LABEL_439;
        accessibilitynodeprovider1 = view1.getAccessibilityNodeProvider();
        if (accessibilitynodeprovider1 == null)
            break MISSING_BLOCK_LABEL_385;
        List list1 = accessibilitynodeprovider1.findAccessibilityNodeInfosByText(s, -1);
        if (list1 == null)
            break MISSING_BLOCK_LABEL_439;
        ((List) (obj)).addAll(list1);
        break MISSING_BLOCK_LABEL_439;
        ((List) (obj)).add(view1.createAccessibilityNodeInfo());
        break MISSING_BLOCK_LABEL_439;
        Exception exception;
        exception;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((List) (obj)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(((List) (obj)), l);
        }
        catch (RemoteException remoteexception) { }
        throw exception;
        j1++;
          goto _L12
    }

    private void findFocusUiThread(Message message)
    {
        int i;
        int j;
        int k;
        int l;
        int i1;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        i = message.arg1;
        j = message.arg2;
        SomeArgs someargs = (SomeArgs)message.obj;
        k = someargs.argi1;
        l = someargs.argi2;
        i1 = someargs.argi3;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg1;
        someargs.recycle();
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_79;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_106;
        Exception exception;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        AccessibilityNodeInfo accessibilitynodeinfo;
        boolean flag1;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, k);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        if ((i & 8) != 0)
            flag = true;
        else
            flag = false;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (l == -1) goto _L2; else goto _L1
_L1:
        view = findViewByAccessibilityId(l);
_L9:
        accessibilitynodeinfo = null;
        if (view == null) goto _L4; else goto _L3
_L3:
        flag1 = isShown(view);
        accessibilitynodeinfo = null;
        if (!flag1) goto _L4; else goto _L5
_L5:
        j;
        JVM INSTR tableswitch 1 2: default 192
    //                   1 394
    //                   2 269;
           goto _L6 _L7 _L8
_L6:
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown focus type: ").append(j).toString());
        exception;
        View view1;
        boolean flag2;
        AccessibilityNodeInfo accessibilitynodeinfo1;
        View view2;
        boolean flag3;
        AccessibilityNodeInfo accessibilitynodeinfo2;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, k);
        }
        catch (RemoteException remoteexception) { }
        throw exception;
_L2:
        view = mViewRootImpl.mView;
          goto _L9
_L8:
        view2 = mViewRootImpl.mAccessibilityFocusedHost;
        accessibilitynodeinfo = null;
        if (view2 == null) goto _L4; else goto _L10
_L10:
        flag3 = ViewRootImpl.isViewDescendantOf(view2, view);
        accessibilitynodeinfo = null;
        if (flag3) goto _L11; else goto _L4
_L4:
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        applyApplicationScaleIfNeeded(accessibilitynodeinfo);
        iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(accessibilitynodeinfo, k);
        return;
_L11:
        if (view2.getAccessibilityNodeProvider() == null) goto _L13; else goto _L12
_L12:
        accessibilitynodeinfo2 = mViewRootImpl.mAccessibilityFocusedVirtualView;
        accessibilitynodeinfo = null;
        if (accessibilitynodeinfo2 == null)
            continue; /* Loop/switch isn't completed */
        accessibilitynodeinfo = AccessibilityNodeInfo.obtain(mViewRootImpl.mAccessibilityFocusedVirtualView);
        continue; /* Loop/switch isn't completed */
_L13:
        accessibilitynodeinfo = null;
        if (i1 != -1)
            continue; /* Loop/switch isn't completed */
        accessibilitynodeinfo = view2.createAccessibilityNodeInfo();
        continue; /* Loop/switch isn't completed */
_L7:
        view1 = view.findFocus();
        accessibilitynodeinfo = null;
        if (view1 == null)
            continue; /* Loop/switch isn't completed */
        flag2 = isShown(view1);
        accessibilitynodeinfo = null;
        if (!flag2)
            continue; /* Loop/switch isn't completed */
        accessibilitynodeinfo1 = view1.createAccessibilityNodeInfo();
        accessibilitynodeinfo = accessibilitynodeinfo1;
        if (true) goto _L4; else goto _L14
_L14:
    }

    private View findViewByAccessibilityId(int i)
    {
        View view = mViewRootImpl.mView;
        View view1;
        if (view == null)
        {
            view1 = null;
        } else
        {
            view1 = view.findViewByAccessibilityId(i);
            if (view1 != null && !isShown(view1))
                return null;
        }
        return view1;
    }

    private void focusSearchUiThread(Message message)
    {
        int i;
        int j;
        int k;
        int l;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        i = message.arg1;
        j = message.arg2;
        SomeArgs someargs = (SomeArgs)message.obj;
        k = someargs.argi2;
        l = someargs.argi3;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg1;
        someargs.recycle();
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_72;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_99;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        AccessibilityNodeInfo accessibilitynodeinfo;
        boolean flag1;
        View view1;
        AccessibilityNodeInfo accessibilitynodeinfo1;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, l);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        int i1 = i & 8;
        flag = false;
        if (i1 != 0)
            flag = true;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (j == -1) goto _L2; else goto _L1
_L1:
        view = findViewByAccessibilityId(j);
_L4:
        accessibilitynodeinfo = null;
        if (view == null)
            break MISSING_BLOCK_LABEL_196;
        flag1 = isShown(view);
        accessibilitynodeinfo = null;
        if (!flag1)
            break MISSING_BLOCK_LABEL_196;
        view1 = view.focusSearch(k);
        accessibilitynodeinfo = null;
        if (view1 == null)
            break MISSING_BLOCK_LABEL_196;
        accessibilitynodeinfo1 = view1.createAccessibilityNodeInfo();
        accessibilitynodeinfo = accessibilitynodeinfo1;
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        applyApplicationScaleIfNeeded(accessibilitynodeinfo);
        iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(accessibilitynodeinfo, l);
        return;
_L2:
        view = mViewRootImpl.mView;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            applyApplicationScaleIfNeeded(((AccessibilityNodeInfo) (null)));
            iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, l);
        }
        catch (RemoteException remoteexception) { }
        throw exception;
    }

    private boolean isShown(View view)
    {
        return view.mAttachInfo != null && view.mAttachInfo.mWindowVisibility == 0 && view.isShown();
    }

    private void perfromAccessibilityActionUiThread(Message message)
    {
        int i;
        int j;
        int k;
        int l;
        int i1;
        IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback;
        Bundle bundle;
        i = message.arg1;
        j = message.arg2;
        SomeArgs someargs = (SomeArgs)message.obj;
        k = someargs.argi1;
        l = someargs.argi2;
        i1 = someargs.argi3;
        iaccessibilityinteractionconnectioncallback = (IAccessibilityInteractionConnectionCallback)someargs.arg1;
        bundle = (Bundle)someargs.arg2;
        someargs.recycle();
        View.AttachInfo attachinfo;
        if (mViewRootImpl.mView == null)
            break MISSING_BLOCK_LABEL_89;
        attachinfo = mViewRootImpl.mAttachInfo;
        if (attachinfo != null)
            break MISSING_BLOCK_LABEL_111;
        View.AttachInfo attachinfo1;
        boolean flag;
        View view;
        boolean flag1;
        boolean flag2;
        AccessibilityNodeProvider accessibilitynodeprovider;
        boolean flag3;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            iaccessibilityinteractionconnectioncallback.setPerformAccessibilityActionResult(false, i1);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        attachinfo1 = mViewRootImpl.mAttachInfo;
        if ((i & 8) != 0)
            flag = true;
        else
            flag = false;
        attachinfo1.mIncludeNotImportantViews = flag;
        if (j == -1) goto _L2; else goto _L1
_L1:
        view = findViewByAccessibilityId(j);
_L10:
        flag1 = false;
        if (view == null) goto _L4; else goto _L3
_L3:
        flag2 = isShown(view);
        flag1 = false;
        if (!flag2) goto _L4; else goto _L5
_L5:
        accessibilitynodeprovider = view.getAccessibilityNodeProvider();
        if (accessibilitynodeprovider == null) goto _L7; else goto _L6
_L6:
        flag3 = accessibilitynodeprovider.performAction(k, l, bundle);
        flag1 = flag3;
_L4:
        mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
        iaccessibilityinteractionconnectioncallback.setPerformAccessibilityActionResult(flag1, i1);
        return;
_L2:
        view = mViewRootImpl.mView;
        continue; /* Loop/switch isn't completed */
_L7:
        flag1 = false;
        if (k != -1) goto _L4; else goto _L8
_L8:
        boolean flag4 = view.performAccessibilityAction(l, bundle);
        flag1 = flag4;
          goto _L4
        Exception exception;
        exception;
        try
        {
            mViewRootImpl.mAttachInfo.mIncludeNotImportantViews = false;
            iaccessibilityinteractionconnectioncallback.setPerformAccessibilityActionResult(false, i1);
        }
        catch (RemoteException remoteexception) { }
        throw exception;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public void findAccessibilityNodeInfoByAccessibilityIdClientThread(long l, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 2;
        message.arg1 = j;
        SomeArgs someargs = SomeArgs.obtain();
        someargs.argi1 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        someargs.argi2 = AccessibilityNodeInfo.getVirtualDescendantId(l);
        someargs.argi3 = i;
        someargs.arg1 = iaccessibilityinteractionconnectioncallback;
        message.obj = someargs;
        if (k == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }

    public void findAccessibilityNodeInfoByViewIdClientThread(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 3;
        message.arg1 = k;
        message.arg2 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        SomeArgs someargs = SomeArgs.obtain();
        someargs.argi1 = i;
        someargs.argi2 = j;
        someargs.arg1 = iaccessibilityinteractionconnectioncallback;
        message.obj = someargs;
        if (i1 == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }

    public void findAccessibilityNodeInfosByTextClientThread(long l, String s, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, 
            long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 4;
        message.arg1 = j;
        SomeArgs someargs = SomeArgs.obtain();
        someargs.arg1 = s;
        someargs.arg2 = iaccessibilityinteractionconnectioncallback;
        someargs.argi1 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        someargs.argi2 = AccessibilityNodeInfo.getVirtualDescendantId(l);
        someargs.argi3 = i;
        message.obj = someargs;
        if (k == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }

    public void findFocusClientThread(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 5;
        message.arg1 = k;
        message.arg2 = i;
        SomeArgs someargs = SomeArgs.obtain();
        someargs.argi1 = j;
        someargs.argi2 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        someargs.argi3 = AccessibilityNodeInfo.getVirtualDescendantId(l);
        someargs.arg1 = iaccessibilityinteractionconnectioncallback;
        message.obj = someargs;
        if (i1 == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }

    public void focusSearchClientThread(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 6;
        message.arg1 = k;
        message.arg2 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        SomeArgs someargs = SomeArgs.obtain();
        someargs.argi2 = i;
        someargs.argi3 = j;
        someargs.arg1 = iaccessibilityinteractionconnectioncallback;
        message.obj = someargs;
        if (i1 == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }

    public void performAccessibilityActionClientThread(long l, int i, Bundle bundle, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, 
            int i1, long l1)
    {
        Message message = mHandler.obtainMessage();
        message.what = 1;
        message.arg1 = k;
        message.arg2 = AccessibilityNodeInfo.getAccessibilityViewId(l);
        SomeArgs someargs = SomeArgs.obtain();
        someargs.argi1 = AccessibilityNodeInfo.getVirtualDescendantId(l);
        someargs.argi2 = i;
        someargs.argi3 = j;
        someargs.arg1 = iaccessibilityinteractionconnectioncallback;
        someargs.arg2 = bundle;
        message.obj = someargs;
        if (i1 == mMyProcessId && l1 == mMyLooperThreadId)
        {
            AccessibilityInteractionClient.getInstanceForThread(l1).setSameThreadMessage(message);
            return;
        } else
        {
            mHandler.sendMessage(message);
            return;
        }
    }







}
