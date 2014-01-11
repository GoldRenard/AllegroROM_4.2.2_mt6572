// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.*;
import android.graphics.*;
import android.os.*;
import android.util.AttributeSet;
import android.util.Log;
import com.android.internal.view.BaseIWindow;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.locks.ReentrantLock;

// Referenced classes of package android.view:
//            View, Surface, ViewRootImpl, Display, 
//            IWindowSession, ViewParent, ViewTreeObserver, SurfaceHolder

public class SurfaceView extends View
{
    private static class MyWindow extends BaseIWindow
    {

        int mCurHeight;
        int mCurWidth;
        private final WeakReference mSurfaceView;

        public void dispatchAppVisibility(boolean flag)
        {
        }

        public void dispatchGetNewSurface()
        {
            SurfaceView surfaceview = (SurfaceView)mSurfaceView.get();
            if (surfaceview != null)
            {
                Message message = surfaceview.mHandler.obtainMessage(2);
                surfaceview.mHandler.sendMessage(message);
            }
        }

        public void enableLog(boolean flag)
        {
            SurfaceView surfaceview = (SurfaceView)mSurfaceView.get();
            if (surfaceview != null)
                surfaceview.enableLog(flag);
        }

        public void executeCommand(String s, String s1, ParcelFileDescriptor parcelfiledescriptor)
        {
        }

        public void resized(Rect rect, Rect rect1, Rect rect2, boolean flag, Configuration configuration)
        {
            SurfaceView surfaceview = (SurfaceView)mSurfaceView.get();
            if (surfaceview == null) goto _L2; else goto _L1
_L1:
            if (SurfaceView.DEBUG)
                Log.v("SurfaceView", (new StringBuilder()).append(surfaceview).append(" got resized: w=").append(rect.width()).append(" h=").append(rect.height()).append(", cur w=").append(mCurWidth).append(" h=").append(mCurHeight).toString());
            surfaceview.mSurfaceLock.lock();
            if (!flag) goto _L4; else goto _L3
_L3:
            surfaceview.mUpdateWindowNeeded = true;
            surfaceview.mReportDrawNeeded = true;
            surfaceview.mHandler.sendEmptyMessage(3);
_L6:
            surfaceview.mSurfaceLock.unlock();
_L2:
            return;
_L4:
            if (surfaceview.mWinFrame.width() == rect.width() && surfaceview.mWinFrame.height() == rect.height()) goto _L6; else goto _L5
_L5:
            surfaceview.mUpdateWindowNeeded = true;
            surfaceview.mHandler.sendEmptyMessage(3);
              goto _L6
            Exception exception;
            exception;
            surfaceview.mSurfaceLock.unlock();
            throw exception;
        }

        public void windowFocusChanged(boolean flag, boolean flag1)
        {
            Log.w("SurfaceView", (new StringBuilder()).append("Unexpected focus in surface: focus=").append(flag).append(", touchEnabled=").append(flag1).toString());
        }

        public MyWindow(SurfaceView surfaceview)
        {
            mCurWidth = -1;
            mCurHeight = -1;
            mSurfaceView = new WeakReference(surfaceview);
        }
    }


