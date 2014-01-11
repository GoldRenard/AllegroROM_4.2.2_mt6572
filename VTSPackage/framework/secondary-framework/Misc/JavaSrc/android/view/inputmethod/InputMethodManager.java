// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.inputmethod;

import android.content.Context;
import android.graphics.Rect;
import android.os.*;
import android.text.style.SuggestionSpan;
import android.util.*;
import android.view.*;
import com.android.internal.os.SomeArgs;
import com.android.internal.view.*;
import com.android.internal.widget.EditableInputConnection;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

// Referenced classes of package android.view.inputmethod:
//            BaseInputConnection, InputConnection, EditorInfo, InputMethodInfo, 
//            InputMethodSubtype, CompletionInfo, ExtractedText

public final class InputMethodManager
{
    private static class ControlledInputConnectionWrapper extends IInputConnectionWrapper
    {

        private boolean mActive;
        private final InputMethodManager mParentInputMethodManager;

        void deactivate()
        {
            Log.d("InputMethodManager", "deactivate the inputconnection in ControlledInputConnectionWrapper.");
            mActive = false;
        }

        public boolean isActive()
        {
            return mParentInputMethodManager.mActive && mActive;
        }

        public ControlledInputConnectionWrapper(Looper looper, InputConnection inputconnection, InputMethodManager inputmethodmanager)
        {
            super(looper, inputconnection);
            mParentInputMethodManager = inputmethodmanager;
            mActive = true;
        }
    }

    public static interface FinishedEventCallback
    {

        public abstract void finishedEvent(int i, boolean flag);
    }

    class H extends Handler
    {

        final InputMethodManager this$0;

        public void handleMessage(Message message)
        {
            boolean flag = true;
            message.what;
            JVM INSTR tableswitch 1 5: default 40
        //                       1 41
        //                       2 158
        //                       3 373
        //                       4 523
        //                       5 692;
               goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
            return;
_L2:
            SomeArgs someargs = (SomeArgs)message.obj;
            try
            {
                doDump((FileDescriptor)someargs.arg1, (PrintWriter)someargs.arg2, (String[])(String[])someargs.arg3);
            }
            catch (RuntimeException runtimeexception)
            {
                ((PrintWriter)someargs.arg2).println((new StringBuilder()).append("Exception: ").append(runtimeexception).toString());
            }
            synchronized (someargs.arg4)
            {
                ((CountDownLatch)someargs.arg4).countDown();
            }
            someargs.recycle();
            return;
            exception3;
            obj;
            JVM INSTR monitorexit ;
            throw exception3;
_L3:
            InputBindResult inputbindresult;
            inputbindresult = (InputBindResult)message.obj;
            if (InputMethodManager.DEBUG)
                Log.i("InputMethodManager", (new StringBuilder()).append("handleMessage: MSG_BIND ").append(inputbindresult.sequence).append(",").append(inputbindresult.id).toString());
            if (!isfocusin.booleanValue()) goto _L1; else goto _L7
_L7:
            H h2 = mH;
            h2;
            JVM INSTR monitorenter ;
            if (mBindSequence < 0 || mBindSequence != inputbindresult.sequence)
            {
                Log.w("InputMethodManager", (new StringBuilder()).append("Ignoring onBind: cur seq=").append(mBindSequence).append(", given seq=").append(inputbindresult.sequence).toString());
                return;
            }
              goto _L8
            Exception exception2;
            exception2;
            h2;
            JVM INSTR monitorexit ;
            throw exception2;
_L8:
            mCurMethod = inputbindresult.method;
            mCurId = inputbindresult.id;
            mBindSequence = inputbindresult.sequence;
            h2;
            JVM INSTR monitorexit ;
            startInputInner(null, 0, 0, 0);
            return;
_L4:
            int i;
            i = message.arg1;
            Log.i("InputMethodManager", (new StringBuilder()).append("handleMessage: MSG_UNBIND ").append(i).toString());
            H h1 = mH;
            h1;
            JVM INSTR monitorenter ;
            int j = mBindSequence;
            boolean flag1;
            flag1 = false;
            if (j != i)
                break MISSING_BLOCK_LABEL_494;
            boolean flag2;
            clearBindingLocked();
            if (mServedView != null && mServedView.isFocused())
                mServedConnecting = true;
            flag2 = mActive;
            flag1 = false;
            if (flag2)
                flag1 = true;
            h1;
            JVM INSTR monitorexit ;
            if (!flag1) goto _L1; else goto _L9
_L9:
            startInputInner(null, 0, 0, 0);
            return;
            Exception exception1;
            exception1;
            h1;
            JVM INSTR monitorexit ;
            throw exception1;
_L5:
            H h;
            Exception exception;
            if (message.arg1 == 0)
                flag = false;
            Log.i("InputMethodManager", (new StringBuilder()).append("handleMessage: MSG_SET_ACTIVE ").append(flag).append(", was ").append(mActive).toString());
            h = mH;
            h;
            JVM INSTR monitorenter ;
            mActive = flag;
            mFullscreenMode = false;
            if (flag) goto _L11; else goto _L10
_L10:
            mHasBeenInactive = true;
            try
            {
                mIInputContext.finishComposingText();
            }
            catch (RemoteException remoteexception) { }
            if (mServedView != null && mServedView.hasWindowFocus() && checkFocusNoStartInput(mHasBeenInactive, false))
                startInputInner(null, 0, 0, 0);
_L11:
            h;
            JVM INSTR monitorexit ;
            return;
            exception;
            h;
            JVM INSTR monitorexit ;
            throw exception;
_L6:
            timeoutEvent(message.arg1);
            return;
        }

        H(Looper looper)
        {
            this$0 = InputMethodManager.this;
            super(looper);
        }
    }

    private static final class PendingEvent
    {

