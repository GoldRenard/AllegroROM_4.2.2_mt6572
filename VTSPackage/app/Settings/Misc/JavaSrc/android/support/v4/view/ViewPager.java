// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.lang.reflect.Method;
import java.util.*;

// Referenced classes of package android.support.v4.view:
//            PagerAdapter, ViewCompat, MotionEventCompat, VelocityTrackerCompat, 
//            KeyEventCompat, ViewConfigurationCompat, AccessibilityDelegateCompat

public class ViewPager extends ViewGroup
{
    static interface Decor
    {
    }

    static class ItemInfo
    {

        Object object;
        float offset;
        int position;
        boolean scrolling;
        float widthFactor;

    }

    public static class LayoutParams extends android.view.ViewGroup.LayoutParams
    {

        int childIndex;
        public int gravity;
        public boolean isDecor;
        boolean needsMeasure;
        int position;
        float widthFactor;

        public LayoutParams()
        {
            super(-1, -1);
            widthFactor = 0.0F;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            widthFactor = 0.0F;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, ViewPager.LAYOUT_ATTRS);
            gravity = typedarray.getInteger(0, 48);
            typedarray.recycle();
        }
    }

    class MyAccessibilityDelegate extends AccessibilityDelegateCompat
    {

        final ViewPager this$0;

        public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
        {
            super.onInitializeAccessibilityEvent(view, accessibilityevent);
            accessibilityevent.setClassName(android/support/v4/view/ViewPager.getName());
        }

        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilitynodeinfocompat)
        {
            boolean flag = true;
            super.onInitializeAccessibilityNodeInfo(view, accessibilitynodeinfocompat);
            accessibilitynodeinfocompat.setClassName(android/support/v4/view/ViewPager.getName());
            if (mAdapter == null || mAdapter.getCount() <= flag)
                flag = false;
            accessibilitynodeinfocompat.setScrollable(flag);
            if (mAdapter != null && mCurItem >= 0 && mCurItem < -1 + mAdapter.getCount())
                accessibilitynodeinfocompat.addAction(4096);
            if (mAdapter != null && mCurItem > 0 && mCurItem < mAdapter.getCount())
                accessibilitynodeinfocompat.addAction(8192);
        }

        public boolean performAccessibilityAction(View view, int i, Bundle bundle)
        {
            if (super.performAccessibilityAction(view, i, bundle))
                return true;
            switch (i)
            {
            case 8192: 
                if (mAdapter != null && mCurItem > 0 && mCurItem < mAdapter.getCount())
                {
                    setCurrentItem(-1 + mCurItem);
                    return true;
                } else
                {
                    return false;
                }

            case 4096: 
                if (mAdapter != null && mCurItem >= 0 && mCurItem < -1 + mAdapter.getCount())
                {
                    setCurrentItem(1 + mCurItem);
                    return true;
                } else
                {
                    return false;
                }
            }
            return false;
        }

        MyAccessibilityDelegate()
        {
            this$0 = ViewPager.this;
            super();
        }
    }

    static interface OnAdapterChangeListener
    {

        public abstract void onAdapterChanged(PagerAdapter pageradapter, PagerAdapter pageradapter1);
    }

    public static interface OnPageChangeListener
    {

        public abstract void onPageScrollStateChanged(int i);

        public abstract void onPageScrolled(int i, float f, int j);

        public abstract void onPageSelected(int i);
    }

    public static interface PageTransformer
    {

        public abstract void transformPage(View view, float f);
    }

    private class PagerObserver extends DataSetObserver
    {

        final ViewPager this$0;

        public void onChanged()
        {
            dataSetChanged();
        }

        public void onInvalidated()
        {
            dataSetChanged();
        }

        private PagerObserver()
        {
            this$0 = ViewPager.this;
            super();
        }

    }

    public static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks() {

            public SavedState createFromParcel(Parcel parcel, ClassLoader classloader)
            {
                return new SavedState(parcel, classloader);
            }

            public volatile Object createFromParcel(Parcel parcel, ClassLoader classloader)
            {
                return createFromParcel(parcel, classloader);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
);
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        public String toString()
        {
            return (new StringBuilder()).append("FragmentPager.SavedState{").append(Integer.toHexString(System.identityHashCode(this))).append(" position=").append(position).append("}").toString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(position);
            parcel.writeParcelable(adapterState, i);
        }


        SavedState(Parcel parcel, ClassLoader classloader)
        {
            super(parcel);
            if (classloader == null)
                classloader = getClass().getClassLoader();
            position = parcel.readInt();
            adapterState = parcel.readParcelable(classloader);
            loader = classloader;
        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }

    public static class SimpleOnPageChangeListener
        implements OnPageChangeListener
    {

        public void onPageScrollStateChanged(int i)
        {
        }

        public void onPageScrolled(int i, float f, int j)
        {
        }

        public void onPageSelected(int i)
        {
        }

    }

    static class ViewPositionComparator
        implements Comparator
    {

        public int compare(View view, View view1)
        {
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
            if (layoutparams.isDecor != layoutparams1.isDecor)
                return !layoutparams.isDecor ? -1 : 1;
            else
                return layoutparams.position - layoutparams1.position;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((View)obj, (View)obj1);
        }

    }


    private static final int CLOSE_ENOUGH = 2;
    private static final Comparator COMPARATOR = new Comparator() {

        public int compare(ItemInfo iteminfo, ItemInfo iteminfo1)
        {
            return iteminfo.position - iteminfo1.position;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((ItemInfo)obj, (ItemInfo)obj1);
        }

    }
;
    private static final boolean DEBUG = false;
    private static final int DEFAULT_GUTTER_SIZE = 16;
    private static final int DEFAULT_OFFSCREEN_PAGES = 1;
    private static final int DRAW_ORDER_DEFAULT = 0;
    private static final int DRAW_ORDER_FORWARD = 1;
    private static final int DRAW_ORDER_REVERSE = 2;
    private static final int INVALID_POINTER = -1;
    private static final int LAYOUT_ATTRS[] = {
        0x10100b3
    };
    private static final int MAX_SETTLE_DURATION = 600;
    private static final int MIN_DISTANCE_FOR_FLING = 25;
    private static final int MIN_FLING_VELOCITY = 400;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "ViewPager";
    private static final boolean USE_CACHE;
    private static final Interpolator sInterpolator = new Interpolator() {

        public float getInterpolation(float f)
        {
            float f1 = f - 1.0F;
            return 1.0F + f1 * (f1 * (f1 * (f1 * f1)));
        }

    }
;
    private static final ViewPositionComparator sPositionComparator = new ViewPositionComparator();
    private int mActivePointerId;
    private PagerAdapter mAdapter;
    private OnAdapterChangeListener mAdapterChangeListener;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    private int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    private int mDrawingOrder;
    private ArrayList mDrawingOrderedChildren;
    private final Runnable mEndScrollRunnable;
    private long mFakeDragBeginTime;
    private boolean mFakeDragging;
    private boolean mFirstLayout;
    private float mFirstOffset;
    private int mFlingDistance;
    private int mGutterSize;
    private boolean mIgnoreGutter;
    private boolean mInLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private final ArrayList mItems;
    private float mLastMotionX;
    private float mLastMotionY;
    private float mLastOffset;
    private EdgeEffectCompat mLeftEdge;
    private Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private boolean mNeedCalculatePageOffsets;
    private PagerObserver mObserver;
    private int mOffscreenPageLimit;
    private OnPageChangeListener mOnPageChangeListener;
    private int mPageMargin;
    private PageTransformer mPageTransformer;
    private boolean mPopulatePending;
    private Parcelable mRestoredAdapterState;
    private ClassLoader mRestoredClassLoader;
    private int mRestoredCurItem;
    private EdgeEffectCompat mRightEdge;
    private int mScrollState;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private Method mSetChildrenDrawingOrderEnabled;
    private Rect mSpecRect;
    private int mSpecTab;
    private final ItemInfo mTempItem;
    private final Rect mTempRect;
    private int mTopPageBounds;
    private int mTouchSlop;
    private int mTouchSlopAdjust;
    private VelocityTracker mVelocityTracker;

    public ViewPager(Context context)
    {
        super(context);
        mItems = new ArrayList();
        mTempItem = new ItemInfo();
        mTempRect = new Rect();
        mRestoredCurItem = -1;
        mRestoredAdapterState = null;
        mRestoredClassLoader = null;
        mFirstOffset = -3.402823E+038F;
        mLastOffset = 3.402823E+038F;
        mOffscreenPageLimit = 1;
        mActivePointerId = -1;
        mTouchSlopAdjust = -1;
        mFirstLayout = true;
        mNeedCalculatePageOffsets = false;
        mEndScrollRunnable = new Runnable() {

            final ViewPager this$0;

            public void run()
            {
                setScrollState(0);
                populate();
            }

            
            {
                this$0 = ViewPager.this;
                super();
            }
        }
;
        mScrollState = 0;
        initViewPager();
    }

    public ViewPager(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mItems = new ArrayList();
        mTempItem = new ItemInfo();
        mTempRect = new Rect();
        mRestoredCurItem = -1;
        mRestoredAdapterState = null;
        mRestoredClassLoader = null;
        mFirstOffset = -3.402823E+038F;
        mLastOffset = 3.402823E+038F;
        mOffscreenPageLimit = 1;
        mActivePointerId = -1;
        mTouchSlopAdjust = -1;
        mFirstLayout = true;
        mNeedCalculatePageOffsets = false;
        mEndScrollRunnable = new _cls3();
        mScrollState = 0;
        initViewPager();
    }

    private void calculatePageOffsets(ItemInfo iteminfo, int i, ItemInfo iteminfo1)
    {
        int j = mAdapter.getCount();
        int k = getWidth();
        float f;
        if (k > 0)
            f = (float)mPageMargin / (float)k;
        else
            f = 0.0F;
        if (iteminfo1 != null)
        {
            int k2 = iteminfo1.position;
            if (k2 < iteminfo.position)
            {
                int j3 = 0;
                float f6 = f + (iteminfo1.offset + iteminfo1.widthFactor);
                for (int k3 = k2 + 1; k3 <= iteminfo.position && j3 < mItems.size(); k3++)
                {
                    ItemInfo iteminfo5;
                    for (iteminfo5 = (ItemInfo)mItems.get(j3); k3 > iteminfo5.position && j3 < -1 + mItems.size(); iteminfo5 = (ItemInfo)mItems.get(j3))
                        j3++;

                    for (; k3 < iteminfo5.position; k3++)
                        f6 += f + mAdapter.getPageWidth(k3);

                    iteminfo5.offset = f6;
                    f6 += f + iteminfo5.widthFactor;
                }

            } else
            if (k2 > iteminfo.position)
            {
                int l2 = -1 + mItems.size();
                float f5 = iteminfo1.offset;
                for (int i3 = k2 - 1; i3 >= iteminfo.position && l2 >= 0; i3--)
                {
                    ItemInfo iteminfo4;
                    for (iteminfo4 = (ItemInfo)mItems.get(l2); i3 < iteminfo4.position && l2 > 0; iteminfo4 = (ItemInfo)mItems.get(l2))
                        l2--;

                    for (; i3 > iteminfo4.position; i3--)
                        f5 -= f + mAdapter.getPageWidth(i3);

                    f5 -= f + iteminfo4.widthFactor;
                    iteminfo4.offset = f5;
                }

            }
        }
        int l = mItems.size();
        float f1 = iteminfo.offset;
        int i1 = -1 + iteminfo.position;
        float f2;
        if (iteminfo.position == 0)
            f2 = iteminfo.offset;
        else
            f2 = -3.402823E+038F;
        mFirstOffset = f2;
        float f3;
        if (iteminfo.position == j - 1)
            f3 = (iteminfo.offset + iteminfo.widthFactor) - 1.0F;
        else
            f3 = 3.402823E+038F;
        mLastOffset = f3;
        for (int j1 = i - 1; j1 >= 0;)
        {
            ItemInfo iteminfo3;
            int j2;
            for (iteminfo3 = (ItemInfo)mItems.get(j1); i1 > iteminfo3.position; i1 = j2)
            {
                PagerAdapter pageradapter1 = mAdapter;
                j2 = i1 - 1;
                f1 -= f + pageradapter1.getPageWidth(i1);
            }

            f1 -= f + iteminfo3.widthFactor;
            iteminfo3.offset = f1;
            if (iteminfo3.position == 0)
                mFirstOffset = f1;
            j1--;
            i1--;
        }

        float f4 = f + (iteminfo.offset + iteminfo.widthFactor);
        int k1 = 1 + iteminfo.position;
        for (int l1 = i + 1; l1 < l;)
        {
            ItemInfo iteminfo2;
            int i2;
            for (iteminfo2 = (ItemInfo)mItems.get(l1); k1 < iteminfo2.position; k1 = i2)
            {
                PagerAdapter pageradapter = mAdapter;
                i2 = k1 + 1;
                f4 += f + pageradapter.getPageWidth(k1);
            }

            if (iteminfo2.position == j - 1)
                mLastOffset = (f4 + iteminfo2.widthFactor) - 1.0F;
            iteminfo2.offset = f4;
            f4 += f + iteminfo2.widthFactor;
            l1++;
            k1++;
        }

        mNeedCalculatePageOffsets = false;
    }

    private void completeScroll(boolean flag)
    {
label0:
        {
            boolean flag1;
            if (mScrollState == 2)
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
            {
                setScrollingCacheEnabled(false);
                mScroller.abortAnimation();
                int j = getScrollX();
                int k = getScrollY();
                int l = mScroller.getCurrX();
                int i1 = mScroller.getCurrY();
                if (j != l || k != i1)
                    scrollTo(l, i1);
            }
            mPopulatePending = false;
            for (int i = 0; i < mItems.size(); i++)
            {
                ItemInfo iteminfo = (ItemInfo)mItems.get(i);
                if (iteminfo.scrolling)
                {
                    flag1 = true;
                    iteminfo.scrolling = false;
                }
            }

            if (flag1)
            {
                if (!flag)
                    break label0;
                ViewCompat.postOnAnimation(this, mEndScrollRunnable);
            }
            return;
        }
        mEndScrollRunnable.run();
    }

    private int determineTargetPage(int i, float f, int j, int k)
    {
        int l;
        if (Math.abs(k) > mFlingDistance && Math.abs(j) > mMinimumVelocity)
        {
            if (j > 0)
                l = i;
            else
                l = i + 1;
        } else
        {
            float f1;
            if (i >= mCurItem)
                f1 = 0.4F;
            else
                f1 = 0.6F;
            l = (int)(f1 + (f + (float)i));
        }
        if (mItems.size() > 0)
        {
            ItemInfo iteminfo = (ItemInfo)mItems.get(0);
            ItemInfo iteminfo1 = (ItemInfo)mItems.get(-1 + mItems.size());
            l = Math.max(iteminfo.position, Math.min(l, iteminfo1.position));
        }
        return l;
    }

    private void enableLayers(boolean flag)
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            byte byte0;
            if (flag)
                byte0 = 2;
            else
                byte0 = 0;
            ViewCompat.setLayerType(getChildAt(j), byte0, null);
        }

    }

    private void endDrag()
    {
        mIsBeingDragged = false;
        mIsUnableToDrag = false;
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    private Rect getChildRectInPagerCoordinates(Rect rect, View view)
    {
        if (rect == null)
            rect = new Rect();
        if (view == null)
        {
            rect.set(0, 0, 0, 0);
        } else
        {
            rect.left = view.getLeft();
            rect.right = view.getRight();
            rect.top = view.getTop();
            rect.bottom = view.getBottom();
            ViewGroup viewgroup;
            for (android.view.ViewParent viewparent = view.getParent(); (viewparent instanceof ViewGroup) && viewparent != this; viewparent = viewgroup.getParent())
            {
                viewgroup = (ViewGroup)viewparent;
                rect.left = rect.left + viewgroup.getLeft();
                rect.right = rect.right + viewgroup.getRight();
                rect.top = rect.top + viewgroup.getTop();
                rect.bottom = rect.bottom + viewgroup.getBottom();
            }

        }
        return rect;
    }

    private ItemInfo infoForCurrentScrollPosition()
    {
        ItemInfo iteminfo;
label0:
        {
            int i = getWidth();
            float f;
            if (i > 0)
                f = (float)getScrollX() / (float)i;
            else
                f = 0.0F;
            float f1 = 0.0F;
            if (i > 0)
                f1 = (float)mPageMargin / (float)i;
            int j = -1;
            float f2 = 0.0F;
            float f3 = 0.0F;
            boolean flag = true;
            iteminfo = null;
            int k = 0;
            ItemInfo iteminfo1;
            do
            {
                if (k >= mItems.size())
                    break label0;
                iteminfo1 = (ItemInfo)mItems.get(k);
                if (!flag && iteminfo1.position != j + 1)
                {
                    iteminfo1 = mTempItem;
                    iteminfo1.offset = f1 + (f2 + f3);
                    iteminfo1.position = j + 1;
                    iteminfo1.widthFactor = mAdapter.getPageWidth(iteminfo1.position);
                    k--;
                }
                float f4 = iteminfo1.offset;
                float f5 = f1 + (f4 + iteminfo1.widthFactor);
                if (!flag && f < f4)
                    break label0;
                if (f < f5 || k == -1 + mItems.size())
                    break;
                j = iteminfo1.position;
                f2 = f4;
                f3 = iteminfo1.widthFactor;
                iteminfo = iteminfo1;
                k++;
                flag = false;
            } while (true);
            iteminfo = iteminfo1;
        }
        return iteminfo;
    }

    private boolean isGutterDrag(float f, float f1)
    {
        return f < (float)mGutterSize && f1 > 0.0F || f > (float)(getWidth() - mGutterSize) && f1 < 0.0F;
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = MotionEventCompat.getActionIndex(motionevent);
        if (MotionEventCompat.getPointerId(motionevent, i) == mActivePointerId)
        {
            int j;
            if (i == 0)
                j = 1;
            else
                j = 0;
            mLastMotionX = MotionEventCompat.getX(motionevent, j);
            mActivePointerId = MotionEventCompat.getPointerId(motionevent, j);
            if (mVelocityTracker != null)
                mVelocityTracker.clear();
        }
    }

    private boolean pageScrolled(int i)
    {
        boolean flag;
        if (mItems.size() == 0)
        {
            mCalledSuper = false;
            onPageScrolled(0, 0.0F, 0);
            boolean flag1 = mCalledSuper;
            flag = false;
            if (!flag1)
                throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        } else
        {
            ItemInfo iteminfo = infoForCurrentScrollPosition();
            int j = getWidth();
            int k = j + mPageMargin;
            float f = (float)mPageMargin / (float)j;
            int l = iteminfo.position;
            float f1 = ((float)i / (float)j - iteminfo.offset) / (f + iteminfo.widthFactor);
            int i1 = (int)(f1 * (float)k);
            mCalledSuper = false;
            onPageScrolled(l, f1, i1);
            if (!mCalledSuper)
                throw new IllegalStateException("onPageScrolled did not call superclass implementation");
            flag = true;
        }
        return flag;
    }

    private boolean performDrag(float f)
    {
        float f1 = mLastMotionX - f;
        mLastMotionX = f;
        float f2 = f1 + (float)getScrollX();
        int i = getWidth();
        float f3 = (float)i * mFirstOffset;
        float f4 = (float)i * mLastOffset;
        boolean flag = true;
        boolean flag1 = true;
        ItemInfo iteminfo = (ItemInfo)mItems.get(0);
        ItemInfo iteminfo1 = (ItemInfo)mItems.get(-1 + mItems.size());
        if (iteminfo.position != 0)
        {
            flag = false;
            f3 = iteminfo.offset * (float)i;
        }
        if (iteminfo1.position != -1 + mAdapter.getCount())
        {
            flag1 = false;
            f4 = iteminfo1.offset * (float)i;
        }
        boolean flag2;
        if (f2 < f3)
        {
            flag2 = false;
            if (flag)
            {
                float f6 = f3 - f2;
                flag2 = mLeftEdge.onPull(Math.abs(f6) / (float)i);
            }
            f2 = f3;
        } else
        {
            int j = f2 != f4;
            flag2 = false;
            if (j > 0)
            {
                flag2 = false;
                if (flag1)
                {
                    float f5 = f2 - f4;
                    flag2 = mRightEdge.onPull(Math.abs(f5) / (float)i);
                }
                f2 = f4;
            }
        }
        mLastMotionX = mLastMotionX + (f2 - (float)(int)f2);
        scrollTo((int)f2, getScrollY());
        pageScrolled((int)f2);
        return flag2;
    }

    private boolean pointInRect(MotionEvent motionevent, Rect rect)
    {
        float f = motionevent.getRawX();
        float f1 = motionevent.getRawY();
        Log.d("ViewPager", (new StringBuilder()).append("pointInRect x = ").append(f).append(", y = ").append(f1).append(", rect = ").append(rect).toString());
        boolean flag = false;
        if (rect != null)
        {
            int i = mCurItem;
            int j = mSpecTab;
            flag = false;
            if (i == j)
            {
                int k = f != (float)rect.left;
                flag = false;
                if (k >= 0)
                {
                    int l = f != (float)rect.right;
                    flag = false;
                    if (l <= 0)
                    {
                        int i1 = f1 != (float)rect.top;
                        flag = false;
                        if (i1 >= 0)
                        {
                            int j1 = f1 != (float)rect.bottom;
                            flag = false;
                            if (j1 <= 0)
                                flag = true;
                        }
                    }
                }
            }
        }
        return flag;
    }

    private void recomputeScrollPosition(int i, int j, int k, int l)
    {
        if (j > 0 && !mItems.isEmpty())
        {
            int j1 = i + k;
            int k1 = j + l;
            int l1 = (int)(((float)getScrollX() / (float)k1) * (float)j1);
            scrollTo(l1, getScrollY());
            if (!mScroller.isFinished())
            {
                int i2 = mScroller.getDuration() - mScroller.timePassed();
                ItemInfo iteminfo1 = infoForPosition(mCurItem);
                mScroller.startScroll(l1, 0, (int)(iteminfo1.offset * (float)i), 0, i2);
            }
        } else
        {
            ItemInfo iteminfo = infoForPosition(mCurItem);
            float f;
            if (iteminfo != null)
                f = Math.min(iteminfo.offset, mLastOffset);
            else
                f = 0.0F;
            int i1 = (int)(f * (float)i);
            if (i1 != getScrollX())
            {
                completeScroll(false);
                scrollTo(i1, getScrollY());
                return;
            }
        }
    }

    private void removeNonDecorViews()
    {
        for (int i = 0; i < getChildCount(); i++)
            if (!((LayoutParams)getChildAt(i).getLayoutParams()).isDecor)
            {
                removeViewAt(i);
                i--;
            }

    }

    private void scrollToItem(int i, boolean flag, int j, boolean flag1)
    {
        ItemInfo iteminfo = infoForPosition(i);
        int k = 0;
        if (iteminfo != null)
            k = (int)((float)getWidth() * Math.max(mFirstOffset, Math.min(iteminfo.offset, mLastOffset)));
        if (flag)
        {
            if (flag1 && mOnPageChangeListener != null)
                mOnPageChangeListener.onPageSelected(i);
            if (flag1 && mInternalPageChangeListener != null)
                mInternalPageChangeListener.onPageSelected(i);
            smoothScrollTo(k, 0, j);
            return;
        }
        if (flag1 && mOnPageChangeListener != null)
            mOnPageChangeListener.onPageSelected(i);
        if (flag1 && mInternalPageChangeListener != null)
            mInternalPageChangeListener.onPageSelected(i);
        completeScroll(false);
        scrollTo(k, 0);
    }

    private void setScrollState(int i)
    {
        if (mScrollState != i)
        {
            mScrollState = i;
            if (mPageTransformer != null)
            {
                boolean flag;
                if (i != 0)
                    flag = true;
                else
                    flag = false;
                enableLayers(flag);
            }
            if (mOnPageChangeListener != null)
            {
                mOnPageChangeListener.onPageScrollStateChanged(i);
                return;
            }
        }
    }

    private void setScrollingCacheEnabled(boolean flag)
    {
        if (mScrollingCacheEnabled != flag)
            mScrollingCacheEnabled = flag;
    }

    public void addFocusables(ArrayList arraylist, int i, int j)
    {
        int k = arraylist.size();
        int l = getDescendantFocusability();
        if (l != 0x60000)
        {
            for (int i1 = 0; i1 < getChildCount(); i1++)
            {
                View view = getChildAt(i1);
                if (view.getVisibility() != 0)
                    continue;
                ItemInfo iteminfo = infoForChild(view);
                if (iteminfo != null && iteminfo.position == mCurItem)
                    view.addFocusables(arraylist, i, j);
            }

        }
        if ((l != 0x40000 || k == arraylist.size()) && isFocusable() && ((j & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) && arraylist != null)
        {
            arraylist.add(this);
            return;
        } else
        {
            return;
        }
    }

    ItemInfo addNewItem(int i, int j)
    {
        ItemInfo iteminfo = new ItemInfo();
        iteminfo.position = i;
        iteminfo.object = mAdapter.instantiateItem(this, i);
        iteminfo.widthFactor = mAdapter.getPageWidth(i);
        if (j >= 0 && j < mItems.size())
        {
            mItems.add(j, iteminfo);
            return iteminfo;
        } else
        {
            mItems.add(iteminfo);
            return iteminfo;
        }
    }

    public void addTouchables(ArrayList arraylist)
    {
        for (int i = 0; i < getChildCount(); i++)
        {
            View view = getChildAt(i);
            if (view.getVisibility() != 0)
                continue;
            ItemInfo iteminfo = infoForChild(view);
            if (iteminfo != null && iteminfo.position == mCurItem)
                view.addTouchables(arraylist);
        }

    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (!checkLayoutParams(layoutparams))
            layoutparams = generateLayoutParams(layoutparams);
        LayoutParams layoutparams1 = (LayoutParams)layoutparams;
        layoutparams1.isDecor = layoutparams1.isDecor | (view instanceof Decor);
        if (mInLayout)
        {
            if (layoutparams1 != null && layoutparams1.isDecor)
            {
                throw new IllegalStateException("Cannot add pager decor view during layout");
            } else
            {
                layoutparams1.needsMeasure = true;
                addViewInLayout(view, i, layoutparams);
                return;
            }
        } else
        {
            super.addView(view, i, layoutparams);
            return;
        }
    }

    public boolean arrowScroll(int i)
    {
        boolean flag;
label0:
        {
            View view = findFocus();
            if (view == this)
                view = null;
            View view1 = FocusFinder.getInstance().findNextFocus(this, view, i);
            if (view1 != null && view1 != view)
            {
                if (i == 17)
                {
                    int l = getChildRectInPagerCoordinates(mTempRect, view1).left;
                    int i1 = getChildRectInPagerCoordinates(mTempRect, view).left;
                    if (view != null && l >= i1)
                        flag = pageLeft();
                    else
                        flag = view1.requestFocus();
                } else
                {
                    flag = false;
                    if (i == 66)
                    {
                        int j = getChildRectInPagerCoordinates(mTempRect, view1).left;
                        int k = getChildRectInPagerCoordinates(mTempRect, view).left;
                        if (view != null && j <= k)
                            flag = pageRight();
                        else
                            flag = view1.requestFocus();
                    }
                }
                break label0;
            }
            if (i != 17 && i != 1)
            {
                if (i != 66)
                {
                    flag = false;
                    if (i != 2)
                        break label0;
                }
                flag = pageRight();
            } else
            {
                flag = pageLeft();
            }
        }
        if (flag)
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        return flag;
    }

    public boolean beginFakeDrag()
    {
        if (mIsBeingDragged)
            return false;
        mFakeDragging = true;
        setScrollState(1);
        mLastMotionX = 0.0F;
        mInitialMotionX = 0.0F;
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        else
            mVelocityTracker.clear();
        long l = SystemClock.uptimeMillis();
        MotionEvent motionevent = MotionEvent.obtain(l, l, 0, 0.0F, 0.0F, 0);
        mVelocityTracker.addMovement(motionevent);
        motionevent.recycle();
        mFakeDragBeginTime = l;
        return true;
    }

    protected boolean canScroll(View view, boolean flag, int i, int j, int k)
    {
        if (view instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)view;
            int l = view.getScrollX();
            int i1 = view.getScrollY();
            for (int j1 = -1 + viewgroup.getChildCount(); j1 >= 0; j1--)
            {
                View view1 = viewgroup.getChildAt(j1);
                if (j + l >= view1.getLeft() && j + l < view1.getRight() && k + i1 >= view1.getTop() && k + i1 < view1.getBottom() && canScroll(view1, true, i, (j + l) - view1.getLeft(), (k + i1) - view1.getTop()))
                    return true;
            }

        }
        return flag && ViewCompat.canScrollHorizontally(view, -i);
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return (layoutparams instanceof LayoutParams) && super.checkLayoutParams(layoutparams);
    }

    public void computeScroll()
    {
        if (!mScroller.isFinished() && mScroller.computeScrollOffset())
        {
            int i = getScrollX();
            int j = getScrollY();
            int k = mScroller.getCurrX();
            int l = mScroller.getCurrY();
            if (i != k || j != l)
            {
                scrollTo(k, l);
                if (!pageScrolled(k))
                {
                    mScroller.abortAnimation();
                    scrollTo(0, l);
                }
            }
            ViewCompat.postInvalidateOnAnimation(this);
            return;
        } else
        {
            completeScroll(true);
            return;
        }
    }

    void dataSetChanged()
    {
        boolean flag;
        if (mItems.size() < 1 + 2 * mOffscreenPageLimit && mItems.size() < mAdapter.getCount())
            flag = true;
        else
            flag = false;
        int i = mCurItem;
        boolean flag1 = false;
        for (int j = 0; j < mItems.size(); j++)
        {
            ItemInfo iteminfo = (ItemInfo)mItems.get(j);
            int i1 = mAdapter.getItemPosition(iteminfo.object);
            if (i1 == -1)
                continue;
            if (i1 == -2)
            {
                mItems.remove(j);
                j--;
                if (!flag1)
                {
                    mAdapter.startUpdate(this);
                    flag1 = true;
                }
                mAdapter.destroyItem(this, iteminfo.position, iteminfo.object);
                flag = true;
                if (mCurItem == iteminfo.position)
                {
                    i = Math.max(0, Math.min(mCurItem, -1 + mAdapter.getCount()));
                    flag = true;
                }
                continue;
            }
            if (iteminfo.position == i1)
                continue;
            if (iteminfo.position == mCurItem)
                i = i1;
            iteminfo.position = i1;
            flag = true;
        }

        if (flag1)
            mAdapter.finishUpdate(this);
        Collections.sort(mItems, COMPARATOR);
        if (flag)
        {
            int k = getChildCount();
            for (int l = 0; l < k; l++)
            {
                LayoutParams layoutparams = (LayoutParams)getChildAt(l).getLayoutParams();
                if (!layoutparams.isDecor)
                    layoutparams.widthFactor = 0.0F;
            }

            setCurrentItemInternal(i, false, true);
            requestLayout();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        return super.dispatchKeyEvent(keyevent) || executeKeyEvent(keyevent);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.getVisibility() != 0)
                continue;
            ItemInfo iteminfo = infoForChild(view);
            if (iteminfo != null && iteminfo.position == mCurItem && view.dispatchPopulateAccessibilityEvent(accessibilityevent))
                return true;
        }

        return false;
    }

    float distanceInfluenceForSnapDuration(float f)
    {
        return (float)Math.sin((float)(0.4712389167638204D * (double)(f - 0.5F)));
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        int i = ViewCompat.getOverScrollMode(this);
        boolean flag1;
        if (i != 0 && (i != 1 || mAdapter == null || mAdapter.getCount() <= 1))
        {
            mLeftEdge.finish();
            mRightEdge.finish();
            flag1 = false;
        } else
        {
            boolean flag = mLeftEdge.isFinished();
            flag1 = false;
            if (!flag)
            {
                int i1 = canvas.save();
                int j1 = getHeight() - getPaddingTop() - getPaddingBottom();
                int k1 = getWidth();
                canvas.rotate(270F);
                canvas.translate(-j1 + getPaddingTop(), mFirstOffset * (float)k1);
                mLeftEdge.setSize(j1, k1);
                flag1 = false | mLeftEdge.draw(canvas);
                canvas.restoreToCount(i1);
            }
            if (!mRightEdge.isFinished())
            {
                int j = canvas.save();
                int k = getWidth();
                int l = getHeight() - getPaddingTop() - getPaddingBottom();
                canvas.rotate(90F);
                canvas.translate(-getPaddingTop(), -(1.0F + mLastOffset) * (float)k);
                mRightEdge.setSize(l, k);
                flag1 |= mRightEdge.draw(canvas);
                canvas.restoreToCount(j);
            }
        }
        if (flag1)
            ViewCompat.postInvalidateOnAnimation(this);
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        Drawable drawable = mMarginDrawable;
        if (drawable != null && drawable.isStateful())
            drawable.setState(getDrawableState());
    }

    public void endFakeDrag()
    {
        if (!mFakeDragging)
        {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        } else
        {
            VelocityTracker velocitytracker = mVelocityTracker;
            velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
            int i = (int)VelocityTrackerCompat.getXVelocity(velocitytracker, mActivePointerId);
            mPopulatePending = true;
            int j = getWidth();
            int k = getScrollX();
            ItemInfo iteminfo = infoForCurrentScrollPosition();
            setCurrentItemInternal(determineTargetPage(iteminfo.position, ((float)k / (float)j - iteminfo.offset) / iteminfo.widthFactor, i, (int)(mLastMotionX - mInitialMotionX)), true, true, i);
            endDrag();
            mFakeDragging = false;
            return;
        }
    }

    public boolean executeKeyEvent(KeyEvent keyevent)
    {
label0:
        {
label1:
            {
                if (keyevent.getAction() == 0)
                    switch (keyevent.getKeyCode())
                    {
                    default:
                        break;

                    case 21: // '\025'
                        break label0;

                    case 22: // '\026'
                        break label1;

                    case 61: // '='
                        if (android.os.Build.VERSION.SDK_INT >= 11)
                        {
                            if (KeyEventCompat.hasNoModifiers(keyevent))
                                return arrowScroll(2);
                            if (KeyEventCompat.hasModifiers(keyevent, 1))
                                return arrowScroll(1);
                        }
                        break;
                    }
                return false;
            }
            return arrowScroll(66);
        }
        return arrowScroll(17);
    }

    public void fakeDragBy(float f)
    {
        if (!mFakeDragging)
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        mLastMotionX = f + mLastMotionX;
        float f1 = (float)getScrollX() - f;
        int i = getWidth();
        float f2 = (float)i * mFirstOffset;
        float f3 = (float)i * mLastOffset;
        ItemInfo iteminfo = (ItemInfo)mItems.get(0);
        ItemInfo iteminfo1 = (ItemInfo)mItems.get(-1 + mItems.size());
        if (iteminfo.position != 0)
            f2 = iteminfo.offset * (float)i;
        if (iteminfo1.position != -1 + mAdapter.getCount())
            f3 = iteminfo1.offset * (float)i;
        if (f1 < f2)
            f1 = f2;
        else
        if (f1 > f3)
            f1 = f3;
        mLastMotionX = mLastMotionX + (f1 - (float)(int)f1);
        scrollTo((int)f1, getScrollY());
        pageScrolled((int)f1);
        long l = SystemClock.uptimeMillis();
        MotionEvent motionevent = MotionEvent.obtain(mFakeDragBeginTime, l, 2, mLastMotionX, 0.0F, 0);
        mVelocityTracker.addMovement(motionevent);
        motionevent.recycle();
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams();
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return generateDefaultLayoutParams();
    }

    public PagerAdapter getAdapter()
    {
        return mAdapter;
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        int k;
        if (mDrawingOrder == 2)
            k = i - 1 - j;
        else
            k = j;
        return ((LayoutParams)((View)mDrawingOrderedChildren.get(k)).getLayoutParams()).childIndex;
    }

    public int getCurrentItem()
    {
        return mCurItem;
    }

    public int getOffscreenPageLimit()
    {
        return mOffscreenPageLimit;
    }

    public int getPageMargin()
    {
        return mPageMargin;
    }

    ItemInfo infoForAnyChild(View view)
    {
        do
        {
            android.view.ViewParent viewparent = view.getParent();
            if (viewparent != this)
            {
                if (viewparent != null && (viewparent instanceof View))
                    view = (View)viewparent;
                else
                    return null;
            } else
            {
                return infoForChild(view);
            }
        } while (true);
    }

    ItemInfo infoForChild(View view)
    {
        for (int i = 0; i < mItems.size(); i++)
        {
            ItemInfo iteminfo = (ItemInfo)mItems.get(i);
            if (mAdapter.isViewFromObject(view, iteminfo.object))
                return iteminfo;
        }

        return null;
    }

    ItemInfo infoForPosition(int i)
    {
        for (int j = 0; j < mItems.size(); j++)
        {
            ItemInfo iteminfo = (ItemInfo)mItems.get(j);
            if (iteminfo.position == i)
                return iteminfo;
        }

        return null;
    }

    void initViewPager()
    {
        setWillNotDraw(false);
        setDescendantFocusability(0x40000);
        setFocusable(true);
        Context context = getContext();
        mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        float f = context.getResources().getDisplayMetrics().density;
        mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(viewconfiguration);
        mMinimumVelocity = (int)(400F * f);
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mLeftEdge = new EdgeEffectCompat(context);
        mRightEdge = new EdgeEffectCompat(context);
        mFlingDistance = (int)(25F * f);
        mCloseEnough = (int)(2.0F * f);
        mDefaultGutterSize = (int)(16F * f);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.getImportantForAccessibility(this) == 0)
            ViewCompat.setImportantForAccessibility(this, 1);
    }

    public boolean isFakeDragging()
    {
        return mFakeDragging;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mFirstLayout = true;
    }

    protected void onDetachedFromWindow()
    {
        removeCallbacks(mEndScrollRunnable);
        super.onDetachedFromWindow();
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        if (mPageMargin > 0 && mMarginDrawable != null && mItems.size() > 0 && mAdapter != null)
        {
            int i = getScrollX();
            int j = getWidth();
            float f = (float)mPageMargin / (float)j;
            int k = 0;
            ItemInfo iteminfo = (ItemInfo)mItems.get(0);
            float f1 = iteminfo.offset;
            int l = mItems.size();
            int i1 = iteminfo.position;
            int j1 = ((ItemInfo)mItems.get(l - 1)).position;
            int k1 = i1;
            do
            {
                if (k1 >= j1)
                    break;
                ArrayList arraylist;
                for (; k1 > iteminfo.position && k < l; iteminfo = (ItemInfo)arraylist.get(k))
                {
                    arraylist = mItems;
                    k++;
                }

                float f3;
                if (k1 == iteminfo.position)
                {
                    f3 = (iteminfo.offset + iteminfo.widthFactor) * (float)j;
                    f1 = f + (iteminfo.offset + iteminfo.widthFactor);
                } else
                {
                    float f2 = mAdapter.getPageWidth(k1);
                    f3 = (f1 + f2) * (float)j;
                    f1 += f2 + f;
                }
                if (f3 + (float)mPageMargin > (float)i)
                {
                    mMarginDrawable.setBounds((int)f3, mTopPageBounds, (int)(0.5F + (f3 + (float)mPageMargin)), mBottomPageBounds);
                    mMarginDrawable.draw(canvas);
                }
                if (f3 > (float)(i + j))
                    break;
                k1++;
            } while (true);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i = 0xff & motionevent.getAction();
        if (i != 3 && i != 1)
        {
            if (i != 0)
            {
                if (mIsBeingDragged)
                    return true;
                if (mIsUnableToDrag)
                    return false;
            }
            switch (i)
            {
            case 6: // '\006'
                onSecondaryPointerUp(motionevent);
                break;

            case 0: // '\0'
                float f6 = motionevent.getX();
                mInitialMotionX = f6;
                mLastMotionX = f6;
                float f7 = motionevent.getY();
                mInitialMotionY = f7;
                mLastMotionY = f7;
                mActivePointerId = MotionEventCompat.getPointerId(motionevent, 0);
                mIsUnableToDrag = false;
                mScroller.computeScrollOffset();
                if (mScrollState == 2 && Math.abs(mScroller.getFinalX() - mScroller.getCurrX()) > mCloseEnough)
                {
                    mScroller.abortAnimation();
                    mPopulatePending = false;
                    populate();
                    mIsBeingDragged = true;
                    setScrollState(1);
                } else
                {
                    completeScroll(false);
                    mIsBeingDragged = false;
                }
                break;

            case 2: // '\002'
                int j = mActivePointerId;
                if (j != -1)
                {
                    int k = MotionEventCompat.findPointerIndex(motionevent, j);
                    float f = MotionEventCompat.getX(motionevent, k);
                    float f1 = f - mLastMotionX;
                    float f2 = Math.abs(f1);
                    float f3 = MotionEventCompat.getY(motionevent, k);
                    float f4 = Math.abs(f3 - mInitialMotionY);
                    if (f1 != 0.0F && !isGutterDrag(mLastMotionX, f1) && canScroll(this, false, (int)f1, (int)f, (int)f3))
                    {
                        mLastMotionX = f;
                        mLastMotionY = f3;
                        mIsUnableToDrag = true;
                        return false;
                    }
                    if (f2 < (float)mTouchSlopAdjust && f4 < (float)mTouchSlopAdjust && pointInRect(motionevent, mSpecRect))
                    {
                        Log.d("ViewPager", (new StringBuilder()).append("xDiff = ").append(f2).append(", yDiff = ").append(f4).append(", mTouchSlopAdj = ").append(mTouchSlopAdjust).toString());
                        return false;
                    }
                    if (f2 > (float)mTouchSlop && 0.5F * f2 > f4)
                    {
                        mIsBeingDragged = true;
                        setScrollState(1);
                        float f5;
                        if (f1 > 0.0F)
                            f5 = mInitialMotionX + (float)mTouchSlop;
                        else
                            f5 = mInitialMotionX - (float)mTouchSlop;
                        mLastMotionX = f5;
                        mLastMotionY = f3;
                        setScrollingCacheEnabled(true);
                    } else
                    if (f4 > (float)mTouchSlop)
                        mIsUnableToDrag = true;
                    if (mIsBeingDragged && performDrag(f))
                        ViewCompat.postInvalidateOnAnimation(this);
                }
                break;
            }
            if (mVelocityTracker == null)
                mVelocityTracker = VelocityTracker.obtain();
            mVelocityTracker.addMovement(motionevent);
            return mIsBeingDragged;
        }
        mIsBeingDragged = false;
        mIsUnableToDrag = false;
        mActivePointerId = -1;
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
        return false;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        mInLayout = true;
        populate();
        mInLayout = false;
        int i1 = getChildCount();
        int j1 = k - i;
        int k1 = l - j;
        int l1 = getPaddingLeft();
        int i2 = getPaddingTop();
        int j2 = getPaddingRight();
        int k2 = getPaddingBottom();
        int l2 = getScrollX();
        int i3 = 0;
        for (int j3 = 0; j3 < i1; j3++)
        {
            View view1 = getChildAt(j3);
            if (view1.getVisibility() == 8)
                continue;
            LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
            if (!layoutparams1.isDecor)
                continue;
            int j4 = 7 & layoutparams1.gravity;
            int k4 = 0x70 & layoutparams1.gravity;
            int l4;
            switch (j4)
            {
            case 5: // '\005'
                l4 = j1 - j2 - view1.getMeasuredWidth();
                j2 += view1.getMeasuredWidth();
                break;

            case 1: // '\001'
                l4 = Math.max((j1 - view1.getMeasuredWidth()) / 2, l1);
                break;

            case 3: // '\003'
                l4 = l1;
                l1 += view1.getMeasuredWidth();
                break;

            case 2: // '\002'
            case 4: // '\004'
            default:
                l4 = l1;
                break;
            }
            int i5;
            switch (k4)
            {
            case 80: // 'P'
                i5 = k1 - k2 - view1.getMeasuredHeight();
                k2 += view1.getMeasuredHeight();
                break;

            case 16: // '\020'
                i5 = Math.max((k1 - view1.getMeasuredHeight()) / 2, i2);
                break;

            case 48: // '0'
                i5 = i2;
                i2 += view1.getMeasuredHeight();
                break;

            default:
                i5 = i2;
                break;
            }
            int j5 = l4 + l2;
            view1.layout(j5, i5, j5 + view1.getMeasuredWidth(), i5 + view1.getMeasuredHeight());
            i3++;
        }

        for (int k3 = 0; k3 < i1; k3++)
        {
            View view = getChildAt(k3);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams.isDecor)
                continue;
            ItemInfo iteminfo = infoForChild(view);
            if (iteminfo == null)
                continue;
            int l3 = l1 + (int)((float)j1 * iteminfo.offset);
            int i4 = i2;
            if (layoutparams.needsMeasure)
            {
                layoutparams.needsMeasure = false;
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec((int)((float)(j1 - l1 - j2) * layoutparams.widthFactor), 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(k1 - i2 - k2, 0x40000000));
            }
            view.layout(l3, i4, l3 + view.getMeasuredWidth(), i4 + view.getMeasuredHeight());
        }

        mTopPageBounds = i2;
        mBottomPageBounds = k1 - k2;
        mDecorChildCount = i3;
        mFirstLayout = false;
    }

    protected void onMeasure(int i, int j)
    {
        setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, j));
        int k = getMeasuredWidth();
        mGutterSize = Math.min(k / 10, mDefaultGutterSize);
        int l = k - getPaddingLeft() - getPaddingRight();
        int i1 = getMeasuredHeight() - getPaddingTop() - getPaddingBottom();
        int j1 = getChildCount();
        for (int k1 = 0; k1 < j1; k1++)
        {
            View view1 = getChildAt(k1);
            if (view1.getVisibility() == 8)
                continue;
            LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
            if (layoutparams1 == null || !layoutparams1.isDecor)
                continue;
            int j2 = 7 & layoutparams1.gravity;
            int k2 = 0x70 & layoutparams1.gravity;
            int l2 = 0x80000000;
            int i3 = 0x80000000;
            boolean flag;
            if (k2 != 48 && k2 != 80)
                flag = false;
            else
                flag = true;
            boolean flag1;
            if (j2 != 3 && j2 != 5)
                flag1 = false;
            else
                flag1 = true;
            if (flag)
                l2 = 0x40000000;
            else
            if (flag1)
                i3 = 0x40000000;
            int j3 = l;
            int k3 = i1;
            if (((android.view.ViewGroup.LayoutParams) (layoutparams1)).width != -2)
            {
                l2 = 0x40000000;
                if (((android.view.ViewGroup.LayoutParams) (layoutparams1)).width != -1)
                    j3 = ((android.view.ViewGroup.LayoutParams) (layoutparams1)).width;
            }
            if (((android.view.ViewGroup.LayoutParams) (layoutparams1)).height != -2)
            {
                i3 = 0x40000000;
                if (((android.view.ViewGroup.LayoutParams) (layoutparams1)).height != -1)
                    k3 = ((android.view.ViewGroup.LayoutParams) (layoutparams1)).height;
            }
            view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(j3, l2), android.view.View.MeasureSpec.makeMeasureSpec(k3, i3));
            if (flag)
            {
                i1 -= view1.getMeasuredHeight();
                continue;
            }
            if (flag1)
                l -= view1.getMeasuredWidth();
        }

        mChildWidthMeasureSpec = android.view.View.MeasureSpec.makeMeasureSpec(l, 0x40000000);
        mChildHeightMeasureSpec = android.view.View.MeasureSpec.makeMeasureSpec(i1, 0x40000000);
        mInLayout = true;
        populate();
        mInLayout = false;
        int l1 = getChildCount();
        for (int i2 = 0; i2 < l1; i2++)
        {
            View view = getChildAt(i2);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams == null || !layoutparams.isDecor)
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec((int)((float)l * layoutparams.widthFactor), 0x40000000), mChildHeightMeasureSpec);
        }

    }

    protected void onPageScrolled(int i, float f, int j)
    {
        if (mDecorChildCount > 0)
        {
            int j1 = getScrollX();
            int k1 = getPaddingLeft();
            int l1 = getPaddingRight();
            int i2 = getWidth();
            int j2 = getChildCount();
            for (int k2 = 0; k2 < j2; k2++)
            {
                View view1 = getChildAt(k2);
                LayoutParams layoutparams = (LayoutParams)view1.getLayoutParams();
                if (!layoutparams.isDecor)
                    continue;
                int l2;
                switch (7 & layoutparams.gravity)
                {
                case 5: // '\005'
                    l2 = i2 - l1 - view1.getMeasuredWidth();
                    l1 += view1.getMeasuredWidth();
                    break;

                case 1: // '\001'
                    l2 = Math.max((i2 - view1.getMeasuredWidth()) / 2, k1);
                    break;

                case 3: // '\003'
                    l2 = k1;
                    k1 += view1.getWidth();
                    break;

                case 2: // '\002'
                case 4: // '\004'
                default:
                    l2 = k1;
                    break;
                }
                int i3 = (l2 + j1) - view1.getLeft();
                if (i3 != 0)
                    view1.offsetLeftAndRight(i3);
            }

        }
        if (mOnPageChangeListener != null)
            mOnPageChangeListener.onPageScrolled(i, f, j);
        if (mInternalPageChangeListener != null)
            mInternalPageChangeListener.onPageScrolled(i, f, j);
        if (mPageTransformer != null)
        {
            int k = getScrollX();
            int l = getChildCount();
            for (int i1 = 0; i1 < l; i1++)
            {
                View view = getChildAt(i1);
                if (!((LayoutParams)view.getLayoutParams()).isDecor)
                {
                    float f1 = (float)(view.getLeft() - k) / (float)getWidth();
                    mPageTransformer.transformPage(view, f1);
                }
            }

        }
        mCalledSuper = true;
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        int j = getChildCount();
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
        for (int i1 = k; i1 != l; i1 += byte0)
        {
            View view = getChildAt(i1);
            if (view.getVisibility() != 0)
                continue;
            ItemInfo iteminfo = infoForChild(view);
            if (iteminfo != null && iteminfo.position == mCurItem && view.requestFocus(i, rect))
                return true;
        }

        return false;
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        if (mAdapter != null)
        {
            mAdapter.restoreState(savedstate.adapterState, savedstate.loader);
            setCurrentItemInternal(savedstate.position, false, true);
            return;
        } else
        {
            mRestoredCurItem = savedstate.position;
            mRestoredAdapterState = savedstate.adapterState;
            mRestoredClassLoader = savedstate.loader;
            return;
        }
    }

    public Parcelable onSaveInstanceState()
    {
        SavedState savedstate = new SavedState(super.onSaveInstanceState());
        savedstate.position = mCurItem;
        if (mAdapter != null)
            savedstate.adapterState = mAdapter.saveState();
        return savedstate;
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        if (i != k)
            recomputeScrollPosition(i, k, mPageMargin, mPageMargin);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mFakeDragging)
            return true;
        if (motionevent.getAction() == 0 && motionevent.getEdgeFlags() != 0)
            return false;
        if (mAdapter != null && mAdapter.getCount() != 0)
        {
            if (mVelocityTracker == null)
                mVelocityTracker = VelocityTracker.obtain();
            mVelocityTracker.addMovement(motionevent);
            int i = 0xff & motionevent.getAction();
            boolean flag = false;
            switch (i)
            {
            case 6: // '\006'
                onSecondaryPointerUp(motionevent);
                mLastMotionX = MotionEventCompat.getX(motionevent, MotionEventCompat.findPointerIndex(motionevent, mActivePointerId));
                flag = false;
                break;

            case 5: // '\005'
                int j1 = MotionEventCompat.getActionIndex(motionevent);
                mLastMotionX = MotionEventCompat.getX(motionevent, j1);
                mActivePointerId = MotionEventCompat.getPointerId(motionevent, j1);
                flag = false;
                break;

            case 3: // '\003'
                boolean flag3 = mIsBeingDragged;
                flag = false;
                if (flag3)
                {
                    scrollToItem(mCurItem, true, 0, false);
                    mActivePointerId = -1;
                    endDrag();
                    flag = mLeftEdge.onRelease() | mRightEdge.onRelease();
                }
                break;

            case 1: // '\001'
                boolean flag2 = mIsBeingDragged;
                flag = false;
                if (flag2)
                {
                    VelocityTracker velocitytracker = mVelocityTracker;
                    velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
                    int k = (int)VelocityTrackerCompat.getXVelocity(velocitytracker, mActivePointerId);
                    mPopulatePending = true;
                    int l = getWidth();
                    int i1 = getScrollX();
                    ItemInfo iteminfo = infoForCurrentScrollPosition();
                    setCurrentItemInternal(determineTargetPage(iteminfo.position, ((float)i1 / (float)l - iteminfo.offset) / iteminfo.widthFactor, k, (int)(MotionEventCompat.getX(motionevent, MotionEventCompat.findPointerIndex(motionevent, mActivePointerId)) - mInitialMotionX)), true, true, k);
                    mActivePointerId = -1;
                    endDrag();
                    flag = mLeftEdge.onRelease() | mRightEdge.onRelease();
                }
                break;

            case 2: // '\002'
                if (!mIsBeingDragged)
                {
                    int j = MotionEventCompat.findPointerIndex(motionevent, mActivePointerId);
                    float f2 = MotionEventCompat.getX(motionevent, j);
                    float f3 = Math.abs(f2 - mLastMotionX);
                    float f4 = MotionEventCompat.getY(motionevent, j);
                    float f5 = Math.abs(f4 - mLastMotionY);
                    if (f3 > (float)mTouchSlop && f3 > f5)
                    {
                        mIsBeingDragged = true;
                        float f6;
                        if (f2 - mInitialMotionX > 0.0F)
                            f6 = mInitialMotionX + (float)mTouchSlop;
                        else
                            f6 = mInitialMotionX - (float)mTouchSlop;
                        mLastMotionX = f6;
                        mLastMotionY = f4;
                        setScrollState(1);
                        setScrollingCacheEnabled(true);
                    }
                }
                boolean flag1 = mIsBeingDragged;
                flag = false;
                if (flag1)
                    flag = false | performDrag(MotionEventCompat.getX(motionevent, MotionEventCompat.findPointerIndex(motionevent, mActivePointerId)));
                break;

            case 0: // '\0'
                mScroller.abortAnimation();
                mPopulatePending = false;
                populate();
                mIsBeingDragged = true;
                setScrollState(1);
                float f = motionevent.getX();
                mInitialMotionX = f;
                mLastMotionX = f;
                float f1 = motionevent.getY();
                mInitialMotionY = f1;
                mLastMotionY = f1;
                mActivePointerId = MotionEventCompat.getPointerId(motionevent, 0);
                flag = false;
                break;
            }
            if (flag)
                ViewCompat.postInvalidateOnAnimation(this);
            return true;
        } else
        {
            return false;
        }
    }

    boolean pageLeft()
    {
        if (mCurItem > 0)
        {
            setCurrentItem(-1 + mCurItem, true);
            return true;
        } else
        {
            return false;
        }
    }

    boolean pageRight()
    {
        if (mAdapter != null && mCurItem < -1 + mAdapter.getCount())
        {
            setCurrentItem(1 + mCurItem, true);
            return true;
        } else
        {
            return false;
        }
    }

    void populate()
    {
        populate(mCurItem);
    }

    void populate(int i)
    {
        ItemInfo iteminfo;
        int j = mCurItem;
        iteminfo = null;
        if (j != i)
        {
            iteminfo = infoForPosition(mCurItem);
            mCurItem = i;
        }
        if (mAdapter == null || mPopulatePending || getWindowToken() == null) goto _L2; else goto _L1
_L1:
        int l;
        int i1;
        int j1;
        int k1;
        mAdapter.startUpdate(this);
        int k = mOffscreenPageLimit;
        l = Math.max(0, mCurItem - k);
        i1 = mAdapter.getCount();
        j1 = Math.min(i1 - 1, k + mCurItem);
        k1 = 0;
_L31:
        int l1;
        ItemInfo iteminfo1;
        l1 = mItems.size();
        iteminfo1 = null;
        if (k1 >= l1) goto _L4; else goto _L3
_L3:
        ItemInfo iteminfo8 = (ItemInfo)mItems.get(k1);
        if (iteminfo8.position < mCurItem) goto _L6; else goto _L5
_L5:
        int j5 = iteminfo8.position;
        int k5 = mCurItem;
        iteminfo1 = null;
        if (j5 == k5)
            iteminfo1 = iteminfo8;
_L4:
        if (iteminfo1 == null && i1 > 0)
            iteminfo1 = addNewItem(mCurItem, k1);
        if (iteminfo1 == null) goto _L8; else goto _L7
_L7:
        float f;
        int i3;
        ItemInfo iteminfo5;
        float f1;
        int j3;
        f = 0.0F;
        i3 = k1 - 1;
        if (i3 >= 0)
            iteminfo5 = (ItemInfo)mItems.get(i3);
        else
            iteminfo5 = null;
        f1 = 2.0F - iteminfo1.widthFactor;
        j3 = -1 + mCurItem;
_L29:
        if (j3 < 0) goto _L10; else goto _L9
_L9:
        if (f < f1 || j3 >= l) goto _L12; else goto _L11
_L11:
        if (iteminfo5 == null) goto _L10; else goto _L13
_L13:
        int i5 = iteminfo5.position;
        if (j3 == i5 && !iteminfo5.scrolling)
        {
            mItems.remove(i3);
            PagerAdapter pageradapter2 = mAdapter;
            Object obj2 = iteminfo5.object;
            pageradapter2.destroyItem(this, j3, obj2);
            i3--;
            k1--;
            if (i3 >= 0)
                iteminfo5 = (ItemInfo)mItems.get(i3);
            else
                iteminfo5 = null;
        }
          goto _L14
_L10:
        float f2;
        int k3;
        f2 = iteminfo1.widthFactor;
        k3 = k1 + 1;
        if (f2 >= 2.0F) goto _L16; else goto _L15
_L15:
        ItemInfo iteminfo6;
        int l3;
        if (k3 < mItems.size())
            iteminfo6 = (ItemInfo)mItems.get(k3);
        else
            iteminfo6 = null;
        l3 = 1 + mCurItem;
_L25:
        if (l3 >= i1) goto _L16; else goto _L17
_L17:
        if (f2 < 2.0F || l3 <= j1) goto _L19; else goto _L18
_L18:
        if (iteminfo6 == null) goto _L16; else goto _L20
_L20:
        int j4 = iteminfo6.position;
        if (l3 == j4 && !iteminfo6.scrolling)
        {
            mItems.remove(k3);
            PagerAdapter pageradapter1 = mAdapter;
            Object obj1 = iteminfo6.object;
            pageradapter1.destroyItem(this, l3, obj1);
            if (k3 < mItems.size())
                iteminfo6 = (ItemInfo)mItems.get(k3);
            else
                iteminfo6 = null;
        }
          goto _L21
_L16:
        calculatePageOffsets(iteminfo1, k1, iteminfo);
_L8:
        PagerAdapter pageradapter = mAdapter;
        int i2 = mCurItem;
        Object obj;
        if (iteminfo1 != null)
            obj = iteminfo1.object;
        else
            obj = null;
        pageradapter.setPrimaryItem(this, i2, obj);
        mAdapter.finishUpdate(this);
        boolean flag;
        if (mDrawingOrder != 0)
            flag = true;
        else
            flag = false;
        if (flag)
            if (mDrawingOrderedChildren == null)
                mDrawingOrderedChildren = new ArrayList();
            else
                mDrawingOrderedChildren.clear();
        int j2 = getChildCount();
        for (int k2 = 0; k2 < j2; k2++)
        {
            View view2 = getChildAt(k2);
            LayoutParams layoutparams = (LayoutParams)view2.getLayoutParams();
            layoutparams.childIndex = k2;
            if (!layoutparams.isDecor && layoutparams.widthFactor == 0.0F)
            {
                ItemInfo iteminfo4 = infoForChild(view2);
                if (iteminfo4 != null)
                {
                    layoutparams.widthFactor = iteminfo4.widthFactor;
                    layoutparams.position = iteminfo4.position;
                }
            }
            if (flag)
                mDrawingOrderedChildren.add(view2);
        }

        if (flag)
            Collections.sort(mDrawingOrderedChildren, sPositionComparator);
        if (hasFocus())
        {
            View view = findFocus();
            ItemInfo iteminfo2;
            if (view != null)
                iteminfo2 = infoForAnyChild(view);
            else
                iteminfo2 = null;
            if (iteminfo2 == null || iteminfo2.position != mCurItem)
            {
                int l2 = 0;
                do
                {
                    if (l2 >= getChildCount())
                        break;
                    View view1 = getChildAt(l2);
                    ItemInfo iteminfo3 = infoForChild(view1);
                    if (iteminfo3 != null && iteminfo3.position == mCurItem && view1.requestFocus(2))
                        break;
                    l2++;
                } while (true);
            }
        }
_L2:
        return;
_L19:
        if (iteminfo6 == null) goto _L23; else goto _L22
_L22:
        int i4 = iteminfo6.position;
        if (l3 != i4) goto _L23; else goto _L24
_L24:
        f2 += iteminfo6.widthFactor;
        if (++k3 < mItems.size())
            iteminfo6 = (ItemInfo)mItems.get(k3);
        else
            iteminfo6 = null;
          goto _L21
_L23:
        ItemInfo iteminfo7 = addNewItem(l3, k3);
        k3++;
        f2 += iteminfo7.widthFactor;
        if (k3 < mItems.size())
            iteminfo6 = (ItemInfo)mItems.get(k3);
        else
            iteminfo6 = null;
_L21:
        l3++;
        if (true) goto _L25; else goto _L12
_L12:
        if (iteminfo5 == null) goto _L27; else goto _L26
_L26:
        int l4 = iteminfo5.position;
        if (j3 != l4) goto _L27; else goto _L28
_L28:
        f += iteminfo5.widthFactor;
        if (--i3 >= 0)
            iteminfo5 = (ItemInfo)mItems.get(i3);
        else
            iteminfo5 = null;
          goto _L14
_L27:
        int k4 = i3 + 1;
        f += addNewItem(j3, k4).widthFactor;
        k1++;
        if (i3 >= 0)
            iteminfo5 = (ItemInfo)mItems.get(i3);
        else
            iteminfo5 = null;
_L14:
        j3--;
        if (true) goto _L29; else goto _L6
_L6:
        k1++;
        if (true) goto _L31; else goto _L30
_L30:
    }

    public void removeView(View view)
    {
        if (mInLayout)
        {
            removeViewInLayout(view);
            return;
        } else
        {
            super.removeView(view);
            return;
        }
    }

    public void setAdapter(PagerAdapter pageradapter)
    {
        if (mAdapter != null)
        {
            mAdapter.unregisterDataSetObserver(mObserver);
            mAdapter.startUpdate(this);
            for (int i = 0; i < mItems.size(); i++)
            {
                ItemInfo iteminfo = (ItemInfo)mItems.get(i);
                mAdapter.destroyItem(this, iteminfo.position, iteminfo.object);
            }

            mAdapter.finishUpdate(this);
            mItems.clear();
            removeNonDecorViews();
            mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter pageradapter1 = mAdapter;
        mAdapter = pageradapter;
        if (mAdapter != null)
        {
            if (mObserver == null)
                mObserver = new PagerObserver();
            mAdapter.registerDataSetObserver(mObserver);
            mPopulatePending = false;
            mFirstLayout = true;
            if (mRestoredCurItem >= 0)
            {
                mAdapter.restoreState(mRestoredAdapterState, mRestoredClassLoader);
                setCurrentItemInternal(mRestoredCurItem, false, true);
                mRestoredCurItem = -1;
                mRestoredAdapterState = null;
                mRestoredClassLoader = null;
            } else
            {
                populate();
            }
        }
        if (mAdapterChangeListener != null && pageradapter1 != pageradapter)
            mAdapterChangeListener.onAdapterChanged(pageradapter1, pageradapter);
    }

    void setChildrenDrawingOrderEnabledCompat(boolean flag)
    {
        if (mSetChildrenDrawingOrderEnabled == null)
            try
            {
                Class aclass[] = new Class[1];
                aclass[0] = Boolean.TYPE;
                mSetChildrenDrawingOrderEnabled = android/view/ViewGroup.getDeclaredMethod("setChildrenDrawingOrderEnabled", aclass);
            }
            catch (NoSuchMethodException nosuchmethodexception)
            {
                Log.e("ViewPager", "Can't find setChildrenDrawingOrderEnabled", nosuchmethodexception);
            }
        try
        {
            Method method = mSetChildrenDrawingOrderEnabled;
            Object aobj[] = new Object[1];
            aobj[0] = Boolean.valueOf(flag);
            method.invoke(this, aobj);
            return;
        }
        catch (Exception exception)
        {
            Log.e("ViewPager", "Error changing children drawing order", exception);
        }
    }

    public void setCurrentItem(int i)
    {
        mPopulatePending = false;
        boolean flag;
        if (!mFirstLayout)
            flag = true;
        else
            flag = false;
        setCurrentItemInternal(i, flag, false);
    }

    public void setCurrentItem(int i, boolean flag)
    {
        mPopulatePending = false;
        setCurrentItemInternal(i, flag, false);
    }

    void setCurrentItemInternal(int i, boolean flag, boolean flag1)
    {
        setCurrentItemInternal(i, flag, flag1, 0);
    }

    void setCurrentItemInternal(int i, boolean flag, boolean flag1, int j)
    {
        boolean flag2 = true;
        if (mAdapter != null && mAdapter.getCount() > 0)
        {
            if (!flag1 && mCurItem == i && mItems.size() != 0)
            {
                setScrollingCacheEnabled(false);
                return;
            }
            if (i < 0)
                i = 0;
            else
            if (i >= mAdapter.getCount())
                i = -1 + mAdapter.getCount();
            int k = mOffscreenPageLimit;
            if (i > k + mCurItem || i < mCurItem - k)
            {
                for (int l = 0; l < mItems.size(); l++)
                    ((ItemInfo)mItems.get(l)).scrolling = flag2;

            }
            if (mCurItem == i)
                flag2 = false;
            populate(i);
            scrollToItem(i, flag, j, flag2);
            return;
        } else
        {
            setScrollingCacheEnabled(false);
            return;
        }
    }

    OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener onpagechangelistener)
    {
        OnPageChangeListener onpagechangelistener1 = mInternalPageChangeListener;
        mInternalPageChangeListener = onpagechangelistener;
        return onpagechangelistener1;
    }

    public void setOffscreenPageLimit(int i)
    {
        if (i < 1)
        {
            Log.w("ViewPager", (new StringBuilder()).append("Requested offscreen page limit ").append(i).append(" too small; defaulting to ").append(1).toString());
            i = 1;
        }
        if (i != mOffscreenPageLimit)
        {
            mOffscreenPageLimit = i;
            populate();
        }
    }

    void setOnAdapterChangeListener(OnAdapterChangeListener onadapterchangelistener)
    {
        mAdapterChangeListener = onadapterchangelistener;
    }

    public void setOnPageChangeListener(OnPageChangeListener onpagechangelistener)
    {
        mOnPageChangeListener = onpagechangelistener;
    }

    public void setPageMargin(int i)
    {
        int j = mPageMargin;
        mPageMargin = i;
        int k = getWidth();
        recomputeScrollPosition(k, k, i, j);
        requestLayout();
    }

    public void setPageMarginDrawable(int i)
    {
        setPageMarginDrawable(getContext().getResources().getDrawable(i));
    }

    public void setPageMarginDrawable(Drawable drawable)
    {
        mMarginDrawable = drawable;
        if (drawable != null)
            refreshDrawableState();
        boolean flag;
        if (drawable == null)
            flag = true;
        else
            flag = false;
        setWillNotDraw(flag);
        invalidate();
    }

    public void setPageTransformer(boolean flag, PageTransformer pagetransformer)
    {
        int i = 1;
        if (android.os.Build.VERSION.SDK_INT >= 11)
        {
            boolean flag1;
            if (pagetransformer != null)
                flag1 = i;
            else
                flag1 = false;
            int j;
            if (mPageTransformer != null)
                j = i;
            else
                j = 0;
            int k;
            if (flag1 != j)
                k = i;
            else
                k = 0;
            mPageTransformer = pagetransformer;
            setChildrenDrawingOrderEnabledCompat(flag1);
            if (flag1)
            {
                if (flag)
                    i = 2;
                mDrawingOrder = i;
            } else
            {
                mDrawingOrder = 0;
            }
            if (k != 0)
                populate();
        }
    }

    public void setRectSlopScaleInTab(int i, int j, int k, int l, float f, int i1)
    {
        mSpecRect = new Rect();
        mSpecRect.left = i;
        mSpecRect.top = j;
        mSpecRect.right = k;
        mSpecRect.bottom = l;
        mTouchSlopAdjust = (int)(f * (float)mTouchSlop);
        mSpecTab = i1;
        Log.d("ViewPager", (new StringBuilder()).append("setRectSlopScaleInTab mSpecRect = ").append(mSpecRect).append(", coef = ").append(f).append(", specTab = ").append(mSpecTab).toString());
    }

    void smoothScrollTo(int i, int j)
    {
        smoothScrollTo(i, j, 0);
    }

    void smoothScrollTo(int i, int j, int k)
    {
        if (getChildCount() == 0)
        {
            setScrollingCacheEnabled(false);
            return;
        }
        int l = getScrollX();
        int i1 = getScrollY();
        int j1 = i - l;
        int k1 = j - i1;
        if (j1 == 0 && k1 == 0)
        {
            completeScroll(false);
            populate();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int l1 = getWidth();
        int i2 = l1 / 2;
        float f = Math.min(1.0F, (1.0F * (float)Math.abs(j1)) / (float)l1);
        float f1 = (float)i2 + (float)i2 * distanceInfluenceForSnapDuration(f);
        int j2 = Math.abs(k);
        int k2;
        if (j2 > 0)
        {
            k2 = 4 * Math.round(1000F * Math.abs(f1 / (float)j2));
        } else
        {
            float f2 = (float)l1 * mAdapter.getPageWidth(mCurItem);
            k2 = (int)(100F * (1.0F + (float)Math.abs(j1) / (f2 + (float)mPageMargin)));
        }
        int l2 = Math.min(k2, 600);
        mScroller.startScroll(l, i1, j1, k1, l2);
        ViewCompat.postInvalidateOnAnimation(this);
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return super.verifyDrawable(drawable) || drawable == mMarginDrawable;
    }





}
