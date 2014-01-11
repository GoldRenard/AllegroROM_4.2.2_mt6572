// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.animation.LayoutTransition;
import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.os.*;
import android.text.format.DateFormat;
import android.util.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.accessibility.IAccessibilityInteractionConnectionCallback;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.Scroller;
import com.android.internal.os.SomeArgs;
import com.android.internal.policy.PolicyManager;
import com.android.internal.view.BaseSurfaceHolder;
import com.android.internal.view.RootViewSurfaceTaker;
import com.mediatek.xlog.Xlog;
import java.io.*;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

// Referenced classes of package android.view:
//            ViewParent, Surface, InputEventConsistencyVerifier, WindowManagerGlobal, 
//            Display, CompatibilityInfoHolder, WindowLeaked, ViewConfiguration, 
//            Choreographer, KeyEvent, View, MotionEvent, 
//            InputEvent, FallbackEventHandler, ViewGroup, SoundEffectConstants, 
//            HardwareRenderer, ViewTreeObserver, IWindowSession, InputEventReceiver, 
//            DisplayList, DragEvent, HardwareLayer, HardwareCanvas, 
//            SurfaceHolder, InputChannel, KeyCharacterMap, FocusFinder, 
//            AccessibilityInteractionController, InputQueue, ContextMenu, ActionMode, 
//            ViewDebug

public final class ViewRootImpl
    implements ViewParent, View.AttachInfo.Callbacks, HardwareRenderer.HardwareDrawCallbacks
{
    static final class AccessibilityInteractionConnection extends android.view.accessibility.IAccessibilityInteractionConnection.Stub
    {

        private final WeakReference mViewRootImpl;

        public void findAccessibilityNodeInfoByAccessibilityId(long l, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().findAccessibilityNodeInfoByAccessibilityIdClientThread(l, i, iaccessibilityinteractionconnectioncallback, j, k, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(null, i);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void findAccessibilityNodeInfoByViewId(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().findAccessibilityNodeInfoByViewIdClientThread(l, i, j, iaccessibilityinteractionconnectioncallback, k, i1, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, j);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void findAccessibilityNodeInfosByText(long l, String s, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, 
                long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().findAccessibilityNodeInfosByTextClientThread(l, s, i, iaccessibilityinteractionconnectioncallback, j, k, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfosResult(null, i);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void findFocus(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().findFocusClientThread(l, i, j, iaccessibilityinteractionconnectioncallback, k, i1, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, j);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void focusSearch(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().focusSearchClientThread(l, i, j, iaccessibilityinteractionconnectioncallback, k, i1, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setFindAccessibilityNodeInfoResult(null, j);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void performAccessibilityAction(long l, int i, Bundle bundle, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, 
                int i1, long l1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewRootImpl.get();
            if (viewrootimpl != null && viewrootimpl.mView != null)
            {
                viewrootimpl.getAccessibilityInteractionController().performAccessibilityActionClientThread(l, i, bundle, j, iaccessibilityinteractionconnectioncallback, k, i1, l1);
                return;
            }
            try
            {
                iaccessibilityinteractionconnectioncallback.setPerformAccessibilityActionResult(false, j);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        AccessibilityInteractionConnection(ViewRootImpl viewrootimpl)
        {
            mViewRootImpl = new WeakReference(viewrootimpl);
        }
    }

    final class AccessibilityInteractionConnectionManager
        implements android.view.accessibility.AccessibilityManager.AccessibilityStateChangeListener
    {

        final ViewRootImpl this$0;

        public void ensureConnection()
        {
            if (mAttachInfo != null)
            {
                boolean flag;
                if (mAttachInfo.mAccessibilityWindowId != -1)
                    flag = true;
                else
                    flag = false;
                if (!flag)
                    mAttachInfo.mAccessibilityWindowId = mAccessibilityManager.addAccessibilityInteractionConnection(mWindow, new AccessibilityInteractionConnection(ViewRootImpl.this));
            }
        }

        public void ensureNoConnection()
        {
            boolean flag;
            if (mAttachInfo.mAccessibilityWindowId != -1)
                flag = true;
            else
                flag = false;
            if (flag)
            {
                mAttachInfo.mAccessibilityWindowId = -1;
                mAccessibilityManager.removeAccessibilityInteractionConnection(mWindow);
            }
        }

        public void onAccessibilityStateChanged(boolean flag)
        {
            if (flag)
            {
                ensureConnection();
                if (mAttachInfo != null && mAttachInfo.mHasWindowFocus)
                {
                    mView.sendAccessibilityEvent(32);
                    View view = mView.findFocus();
                    if (view != null && view != mView)
                        view.sendAccessibilityEvent(8);
                }
                return;
            } else
            {
                ensureNoConnection();
                mHandler.obtainMessage(22).sendToTarget();
                return;
            }
        }

        AccessibilityInteractionConnectionManager()
        {
            this$0 = ViewRootImpl.this;
            super();
        }
    }

    public static final class CalledFromWrongThreadException extends AndroidRuntimeException
    {

        public CalledFromWrongThreadException(String s)
        {
            super(s);
        }
    }

    final class ConsumeBatchedInputRunnable
        implements Runnable
    {

        final ViewRootImpl this$0;

        public void run()
        {
            doConsumeBatchedInput(mChoreographer.getFrameTimeNanos());
        }

        ConsumeBatchedInputRunnable()
        {
            this$0 = ViewRootImpl.this;
            super();
        }
    }

    static final class InputMethodCallback
        implements android.view.inputmethod.InputMethodManager.FinishedEventCallback
    {

        private WeakReference mViewAncestor;

        public void finishedEvent(int i, boolean flag)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.DEBUG_IME_ANR || ViewRootImpl.DEBUG_IMF || ViewRootImpl.DEBUG_KEY || ViewRootImpl.DEBUG_INPUT)
                Xlog.d("ViewRootImpl", (new StringBuilder()).append("IME finishedEvent: seq = ").append(i).append(",handled = ").append(flag).append(",viewAncestor = ").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchImeFinishedEvent(i, flag);
        }

        public InputMethodCallback(ViewRootImpl viewrootimpl)
        {
            mViewAncestor = new WeakReference(viewrootimpl);
        }
    }

    final class InvalidateOnAnimationRunnable
        implements Runnable
    {

        private boolean mPosted;
        private View.AttachInfo.InvalidateInfo mTempViewRects[];
        private View mTempViews[];
        private ArrayList mViewRects;
        private ArrayList mViews;
        final ViewRootImpl this$0;

        private void postIfNeededLocked()
        {
            if (!mPosted)
            {
                mChoreographer.postCallback(1, this, null);
                mPosted = true;
            }
        }

        public void addView(View view)
        {
            this;
            JVM INSTR monitorenter ;
            mViews.add(view);
            postIfNeededLocked();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void addViewRect(View.AttachInfo.InvalidateInfo invalidateinfo)
        {
            this;
            JVM INSTR monitorenter ;
            mViewRects.add(invalidateinfo);
            postIfNeededLocked();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void removeView(View view)
        {
            this;
            JVM INSTR monitorenter ;
            int i;
            mViews.remove(view);
            i = mViewRects.size();
_L2:
            int j;
            j = i - 1;
            if (i <= 0)
                break MISSING_BLOCK_LABEL_72;
            View.AttachInfo.InvalidateInfo invalidateinfo = (View.AttachInfo.InvalidateInfo)mViewRects.get(j);
            if (invalidateinfo.target == view)
            {
                mViewRects.remove(j);
                invalidateinfo.release();
            }
            break MISSING_BLOCK_LABEL_125;
            if (mPosted && mViews.isEmpty() && mViewRects.isEmpty())
            {
                mChoreographer.removeCallbacks(1, this, null);
                mPosted = false;
            }
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            i = j;
            if (true) goto _L2; else goto _L1
_L1:
        }

        public void run()
        {
            this;
            JVM INSTR monitorenter ;
            int i;
            mPosted = false;
            i = mViews.size();
            if (i == 0) goto _L2; else goto _L1
_L1:
            ArrayList arraylist = mViews;
            if (mTempViews == null) goto _L4; else goto _L3
_L3:
            View aview[] = mTempViews;
_L9:
            mTempViews = (View[])arraylist.toArray(aview);
            mViews.clear();
_L2:
            int j = mViewRects.size();
            if (j == 0) goto _L6; else goto _L5
_L5:
            ArrayList arraylist1 = mViewRects;
            if (mTempViewRects == null) goto _L8; else goto _L7
_L7:
            View.AttachInfo.InvalidateInfo ainvalidateinfo[] = mTempViewRects;
_L10:
            mTempViewRects = (View.AttachInfo.InvalidateInfo[])arraylist1.toArray(ainvalidateinfo);
            mViewRects.clear();
_L6:
            this;
            JVM INSTR monitorexit ;
            for (int k = 0; k < i; k++)
            {
                mTempViews[k].invalidate();
                mTempViews[k] = null;
            }

            break MISSING_BLOCK_LABEL_170;
_L4:
            aview = new View[i];
              goto _L9
_L8:
            ainvalidateinfo = new View.AttachInfo.InvalidateInfo[j];
              goto _L10
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            for (int l = 0; l < j; l++)
            {
                View.AttachInfo.InvalidateInfo invalidateinfo = mTempViewRects[l];
                invalidateinfo.target.invalidate(invalidateinfo.left, invalidateinfo.top, invalidateinfo.right, invalidateinfo.bottom);
                invalidateinfo.release();
            }

            return;
              goto _L9
        }

        InvalidateOnAnimationRunnable()
        {
            this$0 = ViewRootImpl.this;
            super();
            mViews = new ArrayList();
            mViewRects = new ArrayList();
        }
    }

    private static final class QueuedInputEvent
    {

        public static final int FLAG_DELIVER_POST_IME = 1;
        public InputEvent mEvent;
        public int mFlags;
        public QueuedInputEvent mNext;
        public InputEventReceiver mReceiver;

        private QueuedInputEvent()
        {
        }

    }

    static final class RunQueue
    {

        private final ArrayList mActions = new ArrayList();

        void executeActions(Handler handler)
        {
            ArrayList arraylist = mActions;
            arraylist;
            JVM INSTR monitorenter ;
            ArrayList arraylist1;
            int i;
            arraylist1 = mActions;
            i = arraylist1.size();
            int j = 0;
_L2:
            if (j >= i)
                break; /* Loop/switch isn't completed */
            HandlerAction handleraction = (HandlerAction)arraylist1.get(j);
            handler.postDelayed(handleraction.action, handleraction.delay);
            j++;
            if (true) goto _L2; else goto _L1
_L1:
            arraylist1.clear();
            arraylist;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        void post(Runnable runnable)
        {
            postDelayed(runnable, 0L);
        }

        void postDelayed(Runnable runnable, long l)
        {
            HandlerAction handleraction = new HandlerAction();
            handleraction.action = runnable;
            handleraction.delay = l;
            synchronized (mActions)
            {
                mActions.add(handleraction);
            }
            return;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        void removeCallbacks(Runnable runnable)
        {
            HandlerAction handleraction = new HandlerAction();
            handleraction.action = runnable;
            synchronized (mActions)
            {
                for (ArrayList arraylist1 = mActions; arraylist1.remove(handleraction););
            }
            return;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

    }

    private static class RunQueue.HandlerAction
    {

        Runnable action;
        long delay;

        public boolean equals(Object obj)
        {
label0:
            {
label1:
                {
                    RunQueue.HandlerAction handleraction;
label2:
                    {
                        if (this != obj)
                        {
                            if (obj == null || getClass() != obj.getClass())
                                break label0;
                            handleraction = (RunQueue.HandlerAction)obj;
                            if (action == null)
                                break label2;
                            if (!action.equals(handleraction.action))
                                break label1;
                        }
                        return true;
                    }
                    if (handleraction.action == null)
                        return true;
                }
                return false;
            }
            return false;
        }

        public int hashCode()
        {
            int i;
            if (action != null)
                i = action.hashCode();
            else
                i = 0;
            return i * 31 + (int)(delay ^ delay >>> 32);
        }

        private RunQueue.HandlerAction()
        {
        }

    }

    private class SendWindowContentChangedAccessibilityEvent
        implements Runnable
    {

        public View mSource;
        final ViewRootImpl this$0;

        public void run()
        {
            if (mSource != null)
            {
                mSource.sendAccessibilityEvent(2048);
                mSource.resetAccessibilityStateChanged();
                mSource = null;
            }
        }

        private SendWindowContentChangedAccessibilityEvent()
        {
            this$0 = ViewRootImpl.this;
            super();
        }

    }

    static final class SystemUiVisibilityInfo
    {

        int globalVisibility;
        int localChanges;
        int localValue;
        int seq;

    }

    class TakenSurfaceHolder extends BaseSurfaceHolder
    {

        final ViewRootImpl this$0;

        public boolean isCreating()
        {
            return mIsCreating;
        }

        public boolean onAllowLockCanvas()
        {
            return mDrawingAllowed;
        }

        public void onRelayoutContainer()
        {
        }

        public void onUpdateSurface()
        {
            throw new IllegalStateException("Shouldn't be here");
        }

        public void setFixedSize(int i, int j)
        {
            throw new UnsupportedOperationException("Currently only support sizing from layout");
        }

        public void setFormat(int i)
        {
            ((RootViewSurfaceTaker)mView).setSurfaceFormat(i);
        }

        public void setKeepScreenOn(boolean flag)
        {
            ((RootViewSurfaceTaker)mView).setSurfaceKeepScreenOn(flag);
        }

        public void setType(int i)
        {
            ((RootViewSurfaceTaker)mView).setSurfaceType(i);
        }

        TakenSurfaceHolder()
        {
            this$0 = ViewRootImpl.this;
            super();
        }
    }

    static final class TrackballAxis
    {

        static final float ACCEL_MOVE_SCALING_FACTOR = 0.025F;
        static final long FAST_MOVE_TIME = 150L;
        static final float MAX_ACCELERATION = 20F;
        float absPosition;
        float acceleration;
        int dir;
        long lastMoveTime;
        int nonAccelMovement;
        float position;
        int step;

        float collect(float f, long l, String s)
        {
            long l1;
            if (f > 0.0F)
            {
                l1 = (long)(150F * f);
                if (dir < 0)
                {
                    if (ViewRootImpl.DEBUG_TRACKBALL)
                        Log.v("ViewRootImpl", (new StringBuilder()).append(s).append(" reversed to positive!").toString());
                    position = 0.0F;
                    step = 0;
                    acceleration = 1.0F;
                    lastMoveTime = 0L;
                }
                dir = 1;
            } else
            if (f < 0.0F)
            {
                l1 = (long)(150F * -f);
                if (dir > 0)
                {
                    if (ViewRootImpl.DEBUG_TRACKBALL)
                        Log.v("ViewRootImpl", (new StringBuilder()).append(s).append(" reversed to negative!").toString());
                    position = 0.0F;
                    step = 0;
                    acceleration = 1.0F;
                    lastMoveTime = 0L;
                }
                dir = -1;
            } else
            {
                l1 = 0L;
            }
            if (l1 > 0L)
            {
                long l2 = l - lastMoveTime;
                lastMoveTime = l;
                float f2 = acceleration;
                if (l2 < l1)
                {
                    float f4 = 0.025F * (float)(l1 - l2);
                    if (f4 > 1.0F)
                        f2 *= f4;
                    if (ViewRootImpl.DEBUG_TRACKBALL)
                        Log.v("ViewRootImpl", (new StringBuilder()).append(s).append(" accelerate: off=").append(f).append(" normTime=").append(l1).append(" delta=").append(l2).append(" scale=").append(f4).append(" acc=").append(f2).toString());
                    if (f2 >= 20F)
                        f2 = 20F;
                    acceleration = f2;
                } else
                {
                    float f3 = 0.025F * (float)(l2 - l1);
                    if (f3 > 1.0F)
                        f2 /= f3;
                    if (ViewRootImpl.DEBUG_TRACKBALL)
                        Log.v("ViewRootImpl", (new StringBuilder()).append(s).append(" deccelerate: off=").append(f).append(" normTime=").append(l1).append(" delta=").append(l2).append(" scale=").append(f3).append(" acc=").append(f2).toString());
                    if (f2 <= 1.0F)
                        f2 = 1.0F;
                    acceleration = f2;
                }
            }
            position = f + position;
            float f1 = Math.abs(position);
            absPosition = f1;
            return f1;
        }

        int generate(float f)
        {
            int i = 0;
            nonAccelMovement = 0;
label0:
            do
            {
                byte byte0;
                if (position >= 0.0F)
                    byte0 = 1;
                else
                    byte0 = -1;
                switch (step)
                {
                case 1: // '\001'
                    if (absPosition < 2.0F)
                        break label0;
                    i += byte0;
                    nonAccelMovement = byte0 + nonAccelMovement;
                    float f4 = position;
                    float f5;
                    if (byte0 > 0)
                        f5 = -2F;
                    else
                        f5 = 2.0F;
                    position = f5 + f4;
                    absPosition = Math.abs(position);
                    step = 2;
                    continue;

                case 0: // '\0'
                    if (absPosition < f)
                        break label0;
                    i += byte0;
                    nonAccelMovement = byte0 + nonAccelMovement;
                    step = 1;
                    continue;
                }
                if (absPosition < 1.0F)
                    break;
                i += byte0;
                float f1 = position;
                float f2;
                if (byte0 >= 0)
                    f2 = -1F;
                else
                    f2 = 1.0F;
                position = f2 + f1;
                absPosition = Math.abs(position);
                float f3 = 1.1F * acceleration;
                if (f3 >= 20F)
                    f3 = acceleration;
                acceleration = f3;
            } while (true);
            return i;
        }

        void reset(int i)
        {
            position = 0.0F;
            acceleration = 1.0F;
            lastMoveTime = 0L;
            step = i;
            dir = 0;
        }

        TrackballAxis()
        {
            acceleration = 1.0F;
            lastMoveTime = 0L;
        }
    }

    final class TraversalRunnable
        implements Runnable
    {

        final ViewRootImpl this$0;

        public void run()
        {
            doTraversal();
        }

        TraversalRunnable()
        {
            this$0 = ViewRootImpl.this;
            super();
        }
    }

    final class ViewRootHandler extends Handler
    {

        final ViewRootImpl this$0;

        public String getMessageName(Message message)
        {
            switch (message.what)
            {
            case 25: // '\031'
                return "MSG_WINDOW_MOVED";

            case 23: // '\027'
                return "MSG_DISPATCH_DONE_ANIMATING";

            case 22: // '\026'
                return "MSG_CLEAR_ACCESSIBILITY_FOCUS_HOST";

            case 21: // '\025'
                return "MSG_INVALIDATE_DISPLAY_LIST";

            case 20: // '\024'
                return "MSG_DISPATCH_SCREEN_STATE";

            case 19: // '\023'
                return "MSG_PROCESS_INPUT_EVENTS";

            case 18: // '\022'
                return "MSG_UPDATE_CONFIGURATION";

            case 17: // '\021'
                return "MSG_DISPATCH_SYSTEM_UI_VISIBILITY";

            case 16: // '\020'
                return "MSG_DISPATCH_DRAG_LOCATION_EVENT";

            case 15: // '\017'
                return "MSG_DISPATCH_DRAG_EVENT";

            case 14: // '\016'
                return "MSG_CLOSE_SYSTEM_DIALOGS";

            case 13: // '\r'
                return "MSG_CHECK_FOCUS";

            case 12: // '\f'
                return "MSG_FINISH_INPUT_CONNECTION";

            case 11: // '\013'
                return "MSG_DISPATCH_KEY_FROM_IME";

            case 10: // '\n'
                return "MSG_IME_FINISHED_EVENT";

            case 9: // '\t'
                return "MSG_DISPATCH_GET_NEW_SURFACE";

            case 8: // '\b'
                return "MSG_DISPATCH_APP_VISIBILITY";

            case 7: // '\007'
                return "MSG_DISPATCH_KEY";

            case 6: // '\006'
                return "MSG_WINDOW_FOCUS_CHANGED";

            case 5: // '\005'
                return "MSG_RESIZED_REPORT";

            case 4: // '\004'
                return "MSG_RESIZED";

            case 3: // '\003'
                return "MSG_DIE";

            case 2: // '\002'
                return "MSG_INVALIDATE_RECT";

            case 1: // '\001'
                return "MSG_INVALIDATE";

            case 24: // '\030'
            default:
                return super.getMessageName(message);
            }
        }

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 1 25: default 120
        //                       1 121
        //                       2 132
        //                       3 1426
        //                       4 267
        //                       5 338
        //                       6 659
        //                       7 1434
        //                       8 229
        //                       9 259
        //                       10 175
        //                       11 1456
        //                       12 1571
        //                       13 1594
        //                       14 1610
        //                       15 1638
        //                       16 1638
        //                       17 1669
        //                       18 1684
        //                       19 213
        //                       20 1728
        //                       21 1764
        //                       22 1772
        //                       23 1782
        //                       24 1790
        //                       25 531;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25
_L1:
            return;
_L2:
            ((View)message.obj).invalidate();
            return;
_L3:
            View.AttachInfo.InvalidateInfo invalidateinfo = (View.AttachInfo.InvalidateInfo)message.obj;
            invalidateinfo.target.invalidate(invalidateinfo.left, invalidateinfo.top, invalidateinfo.right, invalidateinfo.bottom);
            invalidateinfo.release();
            return;
_L11:
            ViewRootImpl viewrootimpl2 = ViewRootImpl.this;
            int j1 = message.arg1;
            boolean flag6;
            if (message.arg2 != 0)
                flag6 = true;
            else
                flag6 = false;
            viewrootimpl2.handleImeFinishedEvent(j1, flag6);
            return;
_L19:
            mProcessInputEventsScheduled = false;
            doProcessInputEvents();
            return;
_L9:
            ViewRootImpl viewrootimpl1 = ViewRootImpl.this;
            boolean flag5;
            if (message.arg1 != 0)
                flag5 = true;
            else
                flag5 = false;
            viewrootimpl1.handleAppVisibility(flag5);
            return;
_L10:
            handleGetNewSurface();
            return;
_L5:
            SomeArgs someargs1 = (SomeArgs)message.obj;
            if (mWinFrame.equals(someargs1.arg1) && mPendingContentInsets.equals(someargs1.arg2) && mPendingVisibleInsets.equals(someargs1.arg3) && someargs1.arg4 == null)
                continue; /* Loop/switch isn't completed */
_L6:
            if (mAdded)
            {
                SomeArgs someargs = (SomeArgs)message.obj;
                Configuration configuration1 = (Configuration)someargs.arg4;
                if (configuration1 != null)
                    updateConfiguration(configuration1, false);
                if (ViewRootImpl.DEBUG_LAYOUT)
                    Xlog.d("ViewRootImpl", (new StringBuilder()).append("Handle RESIZE: message = ").append(message.what).append(" ,this = ").append(ViewRootImpl.this).toString());
                mWinFrame.set((Rect)someargs.arg1);
                mPendingContentInsets.set((Rect)someargs.arg2);
                mPendingVisibleInsets.set((Rect)someargs.arg3);
                someargs.recycle();
                if (message.what == 5)
                    mReportNextDraw = true;
                if (mView != null)
                    ViewRootImpl.forceLayout(mView);
                requestLayout();
                return;
            }
            continue; /* Loop/switch isn't completed */
_L25:
            if (mAdded)
            {
                int j = mWinFrame.width();
                int k = mWinFrame.height();
                int l = message.arg1;
                int i1 = message.arg2;
                mWinFrame.left = l;
                mWinFrame.right = l + j;
                mWinFrame.top = i1;
                mWinFrame.bottom = i1 + k;
                if (mView != null)
                    ViewRootImpl.forceLayout(mView);
                requestLayout();
                return;
            }
            continue; /* Loop/switch isn't completed */
_L7:
            if (mAdded)
            {
                boolean flag1;
                if (message.arg1 != 0)
                    flag1 = true;
                else
                    flag1 = false;
                mAttachInfo.mHasWindowFocus = flag1;
                profileRendering(flag1);
                if (flag1)
                {
                    boolean flag4;
                    if (message.arg2 != 0)
                        flag4 = true;
                    else
                        flag4 = false;
                    ensureTouchModeLocally(flag4);
                    if (mAttachInfo.mHardwareRenderer != null && mSurface != null && mSurface.isValid())
                    {
                        mFullRedrawNeeded = true;
                        InputMethodManager inputmethodmanager2;
                        WindowManager.LayoutParams layoutparams;
                        WindowManager.LayoutParams layoutparams1;
                        View view;
                        View view1;
                        int i;
                        try
                        {
                            if (mAttachInfo.mHardwareRenderer.initializeIfNeeded(mWidth, mHeight, mHolder.getSurface()))
                                mFullRedrawNeeded = true;
                        }
                        catch (Surface.OutOfResourcesException outofresourcesexception)
                        {
                            Log.e("ViewRootImpl", "OutOfResourcesException locking surface", outofresourcesexception);
                            try
                            {
                                if (!mWindowSession.outOfMemory(mWindow))
                                {
                                    Slog.w("ViewRootImpl", "No processes killed for memory; killing self");
                                    Process.killProcess(Process.myPid());
                                }
                            }
                            catch (RemoteException remoteexception)
                            {
                                Xlog.e("ViewRootImpl", "RemoteException when call outOfMemory.", outofresourcesexception);
                            }
                            sendMessageDelayed(obtainMessage(message.what, message.arg1, message.arg2), 500L);
                            return;
                        }
                    }
                }
                mLastWasImTarget = WindowManager.LayoutParams.mayUseInputMethod(mWindowAttributes.flags);
                inputmethodmanager2 = InputMethodManager.peekInstance();
                if (mView != null)
                {
                    if (flag1 && inputmethodmanager2 != null && mLastWasImTarget)
                        inputmethodmanager2.startGettingWindowFocus(mView);
                    mAttachInfo.mKeyDispatchState.reset();
                    mView.dispatchWindowFocusChanged(flag1);
                }
                if (ViewRootImpl.DEBUG_IMF)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Handle MSG_WINDOW_FOCUS_CHANGED: hasWindowFocus = ").append(flag1).append(", mLastWasImTarget = ").append(mLastWasImTarget).append(", softInputMode = #").append(Integer.toHexString(mWindowAttributes.softInputMode)).append(", window flags = #").append(Integer.toHexString(mWindowAttributes.flags)).append(", mView = ").append(mView).append(", this = ").append(this).toString());
                if (flag1)
                {
                    if (inputmethodmanager2 != null)
                    {
                        boolean flag2;
                        if (((ViewGroup.LayoutParams) (mWindowAttributes)).width != -2 && ((ViewGroup.LayoutParams) (mWindowAttributes)).height != -2)
                            flag2 = true;
                        else
                            flag2 = false;
                        if (mWindowAttributes.type >= 1 && mWindowAttributes.type <= 99 && flag2 || mLastWasImTarget)
                        {
                            if (ViewRootImpl.DEBUG_IMF)
                                Xlog.v("ViewRootImpl", "Application Window may not use IME, just notify imm on window gained focus");
                            view = mView;
                            view1 = mView.findFocus();
                            i = mWindowAttributes.softInputMode;
                            boolean flag3;
                            if (!mHasHadWindowFocus)
                                flag3 = true;
                            else
                                flag3 = false;
                            inputmethodmanager2.onWindowFocus(view, view1, i, flag3, mWindowAttributes.flags);
                        }
                    }
                    layoutparams = mWindowAttributes;
                    layoutparams.softInputMode = 0xfffffeff & layoutparams.softInputMode;
                    layoutparams1 = (WindowManager.LayoutParams)mView.getLayoutParams();
                    layoutparams1.softInputMode = 0xfffffeff & layoutparams1.softInputMode;
                    mHasHadWindowFocus = true;
                }
                setAccessibilityFocus(null, null);
                if (mView != null && mAccessibilityManager.isEnabled() && flag1)
                {
                    mView.sendAccessibilityEvent(32);
                    return;
                }
            }
            if (true) goto _L1; else goto _L4
_L4:
            doDie();
            return;
_L8:
            KeyEvent keyevent1 = (KeyEvent)message.obj;
            enqueueInputEvent(keyevent1, null, 0, true);
            return;
_L12:
            if (ViewRootImpl.LOCAL_LOGV || ViewRootImpl.DEBUG_KEY)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Dispatching key ").append(message.obj).append(" from IME to ").append(mView).append(" in ").append(this).toString());
            KeyEvent keyevent = (KeyEvent)message.obj;
            if ((8 & keyevent.getFlags()) != 0)
                keyevent = KeyEvent.changeFlags(keyevent, -9 & keyevent.getFlags());
            enqueueInputEvent(keyevent, null, 1, true);
            return;
_L13:
            InputMethodManager inputmethodmanager1 = InputMethodManager.peekInstance();
            if (inputmethodmanager1 != null)
            {
                inputmethodmanager1.reportFinishInputConnection((InputConnection)message.obj);
                return;
            }
            if (true)
                continue; /* Loop/switch isn't completed */
_L14:
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            if (inputmethodmanager != null)
            {
                inputmethodmanager.checkFocus();
                return;
            }
            continue; /* Loop/switch isn't completed */
_L15:
            if (mView != null)
            {
                mView.onCloseSystemDialogs((String)message.obj);
                return;
            }
            if (true) goto _L1; else goto _L16
_L16:
            DragEvent dragevent = (DragEvent)message.obj;
            dragevent.mLocalState = mLocalDragState;
            handleDragEvent(dragevent);
            return;
_L17:
            handleDispatchSystemUiVisibilityChanged((SystemUiVisibilityInfo)message.obj);
            return;
_L18:
            Configuration configuration = (Configuration)message.obj;
            if (configuration.isOtherSeqNewer(mLastConfiguration))
                configuration = mLastConfiguration;
            updateConfiguration(configuration, false);
            return;
_L20:
            if (mView != null)
            {
                ViewRootImpl viewrootimpl = ViewRootImpl.this;
                boolean flag;
                if (message.arg1 == 1)
                    flag = true;
                else
                    flag = false;
                viewrootimpl.handleScreenStateChange(flag);
                return;
            }
            if (true)
                continue; /* Loop/switch isn't completed */
_L21:
            invalidateDisplayLists();
            return;
_L22:
            setAccessibilityFocus(null, null);
            return;
_L23:
            handleDispatchDoneAnimating();
            return;
_L24:
            if (mView != null)
            {
                invalidateWorld(mView);
                return;
            }
            if (true) goto _L1; else goto _L26
_L26:
        }

        ViewRootHandler()
        {
            this$0 = ViewRootImpl.this;
            super();
        }
    }

    static class W extends IWindow.Stub
    {

        private final WeakReference mViewAncestor;
        private final IWindowSession mWindowSession;

        private static int checkCallingPermission(String s)
        {
            int i;
            try
            {
                i = ActivityManagerNative.getDefault().checkPermission(s, Binder.getCallingPid(), Binder.getCallingUid());
            }
            catch (RemoteException remoteexception)
            {
                return -1;
            }
            return i;
        }

        public void closeSystemDialogs(String s)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.LOCAL_LOGV)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Close system dialogs in ").append(viewrootimpl).append(" for ").append(s).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchCloseSystemDialogs(s);
        }

        public void dispatchAppVisibility(boolean flag)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.DEBUG_LIFECYCLE)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("dispatchAppVisibility: visible = ").append(flag).append(", viewAncestor = ").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchAppVisibility(flag);
        }

        public void dispatchDragEvent(DragEvent dragevent)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.LOCAL_LOGV || ViewRootImpl.DEBUG_INPUT)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Dispatch drag event ").append(dragevent).append(" in ").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchDragEvent(dragevent);
        }

        public void dispatchGetNewSurface()
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl != null)
                viewrootimpl.dispatchGetNewSurface();
        }

        public void dispatchPositionChanged(int i, int j)
        {
            ViewRootImpl viewrootimpl;
label0:
            {
                viewrootimpl = (ViewRootImpl)mViewAncestor.get();
                if (ViewRootImpl.DEBUG_LAYOUT)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("dispatchPositionChanged: left = ").append(i).append(", top = ").append(j).append(", viewAncestor").append(viewrootimpl).toString());
                if (viewrootimpl != null)
                {
                    if (viewrootimpl.mTranslator != null)
                        break label0;
                    viewrootimpl.mAttachInfo.mWindowLeft = i;
                    viewrootimpl.mAttachInfo.mWindowTop = j;
                }
                return;
            }
            viewrootimpl.mAttachInfo.mWindowLeft = (int)(0.5F + (float)i * viewrootimpl.mTranslator.applicationInvertedScale);
            viewrootimpl.mAttachInfo.mWindowTop = (int)(0.5F + (float)j * viewrootimpl.mTranslator.applicationInvertedScale);
        }

        public void dispatchScreenState(boolean flag)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.DEBUG_LIFECYCLE)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("dispatchScreenState: on = ").append(flag).append(", viewAncestor = ").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchScreenStateChange(flag);
        }

        public void dispatchSystemUiVisibilityChanged(int i, int j, int k, int l)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.LOCAL_LOGV)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("dispatchSystemUiVisibilityChanged: seq = ").append(i).append(", globalVisibility = ").append(j).append(", localValue = ").append(k).append(", localChanges = ").append(l).append(", viewAncestor").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchSystemUiVisibilityChanged(i, j, k, l);
        }

        public void dispatchWallpaperCommand(String s, int i, int j, int k, Bundle bundle, boolean flag)
        {
            if (!flag)
                break MISSING_BLOCK_LABEL_19;
            mWindowSession.wallpaperCommandComplete(asBinder(), null);
            return;
            RemoteException remoteexception;
            remoteexception;
            Xlog.e("ViewRootImpl", "RemoteException happens when dispatchWallpaperCommand.", remoteexception);
            return;
        }

        public void dispatchWallpaperOffsets(float f, float f1, float f2, float f3, boolean flag)
        {
            if (!flag)
                break MISSING_BLOCK_LABEL_18;
            mWindowSession.wallpaperOffsetsComplete(asBinder());
            return;
            RemoteException remoteexception;
            remoteexception;
            Xlog.e("ViewRootImpl", "RemoteException happens when dispatchWallpaperOffsets.", remoteexception);
            return;
        }

        public void doneAnimating()
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.DEBUG_DRAW)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("doneAnimating: viewAncestor").append(viewrootimpl).toString());
            if (viewrootimpl != null)
                viewrootimpl.dispatchDoneAnimating();
        }

        public void dumpInputDispatchingStatus()
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl != null)
                viewrootimpl.dumpInputDispatchingStatus();
        }

        public void enableLog(boolean flag)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl != null)
                viewrootimpl.enableLog(flag);
        }

        public void executeCommand(String s, String s1, ParcelFileDescriptor parcelfiledescriptor)
        {
            View view;
            android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream;
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl == null)
                break MISSING_BLOCK_LABEL_109;
            view = viewrootimpl.mView;
            if (view == null)
                break MISSING_BLOCK_LABEL_109;
            if (checkCallingPermission("android.permission.DUMP") != 0)
                throw new SecurityException((new StringBuilder()).append("Insufficient permissions to invoke executeCommand() from pid=").append(Binder.getCallingPid()).append(", uid=").append(Binder.getCallingUid()).toString());
            autocloseoutputstream = null;
            android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream1 = new android.os.ParcelFileDescriptor.AutoCloseOutputStream(parcelfiledescriptor);
            ViewDebug.dispatchCommand(view, s, s1, autocloseoutputstream1);
            if (autocloseoutputstream1 == null)
                break MISSING_BLOCK_LABEL_109;
            autocloseoutputstream1.close();