        public FinishedEventCallback mCallback;
        public String mInputMethodId;
        public PendingEvent mNext;
        public int mSeq;
        public long mStartTime;

        private PendingEvent()
        {
        }

    }


    public static final int CONTROL_START_INITIAL = 256;
    public static final int CONTROL_WINDOW_FIRST = 4;
    public static final int CONTROL_WINDOW_IS_TEXT_EDITOR = 2;
    public static final int CONTROL_WINDOW_VIEW_HAS_FOCUS = 1;
    static boolean DEBUG = false;
    public static final int HIDE_IMPLICIT_ONLY = 1;
    public static final int HIDE_NOT_ALWAYS = 2;
    static final long INPUT_METHOD_NOT_RESPONDING_TIMEOUT = 2500L;
    static final boolean IS_USER_BUILD = false;
    private static final int MAX_PENDING_EVENT_POOL_SIZE = 4;
    static final int MSG_BIND = 2;
    static final int MSG_DUMP = 1;
    static final int MSG_EVENT_TIMEOUT = 5;
    static final int MSG_SET_ACTIVE = 4;
    static final int MSG_UNBIND = 3;
    public static final int RESULT_HIDDEN = 3;
    public static final int RESULT_SHOWN = 2;
    public static final int RESULT_UNCHANGED_HIDDEN = 1;
    public static final int RESULT_UNCHANGED_SHOWN = 0;
    public static final int SHOW_FORCED = 2;
    public static final int SHOW_IMPLICIT = 1;
    static final String TAG = "InputMethodManager";
    static InputMethodManager mInstance;
    static final Object mInstanceSync;
    Boolean isfocusin;
    boolean mActive;
    int mBindSequence;
    final com.android.internal.view.IInputMethodClient.Stub mClient = new com.android.internal.view.IInputMethodClient.Stub() {

        final InputMethodManager this$0;

        protected void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
        {
            CountDownLatch countdownlatch = new CountDownLatch(1);
            SomeArgs someargs = SomeArgs.obtain();
            someargs.arg1 = filedescriptor;
            someargs.arg2 = printwriter;
            someargs.arg3 = as;
            someargs.arg4 = countdownlatch;
            mH.sendMessage(mH.obtainMessage(1, someargs));
            try
            {
                if (!countdownlatch.await(5L, TimeUnit.SECONDS))
                    printwriter.println("Timeout waiting for dump");
                return;
            }
            catch (InterruptedException interruptedexception)
            {
                printwriter.println("Interrupted waiting for dump");
            }
        }

        public void onBindMethod(InputBindResult inputbindresult)
        {
            mH.sendMessage(mH.obtainMessage(2, inputbindresult));
        }

        public void onUnbindMethod(int i)
        {
            mH.sendMessage(mH.obtainMessage(3, i, 0));
        }

        public void setActive(boolean flag1)
        {
            H h = mH;
            H h1 = mH;
            int i;
            if (flag1)
                i = 1;
            else
                i = 0;
            h.sendMessage(h1.obtainMessage(4, i, 0));
        }

        public void setUsingInputMethod(boolean flag1)
        {
        }

            
            {
                this$0 = InputMethodManager.this;
                super();
            }
    }
;
    CompletionInfo mCompletions[];
    String mCurId;
    IInputMethodSession mCurMethod;
    View mCurRootView;
    EditorInfo mCurrentTextBoxAttribute;
    int mCursorCandEnd;
    int mCursorCandStart;
    Rect mCursorRect;
    int mCursorSelEnd;
    int mCursorSelStart;
    final InputConnection mDummyInputConnection = new BaseInputConnection(this, false);
    PendingEvent mFirstPendingEvent;
    boolean mFullscreenMode;
    final H mH;
    boolean mHasBeenInactive;
    final IInputContext mIInputContext;
    final IInputMethodCallback mInputMethodCallback = new com.android.internal.view.IInputMethodCallback.Stub() {

        final InputMethodManager this$0;

        public void finishedEvent(int i, boolean flag1)
        {
            InputMethodManager.this.finishedEvent(i, flag1);
        }

        public void notifyImsPid(int i)
        {
        }

        public void sessionCreated(IInputMethodSession iinputmethodsession)
        {
        }

            
            {
                this$0 = InputMethodManager.this;
                super();
            }
    }
;
    final Looper mMainLooper;
    View mNextServedView;
    PendingEvent mPendingEventPool;
    int mPendingEventPoolSize;
    boolean mServedConnecting;
    InputConnection mServedInputConnection;
    ControlledInputConnectionWrapper mServedInputConnectionWrapper;
    View mServedView;
    final IInputMethodManager mService;
    Rect mTmpCursorRect;

    InputMethodManager(IInputMethodManager iinputmethodmanager, Looper looper)
    {
        boolean flag = true;
        super();
        mActive = false;
        mHasBeenInactive = flag;
        mTmpCursorRect = new Rect();
        mCursorRect = new Rect();
        mBindSequence = -1;
        mService = iinputmethodmanager;
        mMainLooper = looper;
        mH = new H(looper);
        mIInputContext = new ControlledInputConnectionWrapper(looper, mDummyInputConnection, this);
        if (!"1".equals(SystemProperties.get("imm.debug", "0")))
            flag = false;
        DEBUG = flag;
        BaseInputConnection.DEBUG = DEBUG;
        EditableInputConnection.DEBUG = DEBUG;
        if (mInstance == null)
            mInstance = this;
    }

