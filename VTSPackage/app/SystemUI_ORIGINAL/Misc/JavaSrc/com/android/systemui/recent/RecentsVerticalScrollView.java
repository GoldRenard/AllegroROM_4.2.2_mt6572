// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.util.*;
import android.view.*;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import com.android.systemui.SwipeHelper;
import java.util.HashSet;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.recent:
//            RecentsScrollViewPerformanceHelper, TaskDescription, RecentsCallback

public class RecentsVerticalScrollView extends ScrollView
    implements com.android.systemui.SwipeHelper.Callback, RecentsPanelView.RecentsScrollView
{

    private static final boolean DEBUG = false;
    private static final String TAG = "RecentsPanelView";
    private RecentsPanelView.TaskDescriptionAdapter mAdapter;
    private RecentsCallback mCallback;
    protected int mLastScrollPosition;
    private LinearLayout mLinearLayout;
    private int mNumItemsInOneScreenful;
    private RecentsScrollViewPerformanceHelper mPerformanceHelper;
    private HashSet mRecycledViews;
    private SwipeHelper mSwipeHelper;

    public RecentsVerticalScrollView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset, 0);
        mSwipeHelper = new SwipeHelper(0, this, getResources().getDisplayMetrics().density, ViewConfiguration.get(mContext).getScaledPagingTouchSlop());
        mPerformanceHelper = RecentsScrollViewPerformanceHelper.create(context, attributeset, this, true);
        mRecycledViews = new HashSet();
    }

    private void addToRecycledViews(View view)
    {
        if (mRecycledViews.size() < mNumItemsInOneScreenful)
            mRecycledViews.add(view);
    }

    private int scrollPositionOfMostRecent()
    {
        return mLinearLayout.getHeight() - getHeight();
    }

    private void setOverScrollEffectPadding(int i, int j)
    {
    }

    private void update()
    {
        for (int i = 0; i < mLinearLayout.getChildCount(); i++)
        {
            View view4 = mLinearLayout.getChildAt(i);
            addToRecycledViews(view4);
            mAdapter.recycleView(view4);
        }

        LayoutTransition layouttransition = getLayoutTransition();
        setLayoutTransition(null);
        mLinearLayout.removeAllViews();
        Iterator iterator = mRecycledViews.iterator();
        for (int j = 0; j < mAdapter.getCount(); j++)
        {
            boolean flag = iterator.hasNext();
            View view1 = null;
            if (flag)
            {
                view1 = (View)iterator.next();
                iterator.remove();
                view1.setVisibility(0);
            }
            final View view = mAdapter.getView(j, view1, mLinearLayout);
            if (mPerformanceHelper != null)
                mPerformanceHelper.addViewCallback(view);
            android.view.View.OnTouchListener ontouchlistener = new android.view.View.OnTouchListener() {

                final RecentsVerticalScrollView this$0;

                public boolean onTouch(View view5, MotionEvent motionevent)
                {
                    return true;
                }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                super();
            }
            }
;
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final RecentsVerticalScrollView this$0;

                public void onClick(View view5)
                {
                    mCallback.dismiss();
                }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                super();
            }
            }
);
            view.setSoundEffectsEnabled(false);
            android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

                final RecentsVerticalScrollView this$0;
                final View val$view;

                public void onClick(View view5)
                {
                    mCallback.handleOnClick(view);
                }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                view = view1;
                super();
            }
            }
;
            final View thumbnailView = ((RecentsPanelView.ViewHolder)view.getTag()).thumbnailView;
            android.view.View.OnLongClickListener onlongclicklistener = new android.view.View.OnLongClickListener() {

                final RecentsVerticalScrollView this$0;
                final View val$thumbnailView;
                final View val$view;

                public boolean onLongClick(View view5)
                {
                    View view6 = view.findViewById(0x7f0800c2);
                    mCallback.handleLongPress(view, view6, thumbnailView);
                    return true;
                }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                view = view1;
                thumbnailView = view2;
                super();
            }
            }
;
            thumbnailView.setClickable(true);
            thumbnailView.setOnClickListener(onclicklistener);
            thumbnailView.setOnLongClickListener(onlongclicklistener);
            View view2 = view.findViewById(0x7f0800bd);
            view2.setContentDescription(" ");
            view2.setOnTouchListener(ontouchlistener);
            View view3 = view.findViewById(0x7f0800c1);
            if (view3 != null)
                view3.setOnTouchListener(ontouchlistener);
            mLinearLayout.addView(view);
        }

        setLayoutTransition(layouttransition);
        android.view.ViewTreeObserver.OnGlobalLayoutListener ongloballayoutlistener = new android.view.ViewTreeObserver.OnGlobalLayoutListener() {

            final RecentsVerticalScrollView this$0;

            public void onGlobalLayout()
            {
                mLastScrollPosition = scrollPositionOfMostRecent();
                scrollTo(0, mLastScrollPosition);
                ViewTreeObserver viewtreeobserver = getViewTreeObserver();
                if (viewtreeobserver.isAlive())
                    viewtreeobserver.removeOnGlobalLayoutListener(this);
            }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                super();
            }
        }
