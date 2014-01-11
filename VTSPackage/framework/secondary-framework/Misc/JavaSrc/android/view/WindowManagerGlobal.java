// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.animation.ValueAnimator;
import android.app.ActivityManager;
import android.content.res.Configuration;
import android.opengl.ManagedEGLContext;
import android.os.*;
import android.util.Log;
import android.view.inputmethod.InputMethodManager;
import java.io.*;

// Referenced classes of package android.view:
//            ViewRootImpl, IWindowManager, View, Window, 
//            WindowLeaked, HardwareRenderer, IWindowSession, Display

public final class WindowManagerGlobal
{

    public static final int ADD_APP_EXITING = -4;
    public static final int ADD_BAD_APP_TOKEN = -1;
    public static final int ADD_BAD_SUBWINDOW_TOKEN = -2;
    public static final int ADD_DUPLICATE_ADD = -5;
    public static final int ADD_FLAG_APP_VISIBLE = 2;
    public static final int ADD_FLAG_IN_TOUCH_MODE = 1;
    public static final int ADD_INPUTCHANNEL_NOT_ALLOWED = -10;
    public static final int ADD_INVALID_DISPLAY = -9;
    public static final int ADD_MULTIPLE_SINGLETON = -7;
    public static final int ADD_NOT_APP_TOKEN = -3;
    public static final int ADD_OKAY = 0;
    public static final int ADD_PERMISSION_DENIED = -8;
    public static final int ADD_STARTING_NOT_NEEDED = -6;
    public static final int RELAYOUT_DEFER_SURFACE_DESTROY = 2;
    public static final int RELAYOUT_INSETS_PENDING = 1;
    public static final int RELAYOUT_RES_ANIMATING = 8;
    public static final int RELAYOUT_RES_FIRST_TIME = 2;
    public static final int RELAYOUT_RES_IN_TOUCH_MODE = 1;
    public static final int RELAYOUT_RES_SURFACE_CHANGED = 4;
    private static final String TAG = "WindowManager";
    private static WindowManagerGlobal sDefaultWindowManager;
    private static IWindowManager sWindowManagerService;
    private static IWindowSession sWindowSession;
    private final Object mLock = new Object();
    private boolean mNeedsEglTerminate;
    private WindowManager.LayoutParams mParams[];
    private ViewRootImpl mRoots[];
    private Runnable mSystemPropertyUpdater;
    private View mViews[];

    private WindowManagerGlobal()
    {
    }

    private int findViewLocked(View view, boolean flag)
    {
        if (mViews != null)
        {
            int i = mViews.length;
            for (int j = 0; j < i; j++)
                if (mViews[j] == view)
                    return j;

        }
        if (flag)
            throw new IllegalArgumentException("View not attached to window manager");
        else
            return -1;
    }

