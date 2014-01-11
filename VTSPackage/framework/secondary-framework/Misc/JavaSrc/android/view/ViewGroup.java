// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.*;
import android.os.SystemClock;
import android.util.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.view.animation.Transformation;
import com.android.internal.util.Predicate;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package android.view:
//            View, ViewParent, ViewManager, MotionEvent, 
//            DragEvent, ViewRootImpl, InputEventConsistencyVerifier, FocusFinder, 
//            DisplayList, KeyEvent, ActionMode

public abstract class ViewGroup extends View
    implements ViewParent, ViewManager
{
    static class ChildListForAccessibility
    {

        private static final int MAX_POOL_SIZE = 32;
        private static ChildListForAccessibility sPool;
        private static final Object sPoolLock = new Object();
        private static int sPoolSize;
        private final ArrayList mChildren = new ArrayList();
        private final ArrayList mHolders = new ArrayList();
        private boolean mIsPooled;
        private ChildListForAccessibility mNext;

        private void clear()
        {
            mChildren.clear();
        }

        private void init(ViewGroup viewgroup, boolean flag)
        {
            ArrayList arraylist = mChildren;
            int i = viewgroup.getChildCount();
            for (int j = 0; j < i; j++)
                arraylist.add(viewgroup.getChildAt(j));

            if (flag)
            {
                ArrayList arraylist1 = mHolders;
                for (int k = 0; k < i; k++)
                    arraylist1.add(ViewLocationHolder.obtain(viewgroup, (View)arraylist.get(k)));

                Collections.sort(arraylist1);
                for (int l = 0; l < i; l++)
                {
                    ViewLocationHolder viewlocationholder = (ViewLocationHolder)arraylist1.get(l);
                    arraylist.set(l, viewlocationholder.mView);
                    viewlocationholder.recycle();
                }

                arraylist1.clear();
            }
        }

        public static ChildListForAccessibility obtain(ViewGroup viewgroup, boolean flag)
        {
            Object obj = sPoolLock;
            obj;
            JVM INSTR monitorenter ;
            ChildListForAccessibility childlistforaccessibility;
            if (sPool == null)
                break MISSING_BLOCK_LABEL_57;
            childlistforaccessibility = sPool;
            sPool = childlistforaccessibility.mNext;
            childlistforaccessibility.mNext = null;
            childlistforaccessibility.mIsPooled = false;
            sPoolSize = -1 + sPoolSize;
_L1:
            childlistforaccessibility.init(viewgroup, flag);
            return childlistforaccessibility;
            childlistforaccessibility = new ChildListForAccessibility();
              goto _L1
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public View getChildAt(int i)
        {
            return (View)mChildren.get(i);
        }

        public int getChildCount()
        {
            return mChildren.size();
        }

        public int getChildIndex(View view)
        {
            return mChildren.indexOf(view);
        }

        public void recycle()
        {
            if (mIsPooled)
                throw new IllegalStateException("Instance already recycled.");
            clear();
            synchronized (sPoolLock)
            {
                if (sPoolSize < 32)
                {
                    mNext = sPool;
                    mIsPooled = true;
                    sPool = this;
                    sPoolSize = 1 + sPoolSize;
                }
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }


    }

    private static final class HoverTarget
    {

        private static final int MAX_RECYCLED = 32;
        private static HoverTarget sRecycleBin;
        private static final Object sRecycleLock = new Object();
        private static int sRecycledCount;
        public View child;
        public HoverTarget next;

        public static HoverTarget obtain(View view)
        {
            Object obj = sRecycleLock;
            obj;
            JVM INSTR monitorenter ;
            HoverTarget hovertarget;
            if (sRecycleBin != null)
                break MISSING_BLOCK_LABEL_29;
            hovertarget = new HoverTarget();
_L2:
            hovertarget.child = view;
            return hovertarget;
            hovertarget = sRecycleBin;
            sRecycleBin = hovertarget.next;
            sRecycledCount = -1 + sRecycledCount;
            hovertarget.next = null;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void recycle()
        {
            Object obj = sRecycleLock;
            obj;
            JVM INSTR monitorenter ;
            if (sRecycledCount >= 32)
                break MISSING_BLOCK_LABEL_41;
            next = sRecycleBin;
            sRecycleBin = this;
            sRecycledCount = 1 + sRecycledCount;
_L2:
            child = null;
            return;
            next = null;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }


        private HoverTarget()
        {
        }
    }

    public static class LayoutParams
    {

        public static final int FILL_PARENT = -1;
        public static final int MATCH_PARENT = -1;
        public static final int WRAP_CONTENT = -2;
        public int height;
        public android.view.animation.LayoutAnimationController.AnimationParameters layoutAnimationParameters;
        public int width;

        protected static String sizeToString(int i)
        {
            if (i == -2)
                return "wrap-content";
            if (i == -1)
                return "match-parent";
            else
                return String.valueOf(i);
        }

        public String debug(String s)
        {
            return (new StringBuilder()).append(s).append("ViewGroup.LayoutParams={ width=").append(sizeToString(width)).append(", height=").append(sizeToString(height)).append(" }").toString();
        }

        public void onDebugDraw(View view, Canvas canvas)
        {
        }

        public void resolveLayoutDirection(int i)
        {
        }

        protected void setBaseAttributes(TypedArray typedarray, int i, int j)
        {
            width = typedarray.getLayoutDimension(i, "layout_width");
            height = typedarray.getLayoutDimension(j, "layout_height");
        }


        public LayoutParams(int i, int j)
        {
            width = i;
            height = j;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewGroup_Layout);
            setBaseAttributes(typedarray, 0, 1);
            typedarray.recycle();
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            width = layoutparams.width;
            height = layoutparams.height;
        }
    }

    public static class MarginLayoutParams extends LayoutParams
    {

        public static final int DEFAULT_RELATIVE = 0x80000000;
        private static int LAYOUT_DIRECTION_UNDEFINED = -1;
        public int bottomMargin;
        private int endMargin;
        private int initialLeftMargin;
        private int initialRightMargin;
        private int layoutDirection;
        public int leftMargin;
        public int rightMargin;
        private int startMargin;
        public int topMargin;

        public int getLayoutDirection()
        {
            return layoutDirection;
        }

        public int getMarginEnd()
        {
            if (endMargin != 0x80000000)
                return endMargin;
            switch (layoutDirection)
            {
            case 1: // '\001'
                return leftMargin;
            }
            return rightMargin;
        }

        public int getMarginStart()
        {
            if (startMargin != 0x80000000)
                return startMargin;
            switch (layoutDirection)
            {
            case 1: // '\001'
                return rightMargin;
            }
            return leftMargin;
        }

        public boolean isLayoutRtl()
        {
            return layoutDirection == 1;
        }

        public boolean isMarginRelative()
        {
            return startMargin != 0x80000000 || endMargin != 0x80000000;
        }

        public void onDebugDraw(View view, Canvas canvas)
        {
            ViewGroup.drawRect(canvas, view.getLeft() - leftMargin, view.getTop() - topMargin, view.getRight() + rightMargin, view.getBottom() + bottomMargin, -65281);
        }

        public void resolveLayoutDirection(int i)
        {
            setLayoutDirection(i);
            if (!isMarginRelative())
                return;
            switch (i)
            {
            case 1: // '\001'
                int l;
                if (endMargin > 0x80000000)
                    l = endMargin;
                else
                    l = initialLeftMargin;
                leftMargin = l;
                int i1;
                if (startMargin > 0x80000000)
                    i1 = startMargin;
                else
                    i1 = initialRightMargin;
                rightMargin = i1;
                return;
            }
            int j;
            if (startMargin > 0x80000000)
                j = startMargin;
            else
                j = initialLeftMargin;
            leftMargin = j;
            int k;
            if (endMargin > 0x80000000)
                k = endMargin;
            else
                k = initialRightMargin;
            rightMargin = k;
        }

        public void setLayoutDirection(int i)
        {
            if (i != 0 && i != 1)
            {
                return;
            } else
            {
                layoutDirection = i;
                return;
            }
        }

        public void setMarginEnd(int i)
        {
            endMargin = i;
        }

        public void setMarginStart(int i)
        {
            startMargin = i;
        }

        public void setMargins(int i, int j, int k, int l)
        {
            leftMargin = i;
            topMargin = j;
            rightMargin = k;
            bottomMargin = l;
            initialLeftMargin = i;
            initialRightMargin = k;
        }

        public void setMarginsRelative(int i, int j, int k, int l)
        {
            startMargin = i;
            topMargin = j;
            endMargin = k;
            bottomMargin = l;
            initialLeftMargin = 0;
            initialRightMargin = 0;
        }


        public MarginLayoutParams(int i, int j)
        {
            super(i, j);
            startMargin = 0x80000000;
            endMargin = 0x80000000;
            layoutDirection = LAYOUT_DIRECTION_UNDEFINED;
        }

        public MarginLayoutParams(Context context, AttributeSet attributeset)
        {
            startMargin = 0x80000000;
            endMargin = 0x80000000;
            layoutDirection = LAYOUT_DIRECTION_UNDEFINED;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewGroup_MarginLayout);
            setBaseAttributes(typedarray, 0, 1);
            int i = typedarray.getDimensionPixelSize(2, -1);
            if (i >= 0)
            {
                leftMargin = i;
                topMargin = i;
                rightMargin = i;
                bottomMargin = i;
            } else
            {
                leftMargin = typedarray.getDimensionPixelSize(3, 0);
                topMargin = typedarray.getDimensionPixelSize(4, 0);
                rightMargin = typedarray.getDimensionPixelSize(5, 0);
                bottomMargin = typedarray.getDimensionPixelSize(6, 0);
                startMargin = typedarray.getDimensionPixelSize(7, 0x80000000);
                endMargin = typedarray.getDimensionPixelSize(8, 0x80000000);
            }
            initialLeftMargin = leftMargin;
            initialRightMargin = rightMargin;
            typedarray.recycle();
        }

        public MarginLayoutParams(LayoutParams layoutparams)
        {
            super(layoutparams);
            startMargin = 0x80000000;
            endMargin = 0x80000000;
            layoutDirection = LAYOUT_DIRECTION_UNDEFINED;
        }

        public MarginLayoutParams(MarginLayoutParams marginlayoutparams)
        {
            startMargin = 0x80000000;
            endMargin = 0x80000000;
            layoutDirection = LAYOUT_DIRECTION_UNDEFINED;
            super.width = ((LayoutParams) (marginlayoutparams)).width;
            super.height = ((LayoutParams) (marginlayoutparams)).height;
            leftMargin = marginlayoutparams.leftMargin;
            topMargin = marginlayoutparams.topMargin;
            rightMargin = marginlayoutparams.rightMargin;
            bottomMargin = marginlayoutparams.bottomMargin;
            startMargin = marginlayoutparams.startMargin;
            endMargin = marginlayoutparams.endMargin;
            initialLeftMargin = marginlayoutparams.leftMargin;
            initialRightMargin = marginlayoutparams.rightMargin;
            setLayoutDirection(marginlayoutparams.layoutDirection);
        }
    }

    public static interface OnHierarchyChangeListener
    {

        public abstract void onChildViewAdded(View view, View view1);

        public abstract void onChildViewRemoved(View view, View view1);
    }

    private static final class TouchTarget
    {

        public static final int ALL_POINTER_IDS = -1;
        private static final int MAX_RECYCLED = 32;
        private static TouchTarget sRecycleBin;
        private static final Object sRecycleLock = new Object();
        private static int sRecycledCount;
        public View child;
        public TouchTarget next;
        public int pointerIdBits;

        public static TouchTarget obtain(View view, int i)
        {
            Object obj = sRecycleLock;
            obj;
            JVM INSTR monitorenter ;
            TouchTarget touchtarget;
            if (sRecycleBin != null)
                break MISSING_BLOCK_LABEL_38;
            touchtarget = new TouchTarget();
_L2:
            touchtarget.child = view;
            touchtarget.pointerIdBits = i;
            return touchtarget;
            touchtarget = sRecycleBin;
            sRecycleBin = touchtarget.next;
            sRecycledCount = -1 + sRecycledCount;
            touchtarget.next = null;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void recycle()
        {
            Object obj = sRecycleLock;
            obj;
            JVM INSTR monitorenter ;
            if (sRecycledCount >= 32)
                break MISSING_BLOCK_LABEL_41;
            next = sRecycleBin;
            sRecycleBin = this;
            sRecycledCount = 1 + sRecycledCount;
_L2:
            child = null;
            return;
            next = null;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }


        private TouchTarget()
        {
        }
    }

    static class ViewLocationHolder
        implements Comparable
    {

        private static final int MAX_POOL_SIZE = 32;
        private static ViewLocationHolder sPool;
        private static final Object sPoolLock = new Object();
        private static int sPoolSize;
        private boolean mIsPooled;
        private int mLayoutDirection;
        private final Rect mLocation = new Rect();
        private ViewLocationHolder mNext;
        public View mView;

        private void clear()
        {
            mView = null;
            mLocation.set(0, 0, 0, 0);
        }

        private void init(ViewGroup viewgroup, View view)
        {
            Rect rect = mLocation;
            view.getDrawingRect(rect);
            viewgroup.offsetDescendantRectToMyCoords(view, rect);
            mView = view;
            mLayoutDirection = viewgroup.getLayoutDirection();
        }

        public static ViewLocationHolder obtain(ViewGroup viewgroup, View view)
        {
            Object obj = sPoolLock;
            obj;
            JVM INSTR monitorenter ;
            ViewLocationHolder viewlocationholder;
            if (sPool == null)
                break MISSING_BLOCK_LABEL_57;
            viewlocationholder = sPool;
            sPool = viewlocationholder.mNext;
            viewlocationholder.mNext = null;
            viewlocationholder.mIsPooled = false;
            sPoolSize = -1 + sPoolSize;
_L1:
            viewlocationholder.init(viewgroup, view);
            return viewlocationholder;
            viewlocationholder = new ViewLocationHolder();
              goto _L1
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int compareTo(ViewLocationHolder viewlocationholder)
        {
label0:
            {
label1:
                {
                    int i = 1;
                    if (viewlocationholder != null && getClass() == viewlocationholder.getClass())
                    {
                        if (mLocation.bottom - viewlocationholder.mLocation.top <= 0)
                            return -1;
                        if (mLocation.top - viewlocationholder.mLocation.bottom < 0)
                        {
                            if (mLayoutDirection != 0)
                                break label1;
                            i = mLocation.left - viewlocationholder.mLocation.left;
                            if (i == 0)
                                break label0;
                        }
                    }
                    return i;
                }
                int j = mLocation.right - viewlocationholder.mLocation.right;
                if (j != 0)
                    return -j;
            }
            int k = mLocation.top - viewlocationholder.mLocation.top;
            if (k != 0)
                return k;
            int l = mLocation.height() - viewlocationholder.mLocation.height();
            if (l != 0)
                return -l;
            int i1 = mLocation.width() - viewlocationholder.mLocation.width();
            if (i1 != 0)
                return -i1;
            else
                return mView.getAccessibilityViewId() - viewlocationholder.mView.getAccessibilityViewId();
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((ViewLocationHolder)obj);
        }

        public void recycle()
        {
            if (mIsPooled)
                throw new IllegalStateException("Instance already recycled.");
            clear();
            synchronized (sPoolLock)
            {
                if (sPoolSize < 32)
                {
                    mNext = sPool;
                    mIsPooled = true;
                    sPool = this;
                    sPoolSize = 1 + sPoolSize;
                }
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }


    }


    private static final int ARRAY_CAPACITY_INCREMENT = 12;
    private static final int ARRAY_INITIAL_CAPACITY = 12;
    private static final int CHILD_LEFT_INDEX = 0;
    private static final int CHILD_TOP_INDEX = 1;
    public static final int CLIP_BOUNDS = 0;
    protected static final int CLIP_TO_PADDING_MASK = 34;
    private static final boolean DBG = false;
    private static final boolean DBG_MOTION = false;
    private static final int DESCENDANT_FOCUSABILITY_FLAGS[] = {
        0x20000, 0x40000, 0x60000
    };
    private static final int FLAG_ADD_STATES_FROM_CHILDREN = 8192;
    static final int FLAG_ALPHA_LOWER_THAN_ONE = 4096;
    static final int FLAG_ALWAYS_DRAWN_WITH_CACHE = 16384;
    private static final int FLAG_ANIMATION_CACHE = 64;
    static final int FLAG_ANIMATION_DONE = 16;
    static final int FLAG_CHILDREN_DRAWN_WITH_CACHE = 32768;
    static final int FLAG_CLEAR_TRANSFORMATION = 256;
    static final int FLAG_CLIP_CHILDREN = 1;
    private static final int FLAG_CLIP_TO_PADDING = 2;
    protected static final int FLAG_DISALLOW_INTERCEPT = 0x80000;
    static final int FLAG_INVALIDATE_REQUIRED = 4;
    private static final int FLAG_MASK_FOCUSABILITY = 0x60000;
    private static final int FLAG_NOTIFY_ANIMATION_LISTENER = 512;
    private static final int FLAG_NOTIFY_CHILDREN_ON_DRAWABLE_STATE_CHANGE = 0x10000;
    static final int FLAG_OPTIMIZE_INVALIDATE = 128;
    private static final int FLAG_PADDING_NOT_NULL = 32;
    private static final int FLAG_PREVENT_DISPATCH_ATTACHED_TO_WINDOW = 0x400000;
    private static final int FLAG_RUN_ANIMATION = 8;
    private static final int FLAG_SPLIT_MOTION_EVENTS = 0x200000;
    protected static final int FLAG_SUPPORT_STATIC_TRANSFORMATIONS = 2048;
    protected static final int FLAG_USE_CHILD_DRAWING_ORDER = 1024;
    public static final int FOCUS_AFTER_DESCENDANTS = 0x40000;
    public static final int FOCUS_BEFORE_DESCENDANTS = 0x20000;
    public static final int FOCUS_BLOCK_DESCENDANTS = 0x60000;
    public static final int OPTICAL_BOUNDS = 1;
    public static final int PERSISTENT_ALL_CACHES = 3;
    public static final int PERSISTENT_ANIMATION_CACHE = 1;
    public static final int PERSISTENT_NO_CACHE = 0;
    public static final int PERSISTENT_SCROLLING_CACHE = 2;
    private static final String TAG = "ViewGroup";
    private static float sDebugLines[];
    private static Paint sDebugPaint;
    private android.view.animation.Animation.AnimationListener mAnimationListener;
    Paint mCachePaint;
    private boolean mChildAcceptsDrag;
    private int mChildCountWithTransientState;
    final Transformation mChildTransformation;
    private View mChildren[];
    private int mChildrenCount;
    private DragEvent mCurrentDrag;
    private View mCurrentDragView;
    protected ArrayList mDisappearingChildren;
    private HashSet mDragNotifiedChildren;
    private HoverTarget mFirstHoverTarget;
    private TouchTarget mFirstTouchTarget;
    private View mFocused;
    protected int mGroupFlags;
    private boolean mHoveredSelf;
    RectF mInvalidateRegion;
    Transformation mInvalidationTransformation;
    private int mLastTouchDownIndex;
    private long mLastTouchDownTime;
    private float mLastTouchDownX;
    private float mLastTouchDownY;
    private LayoutAnimationController mLayoutAnimationController;
    private int mLayoutMode;
    private boolean mLayoutSuppressed;
    private android.animation.LayoutTransition.TransitionListener mLayoutTransitionListener = new android.animation.LayoutTransition.TransitionListener() {

        final ViewGroup this$0;

        public void endTransition(LayoutTransition layouttransition, ViewGroup viewgroup, View view, int i)
        {
            if (mLayoutSuppressed && !layouttransition.isChangingLayout())
            {
                requestLayout();
                mLayoutSuppressed = false;
            }
            if (i == 3 && mTransitioningViews != null)
                endViewTransition(view);
        }

        public void startTransition(LayoutTransition layouttransition, ViewGroup viewgroup, View view, int i)
        {
            if (i == 3)
                startViewTransition(view);
        }

            
            {
                this$0 = ViewGroup.this;
                super();
            }
    }
;
    private final PointF mLocalPoint;
    protected OnHierarchyChangeListener mOnHierarchyChangeListener;
    protected int mPersistentDrawingCache;
    private LayoutTransition mTransition;
    private ArrayList mTransitioningViews;
    private ArrayList mVisibilityChangingChildren;

    public ViewGroup(Context context)
    {
        super(context);
        mChildTransformation = new Transformation();
        mLocalPoint = new PointF();
        mLastTouchDownIndex = -1;
        mLayoutMode = 0;
        mLayoutSuppressed = false;
        mChildCountWithTransientState = 0;
        initViewGroup();
    }

    public ViewGroup(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mChildTransformation = new Transformation();
        mLocalPoint = new PointF();
        mLastTouchDownIndex = -1;
        mLayoutMode = 0;
        mLayoutSuppressed = false;
        mChildCountWithTransientState = 0;
        initViewGroup();
        initFromAttributes(context, attributeset);
    }

    public ViewGroup(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mChildTransformation = new Transformation();
        mLocalPoint = new PointF();
        mLastTouchDownIndex = -1;
        mLayoutMode = 0;
        mLayoutSuppressed = false;
        mChildCountWithTransientState = 0;
        initViewGroup();
        initFromAttributes(context, attributeset);
    }

    private void addDisappearingView(View view)
    {
        ArrayList arraylist = mDisappearingChildren;
        if (arraylist == null)
        {
            arraylist = new ArrayList();
            mDisappearingChildren = arraylist;
        }
        arraylist.add(view);
    }

    private void addInArray(View view, int i)
    {
        int j;
label0:
        {
            View aview[] = mChildren;
            j = mChildrenCount;
            int k = aview.length;
            if (i == j)
            {
                if (k == j)
                {
                    mChildren = new View[k + 12];
                    System.arraycopy(aview, 0, mChildren, 0, k);
                    aview = mChildren;
                }
                int l = mChildrenCount;
                mChildrenCount = l + 1;
                aview[l] = view;
            } else
            {
                if (i >= j)
                    break label0;
                if (k == j)
                {
                    mChildren = new View[k + 12];
                    System.arraycopy(aview, 0, mChildren, 0, i);
                    System.arraycopy(aview, i, mChildren, i + 1, j - i);
                    aview = mChildren;
                } else
                {
                    System.arraycopy(aview, i, aview, i + 1, j - i);
                }
                aview[i] = view;
                mChildrenCount = 1 + mChildrenCount;
                if (mLastTouchDownIndex >= i)
                {
                    mLastTouchDownIndex = 1 + mLastTouchDownIndex;
                    return;
                }
            }
            return;
        }
        throw new IndexOutOfBoundsException((new StringBuilder()).append("index=").append(i).append(" count=").append(j).toString());
    }

    private TouchTarget addTouchTarget(View view, int i)
    {
        TouchTarget touchtarget = TouchTarget.obtain(view, i);
        touchtarget.next = mFirstTouchTarget;
        mFirstTouchTarget = touchtarget;
        return touchtarget;
    }

    private void addViewInner(View view, int i, LayoutParams layoutparams, boolean flag)
    {
        if (mTransition != null)
            mTransition.cancel(3);
        if (view.getParent() != null)
            throw new IllegalStateException("The specified child already has a parent. You must call removeView() on the child's parent first.");
        if (mTransition != null)
            mTransition.addChild(this, view);
        if (!checkLayoutParams(layoutparams))
            layoutparams = generateLayoutParams(layoutparams);
        if (flag)
            view.mLayoutParams = layoutparams;
        else
            view.setLayoutParams(layoutparams);
        if (i < 0)
            i = mChildrenCount;
        addInArray(view, i);
        if (flag)
            view.assignParent(this);
        else
            view.mParent = this;
        if (view.hasFocus())
            requestChildFocus(view, view.findFocus());
        View.AttachInfo attachinfo = super.mAttachInfo;
        if (attachinfo != null && (0x400000 & mGroupFlags) == 0)
        {
            boolean flag1 = attachinfo.mKeepScreenOn;
            attachinfo.mKeepScreenOn = false;
            view.dispatchAttachedToWindow(super.mAttachInfo, 0xc & super.mViewFlags);
            if (attachinfo.mKeepScreenOn)
                needGlobalAttributesUpdate(true);
            attachinfo.mKeepScreenOn = flag1;
        }
        if (view.isLayoutDirectionInherited())
            view.resetRtlProperties();
        onViewAdded(view);
        if ((0x400000 & view.mViewFlags) == 0x400000)
            mGroupFlags = 0x10000 | mGroupFlags;
        if (view.hasTransientState())
            childHasTransientStateChanged(view, true);
    }

    private void bindLayoutAnimation(View view)
    {
        view.setAnimation(mLayoutAnimationController.getAnimationForView(view));
    }

    private static boolean canViewReceivePointerEvents(View view)
    {
        return (0xc & view.mViewFlags) == 0 || view.getAnimation() != null;
    }

    private void cancelAndClearTouchTargets(MotionEvent motionevent)
    {
        if (mFirstTouchTarget != null)
        {
            boolean flag = false;
            if (motionevent == null)
            {
                long l = SystemClock.uptimeMillis();
                motionevent = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
                motionevent.setSource(4098);
                flag = true;
            }
            for (TouchTarget touchtarget = mFirstTouchTarget; touchtarget != null; touchtarget = touchtarget.next)
            {
                resetCancelNextUpFlag(touchtarget.child);
                dispatchTransformedTouchEvent(motionevent, true, touchtarget.child, touchtarget.pointerIdBits);
            }

            clearTouchTargets();
            if (flag)
                motionevent.recycle();
        }
    }

    private void cancelHoverTarget(View view)
    {
        HoverTarget hovertarget = null;
        HoverTarget hovertarget1 = mFirstHoverTarget;
        do
        {
            HoverTarget hovertarget2;
label0:
            {
                if (hovertarget1 != null)
                {
                    hovertarget2 = hovertarget1.next;
                    if (hovertarget1.child != view)
                        break label0;
                    if (hovertarget == null)
                        mFirstHoverTarget = hovertarget2;
                    else
                        hovertarget.next = hovertarget2;
                    hovertarget1.recycle();
                    long l = SystemClock.uptimeMillis();
                    MotionEvent motionevent = MotionEvent.obtain(l, l, 10, 0.0F, 0.0F, 0);
                    motionevent.setSource(4098);
                    view.dispatchHoverEvent(motionevent);
                    motionevent.recycle();
                }
                return;
            }
            hovertarget = hovertarget1;
            hovertarget1 = hovertarget2;
        } while (true);
    }

    private void cancelTouchTarget(View view)
    {
        TouchTarget touchtarget = null;
        TouchTarget touchtarget1 = mFirstTouchTarget;
        do
        {
            TouchTarget touchtarget2;
label0:
            {
                if (touchtarget1 != null)
                {
                    touchtarget2 = touchtarget1.next;
                    if (touchtarget1.child != view)
                        break label0;
                    if (touchtarget == null)
                        mFirstTouchTarget = touchtarget2;
                    else
                        touchtarget.next = touchtarget2;
                    touchtarget1.recycle();
                    long l = SystemClock.uptimeMillis();
                    MotionEvent motionevent = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
                    motionevent.setSource(4098);
                    view.dispatchTouchEvent(motionevent);
                    motionevent.recycle();
                }
                return;
            }
            touchtarget = touchtarget1;
            touchtarget1 = touchtarget2;
        } while (true);
    }

    private void clearTouchTargets()
    {
        TouchTarget touchtarget = mFirstTouchTarget;
        if (touchtarget != null)
        {
            do
            {
                TouchTarget touchtarget1 = touchtarget.next;
                touchtarget.recycle();
                touchtarget = touchtarget1;
            } while (touchtarget != null);
            mFirstTouchTarget = null;
        }
    }

    private boolean debugDraw()
    {
        return super.mAttachInfo != null && super.mAttachInfo.mDebugLayout;
    }

    private boolean dispatchTransformedGenericPointerEvent(MotionEvent motionevent, View view)
    {
        float f = super.mScrollX - view.mLeft;
        float f1 = super.mScrollY - view.mTop;
        if (!view.hasIdentityMatrix())
        {
            MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
            motionevent1.offsetLocation(f, f1);
            motionevent1.transform(view.getInverseMatrix());
            boolean flag1 = view.dispatchGenericMotionEvent(motionevent1);
            motionevent1.recycle();
            return flag1;
        } else
        {
            motionevent.offsetLocation(f, f1);
            boolean flag = view.dispatchGenericMotionEvent(motionevent);
            motionevent.offsetLocation(-f, -f1);
            return flag;
        }
    }

    private boolean dispatchTransformedTouchEvent(MotionEvent motionevent, boolean flag, View view, int i)
    {
        int j = motionevent.getAction();
        if (!flag && j != 3)
        {
            int k = motionevent.getPointerIdBits();
            int l = k & i;
            if (l == 0)
            {
                Xlog.i("ViewGroup", (new StringBuilder()).append("Dispatch transformed touch event without pointers in ").append(this).toString());
                return false;
            }
            MotionEvent motionevent1;
            if (l == k)
            {
                if (view != null && !view.hasIdentityMatrix())
                    motionevent1 = MotionEvent.obtain(motionevent);
                else
                if (view == null)
                {
                    return super.dispatchTouchEvent(motionevent);
                } else
                {
                    float f = super.mScrollX - view.mLeft;
                    float f1 = super.mScrollY - view.mTop;
                    motionevent.offsetLocation(f, f1);
                    boolean flag3 = view.dispatchTouchEvent(motionevent);
                    motionevent.offsetLocation(-f, -f1);
                    return flag3;
                }
            } else
            {
                motionevent1 = motionevent.split(l);
            }
            boolean flag2;
            if (view == null)
            {
                flag2 = super.dispatchTouchEvent(motionevent1);
            } else
            {
                motionevent1.offsetLocation(super.mScrollX - view.mLeft, super.mScrollY - view.mTop);
                if (!view.hasIdentityMatrix())
                    motionevent1.transform(view.getInverseMatrix());
                flag2 = view.dispatchTouchEvent(motionevent1);
            }
            motionevent1.recycle();
            return flag2;
        }
        motionevent.setAction(3);
        boolean flag1;
        if (view == null)
            flag1 = super.dispatchTouchEvent(motionevent);
        else
            flag1 = view.dispatchTouchEvent(motionevent);
        motionevent.setAction(j);
        return flag1;
    }

    private static void drawRect(Canvas canvas, int i, int j, int k, int l, int i1)
    {
        Paint paint = getDebugPaint();
        paint.setColor(i1);
        canvas.drawLines(getDebugLines(i, j, k, l), paint);
    }

    private void exitHoverTargets()
    {
        if (mHoveredSelf || mFirstHoverTarget != null)
        {
            long l = SystemClock.uptimeMillis();
            MotionEvent motionevent = MotionEvent.obtain(l, l, 10, 0.0F, 0.0F, 0);
            motionevent.setSource(4098);
            dispatchHoverEvent(motionevent);
            motionevent.recycle();
        }
    }

    public static int getChildMeasureSpec(int i, int j, int k)
    {
        int l = View.MeasureSpec.getMode(i);
        int i1 = Math.max(0, View.MeasureSpec.getSize(i) - j);
        int j1 = 0;
        int k1 = 0;
        switch (l)
        {
        default:
            break;

        case 0: // '\0'
            if (k >= 0)
            {
                k1 = k;
                j1 = 0x40000000;
                break;
            }
            if (k == -1)
            {
                j1 = 0;
                k1 = 0;
                break;
            }
            j1 = 0;
            k1 = 0;
            if (k == -2)
            {
                j1 = 0;
                k1 = 0;
            }
            break;

        case -2147483648: 
            if (k >= 0)
            {
                k1 = k;
                j1 = 0x40000000;
                break;
            }
            if (k == -1)
            {
                k1 = i1;
                j1 = 0x80000000;
                break;
            }
            j1 = 0;
            k1 = 0;
            if (k == -2)
            {
                k1 = i1;
                j1 = 0x80000000;
            }
            break;

        case 1073741824: 
            if (k >= 0)
            {
                k1 = k;
                j1 = 0x40000000;
                break;
            }
            if (k == -1)
            {
                k1 = i1;
                j1 = 0x40000000;
                break;
            }
            j1 = 0;
            k1 = 0;
            if (k == -2)
            {
                k1 = i1;
                j1 = 0x80000000;
            }
            break;
        }
        return View.MeasureSpec.makeMeasureSpec(k1, j1);
    }

    private static float[] getDebugLines(int i, int j, int k, int l)
    {
        if (sDebugLines == null)
            sDebugLines = new float[16];
        int i1 = k - 1;
        int j1 = l - 1;
        sDebugLines[0] = i;
        sDebugLines[1] = j;
        sDebugLines[2] = i1;
        sDebugLines[3] = j;
        sDebugLines[4] = i1;
        sDebugLines[5] = j;
        sDebugLines[6] = i1;
        sDebugLines[7] = j1 + 1;
        sDebugLines[8] = i1 + 1;
        sDebugLines[9] = j1;
        sDebugLines[10] = i;
        sDebugLines[11] = j1;
        sDebugLines[12] = i;
        sDebugLines[13] = j1;
        sDebugLines[14] = i;
        sDebugLines[15] = j;
        return sDebugLines;
    }

    private static Paint getDebugPaint()
    {
        if (sDebugPaint == null)
        {
            sDebugPaint = new Paint();
            sDebugPaint.setAntiAlias(false);
        }
        return sDebugPaint;
    }

    private TouchTarget getTouchTarget(View view)
    {
        for (TouchTarget touchtarget = mFirstTouchTarget; touchtarget != null; touchtarget = touchtarget.next)
            if (touchtarget.child == view)
                return touchtarget;

        return null;
    }

    private void initFromAttributes(Context context, AttributeSet attributeset)
    {
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewGroup);
        int i = typedarray.getIndexCount();
        for (int j = 0; j < i; j++)
        {
            int k = typedarray.getIndex(j);
            switch (k)
            {
            default:
                break;

            case 9: // '\t'
                if (typedarray.getBoolean(k, false))
                    setLayoutTransition(new LayoutTransition());
                break;

            case 8: // '\b'
                setMotionEventSplittingEnabled(typedarray.getBoolean(k, false));
                break;

            case 7: // '\007'
                setDescendantFocusability(DESCENDANT_FOCUSABILITY_FLAGS[typedarray.getInt(k, 0)]);
                break;

            case 2: // '\002'
                int l = typedarray.getResourceId(k, -1);
                if (l > 0)
                    setLayoutAnimation(AnimationUtils.loadLayoutAnimation(super.mContext, l));
                break;

            case 5: // '\005'
                setAlwaysDrawnWithCacheEnabled(typedarray.getBoolean(k, true));
                break;

            case 6: // '\006'
                setAddStatesFromChildren(typedarray.getBoolean(k, false));
                break;

            case 4: // '\004'
                setPersistentDrawingCache(typedarray.getInt(k, 2));
                break;

            case 3: // '\003'
                setAnimationCacheEnabled(typedarray.getBoolean(k, true));
                break;

            case 1: // '\001'
                setClipToPadding(typedarray.getBoolean(k, true));
                break;

            case 0: // '\0'
                setClipChildren(typedarray.getBoolean(k, true));
                break;
            }
        }

        typedarray.recycle();
    }

    private void initViewGroup()
    {
        if (!debugDraw())
            setFlags(128, 128);
        mGroupFlags = 1 | mGroupFlags;
        mGroupFlags = 2 | mGroupFlags;
        mGroupFlags = 0x10 | mGroupFlags;
        mGroupFlags = 0x40 | mGroupFlags;
        mGroupFlags = 0x4000 | mGroupFlags;
        if (super.mContext.getApplicationInfo().targetSdkVersion >= 11)
            mGroupFlags = 0x200000 | mGroupFlags;
        setDescendantFocusability(0x20000);
        mChildren = new View[12];
        mChildrenCount = 0;
        mPersistentDrawingCache = 2;
    }

    private ViewParent invalidateChildInParentFast(int i, int j, Rect rect)
    {
label0:
        {
            if ((0x20 & super.mPrivateFlags) == 32 || (0x8000 & super.mPrivateFlags) == 32768)
            {
                rect.offset(i - super.mScrollX, j - super.mScrollY);
                if ((1 & mGroupFlags) == 0 || rect.intersect(0, 0, super.mRight - super.mLeft, super.mBottom - super.mTop))
                    break label0;
            }
            return null;
        }
        if (super.mLayerType != 0)
            super.mLocalDirtyRect.union(rect);
        if (!getMatrix().isIdentity())
            transformRect(rect);
        return super.mParent;
    }

    private void notifyAnimationListener()
    {
        mGroupFlags = 0xfffffdff & mGroupFlags;
        mGroupFlags = 0x10 | mGroupFlags;
        if (mAnimationListener != null)
            post(new Runnable() {

                final ViewGroup this$0;

                public void run()
                {
                    mAnimationListener.onAnimationEnd(mLayoutAnimationController.getAnimation());
                }

            
            {
                this$0 = ViewGroup.this;
                super();
            }
            }
);
        if ((0x40 & mGroupFlags) == 64)
        {
            mGroupFlags = 0xffff7fff & mGroupFlags;
            if ((1 & mPersistentDrawingCache) == 0)
                setChildrenDrawingCacheEnabled(false);
        }
        invalidate(true);
    }

    private static MotionEvent obtainMotionEventNoHistoryOrSelf(MotionEvent motionevent)
    {
        if (motionevent.getHistorySize() == 0)
            return motionevent;
        else
            return MotionEvent.obtainNoHistory(motionevent);
    }

    private void removeFromArray(int i)
    {
label0:
        {
            View aview[] = mChildren;
            if (mTransitioningViews == null || !mTransitioningViews.contains(aview[i]))
                aview[i].mParent = null;
            int j = mChildrenCount;
            if (i == j - 1)
            {
                int l = -1 + mChildrenCount;
                mChildrenCount = l;
                aview[l] = null;
            } else
            {
                if (i < 0 || i >= j)
                    break label0;
                System.arraycopy(aview, i + 1, aview, i, -1 + (j - i));
                int k = -1 + mChildrenCount;
                mChildrenCount = k;
                aview[k] = null;
            }
            if (mLastTouchDownIndex == i)
            {
                mLastTouchDownTime = 0L;
                mLastTouchDownIndex = -1;
            } else
            if (mLastTouchDownIndex > i)
            {
                mLastTouchDownIndex = -1 + mLastTouchDownIndex;
                return;
            }
            return;
        }
        throw new IndexOutOfBoundsException();
    }

    private void removeFromArray(int i, int j)
    {
        View aview[] = mChildren;
        int k = mChildrenCount;
        int l = Math.max(0, i);
        int i1 = Math.min(k, l + j);
        if (l == i1)
            return;
        if (i1 == k)
        {
            for (int l1 = l; l1 < i1; l1++)
            {
                aview[l1].mParent = null;
                aview[l1] = null;
            }

        } else
        {
            for (int j1 = l; j1 < i1; j1++)
                aview[j1].mParent = null;

            System.arraycopy(aview, i1, aview, l, k - i1);
            for (int k1 = k - (i1 - l); k1 < k; k1++)
                aview[k1] = null;

        }
        mChildrenCount = mChildrenCount - (i1 - l);
    }

    private void removePointersFromTouchTargets(int i)
    {
        TouchTarget touchtarget = null;
        TouchTarget touchtarget1 = mFirstTouchTarget;
        do
        {
            if (touchtarget1 == null)
                break;
            TouchTarget touchtarget2 = touchtarget1.next;
            if ((i & touchtarget1.pointerIdBits) != 0)
            {
                touchtarget1.pointerIdBits = touchtarget1.pointerIdBits & ~i;
                if (touchtarget1.pointerIdBits == 0)
                {
                    if (touchtarget == null)
                        mFirstTouchTarget = touchtarget2;
                    else
                        touchtarget.next = touchtarget2;
                    touchtarget1.recycle();
                    touchtarget1 = touchtarget2;
                    continue;
                }
            }
            touchtarget = touchtarget1;
            touchtarget1 = touchtarget2;
        } while (true);
    }

    private void removeViewInternal(int i, View view)
    {
        if (mTransition != null)
            mTransition.removeChild(this, view);
        View view1 = mFocused;
        boolean flag = false;
        if (view == view1)
        {
            view.unFocus();
            flag = true;
        }
        view.clearAccessibilityFocus();
        cancelTouchTarget(view);
        cancelHoverTarget(view);
        if (view.getAnimation() == null && (mTransitioningViews == null || !mTransitioningViews.contains(view)))
        {
            if (view.mAttachInfo != null)
                view.dispatchDetachedFromWindow();
        } else
        {
            addDisappearingView(view);
        }
        if (view.hasTransientState())
            childHasTransientStateChanged(view, false);
        onViewRemoved(view);
        needGlobalAttributesUpdate(false);
        removeFromArray(i);
        if (flag)
        {
            clearChildFocus(view);
            ensureInputFocusOnFirstFocusable();
        }
        if (view.isAccessibilityFocused())
            view.clearAccessibilityFocus();
    }

    private void removeViewInternal(View view)
    {
        int i = indexOfChild(view);
        if (i >= 0)
            removeViewInternal(i, view);
    }

    private void removeViewsInternal(int i, int j)
    {
        View view = mFocused;
        boolean flag;
        if (super.mAttachInfo != null)
            flag = true;
        else
            flag = false;
        View view1 = null;
        View aview[] = mChildren;
        int k = i + j;
        for (int l = i; l < k; l++)
        {
            View view2 = aview[l];
            if (mTransition != null)
                mTransition.removeChild(this, view2);
            if (view2 == view)
            {
                view2.unFocus();
                view1 = view2;
            }
            view2.clearAccessibilityFocus();
            cancelTouchTarget(view2);
            cancelHoverTarget(view2);
            if (view2.getAnimation() == null && (mTransitioningViews == null || !mTransitioningViews.contains(view2)))
            {
                if (flag)
                    view2.dispatchDetachedFromWindow();
            } else
            {
                addDisappearingView(view2);
            }
            if (view2.hasTransientState())
                childHasTransientStateChanged(view2, false);
            needGlobalAttributesUpdate(false);
            onViewRemoved(view2);
        }

        removeFromArray(i, j);
        if (view1 != null)
        {
            clearChildFocus(view1);
            ensureInputFocusOnFirstFocusable();
        }
    }

    private static boolean resetCancelNextUpFlag(View view)
    {
        if ((0x4000000 & view.mPrivateFlags) != 0)
        {
            view.mPrivateFlags = 0xfbffffff & view.mPrivateFlags;
            return true;
        } else
        {
            return false;
        }
    }

    private void resetTouchState()
    {
        clearTouchTargets();
        resetCancelNextUpFlag(this);
        mGroupFlags = 0xfff7ffff & mGroupFlags;
    }

    private void setBooleanFlag(int i, boolean flag)
    {
        if (flag)
        {
            mGroupFlags = i | mGroupFlags;
            return;
        } else
        {
            mGroupFlags = mGroupFlags & ~i;
            return;
        }
    }

    public void addChildrenForAccessibility(ArrayList arraylist)
    {
        ChildListForAccessibility childlistforaccessibility = ChildListForAccessibility.obtain(this, true);
        int i = childlistforaccessibility.getChildCount();
        int j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_75;
        View view;
        view = childlistforaccessibility.getChildAt(j);
        if ((0xc & view.mViewFlags) != 0)
            break MISSING_BLOCK_LABEL_80;
        if (view.includeForAccessibility())
        {
            arraylist.add(view);
            break MISSING_BLOCK_LABEL_80;
        }
        view.addChildrenForAccessibility(arraylist);
        break MISSING_BLOCK_LABEL_80;
        Exception exception;
        exception;
        childlistforaccessibility.recycle();
        throw exception;
        childlistforaccessibility.recycle();
        return;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void addFocusables(ArrayList arraylist, int i, int j)
    {
        int k = arraylist.size();
        int l = getDescendantFocusability();
        if (l != 0x60000)
        {
            int i1 = mChildrenCount;
            View aview[] = mChildren;
            for (int j1 = 0; j1 < i1; j1++)
            {
                View view = aview[j1];
                if ((0xc & view.mViewFlags) == 0)
                    view.addFocusables(arraylist, i, j);
            }

        }
        if (l != 0x40000 || k == arraylist.size())
            super.addFocusables(arraylist, i, j);
    }

    public boolean addStatesFromChildren()
    {
        return (0x2000 & mGroupFlags) != 0;
    }

    public void addTouchables(ArrayList arraylist)
    {
        super.addTouchables(arraylist);
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if ((0xc & view.mViewFlags) == 0)
                view.addTouchables(arraylist);
        }

    }

    public void addView(View view)
    {
        addView(view, -1);
    }

    public void addView(View view, int i)
    {
        LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams == null)
        {
            layoutparams = generateDefaultLayoutParams();
            if (layoutparams == null)
                throw new IllegalArgumentException("generateDefaultLayoutParams() cannot return null");
        }
        addView(view, i, layoutparams);
    }

    public void addView(View view, int i, int j)
    {
        LayoutParams layoutparams = generateDefaultLayoutParams();
        layoutparams.width = i;
        layoutparams.height = j;
        addView(view, -1, layoutparams);
    }

    public void addView(View view, int i, LayoutParams layoutparams)
    {
        requestLayout();
        invalidate(true);
        addViewInner(view, i, layoutparams, false);
    }

    public void addView(View view, LayoutParams layoutparams)
    {
        addView(view, -1, layoutparams);
    }

    protected boolean addViewInLayout(View view, int i, LayoutParams layoutparams)
    {
        return addViewInLayout(view, i, layoutparams, false);
    }

    protected boolean addViewInLayout(View view, int i, LayoutParams layoutparams, boolean flag)
    {
        view.mParent = null;
        addViewInner(view, i, layoutparams, flag);
        view.mPrivateFlags = 0x20 | 0xff9fffff & view.mPrivateFlags;
        return true;
    }

    protected void attachLayoutAnimationParameters(View view, LayoutParams layoutparams, int i, int j)
    {
        android.view.animation.LayoutAnimationController.AnimationParameters animationparameters = layoutparams.layoutAnimationParameters;
        if (animationparameters == null)
        {
            animationparameters = new android.view.animation.LayoutAnimationController.AnimationParameters();
            layoutparams.layoutAnimationParameters = animationparameters;
        }
        animationparameters.count = j;
        animationparameters.index = i;
    }

    protected void attachViewToParent(View view, int i, LayoutParams layoutparams)
    {
        view.mLayoutParams = layoutparams;
        if (i < 0)
            i = mChildrenCount;
        addInArray(view, i);
        view.mParent = this;
        view.mPrivateFlags = 0x80000000 | (0x20 | 0xffff7fff & (0xff9fffff & view.mPrivateFlags));
        super.mPrivateFlags = 0x80000000 | super.mPrivateFlags;
        if (view.hasFocus())
            requestChildFocus(view, view.findFocus());
    }

    public void bringChildToFront(View view)
    {
        int i = indexOfChild(view);
        if (i >= 0)
        {
            removeFromArray(i);
            addInArray(view, mChildrenCount);
            view.mParent = this;
        }
    }

    protected boolean canAnimate()
    {
        return mLayoutAnimationController != null;
    }

    protected boolean checkLayoutParams(LayoutParams layoutparams)
    {
        return layoutparams != null;
    }

    public void childAccessibilityStateChanged(View view)
    {
        if (super.mParent != null)
            super.mParent.childAccessibilityStateChanged(view);
    }

    public void childDrawableStateChanged(View view)
    {
        if ((0x2000 & mGroupFlags) != 0)
            refreshDrawableState();
    }

    public void childHasTransientStateChanged(View view, boolean flag)
    {
        boolean flag1 = hasTransientState();
        boolean flag2;
        if (flag)
            mChildCountWithTransientState = 1 + mChildCountWithTransientState;
        else
            mChildCountWithTransientState = -1 + mChildCountWithTransientState;
        flag2 = hasTransientState();
        if (super.mParent == null || flag1 == flag2)
            break MISSING_BLOCK_LABEL_50;
        super.mParent.childHasTransientStateChanged(this, flag2);
        return;
        AbstractMethodError abstractmethoderror;
        abstractmethoderror;
        Log.e("ViewGroup", (new StringBuilder()).append(super.mParent.getClass().getSimpleName()).append(" does not fully implement ViewParent").toString(), abstractmethoderror);
        return;
    }

    protected void cleanupLayoutState(View view)
    {
        view.mPrivateFlags = 0xffffefff & view.mPrivateFlags;
    }

    public void clearChildFocus(View view)
    {
        mFocused = null;
        if (super.mParent != null)
            super.mParent.clearChildFocus(this);
    }

    public void clearDisappearingChildren()
    {
        if (mDisappearingChildren != null)
        {
            mDisappearingChildren.clear();
            invalidate();
        }
    }

    public void clearFocus()
    {
        if (mFocused == null)
        {
            super.clearFocus();
            return;
        } else
        {
            View view = mFocused;
            mFocused = null;
            view.clearFocus();
            return;
        }
    }

    Bitmap createSnapshot(android.graphics.Bitmap.Config config, int i, boolean flag)
    {
        int j = mChildrenCount;
        int ai[] = null;
        if (flag)
        {
            ai = new int[j];
            for (int l = 0; l < j; l++)
            {
                View view = getChildAt(l);
                ai[l] = view.getVisibility();
                if (ai[l] == 0)
                    view.setVisibility(4);
            }

        }
        Bitmap bitmap = super.createSnapshot(config, i, flag);
        if (flag)
        {
            for (int k = 0; k < j; k++)
                getChildAt(k).setVisibility(ai[k]);

        }
        return bitmap;
    }

    protected void debug(int i)
    {
        super.debug(i);
        if (mFocused != null)
        {
            String s2 = debugIndent(i);
            Log.d("View", (new StringBuilder()).append(s2).append("mFocused").toString());
        }
        if (mChildrenCount != 0)
        {
            String s1 = debugIndent(i);
            Log.d("View", (new StringBuilder()).append(s1).append("{").toString());
        }
        int j = mChildrenCount;
        for (int k = 0; k < j; k++)
            mChildren[k].debug(i + 1);

        if (mChildrenCount != 0)
        {
            String s = debugIndent(i);
            Log.d("View", (new StringBuilder()).append(s).append("}").toString());
        }
    }

    protected void detachAllViewsFromParent()
    {
        int i = mChildrenCount;
        if (i > 0)
        {
            View aview[] = mChildren;
            mChildrenCount = 0;
            for (int j = i - 1; j >= 0; j--)
            {
                aview[j].mParent = null;
                aview[j] = null;
            }

        }
    }

    protected void detachViewFromParent(int i)
    {
        removeFromArray(i);
    }

    protected void detachViewFromParent(View view)
    {
        removeFromArray(indexOfChild(view));
    }

    protected void detachViewsFromParent(int i, int j)
    {
        removeFromArray(i, j);
    }

    void dispatchAttachedToWindow(View.AttachInfo attachinfo, int i)
    {
        mGroupFlags = 0x400000 | mGroupFlags;
        super.dispatchAttachedToWindow(attachinfo, i);
        mGroupFlags = 0xffbfffff & mGroupFlags;
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
        {
            View view = aview[k];
            view.dispatchAttachedToWindow(attachinfo, i | 0xc & view.mViewFlags);
        }

    }

    void dispatchCollectViewAttributes(View.AttachInfo attachinfo, int i)
    {
        if ((i & 0xc) == 0)
        {
            super.dispatchCollectViewAttributes(attachinfo, i);
            int j = mChildrenCount;
            View aview[] = mChildren;
            for (int k = 0; k < j; k++)
            {
                View view = aview[k];
                view.dispatchCollectViewAttributes(attachinfo, i | 0xc & view.mViewFlags);
            }

        }
    }

    public void dispatchConfigurationChanged(Configuration configuration)
    {
        super.dispatchConfigurationChanged(configuration);
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].dispatchConfigurationChanged(configuration);

    }

    void dispatchDetachedFromWindow()
    {
        cancelAndClearTouchTargets(null);
        exitHoverTargets();
        mLayoutSuppressed = false;
        mDragNotifiedChildren = null;
        if (mCurrentDrag != null)
        {
            mCurrentDrag.recycle();
            mCurrentDrag = null;
        }
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].dispatchDetachedFromWindow();

        super.dispatchDetachedFromWindow();
    }

    public void dispatchDisplayHint(int i)
    {
        super.dispatchDisplayHint(i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchDisplayHint(i);

    }

    public boolean dispatchDragEvent(DragEvent dragevent)
    {
        float f = dragevent.mX;
        float f1 = dragevent.mY;
        ViewRootImpl viewrootimpl = getViewRootImpl();
        int i = dragevent.mAction;
        boolean flag = false;
        switch (i)
        {
        case 3: // '\003'
            View view6 = findFrontmostDroppableChildAt(dragevent.mX, dragevent.mY, mLocalPoint);
            flag = false;
            if (view6 != null)
            {
                dragevent.mX = mLocalPoint.x;
                dragevent.mY = mLocalPoint.y;
                flag = view6.dispatchDragEvent(dragevent);
                dragevent.mX = f;
                dragevent.mY = f1;
            }
            break;

        case 6: // '\006'
            View view4 = mCurrentDragView;
            flag = false;
            if (view4 != null)
            {
                View view5 = mCurrentDragView;
                view5.dispatchDragEvent(dragevent);
                view5.mPrivateFlags2 = -3 & view5.mPrivateFlags2;
                view5.refreshDrawableState();
                mCurrentDragView = null;
                flag = false;
            }
            break;

        case 2: // '\002'
            View view2 = findFrontmostDroppableChildAt(dragevent.mX, dragevent.mY, mLocalPoint);
            if (mCurrentDragView != view2)
            {
                viewrootimpl.setDragFocus(view2);
                int l = dragevent.mAction;
                if (mCurrentDragView != null)
                {
                    View view3 = mCurrentDragView;
                    dragevent.mAction = 6;
                    view3.dispatchDragEvent(dragevent);
                    view3.mPrivateFlags2 = -3 & view3.mPrivateFlags2;
                    view3.refreshDrawableState();
                }
                mCurrentDragView = view2;
                if (view2 != null)
                {
                    dragevent.mAction = 5;
                    view2.dispatchDragEvent(dragevent);
                    view2.mPrivateFlags2 = 2 | view2.mPrivateFlags2;
                    view2.refreshDrawableState();
                }
                dragevent.mAction = l;
            }
            flag = false;
            if (view2 != null)
            {
                dragevent.mX = mLocalPoint.x;
                dragevent.mY = mLocalPoint.y;
                flag = view2.dispatchDragEvent(dragevent);
                dragevent.mX = f;
                dragevent.mY = f1;
            }
            break;

        case 4: // '\004'
            if (mDragNotifiedChildren != null)
            {
                View view1;
                for (Iterator iterator = mDragNotifiedChildren.iterator(); iterator.hasNext(); view1.refreshDrawableState())
                {
                    view1 = (View)iterator.next();
                    view1.dispatchDragEvent(dragevent);
                    view1.mPrivateFlags2 = -4 & view1.mPrivateFlags2;
                }

                mDragNotifiedChildren.clear();
                mCurrentDrag.recycle();
                mCurrentDrag = null;
            }
            boolean flag2 = mChildAcceptsDrag;
            flag = false;
            if (flag2)
                flag = true;
            break;

        case 1: // '\001'
            mCurrentDragView = null;
            mCurrentDrag = DragEvent.obtain(dragevent);
            if (mDragNotifiedChildren == null)
                mDragNotifiedChildren = new HashSet();
            else
                mDragNotifiedChildren.clear();
            mChildAcceptsDrag = false;
            int j = mChildrenCount;
            View aview[] = mChildren;
            for (int k = 0; k < j; k++)
            {
                View view = aview[k];
                view.mPrivateFlags2 = -4 & view.mPrivateFlags2;
                if (view.getVisibility() == 0 && notifyChildOfDrag(aview[k]))
                    mChildAcceptsDrag = true;
            }

            boolean flag1 = mChildAcceptsDrag;
            flag = false;
            if (flag1)
                flag = true;
            break;
        }
        if (!flag)
            flag = super.dispatchDragEvent(dragevent);
        return flag;
    }

    protected void dispatchDraw(Canvas canvas)
    {
        int i = mChildrenCount;
        View aview[] = mChildren;
        int j = mGroupFlags;
        if ((j & 8) != 0 && canAnimate())
        {
            boolean flag2;
            if ((0x40 & mGroupFlags) == 64)
                flag2 = true;
            else
                flag2 = false;
            boolean flag3;
            if (!isHardwareAccelerated())
                flag3 = true;
            else
                flag3 = false;
            for (int i2 = 0; i2 < i; i2++)
            {
                View view2 = aview[i2];
                if ((0xc & view2.mViewFlags) != 0)
                    continue;
                attachLayoutAnimationParameters(view2, view2.getLayoutParams(), i2, i);
                bindLayoutAnimation(view2);
                if (!flag2)
                    continue;
                view2.setDrawingCacheEnabled(true);
                if (flag3)
                    view2.buildDrawingCache(true);
            }

            LayoutAnimationController layoutanimationcontroller = mLayoutAnimationController;
            if (layoutanimationcontroller.willOverlap())
                mGroupFlags = 0x80 | mGroupFlags;
            layoutanimationcontroller.start();
            mGroupFlags = -9 & mGroupFlags;
            mGroupFlags = 0xffffffef & mGroupFlags;
            if (flag2)
                mGroupFlags = 0x8000 | mGroupFlags;
            if (mAnimationListener != null)
                mAnimationListener.onAnimationStart(layoutanimationcontroller.getAnimation());
        }
        boolean flag;
        if ((j & 0x22) == 34)
            flag = true;
        else
            flag = false;
        int k = 0;
        if (flag)
        {
            k = canvas.save();
            canvas.clipRect(super.mScrollX + super.mPaddingLeft, super.mScrollY + super.mPaddingTop, (super.mScrollX + super.mRight) - super.mLeft - super.mPaddingRight, (super.mScrollY + super.mBottom) - super.mTop - super.mPaddingBottom);
        }
        super.mPrivateFlags = 0xffffffbf & super.mPrivateFlags;
        mGroupFlags = -5 & mGroupFlags;
        boolean flag1 = false;
        long l = getDrawingTime();
        if ((j & 0x400) == 0)
        {
            for (int l1 = 0; l1 < i; l1++)
            {
                View view1 = aview[l1];
                if (view1 == null)
                {
                    Xlog.d("ViewGroup", (new StringBuilder()).append("dispatchDraw: i = ").append(l1).append(",count = ").append(i).append(", this = ").append(this).toString());
                    debug();
                }
                if ((0xc & view1.mViewFlags) == 0 || view1.getAnimation() != null)
                    flag1 |= drawChild(canvas, view1, l);
            }

        } else
        {
            for (int i1 = 0; i1 < i; i1++)
            {
                View view = aview[getChildDrawingOrder(i, i1)];
                if (view == null)
                {
                    Xlog.d("ViewGroup", (new StringBuilder()).append("dispatchDraw: i = ").append(i1).append(",count = ").append(i).append(", this = ").append(this).toString());
                    debug();
                }
                if ((0xc & view.mViewFlags) == 0 || view.getAnimation() != null)
                    flag1 |= drawChild(canvas, view, l);
            }

        }
        if (mDisappearingChildren != null)
        {
            ArrayList arraylist = mDisappearingChildren;
            for (int k1 = -1 + arraylist.size(); k1 >= 0; k1--)
                flag1 |= drawChild(canvas, (View)arraylist.get(k1), l);

        }
        if (debugDraw())
            onDebugDraw(canvas);
        if (flag)
            canvas.restoreToCount(k);
        int j1 = mGroupFlags;
        if ((j1 & 4) == 4)
            invalidate(true);
        if ((j1 & 0x10) == 0 && (j1 & 0x200) == 0 && mLayoutAnimationController.isDone() && !flag1)
        {
            mGroupFlags = 0x200 | mGroupFlags;
            Runnable runnable = new Runnable() {

                final ViewGroup this$0;

                public void run()
                {
                    notifyAnimationListener();
                }

            
            {
                this$0 = ViewGroup.this;
                super();
            }
            }
;
            post(runnable);
        }
    }

    public void dispatchFinishTemporaryDetach()
    {
        super.dispatchFinishTemporaryDetach();
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].dispatchFinishTemporaryDetach();

    }

    protected void dispatchFreezeSelfOnly(SparseArray sparsearray)
    {
        super.dispatchSaveInstanceState(sparsearray);
    }

    protected boolean dispatchGenericFocusedEvent(MotionEvent motionevent)
    {
        if ((0x12 & super.mPrivateFlags) == 18)
            return super.dispatchGenericFocusedEvent(motionevent);
        if (mFocused != null && (0x10 & mFocused.mPrivateFlags) == 16)
            return mFocused.dispatchGenericMotionEvent(motionevent);
        else
            return false;
    }

    protected boolean dispatchGenericPointerEvent(MotionEvent motionevent)
    {
        int i = mChildrenCount;
        if (i != 0)
        {
            View aview[] = mChildren;
            float f = motionevent.getX();
            float f1 = motionevent.getY();
            boolean flag = isChildrenDrawingOrderEnabled();
            for (int j = i - 1; j >= 0; j--)
            {
                int k;
                if (flag)
                    k = getChildDrawingOrder(i, j);
                else
                    k = j;
                View view = aview[k];
                if (canViewReceivePointerEvents(view) && isTransformedTouchPointInView(f, f1, view, null) && dispatchTransformedGenericPointerEvent(motionevent, view))
                    return true;
            }

        }
        return super.dispatchGenericPointerEvent(motionevent);
    }

    protected void dispatchGetDisplayList()
    {
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if ((0xc & view.mViewFlags) != 0 && view.getAnimation() == null || !view.hasStaticLayer())
                continue;
            boolean flag;
            if ((0x80000000 & view.mPrivateFlags) == 0x80000000)
                flag = true;
            else
                flag = false;
            view.mRecreateDisplayList = flag;
            view.mPrivateFlags = 0x7fffffff & view.mPrivateFlags;
            view.getDisplayList();
            view.mRecreateDisplayList = false;
        }

    }

    protected boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i;
        boolean flag;
        MotionEvent motionevent1;
        HoverTarget hovertarget;
        boolean flag1;
        i = motionevent.getAction();
        flag = onInterceptHoverEvent(motionevent);
        motionevent.setAction(i);
        motionevent1 = motionevent;
        hovertarget = mFirstHoverTarget;
        mFirstHoverTarget = null;
        flag1 = false;
        if (flag) goto _L2; else goto _L1