    private static boolean DEBUG = false;
    static final int GET_NEW_SURFACE_MSG = 2;
    static final int KEEP_SCREEN_ON_MSG = 1;
    private static final String TAG = "SurfaceView";
    static final int UPDATE_WINDOW_MSG = 3;
    int m3DLayoutFlag;
    final ArrayList mCallbacks;
    final Configuration mConfiguration;
    final Rect mContentInsets;
    private final ViewTreeObserver.OnPreDrawListener mDrawListener;
    boolean mDrawingStopped;
    int mFormat;
    private boolean mGlobalListenersAdded;
    final Handler mHandler;
    boolean mHaveFrame;
    int mHeight;
    boolean mIsCreating;
    int mLastHeight;
    long mLastLockTime;
    int mLastSurfaceHeight;
    int mLastSurfaceWidth;
    int mLastWidth;
    final WindowManager.LayoutParams mLayout;
    int mLeft;
    final int mLocation[];
    final Surface mNewSurface;
    boolean mReportDrawNeeded;
    int mRequestedFormat;
    int mRequestedHeight;
    boolean mRequestedVisible;
    int mRequestedWidth;
    final ViewTreeObserver.OnScrollChangedListener mScrollChangedListener;
    IWindowSession mSession;
    final Surface mSurface;
    boolean mSurfaceCreated;
    final Rect mSurfaceFrame;
    private SurfaceHolder mSurfaceHolder = new SurfaceHolder() {

        private static final String LOG_TAG = "SurfaceHolder";
        final SurfaceView this$0;

        private final Canvas internalLockCanvas(Rect rect)
        {
            Canvas canvas;
            mSurfaceLock.lock();
            if (SurfaceView.DEBUG)
                Log.i("SurfaceView", (new StringBuilder()).append("Locking canvas... stopped=").append(mDrawingStopped).append(", win=").append(mWindow).toString());
            boolean flag = mDrawingStopped;
            canvas = null;
            if (flag)
                break MISSING_BLOCK_LABEL_161;
            MyWindow mywindow = mWindow;
            canvas = null;
            if (mywindow == null)
                break MISSING_BLOCK_LABEL_161;
            if (rect == null)
            {
                if (mTmpDirty == null)
                    mTmpDirty = new Rect();
                mTmpDirty.set(mSurfaceFrame);
                rect = mTmpDirty;
            }
            Canvas canvas1 = mSurface.lockCanvas(rect);
            canvas = canvas1;
_L2:
            if (SurfaceView.DEBUG)
                Log.i("SurfaceView", (new StringBuilder()).append("Returned canvas: ").append(canvas).toString());
            if (canvas != null)
            {
                mLastLockTime = SystemClock.uptimeMillis();
                return canvas;
            }
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            Log.e("SurfaceHolder", "Exception locking surface", exception);
            canvas = null;
            if (true) goto _L2; else goto _L1
_L1:
            long l = SystemClock.uptimeMillis();
            long l1 = 100L + mLastLockTime;
            if (l1 > l)
            {
                long l2 = l1 - l;
                try
                {
                    Thread.sleep(l2);
                }
                catch (InterruptedException interruptedexception) { }
                l = SystemClock.uptimeMillis();
            }
            mLastLockTime = l;
            mSurfaceLock.unlock();
            return null;
        }

        public void addCallback(SurfaceHolder.Callback callback)
        {
            synchronized (mCallbacks)
            {
                if (!mCallbacks.contains(callback))
                    mCallbacks.add(callback);
            }
            return;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Surface getSurface()
        {
            return mSurface;
        }

        public Rect getSurfaceFrame()
        {
            return mSurfaceFrame;
        }

        public boolean isCreating()
        {
            return mIsCreating;
        }

        public Canvas lockCanvas()
        {
            return internalLockCanvas(null);
        }

        public Canvas lockCanvas(Rect rect)
        {
            return internalLockCanvas(rect);
        }

        public void removeCallback(SurfaceHolder.Callback callback)
        {
            synchronized (mCallbacks)
            {
                mCallbacks.remove(callback);
            }
            return;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setFixedSize(int i, int j)
        {
            if (mRequestedWidth != i || mRequestedHeight != j)
            {
                mRequestedWidth = i;
                mRequestedHeight = j;
                requestLayout();
            }
        }

        public void setFormat(int i)
        {
            if (i == -1)
                i = 4;
            mRequestedFormat = i;
            if (mWindow != null)
                updateWindow(false, false);
        }

        public void setKeepScreenOn(boolean flag)
        {
            int i = 1;
            Message message = mHandler.obtainMessage(i);
            if (!flag)
                i = 0;
            message.arg1 = i;
            mHandler.sendMessage(message);
        }

        public void setSizeFromLayout()
        {
            if (mRequestedWidth != -1 || mRequestedHeight != -1)
            {
                SurfaceView surfaceview = SurfaceView.this;
                mRequestedHeight = -1;
                surfaceview.mRequestedWidth = -1;
                requestLayout();
            }
        }

        public void setType(int i)
        {
        }

        public void unlockCanvasAndPost(Canvas canvas)
        {
            mSurface.unlockCanvasAndPost(canvas);
            mSurfaceLock.unlock();
        }

            
            {
                this$0 = SurfaceView.this;
                super();
            }
    }
;
    final ReentrantLock mSurfaceLock;
    Rect mTmpDirty;
    int mTop;
    private android.content.res.CompatibilityInfo.Translator mTranslator;
    boolean mUpdateWindowNeeded;
    boolean mViewVisibility;
    boolean mVisible;
    final Rect mVisibleInsets;
    int mWidth;
    final Rect mWinFrame;
    MyWindow mWindow;
    int mWindowType;
    boolean mWindowVisibility;

    public SurfaceView(Context context)
    {
        super(context);
        mCallbacks = new ArrayList();
        mLocation = new int[2];
        mSurfaceLock = new ReentrantLock();
        mSurface = new Surface();
        mNewSurface = new Surface();
        mDrawingStopped = true;
        mLayout = new WindowManager.LayoutParams();
        mVisibleInsets = new Rect();
        mWinFrame = new Rect();
        mContentInsets = new Rect();
        mConfiguration = new Configuration();
        mWindowType = 1001;
        mIsCreating = false;
        mHandler = new Handler() {

            final SurfaceView this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 3: // '\003'
                    updateWindow(false, false);
                    return;

                case 2: // '\002'
                    handleGetNewSurface();
                    return;

                case 1: // '\001'
                    SurfaceView surfaceview = SurfaceView.this;
                    int i = message.arg1;
                    boolean flag = false;
                    if (i != 0)
                        flag = true;
                    surfaceview.setKeepScreenOn(flag);
                    return;
                }
            }

            
            {
                this$0 = SurfaceView.this;
                super();
            }
        }
;
        mScrollChangedListener = new ViewTreeObserver.OnScrollChangedListener() {

            final SurfaceView this$0;

            public void onScrollChanged()
            {
                updateWindow(false, false);
            }

            
            {
                this$0 = SurfaceView.this;
                super();
            }
        }
;
        mRequestedVisible = false;
        mWindowVisibility = false;
        mViewVisibility = false;
        mRequestedWidth = -1;
        mRequestedHeight = -1;
        m3DLayoutFlag = 0;
        mRequestedFormat = 4;
        mHaveFrame = false;
        mSurfaceCreated = false;
        mLastLockTime = 0L;
        mVisible = false;
        mLeft = -1;
        mTop = -1;
        mWidth = -1;
        mHeight = -1;
        mFormat = -1;
        mSurfaceFrame = new Rect();
        mLastSurfaceWidth = -1;
        mLastSurfaceHeight = -1;
        mLastWidth = -1;
        mLastHeight = -1;
        mDrawListener = new ViewTreeObserver.OnPreDrawListener() {

            final SurfaceView this$0;

            public boolean onPreDraw()
            {
                SurfaceView surfaceview = SurfaceView.this;
                boolean flag;
                if (getWidth() > 0 && getHeight() > 0)
                    flag = true;
                else
                    flag = false;
                surfaceview.mHaveFrame = flag;
                updateWindow(false, false);
                return true;
            }

            
            {
                this$0 = SurfaceView.this;
                super();
            }
        }
;
        init();
    }