    public static WindowManagerGlobal getInstance()
    {
        android/view/WindowManagerGlobal;
        JVM INSTR monitorenter ;
        WindowManagerGlobal windowmanagerglobal;
        if (sDefaultWindowManager == null)
            sDefaultWindowManager = new WindowManagerGlobal();
        windowmanagerglobal = sDefaultWindowManager;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        return windowmanagerglobal;
        Exception exception;
        exception;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static IWindowManager getWindowManagerService()
    {
        android/view/WindowManagerGlobal;
        JVM INSTR monitorenter ;
        IWindowManager iwindowmanager;
        if (sWindowManagerService == null)
            sWindowManagerService = IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        iwindowmanager = sWindowManagerService;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        return iwindowmanager;
        Exception exception;
        exception;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static String getWindowName(ViewRootImpl viewrootimpl)
    {
        return (new StringBuilder()).append(viewrootimpl.mWindowAttributes.getTitle()).append("/").append(viewrootimpl.getClass().getName()).append('@').append(Integer.toHexString(viewrootimpl.hashCode())).toString();
    }

    public static IWindowSession getWindowSession(Looper looper)
    {
        android/view/WindowManagerGlobal;
        JVM INSTR monitorenter ;
        IWindowSession iwindowsession = sWindowSession;
        if (iwindowsession != null)
            break MISSING_BLOCK_LABEL_53;
        InputMethodManager inputmethodmanager = InputMethodManager.getInstance(looper);
        IWindowManager iwindowmanager = getWindowManagerService();
        sWindowSession = iwindowmanager.openSession(inputmethodmanager.getClient(), inputmethodmanager.getInputContext());
        ValueAnimator.setDurationScale(iwindowmanager.getAnimationScale(2));
_L1:
        IWindowSession iwindowsession1 = sWindowSession;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        return iwindowsession1;
        RemoteException remoteexception;
        remoteexception;
        Log.e("WindowManager", "Failed to open window session", remoteexception);
          goto _L1
        Exception exception;
        exception;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static IWindowSession peekWindowSession()
    {
        android/view/WindowManagerGlobal;
        JVM INSTR monitorenter ;
        IWindowSession iwindowsession = sWindowSession;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        return iwindowsession;
        Exception exception;
        exception;
        android/view/WindowManagerGlobal;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static void removeItem(Object aobj[], Object aobj1[], int i)
    {
        if (aobj.length > 0)
        {
            if (i > 0)
                System.arraycopy(((Object) (aobj1)), 0, ((Object) (aobj)), 0, i);
            if (i < aobj.length)
                System.arraycopy(((Object) (aobj1)), i + 1, ((Object) (aobj)), i, -1 + (aobj1.length - i));
        }
    }

    private View removeViewLocked(int i, boolean flag)
    {
        ViewRootImpl viewrootimpl = mRoots[i];
        View view = viewrootimpl.getView();
        if (view != null)
        {
            InputMethodManager inputmethodmanager = InputMethodManager.getInstance(view.getContext());
            if (inputmethodmanager != null)
                inputmethodmanager.windowDismissed(mViews[i].getWindowToken());
        }
        viewrootimpl.die(flag);
        int j = mViews.length;
        View aview[] = new View[j - 1];
        removeItem(aview, mViews, i);
        mViews = aview;
        ViewRootImpl aviewrootimpl[] = new ViewRootImpl[j - 1];
        removeItem(aviewrootimpl, mRoots, i);
        mRoots = aviewrootimpl;
        WindowManager.LayoutParams alayoutparams[] = new WindowManager.LayoutParams[j - 1];
        removeItem(alayoutparams, mParams, i);
        mParams = alayoutparams;
        if (view != null)
            view.assignParent(null);
        return view;
    }

    public void addView(View view, ViewGroup.LayoutParams layoutparams, Display display, Window window)
    {
        WindowManager.LayoutParams layoutparams1;
        if (view == null)
            throw new IllegalArgumentException("view must not be null");
        if (display == null)
            throw new IllegalArgumentException("display must not be null");
        if (!(layoutparams instanceof WindowManager.LayoutParams))
            throw new IllegalArgumentException("Params must be WindowManager.LayoutParams");
        layoutparams1 = (WindowManager.LayoutParams)layoutparams;
        if (window != null)
            window.adjustLayoutParamsForSubWindow(layoutparams1);
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mSystemPropertyUpdater == null)
        {
            mSystemPropertyUpdater = new Runnable() {

                final WindowManagerGlobal this$0;

                public void run()
                {
                    Object obj2 = mLock;
                    obj2;
                    JVM INSTR monitorenter ;
                    ViewRootImpl aviewrootimpl1[];
                    int l1;
                    aviewrootimpl1 = mRoots;
                    l1 = aviewrootimpl1.length;
                    int i2 = 0;
_L2:
                    if (i2 >= l1)
                        break; /* Loop/switch isn't completed */
                    aviewrootimpl1[i2].loadSystemProperties();
                    i2++;
                    if (true) goto _L2; else goto _L1
_L1:
                    obj2;
                    JVM INSTR monitorexit ;
                    return;
                    Exception exception2;
                    exception2;
                    obj2;
                    JVM INSTR monitorexit ;
                    throw exception2;
                }

            
            {
                this$0 = WindowManagerGlobal.this;
                super();
            }
            }
;
            SystemProperties.addChangeCallback(mSystemPropertyUpdater);
        }
        if (findViewLocked(view, false) >= 0)
            throw new IllegalStateException((new StringBuilder()).append("View ").append(view).append(" has already been added to the window manager.").toString());
        break MISSING_BLOCK_LABEL_151;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        int i = layoutparams1.type;
        View view1 = null;
        if (i < 1000) goto _L2; else goto _L1
_L1:
        int j = layoutparams1.type;
        view1 = null;
        if (j > 1999) goto _L2; else goto _L3
_L3:
        int k;
        if (mViews == null)
            break MISSING_BLOCK_LABEL_507;
        k = mViews.length;
          goto _L4
_L11:
        int l;
        if (l >= k) goto _L2; else goto _L5
_L5:
        if (mRoots[l].mWindow.asBinder() == layoutparams1.token)
            view1 = mViews[l];
          goto _L6
_L2:
        ViewRootImpl viewrootimpl;
        viewrootimpl = new ViewRootImpl(view.getContext(), display);
        view.setLayoutParams(layoutparams1);
        if (mViews != null) goto _L8; else goto _L7
_L7:
        int i1 = 1;
        mViews = new View[1];
        mRoots = new ViewRootImpl[1];
        mParams = new WindowManager.LayoutParams[1];
_L10:
        int j1 = i1 - 1;
        mViews[j1] = view;
        mRoots[j1] = viewrootimpl;
        mParams[j1] = layoutparams1;
        obj;
        JVM INSTR monitorexit ;
        viewrootimpl.setView(view, layoutparams1, view1);
        return;
_L8:
        i1 = 1 + mViews.length;
        View aview[] = mViews;
        mViews = new View[i1];
        System.arraycopy(aview, 0, mViews, 0, i1 - 1);
        ViewRootImpl aviewrootimpl[] = mRoots;
        mRoots = new ViewRootImpl[i1];
        System.arraycopy(aviewrootimpl, 0, mRoots, 0, i1 - 1);
        WindowManager.LayoutParams alayoutparams[] = mParams;
        mParams = new WindowManager.LayoutParams[i1];
        System.arraycopy(alayoutparams, 0, mParams, 0, i1 - 1);
        if (true) goto _L10; else goto _L9
_L9:
        RuntimeException runtimeexception;
        runtimeexception;
        Object obj1 = mLock;
        obj1;
        JVM INSTR monitorenter ;
        int k1 = findViewLocked(view, false);
        if (k1 < 0)
            break MISSING_BLOCK_LABEL_478;
        removeViewLocked(k1, true);
        obj1;
        JVM INSTR monitorexit ;
        throw runtimeexception;
        Exception exception1;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
_L4:
        l = 0;
        view1 = null;
          goto _L11
_L6:
        l++;
          goto _L11
        k = 0;
          goto _L4
    }

    public void closeAll(IBinder ibinder, String s, String s1)
    {
label0:
        {
            synchronized (mLock)
            {
                if (mViews != null)
                    break label0;
            }
            return;
        }
        int i = mViews.length;
        int j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_164;
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_55;
        if (mParams[j].token != ibinder)
            break MISSING_BLOCK_LABEL_176;
        ViewRootImpl viewrootimpl = mRoots[j];
        if (s == null)
            break MISSING_BLOCK_LABEL_147;
        WindowLeaked windowleaked = new WindowLeaked((new StringBuilder()).append(s1).append(" ").append(s).append(" has leaked window ").append(viewrootimpl.getView()).append(" that was originally added here").toString());
        windowleaked.setStackTrace(viewrootimpl.getLocation().getStackTrace());
        Log.e("WindowManager", windowleaked.getMessage(), windowleaked);
        removeViewLocked(j, false);
        j--;
        i--;
        break MISSING_BLOCK_LABEL_176;
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void dumpGfxInfo(FileDescriptor filedescriptor)
    {
        PrintWriter printwriter = new PrintWriter(new FileOutputStream(filedescriptor));
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mViews == null) goto _L2; else goto _L1
_L1:
        int i;
        i = mViews.length;
        printwriter.println("Profile data in ms:");
        int j = 0;
_L10:
        if (j >= i) goto _L4; else goto _L3
_L3:
        HardwareRenderer hardwarerenderer;
        ViewRootImpl viewrootimpl = mRoots[j];
        printwriter.printf("\n\t%s", new Object[] {
            getWindowName(viewrootimpl)
        });
        hardwarerenderer = viewrootimpl.getView().mAttachInfo.mHardwareRenderer;
        if (hardwarerenderer == null) goto _L6; else goto _L5
_L5:
        hardwarerenderer.dumpGfxInfo(printwriter);
          goto _L6
_L4:
        printwriter.println("\nView hierarchy:\n");
        int k;
        int l;
        k = 0;
        l = 0;
        int ai[] = new int[2];
        int i1 = 0;
_L8:
        if (i1 >= i)
            break; /* Loop/switch isn't completed */
        HardwareRenderer hardwarerenderer1;
        ViewRootImpl viewrootimpl1 = mRoots[i1];
        viewrootimpl1.dumpGfxInfo(ai);
        String s = getWindowName(viewrootimpl1);
        Object aobj[] = new Object[3];
        aobj[0] = s;
        aobj[1] = Integer.valueOf(ai[0]);
        aobj[2] = Float.valueOf((float)ai[1] / 1024F);
        printwriter.printf("  %s\n  %d views, %.2f kB of display lists", aobj);
        hardwarerenderer1 = viewrootimpl1.getView().mAttachInfo.mHardwareRenderer;
        if (hardwarerenderer1 == null)
            break MISSING_BLOCK_LABEL_258;
        Object aobj1[] = new Object[1];
        aobj1[0] = Long.valueOf(hardwarerenderer1.getFrameCount());
        printwriter.printf(", %d frames rendered", aobj1);
        printwriter.printf("\n\n", new Object[0]);
        k += ai[0];
        l += ai[1];
        i1++;
        if (true) goto _L8; else goto _L7
_L7:
        Object aobj2[] = new Object[1];
        aobj2[0] = Integer.valueOf(i);
        printwriter.printf("\nTotal ViewRootImpl: %d\n", aobj2);
        Object aobj3[] = new Object[1];
        aobj3[0] = Integer.valueOf(k);
        printwriter.printf("Total Views:        %d\n", aobj3);
        Object aobj4[] = new Object[1];
        aobj4[0] = Float.valueOf((float)l / 1024F);
        printwriter.printf("Total DisplayList:  %.2f kB\n\n", aobj4);
_L2:
        obj;
        JVM INSTR monitorexit ;
        printwriter.flush();
        return;
        Exception exception1;
        exception1;
        obj;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        printwriter.flush();
        throw exception;
_L6:
        j++;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public void endTrimMemory()
    {
        HardwareRenderer.endTrimMemory();
        if (mNeedsEglTerminate)
        {
            ManagedEGLContext.doTerminate();
            mNeedsEglTerminate = false;
        }
    }

    public void removeView(View view, boolean flag)
    {
        if (view == null)
            throw new IllegalArgumentException("view must not be null");
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        View view1 = removeViewLocked(findViewLocked(view, true), flag);
        if (view1 != view)
            break MISSING_BLOCK_LABEL_43;
        obj;
        JVM INSTR monitorexit ;
        return;
        throw new IllegalStateException((new StringBuilder()).append("Calling with view ").append(view).append(" but the ViewAncestor is attached to ").append(view1).toString());
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void reportNewConfiguration(Configuration configuration)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mViews == null) goto _L2; else goto _L1
_L1:
        int i;
        Configuration configuration1;
        i = mViews.length;
        configuration1 = new Configuration(configuration);
        int j = 0;
_L3:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        mRoots[j].requestUpdateConfiguration(configuration1);
        j++;
        if (true) goto _L3; else goto _L2
_L2:
        obj;
        JVM INSTR monitorexit ;
        return;
_L5:
        obj;
        JVM INSTR monitorexit ;
        Exception exception;
        throw exception;
        exception;
        continue; /* Loop/switch isn't completed */
        exception;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public void setStoppedState(IBinder ibinder, boolean flag)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mViews == null) goto _L2; else goto _L1
_L1:
        int i = mViews.length;
        int j = 0;
_L8:
        if (j >= i) goto _L2; else goto _L3
_L3:
        if (ibinder == null) goto _L5; else goto _L4
_L4:
        if (mParams[j].token != ibinder) goto _L6; else goto _L5
_L5:
        mRoots[j].setStopped(flag);
          goto _L6
_L2:
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L6:
        j++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    public void startTrimMemory(int i)
    {
label0:
        {
            if (!HardwareRenderer.isAvailable())
                break MISSING_BLOCK_LABEL_96;
            if (i < 80 && (i < 60 || ActivityManager.isHighEndGfx()))
                break MISSING_BLOCK_LABEL_92;
            synchronized (mLock)
            {
                if (mViews != null)
                    break label0;
            }
            return;
        }
        int j = mViews.length;
        int k = 0;
_L2:
        if (k >= j)
            break; /* Loop/switch isn't completed */
        mRoots[k].terminateHardwareResources();
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorexit ;
        mNeedsEglTerminate = true;
        HardwareRenderer.startTrimMemory(80);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        HardwareRenderer.startTrimMemory(i);
    }

    public void trimLocalMemory()
    {
label0:
        {
            synchronized (mLock)
            {
                if (mViews != null)
                    break label0;
            }
            return;
        }
        int i = mViews.length;
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        mRoots[j].destroyHardwareLayers();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void updateViewLayout(View view, ViewGroup.LayoutParams layoutparams)
    {
        if (view == null)
            throw new IllegalArgumentException("view must not be null");
        if (!(layoutparams instanceof WindowManager.LayoutParams))
            throw new IllegalArgumentException("Params must be WindowManager.LayoutParams");
        WindowManager.LayoutParams layoutparams1 = (WindowManager.LayoutParams)layoutparams;
        view.setLayoutParams(layoutparams1);
        synchronized (mLock)
        {
            int i = findViewLocked(view, true);
            ViewRootImpl viewrootimpl = mRoots[i];
            mParams[i] = layoutparams1;
            viewrootimpl.setLayoutParams(layoutparams1, false);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }


}