_L1:
        flag1 = false;
        if (i == 10) goto _L2; else goto _L3
_L3:
        float f;
        float f1;
        int j;
        f = motionevent.getX();
        f1 = motionevent.getY();
        j = mChildrenCount;
        flag1 = false;
        if (j == 0) goto _L2; else goto _L4
_L4:
        View aview[];
        HoverTarget hovertarget2;
        int k;
        aview = mChildren;
        hovertarget2 = null;
        k = j - 1;
_L8:
        if (k < 0) goto _L2; else goto _L5
_L5:
        View view1 = aview[k];
        if (!canViewReceivePointerEvents(view1) || !isTransformedTouchPointInView(f, f1, view1, null)) goto _L7; else goto _L6
_L6:
        HoverTarget hovertarget3;
        HoverTarget hovertarget4;
        hovertarget3 = hovertarget;
        hovertarget4 = null;
_L9:
        boolean flag4;
        if (hovertarget3 == null)
        {
            hovertarget3 = HoverTarget.obtain(view1);
            flag4 = false;
        } else
        {
            if (hovertarget3.child != view1)
                break MISSING_BLOCK_LABEL_630;
            if (hovertarget4 != null)
            {
                HoverTarget hovertarget5 = hovertarget3.next;
                hovertarget4.next = hovertarget5;
            } else
            {
                hovertarget = hovertarget3.next;
            }
            hovertarget3.next = null;
            flag4 = true;
        }
        if (hovertarget2 != null)
        {
            hovertarget2.next = hovertarget3;
        } else
        {
            hovertarget2 = hovertarget3;
            mFirstHoverTarget = hovertarget3;
        }
        if (i == 9)
        {
            if (!flag4)
                flag1 |= dispatchTransformedGenericPointerEvent(motionevent, view1);
        } else
        if (i == 7)
            if (!flag4)
            {
                motionevent1 = obtainMotionEventNoHistoryOrSelf(motionevent1);
                motionevent1.setAction(9);
                boolean flag5 = flag1 | dispatchTransformedGenericPointerEvent(motionevent1, view1);
                motionevent1.setAction(i);
                flag1 = flag5 | dispatchTransformedGenericPointerEvent(motionevent1, view1);
            } else
            {
                flag1 |= dispatchTransformedGenericPointerEvent(motionevent, view1);
            }
        if (!flag1) goto _L7; else goto _L2
