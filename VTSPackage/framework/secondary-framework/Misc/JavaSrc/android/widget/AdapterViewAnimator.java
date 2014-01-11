// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.animation.AnimatorInflater;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.os.*;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package android.widget:
//            AdapterView, Advanceable, FrameLayout, RemoteViewsAdapter, 
//            Adapter

public abstract class AdapterViewAnimator extends AdapterView
    implements RemoteViewsAdapter.RemoteAdapterConnectionCallback, Advanceable
{
    final class CheckForTap
        implements Runnable
    {

        final AdapterViewAnimator this$0;

        public void run()
        {
            if (mTouchMode == 1)
            {
                View view = getCurrentView();
                showTapFeedback(view);
            }
        }

        CheckForTap()
        {
            this$0 = AdapterViewAnimator.this;
            super();
        }
    }

    static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
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
;
        int whichChild;

        public String toString()
        {
            return (new StringBuilder()).append("AdapterViewAnimator.SavedState{ whichChild = ").append(whichChild).append(" }").toString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(whichChild);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            whichChild = parcel.readInt();
        }


        SavedState(Parcelable parcelable, int i)
        {
            super(parcelable);
            whichChild = i;
        }
    }

    class ViewAndMetaData
    {

        int adapterPosition;
        long itemId;
        int relativeIndex;
        final AdapterViewAnimator this$0;
        View view;

        public String toString()
        {
            return (new StringBuilder()).append("ViewAndMetaData{View = ").append(view).append(",relativeIndex = ").append(relativeIndex).append(",adapterPosition = ").append(adapterPosition).append(",itemId = ").append(itemId).append("}").toString();
        }

        ViewAndMetaData(View view1, int i, int j, long l)
        {
            this$0 = AdapterViewAnimator.this;
            super();
            view = view1;
            relativeIndex = i;
            adapterPosition = j;
            itemId = l;
        }
    }


    private static final boolean DBG = true;
    private static final boolean DBG_SHOW = false;
    private static final int DEFAULT_ANIMATION_DURATION = 200;
    private static final String TAG = "AdapterViewAnimator";
    static final int TOUCH_MODE_DOWN_IN_CURRENT_VIEW = 1;
    static final int TOUCH_MODE_HANDLED = 2;
    static final int TOUCH_MODE_NONE;
    int mActiveOffset;
    Adapter mAdapter;
    boolean mAnimateFirstTime;
    int mCurrentWindowEnd;
    int mCurrentWindowStart;
    int mCurrentWindowStartUnbounded;
    private boolean mDataHasChanged;
    AdapterView.AdapterDataSetObserver mDataSetObserver;
    boolean mDeferNotifyDataSetChanged;
    boolean mFirstTime;
    ObjectAnimator mInAnimation;
    boolean mLoopViews;
    int mMaxNumActiveViews;
    ObjectAnimator mOutAnimation;
    private Runnable mPendingCheckForTap;
    private int mPreviousItemCount;
    ArrayList mPreviousViews;
    int mReferenceChildHeight;
    int mReferenceChildWidth;
    RemoteViewsAdapter mRemoteViewsAdapter;
    private int mRestoreWhichChild;
    private int mTouchMode;
    HashMap mViewsMap;
    int mWhichChild;

    public AdapterViewAnimator(Context context)
    {
        this(context, null);
    }

    public AdapterViewAnimator(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public AdapterViewAnimator(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mWhichChild = 0;
        mRestoreWhichChild = -1;
        mAnimateFirstTime = true;
        mActiveOffset = 0;
        mMaxNumActiveViews = 1;
        mViewsMap = new HashMap();
        mCurrentWindowStart = 0;
        mCurrentWindowEnd = -1;
        mCurrentWindowStartUnbounded = 0;
        mDeferNotifyDataSetChanged = false;
        mFirstTime = true;
        mLoopViews = true;
        mReferenceChildWidth = -1;
        mReferenceChildHeight = -1;
        mTouchMode = 0;
        mDataHasChanged = false;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.AdapterViewAnimator, i, 0);
        int j = typedarray.getResourceId(0, 0);
        if (j > 0)
            setInAnimation(context, j);
        else
            setInAnimation(getDefaultInAnimation());
        int k = typedarray.getResourceId(1, 0);
        if (k > 0)
            setOutAnimation(context, k);
        else
            setOutAnimation(getDefaultOutAnimation());
        setAnimateFirstView(typedarray.getBoolean(2, true));
        mLoopViews = typedarray.getBoolean(3, false);
        typedarray.recycle();
        initViewAnimator();
    }

    private void addChild(View view)
    {
        addViewInLayout(view, -1, createOrReuseLayoutParams(view));
        Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("addChild: child = ").append(view).append(",index = ").append(indexOfChild(view)).append(",this = ").append(this).toString());
        if (mReferenceChildWidth == -1 || mReferenceChildHeight == -1)
        {
            int i = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            view.measure(i, i);
            mReferenceChildWidth = view.getMeasuredWidth();
            mReferenceChildHeight = view.getMeasuredHeight();
        }
    }

    private void clearViewMaps()
    {
        View view;
        for (Iterator iterator = mViewsMap.keySet().iterator(); iterator.hasNext(); removeViewInLayout(view))
        {
            Integer integer = (Integer)iterator.next();
            view = ((ViewAndMetaData)mViewsMap.get(integer)).view;
            view.clearAnimation();
            if (view instanceof ViewGroup)
                ((ViewGroup)view).removeAllViewsInLayout();
            applyTransformForChildAtIndex(view, -1);
        }

        mViewsMap.clear();
        mPreviousViews.clear();
    }

    private ViewAndMetaData getMetaDataForChild(View view)
    {
        for (Iterator iterator = mViewsMap.values().iterator(); iterator.hasNext();)
        {
            ViewAndMetaData viewandmetadata = (ViewAndMetaData)iterator.next();
            if (viewandmetadata.view == view)
                return viewandmetadata;
        }

        return null;
    }

    private void initViewAnimator()
    {
        mPreviousViews = new ArrayList();
    }

    private void measureChildren()
    {
        int i = getChildCount();
        int j = getMeasuredWidth() - super.mPaddingLeft - super.mPaddingRight;
        int k = getMeasuredHeight() - super.mPaddingTop - super.mPaddingBottom;
        for (int l = 0; l < i; l++)
            getChildAt(l).measure(android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(k, 0x40000000));

    }

    private void setDisplayedChild(int i, boolean flag)
    {
        if (mAdapter != null)
        {
            Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("setDisplayedChild: whichChild = ").append(i).append(",mWhichChild = ").append(mWhichChild).append(",window size = ").append(getWindowSize()).append(",animate = ").append(flag).append(",mViewsMap = ").append(mViewsMap).append(",mPreviousViews = ").append(mPreviousViews).append(",item count = ").append(getCount()).toString());
            mWhichChild = i;
            if (i >= getWindowSize())
            {
                int k;
                if (mLoopViews)
                    k = 0;
                else
                    k = -1 + getWindowSize();
                mWhichChild = k;
            } else
            if (i < 0)
            {
                int j;
                if (mLoopViews)
                    j = -1 + getWindowSize();
                else
                    j = 0;
                mWhichChild = j;
            }
            boolean flag1;
            if (getFocusedChild() != null)
                flag1 = true;
            else
                flag1 = false;
            showOnly(mWhichChild, flag);
            if (flag1)
                requestFocus(2);
        }
    }

    public void advance()
    {
        showNext();
    }

    void applyTransformForChildAtIndex(View view, int i)
    {
    }

    void cancelHandleClick()
    {
        View view = getCurrentView();
        if (view != null)
            hideTapFeedback(view);
        mTouchMode = 0;
    }

    void checkForAndHandleDataChanged()
    {
        if (super.mDataChanged)
            post(new Runnable() {

                final AdapterViewAnimator this$0;

                public void run()
                {
                    Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("Handle data change start: mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",mWhichChild = ").append(mWhichChild).append(", item count = ").append(getCount()).append(", mOldItemCount = ").append(mOldItemCount).append(",mPreviousItemCount = ").append(mPreviousItemCount).append(",child count = ").append(getChildCount()).append(",getWindowSize()= ").append(getWindowSize()).append(",mViewsMap = ").append(mViewsMap).append(",mPreviousViews = ").append(mPreviousViews).append(",this = ").append(this).toString());
                    handleDataChanged();
                    if (mPreviousItemCount != getCount())
                    {
                        mDataHasChanged = true;
                        clearViewMaps();
                    }
                    if (mWhichChild >= getWindowSize())
                    {
                        mWhichChild = 0;
                        showOnly(mWhichChild, false);
                    } else
                    if (mPreviousItemCount != getCount())
                        showOnly(mWhichChild, false);
                    mPreviousItemCount = getCount();
                    refreshChildren();
                    requestLayout();
                    Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("Handle data change end: item count = ").append(getCount()).append(",child count = ").append(getChildCount()).append(",mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",mWhichChild = ").append(mWhichChild).append(",mViewsMap = ").append(mViewsMap).append(",mPreviousViews = ").append(mPreviousViews).toString());
                }

            
            {
                this$0 = AdapterViewAnimator.this;
                super();
            }
            }
);
        super.mDataChanged = false;
    }

    void configureViewAnimator(int i, int j)
    {
        if (j <= i - 1);
        mMaxNumActiveViews = i;
        mActiveOffset = j;
        mPreviousViews.clear();
        mViewsMap.clear();
        removeAllViewsInLayout();
        mCurrentWindowStart = 0;
        mCurrentWindowEnd = -1;
    }

    android.view.ViewGroup.LayoutParams createOrReuseLayoutParams(View view)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams instanceof android.view.ViewGroup.LayoutParams)
            return layoutparams;
        else
            return new android.view.ViewGroup.LayoutParams(0, 0);
    }

    public void deferNotifyDataSetChanged()
    {
        mDeferNotifyDataSetChanged = true;
    }

    public void fyiWillBeAdvancedByHostKThx()
    {
    }

    public Adapter getAdapter()
    {
        return mAdapter;
    }

    public int getBaseline()
    {
        if (getCurrentView() != null)
            return getCurrentView().getBaseline();
        else
            return super.getBaseline();
    }

    public View getCurrentView()
    {
        return getViewAtRelativeIndex(mActiveOffset);
    }

    ObjectAnimator getDefaultInAnimation()
    {
        ObjectAnimator objectanimator = ObjectAnimator.ofFloat(null, "alpha", new float[] {
            0.0F, 1.0F
        });
        objectanimator.setDuration(200L);
        return objectanimator;
    }

    ObjectAnimator getDefaultOutAnimation()
    {
        ObjectAnimator objectanimator = ObjectAnimator.ofFloat(null, "alpha", new float[] {
            1.0F, 0.0F
        });
        objectanimator.setDuration(200L);
        return objectanimator;
    }

    public int getDisplayedChild()
    {
        return mWhichChild;
    }

    FrameLayout getFrameForChild()
    {
        return new FrameLayout(super.mContext);
    }

    public ObjectAnimator getInAnimation()
    {
        return mInAnimation;
    }

    int getNumActiveViews()
    {
        if (mAdapter != null)
            return Math.min(1 + getCount(), mMaxNumActiveViews);
        else
            return mMaxNumActiveViews;
    }

    public ObjectAnimator getOutAnimation()
    {
        return mOutAnimation;
    }

    public View getSelectedView()
    {
        return getViewAtRelativeIndex(mActiveOffset);
    }

    View getViewAtRelativeIndex(int i)
    {
        if (i >= 0 && i <= -1 + getNumActiveViews() && mAdapter != null)
        {
            int j = modulo(i + mCurrentWindowStartUnbounded, getWindowSize());
            if (mViewsMap.get(Integer.valueOf(j)) != null)
                return ((ViewAndMetaData)mViewsMap.get(Integer.valueOf(j))).view;
        }
        return null;
    }

    int getWindowSize()
    {
        if (mAdapter != null)
        {
            int i = getCount();
            if (i <= getNumActiveViews() && mLoopViews)
                i *= mMaxNumActiveViews;
            return i;
        } else
        {
            return 0;
        }
    }

    void hideTapFeedback(View view)
    {
        view.setPressed(false);
    }

    int modulo(int i, int j)
    {
        if (j > 0)
            return (j + i % j) % j;
        else
            return 0;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/AdapterViewAnimator.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/AdapterViewAnimator.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        checkForAndHandleDataChanged();
        int i1 = getChildCount();
        for (int j1 = 0; j1 < i1; j1++)
        {
            View view = getChildAt(j1);
            int k1 = super.mPaddingLeft + view.getMeasuredWidth();
            int l1 = super.mPaddingTop + view.getMeasuredHeight();
            view.layout(super.mPaddingLeft, super.mPaddingTop, k1, l1);
        }

    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getSize(i);
        int l = android.view.View.MeasureSpec.getSize(j);
        int i1 = android.view.View.MeasureSpec.getMode(i);
        int j1 = android.view.View.MeasureSpec.getMode(j);
        boolean flag;
        if (mReferenceChildWidth != -1 && mReferenceChildHeight != -1)
            flag = true;
        else
            flag = false;
        if (j1 == 0)
        {
            if (flag)
                l = mReferenceChildHeight + super.mPaddingTop + super.mPaddingBottom;
            else
                l = 0;
        } else
        if (j1 == 0x80000000 && flag)
        {
            int l1 = mReferenceChildHeight + super.mPaddingTop + super.mPaddingBottom;
            if (l1 > l)
                l |= 0x1000000;
            else
                l = l1;
        }
        if (i1 == 0)
        {
            if (flag)
                k = mReferenceChildWidth + super.mPaddingLeft + super.mPaddingRight;
            else
                k = 0;
        } else
        if (j1 == 0x80000000 && flag)
        {
            int k1 = mReferenceChildWidth + super.mPaddingLeft + super.mPaddingRight;
            if (k1 > k)
                k |= 0x1000000;
            else
                k = k1;
        }
        setMeasuredDimension(k, l);
        measureChildren();
    }

    public boolean onRemoteAdapterConnected()
    {
        Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("onRemoteAdapterConnected: mRemoteViewsAdapter = ").append(mRemoteViewsAdapter).append(",mAdapter = ").append(mAdapter).append(",mDeferNotifyDataSetChanged = ").append(mDeferNotifyDataSetChanged).append(",this = ").append(this).toString());
        if (mRemoteViewsAdapter != mAdapter)
        {
            setAdapter(mRemoteViewsAdapter);
            if (mDeferNotifyDataSetChanged)
            {
                mRemoteViewsAdapter.notifyDataSetChanged();
                mDeferNotifyDataSetChanged = false;
            }
            if (mRestoreWhichChild > -1)
            {
                setDisplayedChild(mRestoreWhichChild, false);
                mRestoreWhichChild = -1;
            }
        } else
        if (mRemoteViewsAdapter != null)
        {
            mRemoteViewsAdapter.superNotifyDataSetChanged();
            return true;
        }
        return false;
    }

    public void onRemoteAdapterDisconnected()
    {
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        mWhichChild = savedstate.whichChild;
        if (mRemoteViewsAdapter != null && mAdapter == null)
        {
            mRestoreWhichChild = mWhichChild;
            return;
        } else
        {
            setDisplayedChild(mWhichChild, false);
            return;
        }
    }

    public Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        if (mRemoteViewsAdapter != null)
            mRemoteViewsAdapter.saveRemoteViewsCache();
        return new SavedState(parcelable, mWhichChild);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        case 3: // '\003'
            View view1 = getCurrentView();
            if (view1 != null)
                hideTapFeedback(view1);
            mTouchMode = 0;
            return false;

        case 1: // '\001'
            Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("onTouchEvent touch up: mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",mTouchMode = ").append(mTouchMode).append(",this = ").append(this).toString());
            int i = mTouchMode;
            boolean flag = false;
            if (i == 1)
            {
                final View v = getCurrentView();
                final ViewAndMetaData viewData = getMetaDataForChild(v);
                flag = false;
                if (v != null)
                {
                    boolean flag1 = isTransformedTouchPointInView(motionevent.getX(), motionevent.getY(), v, null);
                    flag = false;
                    if (flag1)
                    {
                        Handler handler = getHandler();
                        if (handler != null)
                            handler.removeCallbacks(mPendingCheckForTap);
                        showTapFeedback(v);
                        postDelayed(new Runnable() {

                            final AdapterViewAnimator this$0;
                            final View val$v;
                            final ViewAndMetaData val$viewData;

                            public void run()
                            {
                                hideTapFeedback(v);
                                post(new Runnable() {

                                    final _cls1 this$1;

                                    public void run()
                                    {
                                        if (viewData != null)
                                        {
                                            performItemClick(v, viewData.adapterPosition, viewData.itemId);
                                            return;
                                        } else
                                        {
                                            performItemClick(v, 0, 0L);
                                            return;
                                        }
                                    }

            
            {
                this$1 = _cls1.this;
                super();
            }
                                }
);
                            }

            
            {
                this$0 = AdapterViewAnimator.this;
                v = view;
                viewData = viewandmetadata;
                super();
            }
                        }
, ViewConfiguration.getPressedStateDuration());
                        flag = true;
                    }
                }
            }
            mTouchMode = 0;
            return flag;

        case 0: // '\0'
            View view = getCurrentView();
            Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("onTouchEvent touch down: mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",v = ").append(view).append(",mTouchMode = ").append(mTouchMode).append(",this = ").append(this).toString());
            if (view != null && isTransformedTouchPointInView(motionevent.getX(), motionevent.getY(), view, null))
            {
                if (mPendingCheckForTap == null)
                    mPendingCheckForTap = new CheckForTap();
                mTouchMode = 1;
                postDelayed(mPendingCheckForTap, ViewConfiguration.getTapTimeout());
                return false;
            }
            // fall through

        case 2: // '\002'
        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        default:
            return false;
        }
    }

    void refreshChildren()
    {
        if (mAdapter != null)
        {
            for (int i = mCurrentWindowStart; i <= mCurrentWindowEnd; i++)
            {
                int j = modulo(i, getWindowSize());
                int k = getCount();
                View view = mAdapter.getView(modulo(i, k), null, this);
                if (view.getImportantForAccessibility() == 0)
                    view.setImportantForAccessibility(1);
                if (!mViewsMap.containsKey(Integer.valueOf(j)))
                    continue;
                FrameLayout framelayout = (FrameLayout)((ViewAndMetaData)mViewsMap.get(Integer.valueOf(j))).view;
                if (view != null)
                {
                    framelayout.removeAllViewsInLayout();
                    framelayout.addView(view);
                }
            }

        }
    }

    public void setAdapter(Adapter adapter)
    {
        if (mAdapter != null && mDataSetObserver != null)
            mAdapter.unregisterDataSetObserver(mDataSetObserver);
        mAdapter = adapter;
        checkFocus();
        Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("setAdapter: adapter count = ").append(getCount()).append(",mWhichChild = ").append(mWhichChild).append(",this = ").append(this).toString());
        if (mAdapter != null)
        {
            mDataSetObserver = new AdapterView.AdapterDataSetObserver(this);
            mAdapter.registerDataSetObserver(mDataSetObserver);
            super.mItemCount = mAdapter.getCount();
        }
        setFocusable(true);
        mWhichChild = 0;
        showOnly(mWhichChild, false);
    }

    public void setAnimateFirstView(boolean flag)
    {
        mAnimateFirstTime = flag;
    }

    public void setDisplayedChild(int i)
    {
        setDisplayedChild(i, true);
    }

    public void setInAnimation(ObjectAnimator objectanimator)
    {
        mInAnimation = objectanimator;
    }

    public void setInAnimation(Context context, int i)
    {
        setInAnimation((ObjectAnimator)AnimatorInflater.loadAnimator(context, i));
    }

    public void setOutAnimation(ObjectAnimator objectanimator)
    {
        mOutAnimation = objectanimator;
    }

    public void setOutAnimation(Context context, int i)
    {
        setOutAnimation((ObjectAnimator)AnimatorInflater.loadAnimator(context, i));
    }

    public void setRemoteViewsAdapter(Intent intent)
    {
        Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("setRemoteViewsAdapter: intent = ").append(intent).append(",mRemoteViewsAdapter = ").append(mRemoteViewsAdapter).append(",mWhichChild = ").append(mWhichChild).append(",this = ").append(this).toString());
        if (mRemoteViewsAdapter == null || !(new android.content.Intent.FilterComparison(intent)).equals(new android.content.Intent.FilterComparison(mRemoteViewsAdapter.getRemoteViewsServiceIntent())))
        {
            mDeferNotifyDataSetChanged = false;
            mRemoteViewsAdapter = new RemoteViewsAdapter(getContext(), intent, this);
            if (mRemoteViewsAdapter.isDataReady())
            {
                setAdapter(mRemoteViewsAdapter);
                return;
            }
        }
    }

    public void setRemoteViewsOnClickHandler(RemoteViews.OnClickHandler onclickhandler)
    {
        if (mRemoteViewsAdapter != null)
            mRemoteViewsAdapter.setRemoteViewsOnClickHandler(onclickhandler);
    }

    public void setSelection(int i)
    {
        setDisplayedChild(i);
    }

    public void showNext()
    {
        setDisplayedChild(1 + mWhichChild);
    }

    void showOnly(int i, boolean flag)
    {
label0:
        {
label1:
            {
                if (mAdapter == null)
                    break label0;
                int j = getCount();
                if (j == 0)
                    break label0;
                Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("showOnly start: childIndex = ").append(i).append(",mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",mWhichChild = ").append(mWhichChild).append(",animate = ").append(flag).append(",window size = ").append(getWindowSize()).append(",mActiveOffset = ").append(mActiveOffset).append(",childCount = ").append(getChildCount()).append(",mViewsMap = ").append(mViewsMap).append(",mPreviousViews = ").append(mPreviousViews).append(",this = ").append(this).toString());
                for (int k = 0; k < mPreviousViews.size(); k++)
                {
                    View view3 = ((ViewAndMetaData)mViewsMap.get(mPreviousViews.get(k))).view;
                    mViewsMap.remove(mPreviousViews.get(k));
                    view3.clearAnimation();
                    if (view3 instanceof ViewGroup)
                        ((ViewGroup)view3).removeAllViewsInLayout();
                    applyTransformForChildAtIndex(view3, -1);
                    removeViewInLayout(view3);
                }

                mPreviousViews.clear();
                int l = i - mActiveOffset;
                int i1 = -1 + (l + getNumActiveViews());
                int j1 = Math.max(0, l);
                int k1 = Math.min(j - 1, i1);
                if (mLoopViews)
                {
                    j1 = l;
                    k1 = i1;
                }
                int l1 = getWindowSize();
                int i2 = modulo(j1, l1);
                int j2 = getWindowSize();
                int k2 = modulo(k1, j2);
                boolean flag1 = false;
                if (i2 > k2)
                    flag1 = true;
                Iterator iterator = mViewsMap.keySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    Integer integer = (Integer)iterator.next();
                    boolean flag3;
                    if (flag1 || integer.intValue() >= i2 && integer.intValue() <= k2)
                    {
                        flag3 = false;
                        if (flag1)
                        {
                            int k5 = integer.intValue();
                            flag3 = false;
                            if (k5 > k2)
                            {
                                int l5 = integer.intValue();
                                flag3 = false;
                                if (l5 < i2)
                                    flag3 = true;
                            }
                        }
                    } else
                    {
                        flag3 = true;
                    }
                    if (flag3)
                    {
                        View view2 = ((ViewAndMetaData)mViewsMap.get(integer)).view;
                        int j5 = ((ViewAndMetaData)mViewsMap.get(integer)).relativeIndex;
                        mPreviousViews.add(integer);
                        transformViewForTransition(j5, -1, view2, flag);
                    }
                } while (true);
                if (!mDataHasChanged)
                {
                    int k4 = mCurrentWindowStart;
                    if (j1 == k4)
                    {
                        int i5 = mCurrentWindowEnd;
                        if (k1 == i5 && l == mCurrentWindowStartUnbounded)
                            break label1;
                    }
                }
                mDataHasChanged = false;
                for (int l2 = j1; l2 <= k1; l2++)
                {
                    int k3 = modulo(l2, getWindowSize());
                    int l3;
                    if (mViewsMap.containsKey(Integer.valueOf(k3)))
                        l3 = ((ViewAndMetaData)mViewsMap.get(Integer.valueOf(k3))).relativeIndex;
                    else
                        l3 = -1;
                    int i4 = l2 - l;
                    boolean flag2;
                    if (mViewsMap.containsKey(Integer.valueOf(k3)) && !mPreviousViews.contains(Integer.valueOf(k3)))
                        flag2 = true;
                    else
                        flag2 = false;
                    if (flag2)
                    {
                        View view1 = ((ViewAndMetaData)mViewsMap.get(Integer.valueOf(k3))).view;
                        ((ViewAndMetaData)mViewsMap.get(Integer.valueOf(k3))).relativeIndex = i4;
                        applyTransformForChildAtIndex(view1, i4);
                        transformViewForTransition(l3, i4, view1, flag);
                    } else
                    {
                        int j4 = modulo(l2, j);
                        View view = mAdapter.getView(j4, null, this);
                        long l4 = mAdapter.getItemId(j4);
                        FrameLayout framelayout = getFrameForChild();
                        if (view != null)
                            framelayout.addView(view);
                        mViewsMap.put(Integer.valueOf(k3), new ViewAndMetaData(framelayout, i4, j4, l4));
                        addChild(framelayout);
                        applyTransformForChildAtIndex(framelayout, i4);
                        transformViewForTransition(-1, i4, framelayout, flag);
                    }
                    ((ViewAndMetaData)mViewsMap.get(Integer.valueOf(k3))).view.bringToFront();
                }

                mCurrentWindowStart = j1;
                mCurrentWindowEnd = k1;
                mCurrentWindowStartUnbounded = l;
                if (mRemoteViewsAdapter != null)
                {
                    int i3 = modulo(mCurrentWindowStart, j);
                    int j3 = modulo(mCurrentWindowEnd, j);
                    mRemoteViewsAdapter.setVisibleRangeHint(i3, j3);
                }
            }
            requestLayout();
            invalidate();
            Xlog.d("AdapterViewAnimator", (new StringBuilder()).append("showOnly end: childIndex = ").append(i).append(",mCurrentWindowStart = ").append(mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(mCurrentWindowEnd).append(",window size = ").append(getWindowSize()).append(",mActiveOffset = ").append(mActiveOffset).append(",childCount = ").append(getChildCount()).append(",mPreviousViews = ").append(mPreviousViews).append(",mViewsMap = ").append(mViewsMap).toString());
            return;
        }
    }

    public void showPrevious()
    {
        setDisplayedChild(-1 + mWhichChild);
    }

    void showTapFeedback(View view)
    {
        view.setPressed(true);
    }

    void transformViewForTransition(int i, int j, View view, boolean flag)
    {
        if (i == -1)
        {
            mInAnimation.setTarget(view);
            mInAnimation.start();
        } else
        if (j == -1)
        {
            mOutAnimation.setTarget(view);
            mOutAnimation.start();
            return;
        }
    }




/*
    static int access$102(AdapterViewAnimator adapterviewanimator, int i)
    {
        adapterviewanimator.mPreviousItemCount = i;
        return i;
    }

*/


/*
    static boolean access$202(AdapterViewAnimator adapterviewanimator, boolean flag)
    {
        adapterviewanimator.mDataHasChanged = flag;
        return flag;
    }

*/

}
