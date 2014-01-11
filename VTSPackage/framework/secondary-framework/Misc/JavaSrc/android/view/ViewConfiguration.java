// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.app.AppGlobals;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import android.util.SparseArray;

// Referenced classes of package android.view:
//            WindowManager, Display, WindowManagerGlobal, IWindowManager

public class ViewConfiguration
{

    private static final int DEFAULT_LONG_PRESS_TIMEOUT = 500;
    private static final int DOUBLE_TAP_SLOP = 100;
    private static final int DOUBLE_TAP_TIMEOUT = 300;
    private static final int DOUBLE_TAP_TOUCH_SLOP = 8;
    private static final int EDGE_SLOP = 12;
    private static final int FADING_EDGE_LENGTH = 12;
    private static final int GLOBAL_ACTIONS_KEY_TIMEOUT = 500;
    private static final int HOVER_TAP_SLOP = 20;
    private static final int HOVER_TAP_TIMEOUT = 150;
    private static final int JUMP_TAP_TIMEOUT = 500;
    private static final int KEY_REPEAT_DELAY = 50;
    private static final int MAXIMUM_DRAWING_CACHE_SIZE = 0x177000;
    private static final int MAXIMUM_FLING_VELOCITY = 8000;
    private static final int MINIMUM_FLING_VELOCITY = 50;
    private static final int OVERFLING_DISTANCE = 6;
    private static final int OVERSCROLL_DISTANCE = 0;
    private static final int PAGING_TOUCH_SLOP = 16;
    private static final int PRESSED_STATE_DURATION = 64;
    private static final int SCROLL_BAR_DEFAULT_DELAY = 300;
    private static final int SCROLL_BAR_FADE_DURATION = 250;
    private static final int SCROLL_BAR_SIZE = 10;
    private static final float SCROLL_FRICTION = 0.015F;
    private static final long SEND_RECURRING_ACCESSIBILITY_EVENTS_INTERVAL_MILLIS = 100L;
    private static final int TAP_TIMEOUT = 180;
    private static final int TOUCH_SLOP = 8;
    private static final int WINDOW_TOUCH_SLOP = 16;
    private static final int ZOOM_CONTROLS_TIMEOUT = 3000;
    static final SparseArray sConfigurations = new SparseArray(2);
    private final int mDoubleTapSlop;
    private final int mDoubleTapTouchSlop;
    private final int mEdgeSlop;
    private final int mFadingEdgeLength;
    private final boolean mFadingMarqueeEnabled;
    private final int mMaximumDrawingCacheSize;
    private final int mMaximumFlingVelocity;
    private final int mMinimumFlingVelocity;
    private final int mOverflingDistance;
    private final int mOverscrollDistance;
    private final int mPagingTouchSlop;
    private final int mScrollbarSize;
    private final int mTouchSlop;
    private final int mWindowTouchSlop;
    private boolean sHasPermanentMenuKey;
    private boolean sHasPermanentMenuKeySet;

    public ViewConfiguration()
    {
        mEdgeSlop = 12;
        mFadingEdgeLength = 12;
        mMinimumFlingVelocity = 50;
        mMaximumFlingVelocity = 8000;
        mScrollbarSize = 10;
        mTouchSlop = 8;
        mDoubleTapTouchSlop = 8;
        mPagingTouchSlop = 16;
        mDoubleTapSlop = 100;
        mWindowTouchSlop = 16;
        mMaximumDrawingCacheSize = 0x177000;
        mOverscrollDistance = 0;
        mOverflingDistance = 6;
        mFadingMarqueeEnabled = true;
    }

    private ViewConfiguration(Context context)
    {
        boolean flag;
        Resources resources = context.getResources();
        DisplayMetrics displaymetrics = resources.getDisplayMetrics();
        Configuration configuration = resources.getConfiguration();
        float f = displaymetrics.density;
        float f1;
        Display display;
        Point point;
        IWindowManager iwindowmanager;
        if (configuration.isLayoutSizeAtLeast(4))
            f1 = f * 1.5F;
        else
            f1 = f;
        mEdgeSlop = (int)(0.5F + 12F * f1);
        mFadingEdgeLength = (int)(0.5F + 12F * f1);
        mMinimumFlingVelocity = (int)(0.5F + 50F * f);
        mMaximumFlingVelocity = (int)(0.5F + 8000F * f);
        mScrollbarSize = (int)(0.5F + 10F * f);
        mDoubleTapSlop = (int)(0.5F + 100F * f1);
        mWindowTouchSlop = (int)(0.5F + 16F * f1);
        display = ((WindowManager)context.getSystemService("window")).getDefaultDisplay();
        point = new Point();
        display.getRealSize(point);
        mMaximumDrawingCacheSize = 4 * point.x * point.y;
        mOverscrollDistance = (int)(0.5F + 0.0F * f1);
        mOverflingDistance = (int)(0.5F + 6F * f1);
        if (sHasPermanentMenuKeySet)
            break MISSING_BLOCK_LABEL_253;
        iwindowmanager = WindowManagerGlobal.getWindowManagerService();
        if (!iwindowmanager.hasSystemNavBar() && !iwindowmanager.hasNavigationBar())
            flag = true;
        else
            flag = false;
        try
        {
            sHasPermanentMenuKey = flag;
            sHasPermanentMenuKeySet = true;
        }
        catch (RemoteException remoteexception)
        {
            sHasPermanentMenuKey = false;
        }
        mFadingMarqueeEnabled = resources.getBoolean(0x1110013);
        mTouchSlop = resources.getDimensionPixelSize(0x1050008);
        mPagingTouchSlop = 2 * mTouchSlop;
        mDoubleTapTouchSlop = mTouchSlop;
        return;
    }