    public SurfaceView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mCallbacks = new ArrayList();
        mLocation = new int[2];
        mSurfaceLock = new ReentrantLock();
        mSurface = new Surface();
        mNewSurface = new Surface();
        mDrawingStopped = true;
        mLayout = new WindowManager.LayoutParams();
        mVisibleInsets = new Rect();
        mWinFrame = new Rect();
        mContentInsets = new Rect();
        mConfiguration = new Configuration();
        mWindowType = 1001;
        mIsCreating = false;
        mHandler = new _cls1();
        mScrollChangedListener = new _cls2();
        mRequestedVisible = false;
        mWindowVisibility = false;
        mViewVisibility = false;
        mRequestedWidth = -1;
        mRequestedHeight = -1;
        m3DLayoutFlag = 0;
        mRequestedFormat = 4;
        mHaveFrame = false;
        mSurfaceCreated = false;
        mLastLockTime = 0L;
        mVisible = false;
        mLeft = -1;
        mTop = -1;
        mWidth = -1;
        mHeight = -1;
        mFormat = -1;
        mSurfaceFrame = new Rect();
        mLastSurfaceWidth = -1;
        mLastSurfaceHeight = -1;
        mLastWidth = -1;
        mLastHeight = -1;
        mDrawListener = new _cls3();
        init();
    }

    public SurfaceView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mCallbacks = new ArrayList();
        mLocation = new int[2];
        mSurfaceLock = new ReentrantLock();
        mSurface = new Surface();
        mNewSurface = new Surface();
        mDrawingStopped = true;
        mLayout = new WindowManager.LayoutParams();
        mVisibleInsets = new Rect();
        mWinFrame = new Rect();
        mContentInsets = new Rect();
        mConfiguration = new Configuration();
        mWindowType = 1001;
        mIsCreating = false;
        mHandler = new _cls1();
        mScrollChangedListener = new _cls2();
        mRequestedVisible = false;
        mWindowVisibility = false;
        mViewVisibility = false;
        mRequestedWidth = -1;
        mRequestedHeight = -1;
        m3DLayoutFlag = 0;
        mRequestedFormat = 4;
        mHaveFrame = false;
        mSurfaceCreated = false;
        mLastLockTime = 0L;
        mVisible = false;
        mLeft = -1;
        mTop = -1;
        mWidth = -1;
        mHeight = -1;
        mFormat = -1;
        mSurfaceFrame = new Rect();
        mLastSurfaceWidth = -1;
        mLastSurfaceHeight = -1;
        mLastWidth = -1;
        mLastHeight = -1;
        mDrawListener = new _cls3();
        init();
    }

    private SurfaceHolder.Callback[] getSurfaceCallbacks()
    {
        SurfaceHolder.Callback acallback[];
        synchronized (mCallbacks)
        {
            acallback = new SurfaceHolder.Callback[mCallbacks.size()];
            mCallbacks.toArray(acallback);
        }
        return acallback;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void init()
    {
        setWillNotDraw(true);
    }

    private void updateWindow(boolean flag, boolean flag1)
    {
        if (mHaveFrame) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i;
        int j;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        boolean flag6;
        boolean flag7;
        boolean flag9;
        int j1;
        boolean flag11;
        boolean flag12;
        SurfaceHolder.Callback acallback[];
        int k4;
        ViewRootImpl viewrootimpl = getViewRootImpl();
        if (viewrootimpl != null)
            mTranslator = viewrootimpl.mTranslator;
        if (mTranslator != null)
            mSurface.setCompatibilityTranslator(mTranslator);
        i = mRequestedWidth;
        if (i <= 0)
            i = getWidth();
        j = mRequestedHeight;
        if (j <= 0)
            j = getHeight();
        boolean flag2;
        WindowManager.LayoutParams layoutparams;
        boolean flag8;
        IWindowSession iwindowsession;
        MyWindow mywindow;
        int k;
        WindowManager.LayoutParams layoutparams1;
        int l;
        int i1;
        int k1;
        int l1;
        int i2;
        boolean flag13;
        boolean flag14;
        SurfaceHolder.Callback acallback4[];
        int l3;
        int i4;
        Display display;
        IWindowSession iwindowsession1;
        MyWindow mywindow1;
        int j4;
        WindowManager.LayoutParams layoutparams2;
        WindowManager.LayoutParams layoutparams3;
        StringBuilder stringbuilder;
        StringBuilder stringbuilder1;
        if (mLastWidth != getWidth() || mLastHeight != getHeight())
            flag2 = true;
        else
            flag2 = false;
        getLocationInWindow(mLocation);
        if (mWindow == null)
            flag3 = true;
        else
            flag3 = false;
        if (mFormat != mRequestedFormat)
            flag4 = true;
        else
            flag4 = false;
        if (mWidth != i || mHeight != j || flag2)
            flag5 = true;
        else
            flag5 = false;
        if (mVisible != mRequestedVisible)
            flag6 = true;
        else
            flag6 = false;
        if (!flag && !flag3 && !flag4 && !flag5 && !flag6 && mLeft == mLocation[0] && mTop == mLocation[1] && !mUpdateWindowNeeded && !mReportDrawNeeded && !flag1) goto _L1; else goto _L3
_L3:
        if (DEBUG)
        {
            stringbuilder = (new StringBuilder()).append("Changes: creating=").append(flag3).append(" format=").append(flag4).append(" size=").append(flag5).append(" visible=").append(flag6).append(" left=");
            boolean flag15;
            boolean flag16;
            if (mLeft != mLocation[0])
                flag15 = true;
            else
                flag15 = false;
            stringbuilder1 = stringbuilder.append(flag15).append(" top=");
            if (mTop != mLocation[1])
                flag16 = true;
            else
                flag16 = false;
            Log.i("SurfaceView", stringbuilder1.append(flag16).append(" mUpdateWindowNeeded=").append(mUpdateWindowNeeded).append(" mReportDrawNeeded=").append(mReportDrawNeeded).append(" redrawNeeded=").append(flag1).append(" forceSizeChanged=").append(flag2).append(" mVisible=").append(mVisible).append(" mRequestedVisible=").append(mRequestedVisible).toString());
        }
        flag7 = mRequestedVisible;
        mVisible = flag7;
        mLeft = mLocation[0];
        mTop = mLocation[1];
        mWidth = i;
        mHeight = j;
        mLastWidth = getWidth();
        mLastHeight = getHeight();
        mFormat = mRequestedFormat;
        mLayout.x = mLeft;
        mLayout.y = mTop;
        mLayout.width = getWidth();
        mLayout.height = getHeight();
        if (mTranslator != null)
            mTranslator.translateLayoutParamsInAppWindowToScreen(mLayout);
        mLayout.format = mRequestedFormat;
        layoutparams = mLayout;
        layoutparams.flags = 0x4218 | layoutparams.flags;
        if (!getContext().getResources().getCompatibilityInfo().supportsScreen())
        {
            layoutparams3 = mLayout;
            layoutparams3.flags = 0x20000000 | layoutparams3.flags;
        }
        if (mWindow != null)
            break MISSING_BLOCK_LABEL_748;
        display = getDisplay();
        mWindow = new MyWindow(this);
        mLayout.type = mWindowType;
        mLayout.gravity = 0x800033;
        iwindowsession1 = mSession;
        mywindow1 = mWindow;
        j4 = mWindow.mSeq;
        layoutparams2 = mLayout;
        if (mVisible)
            k4 = 0;
        else
            k4 = 8;
        iwindowsession1.addToDisplayWithoutInputChannel(mywindow1, j4, layoutparams2, k4, display.getDisplayId(), mContentInsets);
        mSurfaceLock.lock();
        mUpdateWindowNeeded = false;
        flag8 = mReportDrawNeeded;
        mReportDrawNeeded = false;
        if (!flag7)
            flag9 = true;
        else
            flag9 = false;
        mDrawingStopped = flag9;
        if (DEBUG)
            Log.i("SurfaceView", (new StringBuilder()).append("Cur surface: ").append(mSurface).toString());
        iwindowsession = mSession;
        mywindow = mWindow;
        k = mWindow.mSeq;
        layoutparams1 = mLayout;
        l = mWidth;
        i1 = mHeight;
        if (flag7)
            j1 = 0;
        else
            j1 = 8;
        k1 = iwindowsession.relayout(mywindow, k, layoutparams1, l, i1, j1, 2, mWinFrame, mContentInsets, mVisibleInsets, mConfiguration, mNewSurface);
        if ((k1 & 2) == 0)
            break MISSING_BLOCK_LABEL_921;
        mReportDrawNeeded = true;
        if (DEBUG)
            Log.i("SurfaceView", (new StringBuilder()).append("New surface: ").append(mNewSurface).append(", vis=").append(flag7).append(", frame=").append(mWinFrame).toString());
        mSurfaceFrame.left = 0;
        mSurfaceFrame.top = 0;
        if (mTranslator != null) goto _L5; else goto _L4
_L4:
        mSurfaceFrame.right = mWinFrame.width();
        mSurfaceFrame.bottom = mWinFrame.height();
_L13:
        l1 = mSurfaceFrame.right;
        i2 = mSurfaceFrame.bottom;
        boolean flag10;
        Exception exception1;
        SurfaceHolder.Callback acallback1[];
        int j2;
        int k2;
        SurfaceHolder.Callback acallback2[];
        int l2;
        int i3;
        SurfaceHolder.Callback acallback3[];
        int j3;
        int k3;
        if (mLastSurfaceWidth == l1 && mLastSurfaceHeight == i2)
            flag10 = false;
        else
            flag10 = true;
        mLastSurfaceWidth = l1;
        mLastSurfaceHeight = i2;
        mSurfaceLock.unlock();
        flag11 = flag1 | (flag3 | flag8);
        RemoteException remoteexception;
        Exception exception;
        float f;
        if ((k1 & 4) != 0)
            flag12 = true;
        else
            flag12 = false;
        flag13 = mSurfaceCreated;
        acallback = null;
        if (!flag13) goto _L7; else goto _L6
_L6:
        if (flag12) goto _L9; else goto _L8
_L8:
        acallback = null;
        if (flag7) goto _L7; else goto _L10
_L10:
        acallback = null;
        if (!flag6) goto _L7; else goto _L9
_L9:
        mSurfaceCreated = false;
        flag14 = mSurface.isValid();
        acallback = null;
        if (!flag14) goto _L7; else goto _L11
_L11:
        if (DEBUG)
            Log.i("SurfaceView", "visibleChanged -- surfaceDestroyed");
        acallback = getSurfaceCallbacks();
        acallback4 = acallback;
        l3 = acallback4.length;
        i4 = 0;
_L12:
        if (i4 >= l3)
            break; /* Loop/switch isn't completed */
        acallback4[i4].surfaceDestroyed(mSurfaceHolder);
        i4++;
        if (true) goto _L12; else goto _L7
_L5:
        f = mTranslator.applicationInvertedScale;
        mSurfaceFrame.right = (int)(0.5F + f * (float)mWinFrame.width());
        mSurfaceFrame.bottom = (int)(0.5F + f * (float)mWinFrame.height());
          goto _L13
        exception;
        try
        {
            mSurfaceLock.unlock();
            throw exception;
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception) { }
_L26:
        if (!DEBUG) goto _L1; else goto _L14
_L14:
        Log.v("SurfaceView", (new StringBuilder()).append("Layout: x=").append(mLayout.x).append(" y=").append(mLayout.y).append(" w=").append(((ViewGroup.LayoutParams) (mLayout)).width).append(" h=").append(((ViewGroup.LayoutParams) (mLayout)).height).append(", frame=").append(mSurfaceFrame).toString());
        return;
_L7:
        mSurface.transferFrom(mNewSurface);
        if (!flag7) goto _L16; else goto _L15
_L15:
        if (!mSurface.isValid()) goto _L16; else goto _L17
_L17:
        if (mSurfaceCreated || !flag12 && !flag6) goto _L19; else goto _L18
_L18:
        mSurfaceCreated = true;
        mIsCreating = true;
        if (DEBUG)
            Log.i("SurfaceView", "visibleChanged -- surfaceCreated");
        if (acallback != null)
            break MISSING_BLOCK_LABEL_1550;
        acallback = getSurfaceCallbacks();
        acallback1 = acallback;
        j2 = acallback1.length;
        k2 = 0;
_L21:
        if (k2 >= j2) goto _L19; else goto _L20
_L20:
        acallback1[k2].surfaceCreated(mSurfaceHolder);
        k2++;
          goto _L21
_L27:
        if (DEBUG)
            Log.i("SurfaceView", (new StringBuilder()).append("surfaceChanged -- format=").append(mFormat).append(" w=").append(i).append(" h=").append(j).toString());
        if (acallback != null)
            break MISSING_BLOCK_LABEL_1657;
        acallback = getSurfaceCallbacks();
        acallback2 = acallback;
        l2 = acallback2.length;
        i3 = 0;
_L23:
        if (i3 >= l2)
            break; /* Loop/switch isn't completed */
        acallback2[i3].surfaceChanged(mSurfaceHolder, mFormat, i, j);
        i3++;
        if (true) goto _L23; else goto _L22
_L22:
        if (!flag11) goto _L16; else goto _L24
_L24:
        if (DEBUG)
            Log.i("SurfaceView", "surfaceRedrawNeeded");
        if (acallback != null)
            break MISSING_BLOCK_LABEL_1735;
        acallback = getSurfaceCallbacks();
        acallback3 = acallback;
        j3 = acallback3.length;
        k3 = 0;
_L25:
        if (k3 >= j3)
            break; /* Loop/switch isn't completed */
        SurfaceHolder.Callback callback = acallback3[k3];
        if (callback instanceof SurfaceHolder.Callback2)
            ((SurfaceHolder.Callback2)callback).surfaceRedrawNeeded(mSurfaceHolder);
        k3++;
        if (true) goto _L25; else goto _L16
        exception1;
        mIsCreating = false;
        if (!flag11)
            break MISSING_BLOCK_LABEL_1829;
        if (DEBUG)
            Log.i("SurfaceView", "finishedDrawing");
        mSession.finishDrawing(mWindow);
        mSession.performDeferredDestroy(mWindow);
        throw exception1;
_L16:
        mIsCreating = false;
        if (!flag11)
            break MISSING_BLOCK_LABEL_1883;
        if (DEBUG)
            Log.i("SurfaceView", "finishedDrawing");
        mSession.finishDrawing(mWindow);
        mSession.performDeferredDestroy(mWindow);
          goto _L26
_L19:
        if (!flag3 && !flag4 && !flag5 && !flag6 && !flag10) goto _L22; else goto _L27
    }

    protected void dispatchDraw(Canvas canvas)
    {
        if (mWindowType != 1000 && (0x80 & super.mPrivateFlags) == 128)
            canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        super.dispatchDraw(canvas);
    }

    public void draw(Canvas canvas)
    {
        if (mWindowType != 1000 && (0x80 & super.mPrivateFlags) == 0)
            canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        super.draw(canvas);
    }

    protected void enableLog(boolean flag)
    {
        Log.d("SurfaceView", "enableLog enable");
        DEBUG = flag;
    }

    public boolean gatherTransparentRegion(Region region)
    {
        boolean flag;
        if (mWindowType == 1000)
        {
            flag = super.gatherTransparentRegion(region);
        } else
        {
            flag = true;
            if ((0x80 & super.mPrivateFlags) == 0)
                flag = super.gatherTransparentRegion(region);
            else
            if (region != null)
            {
                int i = getWidth();
                int j = getHeight();
                if (i > 0 && j > 0)
                {
                    getLocationInWindow(mLocation);
                    int k = mLocation[0];
                    int l = mLocation[1];
                    region.op(k, l, k + i, l + j, android.graphics.Region.Op.UNION);
                }
            }
            if (PixelFormat.formatHasAlpha(mRequestedFormat))
                return false;
        }
        return flag;
    }

    public SurfaceHolder getHolder()
    {
        return mSurfaceHolder;
    }

    void handleGetNewSurface()
    {
        updateWindow(false, false);
    }

    public boolean isFixedSize()
    {
        return mRequestedWidth != -1 || mRequestedHeight != -1;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        super.mParent.requestTransparentRegion(this);
        mSession = getWindowSession();
        mLayout.token = getWindowToken();
        mLayout.setTitle("SurfaceView");
        boolean flag;
        if (getVisibility() == 0)
            flag = true;
        else
            flag = false;
        mViewVisibility = flag;
        if (!mGlobalListenersAdded)
        {
            ViewTreeObserver viewtreeobserver = getViewTreeObserver();
            viewtreeobserver.addOnScrollChangedListener(mScrollChangedListener);
            viewtreeobserver.addOnPreDrawListener(mDrawListener);
            mGlobalListenersAdded = true;
        }
    }

    protected void onDetachedFromWindow()
    {
        if (mGlobalListenersAdded)
        {
            ViewTreeObserver viewtreeobserver = getViewTreeObserver();
            viewtreeobserver.removeOnScrollChangedListener(mScrollChangedListener);
            viewtreeobserver.removeOnPreDrawListener(mDrawListener);
            mGlobalListenersAdded = false;
        }
        mRequestedVisible = false;
        updateWindow(false, false);
        mHaveFrame = false;
        if (mWindow != null)
        {
            try
            {
                mSession.remove(mWindow);
            }
            catch (RemoteException remoteexception) { }
            mWindow = null;
        }
        mSession = null;
        mLayout.token = null;
        super.onDetachedFromWindow();
    }

    protected void onMeasure(int i, int j)
    {
        int k;
        if (mRequestedWidth >= 0)
            k = resolveSizeAndState(mRequestedWidth, i, 0);
        else
            k = getDefaultSize(0, i);
        int l;
        if (mRequestedHeight >= 0)
            l = resolveSizeAndState(mRequestedHeight, j, 0);
        else
            l = getDefaultSize(0, j);
        setMeasuredDimension(k, l);
    }

    protected void onWindowVisibilityChanged(int i)
    {
        boolean flag = true;
        super.onWindowVisibilityChanged(i);
        boolean flag1;
        if (i == 0)
            flag1 = flag;
        else
            flag1 = false;
        mWindowVisibility = flag1;
        if (!mWindowVisibility || !mViewVisibility)
            flag = false;
        mRequestedVisible = flag;
        updateWindow(false, false);
    }

    public void set3DLayout(int i)
    {
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        boolean flag = super.setFrame(i, j, k, l);
        updateWindow(false, false);
        return flag;
    }

    public void setSecure(boolean flag)
    {
        if (flag)
        {
            WindowManager.LayoutParams layoutparams1 = mLayout;
            layoutparams1.flags = 0x2000 | layoutparams1.flags;
            return;
        } else
        {
            WindowManager.LayoutParams layoutparams = mLayout;
            layoutparams.flags = 0xffffdfff & layoutparams.flags;
            return;
        }
    }

    public void setVisibility(int i)
    {
        super.setVisibility(i);
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        mViewVisibility = flag;
        boolean flag1;
        if (mWindowVisibility && mViewVisibility)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != mRequestedVisible)
            requestLayout();
        mRequestedVisible = flag1;
        updateWindow(false, false);
    }

    public void setWindowType(int i)
    {
        mWindowType = i;
    }

    public void setZOrderMediaOverlay(boolean flag)
    {
        int i;
        if (flag)
            i = 1004;
        else
            i = 1001;
        mWindowType = i;
    }

    public void setZOrderOnTop(boolean flag)
    {
        if (flag)
        {
            mWindowType = 1000;
            WindowManager.LayoutParams layoutparams1 = mLayout;
            layoutparams1.flags = 0x20000 | layoutparams1.flags;
            return;
        } else
        {
            mWindowType = 1001;
            WindowManager.LayoutParams layoutparams = mLayout;
            layoutparams.flags = 0xfffdffff & layoutparams.flags;
            return;
        }
    }

    static 
    {
        DEBUG = true;
    }


}