    private boolean checkFocusNoStartInput(boolean flag, boolean flag1)
    {
        if (mServedView == mNextServedView && !flag)
            return false;
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        if (mServedView != mNextServedView || flag)
            break MISSING_BLOCK_LABEL_50;
        h;
        JVM INSTR monitorexit ;
        return false;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        if (!DEBUG) goto _L2; else goto _L1
_L1:
        StringBuilder stringbuilder;
        String s;
        stringbuilder = (new StringBuilder()).append("checkFocus: view=").append(mServedView).append(" next=").append(mNextServedView).append(" forceNewFocus=").append(flag).append(" package=");
        if (mServedView == null)
            break MISSING_BLOCK_LABEL_207;
        s = mServedView.getContext().getPackageName();
_L5:
        Log.v("InputMethodManager", stringbuilder.append(s).toString());
_L2:
        if (mNextServedView != null) goto _L4; else goto _L3
_L3:
        finishInputLocked();
        closeCurrentInput();
        h;
        JVM INSTR monitorexit ;
        return false;
_L4:
        InputConnection inputconnection;
        inputconnection = mServedInputConnection;
        mServedView = mNextServedView;
        mCurrentTextBoxAttribute = null;
        mCompletions = null;
        mServedConnecting = true;
        h;
        JVM INSTR monitorexit ;
        if (flag1 && inputconnection != null)
            inputconnection.finishComposingText();
        return true;
        s = "<none>";
          goto _L5
    }

    private PendingEvent dequeuePendingEventLocked(int i)
    {
label0:
        {
            PendingEvent pendingevent = mFirstPendingEvent;
            if (pendingevent == null)
                break label0;
            PendingEvent pendingevent1;
            if (pendingevent.mSeq == i)
                mFirstPendingEvent = pendingevent.mNext;
            else
                do
                {
                    pendingevent1 = pendingevent;
                    pendingevent = pendingevent.mNext;
                    if (pendingevent != null)
                    {
                        if (pendingevent.mSeq != i)
                            continue;
                        pendingevent1.mNext = pendingevent.mNext;
                        break;
                    }
                    break label0;
                } while (true);
            pendingevent.mNext = null;
            return pendingevent;
        }
        return null;
    }

    private void enqueuePendingEventLocked(long l, int i, String s, FinishedEventCallback finishedeventcallback)
    {
        PendingEvent pendingevent = obtainPendingEventLocked(l, i, s, finishedeventcallback);
        pendingevent.mNext = mFirstPendingEvent;
        mFirstPendingEvent = pendingevent;
        Message message = mH.obtainMessage(5, i, 0, pendingevent);
        message.setAsynchronous(true);
        mH.sendMessageDelayed(message, 2500L);
    }

    public static InputMethodManager getInstance(Context context)
    {
        return getInstance(context.getMainLooper());
    }

    public static InputMethodManager getInstance(Looper looper)
    {
label0:
        {
            InputMethodManager inputmethodmanager;
            synchronized (mInstanceSync)
            {
                if (mInstance == null)
                    break label0;
                inputmethodmanager = mInstance;
            }
            return inputmethodmanager;
        }
        mInstance = new InputMethodManager(com.android.internal.view.IInputMethodManager.Stub.asInterface(ServiceManager.getService("input_method")), looper);
        obj;
        JVM INSTR monitorexit ;
        return mInstance;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void notifyInputConnectionFinished()
    {
        if (mServedView != null && mServedInputConnection != null)
        {
            ViewRootImpl viewrootimpl = mServedView.getViewRootImpl();
            if (viewrootimpl != null)
                viewrootimpl.dispatchFinishInputConnection(mServedInputConnection);
        }
    }

    private PendingEvent obtainPendingEventLocked(long l, int i, String s, FinishedEventCallback finishedeventcallback)
    {
        PendingEvent pendingevent = mPendingEventPool;
        if (pendingevent != null)
        {
            mPendingEventPoolSize = -1 + mPendingEventPoolSize;
            mPendingEventPool = pendingevent.mNext;
            pendingevent.mNext = null;
        } else
        {
            pendingevent = new PendingEvent();
        }
        pendingevent.mStartTime = l;
        pendingevent.mSeq = i;
        pendingevent.mInputMethodId = s;
        pendingevent.mCallback = finishedeventcallback;
        return pendingevent;
    }

    public static InputMethodManager peekInstance()
    {
        return mInstance;
    }

    private void recyclePendingEventLocked(PendingEvent pendingevent)
    {
        pendingevent.mInputMethodId = null;
        pendingevent.mCallback = null;
        if (mPendingEventPoolSize < 4)
        {
            mPendingEventPoolSize = 1 + mPendingEventPoolSize;
            pendingevent.mNext = mPendingEventPool;
            mPendingEventPool = pendingevent;
        }
    }

    private void requestViewRootRelayout()
    {
        if (DEBUG)
            Log.d("InputMethodManager", "requestViewRootRelayout()");
        if (mServedView != null)
        {
            ViewRootImpl viewrootimpl = mServedView.getViewRootImpl();
            if (viewrootimpl != null)
            {
                viewrootimpl.requestLayoutBySoftInputChanged();
                return;
            }
        }
    }

    static void scheduleCheckFocusLocked(View view)
    {
        ViewRootImpl viewrootimpl = view.getViewRootImpl();
        if (viewrootimpl != null)
            viewrootimpl.dispatchCheckFocus();
    }

    private void showInputMethodPickerLocked()
    {
        try
        {
            mService.showInputMethodPickerFromClient(mClient);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        }
    }

    public void checkFocus()
    {
        if (checkFocusNoStartInput(false, true))
            startInputInner(null, 0, 0, 0);
    }

    void clearBindingLocked()
    {
        clearConnectionLocked();
        mBindSequence = -1;
        mCurId = null;
        mCurMethod = null;
    }

    void clearConnectionLocked()
    {
        mCurrentTextBoxAttribute = null;
        mServedInputConnection = null;
        if (mServedInputConnectionWrapper != null)
        {
            mServedInputConnectionWrapper.deactivate();
            mServedInputConnectionWrapper = null;
        }
    }

    void closeCurrentInput()
    {
        try
        {
            mService.hideSoftInput(mClient, 2, null);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void dispatchGenericMotionEvent(Context context, int i, MotionEvent motionevent, FinishedEventCallback finishedeventcallback)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        EditorInfo editorinfo;
        if (DEBUG)
            Log.d("InputMethodManager", "dispatchGenericMotionEvent");
        if (mCurMethod == null)
            break MISSING_BLOCK_LABEL_153;
        editorinfo = mCurrentTextBoxAttribute;
        if (editorinfo == null)
            break MISSING_BLOCK_LABEL_153;
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("DISPATCH GENERIC MOTION: ").append(mCurMethod).toString());
        enqueuePendingEventLocked(SystemClock.uptimeMillis(), i, mCurId, finishedeventcallback);
        mCurMethod.dispatchGenericMotionEvent(i, motionevent, mInputMethodCallback);
        h;
        JVM INSTR monitorexit ;
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).append(" dropping generic motion: ").append(motionevent).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        finishedeventcallback.finishedEvent(i, false);
        return;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void dispatchKeyEvent(Context context, int i, KeyEvent keyevent, FinishedEventCallback finishedeventcallback)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        IInputMethodSession iinputmethodsession;
        if (DEBUG)
            Log.d("InputMethodManager", "dispatchKeyEvent");
        iinputmethodsession = mCurMethod;
        boolean flag = false;
        if (iinputmethodsession == null) goto _L2; else goto _L1
_L1:
        if (keyevent.getAction() != 0 || keyevent.getKeyCode() != 63) goto _L4; else goto _L3
_L3:
        showInputMethodPickerLocked();
        flag = true;
_L2:
        h;
        JVM INSTR monitorexit ;
        finishedeventcallback.finishedEvent(i, flag);
        return;
_L4:
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("DISPATCH KEY: ").append(mCurMethod).toString());
        enqueuePendingEventLocked(SystemClock.uptimeMillis(), i, mCurId, finishedeventcallback);
        mCurMethod.dispatchKeyEvent(i, keyevent, mInputMethodCallback);
        h;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).append(" dropping: ").append(keyevent).toString(), remoteexception);
        flag = false;
        if (true) goto _L2; else goto _L5