    public static ViewConfiguration get(Context context)
    {
        int i = (int)(100F * context.getResources().getDisplayMetrics().density);
        ViewConfiguration viewconfiguration = (ViewConfiguration)sConfigurations.get(i);
        if (viewconfiguration == null)
        {
            viewconfiguration = new ViewConfiguration(context);
            sConfigurations.put(i, viewconfiguration);
        }
        return viewconfiguration;
    }

    public static int getDoubleTapSlop()
    {
        return 100;
    }

    public static int getDoubleTapTimeout()
    {
        return 300;
    }

    public static int getEdgeSlop()
    {
        return 12;
    }

    public static int getFadingEdgeLength()
    {
        return 12;
    }

    public static long getGlobalActionKeyTimeout()
    {
        return 500L;
    }

    public static int getHoverTapSlop()
    {
        return 20;
    }

    public static int getHoverTapTimeout()
    {
        return 150;
    }

    public static int getJumpTapTimeout()
    {
        return 500;
    }

    public static int getKeyRepeatDelay()
    {
        return 50;
    }

    public static int getKeyRepeatTimeout()
    {
        return getLongPressTimeout();
    }

    public static int getLongPressTimeout()
    {
        return AppGlobals.getIntCoreSetting("long_press_timeout", 500);
    }

    public static int getMaximumDrawingCacheSize()
    {
        return 0x177000;
    }

    public static int getMaximumFlingVelocity()
    {
        return 8000;
    }

    public static int getMinimumFlingVelocity()
    {
        return 50;
    }

    public static int getPressedStateDuration()
    {
        return 64;
    }

    public static int getScrollBarFadeDuration()
    {
        return 250;
    }

    public static int getScrollBarSize()
    {
        return 10;
    }

    public static int getScrollDefaultDelay()
    {
        return 300;
    }

    public static float getScrollFriction()
    {
        return 0.015F;
    }

    public static long getSendRecurringAccessibilityEventsInterval()
    {
        return 100L;
    }

    public static int getTapTimeout()
    {
        return 180;
    }

    public static int getTouchSlop()
    {
        return 8;
    }

    public static int getWindowTouchSlop()
    {
        return 16;
    }

    public static long getZoomControlsTimeout()
    {
        return 3000L;
    }

    public int getScaledDoubleTapSlop()
    {
        return mDoubleTapSlop;
    }

    public int getScaledDoubleTapTouchSlop()
    {
        return mDoubleTapTouchSlop;
    }

    public int getScaledEdgeSlop()
    {
        return mEdgeSlop;
    }

    public int getScaledFadingEdgeLength()
    {
        return mFadingEdgeLength;
    }

    public int getScaledMaximumDrawingCacheSize()
    {
        return mMaximumDrawingCacheSize;
    }

    public int getScaledMaximumFlingVelocity()
    {
        return mMaximumFlingVelocity;
    }

    public int getScaledMinimumFlingVelocity()
    {
        return mMinimumFlingVelocity;
    }

    public int getScaledOverflingDistance()
    {
        return mOverflingDistance;
    }

    public int getScaledOverscrollDistance()
    {
        return mOverscrollDistance;
    }

    public int getScaledPagingTouchSlop()
    {
        return mPagingTouchSlop;
    }

    public int getScaledScrollBarSize()
    {
        return mScrollbarSize;
    }

    public int getScaledTouchSlop()
    {
        return mTouchSlop;
    }

    public int getScaledWindowTouchSlop()
    {
        return mWindowTouchSlop;
    }

    public boolean hasPermanentMenuKey()
    {
        return sHasPermanentMenuKey;
    }

    public boolean isFadingMarqueeEnabled()
    {
        return mFadingMarqueeEnabled;
    }

}