_L2:
            return;
            IOException ioexception;
            ioexception;
_L5:
            ioexception.printStackTrace();
            if (autocloseoutputstream == null) goto _L2; else goto _L1
_L1:
            autocloseoutputstream.close();
            return;
            IOException ioexception2;
            ioexception2;
_L3:
            ioexception2.printStackTrace();
            return;
            Exception exception;
            exception;
_L4:
            if (autocloseoutputstream != null)
                try
                {
                    autocloseoutputstream.close();
                }
                catch (IOException ioexception1)
                {
                    ioexception1.printStackTrace();
                }
            throw exception;
            ioexception2;
              goto _L3
            exception;
            autocloseoutputstream = autocloseoutputstream1;
              goto _L4
            ioexception;
            autocloseoutputstream = autocloseoutputstream1;
              goto _L5
        }

        public void moved(int i, int j)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl != null)
                viewrootimpl.dispatchMoved(i, j);
        }

        public void resized(Rect rect, Rect rect1, Rect rect2, boolean flag, Configuration configuration)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (viewrootimpl != null)
                viewrootimpl.dispatchResized(rect, rect1, rect2, flag, configuration);
        }

        public void windowFocusChanged(boolean flag, boolean flag1)
        {
            ViewRootImpl viewrootimpl = (ViewRootImpl)mViewAncestor.get();
            if (ViewRootImpl.DEBUG_IMF)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("W windowFocusChanged: hasFocus = ").append(flag).append(", inTouchMode = ").append(flag1).append(", viewAncestor = ").append(viewrootimpl).append(", this = ").append(this).toString());
            if (viewrootimpl != null)
                viewrootimpl.windowFocusChanged(flag, flag1);
        }

        W(ViewRootImpl viewrootimpl)
        {
            mViewAncestor = new WeakReference(viewrootimpl);
            mWindowSession = viewrootimpl.mWindowSession;
        }
    }

    final class WindowInputEventReceiver extends InputEventReceiver
    {

        final ViewRootImpl this$0;

        public void dispose()
        {
            unscheduleConsumeBatchedInput();
            super.dispose();
        }

        public void onBatchedInputEventPending()
        {
            if (ViewRootImpl.DEBUG_INPUT || ViewRootImpl.DEBUG_KEY || ViewRootImpl.DEBUG_MOTION)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("onBatchedInputEventPending: this = ").append(this).toString());
            scheduleConsumeBatchedInput();
        }

        public void onInputEvent(InputEvent inputevent)
        {
            if (inputevent instanceof KeyEvent)
            {
                mCurrentKeyEvent = (KeyEvent)inputevent;
                mKeyEventStartTime = System.currentTimeMillis();
                mKeyEventStatus = "1: Start event from input";
            } else
            {
                mCurrentMotion = (MotionEvent)inputevent;
                mMotionEventStartTime = System.currentTimeMillis();
                mMotionEventStatus = "1: Start event from input";
            }
            enqueueInputEvent(inputevent, this, 0, true);
        }

        public WindowInputEventReceiver(InputChannel inputchannel, Looper looper)
        {
            this$0 = ViewRootImpl.this;
            super(inputchannel, looper);
        }
    }


    private static final String DATE_FORMAT_STRING = "yyyyMMdd_hhmmss";
    private static boolean DBG = false;
    private static boolean DEBUG_CONFIGURATION = false;
    private static final int DEBUG_CONFIGURATION_FLAG = 256;
    private static final int DEBUG_DEFAULT_FLAG = 512;
    private static boolean DEBUG_DIALOG = false;
    private static final int DEBUG_DIALOG_FLAG = 8;
    private static boolean DEBUG_DRAW = false;
    private static final int DEBUG_DRAW_FLAG = 2;
    private static final int DEBUG_ENABLE_ALL_FLAG = 1;
    private static boolean DEBUG_FPS = false;
    private static final int DEBUG_FPS_FLAG = 1024;
    private static boolean DEBUG_HWUI = false;
    private static final int DEBUG_HWUI_FLAG = 2048;
    private static boolean DEBUG_IME_ANR = false;
    private static final int DEBUG_IME_ANR_FLAG = 32768;
    private static boolean DEBUG_IMF = false;
    private static final int DEBUG_IMF_FLAG = 128;
    private static boolean DEBUG_INPUT = false;
    private static final int DEBUG_INPUT_FLAG = 4096;
    private static boolean DEBUG_INPUT_RESIZE = false;
    private static final int DEBUG_INPUT_RESIZE_FLAG = 16;
    private static boolean DEBUG_KEY = false;
    private static final int DEBUG_KEY_FLAG = 8192;
    private static boolean DEBUG_LAYOUT = false;
    private static final int DEBUG_LAYOUT_FLAG = 4;
    private static boolean DEBUG_LIFECYCLE = false;
    private static final int DEBUG_LIFECYCLE_FLAG = 0x10000;
    private static boolean DEBUG_MOTION = false;
    private static final int DEBUG_MOTION_FLAG = 16384;
    private static boolean DEBUG_ORIENTATION = false;
    private static final int DEBUG_ORIENTATION_FLAG = 32;
    private static boolean DEBUG_TRACKBALL = false;
    private static final int DEBUG_TRACKBALL_FLAG = 64;
    private static final String DUMP_IMAGE_FORMAT = ".png";
    private static final String DUMP_IMAGE_PTAH = "/data/dump/";
    private static final String INPUT_DISPATCH_STATE_DELIVER_EVENT = "4: Deliver input event";
    private static final String INPUT_DISPATCH_STATE_ENQUEUE_EVENT = "2: Enqueue input event";
    private static final String INPUT_DISPATCH_STATE_FINISHED = "0: Finish handle input event";
    private static final String INPUT_DISPATCH_STATE_PROCESS_EVENT = "3 1: Process input event";
    private static final String INPUT_DISPATCH_STATE_SCHEDULE_EVENT = "3 2: Schedule process input event";
    private static final String INPUT_DISPATCH_STATE_STARTED = "1: Start event from input";
    private static final String KEY_DISPATCH_STATE_BEGIN_DELIEVER = "5: Begin deliver key event";
    private static final String KEY_DISPATCH_STATE_DELIEVER_TO_IMM = "6: Deliver key to imm";
    private static final String KEY_DISPATCH_STATE_DELIEVER_TO_VIEW = "7: Deliver key to view hierarchy";
    private static final String KEY_DISPATCH_STATE_FINISHED = "8: Finish handle key event";
    private static boolean LOCAL_LOGV = false;
    private static final int LOG_DISABLED = 0;
    private static final int LOG_ENABLED = 1;
    private static final String LOG_PROPERTY_NAME = "debug.viewroot.enable";
    private static final int MAX_QUEUED_INPUT_EVENT_POOL_SIZE = 10;
    static final int MAX_TRACKBALL_DELAY = 250;
    private static final boolean MEASURE_LATENCY = false;
    private static final String MOTION_DISPATCH_STATE_DELIEVER_GENERIC = "5 2: Deliver pointer event";
    private static final String MOTION_DISPATCH_STATE_DELIEVER_POINTER = "5 0: Deliver pointer event";
    private static final String MOTION_DISPATCH_STATE_DELIEVER_TRACKBALL = "5 1: Deliver pointer event";
    private static final String MOTION_DISPATCH_STATE_FINISHED = "6: Finish handle motion event";
    private static final int MSG_CHECK_FOCUS = 13;
    private static final int MSG_CLEAR_ACCESSIBILITY_FOCUS_HOST = 22;
    private static final int MSG_CLOSE_SYSTEM_DIALOGS = 14;
    private static final int MSG_DIE = 3;
    private static final int MSG_DISPATCH_APP_VISIBILITY = 8;
    private static final int MSG_DISPATCH_DONE_ANIMATING = 23;
    private static final int MSG_DISPATCH_DRAG_EVENT = 15;
    private static final int MSG_DISPATCH_DRAG_LOCATION_EVENT = 16;
    private static final int MSG_DISPATCH_GET_NEW_SURFACE = 9;
    private static final int MSG_DISPATCH_KEY = 7;
    private static final int MSG_DISPATCH_KEY_FROM_IME = 11;
    private static final int MSG_DISPATCH_SCREEN_STATE = 20;
    private static final int MSG_DISPATCH_SYSTEM_UI_VISIBILITY = 17;
    private static final int MSG_FINISH_INPUT_CONNECTION = 12;
    private static final int MSG_IME_FINISHED_EVENT = 10;
    private static final int MSG_INVALIDATE = 1;
    private static final int MSG_INVALIDATE_DISPLAY_LIST = 21;
    private static final int MSG_INVALIDATE_RECT = 2;
    private static final int MSG_INVALIDATE_WORLD = 24;
    private static final int MSG_PROCESS_INPUT_EVENTS = 19;
    private static final int MSG_RESIZED = 4;
    private static final int MSG_RESIZED_REPORT = 5;
    private static final int MSG_UPDATE_CONFIGURATION = 18;
    private static final int MSG_WINDOW_FOCUS_CHANGED = 6;
    private static final int MSG_WINDOW_MOVED = 25;
    private static final String PROPERTY_PROFILE_RENDERING = "viewancestor.profile_rendering";
    private static final String TAG = "ViewRootImpl";
    private static final boolean USE_RENDER_THREAD;
    private static LatencyTimer lt;
    static final Interpolator mResizeInterpolator = new AccelerateDecelerateInterpolator();
    static final ArrayList sConfigCallbacks = new ArrayList();
    static boolean sFirstDrawComplete = false;
    static final ArrayList sFirstDrawHandlers = new ArrayList();
    private static long sIdent = 0L;
    private static boolean sRenderThreadQueried = false;
    private static final Object sRenderThreadQueryLock[] = new Object[0];
    static final ThreadLocal sRunQueues = new ThreadLocal();
    private static boolean sUseRenderThread = false;
    View mAccessibilityFocusedHost;
    AccessibilityNodeInfo mAccessibilityFocusedVirtualView;
    AccessibilityInteractionConnectionManager mAccessibilityInteractionConnectionManager;
    AccessibilityInteractionController mAccessibilityInteractionController;
    final AccessibilityManager mAccessibilityManager;
    boolean mAdded;
    boolean mAddedTouchMode;
    boolean mAppVisible;
    final View.AttachInfo mAttachInfo;
    AudioManager mAudioManager;
    Choreographer mChoreographer;
    int mClientWindowLayoutFlags;
    final CompatibilityInfoHolder mCompatibilityInfo;
    boolean mConsumeBatchedInputScheduled;
    final ConsumeBatchedInputRunnable mConsumedBatchedInputRunnable = new ConsumeBatchedInputRunnable();
    int mCurScrollY;
    final Rect mCurrentDirty = new Rect();
    View mCurrentDragView;
    QueuedInputEvent mCurrentInputEvent;
    private KeyEvent mCurrentKeyEvent;
    private MotionEvent mCurrentMotion;
    private final int mDensity;
    Rect mDirty;
    final Display mDisplay;
    private final ArrayList mDisplayLists = new ArrayList(24);
    ClipDescription mDragDescription;
    final PointF mDragPoint = new PointF();
    boolean mDrawingAllowed;
    FallbackEventHandler mFallbackEventHandler;
    boolean mFirst;
    QueuedInputEvent mFirstPendingInputEvent;
    final Rect mFitSystemWindowsInsets = new Rect();
    boolean mFitSystemWindowsRequested;
    View mFocusedView;
    private int mFpsNumFrames;
    private long mFpsPrevTime;
    private long mFpsStartTime;
    boolean mFullRedrawNeeded;
    final ViewRootHandler mHandler = new ViewRootHandler();
    int mHardwareYOffset;
    boolean mHasHadWindowFocus;
    int mHeight;
    private SurfaceHolder mHolder;
    private long mIdent;
    InputChannel mInputChannel;
    protected final InputEventConsistencyVerifier mInputEventConsistencyVerifier;
    WindowInputEventReceiver mInputEventReceiver;
    final InputMethodCallback mInputMethodCallback = new InputMethodCallback(this);
    InputQueue mInputQueue;
    InputQueue.Callback mInputQueueCallback;
    final InvalidateOnAnimationRunnable mInvalidateOnAnimationRunnable = new InvalidateOnAnimationRunnable();
    boolean mIsAnimating;
    boolean mIsCreating;
    boolean mIsDrawing;
    boolean mIsInTraversal;
    private long mKeyEventStartTime;
    private String mKeyEventStatus;
    final Configuration mLastConfiguration = new Configuration();
    final ViewTreeObserver.InternalInsetsInfo mLastGivenInsets = new ViewTreeObserver.InternalInsetsInfo();
    boolean mLastInCompatMode;
    int mLastJoystickXDirection;
    int mLastJoystickXKeyCode;
    int mLastJoystickYDirection;
    int mLastJoystickYKeyCode;
    View mLastScrolledFocus;
    int mLastSystemUiVisibility;
    final PointF mLastTouchPoint = new PointF();
    long mLastTrackballTime;
    boolean mLastWasImTarget;
    boolean mLayoutRequested;
    volatile Object mLocalDragState;
    final WindowLeaked mLocation = new WindowLeaked(null);
    private long mMotionEventStartTime;
    private String mMotionEventStatus;
    boolean mNewSurfaceNeeded;
    private final int mNoncompatDensity;
    View mOldFocusedView;
    int mOrigWindowType;
    final Configuration mPendingConfiguration = new Configuration();
    final Rect mPendingContentInsets = new Rect();
    private ArrayList mPendingTransitions;
    final Rect mPendingVisibleInsets = new Rect();
    final Rect mPreviousDirty = new Rect();
    final Region mPreviousTransparentRegion = new Region();
    boolean mProcessInputEventsScheduled;
    private boolean mProfile;
    private boolean mProfileRendering;
    private QueuedInputEvent mQueuedInputEventPool;
    private int mQueuedInputEventPoolSize;
    View mRealFocusedView;
    private Thread mRenderProfiler;
    private volatile boolean mRenderProfilingEnabled;
    boolean mReportNextDraw;
    int mResizeAlpha;
    HardwareLayer mResizeBuffer;
    int mResizeBufferDuration;
    long mResizeBufferStartTime;
    final Paint mResizePaint = new Paint();
    boolean mScrollMayChange;
    int mScrollY;
    Scroller mScroller;
    SendWindowContentChangedAccessibilityEvent mSendWindowContentChangedAccessibilityEvent;
    int mSeq;
    private boolean mSoftInputMayChanged;
    int mSoftInputMode;
    boolean mStopped;
    private final Surface mSurface = new Surface();
    BaseSurfaceHolder mSurfaceHolder;
    SurfaceHolder.Callback2 mSurfaceHolderCallback;
    final int mTargetSdkVersion;
    HashSet mTempHashSet;
    final Rect mTempRect = new Rect();
    final Thread mThread = Thread.currentThread();
    final int mTmpLocation[] = new int[2];
    final TypedValue mTmpValue = new TypedValue();
    final TrackballAxis mTrackballAxisX = new TrackballAxis();
    final TrackballAxis mTrackballAxisY = new TrackballAxis();
    android.content.res.CompatibilityInfo.Translator mTranslator;
    final Region mTransparentRegion = new Region();
    int mTraversalBarrier;
    final TraversalRunnable mTraversalRunnable = new TraversalRunnable();
    boolean mTraversalScheduled;
    View mView;
    final ViewConfiguration mViewConfiguration;
    private int mViewLayoutDirectionInitial;
    int mViewVisibility;
    final Rect mVisRect = new Rect();
    int mWidth;
    boolean mWillDrawSoon;
    final Rect mWinFrame = new Rect();
    final W mWindow = new W(this);
    final WindowManager.LayoutParams mWindowAttributes = new WindowManager.LayoutParams();
    boolean mWindowAttributesChanged;
    int mWindowAttributesChangesFlag;
    final IWindowSession mWindowSession;
    boolean mWindowsAnimating;
    private Rect mYLWinFrame;

    public ViewRootImpl(Context context, Display display)
    {
        mLastTrackballTime = 0L;
        mAppVisible = true;
        mOrigWindowType = -1;
        mStopped = false;
        mLastInCompatMode = false;
        mWindowAttributesChanged = false;
        mWindowAttributesChangesFlag = 0;
        mFpsStartTime = -1L;
        mFpsPrevTime = -1L;
        mYLWinFrame = new Rect();
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 0);
        else
            inputeventconsistencyverifier = null;
        mInputEventConsistencyVerifier = inputeventconsistencyverifier;
        mProfile = false;
        mHolder = new SurfaceHolder() {

            final ViewRootImpl this$0;

            public void addCallback(SurfaceHolder.Callback callback)
            {
            }

            public Surface getSurface()
            {
                return mSurface;
            }

            public Rect getSurfaceFrame()
            {
                return null;
            }

            public boolean isCreating()
            {
                return false;
            }

            public Canvas lockCanvas()
            {
                return null;
            }

            public Canvas lockCanvas(Rect rect)
            {
                return null;
            }

            public void removeCallback(SurfaceHolder.Callback callback)
            {
            }

            public void setFixedSize(int i, int j)
            {
            }

            public void setFormat(int i)
            {
            }

            public void setKeepScreenOn(boolean flag)
            {
            }

            public void setSizeFromLayout()
            {
            }

            public void setType(int i)
            {
            }

            public void unlockCanvasAndPost(Canvas canvas)
            {
            }

            
            {
                this$0 = ViewRootImpl.this;
                super();
            }
        }