_L2:
        HoverTarget hovertarget1;
        for (; hovertarget != null; hovertarget = hovertarget1)
        {
            View view = hovertarget.child;
            if (i == 10)
            {
                flag1 |= dispatchTransformedGenericPointerEvent(motionevent, view);
            } else
            {
                if (i == 7)
                    dispatchTransformedGenericPointerEvent(motionevent, view);
                motionevent1 = obtainMotionEventNoHistoryOrSelf(motionevent1);
                motionevent1.setAction(10);
                dispatchTransformedGenericPointerEvent(motionevent1, view);
                motionevent1.setAction(i);
            }
            hovertarget1 = hovertarget.next;
            hovertarget.recycle();
        }

        boolean flag2;
        if (!flag1)
            flag2 = true;
        else
            flag2 = false;
        if (flag2 == mHoveredSelf)
        {
            if (flag2)
                flag1 |= super.dispatchHoverEvent(motionevent);
        } else
        {
            if (mHoveredSelf)
            {
                if (i == 10)
                {
                    flag1 |= super.dispatchHoverEvent(motionevent);
                } else
                {
                    if (i == 7)
                        super.dispatchHoverEvent(motionevent);
                    motionevent1 = obtainMotionEventNoHistoryOrSelf(motionevent1);
                    motionevent1.setAction(10);
                    super.dispatchHoverEvent(motionevent1);
                    motionevent1.setAction(i);
                }
                mHoveredSelf = false;
            }
            if (flag2)
                if (i == 9)
                {
                    flag1 |= super.dispatchHoverEvent(motionevent);
                    mHoveredSelf = true;
                } else
                if (i == 7)
                {
                    motionevent1 = obtainMotionEventNoHistoryOrSelf(motionevent1);
                    motionevent1.setAction(9);
                    boolean flag3 = flag1 | super.dispatchHoverEvent(motionevent1);
                    motionevent1.setAction(i);
                    flag1 = flag3 | super.dispatchHoverEvent(motionevent1);
                    mHoveredSelf = true;
                }
        }
        if (motionevent1 != motionevent)
            motionevent1.recycle();
        return flag1;
