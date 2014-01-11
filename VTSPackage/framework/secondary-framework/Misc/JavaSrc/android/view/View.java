// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.ClipData;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.hardware.display.DisplayManagerGlobal;
import android.os.*;
import android.text.TextUtils;
import android.util.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityEventSource;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Transformation;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.ScrollBarDrawable;
import com.android.internal.util.Predicate;
import com.android.internal.view.menu.MenuBuilder;
import com.google.android.collect.Lists;
import com.google.android.collect.Maps;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package android.view:
//            InputEventConsistencyVerifier, ViewConfiguration, DisplayList, ViewGroup, 
//            HardwareRenderer, HardwareCanvas, HardwareLayer, LayoutInflater, 
//            ViewParent, ViewPropertyAnimator, ViewRootImpl, ViewTreeObserver, 
//            MotionEvent, KeyEvent, IWindowSession, Display, 
//            ViewDebug, TouchDelegate, Choreographer, Surface, 
//            ContextMenu, DragEvent, ActionMode, IWindow, 
//            AbsSavedState

public class View
    implements android.graphics.drawable.Drawable.Callback, KeyEvent.Callback, AccessibilityEventSource
{
    public static class AccessibilityDelegate
    {

        public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
        {
            return view.dispatchPopulateAccessibilityEventInternal(accessibilityevent);
        }

        public AccessibilityNodeProvider getAccessibilityNodeProvider(View view)
        {
            return null;
        }

        public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
        {
            view.onInitializeAccessibilityEventInternal(accessibilityevent);
        }

        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilitynodeinfo)
        {
            view.onInitializeAccessibilityNodeInfoInternal(accessibilitynodeinfo);
        }

        public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
        {
            view.onPopulateAccessibilityEventInternal(accessibilityevent);
        }

        public boolean onRequestSendAccessibilityEvent(ViewGroup viewgroup, View view, AccessibilityEvent accessibilityevent)
        {
            return viewgroup.onRequestSendAccessibilityEventInternal(view, accessibilityevent);
        }

        public boolean performAccessibilityAction(View view, int i, Bundle bundle)
        {
            return view.performAccessibilityActionInternal(i, bundle);
        }

        public void sendAccessibilityEvent(View view, int i)
        {
            view.sendAccessibilityEventInternal(i);
        }

        public void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityevent)
        {
            view.sendAccessibilityEventUncheckedInternal(accessibilityevent);
        }

    }

    static class AttachInfo
    {

        Drawable mAccessibilityFocusDrawable;
        int mAccessibilityWindowId;
        float mApplicationScale;
        Canvas mCanvas;
        final Rect mContentInsets = new Rect();
        boolean mDebugLayout;
        int mDisabledSystemUiVisibility;
        final Display mDisplay;
        long mDrawingTime;
        boolean mForceReportNewAttributes;
        final ViewTreeObserver.InternalInsetsInfo mGivenInternalInsets = new ViewTreeObserver.InternalInsetsInfo();
        int mGlobalSystemUiVisibility;
        final Handler mHandler;
        boolean mHardwareAccelerated;
        boolean mHardwareAccelerationRequested;
        HardwareCanvas mHardwareCanvas;
        HardwareRenderer mHardwareRenderer;
        boolean mHasSystemUiListeners;
        boolean mHasWindowFocus;
        boolean mIgnoreDirtyState;
        boolean mInTouchMode;
        boolean mIncludeNotImportantViews;
        final int mInvalidateChildLocation[] = new int[2];
        boolean mKeepScreenOn;
        final KeyEvent.DispatcherState mKeyDispatchState = new KeyEvent.DispatcherState();
        IBinder mPanelParentWindowToken;
        final Point mPoint = new Point();
        boolean mRecomputeGlobalAttributes;
        final Callbacks mRootCallbacks;
        View mRootView;
        boolean mScalingRequired;
        boolean mScreenOn;
        final ArrayList mScrollContainers = new ArrayList();
        final IWindowSession mSession;
        boolean mSetIgnoreDirtyState;
        Surface mSurface;
        int mSystemUiVisibility;
        final ArrayList mTempArrayList = new ArrayList(24);
        final Rect mTmpInvalRect = new Rect();
        final Matrix mTmpMatrix = new Matrix();
        final float mTmpTransformLocation[] = new float[2];
        final RectF mTmpTransformRect = new RectF();
        final Transformation mTmpTransformation = new Transformation();
        final int mTransparentLocation[] = new int[2];
        final ViewTreeObserver mTreeObserver = new ViewTreeObserver();
        boolean mTurnOffWindowResizeAnim;
        boolean mUse32BitDrawingCache;
        final ViewRootImpl mViewRootImpl;
        boolean mViewScrollChanged;
        boolean mViewVisibilityChanged;
        final Rect mVisibleInsets = new Rect();
        final IWindow mWindow;
        int mWindowLeft;
        final IBinder mWindowToken;
        int mWindowTop;
        int mWindowVisibility;

        AttachInfo(IWindowSession iwindowsession, IWindow iwindow, Display display, ViewRootImpl viewrootimpl, Handler handler, Callbacks callbacks)
        {
            mSetIgnoreDirtyState = false;
            mAccessibilityWindowId = -1;
            mDebugLayout = SystemProperties.getBoolean("debug.layout", false);
            mSession = iwindowsession;
            mWindow = iwindow;
            mWindowToken = iwindow.asBinder();
            mDisplay = display;
            mViewRootImpl = viewrootimpl;
            mHandler = handler;
            mRootCallbacks = callbacks;
        }
    }

    static interface AttachInfo.Callbacks
    {

        public abstract boolean performHapticFeedback(int i, boolean flag);

        public abstract void playSoundEffect(int i);
    }

    static class AttachInfo.InvalidateInfo
        implements Poolable
    {

        private static final int POOL_LIMIT = 10;
        private static final Pool sPool = Pools.synchronizedPool(Pools.finitePool(new PoolableManager() {

            public volatile Poolable newInstance()
            {
                return newInstance();
            }

            public AttachInfo.InvalidateInfo newInstance()
            {
                return new AttachInfo.InvalidateInfo();
            }

            public volatile void onAcquired(Poolable poolable)
            {
                onAcquired((AttachInfo.InvalidateInfo)poolable);
            }

            public void onAcquired(AttachInfo.InvalidateInfo invalidateinfo)
            {
            }

            public volatile void onReleased(Poolable poolable)
            {
                onReleased((AttachInfo.InvalidateInfo)poolable);
            }

            public void onReleased(AttachInfo.InvalidateInfo invalidateinfo)
            {
                invalidateinfo.target = null;
            }

        }
, 10));
        int bottom;
        int left;
        private boolean mIsPooled;
        private AttachInfo.InvalidateInfo mNext;
        int right;
        View target;
        int top;

        static AttachInfo.InvalidateInfo acquire()
        {
            return (AttachInfo.InvalidateInfo)sPool.acquire();
        }

        public AttachInfo.InvalidateInfo getNextPoolable()
        {
            return mNext;
        }

        public volatile Object getNextPoolable()
        {
            return getNextPoolable();
        }

        public boolean isPooled()
        {
            return mIsPooled;
        }

        void release()
        {
            sPool.release(this);
        }

        public void setNextPoolable(AttachInfo.InvalidateInfo invalidateinfo)
        {
            mNext = invalidateinfo;
        }

        public volatile void setNextPoolable(Object obj)
        {
            setNextPoolable((AttachInfo.InvalidateInfo)obj);
        }

        public void setPooled(boolean flag)
        {
            mIsPooled = flag;
        }


    }

    public static class BaseSavedState extends AbsSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public BaseSavedState createFromParcel(Parcel parcel)
            {
                return new BaseSavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public BaseSavedState[] newArray(int i)
            {
                return new BaseSavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;


        public BaseSavedState(Parcel parcel)
        {
            super(parcel);
        }

        public BaseSavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }

    class CheckForLongPress
        implements Runnable
    {

        private int mOriginalWindowAttachCount;
        final View this$0;

        public void rememberWindowAttachCount()
        {
            mOriginalWindowAttachCount = mWindowAttachCount;
        }

        public void run()
        {
            if (isPressed() && mParent != null && mOriginalWindowAttachCount == mWindowAttachCount && performLongClick())
                mHasPerformedLongPress = true;
        }

        CheckForLongPress()
        {
            this$0 = View.this;
            super();
        }
    }

    private final class CheckForTap
        implements Runnable
    {

        final View this$0;

        public void run()
        {
            View view = View.this;
            view.mPrivateFlags = 0xfdffffff & view.mPrivateFlags;
            setPressed(true);
            checkForLongClick(ViewConfiguration.getTapTimeout());
        }

        private CheckForTap()
        {
            this$0 = View.this;
            super();
        }

    }

    public static class DragShadowBuilder
    {

        private final WeakReference mView;

        public final View getView()
        {
            return (View)mView.get();
        }

        public void onDrawShadow(Canvas canvas)
        {
            View view = (View)mView.get();
            if (view != null)
            {
                view.draw(canvas);
                return;
            } else
            {
                Log.e("View", "Asked to draw drag shadow but no view");
                return;
            }
        }

        public void onProvideShadowMetrics(Point point, Point point1)
        {
            View view = (View)mView.get();
            if (view != null)
            {
                point.set(view.getWidth(), view.getHeight());
                point1.set(point.x / 2, point.y / 2);
                return;
            } else
            {
                Log.e("View", "Asked for drag thumb metrics but no view");
                return;
            }
        }

        public DragShadowBuilder()
        {
            mView = new WeakReference(null);
        }

        public DragShadowBuilder(View view)
        {
            mView = new WeakReference(view);
        }
    }

    static class ListenerInfo
    {

        private CopyOnWriteArrayList mOnAttachStateChangeListeners;
        public OnClickListener mOnClickListener;
        protected OnCreateContextMenuListener mOnCreateContextMenuListener;
        private OnDragListener mOnDragListener;
        protected OnFocusChangeListener mOnFocusChangeListener;
        private OnGenericMotionListener mOnGenericMotionListener;
        private OnHoverListener mOnHoverListener;
        private OnKeyListener mOnKeyListener;
        private ArrayList mOnLayoutChangeListeners;
        protected OnLongClickListener mOnLongClickListener;
        private OnSystemUiVisibilityChangeListener mOnSystemUiVisibilityChangeListener;
        private OnTouchListener mOnTouchListener;



/*
        static ArrayList access$002(ListenerInfo listenerinfo, ArrayList arraylist)
        {
            listenerinfo.mOnLayoutChangeListeners = arraylist;
            return arraylist;
        }

*/




/*
        static OnSystemUiVisibilityChangeListener access$1002(ListenerInfo listenerinfo, OnSystemUiVisibilityChangeListener onsystemuivisibilitychangelistener)
        {
            listenerinfo.mOnSystemUiVisibilityChangeListener = onsystemuivisibilitychangelistener;
            return onsystemuivisibilitychangelistener;
        }

*/


/*
        static CopyOnWriteArrayList access$102(ListenerInfo listenerinfo, CopyOnWriteArrayList copyonwritearraylist)
        {
            listenerinfo.mOnAttachStateChangeListeners = copyonwritearraylist;
            return copyonwritearraylist;
        }

*/



/*
        static OnKeyListener access$202(ListenerInfo listenerinfo, OnKeyListener onkeylistener)
        {
            listenerinfo.mOnKeyListener = onkeylistener;
            return onkeylistener;
        }

*/



/*
        static OnTouchListener access$302(ListenerInfo listenerinfo, OnTouchListener ontouchlistener)
        {
            listenerinfo.mOnTouchListener = ontouchlistener;
            return ontouchlistener;
        }

*/



/*
        static OnGenericMotionListener access$402(ListenerInfo listenerinfo, OnGenericMotionListener ongenericmotionlistener)
        {
            listenerinfo.mOnGenericMotionListener = ongenericmotionlistener;
            return ongenericmotionlistener;
        }

*/



/*
        static OnHoverListener access$502(ListenerInfo listenerinfo, OnHoverListener onhoverlistener)
        {
            listenerinfo.mOnHoverListener = onhoverlistener;
            return onhoverlistener;
        }

*/



/*
        static OnDragListener access$602(ListenerInfo listenerinfo, OnDragListener ondraglistener)
        {
            listenerinfo.mOnDragListener = ondraglistener;
            return ondraglistener;
        }

*/

    }

    private class MatchIdPredicate
        implements Predicate
    {

        public int mId;
        final View this$0;

        public boolean apply(View view)
        {
            return view.mID == mId;
        }

        public volatile boolean apply(Object obj)
        {
            return apply((View)obj);
        }

        private MatchIdPredicate()
        {
            this$0 = View.this;
            super();
        }

    }

    private class MatchLabelForPredicate
        implements Predicate
    {

        private int mLabeledId;
        final View this$0;

        public boolean apply(View view)
        {
            return view.mLabelForId == mLabeledId;
        }

        public volatile boolean apply(Object obj)
        {
            return apply((View)obj);
        }


/*
        static int access$802(MatchLabelForPredicate matchlabelforpredicate, int i)
        {
            matchlabelforpredicate.mLabeledId = i;
            return i;
        }

*/

        private MatchLabelForPredicate()
        {
            this$0 = View.this;
            super();
        }

    }

    public static class MeasureSpec
    {

        public static final int AT_MOST = 0x80000000;
        public static final int EXACTLY = 0x40000000;
        private static final int MODE_MASK = 0xc0000000;
        private static final int MODE_SHIFT = 30;
        public static final int UNSPECIFIED;

        public static int getMode(int i)
        {
            return 0xc0000000 & i;
        }

        public static int getSize(int i)
        {
            return 0x3fffffff & i;
        }

        public static int makeMeasureSpec(int i, int j)
        {
            return i + j;
        }

        public static String toString(int i)
        {
            int j = getMode(i);
            int k = getSize(i);
            StringBuilder stringbuilder = new StringBuilder("MeasureSpec: ");
            if (j == 0)
                stringbuilder.append("UNSPECIFIED ");
            else
            if (j == 0x40000000)
                stringbuilder.append("EXACTLY ");
            else
            if (j == 0x80000000)
                stringbuilder.append("AT_MOST ");
            else
                stringbuilder.append(j).append(" ");
            stringbuilder.append(k);
            return stringbuilder.toString();
        }

    }

    public static interface OnAttachStateChangeListener
    {

        public abstract void onViewAttachedToWindow(View view);

        public abstract void onViewDetachedFromWindow(View view);
    }

    public static interface OnClickListener
    {

        public abstract void onClick(View view);
    }

    public static interface OnCreateContextMenuListener
    {

        public abstract void onCreateContextMenu(ContextMenu contextmenu, View view, ContextMenu.ContextMenuInfo contextmenuinfo);
    }

    public static interface OnDragListener
    {

        public abstract boolean onDrag(View view, DragEvent dragevent);
    }

    public static interface OnFocusChangeListener
    {

        public abstract void onFocusChange(View view, boolean flag);
    }

    public static interface OnGenericMotionListener
    {

        public abstract boolean onGenericMotion(View view, MotionEvent motionevent);
    }

    public static interface OnHoverListener
    {

        public abstract boolean onHover(View view, MotionEvent motionevent);
    }

    public static interface OnKeyListener
    {

        public abstract boolean onKey(View view, int i, KeyEvent keyevent);
    }

    public static interface OnLayoutChangeListener
    {

        public abstract void onLayoutChange(View view, int i, int j, int k, int l, int i1, int j1, 
                int k1, int l1);
    }

    public static interface OnLongClickListener
    {

        public abstract boolean onLongClick(View view);
    }

    public static interface OnSystemUiVisibilityChangeListener
    {

        public abstract void onSystemUiVisibilityChange(int i);
    }

    public static interface OnTouchListener
    {

        public abstract boolean onTouch(View view, MotionEvent motionevent);
    }

    private final class PerformClick
        implements Runnable
    {

        final View this$0;

        public void run()
        {
            performClick();
        }

        private PerformClick()
        {
            this$0 = View.this;
            super();
        }

    }

    private static class ScrollabilityCache
        implements Runnable
    {

        public static final int FADING = 2;
        public static final int OFF = 0;
        public static final int ON = 1;
        private static final float OPAQUE[] = {
            255F
        };
        private static final float TRANSPARENT[] = {
            0.0F
        };
        public boolean fadeScrollBars;
        public long fadeStartTime;
        public int fadingEdgeLength;
        public View host;
        public float interpolatorValues[];
        private int mLastColor;
        public final Matrix matrix = new Matrix();
        public final Paint paint = new Paint();
        public ScrollBarDrawable scrollBar;
        public int scrollBarDefaultDelayBeforeFade;
        public int scrollBarFadeDuration;
        public final Interpolator scrollBarInterpolator = new Interpolator(1, 2);
        public int scrollBarSize;
        public Shader shader;
        public int state;

        public void run()
        {
            long l = AnimationUtils.currentAnimationTimeMillis();
            if (l >= fadeStartTime)
            {
                int i = (int)l;
                Interpolator interpolator = scrollBarInterpolator;
                int j = 0 + 1;
                interpolator.setKeyFrame(0, i, OPAQUE);
                interpolator.setKeyFrame(j, i + scrollBarFadeDuration, TRANSPARENT);
                state = 2;
                host.invalidate(true);
            }
        }

        public void setFadeColor(int i)
        {
label0:
            {
                if (i != mLastColor)
                {
                    mLastColor = i;
                    if (i == 0)
                        break label0;
                    shader = new LinearGradient(0.0F, 0.0F, 0.0F, 1.0F, 0xff000000 | i, i & 0xffffff, android.graphics.Shader.TileMode.CLAMP);
                    paint.setShader(shader);
                    paint.setXfermode(null);
                }
                return;
            }
            shader = new LinearGradient(0.0F, 0.0F, 0.0F, 1.0F, 0xff000000, 0, android.graphics.Shader.TileMode.CLAMP);
            paint.setShader(shader);
            paint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_OUT));
        }


        public ScrollabilityCache(ViewConfiguration viewconfiguration, View view)
        {
            state = 0;
            fadingEdgeLength = viewconfiguration.getScaledFadingEdgeLength();
            scrollBarSize = viewconfiguration.getScaledScrollBarSize();
            scrollBarDefaultDelayBeforeFade = ViewConfiguration.getScrollDefaultDelay();
            scrollBarFadeDuration = ViewConfiguration.getScrollBarFadeDuration();
            shader = new LinearGradient(0.0F, 0.0F, 0.0F, 1.0F, 0xff000000, 0, android.graphics.Shader.TileMode.CLAMP);
            paint.setShader(shader);
            paint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_OUT));
            host = view;
        }
    }

    private class SendViewScrolledAccessibilityEvent
        implements Runnable
    {

        public volatile boolean mIsPending;
        final View this$0;

        public void run()
        {
            sendAccessibilityEvent(4096);
            mIsPending = false;
        }

        private SendViewScrolledAccessibilityEvent()
        {
            this$0 = View.this;
            super();
        }

    }

    static class TransformationInfo
    {

        float mAlpha;
        private Camera mCamera;
        private Matrix mInverseMatrix;
        private boolean mInverseMatrixDirty;
        private final Matrix mMatrix = new Matrix();
        boolean mMatrixDirty;
        private boolean mMatrixIsIdentity;
        float mPivotX;
        float mPivotY;
        private int mPrevHeight;
        private int mPrevWidth;
        float mRotation;
        float mRotationX;
        float mRotationY;
        float mScaleX;
        float mScaleY;
        float mTranslationX;
        float mTranslationY;
        private Matrix matrix3D;




/*
        static boolean access$1502(TransformationInfo transformationinfo, boolean flag)
        {
            transformationinfo.mMatrixIsIdentity = flag;
            return flag;
        }

*/



/*
        static int access$1602(TransformationInfo transformationinfo, int i)
        {
            transformationinfo.mPrevWidth = i;
            return i;
        }

*/



/*
        static int access$1702(TransformationInfo transformationinfo, int i)
        {
            transformationinfo.mPrevHeight = i;
            return i;
        }

*/



/*
        static Camera access$1802(TransformationInfo transformationinfo, Camera camera)
        {
            transformationinfo.mCamera = camera;
            return camera;
        }

*/



/*
        static Matrix access$1902(TransformationInfo transformationinfo, Matrix matrix)
        {
            transformationinfo.matrix3D = matrix;
            return matrix;
        }

*/



/*
        static boolean access$2002(TransformationInfo transformationinfo, boolean flag)
        {
            transformationinfo.mInverseMatrixDirty = flag;
            return flag;
        }

*/



/*
        static Matrix access$2102(TransformationInfo transformationinfo, Matrix matrix)
        {
            transformationinfo.mInverseMatrix = matrix;
            return matrix;
        }

*/

        TransformationInfo()
        {
            mMatrixDirty = false;
            mInverseMatrixDirty = true;
            mMatrixIsIdentity = true;
            mCamera = null;
            matrix3D = null;
            mPrevWidth = -1;
            mPrevHeight = -1;
            mRotationY = 0.0F;
            mRotationX = 0.0F;
            mRotation = 0.0F;
            mTranslationX = 0.0F;
            mTranslationY = 0.0F;
            mScaleX = 1.0F;
            mScaleY = 1.0F;
            mPivotX = 0.0F;
            mPivotY = 0.0F;
            mAlpha = 1.0F;
        }
    }

    private final class UnsetPressedState
        implements Runnable
    {

        final View this$0;

        public void run()
        {
            setPressed(false);
        }

        private UnsetPressedState()
        {
            this$0 = View.this;
            super();
        }

    }


    private static final int ACCESSIBILITY_CURSOR_POSITION_UNDEFINED = -1;
    static final int ALL_RTL_PROPERTIES_RESOLVED = 0x60010220;
    public static final Property ALPHA = new FloatProperty("alpha") {

        public Float get(View view)
        {
            return Float.valueOf(view.getAlpha());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setAlpha(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    static final int CLICKABLE = 16384;
    private static final boolean DBG = false;
    private static final boolean DBG_FOCUS = false;
    private static final boolean DBG_HWUI = false;
    private static final boolean DBG_MOTION = false;
    public static final String DEBUG_LAYOUT_PROPERTY = "debug.layout";
    static final int DISABLED = 32;
    public static final int DRAG_FLAG_GLOBAL = 1;
    static final int DRAG_MASK = 3;
    static final int DRAWING_CACHE_ENABLED = 32768;
    public static final int DRAWING_CACHE_QUALITY_AUTO = 0;
    private static final int DRAWING_CACHE_QUALITY_FLAGS[] = {
        0, 0x80000, 0x100000
    };
    public static final int DRAWING_CACHE_QUALITY_HIGH = 0x100000;
    public static final int DRAWING_CACHE_QUALITY_LOW = 0x80000;
    static final int DRAWING_CACHE_QUALITY_MASK = 0x180000;
    static final int DRAW_MASK = 128;
    static final int DUPLICATE_PARENT_STATE = 0x400000;
    protected static final int EMPTY_STATE_SET[];
    static final int ENABLED = 0;
    protected static final int ENABLED_FOCUSED_SELECTED_STATE_SET[];
    protected static final int ENABLED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int ENABLED_FOCUSED_STATE_SET[];
    protected static final int ENABLED_FOCUSED_WINDOW_FOCUSED_STATE_SET[];
    static final int ENABLED_MASK = 32;
    protected static final int ENABLED_SELECTED_STATE_SET[];
    protected static final int ENABLED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int ENABLED_STATE_SET[];
    protected static final int ENABLED_WINDOW_FOCUSED_STATE_SET[];
    static final int FADING_EDGE_HORIZONTAL = 4096;
    static final int FADING_EDGE_MASK = 12288;
    static final int FADING_EDGE_NONE = 0;
    static final int FADING_EDGE_VERTICAL = 8192;
    static final int FILTER_TOUCHES_WHEN_OBSCURED = 1024;
    public static final int FIND_VIEWS_WITH_ACCESSIBILITY_NODE_PROVIDERS = 4;
    public static final int FIND_VIEWS_WITH_CONTENT_DESCRIPTION = 2;
    public static final int FIND_VIEWS_WITH_TEXT = 1;
    private static final int FITS_SYSTEM_WINDOWS = 2;
    private static final int FOCUSABLE = 1;
    public static final int FOCUSABLES_ALL = 0;
    public static final int FOCUSABLES_TOUCH_MODE = 1;
    static final int FOCUSABLE_IN_TOUCH_MODE = 0x40000;
    private static final int FOCUSABLE_MASK = 1;
    protected static final int FOCUSED_SELECTED_STATE_SET[];
    protected static final int FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int FOCUSED_STATE_SET[];
    protected static final int FOCUSED_WINDOW_FOCUSED_STATE_SET[];
    public static final int FOCUS_BACKWARD = 1;
    public static final int FOCUS_DOWN = 130;
    public static final int FOCUS_FORWARD = 2;
    public static final int FOCUS_LEFT = 17;
    public static final int FOCUS_RIGHT = 66;
    public static final int FOCUS_UP = 33;
    public static final int GONE = 8;
    public static final int HAPTIC_FEEDBACK_ENABLED = 0x10000000;
    public static final int IMPORTANT_FOR_ACCESSIBILITY_AUTO = 0;
    static final int IMPORTANT_FOR_ACCESSIBILITY_DEFAULT = 0;
    public static final int IMPORTANT_FOR_ACCESSIBILITY_NO = 2;
    public static final int IMPORTANT_FOR_ACCESSIBILITY_YES = 1;
    public static final int INVISIBLE = 4;
    public static final int KEEP_SCREEN_ON = 0x4000000;
    public static final int LAYER_TYPE_HARDWARE = 2;
    public static final int LAYER_TYPE_NONE = 0;
    public static final int LAYER_TYPE_SOFTWARE = 1;
    private static final int LAYOUT_DIRECTION_DEFAULT = 2;
    private static final int LAYOUT_DIRECTION_FLAGS[] = {
        0, 1, 2, 3
    };
    public static final int LAYOUT_DIRECTION_INHERIT = 2;
    public static final int LAYOUT_DIRECTION_LOCALE = 3;
    public static final int LAYOUT_DIRECTION_LTR = 0;
    public static final int LAYOUT_DIRECTION_RTL = 1;
    static final int LONG_CLICKABLE = 0x200000;
    public static final int MEASURED_HEIGHT_STATE_SHIFT = 16;
    public static final int MEASURED_SIZE_MASK = 0xffffff;
    public static final int MEASURED_STATE_MASK = 0xff000000;
    public static final int MEASURED_STATE_TOO_SMALL = 0x1000000;
    private static final float NONZERO_EPSILON = 0.001F;
    private static final int NOT_FOCUSABLE = 0;
    public static final int NO_ID = -1;
    static final int OPTIONAL_FITS_SYSTEM_WINDOWS = 2048;
    public static final int OVER_SCROLL_ALWAYS = 0;
    public static final int OVER_SCROLL_IF_CONTENT_SCROLLS = 1;
    public static final int OVER_SCROLL_NEVER = 2;
    static final int PARENT_SAVE_DISABLED = 0x20000000;
    static final int PARENT_SAVE_DISABLED_MASK = 0x20000000;
    static final int PFLAG2_ACCESSIBILITY_FOCUSED = 0x4000000;
    static final int PFLAG2_ACCESSIBILITY_STATE_CHANGED = 0x8000000;
    static final int PFLAG2_DRAG_CAN_ACCEPT = 1;
    static final int PFLAG2_DRAG_HOVERED = 2;
    static final int PFLAG2_DRAWABLE_RESOLVED = 0x40000000;
    static final int PFLAG2_HAS_TRANSIENT_STATE = 0x400000;
    static final int PFLAG2_IMPORTANT_FOR_ACCESSIBILITY_MASK = 0x300000;
    static final int PFLAG2_IMPORTANT_FOR_ACCESSIBILITY_SHIFT = 20;
    static final int PFLAG2_LAYOUT_DIRECTION_MASK = 12;
    static final int PFLAG2_LAYOUT_DIRECTION_MASK_SHIFT = 2;
    static final int PFLAG2_LAYOUT_DIRECTION_RESOLVED = 32;
    static final int PFLAG2_LAYOUT_DIRECTION_RESOLVED_MASK = 48;
    static final int PFLAG2_LAYOUT_DIRECTION_RESOLVED_RTL = 16;
    static final int PFLAG2_PADDING_RESOLVED = 0x20000000;
    private static final int PFLAG2_TEXT_ALIGNMENT_FLAGS[] = {
        0, 8192, 16384, 24576, 32768, 40960, 49152
    };
    static final int PFLAG2_TEXT_ALIGNMENT_MASK = 57344;
    static final int PFLAG2_TEXT_ALIGNMENT_MASK_SHIFT = 13;
    static final int PFLAG2_TEXT_ALIGNMENT_RESOLVED = 0x10000;
    private static final int PFLAG2_TEXT_ALIGNMENT_RESOLVED_DEFAULT = 0x20000;
    static final int PFLAG2_TEXT_ALIGNMENT_RESOLVED_MASK = 0xe0000;
    static final int PFLAG2_TEXT_ALIGNMENT_RESOLVED_MASK_SHIFT = 17;
    private static final int PFLAG2_TEXT_DIRECTION_FLAGS[] = {
        0, 64, 128, 192, 256, 320
    };
    static final int PFLAG2_TEXT_DIRECTION_MASK = 448;
    static final int PFLAG2_TEXT_DIRECTION_MASK_SHIFT = 6;
    static final int PFLAG2_TEXT_DIRECTION_RESOLVED = 512;
    static final int PFLAG2_TEXT_DIRECTION_RESOLVED_DEFAULT = 1024;
    static final int PFLAG2_TEXT_DIRECTION_RESOLVED_MASK = 7168;
    static final int PFLAG2_TEXT_DIRECTION_RESOLVED_MASK_SHIFT = 10;
    static final int PFLAG2_VIEW_QUICK_REJECTED = 0x10000000;
    static final int PFLAG3_VIEW_IS_ANIMATING_ALPHA = 2;
    static final int PFLAG3_VIEW_IS_ANIMATING_TRANSFORM = 1;
    static final int PFLAG_ACTIVATED = 0x40000000;
    static final int PFLAG_ALPHA_SET = 0x40000;
    static final int PFLAG_ANIMATION_STARTED = 0x10000;
    private static final int PFLAG_AWAKEN_SCROLL_BARS_ON_ATTACH = 0x8000000;
    static final int PFLAG_CANCEL_NEXT_UP_EVENT = 0x4000000;
    static final int PFLAG_DIRTY = 0x200000;
    static final int PFLAG_DIRTY_MASK = 0x600000;
    static final int PFLAG_DIRTY_OPAQUE = 0x400000;
    static final int PFLAG_DRAWABLE_STATE_DIRTY = 1024;
    static final int PFLAG_DRAWING_CACHE_VALID = 32768;
    static final int PFLAG_DRAWN = 32;
    static final int PFLAG_DRAW_ANIMATION = 64;
    static final int PFLAG_FOCUSED = 2;
    static final int PFLAG_FORCE_LAYOUT = 4096;
    static final int PFLAG_HAS_BOUNDS = 16;
    private static final int PFLAG_HOVERED = 0x10000000;
    static final int PFLAG_INVALIDATED = 0x80000000;
    static final int PFLAG_IS_ROOT_NAMESPACE = 8;
    static final int PFLAG_LAYOUT_REQUIRED = 8192;
    static final int PFLAG_MEASURED_DIMENSION_SET = 2048;
    static final int PFLAG_ONLY_DRAWS_BACKGROUND = 256;
    static final int PFLAG_OPAQUE_BACKGROUND = 0x800000;
    static final int PFLAG_OPAQUE_MASK = 0x1800000;
    static final int PFLAG_OPAQUE_SCROLLBARS = 0x1000000;
    private static final int PFLAG_PIVOT_EXPLICITLY_SET = 0x20000000;
    private static final int PFLAG_PREPRESSED = 0x2000000;
    private static final int PFLAG_PRESSED = 16384;
    static final int PFLAG_REQUEST_TRANSPARENT_REGIONS = 512;
    private static final int PFLAG_SAVE_STATE_CALLED = 0x20000;
    static final int PFLAG_SCROLL_CONTAINER = 0x80000;
    static final int PFLAG_SCROLL_CONTAINER_ADDED = 0x100000;
    static final int PFLAG_SELECTED = 4;
    static final int PFLAG_SKIP_DRAW = 128;
    static final int PFLAG_WANTS_FOCUS = 1;
    private static final int POPULATING_ACCESSIBILITY_EVENT_TYPES = 0x2a1bf;
    protected static final int PRESSED_ENABLED_FOCUSED_SELECTED_STATE_SET[];
    protected static final int PRESSED_ENABLED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_ENABLED_FOCUSED_STATE_SET[];
    protected static final int PRESSED_ENABLED_FOCUSED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_ENABLED_SELECTED_STATE_SET[];
    protected static final int PRESSED_ENABLED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_ENABLED_STATE_SET[];
    protected static final int PRESSED_ENABLED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_FOCUSED_SELECTED_STATE_SET[];
    protected static final int PRESSED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_FOCUSED_STATE_SET[];
    protected static final int PRESSED_FOCUSED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_SELECTED_STATE_SET[];
    protected static final int PRESSED_SELECTED_WINDOW_FOCUSED_STATE_SET[];
    protected static final int PRESSED_STATE_SET[];
    protected static final int PRESSED_WINDOW_FOCUSED_STATE_SET[];
    public static final int PUBLIC_STATUS_BAR_VISIBILITY_MASK = 65535;
    public static final Property ROTATION = new FloatProperty("rotation") {

        public Float get(View view)
        {
            return Float.valueOf(view.getRotation());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setRotation(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final Property ROTATION_X = new FloatProperty("rotationX") {

        public Float get(View view)
        {
            return Float.valueOf(view.getRotationX());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setRotationX(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final Property ROTATION_Y = new FloatProperty("rotationY") {

        public Float get(View view)
        {
            return Float.valueOf(view.getRotationY());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setRotationY(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    static final int SAVE_DISABLED = 0x10000;
    static final int SAVE_DISABLED_MASK = 0x10000;
    public static final Property SCALE_X = new FloatProperty("scaleX") {

        public Float get(View view)
        {
            return Float.valueOf(view.getScaleX());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setScaleX(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final Property SCALE_Y = new FloatProperty("scaleY") {

        public Float get(View view)
        {
            return Float.valueOf(view.getScaleY());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setScaleY(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final int SCREEN_STATE_OFF = 0;
    public static final int SCREEN_STATE_ON = 1;
    static final int SCROLLBARS_HORIZONTAL = 256;
    static final int SCROLLBARS_INSET_MASK = 0x1000000;
    public static final int SCROLLBARS_INSIDE_INSET = 0x1000000;
    public static final int SCROLLBARS_INSIDE_OVERLAY = 0;
    static final int SCROLLBARS_MASK = 768;
    static final int SCROLLBARS_NONE = 0;
    public static final int SCROLLBARS_OUTSIDE_INSET = 0x3000000;
    static final int SCROLLBARS_OUTSIDE_MASK = 0x2000000;
    public static final int SCROLLBARS_OUTSIDE_OVERLAY = 0x2000000;
    static final int SCROLLBARS_STYLE_MASK = 0x3000000;
    static final int SCROLLBARS_VERTICAL = 512;
    public static final int SCROLLBAR_POSITION_DEFAULT = 0;
    public static final int SCROLLBAR_POSITION_LEFT = 1;
    public static final int SCROLLBAR_POSITION_RIGHT = 2;
    protected static final int SELECTED_STATE_SET[];
    protected static final int SELECTED_WINDOW_FOCUSED_STATE_SET[];
    public static final int SOUND_EFFECTS_ENABLED = 0x8000000;
    public static final int STATUS_BAR_DISABLE_BACK = 0x400000;
    public static final int STATUS_BAR_DISABLE_CLOCK = 0x800000;
    public static final int STATUS_BAR_DISABLE_EXPAND = 0x10000;
    public static final int STATUS_BAR_DISABLE_HOME = 0x200000;
    public static final int STATUS_BAR_DISABLE_NOTIFICATION_ALERTS = 0x40000;
    public static final int STATUS_BAR_DISABLE_NOTIFICATION_ICONS = 0x20000;
    public static final int STATUS_BAR_DISABLE_NOTIFICATION_TICKER = 0x80000;
    public static final int STATUS_BAR_DISABLE_RECENT = 0x1000000;
    public static final int STATUS_BAR_DISABLE_SEARCH = 0x2000000;
    public static final int STATUS_BAR_DISABLE_SYSTEM_INFO = 0x100000;
    public static final int STATUS_BAR_HIDDEN = 1;
    public static final int STATUS_BAR_VISIBLE = 0;
    public static final int SYSTEM_UI_CLEARABLE_FLAGS = 7;
    public static final int SYSTEM_UI_FLAG_FULLSCREEN = 4;
    public static final int SYSTEM_UI_FLAG_HIDE_NAVIGATION = 2;
    public static final int SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN = 1024;
    public static final int SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION = 512;
    public static final int SYSTEM_UI_FLAG_LAYOUT_STABLE = 256;
    public static final int SYSTEM_UI_FLAG_LOW_PROFILE = 1;
    public static final int SYSTEM_UI_FLAG_VISIBLE = 0;
    public static final int SYSTEM_UI_LAYOUT_FLAGS = 1536;
    public static final int TEXT_ALIGNMENT_CENTER = 4;
    private static final int TEXT_ALIGNMENT_DEFAULT = 1;
    public static final int TEXT_ALIGNMENT_GRAVITY = 1;
    public static final int TEXT_ALIGNMENT_INHERIT = 0;
    public static final int TEXT_ALIGNMENT_TEXT_END = 3;
    public static final int TEXT_ALIGNMENT_TEXT_START = 2;
    public static final int TEXT_ALIGNMENT_VIEW_END = 6;
    public static final int TEXT_ALIGNMENT_VIEW_START = 5;
    public static final int TEXT_DIRECTION_ANY_RTL = 2;
    private static final int TEXT_DIRECTION_DEFAULT = 0;
    public static final int TEXT_DIRECTION_FIRST_STRONG = 1;
    public static final int TEXT_DIRECTION_INHERIT = 0;
    public static final int TEXT_DIRECTION_LOCALE = 5;
    public static final int TEXT_DIRECTION_LTR = 3;
    public static final int TEXT_DIRECTION_RTL = 4;
    public static final Property TRANSLATION_X = new FloatProperty("translationX") {

        public Float get(View view)
        {
            return Float.valueOf(view.getTranslationX());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setTranslationX(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final Property TRANSLATION_Y = new FloatProperty("translationY") {

        public Float get(View view)
        {
            return Float.valueOf(view.getTranslationY());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setTranslationY(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    private static final int UNDEFINED_PADDING = 0x80000000;
    protected static final String VIEW_LOG_TAG = "View";
    static final int VIEW_STATE_ACCELERATED = 64;
    static final int VIEW_STATE_ACTIVATED = 32;
    static final int VIEW_STATE_DRAG_CAN_ACCEPT = 256;
    static final int VIEW_STATE_DRAG_HOVERED = 512;
    static final int VIEW_STATE_ENABLED = 8;
    static final int VIEW_STATE_FOCUSED = 4;
    static final int VIEW_STATE_HOVERED = 128;
    static final int VIEW_STATE_IDS[] = {
        0x101009d, 1, 0x10100a1, 2, 0x101009c, 4, 0x101009e, 8, 0x10100a7, 16, 
        0x10102fe, 32, 0x101031b, 64, 0x1010367, 128, 0x1010368, 256, 0x1010369, 512
    };
    static final int VIEW_STATE_PRESSED = 16;
    static final int VIEW_STATE_SELECTED = 2;
    private static final int VIEW_STATE_SETS[][];
    static final int VIEW_STATE_WINDOW_FOCUSED = 1;
    private static final int VISIBILITY_FLAGS[] = {
        0, 4, 8
    };
    static final int VISIBILITY_MASK = 12;
    public static final int VISIBLE = 0;
    static final int WILL_NOT_CACHE_DRAWING = 0x20000;
    static final int WILL_NOT_DRAW = 128;
    protected static final int WINDOW_FOCUSED_STATE_SET[];
    public static final Property X = new FloatProperty("x") {

        public Float get(View view)
        {
            return Float.valueOf(view.getX());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setX(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    public static final Property Y = new FloatProperty("y") {

        public Float get(View view)
        {
            return Float.valueOf(view.getY());
        }

        public volatile Object get(Object obj)
        {
            return get((View)obj);
        }

        public void setValue(View view, float f)
        {
            view.setY(f);
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((View)obj, f);
        }

    }
;
    private static int sNextAccessibilityViewId;
    private static final AtomicInteger sNextGeneratedId = new AtomicInteger(1);
    static final ThreadLocal sThreadLocal = new ThreadLocal();
    private int DBG_TIMEOUT_VALUE;
    private int mAccessibilityCursorPosition;
    AccessibilityDelegate mAccessibilityDelegate;
    int mAccessibilityViewId;
    private ViewPropertyAnimator mAnimator;
    AttachInfo mAttachInfo;
    private Drawable mBackground;
    private int mBackgroundResource;
    private boolean mBackgroundSizeChanged;
    protected int mBottom;
    public boolean mCachingFailed;
    private CharSequence mContentDescription;
    protected Context mContext;
    protected Animation mCurrentAnimation;
    DisplayList mDisplayList;
    private int mDrawableState[];
    private Bitmap mDrawingCache;
    private int mDrawingCacheBackgroundColor;
    private ViewTreeObserver mFloatingTreeObserver;
    private HardwareLayer mHardwareLayer;
    private boolean mHasPerformedLongPress;
    int mID;
    protected final InputEventConsistencyVerifier mInputEventConsistencyVerifier;
    private SparseArray mKeyedTags;
    private int mLabelForId;
    private boolean mLastIsOpaque;
    Paint mLayerPaint;
    int mLayerType;
    private Insets mLayoutInsets;
    protected ViewGroup.LayoutParams mLayoutParams;
    protected int mLeft;
    ListenerInfo mListenerInfo;
    Rect mLocalDirtyRect;
    private MatchIdPredicate mMatchIdPredicate;
    private MatchLabelForPredicate mMatchLabelForPredicate;
    int mMeasuredHeight;
    int mMeasuredWidth;
    private int mMinHeight;
    private int mMinWidth;
    private int mNextFocusDownId;
    int mNextFocusForwardId;
    private int mNextFocusLeftId;
    private int mNextFocusRightId;
    private int mNextFocusUpId;
    int mOldHeightMeasureSpec;
    int mOldWidthMeasureSpec;
    private int mOverScrollMode;
    protected int mPaddingBottom;
    protected int mPaddingLeft;
    protected int mPaddingRight;
    protected int mPaddingTop;
    protected ViewParent mParent;
    private CheckForLongPress mPendingCheckForLongPress;
    private CheckForTap mPendingCheckForTap;
    private PerformClick mPerformClick;
    int mPrivateFlags;
    int mPrivateFlags2;
    int mPrivateFlags3;
    boolean mRecreateDisplayList;
    private final Resources mResources;
    protected int mRight;
    private ScrollabilityCache mScrollCache;
    protected int mScrollX;
    protected int mScrollY;
    private SendViewScrolledAccessibilityEvent mSendViewScrolledAccessibilityEvent;
    private boolean mSendingHoverAccessibilityEvents;
    int mSystemUiVisibility;
    protected Object mTag;
    protected int mTop;
    private TouchDelegate mTouchDelegate;
    private int mTouchSlop;
    TransformationInfo mTransformationInfo;
    int mTransientStateCount;
    private Bitmap mUnscaledDrawingCache;
    private UnsetPressedState mUnsetPressedState;
    protected int mUserPaddingBottom;
    int mUserPaddingEnd;
    protected int mUserPaddingLeft;
    int mUserPaddingLeftInitial;
    protected int mUserPaddingRight;
    int mUserPaddingRightInitial;
    int mUserPaddingStart;
    private float mVerticalScrollFactor;
    private int mVerticalScrollbarPosition;
    int mViewFlags;
    int mWindowAttachCount;

    View()
    {
        DBG_TIMEOUT_VALUE = 400;
        mCurrentAnimation = null;
        mRecreateDisplayList = false;
        mID = -1;
        mAccessibilityViewId = -1;
        mAccessibilityCursorPosition = -1;
        mTransientStateCount = 0;
        mPaddingLeft = 0;
        mPaddingRight = 0;
        mLabelForId = -1;
        mUserPaddingLeftInitial = 0;
        mUserPaddingRightInitial = 0;
        mOldWidthMeasureSpec = 0x80000000;
        mOldHeightMeasureSpec = 0x80000000;
        mDrawableState = null;
        mNextFocusLeftId = -1;
        mNextFocusRightId = -1;
        mNextFocusUpId = -1;
        mNextFocusDownId = -1;
        mNextFocusForwardId = -1;
        mPendingCheckForTap = null;
        mTouchDelegate = null;
        mDrawingCacheBackgroundColor = 0;
        mAnimator = null;
        mLayerType = 0;
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 0);
        else
            inputeventconsistencyverifier = null;
        mInputEventConsistencyVerifier = inputeventconsistencyverifier;
        mResources = null;
    }

    public View(Context context)
    {
        DBG_TIMEOUT_VALUE = 400;
        mCurrentAnimation = null;
        mRecreateDisplayList = false;
        mID = -1;
        mAccessibilityViewId = -1;
        mAccessibilityCursorPosition = -1;
        mTransientStateCount = 0;
        mPaddingLeft = 0;
        mPaddingRight = 0;
        mLabelForId = -1;
        mUserPaddingLeftInitial = 0;
        mUserPaddingRightInitial = 0;
        mOldWidthMeasureSpec = 0x80000000;
        mOldHeightMeasureSpec = 0x80000000;
        mDrawableState = null;
        mNextFocusLeftId = -1;
        mNextFocusRightId = -1;
        mNextFocusUpId = -1;
        mNextFocusDownId = -1;
        mNextFocusForwardId = -1;
        mPendingCheckForTap = null;
        mTouchDelegate = null;
        mDrawingCacheBackgroundColor = 0;
        mAnimator = null;
        mLayerType = 0;
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 0);
        else
            inputeventconsistencyverifier = null;
        mInputEventConsistencyVerifier = inputeventconsistencyverifier;
        mContext = context;
        Resources resources = null;
        if (context != null)
            resources = context.getResources();
        mResources = resources;
        mViewFlags = 0x18000000;
        mPrivateFlags2 = 0x22408;
        mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setOverScrollMode(1);
        mUserPaddingStart = 0x80000000;
        mUserPaddingEnd = 0x80000000;
    }

    public View(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public View(Context context, AttributeSet attributeset, int i)
    {
        this(context);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.View, i, 0);
        Drawable drawable = null;
        int j = -1;
        int k = -1;
        int l = -1;
        int i1 = -1;
        int j1 = 0x80000000;
        int k1 = 0x80000000;
        int l1 = -1;
        int i2 = 0;
        int j2 = 0;
        boolean flag = false;
        int k2 = 0;
        int l2 = 0;
        float f = 0.0F;
        float f1 = 0.0F;
        float f2 = 0.0F;
        float f3 = 0.0F;
        float f4 = 0.0F;
        float f5 = 1.0F;
        float f6 = 1.0F;
        boolean flag1 = false;
        int i3 = 0;
        int j3 = mOverScrollMode;
        boolean flag2 = false;
        boolean flag3 = false;
        boolean flag4 = false;
        boolean flag5 = false;
        boolean flag6 = false;
        int k3 = context.getApplicationInfo().targetSdkVersion;
        int l3 = typedarray.getIndexCount();
        for (int i4 = 0; i4 < l3; i4++)
        {
            int j5 = typedarray.getIndex(i4);
            switch (j5)
            {
            case 24: // '\030'
            case 42: // '*'
            case 43: // '+'
            case 44: // ','
            default:
                break;

            case 61: // '='
                setImportantForAccessibility(typedarray.getInt(j5, 0));
                break;

            case 63: // '?'
                mPrivateFlags2 = 0xffff1fff & mPrivateFlags2;
                int j7 = typedarray.getInt(j5, 1);
                mPrivateFlags2 = mPrivateFlags2 | PFLAG2_TEXT_ALIGNMENT_FLAGS[j7];
                break;

            case 62: // '>'
                mPrivateFlags2 = 0xfffffe3f & mPrivateFlags2;
                int i7 = typedarray.getInt(j5, -1);
                if (i7 != -1)
                    mPrivateFlags2 = mPrivateFlags2 | PFLAG2_TEXT_DIRECTION_FLAGS[i7];
                break;

            case 59: // ';'
                setLayerType(typedarray.getInt(j5, 0), null);
                break;

            case 57: // '9'
                mVerticalScrollbarPosition = typedarray.getInt(j5, 0);
                break;

            case 45: // '-'
                j3 = typedarray.getInt(j5, 1);
                break;

            case 40: // '('
                if (context.isRestricted())
                    throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
                final String handlerName = typedarray.getString(j5);
                if (handlerName != null)
                {
                    OnClickListener onclicklistener = new OnClickListener() {

                        private Method mHandler;
                        final View this$0;
                        final String val$handlerName;

                        public void onClick(View view)
                        {
                            if (mHandler == null)
                                try
                                {
                                    mHandler = getContext().getClass().getMethod(handlerName, new Class[] {
                                        android/view/View
                                    });
                                }
                                catch (NoSuchMethodException nosuchmethodexception)
                                {
                                    int k7 = getId();
                                    String s;
                                    if (k7 == -1)
                                        s = "";
                                    else
                                        s = (new StringBuilder()).append(" with id '").append(getContext().getResources().getResourceEntryName(k7)).append("'").toString();
                                    throw new IllegalStateException((new StringBuilder()).append("Could not find a method ").append(handlerName).append("(View) in the activity ").append(getContext().getClass()).append(" for onClick handler").append(" on view ").append(getClass()).append(s).toString(), nosuchmethodexception);
                                }
                            try
                            {
                                Method method = mHandler;
                                Context context1 = getContext();
                                Object aobj[] = new Object[1];
                                aobj[0] = View.this;
                                method.invoke(context1, aobj);
                                return;
                            }
                            catch (IllegalAccessException illegalaccessexception)
                            {
                                throw new IllegalStateException("Could not execute non public method of the activity", illegalaccessexception);
                            }
                            catch (InvocationTargetException invocationtargetexception)
                            {
                                throw new IllegalStateException("Could not execute method of the activity", invocationtargetexception);
                            }
                        }

            
            {
                this$0 = View.this;
                handlerName = s;
                super();
            }
                    }
;
                    setOnClickListener(onclicklistener);
                }
                break;

            case 35: // '#'
                mMinHeight = typedarray.getDimensionPixelSize(j5, 0);
                break;

            case 34: // '"'
                mMinWidth = typedarray.getDimensionPixelSize(j5, 0);
                break;

            case 58: // ':'
                mNextFocusForwardId = typedarray.getResourceId(j5, -1);
                break;

            case 28: // '\034'
                mNextFocusDownId = typedarray.getResourceId(j5, -1);
                break;

            case 27: // '\033'
                mNextFocusUpId = typedarray.getResourceId(j5, -1);
                break;

            case 26: // '\032'
                mNextFocusRightId = typedarray.getResourceId(j5, -1);
                break;

            case 25: // '\031'
                mNextFocusLeftId = typedarray.getResourceId(j5, -1);
                break;

            case 46: // '.'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 = 0x400 | i2;
                    j2 = 0x400 | j2;
                }
                break;

            case 37: // '%'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 0x4000000;
                    j2 |= 0x4000000;
                }
                break;

            case 38: // '&'
                flag = true;
                if (typedarray.getBoolean(j5, false))
                    setScrollContainer(true);
                break;

            case 7: // '\007'
                i3 = typedarray.getInt(j5, 0);
                if (i3 != 0)
                {
                    i2 |= 0x3000000 & i3;
                    j2 |= 0x3000000;
                }
                break;

            case 23: // '\027'
                if (k3 >= 14)
                    break;
                // fall through

            case 60: // '<'
                int l6 = typedarray.getInt(j5, 0);
                if (l6 != 0)
                {
                    i2 |= l6;
                    j2 = 0x3000 | j2;
                    initializeFadingEdge(typedarray);
                }
                break;

            case 22: // '\026'
                int k6 = typedarray.getInt(j5, 0);
                if (k6 != 0)
                {
                    i2 |= k6;
                    j2 = 0x300 | j2;
                    flag2 = true;
                }
                break;

            case 39: // '\''
                if (!typedarray.getBoolean(j5, true))
                {
                    i2 &= 0xefffffff;
                    j2 |= 0x10000000;
                }
                break;

            case 36: // '$'
                if (!typedarray.getBoolean(j5, true))
                {
                    i2 &= 0xf7ffffff;
                    j2 |= 0x8000000;
                }
                break;

            case 67: // 'C'
                setLabelFor(typedarray.getResourceId(j5, -1));
                break;

            case 41: // ')'
                setContentDescription(typedarray.getString(j5));
                break;

            case 32: // ' '
                int j6 = typedarray.getInt(j5, 0);
                if (j6 != 0)
                {
                    i2 |= DRAWING_CACHE_QUALITY_FLAGS[j6];
                    j2 |= 0x180000;
                }
                break;

            case 64: // '@'
                mPrivateFlags2 = 0xffffffc3 & mPrivateFlags2;
                int l5 = typedarray.getInt(j5, -1);
                int i6;
                if (l5 != -1)
                    i6 = LAYOUT_DIRECTION_FLAGS[l5];
                else
                    i6 = 2;
                mPrivateFlags2 = mPrivateFlags2 | i6 << 2;
                break;

            case 20: // '\024'
                int k5 = typedarray.getInt(j5, 0);
                if (k5 != 0)
                {
                    i2 |= VISIBILITY_FLAGS[k5];
                    j2 |= 0xc;
                }
                break;

            case 33: // '!'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 0x400000;
                    j2 |= 0x400000;
                }
                break;

            case 31: // '\037'
                if (!typedarray.getBoolean(j5, true))
                {
                    i2 |= 0x10000;
                    j2 |= 0x10000;
                }
                break;

            case 30: // '\036'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 0x200000;
                    j2 |= 0x200000;
                }
                break;

            case 29: // '\035'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 = 0x4000 | i2;
                    j2 = 0x4000 | j2;
                }
                break;

            case 19: // '\023'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 0x40001;
                    j2 |= 0x40001;
                }
                break;

            case 18: // '\022'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 1;
                    j2 |= 1;
                }
                break;

            case 21: // '\025'
                if (typedarray.getBoolean(j5, false))
                {
                    i2 |= 2;
                    j2 |= 2;
                }
                break;

            case 9: // '\t'
                mTag = typedarray.getText(j5);
                break;

            case 8: // '\b'
                mID = typedarray.getResourceId(j5, -1);
                break;

            case 53: // '5'
                f6 = typedarray.getFloat(j5, 1.0F);
                flag1 = true;
                break;

            case 52: // '4'
                f5 = typedarray.getFloat(j5, 1.0F);
                flag1 = true;
                break;

            case 56: // '8'
                f4 = typedarray.getFloat(j5, 0.0F);
                flag1 = true;
                break;

            case 55: // '7'
                f3 = typedarray.getFloat(j5, 0.0F);
                flag1 = true;
                break;

            case 54: // '6'
                f2 = typedarray.getFloat(j5, 0.0F);
                flag1 = true;
                break;

            case 51: // '3'
                f1 = typedarray.getDimensionPixelOffset(j5, 0);
                flag1 = true;
                break;

            case 50: // '2'
                f = typedarray.getDimensionPixelOffset(j5, 0);
                flag1 = true;
                break;

            case 49: // '1'
                setPivotY(typedarray.getDimensionPixelOffset(j5, 0));
                break;

            case 48: // '0'
                setPivotX(typedarray.getDimensionPixelOffset(j5, 0));
                break;

            case 47: // '/'
                setAlpha(typedarray.getFloat(j5, 1.0F));
                break;

            case 11: // '\013'
                l2 = typedarray.getDimensionPixelOffset(j5, 0);
                break;

            case 10: // '\n'
                k2 = typedarray.getDimensionPixelOffset(j5, 0);
                break;

            case 66: // 'B'
                k1 = typedarray.getDimensionPixelSize(j5, 0x80000000);
                flag6 = true;
                break;

            case 65: // 'A'
                j1 = typedarray.getDimensionPixelSize(j5, 0x80000000);
                flag5 = true;
                break;

            case 17: // '\021'
                i1 = typedarray.getDimensionPixelSize(j5, -1);
                break;

            case 16: // '\020'
                l = typedarray.getDimensionPixelSize(j5, -1);
                mUserPaddingRightInitial = l;
                flag4 = true;
                break;

            case 15: // '\017'
                k = typedarray.getDimensionPixelSize(j5, -1);
                break;

            case 14: // '\016'
                j = typedarray.getDimensionPixelSize(j5, -1);
                mUserPaddingLeftInitial = j;
                flag3 = true;
                break;

            case 13: // '\r'
                l1 = typedarray.getDimensionPixelSize(j5, -1);
                mUserPaddingLeftInitial = l1;
                mUserPaddingRightInitial = l1;
                flag3 = true;
                flag4 = true;
                break;

            case 12: // '\f'
                drawable = typedarray.getDrawable(j5);
                break;
            }
        }

        setOverScrollMode(j3);
        mUserPaddingStart = j1;
        mUserPaddingEnd = k1;
        if (drawable != null)
            setBackground(drawable);
        if (l1 >= 0)
        {
            j = l1;
            k = l1;
            l = l1;
            i1 = l1;
            mUserPaddingLeftInitial = l1;
            mUserPaddingRightInitial = l1;
        }
        if (isRtlCompatibilityMode())
        {
            if (!flag3 && flag5)
                j = j1;
            int l4;
            if (j >= 0)
                l4 = j;
            else
                l4 = mUserPaddingLeftInitial;
            mUserPaddingLeftInitial = l4;
            if (!flag4 && flag6)
                l = k1;
            int i5;
            if (l >= 0)
                i5 = l;
            else
                i5 = mUserPaddingRightInitial;
            mUserPaddingRightInitial = i5;
        } else
        {
            if (flag3)
                mUserPaddingLeftInitial = j;
            if (flag4)
                mUserPaddingRightInitial = l;
        }
        int j4 = mUserPaddingLeftInitial;
        if (k < 0)
            k = mPaddingTop;
        int k4 = mUserPaddingRightInitial;
        if (i1 < 0)
            i1 = mPaddingBottom;
        internalSetPadding(j4, k, k4, i1);
        if (j2 != 0)
            setFlags(i2, j2);
        if (flag2)
            initializeScrollbars(typedarray);
        typedarray.recycle();
        if (i3 != 0)
            recomputePadding();
        if (k2 != 0 || l2 != 0)
            scrollTo(k2, l2);
        if (flag1)
        {
            setTranslationX(f);
            setTranslationY(f1);
            setRotation(f2);
            setRotationX(f3);
            setRotationY(f4);
            setScaleX(f5);
            setScaleY(f6);
        }
        if (!flag && (0x200 & i2) != 0)
            setScrollContainer(true);
        computeOpaqueFlags();
    }

    private boolean canResolveTextAlignment()
    {
        switch (getRawTextAlignment())
        {
        case 0: // '\0'
            return mParent != null && (mParent instanceof View) && ((View)mParent).canResolveTextAlignment();
        }
        return true;
    }

    private boolean canResolveTextDirection()
    {
        switch (getRawTextDirection())
        {
        case 0: // '\0'
            return mParent != null && (mParent instanceof View) && ((View)mParent).canResolveTextDirection();
        }
        return true;
    }

    private void checkForLongClick(int i)
    {
        if ((0x200000 & mViewFlags) == 0x200000)
        {
            mHasPerformedLongPress = false;
            if (mPendingCheckForLongPress == null)
                mPendingCheckForLongPress = new CheckForLongPress();
            mPendingCheckForLongPress.rememberWindowAttachCount();
            postDelayed(mPendingCheckForLongPress, ViewConfiguration.getLongPressTimeout() - i);
        }
    }

    private void clearDisplayList()
    {
        if (mDisplayList != null)
        {
            mDisplayList.invalidate();
            mDisplayList.clear();
        }
    }

    public static int combineMeasuredStates(int i, int j)
    {
        return i | j;
    }

    protected static String debugIndent(int i)
    {
        StringBuilder stringbuilder = new StringBuilder(2 * (3 + i * 2));
        for (int j = 0; j < 3 + i * 2; j++)
            stringbuilder.append(' ').append(' ');

        return stringbuilder.toString();
    }

    private boolean dispatchGenericMotionEventInternal(MotionEvent motionevent)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if ((listenerinfo == null || listenerinfo.mOnGenericMotionListener == null || (0x20 & mViewFlags) != 0 || !listenerinfo.mOnGenericMotionListener.onGenericMotion(this, motionevent)) && !onGenericMotionEvent(motionevent))
        {
            if (mInputEventConsistencyVerifier != null)
                mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 0);
            return false;
        } else
        {
            return true;
        }
    }

    private boolean drawAnimation(ViewGroup viewgroup, long l, Animation animation, boolean flag)
    {
        boolean flag1;
        Transformation transformation;
label0:
        {
            int i = viewgroup.mGroupFlags;
            if (!animation.isInitialized())
            {
                animation.initialize(mRight - mLeft, mBottom - mTop, viewgroup.getWidth(), viewgroup.getHeight());
                animation.initializeInvalidateRegion(0, 0, mRight - mLeft, mBottom - mTop);
                if (mAttachInfo != null)
                    animation.setListenerHandler(mAttachInfo.mHandler);
                onAnimationStart();
            }
            flag1 = animation.getTransformation(l, viewgroup.mChildTransformation, 1.0F);
            if (flag && mAttachInfo.mApplicationScale != 1.0F)
            {
                if (viewgroup.mInvalidationTransformation == null)
                    viewgroup.mInvalidationTransformation = new Transformation();
                transformation = viewgroup.mInvalidationTransformation;
                animation.getTransformation(l, transformation, 1.0F);
            } else
            {
                transformation = viewgroup.mChildTransformation;
            }
            if (flag1)
            {
                if (animation.willChangeBounds())
                    break label0;
                if ((i & 0x90) == 128)
                    viewgroup.mGroupFlags = 4 | viewgroup.mGroupFlags;
                else
                if ((i & 4) == 0)
                {
                    viewgroup.mPrivateFlags = 0x40 | ((View) (viewgroup)).mPrivateFlags;
                    viewgroup.invalidate(mLeft, mTop, mRight, mBottom);
                    return flag1;
                }
            }
            return flag1;
        }
        if (viewgroup.mInvalidateRegion == null)
            viewgroup.mInvalidateRegion = new RectF();
        RectF rectf = viewgroup.mInvalidateRegion;
        animation.getInvalidateRegion(0, 0, mRight - mLeft, mBottom - mTop, rectf, transformation);
        viewgroup.mPrivateFlags = 0x40 | ((View) (viewgroup)).mPrivateFlags;
        int j = mLeft + (int)rectf.left;
        int k = mTop + (int)rectf.top;
        viewgroup.invalidate(j, k, j + (int)(0.5F + rectf.width()), k + (int)(0.5F + rectf.height()));
        return flag1;
    }

    private static void dumpFlag(HashMap hashmap, String s, int i)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.toBinaryString(i);
        String s1 = String.format("%32s", aobj).replace('0', ' ');
        int j = s.indexOf('_');
        StringBuilder stringbuilder = new StringBuilder();
        String s2;
        if (j > 0)
            s2 = s.substring(0, j);
        else
            s2 = s;
        hashmap.put(stringbuilder.append(s2).append(s1).append(s).toString(), (new StringBuilder()).append(s1).append(" ").append(s).toString());
    }

    private static void dumpFlags()
    {
        HashMap hashmap;
        int j;
        hashmap = Maps.newHashMap();
        Field afield[];
        int i;
        Field field;
        int k;
        int ai[];
        int l;
        int i1;
        try
        {
            afield = android/view/View.getDeclaredFields();
            i = afield.length;
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            throw new RuntimeException(illegalaccessexception);
        }
        j = 0;
_L10:
        if (j >= i) goto _L2; else goto _L1
_L1:
        field = afield[j];
        k = field.getModifiers();
        if (!Modifier.isStatic(k) || !Modifier.isFinal(k)) goto _L4; else goto _L3
_L3:
        if (!field.getType().equals(Integer.TYPE)) goto _L6; else goto _L5
_L5:
        i1 = field.getInt(null);
        dumpFlag(hashmap, field.getName(), i1);
          goto _L4
_L6:
        if (!field.getType().equals([I)) goto _L4; else goto _L7
_L7:
        ai = (int[])(int[])field.get(null);
        l = 0;
_L8:
        if (l >= ai.length)
            break; /* Loop/switch isn't completed */
        dumpFlag(hashmap, (new StringBuilder()).append(field.getName()).append("[").append(l).append("]").toString(), ai[l]);
        l++;
        if (true) goto _L8; else goto _L4
_L2:
        ArrayList arraylist = Lists.newArrayList();
        arraylist.addAll(hashmap.keySet());
        Collections.sort(arraylist);
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); Log.d("View", (String)hashmap.get((String)iterator.next())));
        return;
_L4:
        j++;
        if (true) goto _L10; else goto _L9
_L9:
    }

    private View findLabelForView(View view, int i)
    {
        if (mMatchLabelForPredicate == null)
            mMatchLabelForPredicate = new MatchLabelForPredicate();
        mMatchLabelForPredicate.mLabeledId = i;
        return findViewByPredicateInsideOut(view, mMatchLabelForPredicate);
    }

    private View findViewInsideOutShouldExist(View view, int i)
    {
        if (mMatchIdPredicate == null)
            mMatchIdPredicate = new MatchIdPredicate();
        mMatchIdPredicate.mId = i;
        View view1 = view.findViewByPredicateInsideOut(this, mMatchIdPredicate);
        if (view1 == null)
            Log.w("View", (new StringBuilder()).append("couldn't find view with id ").append(i).toString());
        return view1;
    }

    public static int generateViewId()
    {
        int i;
        int j;
        do
        {
            i = sNextGeneratedId.get();
            j = i + 1;
            if (j > 0xffffff)
                j = 1;
        } while (!sNextGeneratedId.compareAndSet(i, j));
        return i;
    }

    public static int getDefaultSize(int i, int j)
    {
        int k = MeasureSpec.getMode(j);
        int l = MeasureSpec.getSize(j);
        switch (k)
        {
        case -2147483648: 
        case 1073741824: 
            return l;

        case 0: // '\0'
            return i;
        }
        return i;
    }

    private DisplayList getDisplayList(DisplayList displaylist, boolean flag)
    {
        HardwareCanvas hardwarecanvas;
        int i;
        int j;
        if (!canHaveDisplayList())
            return null;
        if ((0x8000 & mPrivateFlags) != 0 && displaylist != null && displaylist.isValid() && (flag || !mRecreateDisplayList))
            break MISSING_BLOCK_LABEL_448;
        if (displaylist != null && displaylist.isValid() && !flag && !mRecreateDisplayList)
        {
            mPrivateFlags = 0x8020 | mPrivateFlags;
            mPrivateFlags = 0xff9fffff & mPrivateFlags;
            dispatchGetDisplayList();
            return displaylist;
        }
        if (!flag)
            mRecreateDisplayList = true;
        if (displaylist == null)
        {
            String s = getClass().getSimpleName();
            displaylist = mAttachInfo.mHardwareRenderer.createDisplayList(s);
            invalidateParentCaches();
        }
        hardwarecanvas = displaylist.start();
        i = mRight - mLeft;
        j = mBottom - mTop;
        int k;
        hardwarecanvas.setViewport(i, j);
        hardwarecanvas.onPreDraw(null);
        k = getLayerType();
        if (flag || k == 0) goto _L2; else goto _L1
_L1:
        if (k != 2) goto _L4; else goto _L3
_L3:
        HardwareLayer hardwarelayer = getHardwareLayer();
        if (hardwarelayer == null) goto _L6; else goto _L5
_L5:
        if (!hardwarelayer.isValid()) goto _L6; else goto _L7
_L7:
        hardwarecanvas.drawHardwareLayer(hardwarelayer, 0.0F, 0.0F, mLayerPaint);
_L8:
        boolean flag1 = true;
_L10:
        hardwarecanvas.onPostDraw();
        displaylist.end();
        displaylist.setCaching(flag1);
        Exception exception;
        Bitmap bitmap;
        if (flag)
            displaylist.setLeftTopRightBottom(0, 0, i, j);
        else
            setDisplayListProperties(displaylist);
_L11:
        return displaylist;
_L6:
        hardwarecanvas.saveLayer(0.0F, 0.0F, mRight - mLeft, mBottom - mTop, mLayerPaint, 20);
          goto _L8
        exception;
        hardwarecanvas.onPostDraw();
        displaylist.end();
        displaylist.setCaching(false);
        if (flag)
            displaylist.setLeftTopRightBottom(0, 0, i, j);
        else
            setDisplayListProperties(displaylist);
        throw exception;
_L4:
        buildDrawingCache(true);
        bitmap = getDrawingCache(true);
        flag1 = false;
        if (bitmap == null) goto _L10; else goto _L9
_L9:
        hardwarecanvas.drawBitmap(bitmap, 0.0F, 0.0F, mLayerPaint);
        flag1 = true;
          goto _L10
_L2:
        computeScroll();
        hardwarecanvas.translate(-mScrollX, -mScrollY);
        if (flag)
            break MISSING_BLOCK_LABEL_412;
        mPrivateFlags = 0x8020 | mPrivateFlags;
        mPrivateFlags = 0xff9fffff & mPrivateFlags;
        if ((0x80 & mPrivateFlags) != 128)
            break MISSING_BLOCK_LABEL_437;
        dispatchDraw(hardwarecanvas);
        flag1 = false;
          goto _L10
        draw(hardwarecanvas);
        flag1 = false;
          goto _L10
        if (!flag)
        {
            mPrivateFlags = 0x8020 | mPrivateFlags;
            mPrivateFlags = 0xff9fffff & mPrivateFlags;
        }
          goto _L11
    }

    private DisplayList getHardwareLayerDisplayList(HardwareLayer hardwarelayer)
    {
        DisplayList displaylist = getDisplayList(hardwarelayer.getDisplayList(), true);
        hardwarelayer.setDisplayList(displaylist);
        return displaylist;
    }

    private ScrollabilityCache getScrollCache()
    {
        initScrollCache();
        return mScrollCache;
    }

    private boolean hasAncestorThatBlocksDescendantFocus()
    {
        ViewGroup viewgroup;
        for (ViewParent viewparent = mParent; viewparent instanceof ViewGroup; viewparent = viewgroup.getParent())
        {
            viewgroup = (ViewGroup)viewparent;
            if (viewgroup.getDescendantFocusability() == 0x60000)
                return true;
        }

        return false;
    }

    private boolean hasListenersForAccessibility()
    {
        ListenerInfo listenerinfo = getListenerInfo();
        return mTouchDelegate != null || listenerinfo.mOnKeyListener != null || listenerinfo.mOnTouchListener != null || listenerinfo.mOnGenericMotionListener != null || listenerinfo.mOnHoverListener != null || listenerinfo.mOnDragListener != null;
    }

    private boolean hasRtlSupport()
    {
        return mContext.getApplicationInfo().hasRtlSupport();
    }

    public static View inflate(Context context, int i, ViewGroup viewgroup)
    {
        return LayoutInflater.from(context).inflate(i, viewgroup);
    }

    private void initScrollCache()
    {
        if (mScrollCache == null)
            mScrollCache = new ScrollabilityCache(ViewConfiguration.get(mContext), this);
    }

    private boolean initialAwakenScrollBars()
    {
        return mScrollCache != null && awakenScrollBars(4 * mScrollCache.scrollBarDefaultDelayBeforeFade, true);
    }

    private boolean isDrawablesResolved()
    {
        return (0x40000000 & mPrivateFlags2) == 0x40000000;
    }

    private boolean isHoverable()
    {
        int i = mViewFlags;
        return (i & 0x20) != 32 && ((i & 0x4000) == 16384 || (i & 0x200000) == 0x200000);
    }

    private boolean isLayoutDirectionResolved()
    {
        return (0x20 & mPrivateFlags2) == 32;
    }

    private boolean isRtlCompatibilityMode()
    {
        return getContext().getApplicationInfo().targetSdkVersion < 17 || !hasRtlSupport();
    }

    private boolean isTargetPackage()
    {
        return "com.android.launcher".equals(getContext().getPackageName());
    }

    private boolean isTextAlignmentResolved()
    {
        return (0x10000 & mPrivateFlags2) == 0x10000;
    }

    private boolean isTextDirectionResolved()
    {
        return (0x200 & mPrivateFlags2) == 512;
    }

    protected static int[] mergeDrawableStates(int ai[], int ai1[])
    {
        int i;
        for (i = -1 + ai.length; i >= 0 && ai[i] == 0; i--);
        System.arraycopy(ai1, 0, ai, i + 1, ai1.length);
        return ai;
    }

    private boolean needRtlPropertiesResolution()
    {
        return (0x60010220 & mPrivateFlags2) != 0x60010220;
    }

    private boolean nextAtGranularity(int i)
    {
        CharSequence charsequence = getIterableTextForAccessibility();
        if (charsequence != null && charsequence.length() != 0)
        {
            AccessibilityIterators.TextSegmentIterator textsegmentiterator = getIteratorForGranularity(i);
            if (textsegmentiterator != null)
            {
                int ai[] = textsegmentiterator.following(getAccessibilityCursorPosition());
                if (ai != null)
                {
                    int j = ai[0];
                    int k = ai[1];
                    setAccessibilityCursorPosition(k);
                    sendViewTextTraversedAtGranularityEvent(256, i, j, k);
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean nonzero(float f)
    {
        return f < -0.001F || f > 0.001F;
    }

    private boolean pointInView(float f, float f1, float f2)
    {
        return f >= -f2 && f1 >= -f2 && f < f2 + (float)(mRight - mLeft) && f1 < f2 + (float)(mBottom - mTop);
    }

    private void postSendViewScrolledAccessibilityEventCallback()
    {
        if (mSendViewScrolledAccessibilityEvent == null)
            mSendViewScrolledAccessibilityEvent = new SendViewScrolledAccessibilityEvent();
        if (!mSendViewScrolledAccessibilityEvent.mIsPending)
        {
            mSendViewScrolledAccessibilityEvent.mIsPending = true;
            postDelayed(mSendViewScrolledAccessibilityEvent, ViewConfiguration.getSendRecurringAccessibilityEventsInterval());
        }
    }

    private boolean previousAtGranularity(int i)
    {
        CharSequence charsequence = getIterableTextForAccessibility();
        if (charsequence != null && charsequence.length() != 0)
        {
            AccessibilityIterators.TextSegmentIterator textsegmentiterator = getIteratorForGranularity(i);
            if (textsegmentiterator != null)
            {
                int j = getAccessibilityCursorPosition();
                if (j == -1)
                {
                    j = charsequence.length();
                    setAccessibilityCursorPosition(j);
                } else
                if (i == 1)
                {
                    j--;
                    setAccessibilityCursorPosition(j);
                }
                int ai[] = textsegmentiterator.preceding(j);
                if (ai != null)
                {
                    int k = ai[0];
                    int l = ai[1];
                    if (i == 1)
                        setAccessibilityCursorPosition(l);
                    else
                        setAccessibilityCursorPosition(k);
                    sendViewTextTraversedAtGranularityEvent(512, i, k, l);
                    return true;
                }
            }
        }
        return false;
    }

    private static String printFlags(int i)
    {
        String s = "";
        int j = i & 1;
        int k = 0;
        if (j == 1)
        {
            s = (new StringBuilder()).append(s).append("TAKES_FOCUS").toString();
            k = 0 + 1;
        }
        switch (i & 0xc)
        {
        case 8: // '\b'
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            return (new StringBuilder()).append(s).append("GONE").toString();

        case 4: // '\004'
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            return (new StringBuilder()).append(s).append("INVISIBLE").toString();
        }
        return s;
    }

    private static String printPrivateFlags(int i)
    {
        String s = "";
        int j = i & 1;
        int k = 0;
        if (j == 1)
        {
            s = (new StringBuilder()).append(s).append("WANTS_FOCUS").toString();
            k = 0 + 1;
        }
        if ((i & 2) == 2)
        {
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            s = (new StringBuilder()).append(s).append("FOCUSED").toString();
            k++;
        }
        if ((i & 4) == 4)
        {
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            s = (new StringBuilder()).append(s).append("SELECTED").toString();
            k++;
        }
        if ((i & 8) == 8)
        {
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            s = (new StringBuilder()).append(s).append("IS_ROOT_NAMESPACE").toString();
            k++;
        }
        if ((i & 0x10) == 16)
        {
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            s = (new StringBuilder()).append(s).append("HAS_BOUNDS").toString();
            k++;
        }
        if ((i & 0x20) == 32)
        {
            if (k > 0)
                s = (new StringBuilder()).append(s).append(" ").toString();
            s = (new StringBuilder()).append(s).append("DRAWN").toString();
        }
        return s;
    }

    private void removeLongPressCallback()
    {
        if (mPendingCheckForLongPress != null)
            removeCallbacks(mPendingCheckForLongPress);
    }

    private void removePerformClickCallback()
    {
        if (mPerformClick != null)
            removeCallbacks(mPerformClick);
    }

    private void removeSendViewScrolledAccessibilityEventCallback()
    {
        if (mSendViewScrolledAccessibilityEvent != null)
        {
            removeCallbacks(mSendViewScrolledAccessibilityEvent);
            mSendViewScrolledAccessibilityEvent.mIsPending = false;
        }
    }

    private void removeTapCallback()
    {
        if (mPendingCheckForTap != null)
        {
            mPrivateFlags = 0xfdffffff & mPrivateFlags;
            removeCallbacks(mPendingCheckForTap);
        }
    }

    private void removeUnsetPressCallback()
    {
        if ((0x4000 & mPrivateFlags) != 0 && mUnsetPressedState != null)
        {
            setPressed(false);
            removeCallbacks(mUnsetPressedState);
        }
    }

    private boolean requestFocusNoSearch(int i, Rect rect)
    {
        if ((1 & mViewFlags) == 1 && (0xc & mViewFlags) == 0 && (!isInTouchMode() || 0x40000 == (0x40000 & mViewFlags)) && !hasAncestorThatBlocksDescendantFocus())
        {
            handleFocusGainInternal(i, rect);
            return true;
        } else
        {
            return false;
        }
    }

    private void resetPressedState()
    {
        if ((0x20 & mViewFlags) != 32 && isPressed())
        {
            setPressed(false);
            if (!mHasPerformedLongPress)
            {
                removeLongPressCallback();
                return;
            }
        }
    }

    public static int resolveSize(int i, int j)
    {
        return 0xffffff & resolveSizeAndState(i, j, 0);
    }

    public static int resolveSizeAndState(int i, int j, int k)
    {
        int l = i;
        int i1 = MeasureSpec.getMode(j);
        int j1 = MeasureSpec.getSize(j);
        switch (i1)
        {
        default:
            break;

        case 1073741824: 
            l = j1;
            break;

        case -2147483648: 
            if (j1 < i)
                l = j1 | 0x1000000;
            else
                l = i;
            break;

        case 0: // '\0'
            l = i;
            break;
        }
        return l | 0xff000000 & k;
    }

    private void sendAccessibilityHoverEvent(int i)
    {
        View view = this;
        do
        {
            if (view.includeForAccessibility())
            {
                view.sendAccessibilityEvent(i);
                break;
            }
            ViewParent viewparent = view.getParent();
            if (!(viewparent instanceof View))
                break;
            view = (View)viewparent;
        } while (true);
    }

    private void sendViewTextTraversedAtGranularityEvent(int i, int j, int k, int l)
    {
        if (mParent == null)
        {
            return;
        } else
        {
            AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain(0x20000);
            onInitializeAccessibilityEvent(accessibilityevent);
            onPopulateAccessibilityEvent(accessibilityevent);
            accessibilityevent.setFromIndex(k);
            accessibilityevent.setToIndex(l);
            accessibilityevent.setAction(i);
            accessibilityevent.setMovementGranularity(j);
            mParent.requestSendAccessibilityEvent(this, accessibilityevent);
            return;
        }
    }

    private void setKeyedTag(int i, Object obj)
    {
        if (mKeyedTags == null)
            mKeyedTags = new SparseArray();
        mKeyedTags.put(i, obj);
    }

    private boolean skipInvalidate()
    {
        return (0xc & mViewFlags) != 0 && mCurrentAnimation == null && (!(mParent instanceof ViewGroup) || !((ViewGroup)mParent).isViewTransitioning(this));
    }

    private void updateMatrix()
    {
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo != null && transformationinfo.mMatrixDirty)
        {
            if ((0x20000000 & mPrivateFlags) == 0 && (mRight - mLeft != transformationinfo.mPrevWidth || mBottom - mTop != transformationinfo.mPrevHeight))
            {
                transformationinfo.mPrevWidth = mRight - mLeft;
                transformationinfo.mPrevHeight = mBottom - mTop;
                transformationinfo.mPivotX = (float)transformationinfo.mPrevWidth / 2.0F;
                transformationinfo.mPivotY = (float)transformationinfo.mPrevHeight / 2.0F;
            }
            transformationinfo.mMatrix.reset();
            if (!nonzero(transformationinfo.mRotationX) && !nonzero(transformationinfo.mRotationY))
            {
                transformationinfo.mMatrix.setTranslate(transformationinfo.mTranslationX, transformationinfo.mTranslationY);
                transformationinfo.mMatrix.preRotate(transformationinfo.mRotation, transformationinfo.mPivotX, transformationinfo.mPivotY);
                transformationinfo.mMatrix.preScale(transformationinfo.mScaleX, transformationinfo.mScaleY, transformationinfo.mPivotX, transformationinfo.mPivotY);
            } else
            {
                if (transformationinfo.mCamera == null)
                {
                    transformationinfo.mCamera = new Camera();
                    transformationinfo.matrix3D = new Matrix();
                }
                transformationinfo.mCamera.save();
                transformationinfo.mMatrix.preScale(transformationinfo.mScaleX, transformationinfo.mScaleY, transformationinfo.mPivotX, transformationinfo.mPivotY);
                transformationinfo.mCamera.rotate(transformationinfo.mRotationX, transformationinfo.mRotationY, -transformationinfo.mRotation);
                transformationinfo.mCamera.getMatrix(transformationinfo.matrix3D);
                transformationinfo.matrix3D.preTranslate(-transformationinfo.mPivotX, -transformationinfo.mPivotY);
                transformationinfo.matrix3D.postTranslate(transformationinfo.mPivotX + transformationinfo.mTranslationX, transformationinfo.mPivotY + transformationinfo.mTranslationY);
                transformationinfo.mMatrix.postConcat(transformationinfo.matrix3D);
                transformationinfo.mCamera.restore();
            }
            transformationinfo.mMatrixDirty = false;
            transformationinfo.mMatrixIsIdentity = transformationinfo.mMatrix.isIdentity();
            transformationinfo.mInverseMatrixDirty = true;
            return;
        } else
        {
            return;
        }
    }

    public void addChildrenForAccessibility(ArrayList arraylist)
    {
        if (includeForAccessibility())
            arraylist.add(this);
    }

    public void addFocusables(ArrayList arraylist, int i)
    {
        addFocusables(arraylist, i, 1);
    }

    public void addFocusables(ArrayList arraylist, int i, int j)
    {
        if (arraylist != null && isFocusable() && ((j & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()))
        {
            arraylist.add(this);
            return;
        } else
        {
            return;
        }
    }

    public void addOnAttachStateChangeListener(OnAttachStateChangeListener onattachstatechangelistener)
    {
        ListenerInfo listenerinfo = getListenerInfo();
        if (listenerinfo.mOnAttachStateChangeListeners == null)
            listenerinfo.mOnAttachStateChangeListeners = new CopyOnWriteArrayList();
        listenerinfo.mOnAttachStateChangeListeners.add(onattachstatechangelistener);
    }

    public void addOnLayoutChangeListener(OnLayoutChangeListener onlayoutchangelistener)
    {
        ListenerInfo listenerinfo = getListenerInfo();
        if (listenerinfo.mOnLayoutChangeListeners == null)
            listenerinfo.mOnLayoutChangeListeners = new ArrayList();
        if (!listenerinfo.mOnLayoutChangeListeners.contains(onlayoutchangelistener))
            listenerinfo.mOnLayoutChangeListeners.add(onlayoutchangelistener);
    }

    public void addTouchables(ArrayList arraylist)
    {
        int i = mViewFlags;
        if (((i & 0x4000) == 16384 || (i & 0x200000) == 0x200000) && (i & 0x20) == 0)
            arraylist.add(this);
    }

    public ViewPropertyAnimator animate()
    {
        if (mAnimator == null)
            mAnimator = new ViewPropertyAnimator(this);
        return mAnimator;
    }

    public void announceForAccessibility(CharSequence charsequence)
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled() && mParent != null)
        {
            AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain(16384);
            onInitializeAccessibilityEvent(accessibilityevent);
            accessibilityevent.getText().add(charsequence);
            accessibilityevent.setContentDescription(null);
            mParent.requestSendAccessibilityEvent(this, accessibilityevent);
        }
    }

    public void applyDrawableToTransparentRegion(Drawable drawable, Region region)
    {
        Region region1 = drawable.getTransparentRegion();
        Rect rect = drawable.getBounds();
        AttachInfo attachinfo = mAttachInfo;
        if (region1 != null && attachinfo != null)
        {
            int i = getRight() - getLeft();
            int j = getBottom() - getTop();
            if (rect.left > 0)
                region1.op(0, 0, rect.left, j, android.graphics.Region.Op.UNION);
            if (rect.right < i)
                region1.op(rect.right, 0, i, j, android.graphics.Region.Op.UNION);
            if (rect.top > 0)
                region1.op(0, 0, i, rect.top, android.graphics.Region.Op.UNION);
            if (rect.bottom < j)
                region1.op(0, rect.bottom, i, j, android.graphics.Region.Op.UNION);
            int ai[] = attachinfo.mTransparentLocation;
            getLocationInWindow(ai);
            region1.translate(ai[0], ai[1]);
            region.op(region1, android.graphics.Region.Op.INTERSECT);
            return;
        } else
        {
            region.op(rect, android.graphics.Region.Op.DIFFERENCE);
            return;
        }
    }

    void assignParent(ViewParent viewparent)
    {
        if (mParent == null)
        {
            mParent = viewparent;
            return;
        }
        if (viewparent == null)
        {
            mParent = null;
            return;
        } else
        {
            throw new RuntimeException((new StringBuilder()).append("view ").append(this).append(" being added, but").append(" it already has a parent").toString());
        }
    }

    protected boolean awakenScrollBars()
    {
        return mScrollCache != null && awakenScrollBars(mScrollCache.scrollBarDefaultDelayBeforeFade, true);
    }

    protected boolean awakenScrollBars(int i)
    {
        return awakenScrollBars(i, true);
    }

    protected boolean awakenScrollBars(int i, boolean flag)
    {
        ScrollabilityCache scrollabilitycache = mScrollCache;
        if (scrollabilitycache != null && scrollabilitycache.fadeScrollBars)
        {
            if (scrollabilitycache.scrollBar == null)
                scrollabilitycache.scrollBar = new ScrollBarDrawable();
            if (isHorizontalScrollBarEnabled() || isVerticalScrollBarEnabled())
            {
                if (flag)
                    postInvalidateOnAnimation();
                if (scrollabilitycache.state == 0)
                    i = Math.max(750, i);
                long l = AnimationUtils.currentAnimationTimeMillis() + (long)i;
                scrollabilitycache.fadeStartTime = l;
                scrollabilitycache.state = 1;
                if (mAttachInfo != null)
                {
                    mAttachInfo.mHandler.removeCallbacks(scrollabilitycache);
                    mAttachInfo.mHandler.postAtTime(scrollabilitycache, l);
                }
                return true;
            }
        }
        return false;
    }

    public void bringToFront()
    {
        if (mParent != null)
            mParent.bringChildToFront(this);
    }

    public void buildDrawingCache()
    {
        buildDrawingCache(false);
    }

    public void buildDrawingCache(boolean flag)
    {
        int i;
        int j;
        AttachInfo attachinfo;
        boolean flag1;
        int k;
        boolean flag2;
        boolean flag3;
        int l;
        byte byte0;
        long l1;
        long l2;
        if ((0x8000 & mPrivateFlags) != 0 && (flag ? mDrawingCache != null : mUnscaledDrawingCache != null)) goto _L2; else goto _L1
_L1:
        mCachingFailed = false;
        i = mRight - mLeft;
        j = mBottom - mTop;
        attachinfo = mAttachInfo;
        if (attachinfo != null && attachinfo.mScalingRequired)
            flag1 = true;
        else
            flag1 = false;
        if (flag && flag1)
        {
            i = (int)(0.5F + (float)i * attachinfo.mApplicationScale);
            j = (int)(0.5F + (float)j * attachinfo.mApplicationScale);
        }
        k = mDrawingCacheBackgroundColor;
        if (k != 0 || isOpaque())
            flag2 = true;
        else
            flag2 = false;
        if (attachinfo != null && attachinfo.mUse32BitDrawingCache)
            flag3 = true;
        else
            flag3 = false;
        l = i * j;
        if (flag2 && !flag3)
            byte0 = 2;
        else
            byte0 = 4;
        l1 = byte0 * l;
        l2 = ViewConfiguration.get(mContext).getScaledMaximumDrawingCacheSize();
        if (i > 0 && j > 0 && l1 <= l2) goto _L4; else goto _L3
_L3:
        if (i > 0 && j > 0)
            Log.w("View", (new StringBuilder()).append("View too large to fit into drawing cache, needs ").append(l1).append(" bytes, only ").append(l2).append(" available").toString());
        destroyDrawingCache();
        mCachingFailed = true;
_L2:
        return;
_L4:
        boolean flag4;
        Bitmap bitmap;
        android.graphics.Bitmap.Config config;
        Canvas canvas;
        flag4 = true;
        int i1;
        float f;
        if (flag)
            bitmap = mDrawingCache;
        else
            bitmap = mUnscaledDrawingCache;
        if (bitmap != null && bitmap.getWidth() == i && bitmap.getHeight() == j) goto _L6; else goto _L5
_L5:
        if (flag2) goto _L8; else goto _L7
_L7:
        0x180000 & mViewFlags;
        JVM INSTR lookupswitch 3: default 376
    //                   0: 673
    //                   524288: 681
    //                   1048576: 689;
           goto _L9 _L10 _L11 _L12
_L9:
        config = android.graphics.Bitmap.Config.ARGB_8888;
_L15:
        if (bitmap != null)
            bitmap.recycle();
        bitmap = Bitmap.createBitmap(mResources.getDisplayMetrics(), i, j, config);
        bitmap.setDensity(getResources().getDisplayMetrics().densityDpi);
        if (!flag) goto _L14; else goto _L13
_L13:
        mDrawingCache = bitmap;
_L16:
        if (!flag2 || !flag3)
            break MISSING_BLOCK_LABEL_448;
        bitmap.setHasAlpha(false);
        OutOfMemoryError outofmemoryerror;
        if (k != 0)
            flag4 = true;
        else
            flag4 = false;
_L6:
        if (attachinfo != null)
        {
            canvas = attachinfo.mCanvas;
            if (canvas == null)
                canvas = new Canvas();
            canvas.setBitmap(bitmap);
            attachinfo.mCanvas = null;
        } else
        {
            canvas = new Canvas(bitmap);
        }
        if (flag4)
            bitmap.eraseColor(k);
        computeScroll();
        i1 = canvas.save();
        if (flag && flag1)
        {
            f = attachinfo.mApplicationScale;
            canvas.scale(f, f);
        }
        canvas.translate(-mScrollX, -mScrollY);
        mPrivateFlags = 0x20 | mPrivateFlags;
        if (mAttachInfo == null || !mAttachInfo.mHardwareAccelerated || mLayerType != 0)
            mPrivateFlags = 0x8000 | mPrivateFlags;
        if ((0x80 & mPrivateFlags) == 128)
        {
            mPrivateFlags = 0xff9fffff & mPrivateFlags;
            dispatchDraw(canvas);
        } else
        {
            draw(canvas);
        }
        canvas.restoreToCount(i1);
        canvas.setBitmap(null);
        if (attachinfo != null)
        {
            attachinfo.mCanvas = canvas;
            return;
        }
          goto _L2
_L10:
        config = android.graphics.Bitmap.Config.ARGB_8888;
          goto _L15
_L11:
        config = android.graphics.Bitmap.Config.ARGB_8888;
          goto _L15
_L12:
        config = android.graphics.Bitmap.Config.ARGB_8888;
          goto _L15
_L8:
        if (flag3)
            config = android.graphics.Bitmap.Config.ARGB_8888;
        else
            config = android.graphics.Bitmap.Config.RGB_565;
          goto _L15
_L14:
        mUnscaledDrawingCache = bitmap;
          goto _L16
        outofmemoryerror;
        if (flag)
            mDrawingCache = null;
        else
            mUnscaledDrawingCache = null;
        mCachingFailed = true;
        return;
          goto _L15
    }

    public void buildLayer()
    {
label0:
        {
label1:
            {
                if (mLayerType != 0)
                {
                    if (mAttachInfo == null)
                        throw new IllegalStateException("This view must be attached to a window first");
                    switch (mLayerType)
                    {
                    default:
                        break label0;

                    case 1: // '\001'
                        break label1;

                    case 2: // '\002'
                        if (mAttachInfo.mHardwareRenderer != null && mAttachInfo.mHardwareRenderer.isEnabled() && mAttachInfo.mHardwareRenderer.validate())
                        {
                            getHardwareLayer();
                            return;
                        }
                        break;
                    }
                }
                return;
            }
            buildDrawingCache(true);
            return;
        }
    }

    public boolean callOnClick()
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnClickListener != null)
        {
            listenerinfo.mOnClickListener.onClick(this);
            return true;
        } else
        {
            return false;
        }
    }

    boolean canAcceptDrag()
    {
        return (1 & mPrivateFlags2) != 0;
    }

    public boolean canHaveDisplayList()
    {
        return mAttachInfo != null && mAttachInfo.mHardwareRenderer != null;
    }

    public boolean canResolveLayoutDirection()
    {
        switch (getRawLayoutDirection())
        {
        case 2: // '\002'
            return mParent != null && (mParent instanceof ViewGroup) && ((ViewGroup)mParent).canResolveLayoutDirection();
        }
        return true;
    }

    public boolean canScrollHorizontally(int i)
    {
        boolean flag = true;
        int j = computeHorizontalScrollOffset();
        int k = computeHorizontalScrollRange() - computeHorizontalScrollExtent();
        if (k == 0)
            flag = false;
        else
        if (i < 0)
        {
            if (j <= 0)
                return false;
        } else
        if (j >= k - 1)
            return false;
        return flag;
    }

    public boolean canScrollVertically(int i)
    {
        boolean flag = true;
        int j = computeVerticalScrollOffset();
        int k = computeVerticalScrollRange() - computeVerticalScrollExtent();
        if (k == 0)
            flag = false;
        else
        if (i < 0)
        {
            if (j <= 0)
                return false;
        } else
        if (j >= k - 1)
            return false;
        return flag;
    }

    public void cancelLongPress()
    {
        removeLongPressCallback();
        removeTapCallback();
    }

    public boolean checkInputConnectionProxy(View view)
    {
        return false;
    }

    public void clearAccessibilityFocus()
    {
        if ((0x4000000 & mPrivateFlags2) != 0)
        {
            mPrivateFlags2 = 0xfbffffff & mPrivateFlags2;
            invalidate();
            sendAccessibilityEvent(0x10000);
            notifyAccessibilityStateChanged();
        }
        ViewRootImpl viewrootimpl = getViewRootImpl();
        if (viewrootimpl != null)
        {
            View view = viewrootimpl.getAccessibilityFocusedHost();
            if (view != null && ViewRootImpl.isViewDescendantOf(view, this))
                viewrootimpl.setAccessibilityFocus(null, null);
        }
    }

    void clearAccessibilityFocusNoCallbacks()
    {
        if ((0x4000000 & mPrivateFlags2) != 0)
        {
            mPrivateFlags2 = 0xfbffffff & mPrivateFlags2;
            invalidate();
        }
    }

    public void clearAnimation()
    {
        if (mCurrentAnimation != null)
            mCurrentAnimation.detach();
        mCurrentAnimation = null;
        invalidateParentIfNeeded();
    }

    public void clearFocus()
    {
        if ((2 & mPrivateFlags) != 0)
        {
            mPrivateFlags = -3 & mPrivateFlags;
            if (mParent != null)
                mParent.clearChildFocus(this);
            onFocusChanged(false, 0, null);
            refreshDrawableState();
            ensureInputFocusOnFirstFocusable();
            if (AccessibilityManager.getInstance(mContext).isEnabled())
                notifyAccessibilityStateChanged();
        }
    }

    protected int computeHorizontalScrollExtent()
    {
        return getWidth();
    }

    protected int computeHorizontalScrollOffset()
    {
        return mScrollX;
    }

    protected int computeHorizontalScrollRange()
    {
        return getWidth();
    }

    protected void computeOpaqueFlags()
    {
        if (mBackground != null && mBackground.getOpacity() == -1)
            mPrivateFlags = 0x800000 | mPrivateFlags;
        else
            mPrivateFlags = 0xff7fffff & mPrivateFlags;
        int i = mViewFlags;
        if (((i & 0x200) != 0 || (i & 0x100) != 0) && (0x3000000 & i) != 0)
        {
            mPrivateFlags = 0xfeffffff & mPrivateFlags;
            return;
        } else
        {
            mPrivateFlags = 0x1000000 | mPrivateFlags;
            return;
        }
    }

    public void computeScroll()
    {
    }

    protected int computeVerticalScrollExtent()
    {
        return getHeight();
    }

    protected int computeVerticalScrollOffset()
    {
        return mScrollY;
    }

    protected int computeVerticalScrollRange()
    {
        return getHeight();
    }

    public AccessibilityNodeInfo createAccessibilityNodeInfo()
    {
        AccessibilityNodeProvider accessibilitynodeprovider = getAccessibilityNodeProvider();
        if (accessibilitynodeprovider != null)
        {
            return accessibilitynodeprovider.createAccessibilityNodeInfo(-1);
        } else
        {
            AccessibilityNodeInfo accessibilitynodeinfo = AccessibilityNodeInfo.obtain(this);
            onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
            return accessibilitynodeinfo;
        }
    }

    public void createContextMenu(ContextMenu contextmenu)
    {
        ContextMenu.ContextMenuInfo contextmenuinfo = getContextMenuInfo();
        ((MenuBuilder)contextmenu).setCurrentMenuInfo(contextmenuinfo);
        onCreateContextMenu(contextmenu);
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnCreateContextMenuListener != null)
            listenerinfo.mOnCreateContextMenuListener.onCreateContextMenu(contextmenu, this, contextmenuinfo);
        ((MenuBuilder)contextmenu).setCurrentMenuInfo(null);
        if (mParent != null)
            mParent.createContextMenu(contextmenu);
    }

    Bitmap createSnapshot(android.graphics.Bitmap.Config config, int i, boolean flag)
    {
        int j = mRight - mLeft;
        int k = mBottom - mTop;
        AttachInfo attachinfo = mAttachInfo;
        float f;
        if (attachinfo != null)
            f = attachinfo.mApplicationScale;
        else
            f = 1.0F;
        int l = (int)(0.5F + f * (float)j);
        int i1 = (int)(0.5F + f * (float)k);
        DisplayMetrics displaymetrics = mResources.getDisplayMetrics();
        if (l <= 0)
            l = 1;
        if (i1 <= 0)
            i1 = 1;
        Bitmap bitmap = Bitmap.createBitmap(displaymetrics, l, i1, config);
        if (bitmap == null)
            throw new OutOfMemoryError();
        Resources resources = getResources();
        if (resources != null)
            bitmap.setDensity(resources.getDisplayMetrics().densityDpi);
        Canvas canvas;
        if (attachinfo != null)
        {
            canvas = attachinfo.mCanvas;
            if (canvas == null)
                canvas = new Canvas();
            canvas.setBitmap(bitmap);
            attachinfo.mCanvas = null;
        } else
        {
            canvas = new Canvas(bitmap);
        }
        if ((0xff000000 & i) != 0)
            bitmap.eraseColor(i);
        computeScroll();
        int j1 = canvas.save();
        canvas.scale(f, f);
        canvas.translate(-mScrollX, -mScrollY);
        int k1 = mPrivateFlags;
        mPrivateFlags = 0xff9fffff & mPrivateFlags;
        if ((0x80 & mPrivateFlags) == 128)
            dispatchDraw(canvas);
        else
            draw(canvas);
        mPrivateFlags = k1;
        canvas.restoreToCount(j1);
        canvas.setBitmap(null);
        if (attachinfo != null)
            attachinfo.mCanvas = canvas;
        return bitmap;
    }

    public void debug()
    {
        debug(0);
    }

    protected void debug(int i)
    {
        String s = debugIndent(i - 1);
        String s1 = (new StringBuilder()).append(s).append("+ ").append(this).toString();
        int j = getId();
        if (j != -1)
            s1 = (new StringBuilder()).append(s1).append(" (id=").append(j).append(")").toString();
        Object obj = getTag();
        if (obj != null)
            s1 = (new StringBuilder()).append(s1).append(" (tag=").append(obj).append(")").toString();
        Log.d("View", s1);
        if ((2 & mPrivateFlags) != 0)
            Log.d("View", (new StringBuilder()).append(debugIndent(i)).append(" FOCUSED").toString());
        String s2 = debugIndent(i);
        Log.d("View", (new StringBuilder()).append(s2).append("frame={").append(mLeft).append(", ").append(mTop).append(", ").append(mRight).append(", ").append(mBottom).append("} scroll={").append(mScrollX).append(", ").append(mScrollY).append("} ").toString());
        if (mPaddingLeft != 0 || mPaddingTop != 0 || mPaddingRight != 0 || mPaddingBottom != 0)
        {
            String s3 = debugIndent(i);
            Log.d("View", (new StringBuilder()).append(s3).append("padding={").append(mPaddingLeft).append(", ").append(mPaddingTop).append(", ").append(mPaddingRight).append(", ").append(mPaddingBottom).append("}").toString());
        }
        String s4 = debugIndent(i);
        Log.d("View", (new StringBuilder()).append(s4).append("mMeasureWidth=").append(mMeasuredWidth).append(" mMeasureHeight=").append(mMeasuredHeight).toString());
        String s5 = debugIndent(i);
        String s6;
        if (mLayoutParams == null)
            s6 = (new StringBuilder()).append(s5).append("BAD! no layout params").toString();
        else
            s6 = mLayoutParams.debug(s5);
        Log.d("View", s6);
        String s7 = debugIndent(i);
        String s8 = (new StringBuilder()).append(s7).append("flags={").toString();
        String s9 = (new StringBuilder()).append(s8).append(printFlags(mViewFlags)).toString();
        Log.d("View", (new StringBuilder()).append(s9).append("}").toString());
        String s10 = debugIndent(i);
        String s11 = (new StringBuilder()).append(s10).append("privateFlags={").toString();
        String s12 = (new StringBuilder()).append(s11).append(printPrivateFlags(mPrivateFlags)).toString();
        Log.d("View", (new StringBuilder()).append(s12).append("}").toString());
    }

    public void destroyDrawingCache()
    {
        if (mDrawingCache != null)
        {
            mDrawingCache.recycle();
            mDrawingCache = null;
        }
        if (mUnscaledDrawingCache != null)
        {
            mUnscaledDrawingCache.recycle();
            mUnscaledDrawingCache = null;
        }
    }

    protected void destroyHardwareResources()
    {
        destroyLayer(true);
    }

    boolean destroyLayer(boolean flag)
    {
        if (mHardwareLayer != null)
        {
            AttachInfo attachinfo = mAttachInfo;
            if (attachinfo != null && attachinfo.mHardwareRenderer != null && (attachinfo.mHardwareRenderer.isEnabled() || attachinfo.mHardwareRenderer.forceDestroyLayers()) && (flag || attachinfo.mHardwareRenderer.validate()))
            {
                mHardwareLayer.destroy();
                mHardwareLayer = null;
                if (mDisplayList != null)
                    mDisplayList.reset();
                invalidate(true);
                invalidateParentCaches();
            }
            return true;
        } else
        {
            return false;
        }
    }

    void dispatchAttachedToWindow(AttachInfo attachinfo, int i)
    {
        mAttachInfo = attachinfo;
        mWindowAttachCount = 1 + mWindowAttachCount;
        mPrivateFlags = 0x400 | mPrivateFlags;
        if (mFloatingTreeObserver != null)
        {
            attachinfo.mTreeObserver.merge(mFloatingTreeObserver);
            mFloatingTreeObserver = null;
        }
        if ((0x80000 & mPrivateFlags) != 0)
        {
            mAttachInfo.mScrollContainers.add(this);
            mPrivateFlags = 0x100000 | mPrivateFlags;
        }
        performCollectViewAttributes(mAttachInfo, i);
        onAttachedToWindow();
        ListenerInfo listenerinfo = mListenerInfo;
        CopyOnWriteArrayList copyonwritearraylist = null;
        if (listenerinfo != null)
            copyonwritearraylist = listenerinfo.mOnAttachStateChangeListeners;
        if (copyonwritearraylist != null && copyonwritearraylist.size() > 0)
        {
            for (Iterator iterator = copyonwritearraylist.iterator(); iterator.hasNext(); ((OnAttachStateChangeListener)iterator.next()).onViewAttachedToWindow(this));
        }
        int j = attachinfo.mWindowVisibility;
        if (j != 8)
            onWindowVisibilityChanged(j);
        if ((0x400 & mPrivateFlags) != 0)
            refreshDrawableState();
        needGlobalAttributesUpdate(false);
    }

    void dispatchCollectViewAttributes(AttachInfo attachinfo, int i)
    {
        performCollectViewAttributes(attachinfo, i);
    }

    public void dispatchConfigurationChanged(Configuration configuration)
    {
        onConfigurationChanged(configuration);
    }

    void dispatchDetachedFromWindow()
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null && attachinfo.mWindowVisibility != 8)
            onWindowVisibilityChanged(8);
        onDetachedFromWindow();
        ListenerInfo listenerinfo = mListenerInfo;
        CopyOnWriteArrayList copyonwritearraylist;
        if (listenerinfo != null)
            copyonwritearraylist = listenerinfo.mOnAttachStateChangeListeners;
        else
            copyonwritearraylist = null;
        if (copyonwritearraylist != null && copyonwritearraylist.size() > 0)
        {
            for (Iterator iterator = copyonwritearraylist.iterator(); iterator.hasNext(); ((OnAttachStateChangeListener)iterator.next()).onViewDetachedFromWindow(this));
        }
        if ((0x100000 & mPrivateFlags) != 0)
        {
            mAttachInfo.mScrollContainers.remove(this);
            mPrivateFlags = 0xffefffff & mPrivateFlags;
        }
        mAttachInfo = null;
    }

    public void dispatchDisplayHint(int i)
    {
        onDisplayHint(i);
    }

    public boolean dispatchDragEvent(DragEvent dragevent)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnDragListener != null && (0x20 & mViewFlags) == 0 && listenerinfo.mOnDragListener.onDrag(this, dragevent))
            return true;
        else
            return onDragEvent(dragevent);
    }

    protected void dispatchDraw(Canvas canvas)
    {
    }

    public void dispatchFinishTemporaryDetach()
    {
        onFinishTemporaryDetach();
    }

    protected boolean dispatchGenericFocusedEvent(MotionEvent motionevent)
    {
        return false;
    }

    public boolean dispatchGenericMotionEvent(MotionEvent motionevent)
    {
label0:
        {
            if (mInputEventConsistencyVerifier != null)
                mInputEventConsistencyVerifier.onGenericMotionEvent(motionevent, 0);
            if ((2 & motionevent.getSource()) != 0)
            {
                int i = motionevent.getAction();
                if (i == 9 || i == 7 || i == 10 ? dispatchHoverEvent(motionevent) : dispatchGenericPointerEvent(motionevent))
                    break label0;
            } else
            if (dispatchGenericFocusedEvent(motionevent))
                return true;
            if (!dispatchGenericMotionEventInternal(motionevent))
            {
                if (mInputEventConsistencyVerifier != null)
                    mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 0);
                return false;
            }
        }
        return true;
    }

    protected boolean dispatchGenericPointerEvent(MotionEvent motionevent)
    {
        return false;
    }

    protected void dispatchGetDisplayList()
    {
    }

    protected boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnHoverListener != null && (0x20 & mViewFlags) == 0 && listenerinfo.mOnHoverListener.onHover(this, motionevent))
            return true;
        else
            return onHoverEvent(motionevent);
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onKeyEvent(keyevent, 0);
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnKeyListener != null && (0x20 & mViewFlags) == 0 && listenerinfo.mOnKeyListener.onKey(this, keyevent.getKeyCode(), keyevent))
            return true;
        KeyEvent.DispatcherState dispatcherstate;
        if (mAttachInfo != null)
            dispatcherstate = mAttachInfo.mKeyDispatchState;
        else
            dispatcherstate = null;
        if (keyevent.dispatch(this, dispatcherstate, this))
            return true;
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onUnhandledEvent(keyevent, 0);
        return false;
    }

    public boolean dispatchKeyEventPreIme(KeyEvent keyevent)
    {
        return onKeyPreIme(keyevent.getKeyCode(), keyevent);
    }

    public boolean dispatchKeyShortcutEvent(KeyEvent keyevent)
    {
        return onKeyShortcut(keyevent.getKeyCode(), keyevent);
    }

    public final boolean dispatchPointerEvent(MotionEvent motionevent)
    {
        if (motionevent.isTouchEvent())
            return dispatchTouchEvent(motionevent);
        else
            return dispatchGenericMotionEvent(motionevent);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mAccessibilityDelegate != null)
            return mAccessibilityDelegate.dispatchPopulateAccessibilityEvent(this, accessibilityevent);
        else
            return dispatchPopulateAccessibilityEventInternal(accessibilityevent);
    }

    boolean dispatchPopulateAccessibilityEventInternal(AccessibilityEvent accessibilityevent)
    {
        onPopulateAccessibilityEvent(accessibilityevent);
        return false;
    }

    protected void dispatchRestoreInstanceState(SparseArray sparsearray)
    {
        if (mID != -1)
        {
            Parcelable parcelable = (Parcelable)sparsearray.get(mID);
            if (parcelable != null)
            {
                mPrivateFlags = 0xfffdffff & mPrivateFlags;
                onRestoreInstanceState(parcelable);
                if ((0x20000 & mPrivateFlags) == 0)
                    throw new IllegalStateException("Derived class did not call super.onRestoreInstanceState()");
            }
        }
    }

    protected void dispatchSaveInstanceState(SparseArray sparsearray)
    {
        if (mID != -1 && (0x10000 & mViewFlags) == 0)
        {
            mPrivateFlags = 0xfffdffff & mPrivateFlags;
            Parcelable parcelable = onSaveInstanceState();
            if ((0x20000 & mPrivateFlags) == 0)
                throw new IllegalStateException("Derived class did not call super.onSaveInstanceState()");
            if (parcelable != null)
                sparsearray.put(mID, parcelable);
        }
    }

    void dispatchScreenStateChanged(int i)
    {
        onScreenStateChanged(i);
    }

    protected void dispatchSetActivated(boolean flag)
    {
    }

    protected void dispatchSetPressed(boolean flag)
    {
    }

    protected void dispatchSetSelected(boolean flag)
    {
    }

    public void dispatchStartTemporaryDetach()
    {
        clearAccessibilityFocus();
        clearDisplayList();
        onStartTemporaryDetach();
    }

    public void dispatchSystemUiVisibilityChanged(int i)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnSystemUiVisibilityChangeListener != null)
            listenerinfo.mOnSystemUiVisibilityChangeListener.onSystemUiVisibilityChange(0xffff & i);
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
label0:
        {
            if (mInputEventConsistencyVerifier != null)
                mInputEventConsistencyVerifier.onTouchEvent(motionevent, 0);
            if (onFilterTouchEventForSecurity(motionevent))
            {
                ListenerInfo listenerinfo = mListenerInfo;
                if (listenerinfo != null && listenerinfo.mOnTouchListener != null && (0x20 & mViewFlags) == 0 && listenerinfo.mOnTouchListener.onTouch(this, motionevent) || onTouchEvent(motionevent))
                    break label0;
            }
            if (mInputEventConsistencyVerifier != null)
                mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 0);
            return false;
        }
        return true;
    }

    public boolean dispatchTrackballEvent(MotionEvent motionevent)
    {
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onTrackballEvent(motionevent, 0);
        return onTrackballEvent(motionevent);
    }

    public boolean dispatchUnhandledMove(View view, int i)
    {
        return false;
    }

    protected void dispatchVisibilityChanged(View view, int i)
    {
        onVisibilityChanged(view, i);
    }

    public void dispatchWindowFocusChanged(boolean flag)
    {
        onWindowFocusChanged(flag);
    }

    public void dispatchWindowSystemUiVisiblityChanged(int i)
    {
        onWindowSystemUiVisibilityChanged(i);
    }

    public void dispatchWindowVisibilityChanged(int i)
    {
        onWindowVisibilityChanged(i);
    }

    public void draw(Canvas canvas)
    {
        int i = mPrivateFlags;
        boolean flag;
        if ((0x600000 & i) != 0x400000 || mAttachInfo != null && mAttachInfo.mIgnoreDirtyState)
            flag = false;
        else
            flag = true;
        mPrivateFlags = 0x20 | 0xff9fffff & i;
        if (!flag)
        {
            Drawable drawable = mBackground;
            if (drawable != null)
            {
                int k2 = mScrollX;
                int i3 = mScrollY;
                if (mBackgroundSizeChanged)
                {
                    drawable.setBounds(0, 0, mRight - mLeft, mBottom - mTop);
                    mBackgroundSizeChanged = false;
                }
                if ((k2 | i3) == 0)
                {
                    drawable.draw(canvas);
                } else
                {
                    canvas.translate(k2, i3);
                    drawable.draw(canvas);
                    canvas.translate(-k2, -i3);
                }
            }
        }
        int j = mViewFlags;
        boolean flag1;
        if ((j & 0x1000) != 0)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if ((j & 0x2000) != 0)
            flag2 = true;
        else
            flag2 = false;
        if (!flag2 && !flag1)
        {
            if (!flag)
            {
                long l4 = System.currentTimeMillis();
                onDraw(canvas);
                long l5 = System.currentTimeMillis();
                if (l5 - l4 > (long)DBG_TIMEOUT_VALUE)
                    Xlog.d("View", (new StringBuilder()).append("[ANR Warning]onDraw time too long, this =").append(this).append("time =").append(l5 - l4).toString());
            }
            dispatchDraw(canvas);
            onDrawScrollBars(canvas);
            return;
        }
        int k = mPaddingLeft;
        boolean flag3 = isPaddingOffsetRequired();
        if (flag3)
            k += getLeftPaddingOffset();
        int l = k + mScrollX;
        int i1 = (l + mRight) - mLeft - mPaddingRight - k;
        int j1 = mScrollY + getFadeTop(flag3);
        int k1 = j1 + getFadeHeight(flag3);
        if (flag3)
        {
            i1 += getRightPaddingOffset();
            k1 += getBottomPaddingOffset();
        }
        ScrollabilityCache scrollabilitycache = mScrollCache;
        float f = scrollabilitycache.fadingEdgeLength;
        int l1 = (int)f;
        if (flag2 && j1 + l1 > k1 - l1)
            l1 = (k1 - j1) / 2;
        if (flag1 && l + l1 > i1 - l1)
            l1 = (i1 - l) / 2;
        float f1 = 0.0F;
        boolean flag4 = false;
        boolean flag5 = false;
        float f2 = 0.0F;
        if (flag2)
        {
            f2 = Math.max(0.0F, Math.min(1.0F, getTopFadingEdgeStrength()));
            if (f2 * f > 1.0F)
                flag5 = true;
            else
                flag5 = false;
            f1 = Math.max(0.0F, Math.min(1.0F, getBottomFadingEdgeStrength()));
            if (f1 * f > 1.0F)
                flag4 = true;
            else
                flag4 = false;
        }
        boolean flag6 = false;
        boolean flag7 = false;
        float f3 = 0.0F;
        float f4 = 0.0F;
        if (flag1)
        {
            f3 = Math.max(0.0F, Math.min(1.0F, getLeftFadingEdgeStrength()));
            if (f3 * f > 1.0F)
                flag6 = true;
            else
                flag6 = false;
            f4 = Math.max(0.0F, Math.min(1.0F, getRightFadingEdgeStrength()));
            if (f4 * f > 1.0F)
                flag7 = true;
            else
                flag7 = false;
        }
        int i2 = canvas.getSaveCount();
        int j2 = getSolidColor();
        if (j2 == 0)
        {
            if (flag5)
                canvas.saveLayer(l, j1, i1, j1 + l1, null, 4);
            if (flag4)
                canvas.saveLayer(l, k1 - l1, i1, k1, null, 4);
            if (flag6)
                canvas.saveLayer(l, j1, l + l1, k1, null, 4);
            if (flag7)
                canvas.saveLayer(i1 - l1, j1, i1, k1, null, 4);
        } else
        {
            scrollabilitycache.setFadeColor(j2);
        }
        if (!flag)
        {
            long l2 = System.currentTimeMillis();
            onDraw(canvas);
            long l3 = System.currentTimeMillis();
            if (l3 - l2 > (long)DBG_TIMEOUT_VALUE)
                Xlog.d("View", (new StringBuilder()).append("[ANR Warning]onDraw time too long, this =").append(this).append("time =").append(l3 - l2).toString());
        }
        dispatchDraw(canvas);
        Paint paint = scrollabilitycache.paint;
        Matrix matrix = scrollabilitycache.matrix;
        Shader shader = scrollabilitycache.shader;
        if (flag5)
        {
            matrix.setScale(1.0F, f * f2);
            matrix.postTranslate(l, j1);
            shader.setLocalMatrix(matrix);
            canvas.drawRect(l, j1, i1, j1 + l1, paint);
        }
        if (flag4)
        {
            matrix.setScale(1.0F, f * f1);
            matrix.postRotate(180F);
            matrix.postTranslate(l, k1);
            shader.setLocalMatrix(matrix);
            canvas.drawRect(l, k1 - l1, i1, k1, paint);
        }
        if (flag6)
        {
            matrix.setScale(1.0F, f * f3);
            matrix.postRotate(-90F);
            matrix.postTranslate(l, j1);
            shader.setLocalMatrix(matrix);
            canvas.drawRect(l, j1, l + l1, k1, paint);
        }
        if (flag7)
        {
            matrix.setScale(1.0F, f * f4);
            matrix.postRotate(90F);
            matrix.postTranslate(i1, j1);
            shader.setLocalMatrix(matrix);
            canvas.drawRect(i1 - l1, j1, i1, k1, paint);
        }
        canvas.restoreToCount(i2);
        onDrawScrollBars(canvas);
    }

    boolean draw(Canvas canvas, ViewGroup viewgroup, long l)
    {
        boolean flag;
        if (mAttachInfo != null && mAttachInfo.mHardwareAccelerated)
            flag = true;
        else
            flag = false;
        boolean flag1 = hasIdentityMatrix();
        int i = viewgroup.mGroupFlags;
        if ((i & 0x100) == 256)
        {
            viewgroup.mChildTransformation.clear();
            viewgroup.mGroupFlags = 0xfffffeff & viewgroup.mGroupFlags;
        }
        int j = getLayerType();
        boolean flag2 = canvas.isHardwareAccelerated();
        boolean flag3;
        boolean flag4;
        if ((0x8000 & i) == 0 && (i & 0x4000) == 0)
        {
            if (j == 0 && !flag2)
                flag3 = false;
            else
                flag3 = true;
            flag4 = false;
        } else
        {
            flag3 = true;
            AttachInfo attachinfo = mAttachInfo;
            flag4 = false;
            if (attachinfo != null)
                flag4 = mAttachInfo.mScalingRequired;
        }
        Animation animation = getAnimation();
        boolean flag5;
        boolean flag6;
        Transformation transformation;
        if (animation != null)
        {
            flag6 = drawAnimation(viewgroup, l, animation, flag4);
            flag5 = animation.willChangeTransformationMatrix();
            if (flag5)
                mPrivateFlags3 = 1 | mPrivateFlags3;
            transformation = viewgroup.mChildTransformation;
        } else
        {
            if ((1 & mPrivateFlags3) == 1 && mDisplayList != null)
            {
                mDisplayList.setAnimationMatrix(null);
                mPrivateFlags3 = -2 & mPrivateFlags3;
            }
            flag5 = false;
            flag6 = false;
            transformation = null;
            if (!flag)
            {
                int l4 = i & 0x800;
                flag5 = false;
                flag6 = false;
                transformation = null;
                if (l4 != 0)
                {
                    boolean flag15 = viewgroup.getChildStaticTransformation(this, viewgroup.mChildTransformation);
                    flag5 = false;
                    flag6 = false;
                    transformation = null;
                    if (flag15)
                    {
                        int i5 = viewgroup.mChildTransformation.getTransformationType();
                        if (i5 != Transformation.TYPE_IDENTITY)
                            transformation = viewgroup.mChildTransformation;
                        else
                            transformation = null;
                        if ((i5 & Transformation.TYPE_MATRIX) != 0)
                            flag5 = true;
                        else
                            flag5 = false;
                        flag6 = false;
                    }
                }
            }
        }
        boolean flag7;
        if (!flag1)
            flag7 = true;
        else
            flag7 = false;
        boolean flag8 = flag5 | flag7;
        mPrivateFlags = 0x20 | mPrivateFlags;
        if (!flag8 && (i & 0x801) == 1 && canvas.quickReject(mLeft, mTop, mRight, mBottom, android.graphics.Canvas.EdgeType.BW) && (0x40 & mPrivateFlags) == 0)
        {
            mPrivateFlags2 = 0x10000000 | mPrivateFlags2;
            return flag6;
        }
        mPrivateFlags2 = 0xefffffff & mPrivateFlags2;
        if (flag2)
        {
            boolean flag14;
            if ((0x80000000 & mPrivateFlags) == 0x80000000)
                flag14 = true;
            else
                flag14 = false;
            mRecreateDisplayList = flag14;
            mPrivateFlags = 0x7fffffff & mPrivateFlags;
        }
        Bitmap bitmap = null;
        boolean flag9 = false;
        if (flag3)
            if (!flag2)
            {
                if (j != 0)
                {
                    j = 1;
                    buildDrawingCache(true);
                }
                bitmap = getDrawingCache(true);
            } else
            {
                switch (j)
                {
                case 2: // '\002'
                    bitmap = null;
                    flag9 = false;
                    if (flag)
                    {
                        flag9 = canHaveDisplayList();
                        bitmap = null;
                    }
                    break;

                case 1: // '\001'
                    if (flag)
                    {
                        flag9 = canHaveDisplayList();
                        bitmap = null;
                    } else
                    {
                        buildDrawingCache(true);
                        bitmap = getDrawingCache(true);
                        flag9 = false;
                    }
                    break;

                case 0: // '\0'
                    flag9 = canHaveDisplayList();
                    bitmap = null;
                    break;

                default:
                    bitmap = null;
                    flag9 = false;
                    break;
                }
            }
        boolean flag10 = flag & flag9;
        DisplayList displaylist = null;
        if (flag10)
        {
            displaylist = getDisplayList();
            if (!displaylist.isValid())
            {
                displaylist = null;
                flag9 = false;
                flag10 = false;
            }
        }
        int k = 0;
        int i1 = 0;
        if (!flag9)
        {
            computeScroll();
            k = mScrollX;
            i1 = mScrollY;
        }
        boolean flag11;
        if (bitmap != null && !flag9)
            flag11 = false;
        else
            flag11 = true;
        boolean flag12;
        if (bitmap == null && !flag9 && j != 2)
            flag12 = true;
        else
            flag12 = false;
        int j1 = -1;
        if (!flag10 || transformation != null)
            j1 = canvas.save();
        if (flag12)
        {
            canvas.translate(mLeft - k, mTop - i1);
        } else
        {
            if (!flag10)
                canvas.translate(mLeft, mTop);
            if (flag4)
            {
                if (flag10)
                    j1 = canvas.save();
                float f3 = 1.0F / mAttachInfo.mApplicationScale;
                canvas.scale(f3, f3);
            }
        }
        float f;
        if (flag10)
            f = 1.0F;
        else
            f = getAlpha();
        if (transformation == null && f >= 1.0F && hasIdentityMatrix() && (2 & mPrivateFlags3) != 2)
        {
            if ((0x40000 & mPrivateFlags) == 0x40000)
            {
                onSetAlpha(255);
                mPrivateFlags = 0xfffbffff & mPrivateFlags;
            }
        } else
        {
            if (transformation != null || !flag1)
            {
                int k1 = 0;
                int l1 = 0;
                if (flag12)
                {
                    k1 = -k;
                    l1 = -i1;
                }
                if (transformation != null)
                {
                    if (flag8)
                    {
                        if (flag10)
                        {
                            Matrix matrix = transformation.getMatrix();
                            displaylist.setAnimationMatrix(matrix);
                        } else
                        {
                            canvas.translate(-k1, -l1);
                            canvas.concat(transformation.getMatrix());
                            canvas.translate(k1, l1);
                        }
                        viewgroup.mGroupFlags = 0x100 | viewgroup.mGroupFlags;
                    }
                    float f2 = transformation.getAlpha();
                    if (f2 < 1.0F)
                    {
                        f *= f2;
                        viewgroup.mGroupFlags = 0x100 | viewgroup.mGroupFlags;
                    }
                }
                if (!flag1 && !flag10)
                {
                    canvas.translate(-k1, -l1);
                    canvas.concat(getMatrix());
                    canvas.translate(k1, l1);
                }
            }
            if (f < 1.0F || (2 & mPrivateFlags3) == 2)
            {
                if (f < 1.0F)
                    mPrivateFlags3 = 2 | mPrivateFlags3;
                else
                    mPrivateFlags3 = -3 & mPrivateFlags3;
                viewgroup.mGroupFlags = 0x100 | viewgroup.mGroupFlags;
                if (flag11)
                {
                    int l3 = (int)(255F * f);
                    if (!onSetAlpha(l3))
                    {
                        int i4 = 4;
                        if ((i & 1) != 0 || j != 0)
                            i4 |= 0x10;
                        if (flag10)
                        {
                            float f1 = f * getAlpha();
                            displaylist.setAlpha(f1);
                        } else
                        if (j == 0)
                        {
                            int j4;
                            if (flag9)
                                j4 = 0;
                            else
                                j4 = k;
                            int k4;
                            if (flag9)
                                k4 = 0;
                            else
                                k4 = i1;
                            canvas.saveLayerAlpha(j4, k4, (j4 + mRight) - mLeft, (k4 + mBottom) - mTop, l3, i4);
                        }
                    } else
                    {
                        mPrivateFlags = 0x40000 | mPrivateFlags;
                    }
                }
            }
        }
        if ((i & 1) == 1 && !flag10)
            if (flag12)
            {
                int j3 = k + (mRight - mLeft);
                int k3 = i1 + (mBottom - mTop);
                canvas.clipRect(k, i1, j3, k3);
            } else
            if (flag4 && bitmap != null)
                canvas.clipRect(0, 0, bitmap.getWidth(), bitmap.getHeight());
            else
                canvas.clipRect(0, 0, mRight - mLeft, mBottom - mTop);
        if (!flag10 && flag9)
        {
            displaylist = getDisplayList();
            if (!displaylist.isValid())
            {
                displaylist = null;
                flag9 = false;
            }
        }
        if (flag11)
        {
            int k2 = j;
            boolean flag13 = false;
            if (k2 == 2)
            {
                flag13 = false;
                if (!flag10)
                {
                    HardwareLayer hardwarelayer = getHardwareLayer();
                    if (hardwarelayer != null && hardwarelayer.isValid())
                    {
                        mLayerPaint.setAlpha((int)(255F * f));
                        ((HardwareCanvas)canvas).drawHardwareLayer(hardwarelayer, 0.0F, 0.0F, mLayerPaint);
                        flag13 = true;
                    } else
                    {
                        int l2;
                        if (flag9)
                            l2 = 0;
                        else
                            l2 = k;
                        int i3;
                        if (flag9)
                            i3 = 0;
                        else
                            i3 = i1;
                        canvas.saveLayer(l2, i3, (l2 + mRight) - mLeft, (i3 + mBottom) - mTop, mLayerPaint, 20);
                        flag13 = false;
                    }
                }
            }
            if (!flag13)
                if (!flag9)
                {
                    if ((0x80 & mPrivateFlags) == 128)
                    {
                        mPrivateFlags = 0xff9fffff & mPrivateFlags;
                        dispatchDraw(canvas);
                    } else
                    {
                        draw(canvas);
                    }
                } else
                {
                    mPrivateFlags = 0xff9fffff & mPrivateFlags;
                    ((HardwareCanvas)canvas).drawDisplayList(displaylist, null, i);
                }
        } else
        if (bitmap != null)
        {
            mPrivateFlags = 0xff9fffff & mPrivateFlags;
            Paint paint;
            if (j == 0)
            {
                paint = viewgroup.mCachePaint;
                if (paint == null)
                {
                    paint = new Paint();
                    paint.setDither(false);
                    viewgroup.mCachePaint = paint;
                }
                if (f < 1.0F)
                {
                    int j2 = (int)(255F * f);
                    paint.setAlpha(j2);
                    viewgroup.mGroupFlags = 0x1000 | viewgroup.mGroupFlags;
                } else
                if ((i & 0x1000) != 0)
                {
                    paint.setAlpha(255);
                    viewgroup.mGroupFlags = 0xffffefff & viewgroup.mGroupFlags;
                }
            } else
            {
                paint = mLayerPaint;
                int i2 = (int)(255F * f);
                paint.setAlpha(i2);
            }
            canvas.drawBitmap(bitmap, 0.0F, 0.0F, paint);
        }
        if (j1 >= 0)
            canvas.restoreToCount(j1);
        if (animation != null && !flag6)
        {
            if (!flag2 && !animation.getFillAfter())
                onSetAlpha(255);
            viewgroup.finishAnimatingView(this, animation);
        }
        if (flag6 && flag2)
        {
            viewgroup.invalidate(true);
            if (animation.hasAlpha() && (0x40000 & mPrivateFlags) == 0x40000)
                invalidate(true);
        }
        mRecreateDisplayList = false;
        return flag6;
    }

    protected void drawableStateChanged()
    {
        Drawable drawable = mBackground;
        if (drawable != null && drawable.isStateful())
            drawable.setState(getDrawableState());
    }

    void ensureInputFocusOnFirstFocusable()
    {
        View view = getRootView();
        if (view != null)
            view.requestFocus();
    }

    void ensureTransformationInfo()
    {
        if (mTransformationInfo == null)
            mTransformationInfo = new TransformationInfo();
    }

    public View findFocus()
    {
        if ((2 & mPrivateFlags) != 0)
            return this;
        else
            return null;
    }

    View findUserSetNextFocus(View view, int i)
    {
        switch (i)
        {
        default:
            break;

        case 1: // '\001'
            if (mID != -1)
                return view.findViewByPredicateInsideOut(this, new Predicate() {

                    final View this$0;
                    final int val$id;

                    public boolean apply(View view1)
                    {
                        return view1.mNextFocusForwardId == id;
                    }

                    public volatile boolean apply(Object obj)
                    {
                        return apply((View)obj);
                    }

            
            {
                this$0 = View.this;
                id = i;
                super();
            }
                }
);
            break;

        case 2: // '\002'
            if (mNextFocusForwardId != -1)
                return findViewInsideOutShouldExist(view, mNextFocusForwardId);
            break;

        case 130: 
            if (mNextFocusDownId != -1)
                return findViewInsideOutShouldExist(view, mNextFocusDownId);
            break;

        case 33: // '!'
            if (mNextFocusUpId != -1)
                return findViewInsideOutShouldExist(view, mNextFocusUpId);
            break;

        case 66: // 'B'
            if (mNextFocusRightId != -1)
                return findViewInsideOutShouldExist(view, mNextFocusRightId);
            break;

        case 17: // '\021'
            if (mNextFocusLeftId != -1)
                return findViewInsideOutShouldExist(view, mNextFocusLeftId);
            break;
        }
        return null;
    }

    final View findViewByAccessibilityId(int i)
    {
        if (i < 0)
            return null;
        else
            return findViewByAccessibilityIdTraversal(i);
    }

    View findViewByAccessibilityIdTraversal(int i)
    {
        if (getAccessibilityViewId() == i)
            return this;
        else
            return null;
    }

    public final View findViewById(int i)
    {
        if (i < 0)
            return null;
        else
            return findViewTraversal(i);
    }

    public final View findViewByPredicate(Predicate predicate)
    {
        return findViewByPredicateTraversal(predicate, null);
    }

    public final View findViewByPredicateInsideOut(View view, Predicate predicate)
    {
        View view1 = null;
        do
        {
            View view2 = view.findViewByPredicateTraversal(predicate, view1);
            if (view2 == null && view != this)
            {
                ViewParent viewparent = view.getParent();
                if (viewparent != null && (viewparent instanceof View))
                {
                    view1 = view;
                    view = (View)viewparent;
                } else
                {
                    return null;
                }
            } else
            {
                return view2;
            }
        } while (true);
    }

    protected View findViewByPredicateTraversal(Predicate predicate, View view)
    {
        if (predicate.apply(this))
            return this;
        else
            return null;
    }

    protected View findViewTraversal(int i)
    {
        if (i == mID)
            return this;
        else
            return null;
    }

    public final View findViewWithTag(Object obj)
    {
        if (obj == null)
            return null;
        else
            return findViewWithTagTraversal(obj);
    }

    protected View findViewWithTagTraversal(Object obj)
    {
        if (obj != null && obj.equals(mTag))
            return this;
        else
            return null;
    }

    public void findViewsWithText(ArrayList arraylist, CharSequence charsequence, int i)
    {
        if (getAccessibilityNodeProvider() != null)
        {
            if ((i & 4) != 0)
                arraylist.add(this);
        } else
        if ((i & 2) != 0 && charsequence != null && charsequence.length() > 0 && mContentDescription != null && mContentDescription.length() > 0)
        {
            String s = charsequence.toString().toLowerCase();
            if (mContentDescription.toString().toLowerCase().contains(s))
            {
                arraylist.add(this);
                return;
            }
        }
    }

    protected boolean fitSystemWindows(Rect rect)
    {
        int i = 2 & mViewFlags;
        boolean flag = false;
        if (i == 2)
        {
            mUserPaddingStart = 0x80000000;
            mUserPaddingEnd = 0x80000000;
            if ((0x800 & mViewFlags) != 0 && mAttachInfo != null && (0x600 & mAttachInfo.mSystemUiVisibility) != 0)
            {
                internalSetPadding(0, 0, 0, 0);
                return false;
            }
            internalSetPadding(rect.left, rect.top, rect.right, rect.bottom);
            flag = true;
        }
        return flag;
    }

    public boolean fitsSystemWindows()
    {
        return getFitsSystemWindows();
    }

    public View focusSearch(int i)
    {
        if (mParent != null)
            return mParent.focusSearch(this, i);
        else
            return null;
    }

    public void forceLayout()
    {
        mPrivateFlags = 0x1000 | mPrivateFlags;
        mPrivateFlags = 0x80000000 | mPrivateFlags;
    }

    public boolean gatherTransparentRegion(Region region)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (region != null && attachinfo != null)
        {
            int i = mPrivateFlags;
            if ((i & 0x80) == 0)
            {
                int ai[] = attachinfo.mTransparentLocation;
                getLocationInWindow(ai);
                region.op(ai[0], ai[1], (ai[0] + mRight) - mLeft, (ai[1] + mBottom) - mTop, android.graphics.Region.Op.DIFFERENCE);
            } else
            if ((i & 0x100) != 0 && mBackground != null)
            {
                applyDrawableToTransparentRegion(mBackground, region);
                return true;
            }
        }
        return true;
    }

    public int getAccessibilityCursorPosition()
    {
        return mAccessibilityCursorPosition;
    }

    public AccessibilityDelegate getAccessibilityDelegate()
    {
        return mAccessibilityDelegate;
    }

    public AccessibilityNodeProvider getAccessibilityNodeProvider()
    {
        if (mAccessibilityDelegate != null)
            return mAccessibilityDelegate.getAccessibilityNodeProvider(this);
        else
            return null;
    }

    public int getAccessibilityViewId()
    {
        if (mAccessibilityViewId == -1)
        {
            int i = sNextAccessibilityViewId;
            sNextAccessibilityViewId = i + 1;
            mAccessibilityViewId = i;
        }
        return mAccessibilityViewId;
    }

    public int getAccessibilityWindowId()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mAccessibilityWindowId;
        else
            return -1;
    }

    public float getAlpha()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mAlpha;
        else
            return 1.0F;
    }

    public Animation getAnimation()
    {
        return mCurrentAnimation;
    }

    public IBinder getApplicationWindowToken()
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            IBinder ibinder = attachinfo.mPanelParentWindowToken;
            if (ibinder == null)
                ibinder = attachinfo.mWindowToken;
            return ibinder;
        } else
        {
            return null;
        }
    }

    public Drawable getBackground()
    {
        return mBackground;
    }

    public int getBaseline()
    {
        return -1;
    }

    public final int getBottom()
    {
        return mBottom;
    }

    protected float getBottomFadingEdgeStrength()
    {
        return computeVerticalScrollOffset() + computeVerticalScrollExtent() >= computeVerticalScrollRange() ? 0.0F : 1.0F;
    }

    protected int getBottomPaddingOffset()
    {
        return 0;
    }

    void getBoundsOnScreen(Rect rect)
    {
        if (mAttachInfo == null)
            return;
        RectF rectf = mAttachInfo.mTmpTransformRect;
        rectf.set(0.0F, 0.0F, mRight - mLeft, mBottom - mTop);
        if (!hasIdentityMatrix())
            getMatrix().mapRect(rectf);
        rectf.offset(mLeft, mTop);
        ViewParent viewparent;
        View view;
        for (viewparent = mParent; viewparent instanceof View; viewparent = view.mParent)
        {
            view = (View)viewparent;
            rectf.offset(-view.mScrollX, -view.mScrollY);
            if (!view.hasIdentityMatrix())
                view.getMatrix().mapRect(rectf);
            rectf.offset(view.mLeft, view.mTop);
        }

        if (viewparent instanceof ViewRootImpl)
            rectf.offset(0.0F, -((ViewRootImpl)viewparent).mCurScrollY);
        rectf.offset(mAttachInfo.mWindowLeft, mAttachInfo.mWindowTop);
        rect.set((int)(0.5F + rectf.left), (int)(0.5F + rectf.top), (int)(0.5F + rectf.right), (int)(0.5F + rectf.bottom));
    }

    public float getCameraDistance()
    {
        ensureTransformationInfo();
        float f = mResources.getDisplayMetrics().densityDpi;
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mCamera == null)
        {
            transformationinfo.mCamera = new Camera();
            transformationinfo.matrix3D = new Matrix();
        }
        return -(f * transformationinfo.mCamera.getLocationZ());
    }

    public CharSequence getContentDescription()
    {
        return mContentDescription;
    }

    public final Context getContext()
    {
        return mContext;
    }

    protected ContextMenu.ContextMenuInfo getContextMenuInfo()
    {
        return null;
    }

    public Display getDisplay()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mDisplay;
        else
            return null;
    }

    public DisplayList getDisplayList()
    {
        mDisplayList = getDisplayList(mDisplayList, false);
        return mDisplayList;
    }

    public final int[] getDrawableState()
    {
        if (mDrawableState != null && (0x400 & mPrivateFlags) == 0)
        {
            return mDrawableState;
        } else
        {
            mDrawableState = onCreateDrawableState(0);
            mPrivateFlags = 0xfffffbff & mPrivateFlags;
            return mDrawableState;
        }
    }

    public Bitmap getDrawingCache()
    {
        return getDrawingCache(false);
    }

    public Bitmap getDrawingCache(boolean flag)
    {
        if ((0x20000 & mViewFlags) == 0x20000)
            return null;
        if ((0x8000 & mViewFlags) == 32768)
            buildDrawingCache(flag);
        if (flag)
            return mDrawingCache;
        else
            return mUnscaledDrawingCache;
    }

    public int getDrawingCacheBackgroundColor()
    {
        return mDrawingCacheBackgroundColor;
    }

    public int getDrawingCacheQuality()
    {
        return 0x180000 & mViewFlags;
    }

    public void getDrawingRect(Rect rect)
    {
        rect.left = mScrollX;
        rect.top = mScrollY;
        rect.right = mScrollX + (mRight - mLeft);
        rect.bottom = mScrollY + (mBottom - mTop);
    }

    public long getDrawingTime()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mDrawingTime;
        else
            return 0L;
    }

    protected int getFadeHeight(boolean flag)
    {
        int i = mPaddingTop;
        if (flag)
            i += getTopPaddingOffset();
        return mBottom - mTop - mPaddingBottom - i;
    }

    protected int getFadeTop(boolean flag)
    {
        int i = mPaddingTop;
        if (flag)
            i += getTopPaddingOffset();
        return i;
    }

    public boolean getFilterTouchesWhenObscured()
    {
        return (0x400 & mViewFlags) != 0;
    }

    public boolean getFitsSystemWindows()
    {
        return (2 & mViewFlags) == 2;
    }

    public ArrayList getFocusables(int i)
    {
        ArrayList arraylist = new ArrayList(24);
        addFocusables(arraylist, i);
        return arraylist;
    }

    public void getFocusedRect(Rect rect)
    {
        getDrawingRect(rect);
    }

    public final boolean getGlobalVisibleRect(Rect rect)
    {
        return getGlobalVisibleRect(rect, null);
    }

    public boolean getGlobalVisibleRect(Rect rect, Point point)
    {
        boolean flag;
label0:
        {
            int i = mRight - mLeft;
            int j = mBottom - mTop;
            flag = false;
            if (i <= 0)
                break label0;
            flag = false;
            if (j <= 0)
                break label0;
            rect.set(0, 0, i, j);
            if (point != null)
                point.set(-mScrollX, -mScrollY);
            if (mParent != null)
            {
                boolean flag1 = mParent.getChildVisibleRect(this, rect, point);
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    public Handler getHandler()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mHandler;
        else
            return null;
    }

    HardwareLayer getHardwareLayer()
    {
label0:
        {
            if (mAttachInfo == null || mAttachInfo.mHardwareRenderer == null || !mAttachInfo.mHardwareRenderer.isEnabled() || !mAttachInfo.mHardwareRenderer.validate())
                break label0;
            int i = mRight - mLeft;
            int j = mBottom - mTop;
            if (i == 0 || j == 0)
                break label0;
            if ((0x8000 & mPrivateFlags) == 0 || mHardwareLayer == null)
            {
                if (mHardwareLayer == null)
                {
                    mHardwareLayer = mAttachInfo.mHardwareRenderer.createHardwareLayer(i, j, isOpaque());
                    mLocalDirtyRect.set(0, 0, i, j);
                } else
                {
                    if ((mHardwareLayer.getWidth() != i || mHardwareLayer.getHeight() != j) && mHardwareLayer.resize(i, j))
                        mLocalDirtyRect.set(0, 0, i, j);
                    computeOpaqueFlags();
                    boolean flag = isOpaque();
                    if (mHardwareLayer.isValid() && mHardwareLayer.isOpaque() != flag)
                    {
                        mHardwareLayer.setOpaque(flag);
                        mLocalDirtyRect.set(0, 0, i, j);
                    }
                }
                if (!mHardwareLayer.isValid())
                    break label0;
                mHardwareLayer.setLayerPaint(mLayerPaint);
                mHardwareLayer.redrawLater(getHardwareLayerDisplayList(mHardwareLayer), mLocalDirtyRect);
                ViewRootImpl viewrootimpl = getViewRootImpl();
                if (viewrootimpl != null)
                    viewrootimpl.pushHardwareLayerUpdate(mHardwareLayer);
                mLocalDirtyRect.setEmpty();
            }
            return mHardwareLayer;
        }
        return null;
    }

    public HardwareRenderer getHardwareRenderer()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mHardwareRenderer;
        else
            return null;
    }

    public final int getHeight()
    {
        return mBottom - mTop;
    }

    public void getHitRect(Rect rect)
    {
        updateMatrix();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo != null && !transformationinfo.mMatrixIsIdentity && mAttachInfo != null)
        {
            RectF rectf = mAttachInfo.mTmpTransformRect;
            rectf.set(-transformationinfo.mPivotX, -transformationinfo.mPivotY, (float)getWidth() - transformationinfo.mPivotX, (float)getHeight() - transformationinfo.mPivotY);
            transformationinfo.mMatrix.mapRect(rectf);
            rect.set((int)rectf.left + mLeft, (int)rectf.top + mTop, (int)rectf.right + mLeft, (int)rectf.bottom + mTop);
            return;
        } else
        {
            rect.set(mLeft, mTop, mRight, mBottom);
            return;
        }
    }

    public int getHorizontalFadingEdgeLength()
    {
        if (isHorizontalFadingEdgeEnabled())
        {
            ScrollabilityCache scrollabilitycache = mScrollCache;
            if (scrollabilitycache != null)
                return scrollabilitycache.fadingEdgeLength;
        }
        return 0;
    }

    protected float getHorizontalScrollFactor()
    {
        return getVerticalScrollFactor();
    }

    protected int getHorizontalScrollbarHeight()
    {
        ScrollabilityCache scrollabilitycache = mScrollCache;
        int i = 0;
        if (scrollabilitycache != null)
        {
            ScrollBarDrawable scrollbardrawable = scrollabilitycache.scrollBar;
            i = 0;
            if (scrollbardrawable != null)
            {
                i = scrollbardrawable.getSize(false);
                if (i <= 0)
                    i = scrollabilitycache.scrollBarSize;
            }
        }
        return i;
    }

    public int getId()
    {
        return mID;
    }

    public int getImportantForAccessibility()
    {
        return (0x300000 & mPrivateFlags2) >> 20;
    }

    final Matrix getInverseMatrix()
    {
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo != null)
        {
            updateMatrix();
            if (transformationinfo.mInverseMatrixDirty)
            {
                if (transformationinfo.mInverseMatrix == null)
                    transformationinfo.mInverseMatrix = new Matrix();
                transformationinfo.mMatrix.invert(transformationinfo.mInverseMatrix);
                transformationinfo.mInverseMatrixDirty = false;
            }
            return transformationinfo.mInverseMatrix;
        } else
        {
            return Matrix.IDENTITY_MATRIX;
        }
    }

    public CharSequence getIterableTextForAccessibility()
    {
        return getContentDescription();
    }

    public AccessibilityIterators.TextSegmentIterator getIteratorForGranularity(int i)
    {
        switch (i)
        {
        default:
            break;

        case 8: // '\b'
            CharSequence charsequence2 = getIterableTextForAccessibility();
            if (charsequence2 != null && charsequence2.length() > 0)
            {
                AccessibilityIterators.ParagraphTextSegmentIterator paragraphtextsegmentiterator = AccessibilityIterators.ParagraphTextSegmentIterator.getInstance();
                paragraphtextsegmentiterator.initialize(charsequence2.toString());
                return paragraphtextsegmentiterator;
            }
            break;

        case 2: // '\002'
            CharSequence charsequence1 = getIterableTextForAccessibility();
            if (charsequence1 != null && charsequence1.length() > 0)
            {
                AccessibilityIterators.WordTextSegmentIterator wordtextsegmentiterator = AccessibilityIterators.WordTextSegmentIterator.getInstance(mContext.getResources().getConfiguration().locale);
                wordtextsegmentiterator.initialize(charsequence1.toString());
                return wordtextsegmentiterator;
            }
            break;

        case 1: // '\001'
            CharSequence charsequence = getIterableTextForAccessibility();
            if (charsequence != null && charsequence.length() > 0)
            {
                AccessibilityIterators.CharacterTextSegmentIterator charactertextsegmentiterator = AccessibilityIterators.CharacterTextSegmentIterator.getInstance(mContext.getResources().getConfiguration().locale);
                charactertextsegmentiterator.initialize(charsequence.toString());
                return charactertextsegmentiterator;
            }
            break;
        }
        return null;
    }

    public boolean getKeepScreenOn()
    {
        return (0x4000000 & mViewFlags) != 0;
    }

    public KeyEvent.DispatcherState getKeyDispatcherState()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mKeyDispatchState;
        else
            return null;
    }

    public int getLabelFor()
    {
        return mLabelForId;
    }

    public int getLayerType()
    {
        return mLayerType;
    }

    public int getLayoutDirection()
    {
        if (getContext().getApplicationInfo().targetSdkVersion < 17)
            mPrivateFlags2 = 0x20 | mPrivateFlags2;
        else
        if ((0x10 & mPrivateFlags2) == 16)
            return 1;
        return 0;
    }

    public ViewGroup.LayoutParams getLayoutParams()
    {
        return mLayoutParams;
    }

    public final int getLeft()
    {
        return mLeft;
    }

    protected float getLeftFadingEdgeStrength()
    {
        return computeHorizontalScrollOffset() <= 0 ? 0.0F : 1.0F;
    }

    protected int getLeftPaddingOffset()
    {
        return 0;
    }

    ListenerInfo getListenerInfo()
    {
        if (mListenerInfo != null)
        {
            return mListenerInfo;
        } else
        {
            mListenerInfo = new ListenerInfo();
            return mListenerInfo;
        }
    }

    public final boolean getLocalVisibleRect(Rect rect)
    {
        Point point;
        if (mAttachInfo != null)
            point = mAttachInfo.mPoint;
        else
            point = new Point();
        if (getGlobalVisibleRect(rect, point))
        {
            rect.offset(-point.x, -point.y);
            return true;
        } else
        {
            return false;
        }
    }

    public void getLocationInWindow(int ai[])
    {
        if (ai != null && ai.length >= 2)
        {
            if (mAttachInfo == null)
            {
                ai[1] = 0;
                ai[0] = 0;
                return;
            }
            float af[] = mAttachInfo.mTmpTransformLocation;
            af[1] = 0.0F;
            af[0] = 0.0F;
            if (!hasIdentityMatrix())
                getMatrix().mapPoints(af);
            af[0] = af[0] + (float)mLeft;
            af[1] = af[1] + (float)mTop;
            ViewParent viewparent;
            View view;
            for (viewparent = mParent; viewparent instanceof View; viewparent = view.mParent)
            {
                view = (View)viewparent;
                af[0] = af[0] - (float)view.mScrollX;
                af[1] = af[1] - (float)view.mScrollY;
                if (!view.hasIdentityMatrix())
                    view.getMatrix().mapPoints(af);
                af[0] = af[0] + (float)view.mLeft;
                af[1] = af[1] + (float)view.mTop;
            }

            if (viewparent instanceof ViewRootImpl)
            {
                ViewRootImpl viewrootimpl = (ViewRootImpl)viewparent;
                af[1] = af[1] - (float)viewrootimpl.mCurScrollY;
            }
            ai[0] = (int)(0.5F + af[0]);
            ai[1] = (int)(0.5F + af[1]);
            return;
        } else
        {
            throw new IllegalArgumentException("location must be an array of two integers");
        }
    }

    public void getLocationOnScreen(int ai[])
    {
        getLocationInWindow(ai);
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            ai[0] = ai[0] + attachinfo.mWindowLeft;
            ai[1] = ai[1] + attachinfo.mWindowTop;
        }
    }

    public Matrix getMatrix()
    {
        if (mTransformationInfo != null)
        {
            updateMatrix();
            return mTransformationInfo.mMatrix;
        } else
        {
            return Matrix.IDENTITY_MATRIX;
        }
    }

    public final int getMeasuredHeight()
    {
        return 0xffffff & mMeasuredHeight;
    }

    public final int getMeasuredHeightAndState()
    {
        return mMeasuredHeight;
    }

    public final int getMeasuredState()
    {
        return 0xff000000 & mMeasuredWidth | 0xffffff00 & mMeasuredHeight >> 16;
    }

    public final int getMeasuredWidth()
    {
        return 0xffffff & mMeasuredWidth;
    }

    public final int getMeasuredWidthAndState()
    {
        return mMeasuredWidth;
    }

    public int getMinimumHeight()
    {
        return mMinHeight;
    }

    public int getMinimumWidth()
    {
        return mMinWidth;
    }

    public int getNextFocusDownId()
    {
        return mNextFocusDownId;
    }

    public int getNextFocusForwardId()
    {
        return mNextFocusForwardId;
    }

    public int getNextFocusLeftId()
    {
        return mNextFocusLeftId;
    }

    public int getNextFocusRightId()
    {
        return mNextFocusRightId;
    }

    public int getNextFocusUpId()
    {
        return mNextFocusUpId;
    }

    public OnFocusChangeListener getOnFocusChangeListener()
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null)
            return listenerinfo.mOnFocusChangeListener;
        else
            return null;
    }

    public Insets getOpticalInsets()
    {
        if (mLayoutInsets == null)
        {
            Insets insets;
            if (mBackground == null)
                insets = Insets.NONE;
            else
                insets = mBackground.getLayoutInsets();
            mLayoutInsets = insets;
        }
        return mLayoutInsets;
    }

    public int getOverScrollMode()
    {
        return mOverScrollMode;
    }

    public int getPaddingBottom()
    {
        return mPaddingBottom;
    }

    public int getPaddingEnd()
    {
        if (!isPaddingResolved())
            resolvePadding();
        if (getLayoutDirection() == 1)
            return mPaddingLeft;
        else
            return mPaddingRight;
    }

    public int getPaddingLeft()
    {
        if (!isPaddingResolved())
            resolvePadding();
        return mPaddingLeft;
    }

    public int getPaddingRight()
    {
        if (!isPaddingResolved())
            resolvePadding();
        return mPaddingRight;
    }

    public int getPaddingStart()
    {
        if (!isPaddingResolved())
            resolvePadding();
        if (getLayoutDirection() == 1)
            return mPaddingRight;
        else
            return mPaddingLeft;
    }

    public int getPaddingTop()
    {
        return mPaddingTop;
    }

    public final ViewParent getParent()
    {
        return mParent;
    }

    public ViewParent getParentForAccessibility()
    {
        if (mParent instanceof View)
        {
            if (((View)mParent).includeForAccessibility())
                return mParent;
            else
                return mParent.getParentForAccessibility();
        } else
        {
            return null;
        }
    }

    public float getPivotX()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mPivotX;
        else
            return 0.0F;
    }

    public float getPivotY()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mPivotY;
        else
            return 0.0F;
    }

    public int getRawLayoutDirection()
    {
        return (0xc & mPrivateFlags2) >> 2;
    }

    public int getRawTextAlignment()
    {
        return (0xe000 & mPrivateFlags2) >> 13;
    }

    public int getRawTextDirection()
    {
        return (0x1c0 & mPrivateFlags2) >> 6;
    }

    public Resources getResources()
    {
        return mResources;
    }

    public final int getRight()
    {
        return mRight;
    }

    protected float getRightFadingEdgeStrength()
    {
        return computeHorizontalScrollOffset() + computeHorizontalScrollExtent() >= computeHorizontalScrollRange() ? 0.0F : 1.0F;
    }

    protected int getRightPaddingOffset()
    {
        return 0;
    }

    public View getRootView()
    {
        if (mAttachInfo != null)
        {
            View view1 = mAttachInfo.mRootView;
            if (view1 != null)
                return view1;
        }
        View view;
        for (view = this; view.mParent != null && (view.mParent instanceof View); view = (View)view.mParent);
        return view;
    }

    public float getRotation()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mRotation;
        else
            return 0.0F;
    }

    public float getRotationX()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mRotationX;
        else
            return 0.0F;
    }

    public float getRotationY()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mRotationY;
        else
            return 0.0F;
    }

    public float getScaleX()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mScaleX;
        else
            return 1.0F;
    }

    public float getScaleY()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mScaleY;
        else
            return 1.0F;
    }

    public int getScrollBarDefaultDelayBeforeFade()
    {
        if (mScrollCache == null)
            return ViewConfiguration.getScrollDefaultDelay();
        else
            return mScrollCache.scrollBarDefaultDelayBeforeFade;
    }

    public int getScrollBarFadeDuration()
    {
        if (mScrollCache == null)
            return ViewConfiguration.getScrollBarFadeDuration();
        else
            return mScrollCache.scrollBarFadeDuration;
    }

    public int getScrollBarSize()
    {
        if (mScrollCache == null)
            return ViewConfiguration.get(mContext).getScaledScrollBarSize();
        else
            return mScrollCache.scrollBarSize;
    }

    public int getScrollBarStyle()
    {
        return 0x3000000 & mViewFlags;
    }

    public final int getScrollX()
    {
        return mScrollX;
    }

    public final int getScrollY()
    {
        return mScrollY;
    }

    public int getSolidColor()
    {
        return 0;
    }

    protected int getSuggestedMinimumHeight()
    {
        if (mBackground == null)
            return mMinHeight;
        else
            return Math.max(mMinHeight, mBackground.getMinimumHeight());
    }

    protected int getSuggestedMinimumWidth()
    {
        if (mBackground == null)
            return mMinWidth;
        else
            return Math.max(mMinWidth, mBackground.getMinimumWidth());
    }

    public int getSystemUiVisibility()
    {
        return mSystemUiVisibility;
    }

    public Object getTag()
    {
        return mTag;
    }

    public Object getTag(int i)
    {
        if (mKeyedTags != null)
            return mKeyedTags.get(i);
        else
            return null;
    }

    public int getTextAlignment()
    {
        return (0xe0000 & mPrivateFlags2) >> 17;
    }

    public int getTextDirection()
    {
        return (0x1c00 & mPrivateFlags2) >> 10;
    }

    public final int getTop()
    {
        return mTop;
    }

    protected float getTopFadingEdgeStrength()
    {
        return computeVerticalScrollOffset() <= 0 ? 0.0F : 1.0F;
    }

    protected int getTopPaddingOffset()
    {
        return 0;
    }

    public TouchDelegate getTouchDelegate()
    {
        return mTouchDelegate;
    }

    public ArrayList getTouchables()
    {
        ArrayList arraylist = new ArrayList();
        addTouchables(arraylist);
        return arraylist;
    }

    public float getTranslationX()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mTranslationX;
        else
            return 0.0F;
    }

    public float getTranslationY()
    {
        if (mTransformationInfo != null)
            return mTransformationInfo.mTranslationY;
        else
            return 0.0F;
    }

    public int getVerticalFadingEdgeLength()
    {
        if (isVerticalFadingEdgeEnabled())
        {
            ScrollabilityCache scrollabilitycache = mScrollCache;
            if (scrollabilitycache != null)
                return scrollabilitycache.fadingEdgeLength;
        }
        return 0;
    }

    protected float getVerticalScrollFactor()
    {
        if (mVerticalScrollFactor == 0.0F)
        {
            TypedValue typedvalue = new TypedValue();
            if (!mContext.getTheme().resolveAttribute(0x101004d, typedvalue, true))
                throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
            mVerticalScrollFactor = typedvalue.getDimension(mContext.getResources().getDisplayMetrics());
        }
        return mVerticalScrollFactor;
    }

    public int getVerticalScrollbarPosition()
    {
        return mVerticalScrollbarPosition;
    }

    public int getVerticalScrollbarWidth()
    {
        ScrollabilityCache scrollabilitycache = mScrollCache;
        int i = 0;
        if (scrollabilitycache != null)
        {
            ScrollBarDrawable scrollbardrawable = scrollabilitycache.scrollBar;
            i = 0;
            if (scrollbardrawable != null)
            {
                i = scrollbardrawable.getSize(true);
                if (i <= 0)
                    i = scrollabilitycache.scrollBarSize;
            }
        }
        return i;
    }

    public ViewRootImpl getViewRootImpl()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mViewRootImpl;
        else
            return null;
    }

    public ViewTreeObserver getViewTreeObserver()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mTreeObserver;
        if (mFloatingTreeObserver == null)
            mFloatingTreeObserver = new ViewTreeObserver();
        return mFloatingTreeObserver;
    }

    public int getVisibility()
    {
        return 0xc & mViewFlags;
    }

    public final int getWidth()
    {
        return mRight - mLeft;
    }

    protected int getWindowAttachCount()
    {
        return mWindowAttachCount;
    }

    IWindowSession getWindowSession()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mSession;
        else
            return null;
    }

    public int getWindowSystemUiVisibility()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mSystemUiVisibility;
        else
            return 0;
    }

    public IBinder getWindowToken()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mWindowToken;
        else
            return null;
    }

    public int getWindowVisibility()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mWindowVisibility;
        else
            return 8;
    }

    public void getWindowVisibleDisplayFrame(Rect rect)
    {
        if (mAttachInfo != null)
        {
            Rect rect1;
            try
            {
                mAttachInfo.mSession.getDisplayFrame(mAttachInfo.mWindow, rect);
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
            rect1 = mAttachInfo.mVisibleInsets;
            rect.left = rect.left + rect1.left;
            rect.top = rect.top + rect1.top;
            rect.right = rect.right - rect1.right;
            rect.bottom = rect.bottom - rect1.bottom;
            return;
        } else
        {
            DisplayManagerGlobal.getInstance().getRealDisplay(0).getRectSize(rect);
            return;
        }
    }

    public float getX()
    {
        float f = mLeft;
        float f1;
        if (mTransformationInfo != null)
            f1 = mTransformationInfo.mTranslationX;
        else
            f1 = 0.0F;
        return f1 + f;
    }

    public float getY()
    {
        float f = mTop;
        float f1;
        if (mTransformationInfo != null)
            f1 = mTransformationInfo.mTranslationY;
        else
            f1 = 0.0F;
        return f1 + f;
    }

    public void hackTurnOffWindowResizeAnim(boolean flag)
    {
        mAttachInfo.mTurnOffWindowResizeAnim = flag;
    }

    void handleFocusGainInternal(int i, Rect rect)
    {
        if ((2 & mPrivateFlags) == 0)
        {
            mPrivateFlags = 2 | mPrivateFlags;
            if (mParent != null)
                mParent.requestChildFocus(this, this);
            onFocusChanged(true, i, rect);
            refreshDrawableState();
            if (AccessibilityManager.getInstance(mContext).isEnabled())
                notifyAccessibilityStateChanged();
        }
    }

    public boolean hasFocus()
    {
        return (2 & mPrivateFlags) != 0;
    }

    public boolean hasFocusable()
    {
        return (0xc & mViewFlags) == 0 && isFocusable();
    }

    protected boolean hasHoveredChild()
    {
        return false;
    }

    final boolean hasIdentityMatrix()
    {
        if (mTransformationInfo != null)
        {
            updateMatrix();
            return mTransformationInfo.mMatrixIsIdentity;
        } else
        {
            return true;
        }
    }

    public boolean hasOnClickListeners()
    {
        ListenerInfo listenerinfo = mListenerInfo;
        return listenerinfo != null && listenerinfo.mOnClickListener != null;
    }

    protected boolean hasOpaqueScrollbars()
    {
        return (0x1000000 & mPrivateFlags) == 0x1000000;
    }

    public boolean hasOverlappingRendering()
    {
        return true;
    }

    boolean hasStaticLayer()
    {
        return true;
    }

    public boolean hasTransientState()
    {
        return (0x400000 & mPrivateFlags2) == 0x400000;
    }

    public boolean hasWindowFocus()
    {
        return mAttachInfo != null && mAttachInfo.mHasWindowFocus;
    }

    public boolean includeForAccessibility()
    {
        boolean flag;
label0:
        {
            AttachInfo attachinfo = mAttachInfo;
            flag = false;
            if (attachinfo == null)
                break label0;
            if (!mAttachInfo.mIncludeNotImportantViews)
            {
                boolean flag1 = isImportantForAccessibility();
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    protected void initializeFadingEdge(TypedArray typedarray)
    {
        initScrollCache();
        mScrollCache.fadingEdgeLength = typedarray.getDimensionPixelSize(24, ViewConfiguration.get(mContext).getScaledFadingEdgeLength());
    }

    protected void initializeScrollbars(TypedArray typedarray)
    {
        initScrollCache();
        ScrollabilityCache scrollabilitycache = mScrollCache;
        if (scrollabilitycache.scrollBar == null)
            scrollabilitycache.scrollBar = new ScrollBarDrawable();
        boolean flag = typedarray.getBoolean(44, true);
        if (!flag)
            scrollabilitycache.state = 1;
        scrollabilitycache.fadeScrollBars = flag;
        scrollabilitycache.scrollBarFadeDuration = typedarray.getInt(42, ViewConfiguration.getScrollBarFadeDuration());
        scrollabilitycache.scrollBarDefaultDelayBeforeFade = typedarray.getInt(43, ViewConfiguration.getScrollDefaultDelay());
        scrollabilitycache.scrollBarSize = typedarray.getDimensionPixelSize(0, ViewConfiguration.get(mContext).getScaledScrollBarSize());
        Drawable drawable = typedarray.getDrawable(3);
        scrollabilitycache.scrollBar.setHorizontalTrackDrawable(drawable);
        Drawable drawable1 = typedarray.getDrawable(1);
        if (drawable1 != null)
            scrollabilitycache.scrollBar.setHorizontalThumbDrawable(drawable1);
        if (typedarray.getBoolean(5, false))
            scrollabilitycache.scrollBar.setAlwaysDrawHorizontalTrack(true);
        Drawable drawable2 = typedarray.getDrawable(4);
        scrollabilitycache.scrollBar.setVerticalTrackDrawable(drawable2);
        Drawable drawable3 = typedarray.getDrawable(2);
        if (drawable3 != null)
            scrollabilitycache.scrollBar.setVerticalThumbDrawable(drawable3);
        if (typedarray.getBoolean(6, false))
            scrollabilitycache.scrollBar.setAlwaysDrawVerticalTrack(true);
        int i = getLayoutDirection();
        if (drawable2 != null)
            drawable2.setLayoutDirection(i);
        if (drawable3 != null)
            drawable3.setLayoutDirection(i);
        resolvePadding();
    }

    protected void internalSetPadding(int i, int j, int k, int l)
    {
        mUserPaddingLeft = i;
        mUserPaddingRight = k;
        mUserPaddingBottom = l;
        int i1 = mViewFlags;
        if ((i1 & 0x300) != 0)
        {
            if ((i1 & 0x200) != 0)
            {
                int i2;
                if ((i1 & 0x1000000) == 0)
                    i2 = 0;
                else
                    i2 = getVerticalScrollbarWidth();
                switch (mVerticalScrollbarPosition)
                {
                default:
                    break;

                case 1: // '\001'
                    i += i2;
                    break;

                case 2: // '\002'
                    k += i2;
                    break;

                case 0: // '\0'
                    if (isLayoutRtl())
                        i += i2;
                    else
                        k += i2;
                    break;
                }
            }
            if ((i1 & 0x100) != 0)
            {
                int k1 = i1 & 0x1000000;
                int l1 = 0;
                if (k1 != 0)
                    l1 = getHorizontalScrollbarHeight();
                l += l1;
            }
        }
        int j1 = mPaddingLeft;
        boolean flag = false;
        if (j1 != i)
        {
            flag = true;
            mPaddingLeft = i;
        }
        if (mPaddingTop != j)
        {
            flag = true;
            mPaddingTop = j;
        }
        if (mPaddingRight != k)
        {
            flag = true;
            mPaddingRight = k;
        }
        if (mPaddingBottom != l)
        {
            flag = true;
            mPaddingBottom = l;
        }
        if (flag)
            requestLayout();
    }

    public void invalidate()
    {
        invalidate(true);
    }

    public void invalidate(int i, int j, int k, int l)
    {
        if (!skipInvalidate() && ((0x30 & mPrivateFlags) == 48 || (0x8000 & mPrivateFlags) == 32768 || (0x80000000 & mPrivateFlags) != 0x80000000))
        {
            mPrivateFlags = 0xffff7fff & mPrivateFlags;
            mPrivateFlags = 0x80000000 | mPrivateFlags;
            mPrivateFlags = 0x200000 | mPrivateFlags;
            ViewParent viewparent = mParent;
            AttachInfo attachinfo = mAttachInfo;
            if (viewparent != null && attachinfo != null && i < k && j < l)
            {
                int i1 = mScrollX;
                int j1 = mScrollY;
                Rect rect = attachinfo.mTmpInvalRect;
                rect.set(i - i1, j - j1, k - i1, l - j1);
                viewparent.invalidateChild(this, rect);
                return;
            }
        }
    }

    public void invalidate(Rect rect)
    {
        if (!skipInvalidate() && ((0x30 & mPrivateFlags) == 48 || (0x8000 & mPrivateFlags) == 32768 || (0x80000000 & mPrivateFlags) != 0x80000000))
        {
            mPrivateFlags = 0xffff7fff & mPrivateFlags;
            mPrivateFlags = 0x80000000 | mPrivateFlags;
            mPrivateFlags = 0x200000 | mPrivateFlags;
            ViewParent viewparent = mParent;
            AttachInfo attachinfo = mAttachInfo;
            if (viewparent != null && attachinfo != null)
            {
                int i = mScrollX;
                int j = mScrollY;
                Rect rect1 = attachinfo.mTmpInvalRect;
                rect1.set(rect.left - i, rect.top - j, rect.right - i, rect.bottom - j);
                mParent.invalidateChild(this, rect1);
                return;
            }
        }
    }

    void invalidate(boolean flag)
    {
        if (!skipInvalidate() && ((0x30 & mPrivateFlags) == 48 || flag && (0x8000 & mPrivateFlags) == 32768 || (0x80000000 & mPrivateFlags) != 0x80000000 || isOpaque() != mLastIsOpaque))
        {
            mLastIsOpaque = isOpaque();
            mPrivateFlags = 0xffffffdf & mPrivateFlags;
            mPrivateFlags = 0x200000 | mPrivateFlags;
            if (flag)
            {
                mPrivateFlags = 0x80000000 | mPrivateFlags;
                mPrivateFlags = 0xffff7fff & mPrivateFlags;
            }
            AttachInfo attachinfo = mAttachInfo;
            ViewParent viewparent = mParent;
            if (viewparent != null && attachinfo != null)
            {
                Rect rect = attachinfo.mTmpInvalRect;
                rect.set(0, 0, mRight - mLeft, mBottom - mTop);
                viewparent.invalidateChild(this, rect);
                return;
            }
        }
    }

    public void invalidateDrawable(Drawable drawable)
    {
        if (verifyDrawable(drawable))
        {
            Rect rect = drawable.getBounds();
            int i = mScrollX;
            int j = mScrollY;
            invalidate(i + rect.left, j + rect.top, i + rect.right, j + rect.bottom);
        }
    }

    protected void invalidateParentCaches()
    {
        if (mParent instanceof View)
        {
            View view = (View)mParent;
            view.mPrivateFlags = 0x80000000 | view.mPrivateFlags;
        }
    }

    protected void invalidateParentIfNeeded()
    {
        if (isHardwareAccelerated() && (mParent instanceof View))
            ((View)mParent).invalidate(true);
    }

    void invalidateViewProperty(boolean flag, boolean flag1)
    {
        if (mDisplayList != null && (0x40 & mPrivateFlags) != 64)
        {
            AttachInfo attachinfo = mAttachInfo;
            if (mParent != null && attachinfo != null)
            {
                Rect rect = attachinfo.mTmpInvalRect;
                rect.set(0, 0, mRight - mLeft, mBottom - mTop);
                if (mParent instanceof ViewGroup)
                {
                    ((ViewGroup)mParent).invalidateChildFast(this, rect);
                    return;
                } else
                {
                    mParent.invalidateChild(this, rect);
                    return;
                }
            }
        } else
        {
            if (flag)
                invalidateParentCaches();
            if (flag1)
                mPrivateFlags = 0x20 | mPrivateFlags;
            invalidate(false);
        }
    }

    boolean isAccessibilityFocused()
    {
        return (0x4000000 & mPrivateFlags2) != 0;
    }

    public boolean isActionableForAccessibility()
    {
        return isClickable() || isLongClickable() || isFocusable();
    }

    public boolean isActivated()
    {
        return (0x40000000 & mPrivateFlags) != 0;
    }

    public boolean isClickable()
    {
        return (0x4000 & mViewFlags) == 16384;
    }

    public boolean isDirty()
    {
        return (0x600000 & mPrivateFlags) != 0;
    }

    public boolean isDrawingCacheEnabled()
    {
        return (0x8000 & mViewFlags) == 32768;
    }

    public boolean isDuplicateParentStateEnabled()
    {
        return (0x400000 & mViewFlags) == 0x400000;
    }

    public boolean isEnabled()
    {
        return (0x20 & mViewFlags) == 0;
    }

    public final boolean isFocusable()
    {
        return 1 == (1 & mViewFlags);
    }

    public final boolean isFocusableInTouchMode()
    {
        return 0x40000 == (0x40000 & mViewFlags);
    }

    public boolean isFocused()
    {
        return (2 & mPrivateFlags) != 0;
    }

    public boolean isHapticFeedbackEnabled()
    {
        return 0x10000000 == (0x10000000 & mViewFlags);
    }

    public boolean isHardwareAccelerated()
    {
        return mAttachInfo != null && mAttachInfo.mHardwareAccelerated;
    }

    public boolean isHorizontalFadingEdgeEnabled()
    {
        return (0x1000 & mViewFlags) == 4096;
    }

    public boolean isHorizontalScrollBarEnabled()
    {
        return (0x100 & mViewFlags) == 256;
    }

    public boolean isHovered()
    {
        return (0x10000000 & mPrivateFlags) != 0;
    }

    public boolean isImportantForAccessibility()
    {
        int i;
        boolean flag;
        i = (0x300000 & mPrivateFlags2) >> 20;
        flag = false;
        i;
        JVM INSTR tableswitch 0 2: default 71
    //                   0 40
    //                   1 67
    //                   2 69;
           goto _L1 _L2 _L3 _L4
_L2:
        if (isActionableForAccessibility() || hasListenersForAccessibility()) goto _L6; else goto _L5
_L5:
        AccessibilityNodeProvider accessibilitynodeprovider;
        accessibilitynodeprovider = getAccessibilityNodeProvider();
        flag = false;
        if (accessibilitynodeprovider == null) goto _L4; else goto _L6
_L6:
        return true;
_L3:
        flag = true;
_L4:
        return flag;
_L1:
        throw new IllegalArgumentException((new StringBuilder()).append("Unknow important for accessibility mode: ").append(i).toString());
    }

    public boolean isInEditMode()
    {
        return false;
    }

    public boolean isInScrollingContainer()
    {
        for (ViewParent viewparent = getParent(); viewparent != null && (viewparent instanceof ViewGroup); viewparent = viewparent.getParent())
            if (((ViewGroup)viewparent).shouldDelayChildPressedState())
                return true;

        return false;
    }

    public boolean isInTouchMode()
    {
        if (mAttachInfo != null)
            return mAttachInfo.mInTouchMode;
        else
            return ViewRootImpl.isInTouchMode();
    }

    public boolean isLayoutDirectionInherited()
    {
        return getRawLayoutDirection() == 2;
    }

    public boolean isLayoutRequested()
    {
        return (0x1000 & mPrivateFlags) == 4096;
    }

    public boolean isLayoutRtl()
    {
        return getLayoutDirection() == 1;
    }

    public boolean isLongClickable()
    {
        return (0x200000 & mViewFlags) == 0x200000;
    }

    public boolean isOpaque()
    {
        if ((0x1800000 & mPrivateFlags) == 0x1800000)
        {
            float f;
            if (mTransformationInfo != null)
                f = mTransformationInfo.mAlpha;
            else
                f = 1.0F;
            if (f >= 1.0F)
                return true;
        }
        return false;
    }

    protected boolean isPaddingOffsetRequired()
    {
        return false;
    }

    public boolean isPaddingRelative()
    {
        return mUserPaddingStart != 0x80000000 || mUserPaddingEnd != 0x80000000;
    }

    boolean isPaddingResolved()
    {
        return (0x20000000 & mPrivateFlags2) == 0x20000000;
    }

    public boolean isPressed()
    {
        return (0x4000 & mPrivateFlags) == 16384;
    }

    public boolean isRootNamespace()
    {
        return (8 & mPrivateFlags) != 0;
    }

    public boolean isSaveEnabled()
    {
        return (0x10000 & mViewFlags) != 0x10000;
    }

    public boolean isSaveFromParentEnabled()
    {
        return (0x20000000 & mViewFlags) != 0x20000000;
    }

    public boolean isScrollContainer()
    {
        return (0x100000 & mPrivateFlags) != 0;
    }

    public boolean isScrollbarFadingEnabled()
    {
        return mScrollCache != null && mScrollCache.fadeScrollBars;
    }

    public boolean isSelected()
    {
        return (4 & mPrivateFlags) != 0;
    }

    public boolean isShown()
    {
        View view = this;
        do
        {
            if ((0xc & view.mViewFlags) != 0)
                break;
            ViewParent viewparent = view.mParent;
            if (viewparent == null)
                break;
            if (!(viewparent instanceof View))
                return true;
            view = (View)viewparent;
            if (view == null)
                return false;
        } while (true);
        return false;
    }

    public boolean isSoundEffectsEnabled()
    {
        return 0x8000000 == (0x8000000 & mViewFlags);
    }

    public boolean isTextAlignmentInherited()
    {
        return getRawTextAlignment() == 0;
    }

    public boolean isTextDirectionInherited()
    {
        return getRawTextDirection() == 0;
    }

    public boolean isVerticalFadingEdgeEnabled()
    {
        return (0x2000 & mViewFlags) == 8192;
    }

    public boolean isVerticalScrollBarEnabled()
    {
        return (0x200 & mViewFlags) == 512;
    }

    protected boolean isVerticalScrollBarHidden()
    {
        return false;
    }

    protected boolean isVisibleToUser()
    {
        return isVisibleToUser(null);
    }

    protected boolean isVisibleToUser(Rect rect)
    {
label0:
        {
            if (mAttachInfo == null || mAttachInfo.mWindowVisibility != 0)
                break label0;
            View view;
            for (Object obj = this; obj instanceof View; obj = view.mParent)
            {
                view = (View)obj;
                if (view.getAlpha() <= 0.0F || view.getVisibility() != 0)
                    break label0;
            }

            Rect rect1 = mAttachInfo.mTmpInvalRect;
            Point point = mAttachInfo.mPoint;
            if (getGlobalVisibleRect(rect1, point))
                if (rect != null)
                {
                    rect1.offset(-point.x, -point.y);
                    return rect.intersect(rect1);
                } else
                {
                    return true;
                }
        }
        return false;
    }

    public void jumpDrawablesToCurrentState()
    {
        if (mBackground != null)
            mBackground.jumpToCurrentState();
    }

    public void layout(int i, int j, int k, int l)
    {
        int i1 = mLeft;
        int j1 = mTop;
        int k1 = mBottom;
        int l1 = mRight;
        boolean flag = setFrame(i, j, k, l);
        if (flag || (0x2000 & mPrivateFlags) == 8192)
        {
            long l2 = System.currentTimeMillis();
            onLayout(flag, i, j, k, l);
            long l3 = System.currentTimeMillis();
            if (l3 - l2 > (long)DBG_TIMEOUT_VALUE)
                Xlog.d("View", (new StringBuilder()).append("[ANR Warning]onLayout time too long, this =").append(this).append("time =").append(l3 - l2).toString());
            mPrivateFlags = 0xffffdfff & mPrivateFlags;
            ListenerInfo listenerinfo = mListenerInfo;
            if (listenerinfo != null && listenerinfo.mOnLayoutChangeListeners != null)
            {
                ArrayList arraylist = (ArrayList)listenerinfo.mOnLayoutChangeListeners.clone();
                int i2 = arraylist.size();
                for (int j2 = 0; j2 < i2; j2++)
                    ((OnLayoutChangeListener)arraylist.get(j2)).onLayoutChange(this, i, j, k, l, i1, j1, l1, k1);

            }
        }
        mPrivateFlags = 0xffffefff & mPrivateFlags;
    }

    public void makeOptionalFitsSystemWindows()
    {
        setFlags(2048, 2048);
    }

    public final void measure(int i, int j)
    {
        if ((0x1000 & mPrivateFlags) == 4096 || i != mOldWidthMeasureSpec || j != mOldHeightMeasureSpec)
        {
            mPrivateFlags = 0xfffff7ff & mPrivateFlags;
            resolveRtlPropertiesIfNeeded();
            long l = System.currentTimeMillis();
            onMeasure(i, j);
            long l1 = System.currentTimeMillis();
            if (l1 - l > (long)DBG_TIMEOUT_VALUE)
                Xlog.d("View", (new StringBuilder()).append("[ANR Warning]onMeasure time too long, this =").append(this).append("time =").append(l1 - l).toString());
            if ((0x800 & mPrivateFlags) != 2048)
                throw new IllegalStateException("onMeasure() did not set the measured dimension by calling setMeasuredDimension()");
            mPrivateFlags = 0x2000 | mPrivateFlags;
        }
        mOldWidthMeasureSpec = i;
        mOldHeightMeasureSpec = j;
    }

    void needGlobalAttributesUpdate(boolean flag)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null && !attachinfo.mRecomputeGlobalAttributes && (flag || attachinfo.mKeepScreenOn || attachinfo.mSystemUiVisibility != 0 || attachinfo.mHasSystemUiListeners))
            attachinfo.mRecomputeGlobalAttributes = true;
    }

    public void notifyAccessibilityStateChanged()
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled() && (0x8000000 & mPrivateFlags2) == 0)
        {
            mPrivateFlags2 = 0x8000000 | mPrivateFlags2;
            if (mParent != null)
            {
                mParent.childAccessibilityStateChanged(this);
                return;
            }
        }
    }

    public void offsetLeftAndRight(int i)
    {
        boolean flag;
label0:
        {
            if (i != 0)
            {
                updateMatrix();
                if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                    flag = false;
                else
                    flag = true;
                if (flag)
                {
                    if (mDisplayList != null)
                    {
                        invalidateViewProperty(false, false);
                    } else
                    {
                        ViewParent viewparent = mParent;
                        if (viewparent != null && mAttachInfo != null)
                        {
                            Rect rect = mAttachInfo.mTmpInvalRect;
                            int j;
                            int k;
                            if (i < 0)
                            {
                                j = i + mLeft;
                                k = mRight;
                            } else
                            {
                                j = mLeft;
                                k = i + mRight;
                            }
                            rect.set(0, 0, k - j, mBottom - mTop);
                            viewparent.invalidateChild(this, rect);
                        }
                    }
                } else
                {
                    invalidateViewProperty(false, false);
                }
                mLeft = i + mLeft;
                mRight = i + mRight;
                if (mDisplayList == null)
                    break label0;
                mDisplayList.offsetLeftRight(i);
                invalidateViewProperty(false, false);
            }
            return;
        }
        if (!flag)
            invalidateViewProperty(false, true);
        invalidateParentIfNeeded();
    }

    public void offsetTopAndBottom(int i)
    {
        boolean flag;
label0:
        {
            if (i != 0)
            {
                updateMatrix();
                if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                    flag = false;
                else
                    flag = true;
                if (flag)
                {
                    if (mDisplayList != null)
                    {
                        invalidateViewProperty(false, false);
                    } else
                    {
                        ViewParent viewparent = mParent;
                        if (viewparent != null && mAttachInfo != null)
                        {
                            Rect rect = mAttachInfo.mTmpInvalRect;
                            int j;
                            int k;
                            int l;
                            if (i < 0)
                            {
                                j = i + mTop;
                                k = mBottom;
                                l = i;
                            } else
                            {
                                j = mTop;
                                k = i + mBottom;
                                l = 0;
                            }
                            rect.set(0, l, mRight - mLeft, k - j);
                            viewparent.invalidateChild(this, rect);
                        }
                    }
                } else
                {
                    invalidateViewProperty(false, false);
                }
                mTop = i + mTop;
                mBottom = i + mBottom;
                if (mDisplayList == null)
                    break label0;
                mDisplayList.offsetTopBottom(i);
                invalidateViewProperty(false, false);
            }
            return;
        }
        if (!flag)
            invalidateViewProperty(false, true);
        invalidateParentIfNeeded();
    }

    protected void onAnimationEnd()
    {
        mPrivateFlags = 0xfffeffff & mPrivateFlags;
    }

    protected void onAnimationStart()
    {
        mPrivateFlags = 0x10000 | mPrivateFlags;
    }

    protected void onAttachedToWindow()
    {
        if ((0x200 & mPrivateFlags) != 0)
            mParent.requestTransparentRegion(this);
        if ((0x8000000 & mPrivateFlags) != 0)
        {
            initialAwakenScrollBars();
            mPrivateFlags = 0xf7ffffff & mPrivateFlags;
        }
        jumpDrawablesToCurrentState();
        clearAccessibilityFocus();
        if (isFocused())
            InputMethodManager.peekInstance().focusIn(this);
        if (mAttachInfo != null && mDisplayList != null)
            mAttachInfo.mViewRootImpl.dequeueDisplayList(mDisplayList);
    }

    public boolean onCheckIsTextEditor()
    {
        return false;
    }

    public void onCloseSystemDialogs(String s)
    {
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
    }

    protected void onCreateContextMenu(ContextMenu contextmenu)
    {
    }

    protected int[] onCreateDrawableState(int i)
    {
        int ai[];
        if ((0x400000 & mViewFlags) == 0x400000 && (mParent instanceof View))
        {
            ai = ((View)mParent).onCreateDrawableState(i);
        } else
        {
            int j = mPrivateFlags;
            int k = j & 0x4000;
            int l = 0;
            if (k != 0)
                l = 0 | 0x10;
            if ((0x20 & mViewFlags) == 0)
                l |= 8;
            if (isFocused())
                l |= 4;
            if ((j & 4) != 0)
                l |= 2;
            if (hasWindowFocus())
                l |= 1;
            if ((0x40000000 & j) != 0)
                l |= 0x20;
            if (mAttachInfo != null && mAttachInfo.mHardwareAccelerationRequested && HardwareRenderer.isAvailable())
                l |= 0x40;
            if ((0x10000000 & j) != 0)
                l |= 0x80;
            int i1 = mPrivateFlags2;
            if ((i1 & 1) != 0)
                l |= 0x100;
            if ((i1 & 2) != 0)
                l |= 0x200;
            ai = VIEW_STATE_SETS[l];
            if (i != 0)
            {
                int ai1[];
                if (ai != null)
                {
                    ai1 = new int[i + ai.length];
                    System.arraycopy(ai, 0, ai1, 0, ai.length);
                } else
                {
                    ai1 = new int[i];
                }
                return ai1;
            }
        }
        return ai;
    }

    public InputConnection onCreateInputConnection(EditorInfo editorinfo)
    {
        return null;
    }

    protected void onDetachedFromWindow()
    {
        mPrivateFlags = 0xfbffffff & mPrivateFlags;
        removeUnsetPressCallback();
        removeLongPressCallback();
        removePerformClickCallback();
        removeSendViewScrolledAccessibilityEventCallback();
        destroyDrawingCache();
        destroyLayer(false);
        if (mAttachInfo != null)
        {
            if (mDisplayList != null)
                mAttachInfo.mViewRootImpl.enqueueDisplayList(mDisplayList);
            mAttachInfo.mViewRootImpl.cancelInvalidate(this);
        } else
        {
            clearDisplayList();
        }
        mCurrentAnimation = null;
        resetAccessibilityStateChanged();
    }

    protected void onDisplayHint(int i)
    {
    }

    public boolean onDragEvent(DragEvent dragevent)
    {
        return false;
    }

    protected void onDraw(Canvas canvas)
    {
    }

    protected void onDrawHorizontalScrollBar(Canvas canvas, Drawable drawable, int i, int j, int k, int l)
    {
        drawable.setBounds(i, j, k, l);
        drawable.draw(canvas);
    }

    protected final void onDrawScrollBars(Canvas canvas)
    {
        ScrollabilityCache scrollabilitycache = mScrollCache;
        if (scrollabilitycache != null)
        {
            int i = scrollabilitycache.state;
            if (i != 0)
            {
                boolean flag;
                if (i == 2)
                {
                    if (scrollabilitycache.interpolatorValues == null)
                        scrollabilitycache.interpolatorValues = new float[1];
                    float af[] = scrollabilitycache.interpolatorValues;
                    if (scrollabilitycache.scrollBarInterpolator.timeToValues(af) == android.graphics.Interpolator.Result.FREEZE_END)
                        scrollabilitycache.state = 0;
                    else
                        scrollabilitycache.scrollBar.setAlpha(Math.round(af[0]));
                    flag = true;
                } else
                {
                    scrollabilitycache.scrollBar.setAlpha(255);
                    flag = false;
                }
                int j = mViewFlags;
                boolean flag1;
                if ((j & 0x100) == 256)
                    flag1 = true;
                else
                    flag1 = false;
                boolean flag2;
                if ((j & 0x200) == 512 && !isVerticalScrollBarHidden())
                    flag2 = true;
                else
                    flag2 = false;
                if (flag2 || flag1)
                {
                    int k = mRight - mLeft;
                    int l = mBottom - mTop;
                    ScrollBarDrawable scrollbardrawable = scrollabilitycache.scrollBar;
                    int i1 = mScrollX;
                    int j1 = mScrollY;
                    byte byte0;
                    if ((0x2000000 & j) == 0)
                        byte0 = -1;
                    else
                        byte0 = 0;
                    if (flag1)
                    {
                        int i3 = scrollbardrawable.getSize(false);
                        if (i3 <= 0)
                            i3 = scrollabilitycache.scrollBarSize;
                        scrollbardrawable.setParameters(computeHorizontalScrollRange(), computeHorizontalScrollOffset(), computeHorizontalScrollExtent(), false);
                        int j3;
                        if (flag2)
                            j3 = getVerticalScrollbarWidth();
                        else
                            j3 = 0;
                        int k3 = (j1 + l) - i3 - (byte0 & mUserPaddingBottom);
                        int l3 = i1 + (byte0 & mPaddingLeft);
                        int i4 = (i1 + k) - (byte0 & mUserPaddingRight) - j3;
                        int j4 = k3 + i3;
                        onDrawHorizontalScrollBar(canvas, scrollbardrawable, l3, k3, i4, j4);
                        if (flag)
                            invalidate(l3, k3, i4, j4);
                    }
                    if (flag2)
                    {
                        int k1 = scrollbardrawable.getSize(true);
                        if (k1 <= 0)
                            k1 = scrollabilitycache.scrollBarSize;
                        scrollbardrawable.setParameters(computeVerticalScrollRange(), computeVerticalScrollOffset(), computeVerticalScrollExtent(), true);
                        int l1 = mVerticalScrollbarPosition;
                        if (l1 == 0)
                            if (isLayoutRtl())
                                l1 = 1;
                            else
                                l1 = 2;
                        int i2;
                        switch (l1)
                        {
                        case 1: // '\001'
                            i2 = i1 + (byte0 & mUserPaddingLeft);
                            break;

                        default:
                            i2 = (i1 + k) - k1 - (byte0 & mUserPaddingRight);
                            break;
                        }
                        int j2 = j1 + (byte0 & mPaddingTop);
                        int k2 = i2 + k1;
                        int l2 = (j1 + l) - (byte0 & mUserPaddingBottom);
                        onDrawVerticalScrollBar(canvas, scrollbardrawable, i2, j2, k2, l2);
                        if (flag)
                        {
                            invalidate(i2, j2, k2, l2);
                            return;
                        }
                    }
                }
            }
        }
    }

    protected void onDrawVerticalScrollBar(Canvas canvas, Drawable drawable, int i, int j, int k, int l)
    {
        drawable.setBounds(i, j, k, l);
        drawable.draw(canvas);
    }

    public boolean onFilterTouchEventForSecurity(MotionEvent motionevent)
    {
        return (0x400 & mViewFlags) == 0 || (1 & motionevent.getFlags()) == 0;
    }

    protected void onFinishInflate()
    {
    }

    public void onFinishTemporaryDetach()
    {
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        if (flag && AccessibilityManager.getInstance(mContext).isEnabled())
            sendAccessibilityEvent(8);
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (!flag)
        {
            if (isPressed())
                setPressed(false);
            if (inputmethodmanager != null && mAttachInfo != null && mAttachInfo.mHasWindowFocus)
                inputmethodmanager.focusOut(this);
            onFocusLost();
        } else
        if (inputmethodmanager != null && mAttachInfo != null && mAttachInfo.mHasWindowFocus)
            inputmethodmanager.focusIn(this);
        invalidate(true);
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnFocusChangeListener != null)
            listenerinfo.mOnFocusChangeListener.onFocusChange(this, flag);
        if (mAttachInfo != null)
            mAttachInfo.mKeyDispatchState.reset(this);
    }

    protected void onFocusLost()
    {
        resetPressedState();
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        return false;
    }

    public void onHoverChanged(boolean flag)
    {
    }

    public boolean onHoverEvent(MotionEvent motionevent)
    {
        int i = motionevent.getActionMasked();
        if (!mSendingHoverAccessibilityEvents)
        {
            if ((i == 9 || i == 7) && !hasHoveredChild() && pointInView(motionevent.getX(), motionevent.getY()))
            {
                sendAccessibilityHoverEvent(128);
                mSendingHoverAccessibilityEvents = true;
            }
        } else
        if (i == 10 || i == 2 && !pointInView(motionevent.getX(), motionevent.getY()))
        {
            mSendingHoverAccessibilityEvents = false;
            sendAccessibilityHoverEvent(256);
            if (mAttachInfo != null && !mAttachInfo.mHasWindowFocus)
                getViewRootImpl().setAccessibilityFocus(null, null);
        }
        if (isHoverable())
        {
            switch (i)
            {
            case 10: // '\n'
                setHovered(false);
                break;

            case 9: // '\t'
                setHovered(true);
                break;
            }
            dispatchGenericMotionEventInternal(motionevent);
            return true;
        } else
        {
            return false;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mAccessibilityDelegate != null)
        {
            mAccessibilityDelegate.onInitializeAccessibilityEvent(this, accessibilityevent);
            return;
        } else
        {
            onInitializeAccessibilityEventInternal(accessibilityevent);
            return;
        }
    }

    void onInitializeAccessibilityEventInternal(AccessibilityEvent accessibilityevent)
    {
        accessibilityevent.setSource(this);
        accessibilityevent.setClassName(android/view/View.getName());
        accessibilityevent.setPackageName(getContext().getPackageName());
        accessibilityevent.setEnabled(isEnabled());
        accessibilityevent.setContentDescription(mContentDescription);
        if (accessibilityevent.getEventType() == 8 && mAttachInfo != null)
        {
            ArrayList arraylist = mAttachInfo.mTempArrayList;
            getRootView().addFocusables(arraylist, 2, 0);
            accessibilityevent.setItemCount(arraylist.size());
            accessibilityevent.setCurrentItemIndex(arraylist.indexOf(this));
            arraylist.clear();
        }
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        if (mAccessibilityDelegate != null)
        {
            mAccessibilityDelegate.onInitializeAccessibilityNodeInfo(this, accessibilitynodeinfo);
            return;
        } else
        {
            onInitializeAccessibilityNodeInfoInternal(accessibilitynodeinfo);
            return;
        }
    }

    void onInitializeAccessibilityNodeInfoInternal(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        Rect rect = mAttachInfo.mTmpInvalRect;
        getDrawingRect(rect);
        accessibilitynodeinfo.setBoundsInParent(rect);
        getBoundsOnScreen(rect);
        accessibilitynodeinfo.setBoundsInScreen(rect);
        ViewParent viewparent = getParentForAccessibility();
        if (viewparent instanceof View)
            accessibilitynodeinfo.setParent((View)viewparent);
        if (mID != -1)
        {
            View view2 = getRootView();
            if (view2 == null)
                view2 = this;
            View view3 = view2.findLabelForView(this, mID);
            if (view3 != null)
                accessibilitynodeinfo.setLabeledBy(view3);
        }
        if (mLabelForId != -1)
        {
            View view = getRootView();
            if (view == null)
                view = this;
            View view1 = view.findViewInsideOutShouldExist(this, mLabelForId);
            if (view1 != null)
                accessibilitynodeinfo.setLabelFor(view1);
        }
        accessibilitynodeinfo.setVisibleToUser(isVisibleToUser());
        accessibilitynodeinfo.setPackageName(mContext.getPackageName());
        accessibilitynodeinfo.setClassName(android/view/View.getName());
        accessibilitynodeinfo.setContentDescription(getContentDescription());
        accessibilitynodeinfo.setEnabled(isEnabled());
        accessibilitynodeinfo.setClickable(isClickable());
        accessibilitynodeinfo.setFocusable(isFocusable());
        accessibilitynodeinfo.setFocused(isFocused());
        accessibilitynodeinfo.setAccessibilityFocused(isAccessibilityFocused());
        accessibilitynodeinfo.setSelected(isSelected());
        accessibilitynodeinfo.setLongClickable(isLongClickable());
        accessibilitynodeinfo.addAction(4);
        accessibilitynodeinfo.addAction(8);
        if (isFocusable())
            if (isFocused())
                accessibilitynodeinfo.addAction(2);
            else
                accessibilitynodeinfo.addAction(1);
        if (!isAccessibilityFocused())
            accessibilitynodeinfo.addAction(64);
        else
            accessibilitynodeinfo.addAction(128);
        if (isClickable() && isEnabled())
            accessibilitynodeinfo.addAction(16);
        if (isLongClickable() && isEnabled())
            accessibilitynodeinfo.addAction(32);
        if (mContentDescription != null && mContentDescription.length() > 0)
        {
            accessibilitynodeinfo.addAction(256);
            accessibilitynodeinfo.addAction(512);
            accessibilitynodeinfo.setMovementGranularities(11);
        }
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 23: // '\027'
        case 66: // 'B'
            if ((0x20 & mViewFlags) == 32)
                return true;
            if (((0x4000 & mViewFlags) == 16384 || (0x200000 & mViewFlags) == 0x200000) && keyevent.getRepeatCount() == 0)
            {
                setPressed(true);
                checkForLongClick(0);
                return true;
            }
            break;
        }
        return false;
    }

    public boolean onKeyLongPress(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyMultiple(int i, int j, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyPreIme(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyShortcut(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        boolean flag = false;
        switch (i)
        {
        case 23: // '\027'
        case 66: // 'B'
            if ((0x20 & mViewFlags) == 32)
                return true;
            int j = 0x4000 & mViewFlags;
            flag = false;
            if (j == 16384)
            {
                boolean flag1 = isPressed();
                flag = false;
                if (flag1)
                {
                    setPressed(false);
                    boolean flag2 = mHasPerformedLongPress;
                    flag = false;
                    if (!flag2)
                    {
                        removeLongPressCallback();
                        flag = performClick();
                    }
                }
            }
            break;
        }
        return flag;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
    }

    protected void onMeasure(int i, int j)
    {
        setMeasuredDimension(getDefaultSize(getSuggestedMinimumWidth(), i), getDefaultSize(getSuggestedMinimumHeight(), j));
    }

    protected void onOverScrolled(int i, int j, boolean flag, boolean flag1)
    {
    }

    public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mAccessibilityDelegate != null)
        {
            mAccessibilityDelegate.onPopulateAccessibilityEvent(this, accessibilityevent);
            return;
        } else
        {
            onPopulateAccessibilityEventInternal(accessibilityevent);
            return;
        }
    }

    void onPopulateAccessibilityEventInternal(AccessibilityEvent accessibilityevent)
    {
    }

    public void onResolveDrawables(int i)
    {
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        mPrivateFlags = 0x20000 | mPrivateFlags;
        if (parcelable != BaseSavedState.EMPTY_STATE && parcelable != null)
            throw new IllegalArgumentException((new StringBuilder()).append("Wrong state class, expecting View State but received ").append(parcelable.getClass().toString()).append(" instead. This usually happens ").append("when two views of different type have the same id in the same hierarchy. ").append("This view's id is ").append(ViewDebug.resolveId(mContext, getId())).append(". Make sure ").append("other views do not use the same id.").toString());
        else
            return;
    }

    public void onRtlPropertiesChanged(int i)
    {
    }

    protected Parcelable onSaveInstanceState()
    {
        mPrivateFlags = 0x20000 | mPrivateFlags;
        return BaseSavedState.EMPTY_STATE;
    }

    public void onScreenStateChanged(int i)
    {
    }

    protected void onScrollChanged(int i, int j, int k, int l)
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled())
            postSendViewScrolledAccessibilityEventCallback();
        mBackgroundSizeChanged = true;
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
            attachinfo.mViewScrollChanged = true;
    }

    protected boolean onSetAlpha(int i)
    {
        return false;
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
    }

    public void onStartTemporaryDetach()
    {
        removeUnsetPressCallback();
        mPrivateFlags = 0x4000000 | mPrivateFlags;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag5;
label0:
        {
            int i = mViewFlags;
            if ((i & 0x20) == 32)
            {
                int i1 = motionevent.getAction();
                if (i1 == 1 || i1 == 3)
                    if ((0x4000 & mPrivateFlags) != 0)
                        setPressed(false);
                    else
                    if ((0x2000000 & mPrivateFlags) != 0)
                    {
                        Xlog.d("View", (new StringBuilder()).append("View onTouch event, if view is DISABLED & PFLAG_PREPRESSED, remove callback mPrivateFlags = ").append(mPrivateFlags).append(", this = ").append(this).toString());
                        removeTapCallback();
                    }
                if ((i & 0x4000) != 16384)
                {
                    int j1 = i & 0x200000;
                    flag5 = false;
                    if (j1 != 0x200000)
                        break label0;
                }
                flag5 = true;
                break label0;
            }
            if (mTouchDelegate != null && mTouchDelegate.onTouchEvent(motionevent))
                return true;
            if ((i & 0x4000) != 16384)
            {
                int l = i & 0x200000;
                flag5 = false;
                if (l != 0x200000)
                    break label0;
            }
            switch (motionevent.getAction())
            {
            default:
                break;

            case 2: // '\002'
                int j = (int)motionevent.getX();
                int k = (int)motionevent.getY();
                if (pointInView(j, k, mTouchSlop))
                    break;
                removeTapCallback();
                if ((0x4000 & mPrivateFlags) != 0)
                {
                    removeLongPressCallback();
                    setPressed(false);
                }
                break;

            case 3: // '\003'
                setPressed(false);
                removeTapCallback();
                removeLongPressCallback();
                break;

            case 0: // '\0'
                mHasPerformedLongPress = false;
                if (performButtonActionOnTouchDown(motionevent))
                    break;
                if (isInScrollingContainer())
                {
                    mPrivateFlags = 0x2000000 | mPrivateFlags;
                    if (mPendingCheckForTap == null)
                        mPendingCheckForTap = new CheckForTap();
                    postDelayed(mPendingCheckForTap, ViewConfiguration.getTapTimeout());
                } else
                {
                    setPressed(true);
                    checkForLongClick(0);
                }
                break;

            case 1: // '\001'
                boolean flag;
                if ((0x2000000 & mPrivateFlags) != 0)
                    flag = true;
                else
                    flag = false;
                if ((0x4000 & mPrivateFlags) == 0 && !flag)
                    break;
                boolean flag1 = isFocusable();
                boolean flag2 = false;
                if (flag1)
                {
                    boolean flag3 = isFocusableInTouchMode();
                    flag2 = false;
                    if (flag3)
                    {
                        boolean flag4 = isFocused();
                        flag2 = false;
                        if (!flag4)
                            flag2 = requestFocus();
                    }
                }
                if (flag)
                    setPressed(true);
                if (!mHasPerformedLongPress)
                {
                    removeLongPressCallback();
                    if (!flag2)
                    {
                        if (mPerformClick == null)
                            mPerformClick = new PerformClick();
                        if (!post(mPerformClick))
                            performClick();
                    }
                }
                if (mUnsetPressedState == null)
                    mUnsetPressedState = new UnsetPressedState();
                if (flag)
                    postDelayed(mUnsetPressedState, ViewConfiguration.getPressedStateDuration());
                else
                if (!post(mUnsetPressedState))
                    mUnsetPressedState.run();
                removeTapCallback();
                break;
            }
            return true;
        }
        return flag5;
    }

    public boolean onTrackballEvent(MotionEvent motionevent)
    {
        return false;
    }

    protected void onVisibilityChanged(View view, int i)
    {
label0:
        {
            if (i == 0)
            {
                if (mAttachInfo == null)
                    break label0;
                initialAwakenScrollBars();
            }
            return;
        }
        mPrivateFlags = 0x8000000 | mPrivateFlags;
    }

    public void onWindowFocusChanged(boolean flag)
    {
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (!flag)
        {
            if (isPressed())
                setPressed(false);
            if (inputmethodmanager != null && (2 & mPrivateFlags) != 0)
                inputmethodmanager.focusOut(this);
            removeLongPressCallback();
            removeTapCallback();
            onFocusLost();
        } else
        if (inputmethodmanager != null && (2 & mPrivateFlags) != 0)
            inputmethodmanager.focusIn(this);
        refreshDrawableState();
    }

    public void onWindowSystemUiVisibilityChanged(int i)
    {
    }

    protected void onWindowVisibilityChanged(int i)
    {
        if (i == 0)
            initialAwakenScrollBars();
    }

    public void outputDirtyFlags(String s, boolean flag, int i)
    {
        Log.d("View", (new StringBuilder()).append(s).append(this).append("             DIRTY(").append(0x600000 & mPrivateFlags).append(") DRAWN(").append(0x20 & mPrivateFlags).append(")").append(" CACHE_VALID(").append(0x8000 & mPrivateFlags).append(") INVALIDATED(").append(0x80000000 & mPrivateFlags).append(")").toString());
        if (flag)
            mPrivateFlags = i & mPrivateFlags;
        if (this instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)this;
            int j = viewgroup.getChildCount();
            for (int k = 0; k < j; k++)
                viewgroup.getChildAt(k).outputDirtyFlags((new StringBuilder()).append(s).append("  ").toString(), flag, i);

        }
    }

    protected boolean overScrollBy(int i, int j, int k, int l, int i1, int j1, int k1, 
            int l1, boolean flag)
    {
        int i2 = mOverScrollMode;
        boolean flag1;
        if (computeHorizontalScrollRange() > computeHorizontalScrollExtent())
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (computeVerticalScrollRange() > computeVerticalScrollExtent())
            flag2 = true;
        else
            flag2 = false;
        boolean flag3;
        if (i2 != 0 && (i2 != 1 || !flag1))
            flag3 = false;
        else
            flag3 = true;
        boolean flag4;
        if (i2 != 0 && (i2 != 1 || !flag2))
            flag4 = false;
        else
            flag4 = true;
        int j2 = k + i;
        if (!flag3)
            k1 = 0;
        int k2 = l + j;
        if (!flag4)
            l1 = 0;
        int l2 = -k1;
        int i3 = k1 + i1;
        int j3 = -l1;
        int k3 = l1 + j1;
        boolean flag5;
        if (j2 > i3)
        {
            j2 = i3;
            flag5 = true;
        } else
        {
            flag5 = false;
            if (j2 < l2)
            {
                j2 = l2;
                flag5 = true;
            }
        }
        boolean flag6;
        if (k2 > k3)
        {
            k2 = k3;
            flag6 = true;
        } else
        {
            flag6 = false;
            if (k2 < j3)
            {
                k2 = j3;
                flag6 = true;
            }
        }
        onOverScrolled(j2, k2, flag5, flag6);
        return flag5 || flag6;
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (mAccessibilityDelegate != null)
            return mAccessibilityDelegate.performAccessibilityAction(this, i, bundle);
        else
            return performAccessibilityActionInternal(i, bundle);
    }

    boolean performAccessibilityActionInternal(int i, Bundle bundle)
    {
        boolean flag;
label0:
        {
            flag = true;
            switch (i)
            {
            default:
                break;

            case 512: 
                if (bundle != null)
                    return previousAtGranularity(bundle.getInt("ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT"));
                break;

            case 256: 
                if (bundle != null)
                    return nextAtGranularity(bundle.getInt("ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT"));
                break;

            case 128: 
                if (isAccessibilityFocused())
                {
                    clearAccessibilityFocus();
                    return flag;
                }
                break;

            case 64: // '@'
                if (!isAccessibilityFocused())
                    return requestAccessibilityFocus();
                break;

            case 8: // '\b'
                if (!isSelected())
                    break;
                setSelected(false);
                if (isSelected())
                    return false;
                break label0;

            case 4: // '\004'
                if (!isSelected())
                {
                    setSelected(flag);
                    return isSelected();
                }
                break;

            case 2: // '\002'
                if (!hasFocus())
                    break;
                clearFocus();
                if (isFocused())
                    return false;
                break label0;

            case 1: // '\001'
                if (!hasFocus())
                {
                    getViewRootImpl().ensureTouchMode(false);
                    return requestFocus();
                }
                break;

            case 32: // ' '
                if (isLongClickable())
                {
                    performLongClick();
                    return flag;
                }
                break;

            case 16: // '\020'
                if (isClickable())
                {
                    performClick();
                    return flag;
                }
                break;
            }
            flag = false;
        }
        return flag;
    }

    protected boolean performButtonActionOnTouchDown(MotionEvent motionevent)
    {
        return (2 & motionevent.getButtonState()) != 0 && showContextMenu(motionevent.getX(), motionevent.getY(), motionevent.getMetaState());
    }

    public boolean performClick()
    {
        sendAccessibilityEvent(1);
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnClickListener != null)
        {
            playSoundEffect(0);
            listenerinfo.mOnClickListener.onClick(this);
            return true;
        } else
        {
            return false;
        }
    }

    void performCollectViewAttributes(AttachInfo attachinfo, int i)
    {
        if ((i & 0xc) == 0)
        {
            if ((0x4000000 & mViewFlags) == 0x4000000)
                attachinfo.mKeepScreenOn = true;
            attachinfo.mSystemUiVisibility = attachinfo.mSystemUiVisibility | mSystemUiVisibility;
            ListenerInfo listenerinfo = mListenerInfo;
            if (listenerinfo != null && listenerinfo.mOnSystemUiVisibilityChangeListener != null)
                attachinfo.mHasSystemUiListeners = true;
        }
    }

    public boolean performHapticFeedback(int i)
    {
        return performHapticFeedback(i, 0);
    }

    public boolean performHapticFeedback(int i, int j)
    {
        if (mAttachInfo != null && ((j & 1) != 0 || isHapticFeedbackEnabled()))
        {
            AttachInfo.Callbacks callbacks = mAttachInfo.mRootCallbacks;
            int k = j & 2;
            boolean flag = false;
            if (k != 0)
                flag = true;
            return callbacks.performHapticFeedback(i, flag);
        } else
        {
            return false;
        }
    }

    public boolean performLongClick()
    {
        sendAccessibilityEvent(2);
        ListenerInfo listenerinfo = mListenerInfo;
        boolean flag = false;
        if (listenerinfo != null)
        {
            OnLongClickListener onlongclicklistener = listenerinfo.mOnLongClickListener;
            flag = false;
            if (onlongclicklistener != null)
                flag = listenerinfo.mOnLongClickListener.onLongClick(this);
        }
        if (!flag)
            flag = showContextMenu();
        if (flag)
            performHapticFeedback(0);
        return flag;
    }

    public void playSoundEffect(int i)
    {
        if (mAttachInfo != null && mAttachInfo.mRootCallbacks != null && isSoundEffectsEnabled())
        {
            mAttachInfo.mRootCallbacks.playSoundEffect(i);
            return;
        } else
        {
            return;
        }
    }

    final boolean pointInView(float f, float f1)
    {
        return f >= 0.0F && f < (float)(mRight - mLeft) && f1 >= 0.0F && f1 < (float)(mBottom - mTop);
    }

    public boolean post(Runnable runnable)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            return attachinfo.mHandler.post(runnable);
        } else
        {
            ViewRootImpl.getRunQueue().post(runnable);
            return true;
        }
    }

    public boolean postDelayed(Runnable runnable, long l)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            return attachinfo.mHandler.postDelayed(runnable, l);
        } else
        {
            ViewRootImpl.getRunQueue().postDelayed(runnable, l);
            return true;
        }
    }

    public void postInvalidate()
    {
        postInvalidateDelayed(0L);
    }

    public void postInvalidate(int i, int j, int k, int l)
    {
        postInvalidateDelayed(0L, i, j, k, l);
    }

    public void postInvalidateDelayed(long l)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
            attachinfo.mViewRootImpl.dispatchInvalidateDelayed(this, l);
    }

    public void postInvalidateDelayed(long l, int i, int j, int k, int i1)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            AttachInfo.InvalidateInfo invalidateinfo = AttachInfo.InvalidateInfo.acquire();
            invalidateinfo.target = this;
            invalidateinfo.left = i;
            invalidateinfo.top = j;
            invalidateinfo.right = k;
            invalidateinfo.bottom = i1;
            attachinfo.mViewRootImpl.dispatchInvalidateRectDelayed(invalidateinfo, l);
        }
    }

    public void postInvalidateOnAnimation()
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
            attachinfo.mViewRootImpl.dispatchInvalidateOnAnimation(this);
    }

    public void postInvalidateOnAnimation(int i, int j, int k, int l)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            AttachInfo.InvalidateInfo invalidateinfo = AttachInfo.InvalidateInfo.acquire();
            invalidateinfo.target = this;
            invalidateinfo.left = i;
            invalidateinfo.top = j;
            invalidateinfo.right = k;
            invalidateinfo.bottom = l;
            attachinfo.mViewRootImpl.dispatchInvalidateRectOnAnimation(invalidateinfo);
        }
    }

    public void postOnAnimation(Runnable runnable)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            attachinfo.mViewRootImpl.mChoreographer.postCallback(1, runnable, null);
            return;
        } else
        {
            ViewRootImpl.getRunQueue().post(runnable);
            return;
        }
    }

    public void postOnAnimationDelayed(Runnable runnable, long l)
    {
        AttachInfo attachinfo = mAttachInfo;
        if (attachinfo != null)
        {
            attachinfo.mViewRootImpl.mChoreographer.postCallbackDelayed(1, runnable, null, l);
            return;
        } else
        {
            ViewRootImpl.getRunQueue().postDelayed(runnable, l);
            return;
        }
    }

    protected void recomputePadding()
    {
        internalSetPadding(mUserPaddingLeft, mPaddingTop, mUserPaddingRight, mUserPaddingBottom);
    }

    public void refreshDrawableState()
    {
        mPrivateFlags = 0x400 | mPrivateFlags;
        drawableStateChanged();
        ViewParent viewparent = mParent;
        if (viewparent != null)
            viewparent.childDrawableStateChanged(this);
    }

    public boolean removeCallbacks(Runnable runnable)
    {
label0:
        {
            if (runnable != null)
            {
                AttachInfo attachinfo = mAttachInfo;
                if (attachinfo == null)
                    break label0;
                attachinfo.mHandler.removeCallbacks(runnable);
                attachinfo.mViewRootImpl.mChoreographer.removeCallbacks(1, runnable, null);
            }
            return true;
        }
        ViewRootImpl.getRunQueue().removeCallbacks(runnable);
        return true;
    }

    public void removeOnAttachStateChangeListener(OnAttachStateChangeListener onattachstatechangelistener)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnAttachStateChangeListeners != null)
        {
            listenerinfo.mOnAttachStateChangeListeners.remove(onattachstatechangelistener);
            return;
        } else
        {
            return;
        }
    }

    public void removeOnLayoutChangeListener(OnLayoutChangeListener onlayoutchangelistener)
    {
        ListenerInfo listenerinfo = mListenerInfo;
        if (listenerinfo != null && listenerinfo.mOnLayoutChangeListeners != null)
        {
            listenerinfo.mOnLayoutChangeListeners.remove(onlayoutchangelistener);
            return;
        } else
        {
            return;
        }
    }

    public boolean requestAccessibilityFocus()
    {
        AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(mContext);
        if (accessibilitymanager.isEnabled() && accessibilitymanager.isTouchExplorationEnabled() && (0xc & mViewFlags) == 0 && (0x4000000 & mPrivateFlags2) == 0)
        {
            mPrivateFlags2 = 0x4000000 | mPrivateFlags2;
            ViewRootImpl viewrootimpl = getViewRootImpl();
            if (viewrootimpl != null)
                viewrootimpl.setAccessibilityFocus(this, null);
            invalidate();
            sendAccessibilityEvent(32768);
            notifyAccessibilityStateChanged();
            return true;
        } else
        {
            return false;
        }
    }

    public void requestFitSystemWindows()
    {
        if (mParent != null)
            mParent.requestFitSystemWindows();
    }

    public final boolean requestFocus()
    {
        return requestFocus(130);
    }

    public final boolean requestFocus(int i)
    {
        return requestFocus(i, null);
    }

    public boolean requestFocus(int i, Rect rect)
    {
        return requestFocusNoSearch(i, rect);
    }

    public final boolean requestFocusFromTouch()
    {
        if (isInTouchMode())
        {
            ViewRootImpl viewrootimpl = getViewRootImpl();
            if (viewrootimpl != null)
                viewrootimpl.ensureTouchMode(false);
        }
        return requestFocus(130);
    }

    public void requestLayout()
    {
        mPrivateFlags = 0x1000 | mPrivateFlags;
        mPrivateFlags = 0x80000000 | mPrivateFlags;
        if (mParent != null && !mParent.isLayoutRequested())
            mParent.requestLayout();
    }

    public boolean requestRectangleOnScreen(Rect rect)
    {
        return requestRectangleOnScreen(rect, false);
    }

    public boolean requestRectangleOnScreen(Rect rect, boolean flag)
    {
        boolean flag1;
        if (mParent == null)
        {
            flag1 = false;
        } else
        {
            View view = this;
            RectF rectf;
            if (mAttachInfo != null)
                rectf = mAttachInfo.mTmpTransformRect;
            else
                rectf = new RectF();
            rectf.set(rect);
            ViewParent viewparent = mParent;
            flag1 = false;
            do
            {
                if (viewparent == null)
                    break;
                rect.set((int)rectf.left, (int)rectf.top, (int)rectf.right, (int)rectf.bottom);
                flag1 |= viewparent.requestChildRectangleOnScreen(view, rect, flag);
                if (!view.hasIdentityMatrix())
                    view.getMatrix().mapRect(rectf);
                rectf.offset(view.mLeft, view.mTop);
                if (!(viewparent instanceof View))
                    break;
                View view1 = (View)viewparent;
                rectf.offset(-view1.getScrollX(), -view1.getScrollY());
                view = view1;
                viewparent = view.getParent();
            } while (true);
        }
        return flag1;
    }

    public void resetAccessibilityStateChanged()
    {
        mPrivateFlags2 = 0xf7ffffff & mPrivateFlags2;
    }

    public void resetMeasuredHeightDimension()
    {
        mOldHeightMeasureSpec = mMeasuredHeight;
        mMeasuredHeight = 0;
    }

    public void resetMeasuredWidthDimension()
    {
        mOldWidthMeasureSpec = mMeasuredWidth;
        mMeasuredWidth = 0;
    }

    public void resetPaddingToInitialValues()
    {
        if (isRtlCompatibilityMode())
        {
            mPaddingLeft = mUserPaddingLeftInitial;
            mPaddingRight = mUserPaddingRightInitial;
            return;
        }
        if (isLayoutRtl())
        {
            int k;
            if (mUserPaddingEnd >= 0)
                k = mUserPaddingEnd;
            else
                k = mUserPaddingLeftInitial;
            mPaddingLeft = k;
            int l;
            if (mUserPaddingStart >= 0)
                l = mUserPaddingStart;
            else
                l = mUserPaddingRightInitial;
            mPaddingRight = l;
            return;
        }
        int i;
        if (mUserPaddingStart >= 0)
            i = mUserPaddingStart;
        else
            i = mUserPaddingLeftInitial;
        mPaddingLeft = i;
        int j;
        if (mUserPaddingEnd >= 0)
            j = mUserPaddingEnd;
        else
            j = mUserPaddingRightInitial;
        mPaddingRight = j;
    }

    protected void resetResolvedDrawables()
    {
        mPrivateFlags2 = 0xbfffffff & mPrivateFlags2;
    }

    public void resetResolvedLayoutDirection()
    {
        mPrivateFlags2 = 0xffffffcf & mPrivateFlags2;
    }

    public void resetResolvedPadding()
    {
        mPrivateFlags2 = 0xdfffffff & mPrivateFlags2;
    }

    public void resetResolvedTextAlignment()
    {
        mPrivateFlags2 = 0xfff0ffff & mPrivateFlags2;
        mPrivateFlags2 = 0x20000 | mPrivateFlags2;
    }

    public void resetResolvedTextDirection()
    {
        mPrivateFlags2 = 0xffffe1ff & mPrivateFlags2;
        mPrivateFlags2 = 0x400 | mPrivateFlags2;
    }

    public void resetRtlProperties()
    {
        resetResolvedLayoutDirection();
        resetResolvedTextDirection();
        resetResolvedTextAlignment();
        resetResolvedPadding();
        resetResolvedDrawables();
    }

    protected void resolveDrawables()
    {
        if (canResolveLayoutDirection())
        {
            if (mBackground != null)
                mBackground.setLayoutDirection(getLayoutDirection());
            mPrivateFlags2 = 0x40000000 | mPrivateFlags2;
            onResolveDrawables(getLayoutDirection());
        }
    }

    public boolean resolveLayoutDirection()
    {
        boolean flag;
label0:
        {
            mPrivateFlags2 = 0xffffffcf & mPrivateFlags2;
            if (hasRtlSupport())
                switch ((0xc & mPrivateFlags2) >> 2)
                {
                default:
                    break;

                case 3: // '\003'
                    if (1 == TextUtils.getLayoutDirectionFromLocale(Locale.getDefault()))
                        mPrivateFlags2 = 0x10 | mPrivateFlags2;
                    break;

                case 1: // '\001'
                    mPrivateFlags2 = 0x10 | mPrivateFlags2;
                    break;

                case 2: // '\002'
                    boolean flag1 = canResolveLayoutDirection();
                    flag = false;
                    if (!flag1)
                        break label0;
                    View view = (View)mParent;
                    boolean flag2 = view.isLayoutDirectionResolved();
                    flag = false;
                    if (!flag2)
                        break label0;
                    if (view.getLayoutDirection() == 1)
                        mPrivateFlags2 = 0x10 | mPrivateFlags2;
                    break;
                }
            mPrivateFlags2 = 0x20 | mPrivateFlags2;
            flag = true;
        }
        return flag;
    }

    public void resolveLayoutParams()
    {
        if (mLayoutParams != null)
            mLayoutParams.resolveLayoutDirection(getLayoutDirection());
    }

    public void resolvePadding()
    {
        if (!isRtlCompatibilityMode())
        {
            int i = getLayoutDirection();
            mUserPaddingLeft = mUserPaddingLeftInitial;
            mUserPaddingRight = mUserPaddingRightInitial;
            switch (i)
            {
            case 1: // '\001'
                if (mUserPaddingStart != 0x80000000)
                    mUserPaddingRight = mUserPaddingStart;
                if (mUserPaddingEnd != 0x80000000)
                    mUserPaddingLeft = mUserPaddingEnd;
                break;

            default:
                if (mUserPaddingStart != 0x80000000)
                    mUserPaddingLeft = mUserPaddingStart;
                if (mUserPaddingEnd != 0x80000000)
                    mUserPaddingRight = mUserPaddingEnd;
                break;
            }
            int j;
            if (mUserPaddingBottom >= 0)
                j = mUserPaddingBottom;
            else
                j = mPaddingBottom;
            mUserPaddingBottom = j;
            internalSetPadding(mUserPaddingLeft, mPaddingTop, mUserPaddingRight, mUserPaddingBottom);
            onRtlPropertiesChanged(i);
        }
        mPrivateFlags2 = 0x20000000 | mPrivateFlags2;
    }

    public void resolveRtlPropertiesIfNeeded()
    {
        if (!needRtlPropertiesResolution())
            return;
        if (!isLayoutDirectionResolved())
        {
            resolveLayoutDirection();
            resolveLayoutParams();
        }
        if (!isTextDirectionResolved())
            resolveTextDirection();
        if (!isTextAlignmentResolved())
            resolveTextAlignment();
        if (!isPaddingResolved())
            resolvePadding();
        if (!isDrawablesResolved())
            resolveDrawables();
        onRtlPropertiesChanged(getLayoutDirection());
    }

    public boolean resolveTextAlignment()
    {
        mPrivateFlags2 = 0xfff0ffff & mPrivateFlags2;
        if (hasRtlSupport())
        {
            int i = getRawTextAlignment();
            switch (i)
            {
            case 1: // '\001'
            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
            case 5: // '\005'
            case 6: // '\006'
                mPrivateFlags2 = mPrivateFlags2 | i << 17;
                break;

            case 0: // '\0'
                if (!canResolveTextAlignment())
                {
                    mPrivateFlags2 = 0x20000 | mPrivateFlags2;
                    return false;
                }
                View view = (View)mParent;
                if (!view.isTextAlignmentResolved())
                {
                    mPrivateFlags2 = 0x20000 | mPrivateFlags2;
                    return false;
                }
                int j = view.getTextAlignment();
                switch (j)
                {
                case 1: // '\001'
                case 2: // '\002'
                case 3: // '\003'
                case 4: // '\004'
                case 5: // '\005'
                case 6: // '\006'
                    mPrivateFlags2 = mPrivateFlags2 | j << 17;
                    break;

                default:
                    mPrivateFlags2 = 0x20000 | mPrivateFlags2;
                    break;
                }
                break;

            default:
                mPrivateFlags2 = 0x20000 | mPrivateFlags2;
                break;
            }
        } else
        {
            mPrivateFlags2 = 0x20000 | mPrivateFlags2;
        }
        mPrivateFlags2 = 0x10000 | mPrivateFlags2;
        return true;
    }

    public boolean resolveTextDirection()
    {
        mPrivateFlags2 = 0xffffe1ff & mPrivateFlags2;
        if (hasRtlSupport())
        {
            int i = getRawTextDirection();
            switch (i)
            {
            case 1: // '\001'
            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
            case 5: // '\005'
                mPrivateFlags2 = mPrivateFlags2 | i << 10;
                break;

            case 0: // '\0'
                if (!canResolveTextDirection())
                {
                    mPrivateFlags2 = 0x400 | mPrivateFlags2;
                    return false;
                }
                View view = (View)mParent;
                if (!view.isTextDirectionResolved())
                {
                    mPrivateFlags2 = 0x400 | mPrivateFlags2;
                    return false;
                }
                int j = view.getTextDirection();
                switch (j)
                {
                case 1: // '\001'
                case 2: // '\002'
                case 3: // '\003'
                case 4: // '\004'
                case 5: // '\005'
                    mPrivateFlags2 = mPrivateFlags2 | j << 10;
                    break;

                default:
                    mPrivateFlags2 = 0x400 | mPrivateFlags2;
                    break;
                }
                break;

            default:
                mPrivateFlags2 = 0x400 | mPrivateFlags2;
                break;
            }
        } else
        {
            mPrivateFlags2 = 0x400 | mPrivateFlags2;
        }
        mPrivateFlags2 = 0x200 | mPrivateFlags2;
        return true;
    }

    public void restoreHierarchyState(SparseArray sparsearray)
    {
        dispatchRestoreInstanceState(sparsearray);
    }

    public void saveHierarchyState(SparseArray sparsearray)
    {
        dispatchSaveInstanceState(sparsearray);
    }

    public void scheduleDrawable(Drawable drawable, Runnable runnable, long l)
    {
        long l1;
label0:
        {
            if (verifyDrawable(drawable) && runnable != null)
            {
                l1 = l - SystemClock.uptimeMillis();
                if (mAttachInfo == null)
                    break label0;
                mAttachInfo.mViewRootImpl.mChoreographer.postCallbackDelayed(1, runnable, drawable, Choreographer.subtractFrameDelay(l1));
            }
            return;
        }
        ViewRootImpl.getRunQueue().postDelayed(runnable, l1);
    }

    public void scrollBy(int i, int j)
    {
        scrollTo(i + mScrollX, j + mScrollY);
    }

    public void scrollTo(int i, int j)
    {
        if (mScrollX != i || mScrollY != j)
        {
            int k = mScrollX;
            int l = mScrollY;
            mScrollX = i;
            mScrollY = j;
            invalidateParentCaches();
            onScrollChanged(mScrollX, mScrollY, k, l);
            if (!awakenScrollBars())
                postInvalidateOnAnimation();
        }
    }

    public void sendAccessibilityEvent(int i)
    {
        if (mAccessibilityDelegate != null)
        {
            mAccessibilityDelegate.sendAccessibilityEvent(this, i);
            return;
        } else
        {
            sendAccessibilityEventInternal(i);
            return;
        }
    }

    void sendAccessibilityEventInternal(int i)
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled())
            sendAccessibilityEventUnchecked(AccessibilityEvent.obtain(i));
    }

    public void sendAccessibilityEventUnchecked(AccessibilityEvent accessibilityevent)
    {
        if (mAccessibilityDelegate != null)
        {
            mAccessibilityDelegate.sendAccessibilityEventUnchecked(this, accessibilityevent);
            return;
        } else
        {
            sendAccessibilityEventUncheckedInternal(accessibilityevent);
            return;
        }
    }

    void sendAccessibilityEventUncheckedInternal(AccessibilityEvent accessibilityevent)
    {
        if (!isShown())
            return;
        onInitializeAccessibilityEvent(accessibilityevent);
        if ((0x2a1bf & accessibilityevent.getEventType()) != 0)
            dispatchPopulateAccessibilityEvent(accessibilityevent);
        getParent().requestSendAccessibilityEvent(this, accessibilityevent);
    }

    public void setAccessibilityCursorPosition(int i)
    {
        mAccessibilityCursorPosition = i;
    }

    public void setAccessibilityDelegate(AccessibilityDelegate accessibilitydelegate)
    {
        mAccessibilityDelegate = accessibilitydelegate;
    }

    public void setActivated(boolean flag)
    {
        int i = 0x40000000;
        boolean flag1;
        if ((i & mPrivateFlags) != 0)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != flag)
        {
            int j = 0xbfffffff & mPrivateFlags;
            if (!flag)
                i = 0;
            mPrivateFlags = i | j;
            invalidate(true);
            refreshDrawableState();
            dispatchSetActivated(flag);
        }
    }

    public void setAlpha(float f)
    {
        ensureTransformationInfo();
        if (mTransformationInfo.mAlpha != f)
        {
            mTransformationInfo.mAlpha = f;
            if (onSetAlpha((int)(255F * f)))
            {
                mPrivateFlags = 0x40000 | mPrivateFlags;
                invalidateParentCaches();
                invalidate(true);
            } else
            {
                mPrivateFlags = 0xfffbffff & mPrivateFlags;
                invalidateViewProperty(true, false);
                if (mDisplayList != null)
                {
                    mDisplayList.setAlpha(f);
                    return;
                }
            }
        }
    }

    boolean setAlphaNoInvalidation(float f)
    {
        ensureTransformationInfo();
        if (mTransformationInfo.mAlpha != f)
        {
            mTransformationInfo.mAlpha = f;
            if (onSetAlpha((int)(255F * f)))
            {
                mPrivateFlags = 0x40000 | mPrivateFlags;
                return true;
            }
            mPrivateFlags = 0xfffbffff & mPrivateFlags;
            if (mDisplayList != null)
                mDisplayList.setAlpha(f);
        }
        return false;
    }

    public void setAnimation(Animation animation)
    {
        mCurrentAnimation = animation;
        if (animation != null)
        {
            if (mAttachInfo != null && !mAttachInfo.mScreenOn && animation.getStartTime() == -1L)
                animation.setStartTime(AnimationUtils.currentAnimationTimeMillis());
            animation.reset();
        }
    }

    public void setBackground(Drawable drawable)
    {
        setBackgroundDrawable(drawable);
    }

    public void setBackgroundColor(int i)
    {
        if (mBackground instanceof ColorDrawable)
        {
            ((ColorDrawable)mBackground.mutate()).setColor(i);
            computeOpaqueFlags();
            return;
        } else
        {
            setBackground(new ColorDrawable(i));
            return;
        }
    }

    public void setBackgroundDrawable(Drawable drawable)
    {
        boolean flag;
label0:
        {
label1:
            {
label2:
                {
                    computeOpaqueFlags();
                    if (drawable == mBackground)
                        return;
                    mBackgroundResource = 0;
                    if (mBackground != null)
                    {
                        mBackground.setCallback(null);
                        unscheduleDrawable(mBackground);
                    }
                    if (drawable == null)
                        break label1;
                    Rect rect = (Rect)sThreadLocal.get();
                    if (rect == null)
                    {
                        rect = new Rect();
                        sThreadLocal.set(rect);
                    }
                    resetResolvedDrawables();
                    drawable.setLayoutDirection(getLayoutDirection());
                    if (drawable.getPadding(rect))
                    {
                        resetResolvedPadding();
                        switch (drawable.getLayoutDirection())
                        {
                        case 1: // '\001'
                            mUserPaddingLeftInitial = rect.right;
                            mUserPaddingRightInitial = rect.left;
                            internalSetPadding(rect.right, rect.top, rect.left, rect.bottom);
                            break;

                        default:
                            mUserPaddingLeftInitial = rect.left;
                            mUserPaddingRightInitial = rect.right;
                            internalSetPadding(rect.left, rect.top, rect.right, rect.bottom);
                            break;
                        }
                    }
                    if (mBackground != null && mBackground.getMinimumHeight() == drawable.getMinimumHeight())
                    {
                        int i = mBackground.getMinimumWidth();
                        int j = drawable.getMinimumWidth();
                        flag = false;
                        if (i == j)
                            break label2;
                    }
                    flag = true;
                }
                drawable.setCallback(this);
                if (drawable.isStateful())
                    drawable.setState(getDrawableState());
                boolean flag1;
                if (getVisibility() == 0)
                    flag1 = true;
                else
                    flag1 = false;
                drawable.setVisible(flag1, false);
                mBackground = drawable;
                if ((0x80 & mPrivateFlags) != 0)
                {
                    mPrivateFlags = 0xffffff7f & mPrivateFlags;
                    mPrivateFlags = 0x100 | mPrivateFlags;
                    flag = true;
                }
                break label0;
            }
            mBackground = null;
            if ((0x100 & mPrivateFlags) != 0)
            {
                mPrivateFlags = 0xfffffeff & mPrivateFlags;
                mPrivateFlags = 0x80 | mPrivateFlags;
            }
            flag = true;
        }
        computeOpaqueFlags();
        if (flag)
            requestLayout();
        mBackgroundSizeChanged = true;
        invalidate(true);
    }

    public void setBackgroundResource(int i)
    {
        if (i != 0 && i == mBackgroundResource)
            return;
        Drawable drawable = null;
        if (i != 0)
            drawable = mResources.getDrawable(i);
        setBackground(drawable);
        mBackgroundResource = i;
    }

    public final void setBottom(int i)
    {
        if (i != mBottom)
        {
            updateMatrix();
            boolean flag;
            if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                flag = false;
            else
                flag = true;
            if (flag)
            {
                if (mAttachInfo != null)
                {
                    int l;
                    if (i < mBottom)
                        l = mBottom;
                    else
                        l = i;
                    invalidate(0, 0, mRight - mLeft, l - mTop);
                }
            } else
            {
                invalidate(true);
            }
            int j = mRight - mLeft;
            int k = mBottom - mTop;
            mBottom = i;
            if (mDisplayList != null)
                mDisplayList.setBottom(mBottom);
            onSizeChanged(j, mBottom - mTop, j, k);
            if (!flag)
            {
                if ((0x20000000 & mPrivateFlags) == 0)
                    mTransformationInfo.mMatrixDirty = true;
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(true);
            }
            mBackgroundSizeChanged = true;
            invalidateParentIfNeeded();
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setCameraDistance(float f)
    {
        invalidateViewProperty(true, false);
        ensureTransformationInfo();
        float f1 = mResources.getDisplayMetrics().densityDpi;
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mCamera == null)
        {
            transformationinfo.mCamera = new Camera();
            transformationinfo.matrix3D = new Matrix();
        }
        transformationinfo.mCamera.setLocation(0.0F, 0.0F, -Math.abs(f) / f1);
        transformationinfo.mMatrixDirty = true;
        invalidateViewProperty(false, false);
        if (mDisplayList != null)
            mDisplayList.setCameraDistance(-Math.abs(f) / f1);
        if ((0x10000000 & mPrivateFlags2) == 0x10000000)
            invalidateParentIfNeeded();
    }

    public void setClickable(boolean flag)
    {
        char c;
        if (flag)
            c = '\u4000';
        else
            c = '\0';
        setFlags(c, 16384);
    }

    public void setContentDescription(CharSequence charsequence)
    {
        if (mContentDescription != null ? !mContentDescription.equals(charsequence) : charsequence != null)
        {
            mContentDescription = charsequence;
            boolean flag;
            if (charsequence != null && charsequence.length() > 0)
                flag = true;
            else
                flag = false;
            if (flag && getImportantForAccessibility() == 0)
                setImportantForAccessibility(1);
            notifyAccessibilityStateChanged();
            return;
        } else
        {
            return;
        }
    }

    public void setDisabledSystemUiVisibility(int i)
    {
        if (mAttachInfo != null && mAttachInfo.mDisabledSystemUiVisibility != i)
        {
            mAttachInfo.mDisabledSystemUiVisibility = i;
            if (mParent != null)
                mParent.recomputeViewAttributes(this);
        }
    }

    void setDisplayListProperties(DisplayList displaylist)
    {
        if (displaylist != null)
        {
            displaylist.setLeftTopRightBottom(mLeft, mTop, mRight, mBottom);
            displaylist.setHasOverlappingRendering(hasOverlappingRendering());
            if (mParent instanceof ViewGroup)
            {
                boolean flag;
                if ((1 & ((ViewGroup)mParent).mGroupFlags) != 0)
                    flag = true;
                else
                    flag = false;
                displaylist.setClipChildren(flag);
            }
            float f = 1.0F;
            if ((mParent instanceof ViewGroup) && (0x800 & ((ViewGroup)mParent).mGroupFlags) != 0)
            {
                ViewGroup viewgroup = (ViewGroup)mParent;
                if (viewgroup.getChildStaticTransformation(this, viewgroup.mChildTransformation))
                {
                    Transformation transformation = viewgroup.mChildTransformation;
                    int i = viewgroup.mChildTransformation.getTransformationType();
                    if (i != Transformation.TYPE_IDENTITY)
                    {
                        if ((i & Transformation.TYPE_ALPHA) != 0)
                            f = transformation.getAlpha();
                        if ((i & Transformation.TYPE_MATRIX) != 0)
                            displaylist.setStaticMatrix(transformation.getMatrix());
                    }
                }
            }
            if (mTransformationInfo != null)
            {
                float f1 = f * mTransformationInfo.mAlpha;
                if (f1 < 1.0F && onSetAlpha((int)(255F * f1)))
                    f1 = 1.0F;
                displaylist.setTransformationInfo(f1, mTransformationInfo.mTranslationX, mTransformationInfo.mTranslationY, mTransformationInfo.mRotation, mTransformationInfo.mRotationX, mTransformationInfo.mRotationY, mTransformationInfo.mScaleX, mTransformationInfo.mScaleY);
                if (mTransformationInfo.mCamera == null)
                {
                    mTransformationInfo.mCamera = new Camera();
                    mTransformationInfo.matrix3D = new Matrix();
                }
                displaylist.setCameraDistance(mTransformationInfo.mCamera.getLocationZ());
                if ((0x20000000 & mPrivateFlags) == 0x20000000)
                {
                    displaylist.setPivotX(getPivotX());
                    displaylist.setPivotY(getPivotY());
                }
            } else
            if (f < 1.0F)
            {
                displaylist.setAlpha(f);
                return;
            }
        }
    }

    public void setDrawingCacheBackgroundColor(int i)
    {
        if (i != mDrawingCacheBackgroundColor)
        {
            mDrawingCacheBackgroundColor = i;
            mPrivateFlags = 0xffff7fff & mPrivateFlags;
        }
    }

    public void setDrawingCacheEnabled(boolean flag)
    {
        mCachingFailed = false;
        int i = 0;
        if (flag)
            i = 32768;
        setFlags(i, 32768);
    }

    public void setDrawingCacheQuality(int i)
    {
        setFlags(i, 0x180000);
    }

    public void setDuplicateParentStateEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 0x400000;
        else
            i = 0;
        setFlags(i, 0x400000);
    }

    public void setEnabled(boolean flag)
    {
        if (flag == isEnabled())
            return;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 32;
        setFlags(byte0, 32);
        refreshDrawableState();
        invalidate(true);
    }

    public void setFadingEdgeLength(int i)
    {
        initScrollCache();
        mScrollCache.fadingEdgeLength = i;
    }

    public void setFilterTouchesWhenObscured(boolean flag)
    {
        char c;
        if (flag)
            c = '\0';
        else
            c = '\u0400';
        setFlags(c, 1024);
    }

    public void setFitsSystemWindows(boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 2;
        else
            byte0 = 0;
        setFlags(byte0, 2);
    }

    void setFlags(int i, int j)
    {
        int k = mViewFlags;
        mViewFlags = mViewFlags & ~j | i & j;
        int l = k ^ mViewFlags;
        if (l != 0)
        {
            int i1 = mPrivateFlags;
            if ((l & 1) != 0 && (i1 & 0x10) != 0)
            {
                if ((k & 1) == 1 && (i1 & 2) != 0)
                    clearFocus();
                else
                if ((k & 1) == 0 && (i1 & 2) == 0 && mParent != null)
                    mParent.focusableViewAvailable(this);
                if (AccessibilityManager.getInstance(mContext).isEnabled())
                    notifyAccessibilityStateChanged();
            }
            if ((i & 0xc) == 0 && (l & 0xc) != 0)
            {
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(true);
                needGlobalAttributesUpdate(true);
                if (mParent != null && mBottom > mTop && mRight > mLeft)
                    mParent.focusableViewAvailable(this);
            }
            if ((l & 8) != 0)
            {
                needGlobalAttributesUpdate(false);
                requestLayout();
                if ((0xc & mViewFlags) == 8)
                {
                    if (hasFocus())
                        clearFocus();
                    clearAccessibilityFocus();
                    destroyDrawingCache();
                    if (mParent instanceof View)
                        ((View)mParent).invalidate(true);
                    mPrivateFlags = 0x20 | mPrivateFlags;
                }
                if (mAttachInfo != null)
                    mAttachInfo.mViewVisibilityChanged = true;
            }
            if ((l & 4) != 0)
            {
                needGlobalAttributesUpdate(false);
                mPrivateFlags = 0x20 | mPrivateFlags;
                if ((0xc & mViewFlags) == 4 && hasFocus() && getRootView() != this)
                {
                    clearFocus();
                    clearAccessibilityFocus();
                }
                if (mAttachInfo != null)
                    mAttachInfo.mViewVisibilityChanged = true;
            }
            if ((l & 0xc) != 0)
            {
                if (mParent instanceof ViewGroup)
                {
                    ((ViewGroup)mParent).onChildVisibilityChanged(this, l & 0xc, i & 0xc);
                    ((View)mParent).invalidate(true);
                } else
                if (mParent != null)
                    mParent.invalidateChild(this, null);
                dispatchVisibilityChanged(this, i & 0xc);
            }
            if ((0x20000 & l) != 0)
                destroyDrawingCache();
            if ((0x8000 & l) != 0)
            {
                destroyDrawingCache();
                mPrivateFlags = 0xffff7fff & mPrivateFlags;
                invalidateParentCaches();
            }
            if ((0x180000 & l) != 0)
            {
                destroyDrawingCache();
                mPrivateFlags = 0xffff7fff & mPrivateFlags;
            }
            if ((l & 0x80) != 0)
            {
                if ((0x80 & mViewFlags) != 0)
                {
                    if (mBackground != null)
                    {
                        mPrivateFlags = 0xffffff7f & mPrivateFlags;
                        mPrivateFlags = 0x100 | mPrivateFlags;
                    } else
                    {
                        mPrivateFlags = 0x80 | mPrivateFlags;
                    }
                } else
                {
                    mPrivateFlags = 0xffffff7f & mPrivateFlags;
                }
                requestLayout();
                invalidate(true);
            }
            if ((0x4000000 & l) != 0 && mParent != null && mAttachInfo != null && !mAttachInfo.mRecomputeGlobalAttributes)
                mParent.recomputeViewAttributes(this);
            if (AccessibilityManager.getInstance(mContext).isEnabled() && ((l & 1) != 0 || (l & 0x4000) != 0 || (0x200000 & l) != 0 || (l & 0) != 0))
            {
                notifyAccessibilityStateChanged();
                return;
            }
        }
    }

    public void setFocusable(boolean flag)
    {
        if (!flag)
            setFlags(0, 0x40000);
        int i = 0;
        if (flag)
            i = 1;
        setFlags(i, 1);
    }

    public void setFocusableInTouchMode(boolean flag)
    {
        int i;
        if (flag)
            i = 0x40000;
        else
            i = 0;
        setFlags(i, 0x40000);
        if (flag)
            setFlags(1, 1);
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        boolean flag;
label0:
        {
            if (mLeft == i && mRight == k && mTop == j)
            {
                int j2 = mBottom;
                flag = false;
                if (j2 == l)
                    break label0;
            }
            flag = true;
            int i1 = 0x20 & mPrivateFlags;
            int j1 = mRight - mLeft;
            int k1 = mBottom - mTop;
            int l1 = k - i;
            int i2 = l - j;
            boolean flag1;
            if (l1 == j1 && i2 == k1)
                flag1 = false;
            else
                flag1 = true;
            invalidate(flag1);
            mLeft = i;
            mTop = j;
            mRight = k;
            mBottom = l;
            if (mDisplayList != null)
                mDisplayList.setLeftTopRightBottom(mLeft, mTop, mRight, mBottom);
            mPrivateFlags = 0x10 | mPrivateFlags;
            if (flag1)
            {
                if ((0x20000000 & mPrivateFlags) == 0 && mTransformationInfo != null)
                    mTransformationInfo.mMatrixDirty = true;
                onSizeChanged(l1, i2, j1, k1);
            }
            if ((0xc & mViewFlags) == 0)
            {
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(flag1);
                invalidateParentCaches();
            }
            mPrivateFlags = i1 | mPrivateFlags;
            mBackgroundSizeChanged = true;
        }
        return flag;
    }

    public void setHapticFeedbackEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 0x10000000;
        else
            i = 0;
        setFlags(i, 0x10000000);
    }

    public void setHasTransientState(boolean flag)
    {
        int i;
        int j;
        int k;
        if (flag)
            i = 1 + mTransientStateCount;
        else
            i = -1 + mTransientStateCount;
        mTransientStateCount = i;
        if (mTransientStateCount < 0)
        {
            mTransientStateCount = 0;
            Log.e("View", "hasTransientState decremented below 0: unmatched pair of setHasTransientState calls");
        }
        if ((!flag || mTransientStateCount != 1) && (flag || mTransientStateCount != 0))
            break MISSING_BLOCK_LABEL_104;
        j = 0xffbfffff & mPrivateFlags2;
        if (flag)
            k = 0x400000;
        else
            k = 0;
        mPrivateFlags2 = k | j;
        if (mParent == null)
            break MISSING_BLOCK_LABEL_104;
        mParent.childHasTransientStateChanged(this, flag);
        return;
        AbstractMethodError abstractmethoderror;
        abstractmethoderror;
        Log.e("View", (new StringBuilder()).append(mParent.getClass().getSimpleName()).append(" does not fully implement ViewParent").toString(), abstractmethoderror);
        return;
    }

    public void setHorizontalFadingEdgeEnabled(boolean flag)
    {
        if (isHorizontalFadingEdgeEnabled() != flag)
        {
            if (flag)
                initScrollCache();
            mViewFlags = 0x1000 ^ mViewFlags;
        }
    }

    public void setHorizontalScrollBarEnabled(boolean flag)
    {
        if (isHorizontalScrollBarEnabled() != flag)
        {
            mViewFlags = 0x100 ^ mViewFlags;
            computeOpaqueFlags();
            resolvePadding();
        }
    }

    public void setHovered(boolean flag)
    {
        if (flag)
        {
            if ((0x10000000 & mPrivateFlags) == 0)
            {
                mPrivateFlags = 0x10000000 | mPrivateFlags;
                refreshDrawableState();
                onHoverChanged(true);
            }
        } else
        if ((0x10000000 & mPrivateFlags) != 0)
        {
            mPrivateFlags = 0xefffffff & mPrivateFlags;
            refreshDrawableState();
            onHoverChanged(false);
            return;
        }
    }

    public void setId(int i)
    {
        mID = i;
        if (mID == -1 && mLabelForId != -1)
            mID = generateViewId();
    }

    public void setImportantForAccessibility(int i)
    {
        if (i != getImportantForAccessibility())
        {
            mPrivateFlags2 = 0xffcfffff & mPrivateFlags2;
            mPrivateFlags2 = mPrivateFlags2 | 0x300000 & i << 20;
            notifyAccessibilityStateChanged();
        }
    }

    public void setIsRootNamespace(boolean flag)
    {
        if (flag)
        {
            mPrivateFlags = 8 | mPrivateFlags;
            return;
        } else
        {
            mPrivateFlags = -9 & mPrivateFlags;
            return;
        }
    }

    public void setKeepScreenOn(boolean flag)
    {
        int i;
        if (flag)
            i = 0x4000000;
        else
            i = 0;
        setFlags(i, 0x4000000);
    }

    public void setLabelFor(int i)
    {
        mLabelForId = i;
        if (mLabelForId != -1 && mID == -1)
            mID = generateViewId();
    }

    public void setLayerPaint(Paint paint)
    {
label0:
        {
            int i = getLayerType();
            if (i != 0)
            {
                Paint paint1;
                if (paint == null)
                    paint1 = new Paint();
                else
                    paint1 = paint;
                mLayerPaint = paint1;
                if (i != 2)
                    break label0;
                HardwareLayer hardwarelayer = getHardwareLayer();
                if (hardwarelayer != null)
                    hardwarelayer.setLayerPaint(paint);
                invalidateViewProperty(false, false);
            }
            return;
        }
        invalidate();
    }

    public void setLayerType(int i, Paint paint)
    {
        if (i >= 0 && i <= 2)
        {
            if (i == mLayerType)
            {
                if (i != 0 && paint != mLayerPaint)
                {
                    if (paint == null)
                        paint = new Paint();
                    mLayerPaint = paint;
                    invalidateParentCaches();
                    invalidate(true);
                }
                return;
            }
            switch (mLayerType)
            {
            case 2: // '\002'
                destroyLayer(false);
                // fall through

            case 1: // '\001'
                destroyDrawingCache();
                // fall through

            default:
                mLayerType = i;
                break;
            }
            int j = mLayerType;
            boolean flag = false;
            if (j == 0)
                flag = true;
            if (flag)
                paint = null;
            else
            if (paint == null)
                paint = new Paint();
            mLayerPaint = paint;
            Rect rect = null;
            if (!flag)
                rect = new Rect();
            mLocalDirtyRect = rect;
            invalidateParentCaches();
            invalidate(true);
            return;
        } else
        {
            throw new IllegalArgumentException("Layer type can only be one of: LAYER_TYPE_NONE, LAYER_TYPE_SOFTWARE or LAYER_TYPE_HARDWARE");
        }
    }

    public void setLayoutDirection(int i)
    {
        if (getRawLayoutDirection() != i)
        {
            mPrivateFlags2 = 0xfffffff3 & mPrivateFlags2;
            resetRtlProperties();
            mPrivateFlags2 = mPrivateFlags2 | 0xc & i << 2;
            resolveRtlPropertiesIfNeeded();
            requestLayout();
            invalidate(true);
        }
    }

    public void setLayoutInsets(Insets insets)
    {
        mLayoutInsets = insets;
    }

    public void setLayoutParams(ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams == null)
            throw new NullPointerException("Layout parameters cannot be null");
        mLayoutParams = layoutparams;
        resolveLayoutParams();
        if (mParent instanceof ViewGroup)
            ((ViewGroup)mParent).onSetLayoutParams(this, layoutparams);
        requestLayout();
    }

    public final void setLeft(int i)
    {
        if (i != mLeft)
        {
            updateMatrix();
            boolean flag;
            if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                flag = false;
            else
                flag = true;
            if (flag)
            {
                if (mAttachInfo != null)
                {
                    int l;
                    int i1;
                    if (i < mLeft)
                    {
                        l = i;
                        i1 = i - mLeft;
                    } else
                    {
                        l = mLeft;
                        i1 = 0;
                    }
                    invalidate(i1, 0, mRight - l, mBottom - mTop);
                }
            } else
            {
                invalidate(true);
            }
            int j = mRight - mLeft;
            int k = mBottom - mTop;
            mLeft = i;
            if (mDisplayList != null)
                mDisplayList.setLeft(i);
            onSizeChanged(mRight - mLeft, k, j, k);
            if (!flag)
            {
                if ((0x20000000 & mPrivateFlags) == 0)
                    mTransformationInfo.mMatrixDirty = true;
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(true);
            }
            mBackgroundSizeChanged = true;
            invalidateParentIfNeeded();
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setLongClickable(boolean flag)
    {
        int i;
        if (flag)
            i = 0x200000;
        else
            i = 0;
        setFlags(i, 0x200000);
    }

    protected final void setMeasuredDimension(int i, int j)
    {
        mMeasuredWidth = i;
        mMeasuredHeight = j;
        mPrivateFlags = 0x800 | mPrivateFlags;
    }

    public void setMinimumHeight(int i)
    {
        mMinHeight = i;
        requestLayout();
    }

    public void setMinimumWidth(int i)
    {
        mMinWidth = i;
        requestLayout();
    }

    public void setNextFocusDownId(int i)
    {
        mNextFocusDownId = i;
    }

    public void setNextFocusForwardId(int i)
    {
        mNextFocusForwardId = i;
    }

    public void setNextFocusLeftId(int i)
    {
        mNextFocusLeftId = i;
    }

    public void setNextFocusRightId(int i)
    {
        mNextFocusRightId = i;
    }

    public void setNextFocusUpId(int i)
    {
        mNextFocusUpId = i;
    }

    public void setOnClickListener(OnClickListener onclicklistener)
    {
        if (!isClickable())
            setClickable(true);
        getListenerInfo().mOnClickListener = onclicklistener;
    }

    public void setOnCreateContextMenuListener(OnCreateContextMenuListener oncreatecontextmenulistener)
    {
        if (!isLongClickable())
            setLongClickable(true);
        getListenerInfo().mOnCreateContextMenuListener = oncreatecontextmenulistener;
    }

    public void setOnDragListener(OnDragListener ondraglistener)
    {
        getListenerInfo().mOnDragListener = ondraglistener;
    }

    public void setOnFocusChangeListener(OnFocusChangeListener onfocuschangelistener)
    {
        getListenerInfo().mOnFocusChangeListener = onfocuschangelistener;
    }

    public void setOnGenericMotionListener(OnGenericMotionListener ongenericmotionlistener)
    {
        getListenerInfo().mOnGenericMotionListener = ongenericmotionlistener;
    }

    public void setOnHoverListener(OnHoverListener onhoverlistener)
    {
        getListenerInfo().mOnHoverListener = onhoverlistener;
    }

    public void setOnKeyListener(OnKeyListener onkeylistener)
    {
        getListenerInfo().mOnKeyListener = onkeylistener;
    }

    public void setOnLongClickListener(OnLongClickListener onlongclicklistener)
    {
        if (!isLongClickable())
            setLongClickable(true);
        getListenerInfo().mOnLongClickListener = onlongclicklistener;
    }

    public void setOnSystemUiVisibilityChangeListener(OnSystemUiVisibilityChangeListener onsystemuivisibilitychangelistener)
    {
        getListenerInfo().mOnSystemUiVisibilityChangeListener = onsystemuivisibilitychangelistener;
        if (mParent != null && mAttachInfo != null && !mAttachInfo.mRecomputeGlobalAttributes)
            mParent.recomputeViewAttributes(this);
    }

    public void setOnTouchListener(OnTouchListener ontouchlistener)
    {
        getListenerInfo().mOnTouchListener = ontouchlistener;
    }

    public void setOverScrollMode(int i)
    {
        if (i != 0 && i != 1 && i != 2)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid overscroll mode ").append(i).toString());
        } else
        {
            mOverScrollMode = i;
            return;
        }
    }

    public void setPadding(int i, int j, int k, int l)
    {
        resetResolvedPadding();
        mUserPaddingStart = 0x80000000;
        mUserPaddingEnd = 0x80000000;
        mUserPaddingLeftInitial = i;
        mUserPaddingRightInitial = k;
        internalSetPadding(i, j, k, l);
    }

    public void setPaddingRelative(int i, int j, int k, int l)
    {
        resetResolvedPadding();
        mUserPaddingStart = i;
        mUserPaddingEnd = k;
        switch (getLayoutDirection())
        {
        case 1: // '\001'
            mUserPaddingLeftInitial = k;
            mUserPaddingRightInitial = i;
            internalSetPadding(k, j, i, l);
            return;
        }
        mUserPaddingLeftInitial = i;
        mUserPaddingRightInitial = k;
        internalSetPadding(i, j, k, l);
    }

    public void setPivotX(float f)
    {
        ensureTransformationInfo();
        mPrivateFlags = 0x20000000 | mPrivateFlags;
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mPivotX != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mPivotX = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setPivotX(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setPivotY(float f)
    {
        ensureTransformationInfo();
        mPrivateFlags = 0x20000000 | mPrivateFlags;
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mPivotY != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mPivotY = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setPivotY(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setPressed(boolean flag)
    {
        boolean flag1 = true;
        boolean flag2;
        if ((0x4000 & mPrivateFlags) == 16384)
            flag2 = flag1;
        else
            flag2 = false;
        if (flag == flag2)
            flag1 = false;
        if (flag)
            mPrivateFlags = 0x4000 | mPrivateFlags;
        else
            mPrivateFlags = 0xffffbfff & mPrivateFlags;
        if (flag1)
            refreshDrawableState();
        dispatchSetPressed(flag);
    }

    public final void setRight(int i)
    {
        if (i != mRight)
        {
            updateMatrix();
            boolean flag;
            if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                flag = false;
            else
                flag = true;
            if (flag)
            {
                if (mAttachInfo != null)
                {
                    int l;
                    if (i < mRight)
                        l = mRight;
                    else
                        l = i;
                    invalidate(0, 0, l - mLeft, mBottom - mTop);
                }
            } else
            {
                invalidate(true);
            }
            int j = mRight - mLeft;
            int k = mBottom - mTop;
            mRight = i;
            if (mDisplayList != null)
                mDisplayList.setRight(mRight);
            onSizeChanged(mRight - mLeft, k, j, k);
            if (!flag)
            {
                if ((0x20000000 & mPrivateFlags) == 0)
                    mTransformationInfo.mMatrixDirty = true;
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(true);
            }
            mBackgroundSizeChanged = true;
            invalidateParentIfNeeded();
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setRotation(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mRotation != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mRotation = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setRotation(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setRotationX(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mRotationX != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mRotationX = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setRotationX(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setRotationY(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mRotationY != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mRotationY = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setRotationY(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setSaveEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 0;
        else
            i = 0x10000;
        setFlags(i, 0x10000);
    }

    public void setSaveFromParentEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 0;
        else
            i = 0x20000000;
        setFlags(i, 0x20000000);
    }

    public void setScaleX(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mScaleX != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mScaleX = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setScaleX(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setScaleY(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mScaleY != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mScaleY = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setScaleY(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setScrollBarDefaultDelayBeforeFade(int i)
    {
        getScrollCache().scrollBarDefaultDelayBeforeFade = i;
    }

    public void setScrollBarFadeDuration(int i)
    {
        getScrollCache().scrollBarFadeDuration = i;
    }

    public void setScrollBarSize(int i)
    {
        getScrollCache().scrollBarSize = i;
    }

    public void setScrollBarStyle(int i)
    {
        if (i != (0x3000000 & mViewFlags))
        {
            mViewFlags = 0xfcffffff & mViewFlags | i & 0x3000000;
            computeOpaqueFlags();
            resolvePadding();
        }
    }

    public void setScrollContainer(boolean flag)
    {
        if (flag)
        {
            if (mAttachInfo != null && (0x100000 & mPrivateFlags) == 0)
            {
                mAttachInfo.mScrollContainers.add(this);
                mPrivateFlags = 0x100000 | mPrivateFlags;
            }
            mPrivateFlags = 0x80000 | mPrivateFlags;
            return;
        }
        if ((0x100000 & mPrivateFlags) != 0)
            mAttachInfo.mScrollContainers.remove(this);
        mPrivateFlags = 0xffe7ffff & mPrivateFlags;
    }

    public void setScrollX(int i)
    {
        scrollTo(i, mScrollY);
    }

    public void setScrollY(int i)
    {
        scrollTo(mScrollX, i);
    }

    public void setScrollbarFadingEnabled(boolean flag)
    {
        initScrollCache();
        ScrollabilityCache scrollabilitycache = mScrollCache;
        scrollabilitycache.fadeScrollBars = flag;
        if (flag)
        {
            scrollabilitycache.state = 0;
            return;
        } else
        {
            scrollabilitycache.state = 1;
            return;
        }
    }

    public void setSelected(boolean flag)
    {
        boolean flag1;
        if ((4 & mPrivateFlags) != 0)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != flag)
        {
            int i = -5 & mPrivateFlags;
            byte byte0 = 0;
            if (flag)
                byte0 = 4;
            mPrivateFlags = byte0 | i;
            if (!flag)
                resetPressedState();
            invalidate(true);
            refreshDrawableState();
            dispatchSetSelected(flag);
            if (AccessibilityManager.getInstance(mContext).isEnabled())
                notifyAccessibilityStateChanged();
        }
    }

    public void setSoundEffectsEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 0x8000000;
        else
            i = 0;
        setFlags(i, 0x8000000);
    }

    public void setSystemUiVisibility(int i)
    {
        if (i != mSystemUiVisibility)
        {
            mSystemUiVisibility = i;
            if (mParent != null && mAttachInfo != null && !mAttachInfo.mRecomputeGlobalAttributes)
                mParent.recomputeViewAttributes(this);
        }
    }

    public void setTag(int i, Object obj)
    {
        if (i >>> 24 < 2)
        {
            throw new IllegalArgumentException("The key must be an application-specific resource id.");
        } else
        {
            setKeyedTag(i, obj);
            return;
        }
    }

    public void setTag(Object obj)
    {
        mTag = obj;
    }

    public void setTagInternal(int i, Object obj)
    {
        if (i >>> 24 != 1)
        {
            throw new IllegalArgumentException("The key must be a framework-specific resource id.");
        } else
        {
            setKeyedTag(i, obj);
            return;
        }
    }

    public void setTextAlignment(int i)
    {
        if (i != getRawTextAlignment())
        {
            mPrivateFlags2 = 0xffff1fff & mPrivateFlags2;
            resetResolvedTextAlignment();
            mPrivateFlags2 = mPrivateFlags2 | 0xe000 & i << 13;
            resolveTextAlignment();
            onRtlPropertiesChanged(getLayoutDirection());
            requestLayout();
            invalidate(true);
        }
    }

    public void setTextDirection(int i)
    {
        if (getRawTextDirection() != i)
        {
            mPrivateFlags2 = 0xfffffe3f & mPrivateFlags2;
            resetResolvedTextDirection();
            mPrivateFlags2 = mPrivateFlags2 | 0x1c0 & i << 6;
            resolveTextDirection();
            onRtlPropertiesChanged(getLayoutDirection());
            requestLayout();
            invalidate(true);
        }
    }

    public final void setTop(int i)
    {
        if (i != mTop)
        {
            updateMatrix();
            boolean flag;
            if (mTransformationInfo != null && !mTransformationInfo.mMatrixIsIdentity)
                flag = false;
            else
                flag = true;
            if (flag)
            {
                if (mAttachInfo != null)
                {
                    int l;
                    int i1;
                    if (i < mTop)
                    {
                        l = i;
                        i1 = i - mTop;
                    } else
                    {
                        l = mTop;
                        i1 = 0;
                    }
                    invalidate(0, i1, mRight - mLeft, mBottom - l);
                }
            } else
            {
                invalidate(true);
            }
            int j = mRight - mLeft;
            int k = mBottom - mTop;
            mTop = i;
            if (mDisplayList != null)
                mDisplayList.setTop(mTop);
            onSizeChanged(j, mBottom - mTop, j, k);
            if (!flag)
            {
                if ((0x20000000 & mPrivateFlags) == 0)
                    mTransformationInfo.mMatrixDirty = true;
                mPrivateFlags = 0x20 | mPrivateFlags;
                invalidate(true);
            }
            mBackgroundSizeChanged = true;
            invalidateParentIfNeeded();
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setTouchDelegate(TouchDelegate touchdelegate)
    {
        mTouchDelegate = touchdelegate;
    }

    public void setTranslationX(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mTranslationX != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mTranslationX = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setTranslationX(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setTranslationY(float f)
    {
        ensureTransformationInfo();
        TransformationInfo transformationinfo = mTransformationInfo;
        if (transformationinfo.mTranslationY != f)
        {
            invalidateViewProperty(true, false);
            transformationinfo.mTranslationY = f;
            transformationinfo.mMatrixDirty = true;
            invalidateViewProperty(false, true);
            if (mDisplayList != null)
                mDisplayList.setTranslationY(f);
            if ((0x10000000 & mPrivateFlags2) == 0x10000000)
                invalidateParentIfNeeded();
        }
    }

    public void setVerticalFadingEdgeEnabled(boolean flag)
    {
        if (isVerticalFadingEdgeEnabled() != flag)
        {
            if (flag)
                initScrollCache();
            mViewFlags = 0x2000 ^ mViewFlags;
        }
    }

    public void setVerticalScrollBarEnabled(boolean flag)
    {
        if (isVerticalScrollBarEnabled() != flag)
        {
            mViewFlags = 0x200 ^ mViewFlags;
            computeOpaqueFlags();
            resolvePadding();
        }
    }

    public void setVerticalScrollbarPosition(int i)
    {
        if (mVerticalScrollbarPosition != i)
        {
            mVerticalScrollbarPosition = i;
            computeOpaqueFlags();
            resolvePadding();
        }
    }

    public void setVisibility(int i)
    {
        setFlags(i, 12);
        if (mBackground != null)
        {
            Drawable drawable = mBackground;
            boolean flag;
            if (i == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
    }

    public void setWillNotCacheDrawing(boolean flag)
    {
        int i;
        if (flag)
            i = 0x20000;
        else
            i = 0;
        setFlags(i, 0x20000);
    }

    public void setWillNotDraw(boolean flag)
    {
        char c;
        if (flag)
            c = '\200';
        else
            c = '\0';
        setFlags(c, 128);
    }

    public void setX(float f)
    {
        setTranslationX(f - (float)mLeft);
    }

    public void setY(float f)
    {
        setTranslationY(f - (float)mTop);
    }

    public boolean showContextMenu()
    {
        return getParent().showContextMenuForChild(this);
    }

    public boolean showContextMenu(float f, float f1, int i)
    {
        return showContextMenu();
    }

    public ActionMode startActionMode(ActionMode.Callback callback)
    {
        ViewParent viewparent = getParent();
        if (viewparent == null)
            return null;
        else
            return viewparent.startActionModeForChild(this, callback);
    }

    public void startAnimation(Animation animation)
    {
        animation.setStartTime(-1L);
        setAnimation(animation);
        invalidateParentCaches();
        invalidate(true);
    }

    public final boolean startDrag(ClipData clipdata, DragShadowBuilder dragshadowbuilder, Object obj, int i)
    {
        boolean flag;
        Point point;
        Point point1;
        Surface surface;
        flag = false;
        point = new Point();
        point1 = new Point();
        dragshadowbuilder.onProvideShadowMetrics(point, point1);
        if (point.x < 0 || point.y < 0 || point1.x < 0 || point1.y < 0)
            throw new IllegalStateException("Drag shadow dimensions must not be negative");
        surface = new Surface();
        IBinder ibinder = mAttachInfo.mSession.prepareDrag(mAttachInfo.mWindow, i, point.x, point.y, surface);
        flag = false;
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_260;
        Canvas canvas = surface.lockCanvas(null);
        canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        dragshadowbuilder.onDrawShadow(canvas);
        surface.unlockCanvasAndPost(canvas);
        ViewRootImpl viewrootimpl = getViewRootImpl();
        viewrootimpl.setLocalDragState(obj);
        viewrootimpl.getLastTouchPoint(point);
        flag = mAttachInfo.mSession.performDrag(mAttachInfo.mWindow, ibinder, point.x, point.y, point1.x, point1.y, clipdata);
        surface.release();
        return flag;
        Exception exception1;
        exception1;
        try
        {
            surface.unlockCanvasAndPost(canvas);
            throw exception1;
        }
        catch (Exception exception)
        {
            Log.e("View", "Unable to initiate drag", exception);
        }
        surface.destroy();
        return flag;
    }

    public String toString()
    {
        char c;
        char c1;
        StringBuilder stringbuilder;
        c = 'F';
        c1 = 'D';
        stringbuilder = new StringBuilder(128);
        stringbuilder.append(getClass().getName());
        stringbuilder.append('{');
        stringbuilder.append(Integer.toHexString(System.identityHashCode(this)));
        stringbuilder.append(' ');
        0xc & mViewFlags;
        JVM INSTR lookupswitch 3: default 96
    //                   0: 641
    //                   4: 651
    //                   8: 661;
           goto _L1 _L2 _L3 _L4
_L1:
        stringbuilder.append('.');
_L11:
        String s;
        char c2;
        char c3;
        char c4;
        char c5;
        char c6;
        char c7;
        char c8;
        char c9;
        char c10;
        char c12;
        char c13;
        char c14;
        int i;
        Resources resources;
        String s1;
        String s2;
        if ((1 & mViewFlags) == 1)
            c2 = c;
        else
            c2 = '.';
        stringbuilder.append(c2);
        if ((0x20 & mViewFlags) == 0)
            c3 = 'E';
        else
            c3 = '.';
        stringbuilder.append(c3);
        if ((0x80 & mViewFlags) == 128)
            c4 = '.';
        else
            c4 = c1;
        stringbuilder.append(c4);
        if ((0x100 & mViewFlags) != 0)
            c5 = 'H';
        else
            c5 = '.';
        stringbuilder.append(c5);
        if ((0x200 & mViewFlags) != 0)
            c6 = 'V';
        else
            c6 = '.';
        stringbuilder.append(c6);
        if ((0x4000 & mViewFlags) != 0)
            c7 = 'C';
        else
            c7 = '.';
        stringbuilder.append(c7);
        if ((0x200000 & mViewFlags) != 0)
            c8 = 'L';
        else
            c8 = '.';
        stringbuilder.append(c8);
        stringbuilder.append(' ');
        if ((8 & mPrivateFlags) != 0)
            c9 = 'R';
        else
            c9 = '.';
        stringbuilder.append(c9);
        if ((2 & mPrivateFlags) == 0)
            c = '.';
        stringbuilder.append(c);
        if ((4 & mPrivateFlags) != 0)
            c10 = 'S';
        else
            c10 = '.';
        stringbuilder.append(c10);
        if ((0x2000000 & mPrivateFlags) != 0)
        {
            stringbuilder.append('p');
        } else
        {
            char c11;
            if ((0x4000 & mPrivateFlags) != 0)
                c11 = 'P';
            else
                c11 = '.';
            stringbuilder.append(c11);
        }
        if ((0x10000000 & mPrivateFlags) != 0)
            c12 = 'H';
        else
            c12 = '.';
        stringbuilder.append(c12);
        if ((0x40000000 & mPrivateFlags) != 0)
            c13 = 'A';
        else
            c13 = '.';
        stringbuilder.append(c13);
        if ((0x80000000 & mPrivateFlags) != 0)
            c14 = 'I';
        else
            c14 = '.';
        stringbuilder.append(c14);
        if ((0x600000 & mPrivateFlags) == 0)
            c1 = '.';
        stringbuilder.append(c1);
        stringbuilder.append(' ');
        stringbuilder.append(mLeft);
        stringbuilder.append(',');
        stringbuilder.append(mTop);
        stringbuilder.append('-');
        stringbuilder.append(mRight);
        stringbuilder.append(',');
        stringbuilder.append(mBottom);
        i = getId();
        if (i == -1) goto _L6; else goto _L5
_L5:
        stringbuilder.append(" #");
        stringbuilder.append(Integer.toHexString(i));
        resources = mResources;
        if (i == 0 || resources == null) goto _L6; else goto _L7
_L7:
        0xff000000 & i;
        JVM INSTR lookupswitch 2: default 556
    //                   16777216: 806
    //                   2130706432: 798;
           goto _L8 _L9 _L10
_L8:
        s = resources.getResourcePackageName(i);
_L12:
        s1 = resources.getResourceTypeName(i);
        s2 = resources.getResourceEntryName(i);
        stringbuilder.append(" ");
        stringbuilder.append(s);
        stringbuilder.append(":");
        stringbuilder.append(s1);
        stringbuilder.append("/");
        stringbuilder.append(s2);
_L6:
        stringbuilder.append("}");
        return stringbuilder.toString();
_L2:
        stringbuilder.append('V');
          goto _L11
_L3:
        stringbuilder.append('I');
          goto _L11
_L4:
        stringbuilder.append('G');
          goto _L11
_L10:
        s = "app";
          goto _L12
_L9:
        s = "android";
          goto _L12
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
          goto _L6
    }

    void transformRect(Rect rect)
    {
        if (!getMatrix().isIdentity())
        {
            RectF rectf = mAttachInfo.mTmpTransformRect;
            rectf.set(rect);
            getMatrix().mapRect(rectf);
            rect.set((int)(rectf.left - 0.5F), (int)(rectf.top - 0.5F), (int)(0.5F + rectf.right), (int)(0.5F + rectf.bottom));
        }
    }

    void unFocus()
    {
        if ((2 & mPrivateFlags) != 0)
        {
            mPrivateFlags = -3 & mPrivateFlags;
            onFocusChanged(false, 0, null);
            refreshDrawableState();
            if (AccessibilityManager.getInstance(mContext).isEnabled())
                notifyAccessibilityStateChanged();
        }
    }

    public void unscheduleDrawable(Drawable drawable)
    {
        if (mAttachInfo != null && drawable != null)
            mAttachInfo.mViewRootImpl.mChoreographer.removeCallbacks(1, null, drawable);
    }

    public void unscheduleDrawable(Drawable drawable, Runnable runnable)
    {
label0:
        {
            if (verifyDrawable(drawable) && runnable != null)
            {
                if (mAttachInfo == null)
                    break label0;
                mAttachInfo.mViewRootImpl.mChoreographer.removeCallbacks(1, runnable, drawable);
            }
            return;
        }
        ViewRootImpl.getRunQueue().removeCallbacks(runnable);
    }

    boolean updateLocalSystemUiVisibility(int i, int j)
    {
        int k = mSystemUiVisibility & ~j | i & j;
        if (k != mSystemUiVisibility)
        {
            setSystemUiVisibility(k);
            return true;
        } else
        {
            return false;
        }
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return drawable == mBackground;
    }

    public boolean willNotCacheDrawing()
    {
        return (0x20000 & mViewFlags) == 0x20000;
    }

    public boolean willNotDraw()
    {
        return (0x80 & mViewFlags) == 128;
    }

    static 
    {
        if (VIEW_STATE_IDS.length / 2 != com.android.internal.R.styleable.ViewDrawableStates.length)
            throw new IllegalStateException("VIEW_STATE_IDs array length does not match ViewDrawableStates style array");
        int ai[] = new int[VIEW_STATE_IDS.length];
        for (int i = 0; i < com.android.internal.R.styleable.ViewDrawableStates.length; i++)
        {
            int j1 = com.android.internal.R.styleable.ViewDrawableStates[i];
            for (int k1 = 0; k1 < VIEW_STATE_IDS.length; k1 += 2)
                if (VIEW_STATE_IDS[k1] == j1)
                {
                    ai[i * 2] = j1;
                    ai[1 + i * 2] = VIEW_STATE_IDS[k1 + 1];
                }

        }

        VIEW_STATE_SETS = new int[1 << VIEW_STATE_IDS.length / 2][];
        for (int j = 0; j < VIEW_STATE_SETS.length; j++)
        {
            int ai1[] = new int[Integer.bitCount(j)];
            int k = 0;
            for (int l = 0; l < ai.length; l += 2)
                if ((j & ai[l + 1]) != 0)
                {
                    int i1 = k + 1;
                    ai1[k] = ai[l];
                    k = i1;
                }

            VIEW_STATE_SETS[j] = ai1;
        }

        EMPTY_STATE_SET = VIEW_STATE_SETS[0];
        WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[1];
        SELECTED_STATE_SET = VIEW_STATE_SETS[2];
        SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[3];
        FOCUSED_STATE_SET = VIEW_STATE_SETS[4];
        FOCUSED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[5];
        FOCUSED_SELECTED_STATE_SET = VIEW_STATE_SETS[6];
        FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[7];
        ENABLED_STATE_SET = VIEW_STATE_SETS[8];
        ENABLED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[9];
        ENABLED_SELECTED_STATE_SET = VIEW_STATE_SETS[10];
        ENABLED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[11];
        ENABLED_FOCUSED_STATE_SET = VIEW_STATE_SETS[12];
        ENABLED_FOCUSED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[13];
        ENABLED_FOCUSED_SELECTED_STATE_SET = VIEW_STATE_SETS[14];
        ENABLED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[15];
        PRESSED_STATE_SET = VIEW_STATE_SETS[16];
        PRESSED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[17];
        PRESSED_SELECTED_STATE_SET = VIEW_STATE_SETS[18];
        PRESSED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[19];
        PRESSED_FOCUSED_STATE_SET = VIEW_STATE_SETS[20];
        PRESSED_FOCUSED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[21];
        PRESSED_FOCUSED_SELECTED_STATE_SET = VIEW_STATE_SETS[22];
        PRESSED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[23];
        PRESSED_ENABLED_STATE_SET = VIEW_STATE_SETS[24];
        PRESSED_ENABLED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[25];
        PRESSED_ENABLED_SELECTED_STATE_SET = VIEW_STATE_SETS[26];
        PRESSED_ENABLED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[27];
        PRESSED_ENABLED_FOCUSED_STATE_SET = VIEW_STATE_SETS[28];
        PRESSED_ENABLED_FOCUSED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[29];
        PRESSED_ENABLED_FOCUSED_SELECTED_STATE_SET = VIEW_STATE_SETS[30];
        PRESSED_ENABLED_FOCUSED_SELECTED_WINDOW_FOCUSED_STATE_SET = VIEW_STATE_SETS[31];
    }


/*
    static boolean access$2302(View view, boolean flag)
    {
        view.mHasPerformedLongPress = flag;
        return flag;
    }

*/


}