;
        mKeyEventStatus = "0: Finish handle input event";
        mMotionEventStatus = "0: Finish handle input event";
        mWindowSession = WindowManagerGlobal.getWindowSession(context.getMainLooper());
        mDisplay = display;
        CompatibilityInfoHolder compatibilityinfoholder = display.getCompatibilityInfo();
        if (compatibilityinfoholder == null)
            compatibilityinfoholder = new CompatibilityInfoHolder();
        mCompatibilityInfo = compatibilityinfoholder;
        mLocation.fillInStackTrace();
        mWidth = -1;
        mHeight = -1;
        mDirty = new Rect();
        mTargetSdkVersion = context.getApplicationInfo().targetSdkVersion;
        mViewVisibility = 8;
        mFirst = true;
        mAdded = false;
        mAccessibilityManager = AccessibilityManager.getInstance(context);
        mAccessibilityInteractionConnectionManager = new AccessibilityInteractionConnectionManager();
        mAccessibilityManager.addAccessibilityStateChangeListener(mAccessibilityInteractionConnectionManager);
        mAttachInfo = new View.AttachInfo(mWindowSession, mWindow, display, this, mHandler, this);
        mViewConfiguration = ViewConfiguration.get(context);
        mDensity = context.getResources().getDisplayMetrics().densityDpi;
        mNoncompatDensity = context.getResources().getDisplayMetrics().noncompatDensityDpi;
        mFallbackEventHandler = PolicyManager.makeNewFallbackEventHandler(context);
        mProfileRendering = Boolean.parseBoolean(SystemProperties.get("viewancestor.profile_rendering", "false"));
        mChoreographer = Choreographer.getInstance();
        PowerManager powermanager = (PowerManager)context.getSystemService("power");
        mAttachInfo.mScreenOn = powermanager.isScreenOn();
        loadSystemProperties();
        long l = sIdent;
        sIdent = 1L + l;
        mIdent = l;
        checkViewRootImplLogProperty();
        if (LOCAL_LOGV)
            enableLog(true);
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRootImpl construct: context = ").append(context).append(", mThread = ").append(mThread).append(", mChoreographer = ").append(mChoreographer).append(", mTraversalRunnable = ").append(mTraversalRunnable).append(", this = ").append(this).toString());
    }

    public static void addConfigCallback(ComponentCallbacks componentcallbacks)
    {
        synchronized (sConfigCallbacks)
        {
            sConfigCallbacks.add(componentcallbacks);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static void addFirstDrawHandler(Runnable runnable)
    {
        synchronized (sFirstDrawHandlers)
        {
            if (!sFirstDrawComplete)
                sFirstDrawHandlers.add(runnable);
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void applyKeepScreenOnFlag(WindowManager.LayoutParams layoutparams)
    {
        if (mAttachInfo.mKeepScreenOn)
        {
            layoutparams.flags = 0x80 | layoutparams.flags;
            return;
        } else
        {
            layoutparams.flags = 0xffffff7f & layoutparams.flags | 0x80 & mClientWindowLayoutFlags;
            return;
        }
    }

    private boolean checkForLeavingTouchModeAndConsume(KeyEvent keyevent)
    {
        if (mAttachInfo.mInTouchMode)
        {
            int i = keyevent.getAction();
            if ((i == 0 || i == 2) && (4 & keyevent.getFlags()) == 0)
            {
                if (isNavigationKey(keyevent))
                    return ensureTouchMode(false);
                if (isTypingKey(keyevent))
                {
                    ensureTouchMode(false);
                    return false;
                }
            }
        }
        return false;
    }

    private static void checkViewRootImplLogProperty()
    {
        boolean flag;
        String s;
        flag = true;
        s = SystemProperties.get("debug.viewroot.enable");
        if (s == null || s.length() <= 0) goto _L2; else goto _L1
_L1:
        int j = Integer.parseInt(s, 16);
        int i = j;
_L3:
        Xlog.d("ViewRootImpl", (new StringBuilder()).append("checkViewRootImplLogProperty: propString = ").append(s).append(",logFilter = #").append(Integer.toHexString(i)).toString());
        NumberFormatException numberformatexception;
        boolean flag1;
        boolean flag2;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        boolean flag6;
        boolean flag7;
        boolean flag8;
        boolean flag9;
        boolean flag10;
        boolean flag11;
        boolean flag12;
        boolean flag13;
        boolean flag14;
        boolean flag15;
        boolean flag16;
        if ((i & 1) == flag)
            flag1 = flag;
        else
            flag1 = false;
        LOCAL_LOGV = flag1;
        if ((i & 2) == 2)
            flag2 = flag;
        else
            flag2 = false;
        DEBUG_DRAW = flag2;
        if ((i & 4) == 4)
            flag3 = flag;
        else
            flag3 = false;
        DEBUG_LAYOUT = flag3;
        if ((i & 8) == 8)
            flag4 = flag;
        else
            flag4 = false;
        DEBUG_DIALOG = flag4;
        if ((i & 0x10) == 16)
            flag5 = flag;
        else
            flag5 = false;
        DEBUG_INPUT_RESIZE = flag5;
        if ((i & 0x20) == 32)
            flag6 = flag;
        else
            flag6 = false;
        DEBUG_ORIENTATION = flag6;
        if ((i & 0x40) == 64)
            flag7 = flag;
        else
            flag7 = false;
        DEBUG_TRACKBALL = flag7;
        if ((i & 0x80) == 128)
            flag8 = flag;
        else
            flag8 = false;
        DEBUG_IMF = flag8;
        if ((i & 0x100) == 256)
            flag9 = flag;
        else
            flag9 = false;
        DEBUG_CONFIGURATION = flag9;
        if ((i & 0x200) == 512)
            flag10 = flag;
        else
            flag10 = false;
        DBG = flag10;
        if ((i & 0x400) == 1024)
            flag11 = flag;
        else
            flag11 = false;
        DEBUG_FPS = flag11;
        if ((i & 0x800) == 2048)
            flag12 = flag;
        else
            flag12 = false;
        DEBUG_HWUI = flag12;
        if ((i & 0x1000) == 4096)
            flag13 = flag;
        else
            flag13 = false;
        DEBUG_INPUT = flag13;
        if (DEBUG_INPUT || (i & 0x2000) == 8192)
            flag14 = flag;
        else
            flag14 = false;
        DEBUG_KEY = flag14;
        if (DEBUG_INPUT || (i & 0x4000) == 16384)
            flag15 = flag;
        else
            flag15 = false;
        DEBUG_MOTION = flag15;
        if ((i & 0x8000) == 32768)
            flag16 = flag;
        else
            flag16 = false;
        DEBUG_IME_ANR = flag16;
        if ((i & 0x10000) != 0x10000)
            flag = false;
        DEBUG_LIFECYCLE = flag;
_L2:
        return;
        numberformatexception;
        Xlog.w("ViewRootImpl", (new StringBuilder()).append("Invalid format of propery string: ").append(s).toString());
        i = 0;
          goto _L3
    }

    private boolean collectViewAttributes()
    {
        boolean flag1;
label0:
        {
            View.AttachInfo attachinfo = mAttachInfo;
            boolean flag = attachinfo.mRecomputeGlobalAttributes;
            flag1 = false;
            if (!flag)
                break label0;
            attachinfo.mRecomputeGlobalAttributes = false;
            boolean flag2 = attachinfo.mKeepScreenOn;
            attachinfo.mKeepScreenOn = false;
            attachinfo.mSystemUiVisibility = 0;
            attachinfo.mHasSystemUiListeners = false;
            mView.dispatchCollectViewAttributes(attachinfo, 0);
            attachinfo.mSystemUiVisibility = attachinfo.mSystemUiVisibility & (-1 ^ attachinfo.mDisabledSystemUiVisibility);
            WindowManager.LayoutParams layoutparams = mWindowAttributes;
            if (attachinfo.mKeepScreenOn == flag2 && attachinfo.mSystemUiVisibility == layoutparams.subtreeSystemUiVisibility)
            {
                boolean flag3 = attachinfo.mHasSystemUiListeners;
                boolean flag4 = layoutparams.hasSystemUiListeners;
                flag1 = false;
                if (flag3 == flag4)
                    break label0;
            }
            applyKeepScreenOnFlag(layoutparams);
            layoutparams.subtreeSystemUiVisibility = attachinfo.mSystemUiVisibility;
            layoutparams.hasSystemUiListeners = attachinfo.mHasSystemUiListeners;
            mView.dispatchWindowSystemUiVisiblityChanged(attachinfo.mSystemUiVisibility);
            flag1 = true;
        }
        return flag1;
    }

    private void deliverGenericMotionEvent(QueuedInputEvent queuedinputevent)
    {
        mMotionEventStatus = "5 2: Deliver pointer event";
        MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onGenericMotionEvent(motionevent, 0);
        if (DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("deliverGenericMotionEvent: event = ").append(motionevent).append(", mAdded = ").append(mAdded).append(", mView = ").append(mView).append(",mLastWasImTarget = ").append(mLastWasImTarget).append(", this = ").append(this).toString());
        if (mView != null && mAdded && (1 & queuedinputevent.mFlags) == 0 && mLastWasImTarget)
        {
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            if (inputmethodmanager != null)
            {
                int i = motionevent.getSequenceNumber();
                if (DEBUG_INPUT || DEBUG_IMF)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Sending generic motion event to IME: seq=").append(i).append(" event=").append(motionevent).append(" this = ").append(this).toString());
                inputmethodmanager.dispatchGenericMotionEvent(mView.getContext(), i, motionevent, mInputMethodCallback);
                return;
            }
        }
        deliverGenericMotionEventPostIme(queuedinputevent);
    }

    private void deliverGenericMotionEventPostIme(QueuedInputEvent queuedinputevent)
    {
        MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
        boolean flag;
        if ((0x10 & motionevent.getSource()) != 0)
            flag = true;
        else
            flag = false;
        if (mView != null && mAdded)
        {
            if (mView.dispatchGenericMotionEvent(motionevent))
            {
                if (flag)
                    updateJoystickDirection(motionevent, false);
                finishInputEvent(queuedinputevent, true);
                return;
            }
            if (flag)
            {
                updateJoystickDirection(motionevent, true);
                finishInputEvent(queuedinputevent, true);
                return;
            } else
            {
                finishInputEvent(queuedinputevent, false);
                return;
            }
        }
        if (flag)
            updateJoystickDirection(motionevent, false);
        finishInputEvent(queuedinputevent, false);
    }

    private void deliverInputEvent(QueuedInputEvent queuedinputevent)
    {
        Trace.traceBegin(8L, "deliverInputEvent");
        if (!(queuedinputevent.mEvent instanceof KeyEvent)) goto _L2; else goto _L1
_L1:
        mKeyEventStatus = "4: Deliver input event";
        deliverKeyEvent(queuedinputevent);
_L3:
        Trace.traceEnd(8L);
        return;
_L2:
        int i;
        i = queuedinputevent.mEvent.getSource();
        mMotionEventStatus = "4: Deliver input event";
        if ((i & 2) == 0)
            break MISSING_BLOCK_LABEL_74;
        deliverPointerEvent(queuedinputevent);
          goto _L3
        Exception exception;
        exception;
        Trace.traceEnd(8L);
        throw exception;
        if ((i & 4) == 0)
            break MISSING_BLOCK_LABEL_88;
        deliverTrackballEvent(queuedinputevent);
          goto _L3
        deliverGenericMotionEvent(queuedinputevent);
          goto _L3
    }

    private void deliverKeyEvent(QueuedInputEvent queuedinputevent)
    {
        KeyEvent keyevent = (KeyEvent)queuedinputevent.mEvent;
        if (DEBUG_KEY || DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("deliverKeyEvent: event = ").append(keyevent).append(" to ").append(mView).append(" in ").append(this).append(",mAdded = ").append(mAdded).append(",q.mFlags = ").append(queuedinputevent.mFlags).toString());
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onKeyEvent(keyevent, 0);
        if (mView != null && mAdded && (1 & queuedinputevent.mFlags) == 0)
        {
            mKeyEventStatus = "5: Begin deliver key event";
            if (mView.dispatchKeyEventPreIme(keyevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            }
            if (mLastWasImTarget)
            {
                InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                if (inputmethodmanager != null)
                {
                    mKeyEventStatus = "6: Deliver key to imm";
                    int i = keyevent.getSequenceNumber();
                    if (DEBUG_IME_ANR || DEBUG_IMF || DEBUG_KEY || DEBUG_INPUT)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Sending key event to IME: seq=").append(i).append(", event=").append(keyevent).append(", this = ").append(this).toString());
                    inputmethodmanager.dispatchKeyEvent(mView.getContext(), i, keyevent, mInputMethodCallback);
                    return;
                }
            }
        }
        deliverKeyEventPostIme(queuedinputevent);
    }

    private void deliverKeyEventPostIme(QueuedInputEvent queuedinputevent)
    {
        KeyEvent keyevent = (KeyEvent)queuedinputevent.mEvent;
        if (DEBUG_KEY || DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("deliverKeyEventPostIme: event = ").append(keyevent).append(", mView = ").append(mView).append(", mAdded = ").append(mAdded).append(", this = ").append(this).toString());
        mKeyEventStatus = "7: Deliver key to view hierarchy";
        if (mView != null && mAdded)
        {
            if (checkForLeavingTouchModeAndConsume(keyevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            }
            mFallbackEventHandler.preDispatchKeyEvent(keyevent);
            if (mView.dispatchKeyEvent(keyevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            }
            if (keyevent.getAction() == 0 && keyevent.isCtrlPressed() && keyevent.getRepeatCount() == 0 && !KeyEvent.isModifierKey(keyevent.getKeyCode()) && mView.dispatchKeyShortcutEvent(keyevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            }
            if (mFallbackEventHandler.dispatchKeyEvent(keyevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            }
            if (keyevent.getAction() == 0)
            {
                int i = keyevent.getKeyCode();
                char c = '\0';
                switch (i)
                {
                case 61: // '='
                    if (keyevent.hasNoModifiers())
                    {
                        c = '\002';
                    } else
                    {
                        boolean flag4 = keyevent.hasModifiers(1);
                        c = '\0';
                        if (flag4)
                            c = '\001';
                    }
                    break;

                case 20: // '\024'
                    boolean flag3 = keyevent.hasNoModifiers();
                    c = '\0';
                    if (flag3)
                        c = '\202';
                    break;

                case 19: // '\023'
                    boolean flag2 = keyevent.hasNoModifiers();
                    c = '\0';
                    if (flag2)
                        c = '!';
                    break;

                case 22: // '\026'
                    boolean flag1 = keyevent.hasNoModifiers();
                    c = '\0';
                    if (flag1)
                        c = 'B';
                    break;

                case 21: // '\025'
                    boolean flag = keyevent.hasNoModifiers();
                    c = '\0';
                    if (flag)
                        c = '\021';
                    break;
                }
                if (c != 0)
                {
                    View view = mView.findFocus();
                    if (view != null)
                    {
                        View view1 = view.focusSearch(c);
                        if (view1 != null && view1 != view)
                        {
                            view.getFocusedRect(mTempRect);
                            if (mView instanceof ViewGroup)
                            {
                                ((ViewGroup)mView).offsetDescendantRectToMyCoords(view, mTempRect);
                                ((ViewGroup)mView).offsetRectIntoDescendantCoords(view1, mTempRect);
                            }
                            if (view1.requestFocus(c, mTempRect))
                            {
                                playSoundEffect(SoundEffectConstants.getContantForFocusDirection(c));
                                finishInputEvent(queuedinputevent, true);
                                return;
                            }
                        }
                        if (mView.dispatchUnhandledMove(view, c))
                        {
                            finishInputEvent(queuedinputevent, true);
                            return;
                        }
                    }
                }
            }
            finishInputEvent(queuedinputevent, false);
            return;
        } else
        {
            finishInputEvent(queuedinputevent, false);
            return;
        }
    }

    private void deliverPointerEvent(QueuedInputEvent queuedinputevent)
    {
        mMotionEventStatus = "5 0: Deliver pointer event";
        MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
        boolean flag = motionevent.isTouchEvent();
        if (DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("deliverPointerEvent: event = ").append(motionevent).append(", isTouchEvent = ").append(flag).append(",mView = ").append(mView).append(",mAdded = ").append(mAdded).append(", this = ").append(this).toString());
        if (mInputEventConsistencyVerifier != null)
            if (flag)
                mInputEventConsistencyVerifier.onTouchEvent(motionevent, 0);
            else
                mInputEventConsistencyVerifier.onGenericMotionEvent(motionevent, 0);
        if (mView != null && mAdded)
        {
            if (mTranslator != null)
                mTranslator.translateEventInScreenToAppWindow(motionevent);
            int i = motionevent.getAction();
            if (i == 0 || i == 8)
                ensureTouchMode(true);
            if (mCurScrollY != 0)
                motionevent.offsetLocation(0.0F, mCurScrollY);
            if (flag)
            {
                mLastTouchPoint.x = motionevent.getRawX();
                mLastTouchPoint.y = motionevent.getRawY();
            }
            if (i == 0)
            {
                Trace.traceBegin(8L, "action_down event coming");
                Trace.traceEnd(8L);
            }
            if (mView.dispatchPointerEvent(motionevent))
            {
                finishInputEvent(queuedinputevent, true);
                return;
            } else
            {
                finishInputEvent(queuedinputevent, false);
                return;
            }
        } else
        {
            finishInputEvent(queuedinputevent, false);
            return;
        }
    }

    private void deliverTrackballEvent(QueuedInputEvent queuedinputevent)
    {
        mMotionEventStatus = "5 1: Deliver pointer event";
        MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
        if (DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("deliverTrackballEvent: event = ").append(motionevent).append(",mAdded = ").append(mAdded).append(",q.mFlags = ").append(queuedinputevent.mFlags).append(",mLastWasImTarget = ").append(mLastWasImTarget).append(", this = ").append(this).toString());
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onTrackballEvent(motionevent, 0);
        if (mView != null && mAdded && (1 & queuedinputevent.mFlags) == 0 && mLastWasImTarget)
        {
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            if (inputmethodmanager != null)
            {
                int i = motionevent.getSequenceNumber();
                if (DEBUG_INPUT || DEBUG_IMF || DEBUG_IME_ANR)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Sending trackball event to IME: seq=").append(i).append(" event=").append(motionevent).append(" this = ").append(this).toString());
                inputmethodmanager.dispatchTrackballEvent(mView.getContext(), i, motionevent, mInputMethodCallback);
                return;
            }
        }
        deliverTrackballEventPostIme(queuedinputevent);
    }

    private void deliverTrackballEventPostIme(QueuedInputEvent queuedinputevent)
    {
        MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
        if (mView != null && mAdded)
        {
            if (mView.dispatchTrackballEvent(motionevent))
            {
                ensureTouchMode(false);
                finishInputEvent(queuedinputevent, true);
                mLastTrackballTime = 0xffffffff80000000L;
                return;
            }
            TrackballAxis trackballaxis = mTrackballAxisX;
            TrackballAxis trackballaxis1 = mTrackballAxisY;
            long l = SystemClock.uptimeMillis();
            if (250L + mLastTrackballTime < l)
            {
                trackballaxis.reset(0);
                trackballaxis1.reset(0);
                mLastTrackballTime = l;
            }
            int i = motionevent.getAction();
            int j = motionevent.getMetaState();
            switch (i)
            {
            case 1: // '\001'
                trackballaxis.reset(2);
                trackballaxis1.reset(2);
                enqueueInputEvent(new KeyEvent(l, l, 1, 23, 0, j, -1, 0, 1024, 257));
                break;

            case 0: // '\0'
                trackballaxis.reset(2);
                trackballaxis1.reset(2);
                enqueueInputEvent(new KeyEvent(l, l, 0, 23, 0, j, -1, 0, 1024, 257));
                break;
            }
            if (DEBUG_TRACKBALL)
                Log.v("ViewRootImpl", (new StringBuilder()).append("TB X=").append(trackballaxis.position).append(" step=").append(trackballaxis.step).append(" dir=").append(trackballaxis.dir).append(" acc=").append(trackballaxis.acceleration).append(" move=").append(motionevent.getX()).append(" / Y=").append(trackballaxis1.position).append(" step=").append(trackballaxis1.step).append(" dir=").append(trackballaxis1.dir).append(" acc=").append(trackballaxis1.acceleration).append(" move=").append(motionevent.getY()).toString());
            float f = trackballaxis.collect(motionevent.getX(), motionevent.getEventTime(), "X");
            float f1 = trackballaxis1.collect(motionevent.getY(), motionevent.getEventTime(), "Y");
            float f2 = 1.0F;
            byte byte0;
            int i1;
            if (f > f1)
            {
                i1 = trackballaxis.generate(2.0F / motionevent.getXPrecision());
                byte0 = 0;
                if (i1 != 0)
                {
                    if (i1 > 0)
                        byte0 = 22;
                    else
                        byte0 = 21;
                    f2 = trackballaxis.acceleration;
                    trackballaxis1.reset(2);
                }
            } else
            {
                int k = f1 != 0.0F;
                byte0 = 0;
                i1 = 0;
                if (k > 0)
                {
                    i1 = trackballaxis1.generate(2.0F / motionevent.getYPrecision());
                    byte0 = 0;
                    if (i1 != 0)
                    {
                        if (i1 > 0)
                            byte0 = 20;
                        else
                            byte0 = 19;
                        f2 = trackballaxis1.acceleration;
                        trackballaxis.reset(2);
                    }
                }
            }
            if (byte0 != 0)
            {
                if (i1 < 0)
                    i1 = -i1;
                int j1 = (int)(f2 * (float)i1);
                if (DEBUG_TRACKBALL)
                    Log.v("ViewRootImpl", (new StringBuilder()).append("Move: movement=").append(i1).append(" accelMovement=").append(j1).append(" accel=").append(f2).toString());
                if (j1 > i1)
                {
                    if (DEBUG_TRACKBALL)
                        Log.v("foo", (new StringBuilder()).append("Delivering fake DPAD: ").append(byte0).toString());
                    i1--;
                    int k1 = j1 - i1;
                    enqueueInputEvent(new KeyEvent(l, l, 2, byte0, k1, j, -1, 0, 1024, 257));
                }
                while (i1 > 0) 
                {
                    if (DEBUG_TRACKBALL)
                        Log.v("foo", (new StringBuilder()).append("Delivering fake DPAD: ").append(byte0).toString());
                    i1--;
                    l = SystemClock.uptimeMillis();
                    enqueueInputEvent(new KeyEvent(l, l, 0, byte0, 0, j, -1, 0, 1024, 257));
                    enqueueInputEvent(new KeyEvent(l, l, 1, byte0, 0, j, -1, 0, 1024, 257));
                }
                mLastTrackballTime = l;
            }
            finishInputEvent(queuedinputevent, true);
            return;
        } else
        {
            finishInputEvent(queuedinputevent, false);
            return;
        }
    }

    private void destroyHardwareRenderer()
    {
        View.AttachInfo attachinfo = mAttachInfo;
        HardwareRenderer hardwarerenderer = attachinfo.mHardwareRenderer;
        if (DEBUG_HWUI && isTargetPackage())
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("destroyHardwareRenderer: hardwareRenderer = ").append(hardwarerenderer).append(",mView = ").append(mView).append(",this = ").append(this).toString());
        if (hardwarerenderer != null)
        {
            if (mView != null)
                hardwarerenderer.destroyHardwareResources(mView);
            hardwarerenderer.destroy(true);
            hardwarerenderer.setRequested(false);
            attachinfo.mHardwareRenderer = null;
            attachinfo.mHardwareAccelerated = false;
        }
    }

    private void draw(boolean flag)
    {
        Surface surface = mSurface;
        if (surface != null && surface.isValid()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if (DEBUG_FPS)
            trackFPS();
        if (sFirstDrawComplete) goto _L4; else goto _L3
_L3:
        ArrayList arraylist = sFirstDrawHandlers;
        arraylist;
        JVM INSTR monitorenter ;
        int k;
        sFirstDrawComplete = true;
        k = sFirstDrawHandlers.size();
        int i1 = 0;
_L6:
        if (i1 >= k)
            break; /* Loop/switch isn't completed */
        mHandler.post((Runnable)sFirstDrawHandlers.get(i1));
        i1++;
        if (true) goto _L6; else goto _L5
_L5:
        arraylist;
        JVM INSTR monitorexit ;
_L4:
        View.AttachInfo attachinfo;
        boolean flag1;
        int i;
        float f;
        boolean flag2;
        int j;
        Rect rect;
        scrollToRectOrFocus(null, false);
        attachinfo = mAttachInfo;
        if (attachinfo.mViewScrollChanged)
        {
            attachinfo.mViewScrollChanged = false;
            attachinfo.mTreeObserver.dispatchOnScrollChanged();
        }
        HardwareLayer hardwarelayer;
        if (mScroller != null && mScroller.computeScrollOffset())
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
            i = mScroller.getCurrY();
        else
            i = mScrollY;
        if (mCurScrollY != i)
        {
            mCurScrollY = i;
            flag = true;
        }
        f = attachinfo.mApplicationScale;
        flag2 = attachinfo.mScalingRequired;
        hardwarelayer = mResizeBuffer;
        j = 0;
        if (hardwarelayer != null)
        {
            long l = SystemClock.uptimeMillis() - mResizeBufferStartTime;
            Exception exception;
            if (l < (long)mResizeBufferDuration)
            {
                float f1 = (float)l / (float)mResizeBufferDuration;
                float f2 = mResizeInterpolator.getInterpolation(f1);
                flag1 = true;
                j = 255 - (int)(255F * f2);
            } else
            {
                disposeResizeBuffer();
                j = 0;
            }
        }
        rect = mDirty;
        if (mSurfaceHolder != null)
        {
            rect.setEmpty();
            if (flag1)
            {
                if (mScroller != null)
                    mScroller.abortAnimation();
                disposeResizeBuffer();
                return;
            }
            continue; /* Loop/switch isn't completed */
        }
        break MISSING_BLOCK_LABEL_340;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
        if (flag)
        {
            attachinfo.mIgnoreDirtyState = true;
            rect.set(0, 0, (int)(0.5F + f * (float)mWidth), (int)(0.5F + f * (float)mHeight));
        }
        if (DEBUG_ORIENTATION || DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Draw ").append(mView).append("/").append(mWindowAttributes.getTitle()).append(": dirty={").append(rect.left).append(",").append(rect.top).append(",").append(rect.right).append(",").append(rect.bottom).append("} surface=").append(surface).append(" surface.isValid()=").append(surface.isValid()).append(", appScale = ").append(f).append(", width=").append(mWidth).append(", height=").append(mHeight).append(", mScrollY = ").append(mScrollY).append(", mCurScrollY = ").append(mCurScrollY).append(", animating = ").append(flag1).append(", mIsAnimating = ").append(mIsAnimating).append(", this = ").append(this).toString());
        attachinfo.mTreeObserver.dispatchOnDraw();
        if (rect.isEmpty() && !mIsAnimating) goto _L8; else goto _L7
_L7:
        if (attachinfo.mHardwareRenderer == null || !attachinfo.mHardwareRenderer.isEnabled()) goto _L10; else goto _L9
_L9:
        mIsAnimating = false;
        mHardwareYOffset = i;
        mResizeAlpha = j;
        mCurrentDirty.set(rect);
        mCurrentDirty.union(mPreviousDirty);
        mPreviousDirty.set(rect);
        rect.setEmpty();
        HardwareRenderer hardwarerenderer = attachinfo.mHardwareRenderer;
        View view = mView;
        Rect rect1;
        if (flag1)
            rect1 = null;
        else
            rect1 = mCurrentDirty;
        if (hardwarerenderer.draw(view, attachinfo, this, rect1))
            mPreviousDirty.set(0, 0, mWidth, mHeight);
_L8:
        if (flag1)
        {
            mFullRedrawNeeded = true;
            scheduleTraversals();
            return;
        }
        continue; /* Loop/switch isn't completed */
_L10:
        if (drawSoftware(surface, attachinfo, i, flag2, rect)) goto _L8; else goto _L11
_L11:
        if (DEBUG_DRAW)
        {
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("drawSoftware return: this = ").append(this).toString());
            return;
        }
        if (true) goto _L1; else goto _L12
_L12:
    }

    private void drawAccessibilityFocusedDrawableIfNeeded(Canvas canvas)
    {
label0:
        {
            AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(mView.mContext);
            if (!accessibilitymanager.isEnabled() || !accessibilitymanager.isTouchExplorationEnabled() || mAccessibilityFocusedHost == null || mAccessibilityFocusedHost.mAttachInfo == null)
                break label0;
            Drawable drawable = getAccessibilityFocusedDrawable();
            if (drawable == null)
                break label0;
            AccessibilityNodeProvider accessibilitynodeprovider = mAccessibilityFocusedHost.getAccessibilityNodeProvider();
            Rect rect = mView.mAttachInfo.mTmpInvalRect;
            if (accessibilitynodeprovider == null)
            {
                mAccessibilityFocusedHost.getBoundsOnScreen(rect);
            } else
            {
                if (mAccessibilityFocusedVirtualView == null)
                    break label0;
                mAccessibilityFocusedVirtualView.getBoundsInScreen(rect);
            }
            rect.offset(-mAttachInfo.mWindowLeft, -mAttachInfo.mWindowTop);
            rect.intersect(0, 0, mAttachInfo.mViewRootImpl.mWidth, mAttachInfo.mViewRootImpl.mHeight);
            drawable.setBounds(rect);
            drawable.draw(canvas);
            return;
        }
    }

    private boolean drawSoftware(Surface surface, View.AttachInfo attachinfo, int i, boolean flag, Rect rect)
    {
        Canvas canvas;
        int j1;
        if (attachinfo.mHardwareRenderer != null && !attachinfo.mHardwareRenderer.isEnabled() && attachinfo.mHardwareRenderer.isRequested())
        {
            mFullRedrawNeeded = true;
            scheduleTraversals();
            return false;
        }
        View view;
        float f;
        Context context;
        try
        {
            int j = rect.left;
            int k = rect.top;
            int l = rect.right;
            int i1 = rect.bottom;
            canvas = mSurface.lockCanvas(rect);
            if (j != rect.left || k != rect.top || l != rect.right || i1 != rect.bottom)
                attachinfo.mIgnoreDirtyState = true;
            canvas.setDensity(mDensity);
        }
        catch (Surface.OutOfResourcesException outofresourcesexception)
        {
            Log.e("ViewRootImpl", "OutOfResourcesException locking surface", outofresourcesexception);
            try
            {
                if (!mWindowSession.outOfMemory(mWindow))
                {
                    Slog.w("ViewRootImpl", "No processes killed for memory; killing self");
                    Process.killProcess(Process.myPid());
                }
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("ViewRootImpl", "RemoteException when call outOfMemory.", remoteexception);
            }
            mLayoutRequested = true;
            return false;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            Log.e("ViewRootImpl", "Could not lock surface", illegalargumentexception);
            mLayoutRequested = true;
            return false;
        }
        if (DEBUG_ORIENTATION || DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Surface ").append(surface).append(" drawing to bitmap w=").append(canvas.getWidth()).append(", h=").append(canvas.getHeight()).append(", this = ").append(this).toString());
        if (canvas.isOpaque() && i == 0)
            break MISSING_BLOCK_LABEL_228;
        canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        rect.setEmpty();
        mIsAnimating = false;
        attachinfo.mDrawingTime = SystemClock.uptimeMillis();
        view = mView;
        view.mPrivateFlags = 0x20 | view.mPrivateFlags;
        if (DEBUG_DRAW)
        {
            context = mView.getContext();
            Xlog.i("ViewRootImpl", (new StringBuilder()).append("Drawing view start+ : package:").append(context.getPackageName()).append(", metrics=").append(context.getResources().getDisplayMetrics()).append(", compatibilityInfo=").append(context.getResources().getCompatibilityInfo()).append(", this = ").append(this).toString());
        }
        f = -i;
        canvas.translate(0.0F, f);
        if (mTranslator != null)
            mTranslator.translateCanvas(canvas);
        if (!flag)
            break MISSING_BLOCK_LABEL_614;
        j1 = mNoncompatDensity;
_L1:
        canvas.setScreenDensity(j1);
        attachinfo.mSetIgnoreDirtyState = false;
        mView.draw(canvas);
        drawAccessibilityFocusedDrawableIfNeeded(canvas);
        if (!attachinfo.mSetIgnoreDirtyState)
            attachinfo.mIgnoreDirtyState = false;
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Drawing view end- : mView = ").append(mView).append(", this = ").append(this).toString());
        surface.unlockCanvasAndPost(canvas);
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Surface ").append(surface).append(" unlockCanvasAndPost, this = ").append(this).toString());
        return true;
        j1 = 0;
          goto _L1
        Exception exception1;
        exception1;
        if (!attachinfo.mSetIgnoreDirtyState)
            attachinfo.mIgnoreDirtyState = false;
        throw exception1;
        Exception exception;
        exception;
        surface.unlockCanvasAndPost(canvas);
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Surface ").append(surface).append(" unlockCanvasAndPost, this = ").append(this).toString());
        throw exception;
        IllegalArgumentException illegalargumentexception1;
        illegalargumentexception1;
        Xlog.e("ViewRootImpl", (new StringBuilder()).append("Could not unlock surface, surface = ").append(surface).append(", canvas = ").append(canvas).append(", this = ").append(this).toString(), illegalargumentexception1);
        mLayoutRequested = true;
_L3:
        return false;
        IllegalArgumentException illegalargumentexception2;
        illegalargumentexception2;
        Xlog.e("ViewRootImpl", (new StringBuilder()).append("Could not unlock surface, surface = ").append(surface).append(", canvas = ").append(canvas).append(", this = ").append(this).toString(), illegalargumentexception2);
        mLayoutRequested = true;
        if (true) goto _L3; else goto _L2
_L2:
    }

    private static void dumpViewAsBitmap(View view, String s)
    {
        Bitmap bitmap;
        while (view == null || s == null || !view.getContext().getPackageName().equals(s)) 
            return;
        bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
        view.dispatchDraw(new Canvas(bitmap));
        FileOutputStream fileoutputstream;
        String s1 = (new StringBuilder()).append("/data/dump/").append(DateFormat.format("yyyyMMdd_hhmmss", System.currentTimeMillis()).toString()).append(".png").toString();
        Xlog.d("ViewRootImpl", (new StringBuilder()).append("dumpViewInfo: fileName = ").append(s1).toString());
        File file = new File(s1);
        Xlog.d("ViewRootImpl", (new StringBuilder()).append("dumpViewInfo: file = ").append(file).toString());
        fileoutputstream = new FileOutputStream(file);
        if (fileoutputstream != null)
        {
            try
            {
                bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 90, fileoutputstream);
                fileoutputstream.flush();
                fileoutputstream.close();
                bitmap.recycle();
                Xlog.d("ViewRootImpl", "Bitmap dump successfully.");
                return;
            }
            catch (IOException ioexception)
            {
                Xlog.d("ViewRootImpl", (new StringBuilder()).append("Bitmap dump failed with exception ").append(ioexception).toString());
            }
            return;
        }
        Xlog.d("ViewRootImpl", "Bitmap dump failed.");
        return;
    }

    private void enableHardwareAcceleration(Context context, WindowManager.LayoutParams layoutparams)
    {
        boolean flag;
label0:
        {
            flag = true;
            mAttachInfo.mHardwareAccelerated = false;
            mAttachInfo.mHardwareAccelerationRequested = false;
            if (mTranslator == null)
            {
                boolean flag1;
                if ((0x1000000 & layoutparams.flags) != 0)
                    flag1 = flag;
                else
                    flag1 = false;
                if (flag1 && HardwareRenderer.isAvailable())
                {
                    boolean flag2;
                    if ((1 & layoutparams.privateFlags) != 0)
                        flag2 = flag;
                    else
                        flag2 = false;
                    boolean flag3;
                    if ((2 & layoutparams.privateFlags) != 0)
                        flag3 = flag;
                    else
                        flag3 = false;
                    if (!HardwareRenderer.sRendererDisabled || HardwareRenderer.sSystemRendererDisabled && flag3)
                        break label0;
                    if (flag2)
                    {
                        mAttachInfo.mHardwareAccelerationRequested = flag;
                        return;
                    }
                }
            }
            return;
        }
        if (!HardwareRenderer.sSystemRendererDisabled && Looper.getMainLooper() != Looper.myLooper())
        {
            Log.w("HardwareRenderer", "Attempting to initialize hardware acceleration outside of the main thread, aborting");
            return;
        }
        if (isRenderThreadRequested(context))
            Log.i("HardwareRenderer", "Render threat initiated");
        if (mAttachInfo.mHardwareRenderer != null)
            mAttachInfo.mHardwareRenderer.destroy(flag);
        boolean flag4;
        if (layoutparams.format != -1)
            flag4 = flag;
        else
            flag4 = false;
        mAttachInfo.mHardwareRenderer = HardwareRenderer.createGlRenderer(2, flag4);
        View.AttachInfo attachinfo = mAttachInfo;
        View.AttachInfo attachinfo1 = mAttachInfo;
        if (mAttachInfo.mHardwareRenderer == null)
            flag = false;
        attachinfo1.mHardwareAccelerationRequested = flag;
        attachinfo.mHardwareAccelerated = flag;
    }

    private boolean ensureTouchModeLocally(boolean flag)
    {
        if (DBG)
            Xlog.d("touchmode", (new StringBuilder()).append("ensureTouchModeLocally(").append(flag).append("), current ").append("touch mode is ").append(mAttachInfo.mInTouchMode).append(", this = ").append(this).toString());
        if (mAttachInfo.mInTouchMode == flag)
            return false;
        mAttachInfo.mInTouchMode = flag;
        mAttachInfo.mTreeObserver.dispatchOnTouchModeChanged(flag);
        if (flag)
            return enterTouchMode();
        else
            return leaveTouchMode();
    }

    private boolean enterTouchMode()
    {
        if (mView != null && mView.hasFocus())
        {
            View view = mView.findFocus();
            if (view != null && !view.isFocusableInTouchMode())
            {
                ViewGroup viewgroup = findAncestorToTakeFocusInTouchMode(view);
                if (viewgroup != null)
                {
                    return viewgroup.requestFocus();
                } else
                {
                    mView.unFocus();
                    mAttachInfo.mTreeObserver.dispatchOnGlobalFocusChange(view, null);
                    mFocusedView = null;
                    mOldFocusedView = null;
                    return true;
                }
            }
        }
        return false;
    }

    private static ViewGroup findAncestorToTakeFocusInTouchMode(View view)
    {
        ViewGroup viewgroup;
        for (ViewParent viewparent = view.getParent(); viewparent instanceof ViewGroup; viewparent = viewgroup.getParent())
        {
            viewgroup = (ViewGroup)viewparent;
            if (viewgroup.getDescendantFocusability() == 0x40000 && viewgroup.isFocusableInTouchMode())
                return viewgroup;
            if (viewgroup.isRootNamespace())
                return null;
        }

        return null;
    }

    private void finishInputEvent(QueuedInputEvent queuedinputevent, boolean flag)
    {
        if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("finishInputEvent: handled = ").append(flag).append(",event = ").append(queuedinputevent.mEvent).append(", this = ").append(this).toString());
        if (queuedinputevent.mEvent instanceof KeyEvent)
        {
            mCurrentKeyEvent = null;
            mKeyEventStatus = "0: Finish handle input event";
        } else
        {
            mCurrentMotion = null;
            mMotionEventStatus = "0: Finish handle input event";
        }
        if (queuedinputevent != mCurrentInputEvent)
            throw new IllegalStateException("finished input event out of order");
        if (queuedinputevent.mReceiver != null)
            queuedinputevent.mReceiver.finishInputEvent(queuedinputevent.mEvent, flag);
        else
            queuedinputevent.mEvent.recycleIfNeededAfterDispatch();
        recycleQueuedInputEvent(queuedinputevent);
        mCurrentInputEvent = null;
        if (mFirstPendingInputEvent != null)
            scheduleProcessInputEvents();
    }

    private static void forceLayout(View view)
    {
        view.forceLayout();
        if (view instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)view;
            int i = viewgroup.getChildCount();
            for (int j = 0; j < i; j++)
                forceLayout(viewgroup.getChildAt(j));

        }
    }

    private Drawable getAccessibilityFocusedDrawable()
    {
        if (mAttachInfo != null)
        {
            if (mAttachInfo.mAccessibilityFocusDrawable == null)
            {
                TypedValue typedvalue = new TypedValue();
                if (mView.mContext.getTheme().resolveAttribute(0x10103f8, typedvalue, true))
                    mAttachInfo.mAccessibilityFocusDrawable = mView.mContext.getResources().getDrawable(typedvalue.resourceId);
            }
            return mAttachInfo.mAccessibilityFocusDrawable;
        } else
        {
            return null;
        }
    }

    private AudioManager getAudioManager()
    {
        if (mView == null)
            throw new IllegalStateException("getAudioManager called when there is no mView");
        if (mAudioManager == null)
            mAudioManager = (AudioManager)mView.getContext().getSystemService("audio");
        return mAudioManager;
    }

    private View getCommonPredecessor(View view, View view1)
    {
        if (mAttachInfo != null)
        {
            if (mTempHashSet == null)
                mTempHashSet = new HashSet();
            HashSet hashset = mTempHashSet;
            hashset.clear();
            for (View view2 = view; view2 != null;)
            {
                hashset.add(view2);
                ViewParent viewparent1 = view2.mParent;
                if (viewparent1 instanceof View)
                    view2 = (View)viewparent1;
                else
                    view2 = null;
            }

            for (View view3 = view1; view3 != null;)
            {
                if (hashset.contains(view3))
                {
                    hashset.clear();
                    return view3;
                }
                ViewParent viewparent = view3.mParent;
                if (viewparent instanceof View)
                    view3 = (View)viewparent;
                else
                    view3 = null;
            }

            hashset.clear();
        }
        return null;
    }

    private static void getGfxInfo(View view, int ai[])
    {
        DisplayList displaylist = view.mDisplayList;
        ai[0] = 1 + ai[0];
        if (displaylist != null)
            ai[1] = ai[1] + displaylist.getSize();
        if (view instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)view;
            int i = viewgroup.getChildCount();
            for (int j = 0; j < i; j++)
                getGfxInfo(viewgroup.getChildAt(j), ai);

        }
    }

    private static int getRootMeasureSpec(int i, int j)
    {
        switch (j)
        {
        case -2: 
            return View.MeasureSpec.makeMeasureSpec(i, 0x80000000);

        case -1: 
            return View.MeasureSpec.makeMeasureSpec(i, 0x40000000);
        }
        return View.MeasureSpec.makeMeasureSpec(j, 0x40000000);
    }

    static RunQueue getRunQueue()
    {
        RunQueue runqueue = (RunQueue)sRunQueues.get();
        if (runqueue != null)
        {
            return runqueue;
        } else
        {
            RunQueue runqueue1 = new RunQueue();
            sRunQueues.set(runqueue1);
            return runqueue1;
        }
    }

    private void handleDragEvent(DragEvent dragevent)
    {
        if (DEBUG_INPUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("handleDragEvent: event = ").append(dragevent).append(", mView = ").append(mView).append(", mAdded = ").append(mAdded).append(", this = ").append(this).toString());
        if (mView == null || !mAdded) goto _L2; else goto _L1
_L1:
        int i = dragevent.mAction;
        if (i != 6) goto _L4; else goto _L3
_L3:
        mView.dispatchDragEvent(dragevent);
_L2:
        dragevent.recycle();
        return;
_L4:
        View view;
        boolean flag;
        if (i == 1)
        {
            mCurrentDragView = null;
            mDragDescription = dragevent.mClipDescription;
        } else
        {
            dragevent.mClipDescription = mDragDescription;
        }
        if (i == 2 || i == 3)
        {
            mDragPoint.set(dragevent.mX, dragevent.mY);
            if (mTranslator != null)
                mTranslator.translatePointInScreenToAppWindow(mDragPoint);
            if (mCurScrollY != 0)
                mDragPoint.offset(0.0F, mCurScrollY);
            dragevent.mX = mDragPoint.x;
            dragevent.mY = mDragPoint.y;
        }
        view = mCurrentDragView;
        flag = mView.dispatchDragEvent(dragevent);
        if (view == mCurrentDragView)
            break MISSING_BLOCK_LABEL_270;
        if (view == null)
            break MISSING_BLOCK_LABEL_250;
        mWindowSession.dragRecipientExited(mWindow);
        if (mCurrentDragView != null)
            mWindowSession.dragRecipientEntered(mWindow);
_L5:
        if (i == 3)
        {
            mDragDescription = null;
            RemoteException remoteexception1;
            try
            {
                Log.i("ViewRootImpl", (new StringBuilder()).append("Reporting drop result: ").append(flag).toString());
                mWindowSession.reportDropResult(mWindow, flag);
            }
            catch (RemoteException remoteexception)
            {
                Log.e("ViewRootImpl", "Unable to report drop result");
            }
        }
        if (i == 4)
            setLocalDragState(null);
          goto _L2
        remoteexception1;
        Slog.e("ViewRootImpl", "Unable to note drag target change");
          goto _L5
    }

    static boolean isInTouchMode()
    {
        IWindowSession iwindowsession;
        iwindowsession = WindowManagerGlobal.peekWindowSession();
        if (iwindowsession == null)
            break MISSING_BLOCK_LABEL_18;
        boolean flag = iwindowsession.getInTouchMode();
        return flag;
        RemoteException remoteexception;
        remoteexception;
        return false;
    }

    private static boolean isNavigationKey(KeyEvent keyevent)
    {
        switch (keyevent.getKeyCode())
        {
        case 19: // '\023'
        case 20: // '\024'
        case 21: // '\025'
        case 22: // '\026'
        case 23: // '\027'
        case 61: // '='
        case 62: // '>'
        case 66: // 'B'
        case 92: // '\\'
        case 93: // ']'
        case 122: // 'z'
        case 123: // '{'
            return true;
        }
        return false;
    }

    private static boolean isRenderThreadRequested(Context context)
    {
        return false;
    }

    private boolean isTargetPackage()
    {
        if (mView == null)
            return false;
        else
            return "com.android.launcher".equals(mView.getContext().getPackageName());
    }

    private static boolean isTypingKey(KeyEvent keyevent)
    {
        return keyevent.getUnicodeChar() > 0;
    }

    public static boolean isViewDescendantOf(View view, View view1)
    {
        if (view != view1)
        {
            ViewParent viewparent = view.getParent();
            if (!(viewparent instanceof ViewGroup) || !isViewDescendantOf((View)viewparent, view1))
                return false;
        }
        return true;
    }

    private static int joystickAxisValueToDirection(float f)
    {
        if (f >= 0.5F)
            return 1;
        return f > -0.5F ? 0 : -1;
    }

    private boolean leaveTouchMode()
    {
        if (mView != null)
        {
            if (mView.hasFocus())
            {
                mFocusedView = mView.findFocus();
                if (!(mFocusedView instanceof ViewGroup))
                    return false;
                if (((ViewGroup)mFocusedView).getDescendantFocusability() != 0x40000)
                    return false;
            }
            View view = focusSearch(null, 130);
            if (view != null)
                return view.requestFocus(130);
        }
        return false;
    }

    private boolean measureHierarchy(View view, WindowManager.LayoutParams layoutparams, Resources resources, int i, int j)
    {
        boolean flag1;
label0:
        {
            if (DEBUG_ORIENTATION || DEBUG_LAYOUT)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot measure+ ").append(view).append(" in display ").append(i).append("x").append(j).append(", lp = ").append(layoutparams).append(", this = ").append(this).toString());
            int k = ((ViewGroup.LayoutParams) (layoutparams)).width;
            boolean flag = false;
            if (k == -2)
            {
                DisplayMetrics displaymetrics = resources.getDisplayMetrics();
                resources.getValue(0x1050007, mTmpValue, true);
                int j1 = mTmpValue.type;
                int k1 = 0;
                if (j1 == 5)
                    k1 = (int)mTmpValue.getDimension(displaymetrics);
                if (DEBUG_DIALOG)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Window ").append(mView).append(": baseSize=").append(k1).append(", this = ").append(this).toString());
                flag = false;
                if (k1 != 0)
                {
                    flag = false;
                    if (i > k1)
                    {
                        int l1 = getRootMeasureSpec(k1, ((ViewGroup.LayoutParams) (layoutparams)).width);
                        int i2 = getRootMeasureSpec(j, ((ViewGroup.LayoutParams) (layoutparams)).height);
                        performMeasure(l1, i2);
                        if (DEBUG_DIALOG)
                            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Window ").append(mView).append(": measured (").append(view.getMeasuredWidth()).append(",").append(view.getMeasuredHeight()).append(") ").append(this).toString());
                        if ((0x1000000 & view.getMeasuredWidthAndState()) == 0)
                        {
                            flag = true;
                        } else
                        {
                            int j2 = (k1 + i) / 2;
                            if (DEBUG_DIALOG)
                                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Window ").append(mView).append(": next baseSize=").append(j2).append(" ").append(this).toString());
                            performMeasure(getRootMeasureSpec(j2, ((ViewGroup.LayoutParams) (layoutparams)).width), i2);
                            if (DEBUG_DIALOG)
                                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Window ").append(mView).append(": measured (").append(view.getMeasuredWidth()).append(",").append(view.getMeasuredHeight()).append(") ").append(this).toString());
                            int k2 = 0x1000000 & view.getMeasuredWidthAndState();
                            flag = false;
                            if (k2 == 0)
                            {
                                if (DEBUG_DIALOG)
                                    Xlog.v("ViewRootImpl", "Good!");
                                flag = true;
                            }
                        }
                    }
                }
            }
            flag1 = false;
            if (flag)
                break label0;
            performMeasure(getRootMeasureSpec(i, ((ViewGroup.LayoutParams) (layoutparams)).width), getRootMeasureSpec(j, ((ViewGroup.LayoutParams) (layoutparams)).height));
            if (mWidth == view.getMeasuredWidth())
            {
                int l = mHeight;
                int i1 = view.getMeasuredHeight();
                flag1 = false;
                if (l == i1)
                    break label0;
            }
            flag1 = true;
        }
        if (DBG)
        {
            System.out.println("======================================");
            System.out.println("performTraversals -- after measure");
            if (view == null);
        }
        if (DEBUG_ORIENTATION || DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot measure-: host measured size = (").append(view.getMeasuredWidth()).append("x").append(view.getMeasuredHeight()).append("), windowSizeMayChange = ").append(flag1).append(", this = ").append(this).toString());
        return flag1;
    }

    private QueuedInputEvent obtainQueuedInputEvent(InputEvent inputevent, InputEventReceiver inputeventreceiver, int i)
    {
        QueuedInputEvent queuedinputevent = mQueuedInputEventPool;
        if (queuedinputevent != null)
        {
            mQueuedInputEventPoolSize = -1 + mQueuedInputEventPoolSize;
            mQueuedInputEventPool = queuedinputevent.mNext;
            queuedinputevent.mNext = null;
        } else
        {
            queuedinputevent = new QueuedInputEvent();
        }
        queuedinputevent.mEvent = inputevent;
        queuedinputevent.mReceiver = inputeventreceiver;
        queuedinputevent.mFlags = i;
        return queuedinputevent;
    }

    private void performDraw()
    {
        if (mAttachInfo.mScreenOn || mReportNextDraw) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag;
        flag = mFullRedrawNeeded;
        mFullRedrawNeeded = false;
        mIsDrawing = true;
        Trace.traceBegin(8L, "draw");
        draw(flag);
        View.AttachInfo attachinfo1 = mAttachInfo;
        if (attachinfo1 != null)
            attachinfo1.mTreeObserver.dispatchOnPostDraw();
        mIsDrawing = false;
        Trace.traceEnd(8L);
        if (!mReportNextDraw) goto _L1; else goto _L3
_L3:
        mReportNextDraw = false;
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("FINISHED DRAWING: ").append(mWindowAttributes.getTitle()).append(", this = ").append(this).toString());
        if (mSurfaceHolder != null && mSurface.isValid())
        {
            mSurfaceHolderCallback.surfaceRedrawNeeded(mSurfaceHolder);
            SurfaceHolder.Callback acallback[] = mSurfaceHolder.getCallbacks();
            if (acallback != null)
            {
                int i = acallback.length;
                for (int j = 0; j < i; j++)
                {
                    SurfaceHolder.Callback callback = acallback[j];
                    if (callback instanceof SurfaceHolder.Callback2)
                        ((SurfaceHolder.Callback2)callback).surfaceRedrawNeeded(mSurfaceHolder);
                }

            }
        }
        break MISSING_BLOCK_LABEL_263;
        Exception exception;
        exception;
        View.AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
            attachinfo.mTreeObserver.dispatchOnPostDraw();
        mIsDrawing = false;
        Trace.traceEnd(8L);
        throw exception;
        try
        {
            mWindowSession.finishDrawing(mWindow);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("ViewRootImpl", (new StringBuilder()).append("Exception when finish draw window ").append(mWindow).append(" in ").append(this).toString(), remoteexception);
        }
        return;
    }

    private void performLayout()
    {
        View view;
        mLayoutRequested = false;
        mScrollMayChange = true;
        view = mView;
        if (DEBUG_ORIENTATION || DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Laying out ").append(view).append(" in ").append(this).append(" to (").append(view.getMeasuredWidth()).append(", ").append(view.getMeasuredHeight()).append(")").toString());
        Trace.traceBegin(8L, "layout");
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
        Trace.traceEnd(8L);
        return;
        Exception exception;
        exception;
        Trace.traceEnd(8L);
        throw exception;
    }

    private void performMeasure(int i, int j)
    {
        Trace.traceBegin(8L, "measure");
        mView.measure(i, j);
        Trace.traceEnd(8L);
        return;
        Exception exception;
        exception;
        Trace.traceEnd(8L);
        throw exception;
    }

    private void performTraversals()
    {
        View view;
        boolean flag;
        boolean flag1;
        WindowManager.LayoutParams layoutparams;
        View.AttachInfo attachinfo;
        int i;
        boolean flag2;
        WindowManager.LayoutParams layoutparams1;
        boolean flag4;
        Rect rect;
        int j;
        int k;
        boolean flag5;
        boolean flag6;
        int l;
        view = mView;
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot performTraversals+ : mFirst = ").append(mFirst).append(", this = ").append(this).toString());
        if (DBG)
        {
            System.out.println("======================================");
            System.out.println("performTraversals");
            if (view == null);
        }
        if (view == null || !mAdded)
            return;
        mIsInTraversal = true;
        mWillDrawSoon = true;
        flag = false;
        flag1 = false;
        layoutparams = mWindowAttributes;
        attachinfo = mAttachInfo;
        i = getHostVisibility();
        boolean flag3;
        if (mViewVisibility != i || mNewSurfaceNeeded)
            flag2 = true;
        else
            flag2 = false;
        flag3 = mWindowAttributesChanged;
        layoutparams1 = null;
        flag4 = false;
        if (flag3)
        {
            mWindowAttributesChanged = false;
            flag4 = true;
            layoutparams1 = layoutparams;
        }
        if (mCompatibilityInfo.get().supportsScreen() == mLastInCompatMode)
        {
            layoutparams1 = layoutparams;
            mFullRedrawNeeded = true;
            mLayoutRequested = true;
            int j7;
            int k7;
            View.AttachInfo attachinfo1;
            Point point1;
            if (mLastInCompatMode)
            {
                int j8 = 0xdfffffff & layoutparams1.flags;
                layoutparams1.flags = j8;
                mLastInCompatMode = false;
            } else
            {
                int i8 = 0x20000000 | layoutparams1.flags;
                layoutparams1.flags = i8;
                mLastInCompatMode = true;
            }
        }
        mWindowAttributesChangesFlag = 0;
        rect = mWinFrame;
        if (!mFirst) goto _L2; else goto _L1
_L1:
        mFullRedrawNeeded = true;
        mLayoutRequested = true;
        if (layoutparams.type == 2014)
        {
            point1 = new Point();
            mDisplay.getRealSize(point1);
            j = point1.x;
            k = point1.y;
        } else
        {
            DisplayMetrics displaymetrics1 = mView.getContext().getResources().getDisplayMetrics();
            j = displaymetrics1.widthPixels;
            k = displaymetrics1.heightPixels;
        }
        attachinfo.mSurface = mSurface;
        attachinfo.mUse32BitDrawingCache = true;
        attachinfo.mHasWindowFocus = false;
        attachinfo.mWindowVisibility = i;
        attachinfo.mRecomputeGlobalAttributes = false;
        flag2 = false;
        mLastConfiguration.setTo(view.getResources().getConfiguration());
        mLastSystemUiVisibility = mAttachInfo.mSystemUiVisibility;
        if (mViewLayoutDirectionInitial == 2)
            view.setLayoutDirection(mLastConfiguration.getLayoutDirection());
        view.dispatchAttachedToWindow(attachinfo, 0);
        mFitSystemWindowsInsets.set(mAttachInfo.mContentInsets);
        view.fitSystemWindows(mFitSystemWindowsInsets);
_L5:
        if (flag2)
        {
            attachinfo.mWindowVisibility = i;
            view.dispatchWindowVisibilityChanged(i);
            if (i != 0 || mNewSurfaceNeeded)
                destroyHardwareResources();
            if (i == 8)
                mHasHadWindowFocus = false;
        }
        getRunQueue().executeActions(attachinfo.mHandler);
        if (mLayoutRequested && !mStopped)
            flag5 = true;
        else
            flag5 = false;
        flag6 = false;
        if (flag5)
        {
            Resources resources = mView.getContext().getResources();
            if (mFirst)
            {
                attachinfo1 = mAttachInfo;
                boolean flag33;
                int l7;
                if (!mAddedTouchMode)
                    flag33 = true;
                else
                    flag33 = false;
                attachinfo1.mInTouchMode = flag33;
                ensureTouchModeLocally(mAddedTouchMode);
            } else
            {
                boolean flag32 = mPendingContentInsets.equals(mAttachInfo.mContentInsets);
                flag6 = false;
                if (!flag32)
                {
                    if (DEBUG_LAYOUT)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Content insets changing from ").append(mPendingContentInsets).append(" to: ").append(mAttachInfo.mContentInsets).append(", this = ").append(this).toString());
                    flag6 = true;
                }
                if (!mPendingVisibleInsets.equals(mAttachInfo.mVisibleInsets))
                {
                    mAttachInfo.mVisibleInsets.set(mPendingVisibleInsets);
                    if (DEBUG_LAYOUT)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Visible insets changing to: ").append(mAttachInfo.mVisibleInsets).append(", mWinFrame = ").append(mWinFrame).append(", this = ").append(this).toString());
                }
                if (((ViewGroup.LayoutParams) (layoutparams)).width == -2 || ((ViewGroup.LayoutParams) (layoutparams)).height == -2)
                {
                    flag = true;
                    if (layoutparams.type == 2014)
                    {
                        Point point = new Point();
                        mDisplay.getRealSize(point);
                        j = point.x;
                        k = point.y;
                    } else
                    {
                        DisplayMetrics displaymetrics = resources.getDisplayMetrics();
                        j = displaymetrics.widthPixels;
                        k = displaymetrics.heightPixels;
                    }
                }
            }
            flag |= measureHierarchy(view, layoutparams, resources, j, k);
        }
        if (collectViewAttributes())
            layoutparams1 = layoutparams;
        if (attachinfo.mForceReportNewAttributes)
        {
            attachinfo.mForceReportNewAttributes = false;
            layoutparams1 = layoutparams;
        }
        if (!mFirst && !attachinfo.mViewVisibilityChanged)
            break MISSING_BLOCK_LABEL_1306;
        attachinfo.mViewVisibilityChanged = false;
        l = 0xf0 & mSoftInputMode;
        if (DEBUG_INPUT_RESIZE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Handle input resize mode start+ : lp.softInputMode = #").append(Integer.toHexString(layoutparams.softInputMode)).append(", resizeMode = #").append(Integer.toHexString(l)).append(", this = ").append(this).toString());
        if (l != 0)
            break MISSING_BLOCK_LABEL_1243;
        j7 = attachinfo.mScrollContainers.size();
        for (k7 = 0; k7 < j7; k7++)
            if (((View)attachinfo.mScrollContainers.get(k7)).isShown())
                l = 16;

        break MISSING_BLOCK_LABEL_1199;
_L2:
        j = rect.width();
        k = rect.height();
        if (j != mWidth) goto _L4; else goto _L3
_L3:
        l7 = mHeight;
        flag = false;
        if (k == l7) goto _L5; else goto _L4
_L4:
        if (DEBUG_ORIENTATION || DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("View ").append(view).append(" resized to: ").append(rect).append(",this = ").append(this).toString());
        mFullRedrawNeeded = true;
        mLayoutRequested = true;
        flag = true;
          goto _L5
        if (l == 0)
            l = 32;
        if ((0xf0 & layoutparams.softInputMode) != l)
        {
            layoutparams.softInputMode = l | 0xffffff0f & layoutparams.softInputMode;
            layoutparams1 = layoutparams;
        }
        if (DEBUG_INPUT_RESIZE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Handle input resize mode end- : lp.softInputMode = #").append(Integer.toHexString(layoutparams.softInputMode)).append(", resizeMode = #").append(Integer.toHexString(l)).append(", this = ").append(this).toString());
        boolean flag7;
        boolean flag8;
        int i1;
        boolean flag9;
        boolean flag10;
        boolean flag11;
        boolean flag12;
        int k5;
        boolean flag23;
        boolean flag24;
        boolean flag29;
        HardwareCanvas hardwarecanvas;
        HardwareCanvas hardwarecanvas1;
        boolean flag30;
        int i7;
        if (layoutparams1 != null && (0x200 & view.mPrivateFlags) != 0 && !PixelFormat.formatHasAlpha(layoutparams1.format))
            layoutparams1.format = -3;
        if (mFitSystemWindowsRequested)
        {
            mFitSystemWindowsRequested = false;
            mFitSystemWindowsInsets.set(mAttachInfo.mContentInsets);
            view.fitSystemWindows(mFitSystemWindowsInsets);
            if (mLayoutRequested)
                flag |= measureHierarchy(view, layoutparams, mView.getContext().getResources(), j, k);
        }
        if (flag5)
            mLayoutRequested = false;
        if (mSoftInputMayChanged)
        {
            flag6 = true;
            mSoftInputMayChanged = false;
        }
        SurfaceHolder.Callback acallback2[];
        int i5;
        int j5;
        int l5;
        Configuration configuration;
        boolean flag25;
        HardwareRenderer hardwarerenderer;
        boolean flag26;
        boolean flag28;
        int j6;
        int k6;
        int l6;
        float f;
        DisplayList displaylist;
        if (flag5 && flag && (mWidth != view.getMeasuredWidth() || mHeight != view.getMeasuredHeight() || ((ViewGroup.LayoutParams) (layoutparams)).width == -2 && rect.width() < j && rect.width() != mWidth || ((ViewGroup.LayoutParams) (layoutparams)).height == -2 && rect.height() < k && rect.height() != mHeight))
            flag7 = true;
        else
            flag7 = false;
        flag8 = attachinfo.mTreeObserver.hasComputeInternalInsetsListeners();
        i1 = 0;
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot adjustSize+ : mFirst=").append(mFirst).append(", windowShouldResize=").append(flag7).append(", insetsChanged=").append(flag6).append(", viewVisibilityChanged=").append(flag2).append(", params=").append(layoutparams1).append(", this = ").append(this).toString());
        if (!mFirst && !flag7 && !flag6 && !flag2 && layoutparams1 == null) goto _L7; else goto _L6
_L6:
        flag9 = false;
        if (i == 0)
            if (flag8 && (mFirst || flag2))
                flag9 = true;
            else
                flag9 = false;
        if (mSurfaceHolder != null)
        {
            mSurfaceHolder.mSurfaceLock.lock();
            mDrawingAllowed = true;
        }
        flag10 = false;
        flag11 = mSurface.isValid();
        if (DEBUG_LAYOUT)
            Xlog.i("ViewRootImpl", (new StringBuilder()).append("host=w:").append(view.getMeasuredWidth()).append(", h:").append(view.getMeasuredHeight()).append(", params=").append(layoutparams1).append(" surface=").append(mSurface).append(",hadSurface = ").append(flag11).append(", this = ").append(this).toString());
        k5 = mSurface.getGenerationId();
        i1 = relayoutWindow(layoutparams1, i, flag9);
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("relayout: frame=").append(rect.toShortString()).append(" content=").append(mPendingContentInsets.toShortString()).append(" visible=").append(mPendingVisibleInsets.toShortString()).append(" surface=").append(mSurface).append(",valid = ").append(mSurface.isValid()).append(",surfaceGenerationId = ").append(k5).append(", relayoutResult = ").append(i1).append(", this = ").append(this).toString());
        l5 = mPendingConfiguration.seq;
        flag10 = false;
        flag1 = false;
        if (l5 == 0)
            break MISSING_BLOCK_LABEL_2059;
        if (DEBUG_CONFIGURATION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Visible with new config: ").append(mPendingConfiguration).append(", this = ").append(this).toString());
        configuration = mPendingConfiguration;
        if (!mFirst)
            flag23 = true;
        else
            flag23 = false;
        updateConfiguration(configuration, flag23);
        mPendingConfiguration.seq = 0;
        if (!mPendingContentInsets.equals(mAttachInfo.mContentInsets))
            flag10 = true;
        else
            flag10 = false;
        if (!mPendingVisibleInsets.equals(mAttachInfo.mVisibleInsets))
            flag24 = true;
        else
            flag24 = false;
        if (!flag10) goto _L9; else goto _L8
_L8:
        if (mWidth <= 0 || mHeight <= 0) goto _L11; else goto _L10
_L10:
        flag1 = false;
        if (layoutparams == null) goto _L11; else goto _L12
_L12:
        if ((0x600 & (layoutparams.systemUiVisibility | layoutparams.subtreeSystemUiVisibility)) != 0 || mSurface == null || !mSurface.isValid() || mAttachInfo.mTurnOffWindowResizeAnim || mAttachInfo.mHardwareRenderer == null || !mAttachInfo.mHardwareRenderer.isEnabled() || !mAttachInfo.mHardwareRenderer.validate()) goto _L11; else goto _L13
_L13:
        flag1 = false;
        if (layoutparams == null) goto _L11; else goto _L14
_L14:
        flag28 = PixelFormat.formatHasAlpha(layoutparams.format);
        flag1 = false;
        if (flag28) goto _L11; else goto _L15
_L15:
        disposeResizeBuffer();
        flag29 = false;
        hardwarecanvas = mAttachInfo.mHardwareRenderer.getCanvas();
        hardwarecanvas1 = null;
        if (mResizeBuffer != null) goto _L17; else goto _L16
_L16:
        mResizeBuffer = mAttachInfo.mHardwareRenderer.createHardwareLayer(mWidth, mHeight, false);
_L60:
        hardwarecanvas1 = mResizeBuffer.start(hardwarecanvas);
        j6 = mWidth;
        k6 = mHeight;
        hardwarecanvas1.setViewport(j6, k6);
        hardwarecanvas1.onPreDraw(null);
        l6 = hardwarecanvas1.save();
        RemoteException remoteexception;
        OutOfMemoryError outofmemoryerror;
        if (mScroller != null && mScroller.computeScrollOffset())
            flag30 = true;
        else
            flag30 = false;
        if (!flag30) goto _L19; else goto _L18
_L18:
        i7 = mScroller.getCurrY();
        mScroller.abortAnimation();
_L37:
        f = -i7;
        hardwarecanvas1.translate(0.0F, f);
        if (mTranslator != null)
            mTranslator.translateCanvas(hardwarecanvas1);
        displaylist = mView.mDisplayList;
        if (displaylist == null) goto _L21; else goto _L20
_L20:
        hardwarecanvas1.drawDisplayList(displaylist, null, 1);
_L38:
        drawAccessibilityFocusedDrawableIfNeeded(hardwarecanvas1);
        mResizeBufferStartTime = SystemClock.uptimeMillis();
        mResizeBufferDuration = mView.getResources().getInteger(0x10e0001);
        flag29 = true;
        hardwarecanvas1.restoreToCount(l6);
        if (hardwarecanvas1 == null)
            break MISSING_BLOCK_LABEL_2473;
        hardwarecanvas1.onPostDraw();
        if (mResizeBuffer == null) goto _L11; else goto _L22
_L22:
        mResizeBuffer.end(hardwarecanvas);
        if (flag29) goto _L11; else goto _L23
_L23:
        mResizeBuffer.destroy();
        mResizeBuffer = null;
_L11:
        mAttachInfo.mContentInsets.set(mPendingContentInsets);
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Content insets changing to: ").append(mAttachInfo.mContentInsets).append(", mResizeBuffer = ").append(mResizeBuffer).append(", mResizeAlpha = ").append(mResizeAlpha).append(", this = ").append(this).toString());
_L9:
        if (flag10)
            break MISSING_BLOCK_LABEL_2620;
        if (mLastSystemUiVisibility == mAttachInfo.mSystemUiVisibility && !mFitSystemWindowsRequested)
            break MISSING_BLOCK_LABEL_2659;
        mLastSystemUiVisibility = mAttachInfo.mSystemUiVisibility;
        mFitSystemWindowsRequested = false;
        mFitSystemWindowsInsets.set(mAttachInfo.mContentInsets);
        view.fitSystemWindows(mFitSystemWindowsInsets);
        if (!flag24)
            break MISSING_BLOCK_LABEL_2726;
        mAttachInfo.mVisibleInsets.set(mPendingVisibleInsets);
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Visible insets changing to: ").append(mAttachInfo.mVisibleInsets).append(", this = ").append(this).toString());
        if (flag11) goto _L25; else goto _L24
_L24:
        flag25 = mSurface.isValid();
        flag12 = false;
        flag1 = false;
        if (!flag25)
            break MISSING_BLOCK_LABEL_2891;
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Create new surface: ").append(mSurface).append(",surfaceGenerationId = ").append(k5).append(", mSurface.getGenerationId() = ").append(mSurface.getGenerationId()).append(",mPreviousTransparentRegion = ").append(mPreviousTransparentRegion).append(",this = ").append(this).toString());
        flag1 = true;
        mFullRedrawNeeded = true;
        mPreviousTransparentRegion.setEmpty();
        hardwarerenderer = mAttachInfo.mHardwareRenderer;
        flag12 = false;
        if (hardwarerenderer == null)
            break MISSING_BLOCK_LABEL_2891;
        flag26 = mAttachInfo.mHardwareRenderer.initialize(mHolder.getSurface());
        flag12 = flag26;
_L39:
        if (DEBUG_ORIENTATION || DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Relayout returned: frame=").append(rect).append(", surface=").append(mSurface).append(", this = ").append(this).toString());
        attachinfo.mWindowLeft = rect.left;
        attachinfo.mWindowTop = rect.top;
        if (mWidth != rect.width() || mHeight != rect.height())
        {
            mWidth = rect.width();
            mHeight = rect.height();
        }
        if (mSurfaceHolder == null) goto _L27; else goto _L26
_L26:
        if (mSurface.isValid())
            mSurfaceHolder.mSurface = mSurface;
        mSurfaceHolder.setSurfaceFrameSize(mWidth, mHeight);
        mSurfaceHolder.mSurfaceLock.unlock();
        if (!mSurface.isValid()) goto _L29; else goto _L28
_L28:
        if (flag11) goto _L31; else goto _L30
_L30:
        mSurfaceHolder.ungetCallbacks();
        mIsCreating = true;
        mSurfaceHolderCallback.surfaceCreated(mSurfaceHolder);
        acallback2 = mSurfaceHolder.getCallbacks();
        if (acallback2 != null)
        {
            i5 = acallback2.length;
            for (j5 = 0; j5 < i5; j5++)
                acallback2[j5].surfaceCreated(mSurfaceHolder);

        }
          goto _L32
_L17:
        if (mResizeBuffer.getWidth() != mWidth || mResizeBuffer.getHeight() != mHeight)
            mResizeBuffer.resize(mWidth, mHeight);
        continue; /* Loop/switch isn't completed */
        outofmemoryerror;
        Log.w("ViewRootImpl", "Not enough memory for content change anim buffer", outofmemoryerror);
        if (hardwarecanvas1 == null) goto _L34; else goto _L33
_L33:
        hardwarecanvas1.onPostDraw();
_L34:
        if (mResizeBuffer == null) goto _L11; else goto _L35
_L35:
        mResizeBuffer.end(hardwarecanvas);
        if (flag29) goto _L11; else goto _L36
_L36:
        mResizeBuffer.destroy();
        mResizeBuffer = null;
          goto _L11
_L19:
        i7 = mScrollY;
          goto _L37
_L21:
        mView.draw(hardwarecanvas1);
          goto _L38
        Exception exception1;
        exception1;
        if (hardwarecanvas1 == null)
            break MISSING_BLOCK_LABEL_3368;
        hardwarecanvas1.onPostDraw();
        if (mResizeBuffer == null)
            break MISSING_BLOCK_LABEL_3401;
        mResizeBuffer.end(hardwarecanvas);
        if (flag29)
            break MISSING_BLOCK_LABEL_3401;
        mResizeBuffer.destroy();
        mResizeBuffer = null;
        throw exception1;
        Surface.OutOfResourcesException outofresourcesexception;
        outofresourcesexception;
        Log.e("ViewRootImpl", "OutOfResourcesException initializing HW surface", outofresourcesexception);
        if (!mWindowSession.outOfMemory(mWindow) && Process.myUid() != 1000)
        {
            Slog.w("ViewRootImpl", "No processes killed for memory; killing self");
            Process.killProcess(Process.myPid());
        }
_L40:
        try
        {
            mLayoutRequested = true;
            return;
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            Xlog.e("ViewRootImpl", (new StringBuilder()).append("RemoteException happens in ").append(this).toString(), remoteexception);
            flag12 = false;
        }
          goto _L39
        RemoteException remoteexception3;
        remoteexception3;
        Xlog.e("ViewRootImpl", "RemoteException when call outOfMemory.", outofresourcesexception);
          goto _L40
_L25:
        HardwareRenderer hardwarerenderer2;
        if (mSurface.isValid())
            break MISSING_BLOCK_LABEL_3654;
        mLastScrolledFocus = null;
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Surface invalid: ").append(mSurface).append(",surfaceGenerationId = ").append(k5).append(", mAttachInfo.mHardwareRenderer = ").append(mAttachInfo.mHardwareRenderer).append(",this = ").append(this).toString());
        mCurScrollY = 0;
        mScrollY = 0;
        if (mScroller != null)
            mScroller.abortAnimation();
        disposeResizeBuffer();
        hardwarerenderer2 = mAttachInfo.mHardwareRenderer;
        flag12 = false;
        flag1 = false;
        if (hardwarerenderer2 == null) goto _L39; else goto _L41
_L41:
        boolean flag27 = mAttachInfo.mHardwareRenderer.isEnabled();
        flag12 = false;
        flag1 = false;
        if (!flag27) goto _L39; else goto _L42
_L42:
        mAttachInfo.mHardwareRenderer.destroy(true);
        flag12 = false;
        flag1 = false;
          goto _L39
        int i6 = mSurface.getGenerationId();
        flag12 = false;
        flag1 = false;
        if (k5 == i6) goto _L39; else goto _L43
_L43:
        BaseSurfaceHolder basesurfaceholder = mSurfaceHolder;
        flag12 = false;
        flag1 = false;
        if (basesurfaceholder != null) goto _L39; else goto _L44
_L44:
        HardwareRenderer hardwarerenderer1 = mAttachInfo.mHardwareRenderer;
        flag12 = false;
        flag1 = false;
        if (hardwarerenderer1 == null) goto _L39; else goto _L45
_L45:
        mFullRedrawNeeded = true;
        mAttachInfo.mHardwareRenderer.updateSurface(mHolder.getSurface());
        flag12 = false;
        flag1 = false;
          goto _L39
        Surface.OutOfResourcesException outofresourcesexception1;
        outofresourcesexception1;
        Log.e("ViewRootImpl", "OutOfResourcesException updating HW surface", outofresourcesexception1);
        if (!mWindowSession.outOfMemory(mWindow))
        {
            Slog.w("ViewRootImpl", "No processes killed for memory; killing self");
            Process.killProcess(Process.myPid());
        }
_L46:
        mLayoutRequested = true;
        return;
        RemoteException remoteexception4;
        remoteexception4;
        Xlog.e("ViewRootImpl", "RemoteException when call outOfMemory.", remoteexception4);
        if (true) goto _L46; else goto _L32
_L32:
        flag4 = true;
_L31:
        if (flag4)
        {
            mSurfaceHolderCallback.surfaceChanged(mSurfaceHolder, layoutparams.format, mWidth, mHeight);
            SurfaceHolder.Callback acallback1[] = mSurfaceHolder.getCallbacks();
            if (acallback1 != null)
            {
                int k4 = acallback1.length;
                for (int l4 = 0; l4 < k4; l4++)
                    acallback1[l4].surfaceChanged(mSurfaceHolder, layoutparams.format, mWidth, mHeight);

            }
        }
        mIsCreating = false;
_L27:
        boolean flag13;
        boolean flag14;
        boolean flag16;
        boolean flag17;
        if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled() && (flag12 || flag7 || mWidth != mAttachInfo.mHardwareRenderer.getWidth() || mHeight != mAttachInfo.mHardwareRenderer.getHeight()))
        {
            mAttachInfo.mHardwareRenderer.setup(mWidth, mHeight);
            if (!flag12)
            {
                mAttachInfo.mHardwareRenderer.invalidate(mHolder.getSurface());
                mFullRedrawNeeded = true;
            }
        }
        if (!mStopped)
        {
            int l1;
            int i2;
            boolean flag18;
            InputMethodManager inputmethodmanager;
            View view1;
            View view2;
            int j2;
            int k2;
            View view3;
            StringBuilder stringbuilder;
            boolean flag20;
            View view4;
            String s;
            boolean flag21;
            SurfaceHolder.Callback acallback[];
            Exception exception;
            int i4;
            int j4;
            if ((i1 & 1) != 0)
                flag21 = true;
            else
                flag21 = false;
            if (ensureTouchModeLocally(flag21) || mWidth != view.getMeasuredWidth() || mHeight != view.getMeasuredHeight() || flag10)
            {
                int l2 = getRootMeasureSpec(mWidth, ((ViewGroup.LayoutParams) (layoutparams)).width);
                int i3 = getRootMeasureSpec(mHeight, ((ViewGroup.LayoutParams) (layoutparams)).height);
                if (DEBUG_LAYOUT)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Ooops, something changed! mWidth=").append(mWidth).append(" measuredWidth=").append(view.getMeasuredWidth()).append(" mHeight=").append(mHeight).append(" measuredHeight=").append(view.getMeasuredHeight()).append(" contentInsetsChanged=").append(flag10).append(" this = ").append(this).toString());
                performMeasure(l2, i3);
                int j3 = view.getMeasuredWidth();
                int k3 = view.getMeasuredHeight();
                int l3 = layoutparams.horizontalWeight != 0.0F;
                boolean flag22 = false;
                if (l3 > 0)
                {
                    j3 += (int)((float)(mWidth - j3) * layoutparams.horizontalWeight);
                    l2 = View.MeasureSpec.makeMeasureSpec(j3, 0x40000000);
                    flag22 = true;
                }
                if (layoutparams.verticalWeight > 0.0F)
                {
                    k3 += (int)((float)(mHeight - k3) * layoutparams.verticalWeight);
                    i3 = View.MeasureSpec.makeMeasureSpec(k3, 0x40000000);
                    flag22 = true;
                }
                if (flag22)
                {
                    if (DEBUG_LAYOUT)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("And hey let's measure once more: width=").append(j3).append(" height=").append(k3).append(" this = ").append(this).toString());
                    performMeasure(l2, i3);
                }
                flag5 = true;
            }
        }
_L57:
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot adjustSize- , frame = ").append(rect).append(", host.getMeasuredWidth() = ").append(view.getMeasuredWidth()).append(", host.getMeasuredHeight() = ").append(view.getMeasuredHeight()).append(", this = ").append(this).toString());
        if (flag5 && !mStopped)
            flag13 = true;
        else
            flag13 = false;
        if (flag13 || attachinfo.mRecomputeGlobalAttributes)
            flag14 = true;
        else
            flag14 = false;
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot layout+ : layoutRequested = ").append(flag5).append(", mStopped = ").append(mStopped).append(", this = ").append(this).toString());
        if (flag13)
        {
            performLayout();
            if ((0x200 & view.mPrivateFlags) != 0)
            {
                view.getLocationInWindow(mTmpLocation);
                mTransparentRegion.set(mTmpLocation[0], mTmpLocation[1], (mTmpLocation[0] + view.mRight) - view.mLeft, (mTmpLocation[1] + view.mBottom) - view.mTop);
                if (DEBUG_DRAW)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot gatherTransparentRegion+ : mTransparentRegion = ").append(mTransparentRegion).append(", mTmpLocation = ").append(mTmpLocation).append(",host = ").append(view).append(", this = ").append(this).toString());
                view.gatherTransparentRegion(mTransparentRegion);
                if (mTranslator != null)
                    mTranslator.translateRegionInWindowToScreen(mTransparentRegion);
                if (DEBUG_DRAW)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot gatherTransparentRegion- : mTransparentRegion = ").append(mTransparentRegion).append(",mWindow = ").append(mWindow).append(", mPreviousTransparentRegion = ").append(mPreviousTransparentRegion).append(", this = ").append(this).toString());
                if (!mTransparentRegion.equals(mPreviousTransparentRegion))
                {
                    mPreviousTransparentRegion.set(mTransparentRegion);
                    boolean flag31;
                    try
                    {
                        mWindowSession.setTransparentRegion(mWindow, mTransparentRegion);
                    }
                    catch (RemoteException remoteexception2)
                    {
                        Xlog.e("ViewRootImpl", (new StringBuilder()).append("Exception in ").append(this).append(" when set transparent region.").toString(), remoteexception2);
                    }
                }
            }
            if (DBG)
            {
                System.out.println("======================================");
                System.out.println("performTraversals -- after setFrame");
                if (view != null)
                    view.debug();
            }
        }
        if (flag14)
        {
            attachinfo.mRecomputeGlobalAttributes = false;
            attachinfo.mTreeObserver.dispatchOnGlobalLayout();
            if (AccessibilityManager.getInstance(view.mContext).isEnabled())
                postSendWindowContentChangedCallback(mView);
        }
        if (DEBUG_LAYOUT)
        {
            flag20 = view instanceof ViewGroup;
            view4 = null;
            if (flag20)
                view4 = ((ViewGroup)view).getChildAt(0);
            s = (new StringBuilder()).append("ViewRoot layout- : host.mLeft=").append(view.mLeft).append(", host.mRight=").append(view.mRight).append(", host.mTop=").append(view.mTop).append(", host.mBottom=").append(view.mBottom).append(", computesInternalInsets = ").append(flag8).append(",content = ").append(view4).append(", this = ").append(this).toString();
            if (view4 != null)
                s = (new StringBuilder()).append(s).append(",content padding = (").append(view4.mPaddingLeft).append(",").append(view4.mPaddingTop).append(",").append(view4.mPaddingRight).append(",").append(view4.mPaddingBottom).append(")").toString();
            Xlog.v("ViewRootImpl", s);
        }
        if (flag8)
        {
            ViewTreeObserver.InternalInsetsInfo internalinsetsinfo = attachinfo.mGivenInternalInsets;
            internalinsetsinfo.reset();
            attachinfo.mTreeObserver.dispatchOnComputeInternalInsets(internalinsetsinfo);
            if (flag9 || !mLastGivenInsets.equals(internalinsetsinfo))
            {
                mLastGivenInsets.set(internalinsetsinfo);
                Rect rect1;
                Rect rect2;
                Region region;
                if (mTranslator != null)
                {
                    rect1 = mTranslator.getTranslatedContentInsets(internalinsetsinfo.contentInsets);
                    rect2 = mTranslator.getTranslatedVisibleInsets(internalinsetsinfo.visibleInsets);
                    region = mTranslator.getTranslatedTouchableArea(internalinsetsinfo.touchableRegion);
                } else
                {
                    rect1 = internalinsetsinfo.contentInsets;
                    rect2 = internalinsetsinfo.visibleInsets;
                    region = internalinsetsinfo.touchableRegion;
                }
                try
                {
                    mWindowSession.setInsets(mWindow, internalinsetsinfo.mTouchableInsets, rect1, rect2, region);
                }
                catch (RemoteException remoteexception1)
                {
                    Xlog.e("ViewRootImpl", (new StringBuilder()).append("RemoteException happens when setInsets, mWindow = ").append(mWindow).append(", contentInsets = ").append(rect1).append(", visibleInsets = ").append(rect2).append(", touchableRegion = ").append(region).append(", this = ").append(this).toString(), remoteexception1);
                }
            }
        }
        if (mFirst)
        {
            if (DEBUG_INPUT_RESIZE)
            {
                stringbuilder = (new StringBuilder()).append("First: mView.hasFocus()=");
                Object obj;
                if (mView != null)
                    obj = Boolean.valueOf(mView.hasFocus());
                else
                    obj = "null";
                Xlog.v("ViewRootImpl", stringbuilder.append(obj).append(", relayoutResult = ").append(i1).append(", this = ").append(this).toString());
            }
            if (mView != null)
                if (!mView.hasFocus())
                {
                    mView.requestFocus(2);
                    view3 = mView.findFocus();
                    mRealFocusedView = view3;
                    mFocusedView = view3;
                    if (DEBUG_INPUT_RESIZE)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("First: requested focused view=").append(mFocusedView).append(", this = ").append(this).toString());
                } else
                {
                    mRealFocusedView = mView.findFocus();
                    if (DEBUG_INPUT_RESIZE)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("First: existing focused view=").append(mRealFocusedView).append(", this = ").append(this).toString());
                }
            k2 = i1 & 8;
            flag16 = false;
            if (k2 != 0)
            {
                if (DEBUG_DRAW)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Set mWindowsAnimating to true, this = ").append(this).toString());
                mWindowsAnimating = true;
            }
        } else
        {
            boolean flag15 = mWindowsAnimating;
            flag16 = false;
            if (flag15)
                flag16 = true;
        }
        mFirst = false;
        mWillDrawSoon = false;
        mNewSurfaceNeeded = false;
        mViewVisibility = i;
        if (mAttachInfo.mHasWindowFocus)
        {
            flag18 = WindowManager.LayoutParams.mayUseInputMethod(mWindowAttributes.flags);
            if (flag18 != mLastWasImTarget)
            {
                mLastWasImTarget = flag18;
                inputmethodmanager = InputMethodManager.peekInstance();
                if (inputmethodmanager != null && flag18)
                {
                    inputmethodmanager.startGettingWindowFocus(mView);
                    view1 = mView;
                    view2 = mView.findFocus();
                    j2 = mWindowAttributes.softInputMode;
                    boolean flag19;
                    if (!mHasHadWindowFocus)
                        flag19 = true;
                    else
                        flag19 = false;
                    inputmethodmanager.onWindowFocus(view1, view2, j2, flag19, mWindowAttributes.flags);
                }
            }
        }
        if ((i1 & 2) != 0)
            mReportNextDraw = true;
        if (attachinfo.mTreeObserver.dispatchOnPreDraw() || i != 0)
            flag17 = true;
        else
            flag17 = false;
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot draw+ , cancelDraw=").append(flag17).append(", viewVisibility=").append(i).append(", newSurface=").append(flag1).append(", mFullRedrawNeeded = ").append(mFullRedrawNeeded).append(", mReportNextDraw=").append(mReportNextDraw).append(", skipDraw = ").append(flag16).append(", mWindowsAnimating = ").append(mWindowsAnimating).append(", this = ").append(this).toString());
        if (flag17 || flag1) goto _L48; else goto _L47
_L47:
        if (flag16 && !mReportNextDraw) goto _L50; else goto _L49
_L49:
        if (mPendingTransitions == null || mPendingTransitions.size() <= 0) goto _L52; else goto _L51
_L51:
        l1 = 0;
_L55:
        i2 = mPendingTransitions.size();
        if (l1 >= i2) goto _L54; else goto _L53
_L53:
        ((LayoutTransition)mPendingTransitions.get(l1)).startChangingAnimations();
        l1++;
          goto _L55
_L29:
        if (!flag11) goto _L27; else goto _L56
_L56:
        mSurfaceHolder.ungetCallbacks();
        acallback = mSurfaceHolder.getCallbacks();
        mSurfaceHolderCallback.surfaceDestroyed(mSurfaceHolder);
        if (acallback != null)
        {
            i4 = acallback.length;
            for (j4 = 0; j4 < i4; j4++)
                acallback[j4].surfaceDestroyed(mSurfaceHolder);

        }
        mSurfaceHolder.mSurfaceLock.lock();
        mSurfaceHolder.mSurface = new Surface();
        mSurfaceHolder.mSurfaceLock.unlock();
          goto _L27
        exception;
        mSurfaceHolder.mSurfaceLock.unlock();
        throw exception;
_L7:
        if (attachinfo.mWindowLeft != rect.left || attachinfo.mWindowTop != rect.top)
            flag31 = true;
        else
            flag31 = false;
        flag9 = false;
        flag1 = false;
        i1 = 0;
        if (flag31)
        {
            if (mTranslator != null)
                mTranslator.translateRectInScreenToAppWinFrame(rect);
            attachinfo.mWindowLeft = rect.left;
            attachinfo.mWindowTop = rect.top;
            flag9 = false;
            flag1 = false;
            i1 = 0;
        }
          goto _L57
_L54:
        mPendingTransitions.clear();
_L52:
        performDraw();
_L50:
        if (DEBUG_DRAW || DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("ViewRoot performTraversals and draw- : mResizeBuffer = ").append(mResizeBuffer).append(", mResizeAlpha = ").append(mResizeAlpha).append(", this = ").append(this).toString());
        mIsInTraversal = false;
        return;
_L48:
        if (i == 0)
            scheduleTraversals();
        else
        if (mPendingTransitions != null && mPendingTransitions.size() > 0)
        {
            int j1 = 0;
            do
            {
                int k1 = mPendingTransitions.size();
                if (j1 >= k1)
                    break;
                ((LayoutTransition)mPendingTransitions.get(j1)).endChangingAnimations();
                j1++;
            } while (true);
            mPendingTransitions.clear();
        }
        if (true) goto _L50; else goto _L58
_L58:
        if (true) goto _L60; else goto _L59
_L59:
    }

    private void postSendWindowContentChangedCallback(View view)
    {
        if (mSendWindowContentChangedAccessibilityEvent == null)
            mSendWindowContentChangedAccessibilityEvent = new SendWindowContentChangedAccessibilityEvent();
        View view1 = mSendWindowContentChangedAccessibilityEvent.mSource;
        if (view1 == null)
        {
            mSendWindowContentChangedAccessibilityEvent.mSource = view;
            mHandler.postDelayed(mSendWindowContentChangedAccessibilityEvent, ViewConfiguration.getSendRecurringAccessibilityEventsInterval());
            return;
        } else
        {
            mSendWindowContentChangedAccessibilityEvent.mSource = getCommonPredecessor(view1, view);
            return;
        }
    }

    private void profileRendering(boolean flag)
    {
label0:
        {
            if (mProfileRendering)
            {
                mRenderProfilingEnabled = flag;
                if (mRenderProfiler != null)
                    break label0;
                mRenderProfiler = new Thread(new Runnable() {

                    final ViewRootImpl this$0;

                    public void run()
                    {
                        Log.d("ViewRootImpl", "Starting profiling thread");
                        while (mRenderProfilingEnabled) 
                        {
                            mAttachInfo.mHandler.post(new Runnable() {

                                final _cls1 this$1;

                                public void run()
                                {
                                    mDirty.set(0, 0, mWidth, mHeight);
                                    scheduleTraversals();
                                }

            
            {
                this$1 = _cls1.this;
                super();
            }
                            }
);
                            try
                            {
                                Thread.sleep(15L);
                            }
                            catch (InterruptedException interruptedexception)
                            {
                                Log.d("ViewRootImpl", "Exiting profiling thread");
                            }
                        }
                    }

            
            {
                this$0 = ViewRootImpl.this;
                super();
            }
                }
, "Rendering Profiler");
                mRenderProfiler.start();
            }
            return;
        }
        mRenderProfiler.interrupt();
        mRenderProfiler = null;
    }

    private void recycleQueuedInputEvent(QueuedInputEvent queuedinputevent)
    {
        queuedinputevent.mEvent = null;
        queuedinputevent.mReceiver = null;
        if (mQueuedInputEventPoolSize < 10)
        {
            mQueuedInputEventPoolSize = 1 + mQueuedInputEventPoolSize;
            queuedinputevent.mNext = mQueuedInputEventPool;
            mQueuedInputEventPool = queuedinputevent;
        }
    }

    private int relayoutWindow(WindowManager.LayoutParams layoutparams, int i, boolean flag)
        throws RemoteException
    {
        float f = mAttachInfo.mApplicationScale;
        boolean flag1 = false;
        if (layoutparams != null)
        {
            android.content.res.CompatibilityInfo.Translator translator = mTranslator;
            flag1 = false;
            if (translator != null)
            {
                flag1 = true;
                layoutparams.backup();
                mTranslator.translateWindowLayout(layoutparams);
            }
        }
        mPendingConfiguration.seq = 0;
        if (DEBUG_LAYOUT)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append(">>>>>> CALLING relayoutW+ ").append(mWindow).append(", params = ").append(layoutparams).append(",viewVisibility = ").append(i).append(", insetsPending = ").append(flag).append(", appScale = ").append(f).append(", mWinFrame = ").append(mWinFrame).append(", mSeq = ").append(mSeq).append(", mPendingContentInsets = ").append(mPendingContentInsets).append(", mPendingVisibleInsets = ").append(mPendingVisibleInsets).append(", mPendingConfiguration = ").append(mPendingConfiguration).append(", mSurface = ").append(mSurface).append(",valid = ").append(mSurface.isValid()).append(", mOrigWindowType = ").append(mOrigWindowType).append(",this = ").append(this).toString());
        if (layoutparams != null && mOrigWindowType != layoutparams.type && mTargetSdkVersion < 14)
        {
            Slog.w("ViewRootImpl", (new StringBuilder()).append("Window type can not be changed after the window is added; ignoring change of ").append(mView).toString());
            layoutparams.type = mOrigWindowType;
        }
        IWindowSession iwindowsession = mWindowSession;
        W w = mWindow;
        int j = mSeq;
        int k = (int)(0.5F + f * (float)mView.getMeasuredWidth());
        int l = (int)(0.5F + f * (float)mView.getMeasuredHeight());
        int i1;
        if (flag)
            i1 = 1;
        else
            i1 = 0;
        int j1 = iwindowsession.relayout(w, j, layoutparams, k, l, i, i1, mWinFrame, mPendingContentInsets, mPendingVisibleInsets, mPendingConfiguration, mSurface);
        if (DEBUG_LAYOUT)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append("<<<<<< BACK FROM relayoutW- : res = ").append(j1).append(", mWinFrame = ").append(mWinFrame).append(", mPendingContentInsets = ").append(mPendingContentInsets).append(", mPendingVisibleInsets = ").append(mPendingVisibleInsets).append(", mPendingConfiguration = ").append(mPendingConfiguration).append(", mSurface = ").append(mSurface).append(",valid = ").append(mSurface.isValid()).append(",params = ").append(layoutparams).append(", this = ").append(this).toString());
        if (flag1)
            layoutparams.restore();
        if (mTranslator != null)
        {
            mTranslator.translateRectInScreenToAppWinFrame(mWinFrame);
            mTranslator.translateRectInScreenToAppWindow(mPendingContentInsets);
            mTranslator.translateRectInScreenToAppWindow(mPendingVisibleInsets);
        }
        return j1;
    }

    private void removeSendWindowContentChangedCallback()
    {
        if (mSendWindowContentChangedAccessibilityEvent != null)
            mHandler.removeCallbacks(mSendWindowContentChangedAccessibilityEvent);
    }

    private void scheduleProcessInputEvents()
    {
        if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("scheduleProcessInputEvents: mFirstPendingInputEvent = ");
            Object obj;
            if (mFirstPendingInputEvent != null)
                obj = mFirstPendingInputEvent.mEvent;
            else
                obj = "";
            Xlog.v("ViewRootImpl", stringbuilder.append(obj).append(",mProcessInputEventsScheduled = ").append(mProcessInputEventsScheduled).append(", this = ").append(this).toString());
        }
        if (!mProcessInputEventsScheduled)
        {
            mKeyEventStatus = "3 2: Schedule process input event";
            mProcessInputEventsScheduled = true;
            Message message = mHandler.obtainMessage(19);
            message.setAsynchronous(true);
            mHandler.sendMessage(message);
        }
    }

    private void trackFPS()
    {
        long l = System.currentTimeMillis();
        if (mFpsStartTime < 0L)
        {
            mFpsPrevTime = l;
            mFpsStartTime = l;
            mFpsNumFrames = 0;
        } else
        {
            mFpsNumFrames = 1 + mFpsNumFrames;
            String s = Integer.toHexString(System.identityHashCode(this));
            long l1 = l - mFpsPrevTime;
            long l2 = l - mFpsStartTime;
            Log.v("ViewRootImpl", (new StringBuilder()).append("0x").append(s).append("\tFrame time:\t").append(l1).toString());
            mFpsPrevTime = l;
            if (l2 > 1000L)
            {
                float f = (1000F * (float)mFpsNumFrames) / (float)l2;
                Log.v("ViewRootImpl", (new StringBuilder()).append("0x").append(s).append("\tFPS:\t").append(f).toString());
                mFpsStartTime = l;
                mFpsNumFrames = 0;
                return;
            }
        }
    }

    private void updateJoystickDirection(MotionEvent motionevent, boolean flag)
    {
        long l = motionevent.getEventTime();
        int i = motionevent.getMetaState();
        int j = motionevent.getDeviceId();
        int k = motionevent.getSource();
        int i1 = joystickAxisValueToDirection(motionevent.getAxisValue(15));
        if (i1 == 0)
            i1 = joystickAxisValueToDirection(motionevent.getX());
        int j1 = joystickAxisValueToDirection(motionevent.getAxisValue(16));
        if (j1 == 0)
            j1 = joystickAxisValueToDirection(motionevent.getY());
        if (i1 != mLastJoystickXDirection)
        {
            if (mLastJoystickXKeyCode != 0)
            {
                enqueueInputEvent(new KeyEvent(l, l, 1, mLastJoystickXKeyCode, 0, i, j, 0, 1024, k));
                mLastJoystickXKeyCode = 0;
            }
            mLastJoystickXDirection = i1;
            if (i1 != 0 && flag)
            {
                int l1;
                if (i1 > 0)
                    l1 = 22;
                else
                    l1 = 21;
                mLastJoystickXKeyCode = l1;
                enqueueInputEvent(new KeyEvent(l, l, 0, mLastJoystickXKeyCode, 0, i, j, 0, 1024, k));
            }
        }
        if (j1 != mLastJoystickYDirection)
        {
            if (mLastJoystickYKeyCode != 0)
            {
                enqueueInputEvent(new KeyEvent(l, l, 1, mLastJoystickYKeyCode, 0, i, j, 0, 1024, k));
                mLastJoystickYKeyCode = 0;
            }
            mLastJoystickYDirection = j1;
            if (j1 != 0 && flag)
            {
                int k1;
                if (j1 > 0)
                    k1 = 20;
                else
                    k1 = 19;
                mLastJoystickYKeyCode = k1;
                enqueueInputEvent(new KeyEvent(l, l, 0, mLastJoystickYKeyCode, 0, i, j, 0, 1024, k));
            }
        }
    }

    public boolean attachFunctor(int i)
    {
        if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled())
            return mAttachInfo.mHardwareRenderer.attachFunctor(mAttachInfo, i);
        else
            return false;
    }

    public void bringChildToFront(View view)
    {
    }

    public void cancelInvalidate(View view)
    {
        mHandler.removeMessages(1, view);
        mHandler.removeMessages(2, view);
        mInvalidateOnAnimationRunnable.removeView(view);
    }

    void checkThread()
    {
        if (mThread != Thread.currentThread())
            throw new CalledFromWrongThreadException("Only the original thread that created a view hierarchy can touch its views.");
        else
            return;
    }

    public void childAccessibilityStateChanged(View view)
    {
        postSendWindowContentChangedCallback(view);
    }

    public void childDrawableStateChanged(View view)
    {
    }

    public void childHasTransientStateChanged(View view, boolean flag)
    {
    }

    public void clearChildFocus(View view)
    {
        checkThread();
        if (DEBUG_INPUT_RESIZE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Clearing child focus: child = ").append(view).append(", mFocusedView = ").append(mFocusedView).append(",mOldFocusedView = ").append(mOldFocusedView).append(", this = ").append(this).toString());
        mOldFocusedView = mFocusedView;
        if (focusSearch(null, 2) == null)
            mAttachInfo.mTreeObserver.dispatchOnGlobalFocusChange(mOldFocusedView, null);
        mRealFocusedView = null;
        mFocusedView = null;
    }

    public void createContextMenu(ContextMenu contextmenu)
    {
    }

    public void debug()
    {
        mView.debug();
    }

    public void dequeueDisplayList(DisplayList displaylist)
    {
        if (mDisplayLists.remove(displaylist))
        {
            displaylist.invalidate();
            if (mDisplayLists.size() == 0)
                mHandler.removeMessages(21);
        }
    }

    void destroyHardwareLayers()
    {
        if (DEBUG_HWUI && isTargetPackage())
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("destroyHardwareLayers enter: mAttachInfo.mHardwareRenderer = ").append(mAttachInfo.mHardwareRenderer).append(",mView = ").append(mView).append(",mThread = ").append(mThread).append(",current = ").append(Thread.currentThread()).append(",enable = ");
            Object obj;
            if (mAttachInfo.mHardwareRenderer != null)
                obj = Boolean.valueOf(mAttachInfo.mHardwareRenderer.isEnabled());
            else
                obj = "null";
            Xlog.v("ViewRootImpl", stringbuilder.append(obj).append(",this = ").append(this).toString(), new Throwable("destroyHardwareLayers"));
        }
        if (mThread != Thread.currentThread())
        {
            if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled())
                HardwareRenderer.trimMemory(60);
        } else
        if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled())
        {
            mAttachInfo.mHardwareRenderer.destroyLayers(mView);
            return;
        }
    }

    void destroyHardwareResources()
    {
        if (DEBUG_HWUI && isTargetPackage())
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("destroyHardwareResources: mAttachInfo.mHardwareRenderer = ").append(mAttachInfo.mHardwareRenderer).append(",mView = ").append(mView).append(",this = ").append(this).toString(), new Throwable("destroyHardwareResources"));
        if (mAttachInfo.mHardwareRenderer != null)
        {
            if (mAttachInfo.mHardwareRenderer.isEnabled())
                mAttachInfo.mHardwareRenderer.destroyLayers(mView);
            mAttachInfo.mHardwareRenderer.destroy(false);
        }
    }

    public void detachFunctor(int i)
    {
        if (mAttachInfo.mHardwareRenderer != null)
            mAttachInfo.mHardwareRenderer.detachFunctor(i);
    }

    public void die(boolean flag)
    {
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("die: immediate = ").append(flag).append(", mIsInTraversal = ").append(mIsInTraversal).append(",mIsDrawing = ").append(mIsDrawing).append(",this = ").append(this).toString());
        if (flag && !mIsInTraversal)
        {
            doDie();
            return;
        }
        if (!mIsDrawing)
            destroyHardwareRenderer();
        else
            Log.e("ViewRootImpl", (new StringBuilder()).append("Attempting to destroy the window while drawing!\n  window=").append(this).append(", title=").append(mWindowAttributes.getTitle()).toString());
        mHandler.sendEmptyMessage(3);
    }

    public void dispatchAppVisibility(boolean flag)
    {
        Message message = mHandler.obtainMessage(8);
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
    }

    public void dispatchCheckFocus()
    {
        if (!mHandler.hasMessages(13))
            mHandler.sendEmptyMessage(13);
    }

    public void dispatchCloseSystemDialogs(String s)
    {
        Message message = Message.obtain();
        message.what = 14;
        message.obj = s;
        mHandler.sendMessage(message);
    }

    void dispatchDetachedFromWindow()
    {
        if (mView != null && mView.mAttachInfo != null)
        {
            if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled())
                mAttachInfo.mHardwareRenderer.validate();
            mView.dispatchDetachedFromWindow();
        }
        mAccessibilityInteractionConnectionManager.ensureNoConnection();
        mAccessibilityManager.removeAccessibilityStateChangeListener(mAccessibilityInteractionConnectionManager);
        removeSendWindowContentChangedCallback();
        destroyHardwareRenderer();
        setAccessibilityFocus(null, null);
        mView = null;
        mAttachInfo.mRootView = null;
        mAttachInfo.mSurface = null;
        mSurface.release();
        if (mInputQueueCallback != null && mInputQueue != null)
        {
            mInputQueueCallback.onInputQueueDestroyed(mInputQueue);
            mInputQueueCallback = null;
            mInputQueue = null;
        } else
        if (mInputEventReceiver != null)
        {
            mInputEventReceiver.dispose();
            mInputEventReceiver = null;
        }
        try
        {
            mWindowSession.remove(mWindow);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("ViewRootImpl", (new StringBuilder()).append("RemoteException remove window ").append(mWindow).append(" in ").append(this).toString(), remoteexception);
        }
        if (mInputChannel != null)
        {
            mInputChannel.dispose();
            mInputChannel = null;
        }
        unscheduleTraversals();
    }

    public void dispatchDoneAnimating()
    {
        mHandler.sendEmptyMessage(23);
    }

    public void dispatchDragEvent(DragEvent dragevent)
    {
        byte byte0;
        if (dragevent.getAction() == 2)
        {
            byte0 = 16;
            mHandler.removeMessages(byte0);
        } else
        {
            byte0 = 15;
        }
        Message message = mHandler.obtainMessage(byte0, dragevent);
        mHandler.sendMessage(message);
    }

    public void dispatchFinishInputConnection(InputConnection inputconnection)
    {
        Message message = mHandler.obtainMessage(12, inputconnection);
        mHandler.sendMessage(message);
    }

    public void dispatchGetNewSurface()
    {
        Message message = mHandler.obtainMessage(9);
        mHandler.sendMessage(message);
    }

    void dispatchImeFinishedEvent(int i, boolean flag)
    {
        Message message = mHandler.obtainMessage(10);
        message.arg1 = i;
        int j;
        if (flag)
            j = 1;
        else
            j = 0;
        message.arg2 = j;
        message.setAsynchronous(true);
        mHandler.sendMessage(message);
    }

    public void dispatchInvalidateDelayed(View view, long l)
    {
        Message message = mHandler.obtainMessage(1, view);
        mHandler.sendMessageDelayed(message, l);
    }

    public void dispatchInvalidateOnAnimation(View view)
    {
        mInvalidateOnAnimationRunnable.addView(view);
    }

    public void dispatchInvalidateRectDelayed(View.AttachInfo.InvalidateInfo invalidateinfo, long l)
    {
        Message message = mHandler.obtainMessage(2, invalidateinfo);
        mHandler.sendMessageDelayed(message, l);
    }

    public void dispatchInvalidateRectOnAnimation(View.AttachInfo.InvalidateInfo invalidateinfo)
    {
        mInvalidateOnAnimationRunnable.addViewRect(invalidateinfo);
    }

    public void dispatchKey(KeyEvent keyevent)
    {
        Message message = mHandler.obtainMessage(7, keyevent);
        message.setAsynchronous(true);
        mHandler.sendMessage(message);
    }

    public void dispatchKeyFromIme(KeyEvent keyevent)
    {
        Message message = mHandler.obtainMessage(11, keyevent);
        message.setAsynchronous(true);
        mHandler.sendMessage(message);
    }

    public void dispatchMoved(int i, int j)
    {
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Window moved ").append(this).append(": newX=").append(i).append(" newY=").append(j).toString());
        if (mTranslator != null)
        {
            PointF pointf = new PointF(i, j);
            mTranslator.translatePointInScreenToAppWindow(pointf);
            i = (int)(0.5D + (double)pointf.x);
            j = (int)(0.5D + (double)pointf.y);
        }
        Message message = mHandler.obtainMessage(25, i, j);
        mHandler.sendMessage(message);
    }

    public void dispatchPointer(MotionEvent motionevent, boolean flag)
    {
    }

    public void dispatchResized(Rect rect, Rect rect1, Rect rect2, boolean flag, Configuration configuration)
    {
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Resizing ").append(this).append(": frame=").append(rect.toShortString()).append(" contentInsets=").append(rect1.toShortString()).append(" visibleInsets=").append(rect2.toShortString()).append(" reportDraw=").append(flag).toString());
        ViewRootHandler viewroothandler = mHandler;
        byte byte0;
        if (flag)
            byte0 = 5;
        else
            byte0 = 4;
        Message message = viewroothandler.obtainMessage(byte0);
        if (mTranslator != null)
        {
            mTranslator.translateRectInScreenToAppWindow(rect);
            mTranslator.translateRectInScreenToAppWindow(rect1);
            mTranslator.translateRectInScreenToAppWindow(rect2);
        }
        SomeArgs someargs = SomeArgs.obtain();
        boolean flag1;
        if (Binder.getCallingPid() == Process.myPid())
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
            rect = new Rect(rect);
        someargs.arg1 = rect;
        if (flag1)
            rect1 = new Rect(rect1);
        someargs.arg2 = rect1;
        if (flag1)
            rect2 = new Rect(rect2);
        someargs.arg3 = rect2;
        if (flag1 && configuration != null)
            configuration = new Configuration(configuration);
        someargs.arg4 = configuration;
        message.obj = someargs;
        mHandler.sendMessage(message);
    }

    public void dispatchScreenStateChange(boolean flag)
    {
        Message message = mHandler.obtainMessage(20);
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
    }

    public void dispatchSystemUiVisibilityChanged(int i, int j, int k, int l)
    {
        SystemUiVisibilityInfo systemuivisibilityinfo = new SystemUiVisibilityInfo();
        systemuivisibilityinfo.seq = i;
        systemuivisibilityinfo.globalVisibility = j;
        systemuivisibilityinfo.localValue = k;
        systemuivisibilityinfo.localChanges = l;
        mHandler.sendMessage(mHandler.obtainMessage(17, systemuivisibilityinfo));
    }

    public void dispatchUnhandledKey(KeyEvent keyevent)
    {
        if ((0x400 & keyevent.getFlags()) == 0)
        {
            KeyCharacterMap.FallbackAction fallbackaction = keyevent.getKeyCharacterMap().getFallbackAction(keyevent.getKeyCode(), keyevent.getMetaState());
            if (fallbackaction != null)
            {
                int i = 0x400 | keyevent.getFlags();
                KeyEvent keyevent1 = KeyEvent.obtain(keyevent.getDownTime(), keyevent.getEventTime(), keyevent.getAction(), fallbackaction.keyCode, keyevent.getRepeatCount(), fallbackaction.metaState, keyevent.getDeviceId(), keyevent.getScanCode(), i, keyevent.getSource(), null);
                fallbackaction.recycle();
                dispatchKey(keyevent1);
            }
        }
    }

    void disposeResizeBuffer()
    {
        if (DEBUG_DRAW || DEBUG_INPUT_RESIZE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("disposeResizeBuffer: mResizeBuffer = ").append(mResizeBuffer).append(",mResizeAlpha = ").append(mResizeAlpha).append(",this = ").append(this).toString());
        if (mResizeBuffer != null)
        {
            mResizeBuffer.destroy();
            mResizeBuffer = null;
        }
    }

    void doConsumeBatchedInput(long l)
    {
        if (mFirstPendingInputEvent != null && (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION))
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("doConsumeBatchedInput: frameTimeNanos = ").append(l).append(",mConsumeBatchedInputScheduled = ").append(mConsumeBatchedInputScheduled).append(",mFirstPendingInputEvent = ").append(mFirstPendingInputEvent.mEvent).append(", this = ").append(this).toString());
        if (mConsumeBatchedInputScheduled)
        {
            mConsumeBatchedInputScheduled = false;
            if (mInputEventReceiver != null)
                mInputEventReceiver.consumeBatchedInputEvents(l);
            doProcessInputEvents();
        }
    }

    void doDie()
    {
        checkThread();
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("DIE in ").append(this).append(" of ").append(mSurface).append(",mAdded = ").append(mAdded).append(",mFirst = ").append(mFirst).toString());
        this;
        JVM INSTR monitorenter ;
        if (mAdded)
            dispatchDetachedFromWindow();
        if (!mAdded || mFirst) goto _L2; else goto _L1