_L7:
        k--;
          goto _L8
        hovertarget4 = hovertarget3;
        hovertarget3 = hovertarget3.next;
          goto _L9
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (super.mInputEventConsistencyVerifier != null)
            super.mInputEventConsistencyVerifier.onKeyEvent(keyevent, 1);
        if ((0x12 & super.mPrivateFlags) != 18 ? mFocused == null || (0x10 & mFocused.mPrivateFlags) != 16 || !mFocused.dispatchKeyEvent(keyevent) : !super.dispatchKeyEvent(keyevent))
        {
            if (super.mInputEventConsistencyVerifier != null)
                super.mInputEventConsistencyVerifier.onUnhandledEvent(keyevent, 1);
            return false;
        } else
        {
            return true;
        }
    }

    public boolean dispatchKeyEventPreIme(KeyEvent keyevent)
    {
        if ((0x12 & super.mPrivateFlags) == 18)
            return super.dispatchKeyEventPreIme(keyevent);
        if (mFocused != null && (0x10 & mFocused.mPrivateFlags) == 16)
            return mFocused.dispatchKeyEventPreIme(keyevent);
        else
            return false;
    }

    public boolean dispatchKeyShortcutEvent(KeyEvent keyevent)
    {
        if ((0x12 & super.mPrivateFlags) == 18)
            return super.dispatchKeyShortcutEvent(keyevent);
        if (mFocused != null && (0x10 & mFocused.mPrivateFlags) == 16)
            return mFocused.dispatchKeyShortcutEvent(keyevent);
        else
            return false;
    }

    boolean dispatchPopulateAccessibilityEventInternal(AccessibilityEvent accessibilityevent)
    {
        ChildListForAccessibility childlistforaccessibility;
        if (includeForAccessibility())
        {
            boolean flag1 = super.dispatchPopulateAccessibilityEventInternal(accessibilityevent);
            if (flag1)
                return flag1;
        }
        childlistforaccessibility = ChildListForAccessibility.obtain(this, true);
        int i = childlistforaccessibility.getChildCount();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        boolean flag;
        View view = childlistforaccessibility.getChildAt(j);
        if ((0xc & view.mViewFlags) != 0)
            break MISSING_BLOCK_LABEL_83;
        flag = view.dispatchPopulateAccessibilityEvent(accessibilityevent);
        if (flag)
        {
            childlistforaccessibility.recycle();
            return flag;
        }
        j++;
        if (true) goto _L2; else goto _L1
        Exception exception;
        exception;
        childlistforaccessibility.recycle();
        throw exception;
_L1:
        childlistforaccessibility.recycle();
        return false;
    }

    protected void dispatchRestoreInstanceState(SparseArray sparsearray)
    {
        super.dispatchRestoreInstanceState(sparsearray);
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if ((0x20000000 & view.mViewFlags) != 0x20000000)
                view.dispatchRestoreInstanceState(sparsearray);
        }

    }

    protected void dispatchSaveInstanceState(SparseArray sparsearray)
    {
        super.dispatchSaveInstanceState(sparsearray);
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if ((0x20000000 & view.mViewFlags) != 0x20000000)
                view.dispatchSaveInstanceState(sparsearray);
        }

    }

    void dispatchScreenStateChanged(int i)
    {
        super.dispatchScreenStateChanged(i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchScreenStateChanged(i);

    }

    public void dispatchSetActivated(boolean flag)
    {
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
            aview[j].setActivated(flag);

    }

    protected void dispatchSetPressed(boolean flag)
    {
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if (!flag || !view.isClickable() && !view.isLongClickable())
                view.setPressed(flag);
        }

    }

    public void dispatchSetSelected(boolean flag)
    {
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
            aview[j].setSelected(flag);

    }

    public void dispatchStartTemporaryDetach()
    {
        super.dispatchStartTemporaryDetach();
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].dispatchStartTemporaryDetach();

    }

    public void dispatchSystemUiVisibilityChanged(int i)
    {
        super.dispatchSystemUiVisibilityChanged(i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchSystemUiVisibilityChanged(i);

    }

    protected void dispatchThawSelfOnly(SparseArray sparsearray)
    {
        super.dispatchRestoreInstanceState(sparsearray);
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        boolean flag;
        boolean flag1;
        if (super.mInputEventConsistencyVerifier != null)
            super.mInputEventConsistencyVerifier.onTouchEvent(motionevent, 1);
        flag = onFilterTouchEventForSecurity(motionevent);
        flag1 = false;
        if (!flag) goto _L2; else goto _L1
_L1:
        int j;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        boolean flag6;
        TouchTarget touchtarget;
        int i = motionevent.getAction();
        j = i & 0xff;
        if (j == 0)
        {
            cancelAndClearTouchTargets(motionevent);
            resetTouchState();
        }
        if (j != 0 && mFirstTouchTarget == null)
        {
            flag3 = true;
        } else
        {
            boolean flag2;
            if ((0x80000 & mGroupFlags) != 0)
                flag2 = true;
            else
                flag2 = false;
            if (!flag2)
            {
                flag3 = onInterceptTouchEvent(motionevent);
                motionevent.setAction(i);
            } else
            {
                flag3 = false;
            }
        }
        if (!resetCancelNextUpFlag(this) && j != 3)
            flag4 = false;
        else
            flag4 = true;
        if ((0x200000 & mGroupFlags) != 0)
            flag5 = true;
        else
            flag5 = false;
        flag6 = false;
        touchtarget = null;
        if (flag4) goto _L4; else goto _L3
_L3:
        flag6 = false;
        touchtarget = null;
        if (flag3) goto _L4; else goto _L5
_L5:
        if (j == 0 || flag5 && j == 5) goto _L7; else goto _L6
_L6:
        flag6 = false;
        touchtarget = null;
        if (j != 7) goto _L4; else goto _L7
_L7:
        int k;
        int l;
        int i1;
        k = motionevent.getActionIndex();
        if (flag5)
            l = 1 << motionevent.getPointerId(k);
        else
            l = -1;
        removePointersFromTouchTargets(l);
        i1 = mChildrenCount;
        flag6 = false;
        touchtarget = null;
        if (i1 == 0) goto _L9; else goto _L8
_L8:
        View aview[];
        float f;
        float f1;
        boolean flag8;
        int k1;
        aview = mChildren;
        f = motionevent.getX(k);
        f1 = motionevent.getY(k);
        flag8 = isChildrenDrawingOrderEnabled();
        k1 = i1 - 1;
_L17:
        flag6 = false;
        if (k1 < 0) goto _L9; else goto _L10
_L10:
        int l1;
        View view;
        if (flag8)
            l1 = getChildDrawingOrder(i1, k1);
        else
            l1 = k1;
        view = aview[l1];
        if (!canViewReceivePointerEvents(view) || !isTransformedTouchPointInView(f, f1, view, null)) goto _L12; else goto _L11
_L11:
        touchtarget = getTouchTarget(view);
        if (touchtarget == null) goto _L14; else goto _L13
_L13:
        int i2 = l | touchtarget.pointerIdBits;
        touchtarget.pointerIdBits = i2;
          goto _L9
_L14:
        resetCancelNextUpFlag(view);
        if (!dispatchTransformedTouchEvent(motionevent, false, view, l)) goto _L12; else goto _L15
_L15:
        mLastTouchDownTime = motionevent.getDownTime();
        mLastTouchDownIndex = l1;
        mLastTouchDownX = motionevent.getX();
        mLastTouchDownY = motionevent.getY();
        touchtarget = addTouchTarget(view, l);
        flag6 = true;
_L9:
        if (touchtarget == null && mFirstTouchTarget != null)
        {
            for (touchtarget = mFirstTouchTarget; touchtarget.next != null; touchtarget = touchtarget.next);
            int j1 = l | touchtarget.pointerIdBits;
            touchtarget.pointerIdBits = j1;
        }
_L4:
        if (mFirstTouchTarget == null)
        {
            flag1 = dispatchTransformedTouchEvent(motionevent, flag4, null, -1);
        } else
        {
            TouchTarget touchtarget1 = null;
            TouchTarget touchtarget2 = mFirstTouchTarget;
            do
            {
                if (touchtarget2 == null)
                    break;
                TouchTarget touchtarget3 = touchtarget2.next;
                if (flag6 && touchtarget2 == touchtarget)
                {
                    flag1 = true;
                } else
                {
                    boolean flag7;
                    if (!resetCancelNextUpFlag(touchtarget2.child) && !flag3)
                        flag7 = false;
                    else
                        flag7 = true;
                    if (dispatchTransformedTouchEvent(motionevent, flag7, touchtarget2.child, touchtarget2.pointerIdBits))
                        flag1 = true;
                    if (flag7)
                    {
                        if (touchtarget1 == null)
                            mFirstTouchTarget = touchtarget3;
                        else
                            touchtarget1.next = touchtarget3;
                        touchtarget2.recycle();
                        touchtarget2 = touchtarget3;
                        continue;
                    }
                }
                touchtarget1 = touchtarget2;
                touchtarget2 = touchtarget3;
            } while (true);
        }
        if (!flag4 && j != 1 && j != 7)
        {
            if (flag5 && j == 6)
                removePointersFromTouchTargets(1 << motionevent.getPointerId(motionevent.getActionIndex()));
        } else
        {
            resetTouchState();
        }
_L2:
        if (!flag1 && super.mInputEventConsistencyVerifier != null)
            super.mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 1);
        return flag1;
_L12:
        k1--;
        if (true) goto _L17; else goto _L16
_L16:
    }

    public boolean dispatchTrackballEvent(MotionEvent motionevent)
    {
        if (super.mInputEventConsistencyVerifier != null)
            super.mInputEventConsistencyVerifier.onTrackballEvent(motionevent, 1);
        if ((0x12 & super.mPrivateFlags) != 18 ? mFocused == null || (0x10 & mFocused.mPrivateFlags) != 16 || !mFocused.dispatchTrackballEvent(motionevent) : !super.dispatchTrackballEvent(motionevent))
        {
            if (super.mInputEventConsistencyVerifier != null)
                super.mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 1);
            return false;
        } else
        {
            return true;
        }
    }

    public boolean dispatchUnhandledMove(View view, int i)
    {
        return mFocused != null && mFocused.dispatchUnhandledMove(view, i);
    }

    protected void dispatchVisibilityChanged(View view, int i)
    {
        super.dispatchVisibilityChanged(view, i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchVisibilityChanged(view, i);

    }

    public void dispatchWindowFocusChanged(boolean flag)
    {
        super.dispatchWindowFocusChanged(flag);
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].dispatchWindowFocusChanged(flag);

    }

    public void dispatchWindowSystemUiVisiblityChanged(int i)
    {
        super.dispatchWindowSystemUiVisiblityChanged(i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchWindowSystemUiVisiblityChanged(i);

    }

    public void dispatchWindowVisibilityChanged(int i)
    {
        super.dispatchWindowVisibilityChanged(i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
            aview[k].dispatchWindowVisibilityChanged(i);

    }

    protected boolean drawChild(Canvas canvas, View view, long l)
    {
        return view.draw(canvas, this, l);
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if ((0x10000 & mGroupFlags) != 0)
        {
            if ((0x2000 & mGroupFlags) != 0)
                throw new IllegalStateException("addStateFromChildren cannot be enabled if a child has duplicateParentState set to true");
            View aview[] = mChildren;
            int i = mChildrenCount;
            for (int j = 0; j < i; j++)
            {
                View view = aview[j];
                if ((0x400000 & view.mViewFlags) != 0)
                    view.refreshDrawableState();
            }

        }
    }

    public void endViewTransition(View view)
    {
        if (mTransitioningViews != null)
        {
            mTransitioningViews.remove(view);
            ArrayList arraylist = mDisappearingChildren;
            if (arraylist != null && arraylist.contains(view))
            {
                arraylist.remove(view);
                if (mVisibilityChangingChildren != null && mVisibilityChangingChildren.contains(view))
                {
                    mVisibilityChangingChildren.remove(view);
                } else
                {
                    if (view.mAttachInfo != null)
                        view.dispatchDetachedFromWindow();
                    if (view.mParent != null)
                        view.mParent = null;
                }
                invalidate();
            }
        }
    }

    public View findFocus()
    {
        if (isFocused())
            return this;
        if (mFocused != null)
            return mFocused.findFocus();
        else
            return null;
    }

    View findFrontmostDroppableChildAt(float f, float f1, PointF pointf)
    {
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = i - 1; j >= 0; j--)
        {
            View view = aview[j];
            if (view.canAcceptDrag() && isTransformedTouchPointInView(f, f1, view, pointf))
                return view;
        }

        return null;
    }

    View findViewByAccessibilityIdTraversal(int i)
    {
        View view = super.findViewByAccessibilityIdTraversal(i);
        if (view != null)
            return view;
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
        {
            View view1 = aview[k].findViewByAccessibilityIdTraversal(i);
            if (view1 != null)
                return view1;
        }

        return null;
    }

    protected View findViewByPredicateTraversal(Predicate predicate, View view)
    {
        if (predicate.apply(this))
            return this;
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
        {
            View view1 = aview[j];
            if (view1 == view || (8 & view1.mPrivateFlags) != 0)
                continue;
            View view2 = view1.findViewByPredicate(predicate);
            if (view2 != null)
                return view2;
        }

        return null;
    }

    protected View findViewTraversal(int i)
    {
        if (i == super.mID)
            return this;
        View aview[] = mChildren;
        int j = mChildrenCount;
        for (int k = 0; k < j; k++)
        {
            View view = aview[k];
            if ((8 & view.mPrivateFlags) != 0)
                continue;
            View view1 = view.findViewById(i);
            if (view1 != null)
                return view1;
        }

        return null;
    }

    protected View findViewWithTagTraversal(Object obj)
    {
        if (obj != null && obj.equals(super.mTag))
            return this;
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
        {
            View view = aview[j];
            if ((8 & view.mPrivateFlags) != 0)
                continue;
            View view1 = view.findViewWithTag(obj);
            if (view1 != null)
                return view1;
        }

        return null;
    }

    public void findViewsWithText(ArrayList arraylist, CharSequence charsequence, int i)
    {
        super.findViewsWithText(arraylist, charsequence, i);
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
        {
            View view = aview[k];
            if ((0xc & view.mViewFlags) == 0 && (8 & view.mPrivateFlags) == 0)
                view.findViewsWithText(arraylist, charsequence, i);
        }

    }

    void finishAnimatingView(View view, Animation animation)
    {
        ArrayList arraylist = mDisappearingChildren;
        if (arraylist != null && arraylist.contains(view))
        {
            arraylist.remove(view);
            if (view.mAttachInfo != null)
                view.dispatchDetachedFromWindow();
            view.clearAnimation();
            mGroupFlags = 4 | mGroupFlags;
        }
        if (animation != null && !animation.getFillAfter())
            view.clearAnimation();
        if ((0x10000 & view.mPrivateFlags) == 0x10000)
        {
            view.onAnimationEnd();
            view.mPrivateFlags = 0xfffeffff & view.mPrivateFlags;
            mGroupFlags = 4 | mGroupFlags;
        }
    }

    protected boolean fitSystemWindows(Rect rect)
    {
        boolean flag = super.fitSystemWindows(rect);
        if (!flag)
        {
            int i = mChildrenCount;
            View aview[] = mChildren;
            int j = 0;
            do
            {
                if (j >= i)
                    break;
                flag = aview[j].fitSystemWindows(rect);
                if (flag)
                    break;
                j++;
            } while (true);
        }
        return flag;
    }

    public View focusSearch(View view, int i)
    {
        if (isRootNamespace())
            return FocusFinder.getInstance().findNextFocus(this, view, i);
        if (super.mParent != null)
            return super.mParent.focusSearch(view, i);
        else
            return null;
    }

    public void focusableViewAvailable(View view)
    {
        if (super.mParent != null && getDescendantFocusability() != 0x60000 && (!isFocused() || getDescendantFocusability() == 0x40000))
            super.mParent.focusableViewAvailable(view);
    }

    public boolean gatherTransparentRegion(Region region)
    {
        boolean flag2;
label0:
        {
            boolean flag;
            if ((0x200 & super.mPrivateFlags) == 0)
                flag = true;
            else
                flag = false;
            if (flag && region == null)
                return true;
            super.gatherTransparentRegion(region);
            View aview[] = mChildren;
            int i = mChildrenCount;
            boolean flag1 = true;
            for (int j = 0; j < i; j++)
            {
                View view = aview[j];
                if (((0xc & view.mViewFlags) == 0 || view.getAnimation() != null) && !view.gatherTransparentRegion(region))
                    flag1 = false;
            }

            if (!flag)
            {
                flag2 = false;
                if (!flag1)
                    break label0;
            }
            flag2 = true;
        }
        return flag2;
    }

    protected LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams(-2, -2);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected LayoutParams generateLayoutParams(LayoutParams layoutparams)
    {
        return layoutparams;
    }

    public View getChildAt(int i)
    {
        if (i >= 0 && i < mChildrenCount)
            return mChildren[i];
        else
            return null;
    }

    public int getChildCount()
    {
        return mChildrenCount;
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        return j;
    }

    protected boolean getChildStaticTransformation(View view, Transformation transformation)
    {
        return false;
    }

    public boolean getChildVisibleRect(View view, Rect rect, Point point)
    {
        RectF rectf;
        if (super.mAttachInfo != null)
            rectf = super.mAttachInfo.mTmpTransformRect;
        else
            rectf = new RectF();
        rectf.set(rect);
        if (!view.hasIdentityMatrix())
            view.getMatrix().mapRect(rectf);
        int i = view.mLeft - super.mScrollX;
        int j = view.mTop - super.mScrollY;
        rectf.offset(i, j);
        if (point != null)
        {
            if (!view.hasIdentityMatrix())
            {
                float af[];
                if (super.mAttachInfo != null)
                    af = super.mAttachInfo.mTmpTransformLocation;
                else
                    af = new float[2];
                af[0] = point.x;
                af[1] = point.y;
                view.getMatrix().mapPoints(af);
                point.x = (int)(0.5F + af[0]);
                point.y = (int)(0.5F + af[1]);
            }
            point.x = i + point.x;
            point.y = j + point.y;
        }
        if (rectf.intersect(0.0F, 0.0F, super.mRight - super.mLeft, super.mBottom - super.mTop))
        {
            if (super.mParent == null)
            {
                return true;
            } else
            {
                rect.set((int)(0.5F + rectf.left), (int)(0.5F + rectf.top), (int)(0.5F + rectf.right), (int)(0.5F + rectf.bottom));
                return super.mParent.getChildVisibleRect(this, rect, point);
            }
        } else
        {
            return false;
        }
    }

    public int getDescendantFocusability()
    {
        return 0x60000 & mGroupFlags;
    }

    public View getFocusedChild()
    {
        return mFocused;
    }

    public LayoutAnimationController getLayoutAnimation()
    {
        return mLayoutAnimationController;
    }

    public android.view.animation.Animation.AnimationListener getLayoutAnimationListener()
    {
        return mAnimationListener;
    }

    public int getLayoutMode()
    {
        return mLayoutMode;
    }

    public LayoutTransition getLayoutTransition()
    {
        return mTransition;
    }

    public int getPersistentDrawingCache()
    {
        return mPersistentDrawingCache;
    }

    void handleFocusGainInternal(int i, Rect rect)
    {
        if (mFocused != null)
        {
            mFocused.unFocus();
            mFocused = null;
        }
        super.handleFocusGainInternal(i, rect);
    }

    public boolean hasFocus()
    {
        return (2 & super.mPrivateFlags) != 0 || mFocused != null;
    }

    public boolean hasFocusable()
    {
        if ((0xc & super.mViewFlags) == 0)
        {
            if (isFocusable())
                return true;
            if (getDescendantFocusability() != 0x60000)
            {
                int i = mChildrenCount;
                View aview[] = mChildren;
                for (int j = 0; j < i; j++)
                    if (aview[j].hasFocusable())
                        return true;

            }
        }
        return false;
    }

    protected boolean hasHoveredChild()
    {
        return mFirstHoverTarget != null;
    }

    public boolean hasTransientState()
    {
        return mChildCountWithTransientState > 0 || super.hasTransientState();
    }

    public int indexOfChild(View view)
    {
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            if (aview[j] == view)
                return j;

        return -1;
    }

    protected void internalSetPadding(int i, int j, int k, int l)
    {
        super.internalSetPadding(i, j, k, l);
        if ((super.mPaddingLeft | super.mPaddingTop | super.mPaddingRight | super.mPaddingBottom) != 0)
        {
            mGroupFlags = 0x20 | mGroupFlags;
            return;
        } else
        {
            mGroupFlags = 0xffffffdf & mGroupFlags;
            return;
        }
    }

    public final void invalidateChild(View view, Rect rect)
    {
        Object obj = this;
        View.AttachInfo attachinfo = super.mAttachInfo;
        if (attachinfo != null)
        {
            boolean flag;
            if ((0x40 & view.mPrivateFlags) == 64)
                flag = true;
            else
                flag = false;
            Matrix matrix = view.getMatrix();
            boolean flag1;
            if (view.isOpaque() && !flag && view.getAnimation() == null && matrix.isIdentity())
                flag1 = true;
            else
                flag1 = false;
            int i;
            if (flag1)
                i = 0x400000;
            else
                i = 0x200000;
            if (view.mLayerType != 0)
            {
                super.mPrivateFlags = 0x80000000 | super.mPrivateFlags;
                super.mPrivateFlags = 0xffff7fff & super.mPrivateFlags;
                view.mLocalDirtyRect.union(rect);
            }
            int ai[] = attachinfo.mInvalidateChildLocation;
            ai[0] = view.mLeft;
            ai[1] = view.mTop;
            if (!matrix.isIdentity() || (0x800 & mGroupFlags) != 0)
            {
                RectF rectf = attachinfo.mTmpTransformRect;
                rectf.set(rect);
                Matrix matrix1;
                if ((0x800 & mGroupFlags) != 0)
                {
                    Transformation transformation = attachinfo.mTmpTransformation;
                    if (getChildStaticTransformation(view, transformation))
                    {
                        matrix1 = attachinfo.mTmpMatrix;
                        matrix1.set(transformation.getMatrix());
                        if (!matrix.isIdentity())
                            matrix1.preConcat(matrix);
                    } else
                    {
                        matrix1 = matrix;
                    }
                } else
                {
                    matrix1 = matrix;
                }
                matrix1.mapRect(rectf);
                rect.set((int)(rectf.left - 0.5F), (int)(rectf.top - 0.5F), (int)(0.5F + rectf.right), (int)(0.5F + rectf.bottom));
            }
            do
            {
                boolean flag2 = obj instanceof View;
                View view1 = null;
                if (flag2)
                    view1 = (View)obj;
                if (flag)
                    if (view1 != null)
                    {
                        int k = 0x40 | view1.mPrivateFlags;
                        view1.mPrivateFlags = k;
                    } else
                    if (obj instanceof ViewRootImpl)
                        ((ViewRootImpl)obj).mIsAnimating = true;
                if (view1 != null)
                {
                    if ((0x3000 & view1.mViewFlags) != 0 && view1.getSolidColor() == 0)
                        i = 0x200000;
                    if ((0x600000 & view1.mPrivateFlags) != 0x200000)
                    {
                        int j = i | 0xff9fffff & view1.mPrivateFlags;
                        view1.mPrivateFlags = j;
                    }
                }
                obj = ((ViewParent) (obj)).invalidateChildInParent(ai, rect);
                if (view1 != null)
                {
                    Matrix matrix2 = view1.getMatrix();
                    if (!matrix2.isIdentity())
                    {
                        RectF rectf1 = attachinfo.mTmpTransformRect;
                        rectf1.set(rect);
                        matrix2.mapRect(rectf1);
                        rect.set((int)(rectf1.left - 0.5F), (int)(rectf1.top - 0.5F), (int)(0.5F + rectf1.right), (int)(0.5F + rectf1.bottom));
                    }
                }
            } while (obj != null);
        }
    }

    public void invalidateChildFast(View view, Rect rect)
    {
        Object obj = this;
        View.AttachInfo attachinfo = super.mAttachInfo;
        if (attachinfo != null)
        {
            if (view.mLayerType != 0)
                view.mLocalDirtyRect.union(rect);
            int i = view.mLeft;
            int j = view.mTop;
            if (!view.getMatrix().isIdentity())
                view.transformRect(rect);
            do
                if (obj instanceof ViewGroup)
                {
                    ViewGroup viewgroup = (ViewGroup)obj;
                    if (((View) (viewgroup)).mLayerType != 0)
                    {
                        viewgroup.invalidate();
                        obj = null;
                    } else
                    {
                        obj = viewgroup.invalidateChildInParentFast(i, j, rect);
                        i = ((View) (viewgroup)).mLeft;
                        j = ((View) (viewgroup)).mTop;
                    }
                } else
                {
                    int ai[] = attachinfo.mInvalidateChildLocation;
                    ai[0] = i;
                    ai[1] = j;
                    obj = ((ViewParent) (obj)).invalidateChildInParent(ai, rect);
                }
            while (obj != null);
        }
    }

    public ViewParent invalidateChildInParent(int ai[], Rect rect)
    {
        if ((0x20 & super.mPrivateFlags) != 32 && (0x8000 & super.mPrivateFlags) != 32768)
            return null;
        if ((0x90 & mGroupFlags) != 128)
        {
            rect.offset(ai[0] - super.mScrollX, ai[1] - super.mScrollY);
            int i = super.mLeft;
            int j = super.mTop;
            if ((1 & mGroupFlags) == 1 && !rect.intersect(0, 0, super.mRight - i, super.mBottom - j))
                rect.setEmpty();
            super.mPrivateFlags = 0xffff7fff & super.mPrivateFlags;
            ai[0] = i;
            ai[1] = j;
            if (super.mLayerType != 0)
            {
                super.mPrivateFlags = 0x80000000 | super.mPrivateFlags;
                super.mLocalDirtyRect.union(rect);
            }
            return super.mParent;
        }
        super.mPrivateFlags = 0xffff7fdf & super.mPrivateFlags;
        ai[0] = super.mLeft;
        ai[1] = super.mTop;
        if ((1 & mGroupFlags) == 1)
            rect.set(0, 0, super.mRight - super.mLeft, super.mBottom - super.mTop);
        else
            rect.union(0, 0, super.mRight - super.mLeft, super.mBottom - super.mTop);
        if (super.mLayerType != 0)
        {
            super.mPrivateFlags = 0x80000000 | super.mPrivateFlags;
            super.mLocalDirtyRect.union(rect);
        }
        return super.mParent;
    }

    public boolean isAlwaysDrawnWithCacheEnabled()
    {
        return (0x4000 & mGroupFlags) == 16384;
    }

    public boolean isAnimationCacheEnabled()
    {
        return (0x40 & mGroupFlags) == 64;
    }

    protected boolean isChildrenDrawingOrderEnabled()
    {
        return (0x400 & mGroupFlags) == 1024;
    }

    protected boolean isChildrenDrawnWithCacheEnabled()
    {
        return (0x8000 & mGroupFlags) == 32768;
    }

    public boolean isMotionEventSplittingEnabled()
    {
        return (0x200000 & mGroupFlags) == 0x200000;
    }

    protected boolean isTransformedTouchPointInView(float f, float f1, View view, PointF pointf)
    {
        float f2 = (f + (float)super.mScrollX) - (float)view.mLeft;
        float f3 = (f1 + (float)super.mScrollY) - (float)view.mTop;
        if (!view.hasIdentityMatrix() && super.mAttachInfo != null)
        {
            float af[] = super.mAttachInfo.mTmpTransformLocation;
            af[0] = f2;
            af[1] = f3;
            view.getInverseMatrix().mapPoints(af);
            f2 = af[0];
            f3 = af[1];
        }
        boolean flag = view.pointInView(f2, f3);
        if (flag && pointf != null)
            pointf.set(f2, f3);
        return flag;
    }

    boolean isViewTransitioning(View view)
    {
        return mTransitioningViews != null && mTransitioningViews.contains(view);
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
            aview[j].jumpDrawablesToCurrentState();

    }

    public final void layout(int i, int j, int k, int l)
    {
        if (mTransition != null && mTransition.isChangingLayout())
        {
            mLayoutSuppressed = true;
            return;
        }
        if (mTransition != null)
            mTransition.layoutChange(this);
        super.layout(i, j, k, l);
    }

    public void makeOptionalFitsSystemWindows()
    {
        super.makeOptionalFitsSystemWindows();
        int i = mChildrenCount;
        View aview[] = mChildren;
        for (int j = 0; j < i; j++)
            aview[j].makeOptionalFitsSystemWindows();

    }

    protected void measureChild(View view, int i, int j)
    {
        LayoutParams layoutparams = view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, super.mPaddingLeft + super.mPaddingRight, layoutparams.width), getChildMeasureSpec(j, super.mPaddingTop + super.mPaddingBottom, layoutparams.height));
    }

    protected void measureChildWithMargins(View view, int i, int j, int k, int l)
    {
        MarginLayoutParams marginlayoutparams = (MarginLayoutParams)view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, j + (super.mPaddingLeft + super.mPaddingRight + marginlayoutparams.leftMargin + marginlayoutparams.rightMargin), ((LayoutParams) (marginlayoutparams)).width), getChildMeasureSpec(k, l + (super.mPaddingTop + super.mPaddingBottom + marginlayoutparams.topMargin + marginlayoutparams.bottomMargin), ((LayoutParams) (marginlayoutparams)).height));
    }

    protected void measureChildren(int i, int j)
    {
        int k = mChildrenCount;
        View aview[] = mChildren;
        for (int l = 0; l < k; l++)
        {
            View view = aview[l];
            if ((0xc & view.mViewFlags) != 8)
                measureChild(view, i, j);
        }

    }

    boolean notifyChildOfDrag(View view)
    {
        boolean flag = mDragNotifiedChildren.contains(view);
        boolean flag1 = false;
        if (!flag)
        {
            mDragNotifiedChildren.add(view);
            flag1 = view.dispatchDragEvent(mCurrentDrag);
            if (flag1 && !view.canAcceptDrag())
            {
                view.mPrivateFlags2 = 1 | view.mPrivateFlags2;
                view.refreshDrawableState();
            }
        }
        return flag1;
    }

    public void offsetChildrenTopAndBottom(int i)
    {
        int j = mChildrenCount;
        View aview[] = mChildren;
        for (int k = 0; k < j; k++)
        {
            View view = aview[k];
            view.mTop = i + view.mTop;
            view.mBottom = i + view.mBottom;
            if (view.mDisplayList != null)
            {
                view.mDisplayList.offsetTopBottom(i);
                invalidateViewProperty(false, false);
            }
        }

    }

    public final void offsetDescendantRectToMyCoords(View view, Rect rect)
    {
        offsetRectBetweenParentAndChild(view, rect, true, false);
    }

    void offsetRectBetweenParentAndChild(View view, Rect rect, boolean flag, boolean flag1)
    {
        if (view == this)
            return;
        ViewParent viewparent;
        for (viewparent = view.mParent; viewparent != null && (viewparent instanceof View) && viewparent != this; viewparent = view.mParent)
        {
            if (flag)
            {
                rect.offset(view.mLeft - view.mScrollX, view.mTop - view.mScrollY);
                if (flag1)
                {
                    View view2 = (View)viewparent;
                    rect.intersect(0, 0, view2.mRight - view2.mLeft, view2.mBottom - view2.mTop);
                }
            } else
            {
                if (flag1)
                {
                    View view1 = (View)viewparent;
                    rect.intersect(0, 0, view1.mRight - view1.mLeft, view1.mBottom - view1.mTop);
                }
                rect.offset(view.mScrollX - view.mLeft, view.mScrollY - view.mTop);
            }
            view = (View)viewparent;
        }

        if (viewparent == this)
        {
            if (flag)
            {
                rect.offset(view.mLeft - view.mScrollX, view.mTop - view.mScrollY);
                return;
            } else
            {
                rect.offset(view.mScrollX - view.mLeft, view.mScrollY - view.mTop);
                return;
            }
        } else
        {
            Log.e("ViewGroup", (new StringBuilder()).append("parameter must be a descendant of this view, this = ").append(this).append(" descendant = ").append(view).append(" theParent = ").append(viewparent).toString());
            debug();
            throw new IllegalArgumentException("parameter must be a descendant of this view");
        }
    }

    public final void offsetRectIntoDescendantCoords(View view, Rect rect)
    {
        offsetRectBetweenParentAndChild(view, rect, false, false);
    }

    protected void onAnimationEnd()
    {
        super.onAnimationEnd();
        if ((0x40 & mGroupFlags) == 64)
        {
            mGroupFlags = 0xffff7fff & mGroupFlags;
            if ((1 & mPersistentDrawingCache) == 0)
                setChildrenDrawingCacheEnabled(false);
        }
    }

    protected void onAnimationStart()
    {
        super.onAnimationStart();
        if ((0x40 & mGroupFlags) == 64)
        {
            int i = mChildrenCount;
            View aview[] = mChildren;
            boolean flag;
            if (!isHardwareAccelerated())
                flag = true;
            else
                flag = false;
            for (int j = 0; j < i; j++)
            {
                View view = aview[j];
                if ((0xc & view.mViewFlags) != 0)
                    continue;
                view.setDrawingCacheEnabled(true);
                if (flag)
                    view.buildDrawingCache(true);
            }

            mGroupFlags = 0x8000 | mGroupFlags;
        }
    }

    protected void onChildVisibilityChanged(View view, int i, int j)
    {
        if (mTransition != null)
            if (j == 0)
            {
                mTransition.showChild(this, view, i);
            } else
            {
                mTransition.hideChild(this, view, j);
                if (mTransitioningViews != null && mTransitioningViews.contains(view))
                {
                    if (mVisibilityChangingChildren == null)
                        mVisibilityChangingChildren = new ArrayList();
                    mVisibilityChangingChildren.add(view);
                    addDisappearingView(view);
                }
            }
        if (mCurrentDrag != null && j == 0)
            notifyChildOfDrag(view);
    }

    protected int[] onCreateDrawableState(int i)
    {
        int ai[];
        if ((0x2000 & mGroupFlags) == 0)
        {
            ai = super.onCreateDrawableState(i);
        } else
        {
            int j = 0;
            int k = getChildCount();
            for (int l = 0; l < k; l++)
            {
                int ai2[] = getChildAt(l).getDrawableState();
                if (ai2 != null)
                    j += ai2.length;
            }

            ai = super.onCreateDrawableState(i + j);
            for (int i1 = 0; i1 < k; i1++)
            {
                int ai1[] = getChildAt(i1).getDrawableState();
                if (ai1 != null)
                    ai = mergeDrawableStates(ai, ai1);
            }

        }
        return ai;
    }

    protected void onDebugDraw(Canvas canvas)
    {
        if (getLayoutMode() == 1)
        {
            for (int j = 0; j < getChildCount(); j++)
            {
                View view1 = getChildAt(j);
                Insets insets = view1.getOpticalInsets();
                drawRect(canvas, view1.getLeft() + insets.left, view1.getTop() + insets.top, view1.getRight() - insets.right, view1.getBottom() - insets.bottom, 0xffff0000);
            }

        }
        onDebugDrawMargins(canvas);
        for (int i = 0; i < getChildCount(); i++)
        {
            View view = getChildAt(i);
            drawRect(canvas, view.getLeft(), view.getTop(), view.getRight(), view.getBottom(), 0xff0000ff);
        }

    }

    protected void onDebugDrawMargins(Canvas canvas)
    {
        for (int i = 0; i < getChildCount(); i++)
        {
            View view = getChildAt(i);
            view.getLayoutParams().onDebugDraw(view, canvas);
        }

    }

    void onInitializeAccessibilityEventInternal(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEventInternal(accessibilityevent);
        accessibilityevent.setClassName(android/view/ViewGroup.getName());
    }

    void onInitializeAccessibilityNodeInfoInternal(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfoInternal(accessibilitynodeinfo);
        if (super.mAttachInfo != null)
        {
            ArrayList arraylist = super.mAttachInfo.mTempArrayList;
            arraylist.clear();
            addChildrenForAccessibility(arraylist);
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
                accessibilitynodeinfo.addChild((View)arraylist.get(j));

            arraylist.clear();
        }
    }

    public boolean onInterceptHoverEvent(MotionEvent motionevent)
    {
        return false;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return false;
    }

    protected abstract void onLayout(boolean flag, int i, int j, int k, int l);

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        int j = mChildrenCount;
        int k;
        byte byte0;
        int l;
        if ((i & 2) != 0)
        {
            k = 0;
            byte0 = 1;
            l = j;
        } else
        {
            k = j - 1;
            byte0 = -1;
            l = -1;
        }
        View aview[] = mChildren;
        for (int i1 = k; i1 != l; i1 += byte0)
        {
            View view = aview[i1];
            if ((0xc & view.mViewFlags) == 0 && view.requestFocus(i, rect))
                return true;
        }

        return false;
    }

    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (super.mAccessibilityDelegate != null)
            return super.mAccessibilityDelegate.onRequestSendAccessibilityEvent(this, view, accessibilityevent);
        else
            return onRequestSendAccessibilityEventInternal(view, accessibilityevent);
    }

    boolean onRequestSendAccessibilityEventInternal(View view, AccessibilityEvent accessibilityevent)
    {
        return true;
    }

    protected void onSetLayoutParams(View view, LayoutParams layoutparams)
    {
    }

    protected void onViewAdded(View view)
    {
        if (mOnHierarchyChangeListener != null)
            mOnHierarchyChangeListener.onChildViewAdded(this, view);
    }

    protected void onViewRemoved(View view)
    {
        if (mOnHierarchyChangeListener != null)
            mOnHierarchyChangeListener.onChildViewRemoved(this, view);
    }

    public void recomputeViewAttributes(View view)
    {
        if (super.mAttachInfo != null && !super.mAttachInfo.mRecomputeGlobalAttributes)
        {
            ViewParent viewparent = super.mParent;
            if (viewparent != null)
                viewparent.recomputeViewAttributes(this);
        }
    }

    public void removeAllViews()
    {
        removeAllViewsInLayout();
        requestLayout();
        invalidate(true);
    }

    public void removeAllViewsInLayout()
    {
        int i = mChildrenCount;
        if (i > 0)
        {
            View aview[] = mChildren;
            mChildrenCount = 0;
            View view = mFocused;
            boolean flag;
            if (super.mAttachInfo != null)
                flag = true;
            else
                flag = false;
            View view1 = null;
            needGlobalAttributesUpdate(false);
            for (int j = i - 1; j >= 0; j--)
            {
                View view2 = aview[j];
                if (mTransition != null)
                    mTransition.removeChild(this, view2);
                if (view2 == view)
                {
                    view2.unFocus();
                    view1 = view2;
                }
                view2.clearAccessibilityFocus();
                cancelTouchTarget(view2);
                cancelHoverTarget(view2);
                if (view2.getAnimation() == null && (mTransitioningViews == null || !mTransitioningViews.contains(view2)))
                {
                    if (flag)
                        view2.dispatchDetachedFromWindow();
                } else
                {
                    addDisappearingView(view2);
                }
                if (view2.hasTransientState())
                    childHasTransientStateChanged(view2, false);
                onViewRemoved(view2);
                view2.mParent = null;
                aview[j] = null;
            }

            if (view1 != null)
            {
                clearChildFocus(view1);
                ensureInputFocusOnFirstFocusable();
                return;
            }
        }
    }

    protected void removeDetachedView(View view, boolean flag)
    {
        if (mTransition != null)
            mTransition.removeChild(this, view);
        if (view == mFocused)
            view.clearFocus();
        view.clearAccessibilityFocus();
        cancelTouchTarget(view);
        cancelHoverTarget(view);
        if ((!flag || view.getAnimation() == null) && (mTransitioningViews == null || !mTransitioningViews.contains(view)))
        {
            if (view.mAttachInfo != null)
                view.dispatchDetachedFromWindow();
        } else
        {
            addDisappearingView(view);
        }
        if (view.hasTransientState())
            childHasTransientStateChanged(view, false);
        onViewRemoved(view);
    }

    public void removeView(View view)
    {
        removeViewInternal(view);
        requestLayout();
        invalidate(true);
    }

    public void removeViewAt(int i)
    {
        removeViewInternal(i, getChildAt(i));
        requestLayout();
        invalidate(true);
    }

    public void removeViewInLayout(View view)
    {
        removeViewInternal(view);
    }

    public void removeViews(int i, int j)
    {
        removeViewsInternal(i, j);
        requestLayout();
        invalidate(true);
    }

    public void removeViewsInLayout(int i, int j)
    {
        removeViewsInternal(i, j);
    }

    public void requestChildFocus(View view, View view1)
    {
        if (getDescendantFocusability() != 0x60000)
        {
            super.unFocus();
            if (mFocused != view)
            {
                if (mFocused != null)
                    mFocused.unFocus();
                mFocused = view;
            }
            if (super.mParent != null)
            {
                super.mParent.requestChildFocus(this, view1);
                return;
            }
        }
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean flag)
    {
        return false;
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
        boolean flag1;
        if ((0x80000 & mGroupFlags) != 0)
            flag1 = true;
        else
            flag1 = false;
        if (flag != flag1)
        {
            if (flag)
                mGroupFlags = 0x80000 | mGroupFlags;
            else
                mGroupFlags = 0xfff7ffff & mGroupFlags;
            if (super.mParent != null)
            {
                super.mParent.requestDisallowInterceptTouchEvent(flag);
                return;
            }
        }
    }

    public boolean requestFocus(int i, Rect rect)
    {
        int j;
label0:
        {
            j = getDescendantFocusability();
            boolean flag;
            switch (j)
            {
            default:
                break label0;

            case 262144: 
                flag = onRequestFocusInDescendants(i, rect);
                if (!flag)
                    return super.requestFocus(i, rect);
                break;

            case 131072: 
                flag = super.requestFocus(i, rect);
                if (!flag)
                    return onRequestFocusInDescendants(i, rect);
                break;

            case 393216: 
                flag = super.requestFocus(i, rect);
                break;
            }
            return flag;
        }
        throw new IllegalStateException((new StringBuilder()).append("descendant focusability must be one of FOCUS_BEFORE_DESCENDANTS, FOCUS_AFTER_DESCENDANTS, FOCUS_BLOCK_DESCENDANTS but is ").append(j).toString());
    }

    public boolean requestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        ViewParent viewparent = super.mParent;
        if (viewparent != null && onRequestSendAccessibilityEvent(view, accessibilityevent))
            return viewparent.requestSendAccessibilityEvent(this, accessibilityevent);
        else
            return false;
    }

    public void requestTransitionStart(LayoutTransition layouttransition)
    {
        ViewRootImpl viewrootimpl = getViewRootImpl();
        if (viewrootimpl != null)
            viewrootimpl.requestTransitionStart(layouttransition);
    }

    public void requestTransparentRegion(View view)
    {
        if (view != null)
        {
            view.mPrivateFlags = 0x200 | view.mPrivateFlags;
            if (super.mParent != null)
                super.mParent.requestTransparentRegion(this);
        }
    }

    public void resetAccessibilityStateChanged()
    {
        super.resetAccessibilityStateChanged();
        View aview[] = mChildren;
        int i = mChildrenCount;
        for (int j = 0; j < i; j++)
            aview[j].resetAccessibilityStateChanged();

    }

    protected void resetResolvedDrawables()
    {
        super.resetResolvedDrawables();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resetResolvedDrawables();
        }

    }

    public void resetResolvedLayoutDirection()
    {
        super.resetResolvedLayoutDirection();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resetResolvedLayoutDirection();
        }

    }

    public void resetResolvedPadding()
    {
        super.resetResolvedPadding();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resetResolvedPadding();
        }

    }

    public void resetResolvedTextAlignment()
    {
        super.resetResolvedTextAlignment();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isTextAlignmentInherited())
                view.resetResolvedTextAlignment();
        }

    }

    public void resetResolvedTextDirection()
    {
        super.resetResolvedTextDirection();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isTextDirectionInherited())
                view.resetResolvedTextDirection();
        }

    }

    protected void resolveDrawables()
    {
        super.resolveDrawables();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resolveDrawables();
        }

    }

    public boolean resolveLayoutDirection()
    {
        boolean flag = super.resolveLayoutDirection();
        if (flag)
        {
            int i = getChildCount();
            for (int j = 0; j < i; j++)
            {
                View view = getChildAt(j);
                if (view.isLayoutDirectionInherited())
                    view.resolveLayoutDirection();
            }

        }
        return flag;
    }

    public void resolveLayoutParams()
    {
        super.resolveLayoutParams();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            getChildAt(j).resolveLayoutParams();

    }

    public void resolvePadding()
    {
        super.resolvePadding();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resolvePadding();
        }

    }

    public void resolveRtlPropertiesIfNeeded()
    {
        super.resolveRtlPropertiesIfNeeded();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.isLayoutDirectionInherited())
                view.resolveRtlPropertiesIfNeeded();
        }

    }

    public boolean resolveTextAlignment()
    {
        boolean flag = super.resolveTextAlignment();
        if (flag)
        {
            int i = getChildCount();
            for (int j = 0; j < i; j++)
            {
                View view = getChildAt(j);
                if (view.isTextAlignmentInherited())
                    view.resolveTextAlignment();
            }

        }
        return flag;
    }

    public boolean resolveTextDirection()
    {
        boolean flag = super.resolveTextDirection();
        if (flag)
        {
            int i = getChildCount();
            for (int j = 0; j < i; j++)
            {
                View view = getChildAt(j);
                if (view.isTextDirectionInherited())
                    view.resolveTextDirection();
            }

        }
        return flag;
    }

    public void scheduleLayoutAnimation()
    {
        mGroupFlags = 8 | mGroupFlags;
    }

    public void setAddStatesFromChildren(boolean flag)
    {
        if (flag)
            mGroupFlags = 0x2000 | mGroupFlags;
        else
            mGroupFlags = 0xffffdfff & mGroupFlags;
        refreshDrawableState();
    }

    public void setAlwaysDrawnWithCacheEnabled(boolean flag)
    {
        setBooleanFlag(16384, flag);
    }

    public void setAnimationCacheEnabled(boolean flag)
    {
        setBooleanFlag(64, flag);
    }

    protected void setChildrenDrawingCacheEnabled(boolean flag)
    {
        if (flag || (3 & mPersistentDrawingCache) != 3)
        {
            View aview[] = mChildren;
            int i = mChildrenCount;
            for (int j = 0; j < i; j++)
                aview[j].setDrawingCacheEnabled(flag);

        }
    }

    protected void setChildrenDrawingOrderEnabled(boolean flag)
    {
        setBooleanFlag(1024, flag);
    }

    protected void setChildrenDrawnWithCacheEnabled(boolean flag)
    {
        setBooleanFlag(32768, flag);
    }

    public void setClipChildren(boolean flag)
    {
        boolean flag1;
        if ((1 & mGroupFlags) == 1)
            flag1 = true;
        else
            flag1 = false;
        if (flag != flag1)
        {
            setBooleanFlag(1, flag);
            for (int i = 0; i < mChildrenCount; i++)
            {
                View view = getChildAt(i);
                if (view.mDisplayList != null)
                    view.mDisplayList.setClipChildren(flag);
            }

        }
    }

    public void setClipToPadding(boolean flag)
    {
        setBooleanFlag(2, flag);
    }

    public void setDescendantFocusability(int i)
    {
        switch (i)
        {
        case 131072: 
        case 262144: 
        case 393216: 
            mGroupFlags = 0xfff9ffff & mGroupFlags;
            mGroupFlags = mGroupFlags | 0x60000 & i;
            return;
        }
        throw new IllegalArgumentException("must be one of FOCUS_BEFORE_DESCENDANTS, FOCUS_AFTER_DESCENDANTS, FOCUS_BLOCK_DESCENDANTS");
    }

    public void setLayoutAnimation(LayoutAnimationController layoutanimationcontroller)
    {
        mLayoutAnimationController = layoutanimationcontroller;
        if (mLayoutAnimationController != null)
            mGroupFlags = 8 | mGroupFlags;
    }

    public void setLayoutAnimationListener(android.view.animation.Animation.AnimationListener animationlistener)
    {
        mAnimationListener = animationlistener;
    }

    public void setLayoutMode(int i)
    {
        if (mLayoutMode != i)
        {
            mLayoutMode = i;
            requestLayout();
        }
    }

    public void setLayoutTransition(LayoutTransition layouttransition)
    {
        if (mTransition != null)
            mTransition.removeTransitionListener(mLayoutTransitionListener);
        mTransition = layouttransition;
        if (mTransition != null)
            mTransition.addTransitionListener(mLayoutTransitionListener);
    }

    public void setMotionEventSplittingEnabled(boolean flag)
    {
        if (flag)
        {
            mGroupFlags = 0x200000 | mGroupFlags;
            return;
        } else
        {
            mGroupFlags = 0xffdfffff & mGroupFlags;
            return;
        }
    }

    public void setOnHierarchyChangeListener(OnHierarchyChangeListener onhierarchychangelistener)
    {
        mOnHierarchyChangeListener = onhierarchychangelistener;
    }

    public void setPersistentDrawingCache(int i)
    {
        mPersistentDrawingCache = i & 3;
    }

    protected void setStaticTransformationsEnabled(boolean flag)
    {
        setBooleanFlag(2048, flag);
    }

    public boolean shouldDelayChildPressedState()
    {
        return true;
    }

    public boolean showContextMenuForChild(View view)
    {
        return super.mParent != null && super.mParent.showContextMenuForChild(view);
    }

    public ActionMode startActionModeForChild(View view, ActionMode.Callback callback)
    {
        if (super.mParent != null)
            return super.mParent.startActionModeForChild(view, callback);
        else
            return null;
    }

    public void startLayoutAnimation()
    {
        if (mLayoutAnimationController != null)
        {
            mGroupFlags = 8 | mGroupFlags;
            requestLayout();
        }
    }

    public void startViewTransition(View view)
    {
        if (view.mParent == this)
        {
            if (mTransitioningViews == null)
                mTransitioningViews = new ArrayList();
            mTransitioningViews.add(view);
        }
    }

    void unFocus()
    {
        if (mFocused == null)
        {
            super.unFocus();
            return;
        } else
        {
            mFocused.unFocus();
            mFocused = null;
            return;
        }
    }

    boolean updateLocalSystemUiVisibility(int i, int j)
    {
        boolean flag = super.updateLocalSystemUiVisibility(i, j);
        int k = mChildrenCount;
        View aview[] = mChildren;
        for (int l = 0; l < k; l++)
            flag |= aview[l].updateLocalSystemUiVisibility(i, j);

        return flag;
    }

    public void updateViewLayout(View view, LayoutParams layoutparams)
    {
        if (!checkLayoutParams(layoutparams))
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid LayoutParams supplied to ").append(this).toString());
        if (view.mParent != this)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Given view not a child of ").append(this).toString());
        } else
        {
            view.setLayoutParams(layoutparams);
            return;
        }
    }







/*
    static boolean access$302(ViewGroup viewgroup, boolean flag)
    {
        viewgroup.mLayoutSuppressed = flag;
        return flag;
    }

*/


}
