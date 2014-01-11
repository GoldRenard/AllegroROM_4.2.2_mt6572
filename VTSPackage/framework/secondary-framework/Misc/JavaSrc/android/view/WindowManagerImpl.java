// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;


// Referenced classes of package android.view:
//            WindowManager, WindowManagerGlobal, Display, Window, 
//            View

public final class WindowManagerImpl
    implements WindowManager
{

    private final Display mDisplay;
    private final WindowManagerGlobal mGlobal;
    private final Window mParentWindow;

    public WindowManagerImpl(Display display)
    {
        this(display, null);
    }

    private WindowManagerImpl(Display display, Window window)
    {
        mGlobal = WindowManagerGlobal.getInstance();
        mDisplay = display;
        mParentWindow = window;
    }

    public void addView(View view, ViewGroup.LayoutParams layoutparams)
    {
        mGlobal.addView(view, layoutparams, mDisplay, mParentWindow);
    }

    public WindowManagerImpl createLocalWindowManager(Window window)
    {
        return new WindowManagerImpl(mDisplay, window);
    }

    public WindowManagerImpl createPresentationWindowManager(Display display)
    {
        return new WindowManagerImpl(display, mParentWindow);
    }

    public Display getDefaultDisplay()
    {
        return mDisplay;
    }

    public void removeView(View view)
    {
        mGlobal.removeView(view, false);
    }

    public void removeViewImmediate(View view)
    {
        mGlobal.removeView(view, true);
    }

    public void updateViewLayout(View view, ViewGroup.LayoutParams layoutparams)
    {
        mGlobal.updateViewLayout(view, layoutparams);
    }
}