;
        getViewTreeObserver().addOnGlobalLayoutListener(ongloballayoutlistener);
    }

    public boolean canChildBeDismissed(View view)
    {
        return true;
    }

    public void dismissChild(View view)
    {
        mSwipeHelper.dismissChild(view, 0.0F);
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        if (mPerformanceHelper != null)
        {
            LayoutTransition layouttransition = mLinearLayout.getLayoutTransition();
            if (layouttransition == null || !layouttransition.isRunning() || mLinearLayout.getChildCount() >= mNumItemsInOneScreenful)
            {
                int i = mPaddingLeft;
                boolean flag = isPaddingOffsetRequired();
                if (flag)
                    i += getLeftPaddingOffset();
                int j = i + mScrollX;
                int k = (j + mRight) - mLeft - mPaddingRight - i;
                int l = mScrollY + getFadeTop(flag);
                int i1 = l + getFadeHeight(flag);
                if (flag)
                {
                    k += getRightPaddingOffset();
                    i1 += getBottomPaddingOffset();
                }
                mPerformanceHelper.drawCallback(canvas, j, k, l, i1, mScrollX, mScrollY, getTopFadingEdgeStrength(), getBottomFadingEdgeStrength(), 0.0F, 0.0F);
                return;
            }
        }
    }

    public View findViewForTask(int i)
    {
        for (int j = 0; j < mLinearLayout.getChildCount(); j++)
        {
            View view = mLinearLayout.getChildAt(j);
            if (((RecentsPanelView.ViewHolder)view.getTag()).taskDescription.persistentTaskId == i)
                return view;
        }

        return null;
    }

    public View getChildAtPosition(MotionEvent motionevent)
    {
        float f = motionevent.getX() + (float)getScrollX();
        float f1 = motionevent.getY() + (float)getScrollY();
        for (int i = 0; i < mLinearLayout.getChildCount(); i++)
        {
            View view = mLinearLayout.getChildAt(i);
            if (view.getVisibility() == 0 && f >= (float)view.getLeft() && f < (float)view.getRight() && f1 >= (float)view.getTop() && f1 < (float)view.getBottom())
                return view;
        }

        return null;
    }

    public View getChildContentView(View view)
    {
        return view.findViewById(0x7f0800bc);
    }

    public int getHorizontalFadingEdgeLength()
    {
        if (mPerformanceHelper != null)
            return mPerformanceHelper.getHorizontalFadingEdgeLengthCallback();
        else
            return super.getHorizontalFadingEdgeLength();
    }

    public int getVerticalFadingEdgeLength()
    {
        if (mPerformanceHelper != null)
            return mPerformanceHelper.getVerticalFadingEdgeLengthCallback();
        else
            return super.getVerticalFadingEdgeLength();
    }

    public int numItemsInOneScreenful()
    {
        return mNumItemsInOneScreenful;
    }

    public void onAttachedToWindow()
    {
        if (mPerformanceHelper != null)
            mPerformanceHelper.onAttachedToWindowCallback(mCallback, mLinearLayout, isHardwareAccelerated());
    }

    public void onBeginDrag(View view)
    {
        requestDisallowInterceptTouchEvent(true);
    }

    public void onChildDismissed(View view)
    {
        addToRecycledViews(view);
        mLinearLayout.removeView(view);
        mCallback.handleSwipe(view);
        View view1 = getChildContentView(view);
        view1.setAlpha(1.0F);
        view1.setTranslationX(0.0F);
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        float f = getResources().getDisplayMetrics().density;
        mSwipeHelper.setDensityScale(f);
        float f1 = ViewConfiguration.get(mContext).getScaledPagingTouchSlop();
        mSwipeHelper.setPagingTouchSlop(f1);
    }

    public void onDragCancelled(View view)
    {
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        setScrollbarFadingEnabled(true);
        mLinearLayout = (LinearLayout)findViewById(0x7f0800c6);
        setOverScrollEffectPadding(mContext.getResources().getDimensionPixelOffset(0x7f0d000b), 0);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onInterceptTouchEvent(motionevent) || super.onInterceptTouchEvent(motionevent);
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        LayoutTransition layouttransition = mLinearLayout.getLayoutTransition();
        if (layouttransition != null && layouttransition.isRunning())
        {
            return;
        } else
        {
            mLastScrollPosition = scrollPositionOfMostRecent();
            post(new Runnable() {

                final RecentsVerticalScrollView this$0;

                public void run()
                {
                    LayoutTransition layouttransition1 = mLinearLayout.getLayoutTransition();
                    if (layouttransition1 == null || !layouttransition1.isRunning())
                        scrollTo(0, mLastScrollPosition);
                }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                super();
            }
            }
);
            return;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onTouchEvent(motionevent) || super.onTouchEvent(motionevent);
    }

    public void removeViewInLayout(View view)
    {
        dismissChild(view);
    }

    public void setAdapter(RecentsPanelView.TaskDescriptionAdapter taskdescriptionadapter)
    {
        mAdapter = taskdescriptionadapter;
        mAdapter.registerDataSetObserver(new DataSetObserver() {

            final RecentsVerticalScrollView this$0;

            public void onChanged()
            {
                update();
            }

            public void onInvalidated()
            {
                update();
            }

            
            {
                this$0 = RecentsVerticalScrollView.this;
                super();
            }
        }
);
        DisplayMetrics displaymetrics = getResources().getDisplayMetrics();
        int i = android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.widthPixels, 0x80000000);
        int j = android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.heightPixels, 0x80000000);
        View view = mAdapter.createView(mLinearLayout);
        view.measure(i, j);
        mNumItemsInOneScreenful = (int)FloatMath.ceil((float)displaymetrics.heightPixels / (float)view.getMeasuredHeight());
        addToRecycledViews(view);
        for (int k = 0; k < -1 + mNumItemsInOneScreenful; k++)
            addToRecycledViews(mAdapter.createView(mLinearLayout));

    }

    public void setCallback(RecentsCallback recentscallback)
    {
        mCallback = recentscallback;
    }

    public void setLayoutTransition(LayoutTransition layouttransition)
    {
        mLinearLayout.setLayoutTransition(layouttransition);
    }

    public void setMinSwipeAlpha(float f)
    {
        mSwipeHelper.setMinAlpha(f);
    }




}