_L1:
        destroyHardwareRenderer();
        if (mView == null) goto _L2; else goto _L3
_L3:
        int i;
        int j;
        i = mView.getVisibility();
        j = mViewVisibility;
        boolean flag;
        flag = false;
        if (j != i)
            flag = true;
        boolean flag1 = mWindowAttributesChanged;
        if (!flag1 && !flag)
            break MISSING_BLOCK_LABEL_181;
        if ((2 & relayoutWindow(mWindowAttributes, i, false)) != 0)
            mWindowSession.finishDrawing(mWindow);
_L4:
        mSurface.release();
_L2:
        mAdded = false;
        this;
        JVM INSTR monitorexit ;
        return;
        RemoteException remoteexception;
        remoteexception;
        Xlog.e("ViewRootImpl", (new StringBuilder()).append("RemoteException when finish draw window ").append(mWindow).append(" in ").append(this).toString(), remoteexception);
          goto _L4
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void doProcessInputEvents()
    {
        while (mCurrentInputEvent == null && mFirstPendingInputEvent != null) 
        {
            QueuedInputEvent queuedinputevent = mFirstPendingInputEvent;
            mFirstPendingInputEvent = queuedinputevent.mNext;
            queuedinputevent.mNext = null;
            mCurrentInputEvent = queuedinputevent;
            if (queuedinputevent.mEvent instanceof KeyEvent)
                mKeyEventStatus = "3 1: Process input event";
            else
                mMotionEventStatus = "3 1: Process input event";
            if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("doProcessInputEvents: mCurrentInputEvent = ").append(mCurrentInputEvent.mEvent).append(", this = ").append(this).toString());
            deliverInputEvent(queuedinputevent);
        }
        if (mProcessInputEventsScheduled)
        {
            mProcessInputEventsScheduled = false;
            mHandler.removeMessages(19);
        }
    }

    void doTraversal()
    {
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("doTraversal: mTraversalScheduled = ").append(mTraversalScheduled).append(",mTraversalBarrier = ").append(mTraversalBarrier).append(",this = ").append(this).toString());
        if (!mTraversalScheduled)
            break MISSING_BLOCK_LABEL_131;
        mTraversalScheduled = false;
        mHandler.getLooper().removeSyncBarrier(mTraversalBarrier);
        if (mProfile)
            Debug.startMethodTracing("ViewAncestor");
        Trace.traceBegin(8L, "performTraversals");
        performTraversals();
        Trace.traceEnd(8L);
        if (mProfile)
        {
            Debug.stopMethodTracing();
            mProfile = false;
        }
        return;
        Exception exception;
        exception;
        Trace.traceEnd(8L);
        throw exception;
    }

    public void dumpGfxInfo(int ai[])
    {
        ai[1] = 0;
        ai[0] = 0;
        if (mView != null)
            getGfxInfo(mView, ai);
    }

    public void dumpInputDispatchingStatus()
    {
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date = new Date(mKeyEventStartTime);
        long l = System.currentTimeMillis() - mKeyEventStartTime;
        if (mCurrentKeyEvent == null)
            Xlog.i("ViewRootImpl", "No key event currently.");
        else
            Xlog.i("ViewRootImpl", (new StringBuilder()).append("Dispatch ").append(mCurrentKeyEvent).append(" status is ").append(mKeyEventStatus).append(",start at ").append(simpledateformat.format(date)).append(", spent ").append(l).append("ms.").toString());
        if (mCurrentMotion == null)
        {
            Xlog.i("ViewRootImpl", "No motion event currently.");
        } else
        {
            date.setTime(mMotionEventStartTime);
            long l1 = System.currentTimeMillis() - mMotionEventStartTime;
            Xlog.i("ViewRootImpl", (new StringBuilder()).append("Dispatch ").append(mCurrentMotion).append(" status is ").append(mMotionEventStatus).append(",start at ").append(simpledateformat.format(date)).append(", spent ").append(l1).append("ms.").toString());
        }
        StringBuilder stringbuilder = (new StringBuilder()).append("The current processed event of VRI is ");
        Object obj;
        if (mCurrentInputEvent != null)
            obj = mCurrentInputEvent.mEvent;
        else
            obj = "none";
        Xlog.i("ViewRootImpl", stringbuilder.append(obj).toString());
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null)
        {
            Xlog.i("ViewRootImpl", "notify IMS Dump");
            inputmethodmanager.notifyImsDump(true);
        }
    }

    public void enableLog(boolean flag)
    {
        Xlog.v("ViewRootImpl", (new StringBuilder()).append("enableLog: enable = ").append(flag).toString());
        LOCAL_LOGV = flag;
        DEBUG_DRAW = flag;
        DEBUG_LAYOUT = flag;
        DEBUG_DIALOG = flag;
        DEBUG_INPUT_RESIZE = flag;
        DEBUG_ORIENTATION = flag;
        DEBUG_TRACKBALL = flag;
        DEBUG_IMF = flag;
        DEBUG_CONFIGURATION = flag;
        DEBUG_FPS = flag;
        DEBUG_INPUT = flag;
        DEBUG_IME_ANR = flag;
        DEBUG_LIFECYCLE = flag;
        HardwareRenderer.setHWUIDebugLog(flag);
    }

    public void enqueueDisplayList(DisplayList displaylist)
    {
        mDisplayLists.add(displaylist);
        mHandler.removeMessages(21);
        Message message = mHandler.obtainMessage(21);
        mHandler.sendMessage(message);
    }

    public void enqueueInputEvent(InputEvent inputevent)
    {
        enqueueInputEvent(inputevent, null, 0, false);
    }

    void enqueueInputEvent(InputEvent inputevent, InputEventReceiver inputeventreceiver, int i, boolean flag)
    {
        QueuedInputEvent queuedinputevent = obtainQueuedInputEvent(inputevent, inputeventreceiver, i);
        QueuedInputEvent queuedinputevent1 = mFirstPendingInputEvent;
        if (queuedinputevent1 == null)
        {
            mFirstPendingInputEvent = queuedinputevent;
        } else
        {
            for (; queuedinputevent1.mNext != null; queuedinputevent1 = queuedinputevent1.mNext);
            queuedinputevent1.mNext = queuedinputevent;
        }
        if (inputevent instanceof KeyEvent)
            mKeyEventStatus = "2: Enqueue input event";
        else
            mMotionEventStatus = "2: Enqueue input event";
        if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("enqueueInputEvent: event = ").append(inputevent).append(",processImmediately = ").append(flag).append(",mProcessInputEventsScheduled = ").append(mProcessInputEventsScheduled).append(", this = ").append(this).toString());
        if (flag)
        {
            doProcessInputEvents();
            return;
        } else
        {
            scheduleProcessInputEvents();
            return;
        }
    }

    boolean ensureTouchMode(boolean flag)
    {
        if (DBG)
            Xlog.d("touchmode", (new StringBuilder()).append("ensureTouchMode(").append(flag).append("), current ").append("touch mode is ").append(mAttachInfo.mInTouchMode).append(", this = ").append(this).toString());
        if (mAttachInfo.mInTouchMode == flag)
            return false;
        try
        {
            mWindowSession.setInTouchMode(flag);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        return ensureTouchModeLocally(flag);
    }

    public View focusSearch(View view, int i)
    {
        checkThread();
        if (!(mView instanceof ViewGroup))
            return null;
        else
            return FocusFinder.getInstance().findNextFocus((ViewGroup)mView, view, i);
    }

    public void focusableViewAvailable(View view)
    {
        checkThread();
        if (mView != null)
            if (!mView.hasFocus())
            {
                view.requestFocus();
            } else
            {
                mFocusedView = mView.findFocus();
                boolean flag;
                if ((mFocusedView instanceof ViewGroup) && ((ViewGroup)mFocusedView).getDescendantFocusability() == 0x40000)
                    flag = true;
                else
                    flag = false;
                if (flag && isViewDescendantOf(view, mFocusedView))
                {
                    view.requestFocus();
                    return;
                }
            }
    }

    public View getAccessibilityFocusedHost()
    {
        return mAccessibilityFocusedHost;
    }

    public AccessibilityNodeInfo getAccessibilityFocusedVirtualView()
    {
        return mAccessibilityFocusedVirtualView;
    }

    public AccessibilityInteractionController getAccessibilityInteractionController()
    {
        if (mView == null)
            throw new IllegalStateException("getAccessibilityInteractionController called when there is no mView");
        if (mAccessibilityInteractionController == null)
            mAccessibilityInteractionController = new AccessibilityInteractionController(this);
        return mAccessibilityInteractionController;
    }

    public boolean getChildVisibleRect(View view, Rect rect, Point point)
    {
        if (view != mView)
            throw new RuntimeException("child is not mine, honest!");
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("getChildVisibleRect: child = ").append(view).append(",r = ").append(rect).append(", this = ").append(this).toString());
        return rect.intersect(0, 0, mWidth, mHeight);
    }

    int getHostVisibility()
    {
        if (mAppVisible)
            return mView.getVisibility();
        else
            return 8;
    }

    public void getLastTouchPoint(Point point)
    {
        point.x = (int)mLastTouchPoint.x;
        point.y = (int)mLastTouchPoint.y;
    }

    final WindowLeaked getLocation()
    {
        return mLocation;
    }

    public ViewParent getParent()
    {
        return null;
    }

    public ViewParent getParentForAccessibility()
    {
        return null;
    }

    public View getView()
    {
        return mView;
    }

    public Rect getYLWindowFrame()
    {
        mYLWinFrame.setEmpty();
        try
        {
            mWindowSession.getYLWindowFrame(mWindow, mYLWinFrame);
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
        return mYLWinFrame;
    }

    void handleAppVisibility(boolean flag)
    {
        if (DEBUG_DRAW || DEBUG_LAYOUT)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append("handleAppVisibility: visible=").append(flag).append(", mAppVisible=").append(mAppVisible).append(", this = ").append(this).toString());
        if (mAppVisible != flag)
        {
            mAppVisible = flag;
            scheduleTraversals();
        }
    }

    public void handleDispatchDoneAnimating()
    {
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("handleDispatchDoneAnimating: mDirty = ").append(mDirty).append(", mWindowsAnimating = ").append(mWindowsAnimating).append(", mIsAnimating = ").append(mIsAnimating).append(", this = ").append(this).toString());
        if (mWindowsAnimating)
        {
            mWindowsAnimating = false;
            if (!mDirty.isEmpty() || mIsAnimating)
                scheduleTraversals();
        }
    }

    public void handleDispatchSystemUiVisibilityChanged(SystemUiVisibilityInfo systemuivisibilityinfo)
    {
        if (mSeq != systemuivisibilityinfo.seq)
        {
            mSeq = systemuivisibilityinfo.seq;
            mAttachInfo.mForceReportNewAttributes = true;
            scheduleTraversals();
        }
        if (mView != null)
        {
            if (systemuivisibilityinfo.localChanges != 0)
                mView.updateLocalSystemUiVisibility(systemuivisibilityinfo.localValue, systemuivisibilityinfo.localChanges);
            if (mAttachInfo != null)
            {
                int i = 7 & systemuivisibilityinfo.globalVisibility;
                if (i != mAttachInfo.mGlobalSystemUiVisibility)
                {
                    mAttachInfo.mGlobalSystemUiVisibility = i;
                    mView.dispatchSystemUiVisibilityChanged(i);
                    return;
                }
            }
        }
    }

    void handleGetNewSurface()
    {
        mNewSurfaceNeeded = true;
        mFullRedrawNeeded = true;
        scheduleTraversals();
    }

    void handleImeFinishedEvent(int i, boolean flag)
    {
        QueuedInputEvent queuedinputevent = mCurrentInputEvent;
        if (queuedinputevent != null && queuedinputevent.mEvent.getSequenceNumber() == i)
        {
            if (DEBUG_IMF)
                Log.v("ViewRootImpl", (new StringBuilder()).append("IME finished event: seq=").append(i).append(" handled=").append(flag).append(" event=").append(queuedinputevent).toString());
            if (flag)
            {
                finishInputEvent(queuedinputevent, true);
            } else
            {
                if (queuedinputevent.mEvent instanceof KeyEvent)
                {
                    KeyEvent keyevent = (KeyEvent)queuedinputevent.mEvent;
                    if (keyevent.getAction() != 1 && !mAttachInfo.mHasWindowFocus)
                    {
                        Slog.w("ViewRootImpl", (new StringBuilder()).append("Dropping event due to no window focus: ").append(keyevent).toString());
                        finishInputEvent(queuedinputevent, true);
                        return;
                    } else
                    {
                        deliverKeyEventPostIme(queuedinputevent);
                        return;
                    }
                }
                MotionEvent motionevent = (MotionEvent)queuedinputevent.mEvent;
                if (motionevent.getAction() != 3 && motionevent.getAction() != 1 && !mAttachInfo.mHasWindowFocus)
                {
                    Slog.w("ViewRootImpl", (new StringBuilder()).append("Dropping event due to no window focus: ").append(motionevent).toString());
                    finishInputEvent(queuedinputevent, true);
                    return;
                }
                if ((4 & queuedinputevent.mEvent.getSource()) != 0)
                {
                    deliverTrackballEventPostIme(queuedinputevent);
                    return;
                } else
                {
                    deliverGenericMotionEventPostIme(queuedinputevent);
                    return;
                }
            }
        } else
        if (DEBUG_IMF || DEBUG_KEY || DEBUG_INPUT)
        {
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("IME finished event: seq=").append(i).append(" handled=").append(flag).append(", event not found!").toString());
            return;
        }
    }

    void handleScreenStateChange(boolean flag)
    {
        if (flag != mAttachInfo.mScreenOn)
        {
            mAttachInfo.mScreenOn = flag;
            if (mView != null)
            {
                View view = mView;
                int i;
                if (flag)
                    i = 1;
                else
                    i = 0;
                view.dispatchScreenStateChanged(i);
            }
            if (flag)
            {
                mFullRedrawNeeded = true;
                scheduleTraversals();
            }
        }
    }

    void invalidate()
    {
        mDirty.set(0, 0, mWidth, mHeight);
        scheduleTraversals();
    }

    public void invalidateChild(View view, Rect rect)
    {
        invalidateChildInParent(null, rect);
    }

    public ViewParent invalidateChildInParent(int ai[], Rect rect)
    {
        checkThread();
        if (DEBUG_DRAW)
            Log.v("ViewRootImpl", (new StringBuilder()).append("Invalidate child: ").append(rect).toString());
        if (rect == null)
            invalidate();
        else
        if (!rect.isEmpty() || mIsAnimating)
        {
            if (mCurScrollY != 0 || mTranslator != null)
            {
                mTempRect.set(rect);
                rect = mTempRect;
                if (mCurScrollY != 0)
                    rect.offset(0, -mCurScrollY);
                if (mTranslator != null)
                    mTranslator.translateRectInAppWindowToScreen(rect);
                if (mAttachInfo.mScalingRequired)
                    rect.inset(-1, -1);
            }
            Rect rect1 = mDirty;
            if (!rect1.isEmpty() && !rect1.contains(rect))
            {
                mAttachInfo.mSetIgnoreDirtyState = true;
                mAttachInfo.mIgnoreDirtyState = true;
            }
            rect1.union(rect.left, rect.top, rect.right, rect.bottom);
            float f = mAttachInfo.mApplicationScale;
            boolean flag = rect1.intersect(0, 0, (int)(0.5F + f * (float)mWidth), (int)(0.5F + f * (float)mHeight));
            if (!flag)
                rect1.setEmpty();
            if (!mWillDrawSoon && (flag || mIsAnimating))
            {
                scheduleTraversals();
                return null;
            }
        }
        return null;
    }

    void invalidateDisplayLists()
    {
        ArrayList arraylist = mDisplayLists;
        int i = arraylist.size();
        for (int j = 0; j < i; j++)
        {
            DisplayList displaylist = (DisplayList)arraylist.get(j);
            displaylist.invalidate();
            displaylist.clear();
        }

        arraylist.clear();
    }

    void invalidateWorld(View view)
    {
        view.invalidate();
        if (view instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)view;
            for (int i = 0; i < viewgroup.getChildCount(); i++)
                invalidateWorld(viewgroup.getChildAt(i));

        }
    }

    public boolean isLayoutRequested()
    {
        return mLayoutRequested;
    }

    public void loadSystemProperties()
    {
        boolean flag = SystemProperties.getBoolean("debug.layout", false);
        if (flag != mAttachInfo.mDebugLayout)
        {
            mAttachInfo.mDebugLayout = flag;
            if (!mHandler.hasMessages(24))
                mHandler.sendEmptyMessageDelayed(24, 200L);
        }
    }

    public void onHardwarePostDraw(HardwareCanvas hardwarecanvas)
    {
        if (DEBUG_DRAW)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("onHardwarePostDraw: mResizeBuffer = ").append(mResizeBuffer).append(", mResizeAlpha = ").append(mResizeAlpha).append(", this = ").append(this).toString());
        if (mResizeBuffer != null)
        {
            mResizePaint.setAlpha(mResizeAlpha);
            hardwarecanvas.drawHardwareLayer(mResizeBuffer, 0.0F, mHardwareYOffset, mResizePaint);
        }
        drawAccessibilityFocusedDrawableIfNeeded(hardwarecanvas);
    }

    public void onHardwarePreDraw(HardwareCanvas hardwarecanvas)
    {
        hardwarecanvas.translate(0.0F, -mHardwareYOffset);
    }

    void outputDisplayList(View view)
    {
        if (mAttachInfo != null && mAttachInfo.mHardwareCanvas != null)
        {
            DisplayList displaylist = view.getDisplayList();
            if (displaylist != null)
                mAttachInfo.mHardwareCanvas.outputDisplayList(displaylist);
        }
    }

    public boolean performHapticFeedback(int i, boolean flag)
    {
        boolean flag1;
        try
        {
            flag1 = mWindowSession.performHapticFeedback(mWindow, i, flag);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("ViewRootImpl", (new StringBuilder()).append("performHapticFeedback RemoteException happens in ").append(this).toString(), remoteexception);
            return false;
        }
        return flag1;
    }

    public void playSoundEffect(int i)
    {
        AudioManager audiomanager;
        checkThread();
        try
        {
            audiomanager = getAudioManager();
        }
        catch (IllegalStateException illegalstateexception)
        {
            Log.e("ViewRootImpl", (new StringBuilder()).append("FATAL EXCEPTION when attempting to play sound effect: ").append(illegalstateexception).toString());
            illegalstateexception.printStackTrace();
            return;
        }
        i;
        JVM INSTR tableswitch 0 4: default 44
    //                   0 119
    //                   1 133
    //                   2 147
    //                   3 140
    //                   4 126;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        throw new IllegalArgumentException((new StringBuilder()).append("unknown effect id ").append(i).append(" not defined in ").append(android/view/SoundEffectConstants.getCanonicalName()).toString());
_L2:
        audiomanager.playSoundEffect(0);
        return;
_L6:
        audiomanager.playSoundEffect(2);
        return;
_L3:
        audiomanager.playSoundEffect(3);
        return;
_L5:
        audiomanager.playSoundEffect(4);
        return;
_L4:
        audiomanager.playSoundEffect(1);
        return;
    }

    public void profile()
    {
        mProfile = true;
    }

    void pushHardwareLayerUpdate(HardwareLayer hardwarelayer)
    {
        if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled())
            mAttachInfo.mHardwareRenderer.pushLayerUpdate(hardwarelayer);
    }

    public void recomputeViewAttributes(View view)
    {
        checkThread();
        if (mView == view)
        {
            mAttachInfo.mRecomputeGlobalAttributes = true;
            if (!mWillDrawSoon)
                scheduleTraversals();
        }
    }

    public void requestChildFocus(View view, View view1)
    {
        checkThread();
        if (DEBUG_INPUT_RESIZE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Request child ").append(view).append(" focus: focus now ").append(view1).append(" in ").append(this).toString());
        mOldFocusedView = mFocusedView;
        mAttachInfo.mTreeObserver.dispatchOnGlobalFocusChange(mOldFocusedView, view1);
        scheduleTraversals();
        mRealFocusedView = view1;
        mFocusedView = view1;
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean flag)
    {
        boolean flag1 = scrollToRectOrFocus(rect, flag);
        if (rect != null)
        {
            mTempRect.set(rect);
            mTempRect.offset(0, -mCurScrollY);
            mTempRect.offset(mAttachInfo.mWindowLeft, mAttachInfo.mWindowTop);
            try
            {
                mWindowSession.onRectangleOnScreenRequested(mWindow, mTempRect, flag);
            }
            catch (RemoteException remoteexception)
            {
                return flag1;
            }
        }
        return flag1;
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
    }

    public void requestFitSystemWindows()
    {
        checkThread();
        mFitSystemWindowsRequested = true;
        scheduleTraversals();
    }

    public void requestLayout()
    {
        if (DEBUG_LAYOUT)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append("requestLayout: mView = ").append(mView).append(", this = ").append(this).toString());
        checkThread();
        mLayoutRequested = true;
        scheduleTraversals();
    }

    public void requestLayoutBySoftInputChanged()
    {
        mSoftInputMayChanged = true;
    }

    public boolean requestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (mView == null)
            return false;
        switch (accessibilityevent.getEventType())
        {
        default:
            break;

        case 65536: 
            int j = AccessibilityNodeInfo.getAccessibilityViewId(accessibilityevent.getSourceNodeId());
            View view2 = mView.findViewByAccessibilityId(j);
            if (view2 != null && view2.getAccessibilityNodeProvider() != null)
                setAccessibilityFocus(null, null);
            break;

        case 32768: 
            long l = accessibilityevent.getSourceNodeId();
            int i = AccessibilityNodeInfo.getAccessibilityViewId(l);
            View view1 = mView.findViewByAccessibilityId(i);
            if (view1 == null)
                break;
            AccessibilityNodeProvider accessibilitynodeprovider = view1.getAccessibilityNodeProvider();
            if (accessibilitynodeprovider != null)
                setAccessibilityFocus(view1, accessibilitynodeprovider.createAccessibilityNodeInfo(AccessibilityNodeInfo.getVirtualDescendantId(l)));
            break;
        }
        mAccessibilityManager.sendAccessibilityEvent(accessibilityevent);
        return true;
    }

    public void requestTransitionStart(LayoutTransition layouttransition)
    {
        if (mPendingTransitions == null || !mPendingTransitions.contains(layouttransition))
        {
            if (mPendingTransitions == null)
                mPendingTransitions = new ArrayList();
            mPendingTransitions.add(layouttransition);
        }
    }

    public void requestTransparentRegion(View view)
    {
        checkThread();
        if (mView == view)
        {
            View view1 = mView;
            view1.mPrivateFlags = 0x200 | view1.mPrivateFlags;
            mWindowAttributesChanged = true;
            mWindowAttributesChangesFlag = 0;
            requestLayout();
        }
    }

    public void requestUpdateConfiguration(Configuration configuration)
    {
        Message message = mHandler.obtainMessage(18, configuration);
        mHandler.sendMessage(message);
    }

    void scheduleConsumeBatchedInput()
    {
        if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("scheduleConsumeBatchedInput: mConsumeBatchedInputScheduled = ").append(mConsumeBatchedInputScheduled).append(",mFirstPendingInputEvent = ").append(mFirstPendingInputEvent).append(", this = ").append(this).toString());
        if (!mConsumeBatchedInputScheduled)
        {
            mConsumeBatchedInputScheduled = true;
            mChoreographer.postCallback(0, mConsumedBatchedInputRunnable, null);
        }
    }

    void scheduleTraversals()
    {
        if (!mTraversalScheduled)
        {
            mTraversalScheduled = true;
            mTraversalBarrier = mHandler.getLooper().postSyncBarrier();
            if (DEBUG_LIFECYCLE)
                Xlog.v("ViewRootImpl", (new StringBuilder()).append("scheduleTraversals: mTraversalBarrier = ").append(mTraversalBarrier).append(",this = ").append(this).toString());
            mChoreographer.postCallback(2, mTraversalRunnable, null);
            scheduleConsumeBatchedInput();
        }
    }

    boolean scrollToRectOrFocus(Rect rect, boolean flag)
    {
label0:
        {
            int i;
            boolean flag1;
label1:
            {
                View.AttachInfo attachinfo = mAttachInfo;
                Rect rect1 = attachinfo.mContentInsets;
                Rect rect2 = attachinfo.mVisibleInsets;
                if (rect2.left <= rect1.left && rect2.top <= rect1.top && rect2.right <= rect1.right)
                {
                    int j = rect2.bottom;
                    int k = rect1.bottom;
                    flag1 = false;
                    i = 0;
                    if (j <= k)
                        break label1;
                }
                i = mScrollY;
                View view = mRealFocusedView;
                if (view == null || view.mAttachInfo != mAttachInfo)
                    break label0;
                if (view != mLastScrolledFocus)
                    rect = null;
                if (DEBUG_INPUT_RESIZE)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Eval scroll: focus=").append(view).append(" rectangle=").append(rect).append(" ci=").append(rect1).append(" vi=").append(rect2).append(" mScrollMayChange = ").append(mScrollMayChange).append(" mLastScrolledFocus = ").append(mLastScrolledFocus).append(" this = ").append(this).toString());
                if (view == mLastScrolledFocus && !mScrollMayChange && rect == null)
                {
                    boolean flag4 = DEBUG_INPUT_RESIZE;
                    flag1 = false;
                    if (flag4)
                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Keeping scroll y=").append(mScrollY).append(" vi=").append(rect2.toShortString()).append(" this = ").append(this).toString());
                } else
                {
                    flag1 = false;
                    if (view != null)
                    {
                        mLastScrolledFocus = view;
                        mScrollMayChange = false;
                        if (DEBUG_INPUT_RESIZE)
                            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Need to scroll? mVisRect = ").append(mVisRect).append(" this = ").append(this).toString());
                        boolean flag2 = view.getGlobalVisibleRect(mVisRect, null);
                        flag1 = false;
                        if (flag2)
                        {
                            if (DEBUG_INPUT_RESIZE)
                                Xlog.v("ViewRootImpl", (new StringBuilder()).append("Root w=").append(mView.getWidth()).append(" h=").append(mView.getHeight()).append(" ci=").append(rect1.toShortString()).append(" vi=").append(rect2.toShortString()).append(" this = ").append(this).toString());
                            if (rect == null)
                            {
                                view.getFocusedRect(mTempRect);
                                if (DEBUG_INPUT_RESIZE)
                                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Focus ").append(view).append(": focusRect=").append(mTempRect.toShortString()).append(" this = ").append(this).toString());
                                if (mView instanceof ViewGroup)
                                    ((ViewGroup)mView).offsetDescendantRectToMyCoords(view, mTempRect);
                                if (DEBUG_INPUT_RESIZE)
                                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Focus in window: focusRect=").append(mTempRect.toShortString()).append(" visRect=").append(mVisRect.toShortString()).append(" this = ").append(this).toString());
                            } else
                            {
                                mTempRect.set(rect);
                                if (DEBUG_INPUT_RESIZE)
                                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Request scroll to rect: ").append(mTempRect.toShortString()).append(" visRect=").append(mVisRect.toShortString()).append(" this = ").append(this).toString());
                            }
                            boolean flag3 = mTempRect.intersect(mVisRect);
                            flag1 = false;
                            if (flag3)
                            {
                                if (DEBUG_INPUT_RESIZE)
                                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Focus window visible rect: ").append(mTempRect.toShortString()).append(" this = ").append(this).toString());
                                if (mTempRect.height() > mView.getHeight() - rect2.top - rect2.bottom)
                                {
                                    if (DEBUG_INPUT_RESIZE)
                                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Too tall; leaving scrollY=").append(i).append(" this = ").append(this).toString());
                                } else
                                if (mTempRect.top - i < rect2.top)
                                {
                                    i -= rect2.top - (mTempRect.top - i);
                                    if (DEBUG_INPUT_RESIZE)
                                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Top covered; scrollY=").append(i).append(" this = ").append(this).toString());
                                } else
                                if (mTempRect.bottom - i > mView.getHeight() - rect2.bottom)
                                {
                                    i += mTempRect.bottom - i - (mView.getHeight() - rect2.bottom);
                                    if (DEBUG_INPUT_RESIZE)
                                        Xlog.v("ViewRootImpl", (new StringBuilder()).append("Bottom covered; scrollY=").append(i).append(" this = ").append(this).toString());
                                }
                                flag1 = true;
                            }
                        }
                    }
                }
            }
            if (i != mScrollY)
            {
                if (DEBUG_INPUT_RESIZE)
                    Xlog.v("ViewRootImpl", (new StringBuilder()).append("Pan scroll changed: old=").append(mScrollY).append(", new=").append(i).append(", this = ").append(this).toString());
                if (!flag && mResizeBuffer == null)
                {
                    if (mScroller == null)
                        mScroller = new Scroller(mView.getContext());
                    mScroller.startScroll(0, mScrollY, 0, i - mScrollY);
                } else
                if (mScroller != null)
                    mScroller.abortAnimation();
                mScrollY = i;
            }
            return flag1;
        }
        mRealFocusedView = null;
        return false;
    }

    void setAccessibilityFocus(View view, AccessibilityNodeInfo accessibilitynodeinfo)
    {
        if (mAccessibilityFocusedVirtualView != null)
        {
            AccessibilityNodeInfo accessibilitynodeinfo1 = mAccessibilityFocusedVirtualView;
            View view1 = mAccessibilityFocusedHost;
            view1.clearAccessibilityFocusNoCallbacks();
            mAccessibilityFocusedHost = null;
            mAccessibilityFocusedVirtualView = null;
            AccessibilityNodeProvider accessibilitynodeprovider = view1.getAccessibilityNodeProvider();
            if (accessibilitynodeprovider != null)
            {
                accessibilitynodeinfo1.getBoundsInParent(mTempRect);
                view1.invalidate(mTempRect);
                accessibilitynodeprovider.performAction(AccessibilityNodeInfo.getVirtualDescendantId(accessibilitynodeinfo1.getSourceNodeId()), 128, null);
            }
            accessibilitynodeinfo1.recycle();
        }
        if (mAccessibilityFocusedHost != null)
            mAccessibilityFocusedHost.clearAccessibilityFocusNoCallbacks();
        mAccessibilityFocusedHost = view;
        mAccessibilityFocusedVirtualView = accessibilitynodeinfo;
    }

    public void setDragFocus(View view)
    {
        if (mCurrentDragView != view)
            mCurrentDragView = view;
    }

    void setLayoutParams(WindowManager.LayoutParams layoutparams, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        i = mWindowAttributes.softInputMode;
        mClientWindowLayoutFlags = layoutparams.flags;
        int j = 0x20000000 & mWindowAttributes.flags;
        layoutparams.systemUiVisibility = mWindowAttributes.systemUiVisibility;
        layoutparams.subtreeSystemUiVisibility = mWindowAttributes.subtreeSystemUiVisibility;
        mWindowAttributesChangesFlag = mWindowAttributes.copyFrom(layoutparams);
        WindowManager.LayoutParams layoutparams1 = mWindowAttributes;
        layoutparams1.flags = j | layoutparams1.flags;
        applyKeepScreenOnFlag(mWindowAttributes);
        if (!flag)
            break MISSING_BLOCK_LABEL_109;
        mSoftInputMode = layoutparams.softInputMode;
        requestLayout();
        if ((0xf0 & layoutparams.softInputMode) == 0)
            mWindowAttributes.softInputMode = 0xffffff0f & mWindowAttributes.softInputMode | i & 0xf0;
        mWindowAttributesChanged = true;
        scheduleTraversals();
        this;
        JVM INSTR monitorexit ;
        if (DEBUG_IMF)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append("setLayoutParams: attrs = ").append(layoutparams).append(", mSoftInputMode = ").append(mSoftInputMode).append(", mWindowAttributes = ").append(mWindowAttributes).append(", this = ").append(this).toString());
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void setLocalDragState(Object obj)
    {
        mLocalDragState = obj;
    }

    void setStopped(boolean flag)
    {
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("setStopped: stopped = ").append(flag).append(", this = ").append(this).toString());
        if (mStopped != flag)
        {
            mStopped = flag;
            if (!flag)
                scheduleTraversals();
        }
    }

    public void setView(View view, WindowManager.LayoutParams layoutparams, View view1)
    {
        this;
        JVM INSTR monitorenter ;
        if (mView != null) goto _L2; else goto _L1
_L1:
        WindowManager.LayoutParams layoutparams1;
        CompatibilityInfo compatibilityinfo;
        android.content.res.CompatibilityInfo.Translator translator;
        mView = view;
        mViewLayoutDirectionInitial = mView.getRawLayoutDirection();
        mFallbackEventHandler.setView(view);
        mWindowAttributes.copyFrom(layoutparams);
        layoutparams1 = mWindowAttributes;
        mClientWindowLayoutFlags = layoutparams1.flags;
        setAccessibilityFocus(null, null);
        if (view instanceof RootViewSurfaceTaker)
        {
            mSurfaceHolderCallback = ((RootViewSurfaceTaker)view).willYouTakeTheSurface();
            if (mSurfaceHolderCallback != null)
            {
                mSurfaceHolder = new TakenSurfaceHolder();
                mSurfaceHolder.setFormat(0);
            }
        }
        compatibilityinfo = mCompatibilityInfo.get();
        mTranslator = compatibilityinfo.getTranslator();
        if (mSurfaceHolder == null)
            enableHardwareAcceleration(mView.getContext(), layoutparams1);
        translator = mTranslator;
        boolean flag;
        flag = false;
        if (translator == null)
            break MISSING_BLOCK_LABEL_192;
        mSurface.setCompatibilityTranslator(mTranslator);
        flag = true;
        layoutparams1.backup();
        mTranslator.translateWindowLayout(layoutparams1);
        View.AttachInfo attachinfo;
        if (DEBUG_LAYOUT || DEBUG_LIFECYCLE)
            Xlog.d("ViewRootImpl", (new StringBuilder()).append("WindowLayout in setView:").append(layoutparams1).append(",mView = ").append(mView).append(",compatibilityInfo = ").append(compatibilityinfo).append(", this = ").append(this).toString());
        if (!compatibilityinfo.supportsScreen())
        {
            layoutparams1.flags = 0x20000000 | layoutparams1.flags;
            mLastInCompatMode = true;
        }
        mSoftInputMode = layoutparams1.softInputMode;
        mWindowAttributesChanged = true;
        mWindowAttributesChangesFlag = -1;
        mAttachInfo.mRootView = view;
        attachinfo = mAttachInfo;
        Exception exception;
        boolean flag1;
        View.AttachInfo attachinfo1;
        float f;
        int i;
        if (mTranslator != null)
            flag1 = true;
        else
            flag1 = false;
        attachinfo.mScalingRequired = flag1;
        attachinfo1 = mAttachInfo;
        if (mTranslator != null) goto _L4; else goto _L3
_L3:
        f = 1.0F;
_L17:
        attachinfo1.mApplicationScale = f;
        if (view1 == null)
            break MISSING_BLOCK_LABEL_380;
        mAttachInfo.mPanelParentWindowToken = view1.getApplicationWindowToken();
        mAdded = true;
        requestLayout();
        if ((2 & mWindowAttributes.inputFeatures) == 0)
            mInputChannel = new InputChannel();
        mOrigWindowType = mWindowAttributes.type;
        mAttachInfo.mRecomputeGlobalAttributes = true;
        collectViewAttributes();
        i = mWindowSession.addToDisplay(mWindow, mSeq, mWindowAttributes, getHostVisibility(), mDisplay.getDisplayId(), mAttachInfo.mContentInsets, mInputChannel);
        if (!flag)
            break MISSING_BLOCK_LABEL_491;
        layoutparams1.restore();
        if (mTranslator != null)
            mTranslator.translateRectInScreenToAppWindow(mAttachInfo.mContentInsets);
        mPendingContentInsets.set(mAttachInfo.mContentInsets);
        mPendingVisibleInsets.set(0, 0, 0, 0);
        if (DEBUG_LAYOUT)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Added window ").append(mWindow).append(", mPendingContentInsets = ").append(mPendingContentInsets).append(", this = ").append(this).toString());
        if (i >= 0) goto _L6; else goto _L5
_L5:
        mAttachInfo.mRootView = null;
        mAdded = false;
        mFallbackEventHandler.setView(null);
        unscheduleTraversals();
        setAccessibilityFocus(null, null);
        i;
        JVM INSTR tableswitch -10 -1: default 688
    //                   -10 1080
    //                   -9 1043
    //                   -8 1006
    //                   -7 969
    //                   -6 966
    //                   -5 929
    //                   -4 891
    //                   -3 853
    //                   -2 815
    //                   -1 815;
           goto _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L16
_L7:
        throw new RuntimeException((new StringBuilder()).append("Unable to add window -- unknown error code ").append(i).toString());
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        f = mTranslator.applicationScale;
          goto _L17
        RemoteException remoteexception;
        remoteexception;
        mAdded = false;
        mView = null;
        mAttachInfo.mRootView = null;
        mInputChannel = null;
        mFallbackEventHandler.setView(null);
        unscheduleTraversals();
        setAccessibilityFocus(null, null);
        throw new RuntimeException("Adding window failed", remoteexception);
        Exception exception1;
        exception1;
        if (!flag) goto _L19; else goto _L18
_L18:
        layoutparams1.restore();
_L19:
        throw exception1;
_L16:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window -- token ").append(layoutparams1.token).append(" is not valid; is your activity running?").toString());
_L15:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window -- token ").append(layoutparams1.token).append(" is not for an application").toString());
_L14:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window -- app for token ").append(layoutparams1.token).append(" is exiting").toString());
_L13:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window -- window ").append(mWindow).append(" has already been added").toString());
_L12:
        return;
_L11:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window ").append(mWindow).append(" -- another window of this type already exists").toString());
_L10:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window ").append(mWindow).append(" -- permission denied for this window type").toString());
_L9:
        throw new WindowManager.InvalidDisplayException((new StringBuilder()).append("Unable to add window ").append(mWindow).append(" -- the specified display can not be found").toString());
_L8:
        throw new WindowManager.BadTokenException((new StringBuilder()).append("Unable to add window ").append(mWindow).append(" -- input channel is not allowed").toString());
_L6:
        if (view instanceof RootViewSurfaceTaker)
            mInputQueueCallback = ((RootViewSurfaceTaker)view).willYouTakeTheInputQueue();
        if (mInputChannel == null) goto _L21; else goto _L20
_L20:
        if (mInputQueueCallback == null) goto _L23; else goto _L22
_L22:
        mInputQueue = new InputQueue(mInputChannel);
        mInputQueueCallback.onInputQueueCreated(mInputQueue);
_L21:
        view.assignParent(this);
        boolean flag2;
        boolean flag3;
        if ((i & 1) != 0)
            flag2 = true;
        else
            flag2 = false;
        mAddedTouchMode = flag2;
        if ((i & 2) != 0)
            flag3 = true;
        else
            flag3 = false;
        mAppVisible = flag3;
        if (mAccessibilityManager.isEnabled())
            mAccessibilityInteractionConnectionManager.ensureConnection();
        if (view.getImportantForAccessibility() == 0)
            view.setImportantForAccessibility(1);
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L23:
        mInputEventReceiver = new WindowInputEventReceiver(mInputChannel, Looper.myLooper());
          goto _L21
    }

    public boolean showContextMenuForChild(View view)
    {
        return false;
    }

    public ActionMode startActionModeForChild(View view, ActionMode.Callback callback)
    {
        return null;
    }

    void terminateHardwareResources()
    {
        if (DEBUG_HWUI && isTargetPackage())
        {
            boolean flag = mAttachInfo.mHardwareRenderer.isEnabled();
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("terminateHardwareResources: mAttachInfo.mHardwareRenderer = ").append(mAttachInfo.mHardwareRenderer).append(",mView = ").append(mView).append(",isEnabled = ").append(flag).append(",this = ").append(this).toString(), new Throwable("terminateHardwareResources"));
        }
        if (mAttachInfo.mHardwareRenderer != null)
        {
            mAttachInfo.mHardwareRenderer.setForceDestroyLayers(true);
            mAttachInfo.mHardwareRenderer.destroyHardwareResources(mView);
            mAttachInfo.mHardwareRenderer.setForceDestroyLayers(false);
            mAttachInfo.mHardwareRenderer.destroy(false);
        }
    }

    public String toString()
    {
        return (new StringBuilder()).append("ViewRoot{").append(Integer.toHexString(System.identityHashCode(this))).append(" ").append(mWindowAttributes.getTitle()).append(",ident = ").append(mIdent).append("}").toString();
    }

    void unscheduleConsumeBatchedInput()
    {
        if (DEBUG_INPUT || DEBUG_KEY || DEBUG_MOTION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("unscheduleConsumeBatchedInput: mConsumeBatchedInputScheduled = ").append(mConsumeBatchedInputScheduled).append(", this = ").append(this).toString());
        if (mConsumeBatchedInputScheduled)
        {
            mConsumeBatchedInputScheduled = false;
            mChoreographer.removeCallbacks(0, mConsumedBatchedInputRunnable, null);
        }
    }

    void unscheduleTraversals()
    {
        if (DEBUG_LIFECYCLE)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("unscheduleTraversals: mTraversalScheduled = ").append(mTraversalScheduled).append(",mTraversalBarrier = ").append(mTraversalBarrier).append(",this = ").append(this).toString());
        if (mTraversalScheduled)
        {
            mTraversalScheduled = false;
            mHandler.getLooper().removeSyncBarrier(mTraversalBarrier);
            mChoreographer.removeCallbacks(2, mTraversalRunnable, null);
        }
    }

    void updateConfiguration(Configuration configuration, boolean flag)
    {
        if (DEBUG_CONFIGURATION)
            Xlog.v("ViewRootImpl", (new StringBuilder()).append("Applying new config to window ").append(mWindowAttributes.getTitle()).append(": ").append(configuration).append(",force = ").append(flag).append(", this = ").append(this).toString());
        CompatibilityInfo compatibilityinfo = mCompatibilityInfo.getIfNeeded();
        if (compatibilityinfo != null)
        {
            Configuration configuration1 = new Configuration(configuration);
            compatibilityinfo.applyToConfiguration(mNoncompatDensity, configuration1);
            configuration = configuration1;
        }
        ArrayList arraylist = sConfigCallbacks;
        arraylist;
        JVM INSTR monitorenter ;
        int i = -1 + sConfigCallbacks.size();
_L2:
        if (i < 0)
            break; /* Loop/switch isn't completed */
        ((ComponentCallbacks)sConfigCallbacks.get(i)).onConfigurationChanged(configuration);
        i--;
        if (true) goto _L2; else goto _L1
_L1:
        arraylist;
        JVM INSTR monitorexit ;
        if (mView != null)
        {
            Configuration configuration2 = mView.getResources().getConfiguration();
            if (flag || mLastConfiguration.diff(configuration2) != 0)
            {
                int j = mLastConfiguration.getLayoutDirection();
                int k = configuration2.getLayoutDirection();
                mLastConfiguration.setTo(configuration2);
                if (j != k && mViewLayoutDirectionInitial == 2)
                    mView.setLayoutDirection(k);
                mView.dispatchConfigurationChanged(configuration2);
            }
        }
        return;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void windowFocusChanged(boolean flag, boolean flag1)
    {
        int i = 1;
        Message message = Message.obtain();
        message.what = 6;
        int j;
        if (flag)
            j = i;
        else
            j = 0;
        message.arg1 = j;
        if (!flag1)
            i = 0;
        message.arg2 = i;
        mHandler.sendMessage(message);
    }

    static 
    {
        DBG = false;
        LOCAL_LOGV = false;
        DEBUG_DRAW = LOCAL_LOGV;
        DEBUG_LAYOUT = LOCAL_LOGV;
        DEBUG_DIALOG = LOCAL_LOGV;
        DEBUG_INPUT_RESIZE = LOCAL_LOGV;
        DEBUG_ORIENTATION = LOCAL_LOGV;
        DEBUG_TRACKBALL = LOCAL_LOGV;
        DEBUG_IMF = LOCAL_LOGV;
        DEBUG_CONFIGURATION = LOCAL_LOGV;
        DEBUG_FPS = false;
        DEBUG_HWUI = false;
        DEBUG_INPUT = false;
        DEBUG_KEY = DEBUG_INPUT;
        DEBUG_MOTION = DEBUG_INPUT;
        DEBUG_IME_ANR = false;
        DEBUG_LIFECYCLE = LOCAL_LOGV;
    }





/*
    static KeyEvent access$1202(ViewRootImpl viewrootimpl, KeyEvent keyevent)
    {
        viewrootimpl.mCurrentKeyEvent = keyevent;
        return keyevent;
    }

*/


/*
    static long access$1302(ViewRootImpl viewrootimpl, long l)
    {
        viewrootimpl.mKeyEventStartTime = l;
        return l;
    }

*/


/*
    static String access$1402(ViewRootImpl viewrootimpl, String s)
    {
        viewrootimpl.mKeyEventStatus = s;
        return s;
    }

*/


/*
    static MotionEvent access$1502(ViewRootImpl viewrootimpl, MotionEvent motionevent)
    {
        viewrootimpl.mCurrentMotion = motionevent;
        return motionevent;
    }

*/


/*
    static long access$1602(ViewRootImpl viewrootimpl, long l)
    {
        viewrootimpl.mMotionEventStartTime = l;
        return l;
    }

*/


/*
    static String access$1702(ViewRootImpl viewrootimpl, String s)
    {
        viewrootimpl.mMotionEventStatus = s;
        return s;
    }

*/














}