_L5:
    }

    public void dispatchTrackballEvent(Context context, int i, MotionEvent motionevent, FinishedEventCallback finishedeventcallback)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        EditorInfo editorinfo;
        if (DEBUG)
            Log.d("InputMethodManager", "dispatchTrackballEvent");
        if (mCurMethod == null)
            break MISSING_BLOCK_LABEL_153;
        editorinfo = mCurrentTextBoxAttribute;
        if (editorinfo == null)
            break MISSING_BLOCK_LABEL_153;
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("DISPATCH TRACKBALL: ").append(mCurMethod).toString());
        enqueuePendingEventLocked(SystemClock.uptimeMillis(), i, mCurId, finishedeventcallback);
        mCurMethod.dispatchTrackballEvent(i, motionevent, mInputMethodCallback);
        h;
        JVM INSTR monitorexit ;
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).append(" dropping trackball: ").append(motionevent).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        finishedeventcallback.finishedEvent(i, false);
        return;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void displayCompletions(View view, CompletionInfo acompletioninfo[])
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if (mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view))
                    break label0;
            }
            return;
        }
        IInputMethodSession iinputmethodsession;
        mCompletions = acompletioninfo;
        iinputmethodsession = mCurMethod;
        if (iinputmethodsession == null)
            break MISSING_BLOCK_LABEL_69;
        try
        {
            mCurMethod.displayCompletions(mCompletions);
        }
        catch (RemoteException remoteexception) { }
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void doDump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        PrintWriterPrinter printwriterprinter = new PrintWriterPrinter(printwriter);
        if (as != null && as.length > 0)
        {
            if ("enable".equals(as[0]))
            {
                DEBUG = true;
                BaseInputConnection.DEBUG = true;
                EditableInputConnection.DEBUG = true;
                printwriterprinter.println("InputMethodManager DEBUG is turn on!");
                return;
            }
            if ("disable".equals(as[0]))
            {
                DEBUG = false;
                BaseInputConnection.DEBUG = false;
                EditableInputConnection.DEBUG = false;
                printwriterprinter.println("InputMethodManager DEBUG is turn off!");
                return;
            }
        }
        printwriterprinter.println((new StringBuilder()).append("Input method client state for ").append(this).append(":").toString());
        printwriterprinter.println((new StringBuilder()).append("  mService=").append(mService).toString());
        printwriterprinter.println((new StringBuilder()).append("  mMainLooper=").append(mMainLooper).toString());
        printwriterprinter.println((new StringBuilder()).append("  mIInputContext=").append(mIInputContext).toString());
        printwriterprinter.println((new StringBuilder()).append("  mActive=").append(mActive).append(" mHasBeenInactive=").append(mHasBeenInactive).append(" mBindSequence=").append(mBindSequence).append(" mCurId=").append(mCurId).toString());
        printwriterprinter.println((new StringBuilder()).append("  mCurMethod=").append(mCurMethod).toString());
        printwriterprinter.println((new StringBuilder()).append("  mCurRootView=").append(mCurRootView).toString());
        printwriterprinter.println((new StringBuilder()).append("  mServedView=").append(mServedView).toString());
        printwriterprinter.println((new StringBuilder()).append("  mNextServedView=").append(mNextServedView).toString());
        printwriterprinter.println((new StringBuilder()).append("  mServedConnecting=").append(mServedConnecting).toString());
        if (mCurrentTextBoxAttribute != null)
        {
            printwriterprinter.println("  mCurrentTextBoxAttribute:");
            mCurrentTextBoxAttribute.dump(printwriterprinter, "    ");
        } else
        {
            printwriterprinter.println("  mCurrentTextBoxAttribute: null");
        }
        printwriterprinter.println((new StringBuilder()).append("  mServedInputConnection=").append(mServedInputConnection).toString());
        printwriterprinter.println((new StringBuilder()).append("  mCompletions=").append(mCompletions).toString());
        printwriterprinter.println((new StringBuilder()).append("  mCursorRect=").append(mCursorRect).toString());
        printwriterprinter.println((new StringBuilder()).append("  mCursorSelStart=").append(mCursorSelStart).append(" mCursorSelEnd=").append(mCursorSelEnd).append(" mCursorCandStart=").append(mCursorCandStart).append(" mCursorCandEnd=").append(mCursorCandEnd).toString());
    }

    void finishInputLocked()
    {
        mCurRootView = null;
        mNextServedView = null;
        if (mServedView != null)
        {
            if (DEBUG)
                Log.v("InputMethodManager", (new StringBuilder()).append("FINISH INPUT: ").append(mServedView).toString());
            if (mCurrentTextBoxAttribute != null)
                try
                {
                    mService.finishInput(mClient);
                }
                catch (RemoteException remoteexception) { }
            notifyInputConnectionFinished();
            mServedView = null;
            mCompletions = null;
            mServedConnecting = false;
            clearConnectionLocked();
        }
    }

    void finishedEvent(int i, boolean flag)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        PendingEvent pendingevent = dequeuePendingEventLocked(i);
        if (pendingevent != null)
            break MISSING_BLOCK_LABEL_22;
        h;
        JVM INSTR monitorexit ;
        return;
        FinishedEventCallback finishedeventcallback;
        mH.removeMessages(5, pendingevent);
        finishedeventcallback = pendingevent.mCallback;
        recyclePendingEventLocked(pendingevent);
        h;
        JVM INSTR monitorexit ;
        finishedeventcallback.finishedEvent(i, flag);
        return;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void focusIn(View view)
    {
        synchronized (mH)
        {
            focusInLocked(view);
        }
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void focusInLocked(View view)
    {
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("focusIn: ").append(view).toString());
        isfocusin = Boolean.valueOf(true);
        if (mCurRootView != view.getRootView())
        {
            Log.v("InputMethodManager", "Not IME target window, ignoring");
            return;
        } else
        {
            mNextServedView = view;
            scheduleCheckFocusLocked(view);
            return;
        }
    }

    public void focusOut(View view)
    {
        synchronized (mH)
        {
            Log.v("InputMethodManager", (new StringBuilder()).append("focusOut: ").append(view).append(" mServedView=").append(mServedView).append(" winFocus=").append(view.hasWindowFocus()).toString());
            if (mServedView == view);
            isfocusin = Boolean.valueOf(false);
        }
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public IInputMethodClient getClient()
    {
        return mClient;
    }

    public InputMethodSubtype getCurrentInputMethodSubtype()
    {
        h;
        JVM INSTR monitorenter ;
        InputMethodSubtype inputmethodsubtype;
        synchronized (mH)
        {
            inputmethodsubtype = mService.getCurrentInputMethodSubtype();
        }
        return inputmethodsubtype;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        return null;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public List getEnabledInputMethodList()
    {
        List list;
        try
        {
            list = mService.getEnabledInputMethodList();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        return list;
    }

    public List getEnabledInputMethodSubtypeList(InputMethodInfo inputmethodinfo, boolean flag)
    {
        List list;
        try
        {
            list = mService.getEnabledInputMethodSubtypeList(inputmethodinfo, flag);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        return list;
    }

    public IInputContext getInputContext()
    {
        return mIInputContext;
    }

    public List getInputMethodList()
    {
        List list;
        try
        {
            list = mService.getInputMethodList();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        return list;
    }

    public InputMethodSubtype getLastInputMethodSubtype()
    {
        h;
        JVM INSTR monitorenter ;
        InputMethodSubtype inputmethodsubtype;
        synchronized (mH)
        {
            inputmethodsubtype = mService.getLastInputMethodSubtype();
        }
        return inputmethodsubtype;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        return null;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Map getShortcutInputMethodsAndSubtypes()
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        HashMap hashmap = new HashMap();
        List list = mService.getShortcutInputMethodsAndSubtypes();
        ArrayList arraylist = null;
        int i = list.size();
        if (list == null || i <= 0) goto _L2; else goto _L1
_L1:
        int j = 0;
_L11:
        if (j >= i) goto _L2; else goto _L3
_L3:
        Object obj = list.get(j);
        if (!(obj instanceof InputMethodInfo)) goto _L5; else goto _L4
_L4:
        if (!hashmap.containsKey(obj)) goto _L7; else goto _L6
_L6:
        Log.e("InputMethodManager", "IMI list already contains the same InputMethod.");
_L2:
        h;
        JVM INSTR monitorexit ;
        return hashmap;
_L7:
        arraylist = new ArrayList();
        hashmap.put((InputMethodInfo)obj, arraylist);
          goto _L8
_L5:
        if (arraylist == null) goto _L8; else goto _L9
_L9:
        if (obj instanceof InputMethodSubtype)
            arraylist.add((InputMethodSubtype)obj);
          goto _L8
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L2
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
_L8:
        j++;
        if (true) goto _L11; else goto _L10
_L10:
    }

    public void hideSoftInputFromInputMethod(IBinder ibinder, int i)
    {
        try
        {
            if (DEBUG)
                Log.d("InputMethodManager", "hideSoftInputFromInputMethod()");
            requestViewRootRelayout();
            mService.hideMySoftInput(ibinder, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public boolean hideSoftInputFromWindow(IBinder ibinder, int i)
    {
        return hideSoftInputFromWindow(ibinder, i, null);
    }

    public boolean hideSoftInputFromWindow(IBinder ibinder, int i, ResultReceiver resultreceiver)
    {
label0:
        {
            checkFocus();
            if (DEBUG)
                Log.d("InputMethodManager", "hideSoftInputFromWindow()");
            synchronized (mH)
            {
                if (mServedView != null && mServedView.getWindowToken() == ibinder)
                    break label0;
            }
            return false;
        }
        boolean flag;
        requestViewRootRelayout();
        flag = mService.hideSoftInput(mClient, i, resultreceiver);
        h;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        h;
        JVM INSTR monitorexit ;
        return false;
    }

    public void hideStatusIcon(IBinder ibinder)
    {
        try
        {
            mService.updateStatusIcon(ibinder, null, 0);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public boolean isAcceptingText()
    {
        checkFocus();
        return mServedInputConnection != null;
    }

    public boolean isActive()
    {
        checkFocus();
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if (mServedView != null && mCurrentTextBoxAttribute != null)
            flag = true;
        else
            flag = false;
        h;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isActive(View view)
    {
        checkFocus();
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if ((mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view)) && mCurrentTextBoxAttribute != null)
            flag = true;
        else
            flag = false;
        h;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isFullscreenMode()
    {
        return mFullscreenMode;
    }

    public boolean isWatchingCursor(View view)
    {
        return false;
    }

    public void notifyImsDump(boolean flag)
    {
        if (IS_USER_BUILD || mService == null)
            break MISSING_BLOCK_LABEL_23;
        mService.notifyImsDump(flag);
        return;
        Exception exception;
        exception;
        Log.e("InputMethodManager", "notifyImsANRdump exception", exception);
        return;
    }

    public void notifySuggestionPicked(SuggestionSpan suggestionspan, String s, int i)
    {
        try
        {
            mService.notifySuggestionPicked(suggestionspan, s, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void onWindowFocus(View view, View view1, int i, boolean flag, int j)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        boolean flag1;
        Log.v("InputMethodManager", (new StringBuilder()).append("onWindowFocus: ").append(view1).append(" softInputMode=").append(i).append(" first=").append(flag).append(" flags=#").append(Integer.toHexString(j)).toString());
        flag1 = mHasBeenInactive;
        boolean flag2 = false;
        if (!flag1) goto _L2; else goto _L1
_L1:
        if (DEBUG)
            Log.v("InputMethodManager", "Has been inactive!  Starting fresh");
        mHasBeenInactive = false;
        flag2 = true;
          goto _L2
_L7:
        View view2;
        focusInLocked(view2);
        h;
        JVM INSTR monitorexit ;
          goto _L3
_L5:
        view2 = view;
        continue; /* Loop/switch isn't completed */
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        int k = 0;
        if (view1 != null)
        {
            k = false | true;
            if (view1.onCheckIsTextEditor())
                k |= 2;
        }
        if (flag)
            k |= 4;
        Exception exception;
        if (checkFocusNoStartInput(flag2, true) && startInputInner(view.getWindowToken(), k, i, j))
            return;
        synchronized (mH)
        {
            try
            {
                if (DEBUG)
                    Log.v("InputMethodManager", "Reporting focus gain, without startInput");
                mService.windowGainedFocus(mClient, view.getWindowToken(), k, i, j, null, null);
            }
            // Misplaced declaration of an exception variable
            catch (RemoteException remoteexception) { }
        }
        return;
        exception1;
        h1;
        JVM INSTR monitorexit ;
        RemoteException remoteexception;
        throw exception1;
_L2:
        if (view1 == null) goto _L5; else goto _L4
_L4:
        view2 = view1;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void registerSuggestionSpansForNotification(SuggestionSpan asuggestionspan[])
    {
        try
        {
            mService.registerSuggestionSpansForNotification(asuggestionspan);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void reportFinishInputConnection(InputConnection inputconnection)
    {
        if (mServedInputConnection != inputconnection)
        {
            inputconnection.finishComposingText();
            if (inputconnection instanceof BaseInputConnection)
                ((BaseInputConnection)inputconnection).reportFinish();
        }
    }

    public void restartInput(View view)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if (mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view))
                    break label0;
            }
            return;
        }
        mServedConnecting = true;
        h;
        JVM INSTR monitorexit ;
        startInputInner(null, 0, 0, 0);
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void sendAppPrivateCommand(View view, String s, Bundle bundle)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if ((mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view)) && mCurrentTextBoxAttribute != null && mCurMethod != null)
                    break label0;
            }
            return;
        }
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("APP PRIVATE COMMAND ").append(s).append(": ").append(bundle).toString());
        mCurMethod.appPrivateCommand(s, bundle);
_L1:
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
    }

    public void setAdditionalInputMethodSubtypes(String s, InputMethodSubtype ainputmethodsubtype[])
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        mService.setAdditionalInputMethodSubtypes(s, ainputmethodsubtype);
_L1:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean setCurrentInputMethodSubtype(InputMethodSubtype inputmethodsubtype)
    {
        h;
        JVM INSTR monitorenter ;
        boolean flag;
        synchronized (mH)
        {
            flag = mService.setCurrentInputMethodSubtype(inputmethodsubtype);
        }
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        return false;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setFullscreenMode(boolean flag)
    {
        mFullscreenMode = flag;
    }

    public void setImeWindowStatus(IBinder ibinder, int i, int j)
    {
        try
        {
            mService.setImeWindowStatus(ibinder, i, j);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void setInputMethod(IBinder ibinder, String s)
    {
        try
        {
            mService.setInputMethod(ibinder, s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void setInputMethodAndSubtype(IBinder ibinder, String s, InputMethodSubtype inputmethodsubtype)
    {
        try
        {
            mService.setInputMethodAndSubtype(ibinder, s, inputmethodsubtype);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void showInputMethodAndSubtypeEnabler(String s)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        mService.showInputMethodAndSubtypeEnablerFromClient(mClient, s);
_L1:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void showInputMethodPicker()
    {
        synchronized (mH)
        {
            showInputMethodPickerLocked();
        }
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean showSoftInput(View view, int i)
    {
        return showSoftInput(view, i, null);
    }

    public boolean showSoftInput(View view, int i, ResultReceiver resultreceiver)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if (mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view))
                    break label0;
            }
            return false;
        }
        boolean flag = mService.showSoftInput(mClient, i, resultreceiver);
        h;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        h;
        JVM INSTR monitorexit ;
        return false;
    }

    public void showSoftInputFromInputMethod(IBinder ibinder, int i)
    {
        try
        {
            mService.showMySoftInput(ibinder, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void showSoftInputUnchecked(int i, ResultReceiver resultreceiver)
    {
        try
        {
            mService.showSoftInput(mClient, i, resultreceiver);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void showStatusIcon(IBinder ibinder, String s, int i)
    {
        try
        {
            mService.updateStatusIcon(ibinder, s, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void startGettingWindowFocus(View view)
    {
        synchronized (mH)
        {
            mCurRootView = view;
        }
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    boolean startInputInner(IBinder ibinder, int i, int j, int k)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        View view;
        view = mServedView;
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("Starting input: view=").append(view).toString());
        if (view != null)
            break MISSING_BLOCK_LABEL_73;
        if (DEBUG)
            Log.v("InputMethodManager", "ABORT input: no served view!");
        h;
        JVM INSTR monitorexit ;
        return false;
        h;
        JVM INSTR monitorexit ;
        Handler handler;
        handler = view.getHandler();
        if (handler == null)
        {
            if (DEBUG)
                Log.v("InputMethodManager", "ABORT input: no handler for view! Close current input.");
            closeCurrentInput();
            return false;
        }
        break MISSING_BLOCK_LABEL_117;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        EditorInfo editorinfo;
        InputConnection inputconnection;
        if (handler.getLooper() != Looper.myLooper())
        {
            if (DEBUG)
                Log.v("InputMethodManager", "Starting input: reschedule to view thread");
            handler.post(new Runnable() {

                final InputMethodManager this$0;

                public void run()
                {
                    startInputInner(null, 0, 0, 0);
                }

            
            {
                this$0 = InputMethodManager.this;
                super();
            }
            }
);
            return false;
        }
        editorinfo = new EditorInfo();
        editorinfo.packageName = view.getContext().getPackageName();
        editorinfo.fieldId = view.getId();
        inputconnection = view.onCreateInputConnection(editorinfo);
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("Starting input: tba=").append(editorinfo).append(" ic=").append(inputconnection).toString());
        synchronized (mH)
        {
            if (mServedView == view && mServedConnecting)
                break MISSING_BLOCK_LABEL_336;
            if (DEBUG)
                Log.v("InputMethodManager", (new StringBuilder()).append("Starting input: finished by someone else (view=").append(mServedView).append(" conn=").append(mServedConnecting).append(")").toString());
        }
        return false;
        exception1;
        h1;
        JVM INSTR monitorexit ;
        throw exception1;
        if (mCurrentTextBoxAttribute == null)
            i = 0x100 | i;
        mCurrentTextBoxAttribute = editorinfo;
        mServedConnecting = false;
        notifyInputConnectionFinished();
        mServedInputConnection = inputconnection;
        if (inputconnection == null) goto _L2; else goto _L1
_L1:
        ControlledInputConnectionWrapper controlledinputconnectionwrapper;
        mCursorSelStart = editorinfo.initialSelStart;
        mCursorSelEnd = editorinfo.initialSelEnd;
        mCursorCandStart = -1;
        mCursorCandEnd = -1;
        mCursorRect.setEmpty();
        controlledinputconnectionwrapper = new ControlledInputConnectionWrapper(handler.getLooper(), inputconnection, this);
_L12:
        if (mServedInputConnectionWrapper != null)
            mServedInputConnectionWrapper.deactivate();
        mServedInputConnectionWrapper = controlledinputconnectionwrapper;
        Log.v("InputMethodManager", (new StringBuilder()).append("START INPUT: ").append(view).append(" ic=").append(inputconnection).append(" tba=").append(editorinfo).append(" controlFlags=#").append(Integer.toHexString(i)).toString());
        if (ibinder == null) goto _L4; else goto _L3
_L3:
        InputBindResult inputbindresult = mService.windowGainedFocus(mClient, ibinder, i, j, k, editorinfo, controlledinputconnectionwrapper);
_L13:
        Log.v("InputMethodManager", (new StringBuilder()).append("Starting input: Bind result=").append(inputbindresult).toString());
        if (inputbindresult == null) goto _L6; else goto _L5
_L5:
        if (inputbindresult.id == null) goto _L8; else goto _L7
_L7:
        mBindSequence = inputbindresult.sequence;
        mCurMethod = inputbindresult.method;
        mCurId = inputbindresult.id;
_L15:
        if (mCurMethod == null) goto _L10; else goto _L9
_L9:
        CompletionInfo acompletioninfo[] = mCompletions;
        if (acompletioninfo == null) goto _L10; else goto _L11
_L11:
        RemoteException remoteexception;
        try
        {
            mCurMethod.displayCompletions(mCompletions);
        }
        catch (RemoteException remoteexception1) { }
_L10:
        h1;
        JVM INSTR monitorexit ;
        return true;
_L2:
        controlledinputconnectionwrapper = null;
          goto _L12
_L4:
        inputbindresult = mService.startInput(mClient, controlledinputconnectionwrapper, editorinfo, i);
          goto _L13
_L8:
        if (mCurMethod != null) goto _L15; else goto _L14
_L14:
        if (DEBUG)
            Log.v("InputMethodManager", "ABORT input: no input method!");
        h1;
        JVM INSTR monitorexit ;
        return true;
_L6:
        mHasBeenInactive = true;
        Log.w("InputMethodManager", "startInputInner : InputBindResult == null");
          goto _L15
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L10
    }

    public boolean switchToLastInputMethod(IBinder ibinder)
    {
        h;
        JVM INSTR monitorenter ;
        boolean flag;
        synchronized (mH)
        {
            flag = mService.switchToLastInputMethod(ibinder);
        }
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        return false;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean switchToNextInputMethod(IBinder ibinder, boolean flag)
    {
        h;
        JVM INSTR monitorenter ;
        boolean flag1;
        synchronized (mH)
        {
            flag1 = mService.switchToNextInputMethod(ibinder, flag);
        }
        return flag1;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
        h;
        JVM INSTR monitorexit ;
        return false;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void timeoutEvent(int i)
    {
        H h = mH;
        h;
        JVM INSTR monitorenter ;
        PendingEvent pendingevent = dequeuePendingEventLocked(i);
        if (pendingevent != null)
            break MISSING_BLOCK_LABEL_22;
        h;
        JVM INSTR monitorexit ;
        return;
        FinishedEventCallback finishedeventcallback;
        long l = SystemClock.uptimeMillis() - pendingevent.mStartTime;
        Log.w("InputMethodManager", (new StringBuilder()).append("Timeout waiting for IME to handle input event after ").append(l).append("ms: ").append(pendingevent.mInputMethodId).toString());
        finishedeventcallback = pendingevent.mCallback;
        recyclePendingEventLocked(pendingevent);
        h;
        JVM INSTR monitorexit ;
        notifyImsDump(false);
        finishedeventcallback.finishedEvent(i, false);
        return;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void toggleSoftInput(int i, int j)
    {
        if (mCurMethod == null)
            break MISSING_BLOCK_LABEL_18;
        mCurMethod.toggleSoftInput(i, j);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    public void toggleSoftInputFromWindow(IBinder ibinder, int i, int j)
    {
label0:
        {
            synchronized (mH)
            {
                if (mServedView != null && mServedView.getWindowToken() == ibinder)
                    break label0;
            }
            return;
        }
        IInputMethodSession iinputmethodsession = mCurMethod;
        if (iinputmethodsession == null)
            break MISSING_BLOCK_LABEL_53;
        try
        {
            mCurMethod.toggleSoftInput(i, j);
        }
        catch (RemoteException remoteexception) { }
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void updateCursor(View view, int i, int j, int k, int l)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if ((mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view)) && mCurrentTextBoxAttribute != null && mCurMethod != null)
                    break label0;
            }
            return;
        }
        mTmpCursorRect.set(i, j, k, l);
        if (mCursorRect.equals(mTmpCursorRect))
            break MISSING_BLOCK_LABEL_158;
        if (DEBUG)
            Log.d("InputMethodManager", "updateCursor");
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("CURSOR CHANGE: ").append(mCurMethod).toString());
        mCurMethod.updateCursor(mTmpCursorRect);
        mCursorRect.set(mTmpCursorRect);
_L1:
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
    }

    public void updateExtractedText(View view, int i, ExtractedText extractedtext)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if (mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view))
                    break label0;
            }
            return;
        }
        IInputMethodSession iinputmethodsession = mCurMethod;
        if (iinputmethodsession == null)
            break MISSING_BLOCK_LABEL_65;
        try
        {
            mCurMethod.updateExtractedText(i, extractedtext);
        }
        catch (RemoteException remoteexception) { }
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void updateSelection(View view, int i, int j, int k, int l)
    {
label0:
        {
            checkFocus();
            synchronized (mH)
            {
                if ((mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view)) && mCurrentTextBoxAttribute != null && mCurMethod != null)
                    break label0;
            }
            return;
        }
        if (mCursorSelStart == i && mCursorSelEnd == j && mCursorCandStart == k && mCursorCandEnd == l)
            break MISSING_BLOCK_LABEL_186;
        if (DEBUG)
            Log.d("InputMethodManager", "updateSelection");
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("SELECTION CHANGE: ").append(mCurMethod).toString());
        mCurMethod.updateSelection(mCursorSelStart, mCursorSelEnd, i, j, k, l);
        mCursorSelStart = i;
        mCursorSelEnd = j;
        mCursorCandStart = k;
        mCursorCandEnd = l;
_L1:
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
    }

    public void viewClicked(View view)
    {
        boolean flag;
label0:
        {
            if (mServedView != mNextServedView)
                flag = true;
            else
                flag = false;
            checkFocus();
            synchronized (mH)
            {
                if ((mServedView == view || mServedView != null && mServedView.checkInputConnectionProxy(view)) && mCurrentTextBoxAttribute != null && mCurMethod != null)
                    break label0;
            }
            return;
        }
        if (DEBUG)
            Log.v("InputMethodManager", (new StringBuilder()).append("onViewClicked: ").append(flag).toString());
        mCurMethod.viewClicked(flag);
_L1:
        h;
        JVM INSTR monitorexit ;
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
        Log.w("InputMethodManager", (new StringBuilder()).append("IME died: ").append(mCurId).toString(), remoteexception);
          goto _L1
    }

    public void windowDismissed(IBinder ibinder)
    {
        checkFocus();
        synchronized (mH)
        {
            if (mServedView != null && mServedView.getWindowToken() == ibinder)
                finishInputLocked();
        }
        return;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static 
    {
        boolean flag;
label0:
        {
            DEBUG = false;
            mInstanceSync = new Object();
            if (!"user".equals(Build.TYPE))
            {
                boolean flag1 = "userdebug".equals(Build.TYPE);
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        IS_USER_BUILD = flag;
    }

}
