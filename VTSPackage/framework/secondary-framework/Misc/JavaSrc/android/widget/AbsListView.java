// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.*;
import android.text.*;
import android.util.*;
import android.view.*;
import android.view.accessibility.*;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.inputmethod.*;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.widget:
//            AdapterView, Filterable, PopupWindow, EditText, 
//            EdgeEffect, Checkable, ListAdapter, FastScroller, 
//            RemoteViewsAdapter, Filter, OverScroller, Adapter

public abstract class AbsListView extends AdapterView
    implements TextWatcher, android.view.ViewTreeObserver.OnGlobalLayoutListener, Filter.FilterListener, android.view.ViewTreeObserver.OnTouchModeChangeListener, RemoteViewsAdapter.RemoteAdapterConnectionCallback
{
    class AdapterDataSetObserver extends AdapterView.AdapterDataSetObserver
    {

        final AbsListView this$0;

        public void onChanged()
        {
            onChanged();
            if (mFastScroller != null)
                mFastScroller.onSectionsChanged();
        }

        public void onInvalidated()
        {
            onInvalidated();
            if (mFastScroller != null)
                mFastScroller.onSectionsChanged();
        }

        AdapterDataSetObserver()
        {
            this$0 = AbsListView.this;
            super(AbsListView.this);
        }
    }

    private class CheckForKeyLongPress extends WindowRunnnable
        implements Runnable
    {

        final AbsListView this$0;

        public void run()
        {
            if (isPressed() && mSelectedPosition >= 0)
            {
                int i = mSelectedPosition - mFirstPosition;
                View view = getChildAt(i);
                if (!mDataChanged)
                {
                    boolean flag = sameWindow();
                    boolean flag1 = false;
                    if (flag)
                        flag1 = performLongPress(view, mSelectedPosition, mSelectedRowId);
                    if (flag1)
                    {
                        setPressed(false);
                        view.setPressed(false);
                    }
                } else
                {
                    setPressed(false);
                    if (view != null)
                    {
                        view.setPressed(false);
                        return;
                    }
                }
            }
        }

        private CheckForKeyLongPress()
        {
            this$0 = AbsListView.this;
            super();
        }

    }

    private class CheckForLongPress extends WindowRunnnable
        implements Runnable
    {

        final AbsListView this$0;

        public void run()
        {
label0:
            {
                int i = mMotionPosition;
                View view = getChildAt(i - mFirstPosition);
                if (view != null)
                {
                    int j = mMotionPosition;
                    long l = mAdapter.getItemId(mMotionPosition);
                    boolean flag = sameWindow();
                    boolean flag1 = false;
                    if (flag)
                    {
                        boolean flag2 = mDataChanged;
                        flag1 = false;
                        if (!flag2)
                            flag1 = performLongPress(view, j, l);
                    }
                    if (!flag1)
                        break label0;
                    mTouchMode = -1;
                    setPressed(false);
                    view.setPressed(false);
                }
                return;
            }
            mTouchMode = 2;
        }

        private CheckForLongPress()
        {
            this$0 = AbsListView.this;
            super();
        }

    }

    final class CheckForTap
        implements Runnable
    {

        final AbsListView this$0;

        public void run()
        {
label0:
            {
label1:
                {
                    if (mTouchMode == 0)
                    {
                        mTouchMode = 1;
                        View view = getChildAt(mMotionPosition - mFirstPosition);
                        if (AbsListView.sDbg)
                            Xlog.d("AbsListView", (new StringBuilder()).append("CheckForTap:mFirstPosition = ").append(mFirstPosition).append(",mMotionPosition = ").append(mMotionPosition).append(",child = ").append(view).toString());
                        if (view != null && !view.hasFocusable())
                        {
                            mLayoutMode = 0;
                            if (mDataChanged)
                                break label0;
                            view.setPressed(true);
                            setPressed(true);
                            layoutChildren();
                            positionSelector(mMotionPosition, view);
                            refreshDrawableState();
                            int i = ViewConfiguration.getLongPressTimeout();
                            boolean flag = isLongClickable();
                            if (mSelector != null)
                            {
                                Drawable drawable = mSelector.getCurrent();
                                if (drawable != null && (drawable instanceof TransitionDrawable))
                                    if (flag)
                                        ((TransitionDrawable)drawable).startTransition(i);
                                    else
                                        ((TransitionDrawable)drawable).resetTransition();
                            }
                            if (!flag)
                                break label1;
                            if (mPendingCheckForLongPress == null)
                                mPendingCheckForLongPress = new CheckForLongPress();
                            mPendingCheckForLongPress.rememberWindowAttachCount();
                            postDelayed(mPendingCheckForLongPress, i);
                        }
                    }
                    return;
                }
                mTouchMode = 2;
                return;
            }
            mTouchMode = 2;
        }

        CheckForTap()
        {
            this$0 = AbsListView.this;
            super();
        }
    }

    private class FlingRunnable
        implements Runnable
    {

        private static final int FLYWHEEL_TIMEOUT = 40;
        private final Runnable mCheckFlywheel = new _cls1();
        private int mLastFlingY;
        private final OverScroller mScroller;
        final AbsListView this$0;

        void edgeReached(int i)
        {
            mScroller.notifyVerticalEdgeReached(
// JavaClassFileOutputException: get_constant: invalid tag

        void endFling()
        {
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("endFling: mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag

        void flywheelTouch()
        {
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("flywheelTouch: touch mode = ").append(mTouchMode).append(",mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag

        public void run()
        {
            if (AbsListView.sDbgDataChange)
                Xlog.d("AbsListView", (new StringBuilder()).append("FlingRunnable: touch mode = ").append(mTouchMode).append(",mAdapter = ").append(mAdapter).append(",mFirstPosition = ").append(mFirstPosition).append(",mDataChanged = ").append(mDataChanged).append(",adatper size = ").append(mItemCount).append(",this = ").append(AbsListView.this).toString());
            switch (mTouchMode)
            {
            case 6: // '\006'
                OverScroller overscroller1 = mScroller;
                if (overscroller1.computeScrollOffset())
                {
                    int k1 = 
// JavaClassFileOutputException: get_constant: invalid tag

        void start(int i)
        {
            int j;
            if (i < 0)
                j = 0x7fffffff;
            else
                j = 0;
            mLastFlingY = j;
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("start:touch mode = ").append(mTouchMode).append(",mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag

        void startOverfling(int i)
        {
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("startOverfling, touch mode = ").append(mTouchMode).append(",mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag

        void startScroll(int i, int j, boolean flag)
        {
            int k;
            if (i < 0)
                k = 0x7fffffff;
            else
                k = 0;
            mLastFlingY = k;
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("startScroll, touch mode = ").append(mTouchMode).append(",mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag

        void startSpringback()
        {
            if (AbsListView.sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("startSpringback, touch mode = ").append(mTouchMode).append(",mScrollY = ").append(
// JavaClassFileOutputException: get_constant: invalid tag


        FlingRunnable()
        {
            this$0 = AbsListView.this;
            super();
            mScroller = new OverScroller(getContext());
        }
    }

    public static class LayoutParams extends android.view.ViewGroup.LayoutParams
    {

        boolean forceAdd;
        long itemId;
        boolean recycledHeaderFooter;
        int scrappedFromPosition;
        int viewType;

        public LayoutParams(int i, int j)
        {
            super(i, j);
            itemId = -1L;
        }

        public LayoutParams(int i, int j, int k)
        {
            super(i, j);
            itemId = -1L;
            viewType = k;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            itemId = -1L;
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            itemId = -1L;
        }
    }

    class ListItemAccessibilityDelegate extends android.view.View.AccessibilityDelegate
    {

        final AbsListView this$0;

        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilitynodeinfo)
        {
            onInitializeAccessibilityNodeInfo(view, accessibilitynodeinfo);
            int i = getPositionForView(view);
            ListAdapter listadapter = (ListAdapter)getAdapter();
            if (i != -1 && listadapter != null && isEnabled() && listadapter.isEnabled(i))
            {
                if (i == getSelectedItemPosition())
                {
                    accessibilitynodeinfo.setSelected(true);
                    accessibilitynodeinfo.addAction(8);
                } else
                {
                    accessibilitynodeinfo.addAction(4);
                }
                if (isClickable())
                {
                    accessibilitynodeinfo.addAction(16);
                    accessibilitynodeinfo.setClickable(true);
                }
                if (isLongClickable())
                {
                    accessibilitynodeinfo.addAction(32);
                    accessibilitynodeinfo.setLongClickable(true);
                    return;
                }
            }
        }

        public boolean performAccessibilityAction(View view, int i, Bundle bundle)
        {
            if (performAccessibilityAction(view, i, bundle))
                return true;
            int j = getPositionForView(view);
            ListAdapter listadapter = (ListAdapter)getAdapter();
            if (j != -1 && listadapter != null)
            {
                if (isEnabled() && listadapter.isEnabled(j))
                {
                    long l = getItemIdAtPosition(j);
                    switch (i)
                    {
                    case 32: // ' '
                        if (isLongClickable())
                            return performLongPress(view, j, l);
                        else
                            return false;

                    case 16: // '\020'
                        if (isClickable())
                            return performItemClick(view, j, l);
                        else
                            return false;

                    case 4: // '\004'
                        if (getSelectedItemPosition() != j)
                        {
                            setSelection(j);
                            return true;
                        } else
                        {
                            return false;
                        }

                    case 8: // '\b'
                        if (getSelectedItemPosition() == j)
                        {
                            setSelection(-1);
                            return true;
                        } else
                        {
                            return false;
                        }
                    }
                    return false;
                } else
                {
                    return false;
                }
            } else
            {
                return false;
            }
        }

        ListItemAccessibilityDelegate()
        {
            this$0 = AbsListView.this;
            super();
        }
    }

    public static interface MultiChoiceModeListener
        extends android.view.ActionMode.Callback
    {

        public abstract void onItemCheckedStateChanged(ActionMode actionmode, int i, long l, boolean flag);
    }

    class MultiChoiceModeWrapper
        implements MultiChoiceModeListener
    {

        private MultiChoiceModeListener mWrapped;
        final AbsListView this$0;

        public boolean hasWrappedCallback()
        {
            return mWrapped != null;
        }

        public boolean onActionItemClicked(ActionMode actionmode, MenuItem menuitem)
        {
            return mWrapped.onActionItemClicked(actionmode, menuitem);
        }

        public boolean onCreateActionMode(ActionMode actionmode, Menu menu)
        {
            boolean flag = mWrapped.onCreateActionMode(actionmode, menu);
            boolean flag1 = false;
            if (flag)
            {
                setLongClickable(false);
                flag1 = true;
            }
            return flag1;
        }

        public void onDestroyActionMode(ActionMode actionmode)
        {
            mWrapped.onDestroyActionMode(actionmode);
            mChoiceActionMode = null;
            clearChoices();
            mDataChanged = true;
            rememberSyncState();
            requestLayout();
            setLongClickable(true);
        }

        public void onItemCheckedStateChanged(ActionMode actionmode, int i, long l, boolean flag)
        {
            mWrapped.onItemCheckedStateChanged(actionmode, i, l, flag);
            if (getCheckedItemCount() == 0)
                actionmode.finish();
        }

        public boolean onPrepareActionMode(ActionMode actionmode, Menu menu)
        {
            return mWrapped.onPrepareActionMode(actionmode, menu);
        }

        public void setWrapped(MultiChoiceModeListener multichoicemodelistener)
        {
            mWrapped = multichoicemodelistener;
        }

        MultiChoiceModeWrapper()
        {
            this$0 = AbsListView.this;
            super();
        }
    }

    public static interface OnScrollListener
    {

        public static final int SCROLL_STATE_FLING = 2;
        public static final int SCROLL_STATE_IDLE = 0;
        public static final int SCROLL_STATE_TOUCH_SCROLL = 1;

        public abstract void onScroll(AbsListView abslistview, int i, int j, int k);

        public abstract void onScrollStateChanged(AbsListView abslistview, int i);
    }

    private class PerformClick extends WindowRunnnable
        implements Runnable
    {

        int mClickMotionPosition;
        final AbsListView this$0;

        public void run()
        {
            if (!mDataChanged)
            {
                ListAdapter listadapter = mAdapter;
                int i = mClickMotionPosition;
                if (listadapter != null && mItemCount > 0 && i != -1 && i < listadapter.getCount() && sameWindow())
                {
                    View view = getChildAt(i - mFirstPosition);
                    if (view != null)
                    {
                        performItemClick(view, i, listadapter.getItemId(i));
                        return;
                    }
                }
            }
        }

        private PerformClick()
        {
            this$0 = AbsListView.this;
            super();
        }

    }

    /* member class not found */
    class PositionScroller {}

    class RecycleBin
    {

        private View mActiveViews[];
        private ArrayList mCurrentScrap;
        private int mFirstActivePosition;
        private RecyclerListener mRecyclerListener;
        private ArrayList mScrapViews[];
        private ArrayList mSkippedScrap;
        private SparseArray mTransientStateViews;
        private int mViewTypeCount;
        final AbsListView this$0;

        private void pruneScrapViews()
        {
            int i = mActiveViews.length;
            int j = mViewTypeCount;
            ArrayList aarraylist[] = mScrapViews;
            if (AbsListView.sDbgRecycle)
                Xlog.d("AbsListView", (new StringBuilder()).append("pruneScrapViews: maxViews = ").append(i).append(",viewTypeCount = ").append(j).append(",mScrapViews = ").append(mScrapViews).append(",this = ").append(this).toString());
            for (int k = 0; k < j; k++)
            {
                ArrayList arraylist = aarraylist[k];
                int i1 = arraylist.size();
                int j1 = i1 - i;
                int k1 = i1 - 1;
                int l1 = 0;
                int j2;
                for (int i2 = k1; l1 < j1; i2 = j2)
                {
                    AbsListView abslistview = AbsListView.this;
                    j2 = i2 - 1;
                    abslistview.removeDetachedView((View)arraylist.remove(i2), false);
                    l1++;
                }

            }

            if (mTransientStateViews != null)
            {
                for (int l = 0; l < mTransientStateViews.size(); l++)
                    if (!((View)mTransientStateViews.valueAt(l)).hasTransientState())
                    {
                        mTransientStateViews.removeAt(l);
                        l--;
                    }

            }
        }

        void addScrapView(View view, int i)
        {
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams != null)
            {
                layoutparams.scrappedFromPosition = i;
                int j = layoutparams.viewType;
                if (AbsListView.sDbgRecycle)
                    Xlog.d("AbsListView", (new StringBuilder()).append("addScrapView: scrap = ").append(view).append(",position = ").append(i).append(",child width = ").append(view.getMeasuredWidth()).append(",height = ").append(view.getMeasuredHeight()).append(",mViewTypeCount = ").append(mViewTypeCount).append(",viewType = ").append(j).append(",this = ").append(this).toString());
                boolean flag = view.hasTransientState();
                if (shouldRecycleViewType(j) && !flag)
                {
                    view.dispatchStartTemporaryDetach();
                    if (mViewTypeCount == 1)
                        mCurrentScrap.add(view);
                    else
                        mScrapViews[j].add(view);
                    view.setAccessibilityDelegate(null);
                    if (mRecyclerListener != null)
                    {
                        mRecyclerListener.onMovedToScrapHeap(view);
                        return;
                    }
                } else
                {
                    if (j != -2 || flag)
                    {
                        if (mSkippedScrap == null)
                            mSkippedScrap = new ArrayList();
                        mSkippedScrap.add(view);
                    }
                    if (flag)
                    {
                        if (mTransientStateViews == null)
                            mTransientStateViews = new SparseArray();
                        view.dispatchStartTemporaryDetach();
                        mTransientStateViews.put(i, view);
                        return;
                    }
                }
            }
        }

        void clear()
        {
            if (mViewTypeCount == 1)
            {
                ArrayList arraylist1 = mCurrentScrap;
                int i1 = arraylist1.size();
                for (int j1 = 0; j1 < i1; j1++)
                    removeDetachedView((View)arraylist1.remove(i1 - 1 - j1), false);

            } else
            {
                int i = mViewTypeCount;
                for (int j = 0; j < i; j++)
                {
                    ArrayList arraylist = mScrapViews[j];
                    int k = arraylist.size();
                    for (int l = 0; l < k; l++)
                        removeDetachedView((View)arraylist.remove(k - 1 - l), false);

                    if (AbsListView.sDbgRecycle)
                        Xlog.d("AbsListView", (new StringBuilder()).append("Recycle clear end: i = ").append(j).append(",scrap size = ").append(arraylist.size()).append(",active size = ").append(mActiveViews.length).append(",this = ").append(this).toString());
                }

            }
            if (mTransientStateViews != null)
                mTransientStateViews.clear();
        }

        void clearTransientStateViews()
        {
            if (mTransientStateViews != null)
                mTransientStateViews.clear();
        }

        void fillActiveViews(int i, int j)
        {
            if (mActiveViews.length < i)
                mActiveViews = new View[i];
            mFirstActivePosition = j;
            if (AbsListView.sDbgRecycle)
                Xlog.d("AbsListView", (new StringBuilder()).append("fillActiveViews: childCount = ").append(i).append(",firstActivePosition = ").append(j).append(",this = ").append(AbsListView.this).toString());
            View aview[] = mActiveViews;
            for (int k = 0; k < i; k++)
            {
                View view = getChildAt(k);
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                if (layoutparams != null && layoutparams.viewType != -2)
                    aview[k] = view;
            }

        }

        View getActiveView(int i)
        {
            int j = i - mFirstActivePosition;
            View aview[] = mActiveViews;
            if (j >= 0 && j < aview.length)
            {
                View view = aview[j];
                aview[j] = null;
                if (AbsListView.sDbgRecycle)
                    Xlog.d("AbsListView", (new StringBuilder()).append("getActiveView success: position = ").append(i).append(",index = ").append(j).append(",match = ").append(view).append(",this = ").append(AbsListView.this).toString());
                return view;
            } else
            {
                return null;
            }
        }

        View getScrapView(int i)
        {
            if (AbsListView.sDbgRecycle)
                Xlog.d("AbsListView", (new StringBuilder()).append("getScrapView: position = ").append(i).append(",mViewTypeCount = ").append(mViewTypeCount).append(",mCurrentScrap = ").append(mCurrentScrap).append(",this = ").append(this).toString());
            if (mViewTypeCount == 1)
                return AbsListView.retrieveFromScrap(mCurrentScrap, i);
            int j = mAdapter.getItemViewType(i);
            if (j >= 0 && j < mScrapViews.length)
                return AbsListView.retrieveFromScrap(mScrapViews[j], i);
            else
                return null;
        }

        View getTransientStateView(int i)
        {
            if (mTransientStateViews != null)
            {
                int j = mTransientStateViews.indexOfKey(i);
                if (j >= 0)
                {
                    View view = (View)mTransientStateViews.valueAt(j);
                    mTransientStateViews.removeAt(j);
                    return view;
                }
            }
            return null;
        }

        public void markChildrenDirty()
        {
            if (mViewTypeCount == 1)
            {
                ArrayList arraylist1 = mCurrentScrap;
                int k1 = arraylist1.size();
                for (int l1 = 0; l1 < k1; l1++)
                    ((View)arraylist1.get(l1)).forceLayout();

            } else
            {
                int i = mViewTypeCount;
                for (int j = 0; j < i; j++)
                {
                    ArrayList arraylist = mScrapViews[j];
                    int i1 = arraylist.size();
                    for (int j1 = 0; j1 < i1; j1++)
                        ((View)arraylist.get(j1)).forceLayout();

                }

            }
            if (mTransientStateViews != null)
            {
                int k = mTransientStateViews.size();
                for (int l = 0; l < k; l++)
                    ((View)mTransientStateViews.valueAt(l)).forceLayout();

            }
        }

        void reclaimScrapViews(List list)
        {
            if (AbsListView.sDbgRecycle)
                Xlog.d("AbsListView", (new StringBuilder()).append("reclaimScrapViews: views = ").append(list).append(",mViewTypeCount = ").append(mViewTypeCount).append(",mCurrentScrap = ").append(mCurrentScrap).append(",this = ").append(this).toString());
            if (mViewTypeCount == 1)
            {
                list.addAll(mCurrentScrap);
            } else
            {
                int i = mViewTypeCount;
                ArrayList aarraylist[] = mScrapViews;
                for (int j = 0; j < i; j++)
                    list.addAll(aarraylist[j]);

            }
        }

        void removeSkippedScrap()
        {
            if (mSkippedScrap == null)
                return;
            int i = mSkippedScrap.size();
            for (int j = 0; j < i; j++)
                removeDetachedView((View)mSkippedScrap.get(j), false);

            mSkippedScrap.clear();
        }

        void scrapActiveViews()
        {
            View aview[] = mActiveViews;
            boolean flag;
            if (mRecyclerListener != null)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (mViewTypeCount > 1)
                flag1 = true;
            else
                flag1 = false;
            ArrayList arraylist = mCurrentScrap;
            int i = aview.length;
            if (AbsListView.sDbgRecycle)
                Xlog.d("AbsListView", (new StringBuilder()).append("scrapActiveViews: mActiveViews = ").append(mActiveViews).append(",hasListener = ").append(flag).append(",mViewTypeCount = ").append(mViewTypeCount).append(",mCurrentScrap = ").append(mCurrentScrap).append(",count = ").append(i).append(",this = ").append(this).toString());
            for (int j = i - 1; j >= 0; j--)
            {
                View view = aview[j];
                if (view == null)
                    continue;
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                int k = layoutparams.viewType;
                aview[j] = null;
                boolean flag2 = view.hasTransientState();
                if (shouldRecycleViewType(k) && !flag2)
                {
                    if (flag1)
                        arraylist = mScrapViews[k];
                    view.dispatchStartTemporaryDetach();
                    layoutparams.scrappedFromPosition = j + mFirstActivePosition;
                    arraylist.add(view);
                    view.setAccessibilityDelegate(null);
                    if (flag)
                        mRecyclerListener.onMovedToScrapHeap(view);
                    continue;
                }
                if (k != -2 || flag2)
                    removeDetachedView(view, false);
                if (!flag2)
                    continue;
                if (mTransientStateViews == null)
                    mTransientStateViews = new SparseArray();
                mTransientStateViews.put(j + mFirstActivePosition, view);
            }

            pruneScrapViews();
        }

        void setCacheColorHint(int i)
        {
            if (mViewTypeCount == 1)
            {
                ArrayList arraylist1 = mCurrentScrap;
                int l1 = arraylist1.size();
                for (int i2 = 0; i2 < l1; i2++)
                    ((View)arraylist1.get(i2)).setDrawingCacheBackgroundColor(i);

            } else
            {
                int j = mViewTypeCount;
                for (int k = 0; k < j; k++)
                {
                    ArrayList arraylist = mScrapViews[k];
                    int j1 = arraylist.size();
                    for (int k1 = 0; k1 < j1; k1++)
                        ((View)arraylist.get(k1)).setDrawingCacheBackgroundColor(i);

                }

            }
            View aview[] = mActiveViews;
            int l = aview.length;
            for (int i1 = 0; i1 < l; i1++)
            {
                View view = aview[i1];
                if (view != null)
                    view.setDrawingCacheBackgroundColor(i);
            }

        }

        public void setViewTypeCount(int i)
        {
            if (i < 1)
                throw new IllegalArgumentException("Can't have a viewTypeCount < 1");
            ArrayList aarraylist[] = new ArrayList[i];
            for (int j = 0; j < i; j++)
                aarraylist[j] = new ArrayList();

            mViewTypeCount = i;
            mCurrentScrap = aarraylist[0];
            mScrapViews = aarraylist;
        }

        public boolean shouldRecycleViewType(int i)
        {
            return i >= 0;
        }



/*
        static RecyclerListener access$5002(RecycleBin recyclebin, RecyclerListener recyclerlistener)
        {
            recyclebin.mRecyclerListener = recyclerlistener;
            return recyclerlistener;
        }

*/

        RecycleBin()
        {
            this$0 = AbsListView.this;
            Object();
            mActiveViews = new View[0];
        }
    }

    public static interface RecyclerListener
    {

        public abstract void onMovedToScrapHeap(View view);
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
        LongSparseArray checkIdState;
        SparseBooleanArray checkState;
        int checkedItemCount;
        String filter;
        long firstId;
        int height;
        boolean inActionMode;
        int position;
        long selectedId;
        int viewTop;

        public String toString()
        {
            return (new StringBuilder()).append("AbsListView.SavedState{").append(Integer.toHexString(System.identityHashCode(this))).append(" selectedId=").append(selectedId).append(" firstId=").append(firstId).append(" viewTop=").append(viewTop).append(" position=").append(position).append(" height=").append(height).append(" filter=").append(filter).append(" checkState=").append(checkState).append("}").toString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeLong(selectedId);
            parcel.writeLong(firstId);
            parcel.writeInt(viewTop);
            parcel.writeInt(position);
            parcel.writeInt(height);
            parcel.writeString(filter);
            int j;
            if (inActionMode)
                j = 1;
            else
                j = 0;
            parcel.writeByte((byte)j);
            parcel.writeInt(checkedItemCount);
            parcel.writeSparseBooleanArray(checkState);
            int k;
            if (checkIdState != null)
                k = checkIdState.size();
            else
                k = 0;
            parcel.writeInt(k);
            for (int l = 0; l < k; l++)
            {
                parcel.writeLong(checkIdState.keyAt(l));
                parcel.writeInt(((Integer)checkIdState.valueAt(l)).intValue());
            }

        }


        private SavedState(Parcel parcel)
        {
            BaseSavedState(parcel);
            selectedId = parcel.readLong();
            firstId = parcel.readLong();
            viewTop = parcel.readInt();
            position = parcel.readInt();
            height = parcel.readInt();
            filter = parcel.readString();
            boolean flag;
            if (parcel.readByte() != 0)
                flag = true;
            else
                flag = false;
            inActionMode = flag;
            checkedItemCount = parcel.readInt();
            checkState = parcel.readSparseBooleanArray();
            int i = parcel.readInt();
            if (i > 0)
            {
                checkIdState = new LongSparseArray();
                for (int j = 0; j < i; j++)
                {
                    long l = parcel.readLong();
                    int k = parcel.readInt();
                    checkIdState.put(l, Integer.valueOf(k));
                }

            }
        }


        SavedState(Parcelable parcelable)
        {
            BaseSavedState(parcelable);
        }
    }

    public static interface SelectionBoundsAdjuster
    {

        public abstract void adjustListItemSelectionBounds(Rect rect);
    }

    private class WindowRunnnable
    {

        private int mOriginalAttachCount;
        final AbsListView this$0;

        public void rememberWindowAttachCount()
        {
            mOriginalAttachCount = getWindowAttachCount();
        }

        public boolean sameWindow()
        {
            return hasWindowFocus() && getWindowAttachCount() == mOriginalAttachCount;
        }

        private WindowRunnnable()
        {
            this$0 = AbsListView.this;
            super();
        }

    }


    private static final int CHECK_POSITION_SEARCH_DISTANCE = 20;
    public static final int CHOICE_MODE_MULTIPLE = 2;
    public static final int CHOICE_MODE_MULTIPLE_MODAL = 3;
    public static final int CHOICE_MODE_NONE = 0;
    public static final int CHOICE_MODE_SINGLE = 1;
    private static final int DBG_DATACHANGE_FLAG = 2;
    private static final int DBG_DRAW_FLAG = 16;
    private static final int DBG_FLAG = 32;
    private static final int DBG_LAYOUT_FLAG = 4;
    private static final int DBG_MOTION_FLAG = 1;
    private static final int DBG_RECYCLE_FLAG = 8;
    private static final int INVALID_POINTER = -1;
    static final int LAYOUT_FORCE_BOTTOM = 3;
    static final int LAYOUT_FORCE_TOP = 1;
    static final int LAYOUT_MOVE_SELECTION = 6;
    static final int LAYOUT_NORMAL = 0;
    static final int LAYOUT_SET_SELECTION = 2;
    static final int LAYOUT_SPECIFIC = 4;
    static final int LAYOUT_SYNC = 5;
    private static final String LOG_PROPERTY_NAME = "debug.listview.dumpinfo";
    private static final int OVERFLING_VELOCITY_MAGN = 80;
    static final int OVERSCROLL_LIMIT_DIVISOR = 3;
    private static final boolean PROFILE_FLINGING = false;
    private static final boolean PROFILE_SCROLLING = false;
    private static final String TAG = "AbsListView";
    static final int TOUCH_MODE_DONE_WAITING = 2;
    static final int TOUCH_MODE_DOWN = 0;
    static final int TOUCH_MODE_FLING = 4;
    private static final int TOUCH_MODE_OFF = 1;
    private static final int TOUCH_MODE_ON = 0;
    static final int TOUCH_MODE_OVERFLING = 6;
    static final int TOUCH_MODE_OVERSCROLL = 5;
    static final int TOUCH_MODE_REST = -1;
    static final int TOUCH_MODE_SCROLL = 3;
    static final int TOUCH_MODE_TAP = 1;
    private static final int TOUCH_MODE_UNKNOWN = -1;
    public static final int TRANSCRIPT_MODE_ALWAYS_SCROLL = 2;
    public static final int TRANSCRIPT_MODE_DISABLED = 0;
    public static final int TRANSCRIPT_MODE_NORMAL = 1;
    private static boolean sDbg = false;
    private static boolean sDbgDataChange = false;
    private static boolean sDbgDraw = false;
    private static boolean sDbgLayout = false;
    private static boolean sDbgMotion = false;
    private static boolean sDbgRecycle = false;
    static final Interpolator sLinearInterpolator = new LinearInterpolator();
    private ListItemAccessibilityDelegate mAccessibilityDelegate;
    private boolean mActionModeNotQuit;
    private int mActivePointerId;
    ListAdapter mAdapter;
    boolean mAdapterHasStableIds;
    private int mCacheColorHint;
    boolean mCachingActive;
    boolean mCachingStarted;
    SparseBooleanArray mCheckStates;
    LongSparseArray mCheckedIdStates;
    int mCheckedItemCount;
    ActionMode mChoiceActionMode;
    int mChoiceMode;
    private Runnable mClearScrollingCache;
    private android.view.ContextMenu.ContextMenuInfo mContextMenuInfo;
    AdapterDataSetObserver mDataSetObserver;
    private InputConnection mDefInputConnection;
    private boolean mDeferNotifyDataSetChanged;
    private float mDensityScale;
    private int mDirection;
    boolean mDrawSelectorOnTop;
    private EdgeEffect mEdgeGlowBottom;
    private EdgeEffect mEdgeGlowTop;
    boolean mFastScrollEnabled;
    private FastScroller mFastScroller;
    private boolean mFiltered;
    private int mFirstPositionDistanceGuess;
    private boolean mFlingProfilingStarted;
    private FlingRunnable mFlingRunnable;
    private android.os.StrictMode.Span mFlingStrictSpan;
    private boolean mForceTranscriptScroll;
    private boolean mGlobalLayoutListenerAddedFilter;
    private int mGlowPaddingLeft;
    private int mGlowPaddingRight;
    boolean mIsAttached;
    private boolean mIsChildViewEnabled;
    final boolean mIsScrap[];
    private int mLastAccessibilityScrollEventFromIndex;
    private int mLastAccessibilityScrollEventToIndex;
    private int mLastHandledItemCount;
    private int mLastPositionDistanceGuess;
    private int mLastScrollState;
    private int mLastTouchMode;
    int mLastY;
    int mLayoutMode;
    Rect mListPadding;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    int mMotionCorrection;
    int mMotionPosition;
    int mMotionViewNewTop;
    int mMotionViewOriginalTop;
    int mMotionX;
    int mMotionY;
    MultiChoiceModeWrapper mMultiChoiceModeCallback;
    private OnScrollListener mOnScrollListener;
    int mOverflingDistance;
    int mOverscrollDistance;
    int mOverscrollMax;
    private CheckForKeyLongPress mPendingCheckForKeyLongPress;
    private CheckForLongPress mPendingCheckForLongPress;
    private Runnable mPendingCheckForTap;
    private SavedState mPendingSync;
    private PerformClick mPerformClick;
    PopupWindow mPopup;
    private boolean mPopupHidden;
    Runnable mPositionScrollAfterLayout;
    PositionScroller mPositionScroller;
    private InputConnectionWrapper mPublicInputConnection;
    final RecycleBin mRecycler;
    private RemoteViewsAdapter mRemoteAdapter;
    int mResurrectToPosition;
    View mScrollDown;
    private boolean mScrollProfilingStarted;
    private android.os.StrictMode.Span mScrollStrictSpan;
    View mScrollUp;
    boolean mScrollingCacheEnabled;
    int mSelectedTop;
    int mSelectionBottomPadding;
    int mSelectionLeftPadding;
    int mSelectionRightPadding;
    int mSelectionTopPadding;
    Drawable mSelector;
    int mSelectorPosition;
    Rect mSelectorRect;
    private boolean mSmoothScrollbarEnabled;
    boolean mStackFromBottom;
    EditText mTextFilter;
    private boolean mTextFilterEnabled;
    private Rect mTouchFrame;
    int mTouchMode;
    private Runnable mTouchModeReset;
    private int mTouchSlop;
    private int mTranscriptMode;
    private float mVelocityScale;
    private VelocityTracker mVelocityTracker;
    int mWidthMeasureSpec;

    public AbsListView(Context context)
    {
        super(context);
        mChoiceMode = 0;
        mLayoutMode = 0;
        mDeferNotifyDataSetChanged = false;
        mDrawSelectorOnTop = false;
        mSelectorPosition = -1;
        mSelectorRect = new Rect();
        mRecycler = new RecycleBin();
        mSelectionLeftPadding = 0;
        mSelectionTopPadding = 0;
        mSelectionRightPadding = 0;
        mSelectionBottomPadding = 0;
        mListPadding = new Rect();
        mWidthMeasureSpec = 0;
        mTouchMode = -1;
        mSelectedTop = 0;
        mSmoothScrollbarEnabled = true;
        mResurrectToPosition = -1;
        mContextMenuInfo = null;
        mLastTouchMode = -1;
        mScrollProfilingStarted = false;
        mFlingProfilingStarted = false;
        mScrollStrictSpan = null;
        mFlingStrictSpan = null;
        mLastScrollState = 0;
        mVelocityScale = 1.0F;
        mIsScrap = new boolean[1];
        mActivePointerId = -1;
        mDirection = 0;
        initAbsListView();
        setVerticalScrollBarEnabled(true);
        TypedArray typedarray = context.obtainStyledAttributes(com.android.internal.R.styleable.View);
        initializeScrollbars(typedarray);
        typedarray.recycle();
    }

    public AbsListView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101006a);
    }

    public AbsListView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mChoiceMode = 0;
        mLayoutMode = 0;
        mDeferNotifyDataSetChanged = false;
        mDrawSelectorOnTop = false;
        mSelectorPosition = -1;
        mSelectorRect = new Rect();
        mRecycler = new RecycleBin();
        mSelectionLeftPadding = 0;
        mSelectionTopPadding = 0;
        mSelectionRightPadding = 0;
        mSelectionBottomPadding = 0;
        mListPadding = new Rect();
        mWidthMeasureSpec = 0;
        mTouchMode = -1;
        mSelectedTop = 0;
        mSmoothScrollbarEnabled = true;
        mResurrectToPosition = -1;
        mContextMenuInfo = null;
        mLastTouchMode = -1;
        mScrollProfilingStarted = false;
        mFlingProfilingStarted = false;
        mScrollStrictSpan = null;
        mFlingStrictSpan = null;
        mLastScrollState = 0;
        mVelocityScale = 1.0F;
        mIsScrap = new boolean[1];
        mActivePointerId = -1;
        mDirection = 0;
        initAbsListView();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.AbsListView, i, 0);
        Drawable drawable = typedarray.getDrawable(0);
        if (drawable != null)
            setSelector(drawable);
        mDrawSelectorOnTop = typedarray.getBoolean(1, false);
        setStackFromBottom(typedarray.getBoolean(2, false));
        setScrollingCacheEnabled(typedarray.getBoolean(3, true));
        setTextFilterEnabled(typedarray.getBoolean(4, false));
        setTranscriptMode(typedarray.getInt(5, 0));
        setCacheColorHint(typedarray.getColor(6, 0));
        setFastScrollEnabled(typedarray.getBoolean(8, false));
        setSmoothScrollbarEnabled(typedarray.getBoolean(9, true));
        setChoiceMode(typedarray.getInt(7, 0));
        setFastScrollAlwaysVisible(typedarray.getBoolean(10, false));
        typedarray.recycle();
        checkAbsListViewlLogProperty();
    }

    private boolean acceptFilter()
    {
        return mTextFilterEnabled && (getAdapter() instanceof Filterable) && ((Filterable)getAdapter()).getFilter() != null;
    }

    private static void checkAbsListViewlLogProperty()
    {
        boolean flag;
        String s;
label0:
        {
            flag = true;
            s = SystemProperties.get("debug.listview.dumpinfo");
            if (s != null)
            {
                if (s.length() > 0 && s.length() <= 6)
                    break label0;
                Xlog.d("AbsListView", "checkAbsListViewlLogProperty get invalid command");
            }
            return;
        }
        int j = Integer.parseInt(s, 2);
        int i = j;
_L1:
        NumberFormatException numberformatexception;
        boolean flag1;
        boolean flag2;
        boolean flag3;
        boolean flag4;
        boolean flag5;
        if ((i & 1) == flag)
            flag1 = flag;
        else
            flag1 = false;
        sDbgMotion = flag1;
        if ((i & 2) == 2)
            flag2 = flag;
        else
            flag2 = false;
        sDbgDataChange = flag2;
        if ((i & 4) == 4)
            flag3 = flag;
        else
            flag3 = false;
        sDbgLayout = flag3;
        if ((i & 8) == 8)
            flag4 = flag;
        else
            flag4 = false;
        sDbgRecycle = flag4;
        if ((i & 0x10) == 16)
            flag5 = flag;
        else
            flag5 = false;
        sDbgDraw = flag5;
        if ((i & 0x20) != 32)
            flag = false;
        sDbg = flag;
        Xlog.d("AbsListView", (new StringBuilder()).append("checkAbsListViewlLogProperty debug filter: sDbgMotion=").append(sDbgMotion).append(", sDbgDataChange=").append(sDbgDataChange).append(", sDbgLayout=").append(sDbgLayout).append(", sDbgRecycle=").append(sDbgRecycle).append(", sDbgDraw=").append(sDbgDraw).append(", sDbg=").append(sDbg).toString());
        return;
        numberformatexception;
        Xlog.w("AbsListView", (new StringBuilder()).append("Invalid format of propery string: ").append(s).toString());
        i = 0;
          goto _L1
    }

    private void clearScrollingCache()
    {
        if (!isHardwareAccelerated())
        {
            if (mClearScrollingCache == null)
                mClearScrollingCache = new Runnable() ;
            post(mClearScrollingCache);
        }
    }

    private boolean contentFits()
    {
        int i = getChildCount();
        if (i != 0)
        {
            if (i != super.mItemCount)
                return false;
            if (sDbg)
                Xlog.d("AbsListView", (new StringBuilder()).append("contentFits:childCount = ").append(i).append(",mItemCount = ").append(super.mItemCount).append(",first child top = ").append(getChildAt(0).getTop()).append(",last child bottom = ").append(getChildAt(i - 1).getBottom()).append(",getHeight() = ").append(getHeight()).append(",mListPadding = ").append(mListPadding).toString());
            if (getChildAt(0).getTop() < mListPadding.top || getChildAt(i - 1).getBottom() > getHeight() - mListPadding.bottom)
                return false;
        }
        return true;
    }

    private void createScrollingCache()
    {
        if (mScrollingCacheEnabled && !mCachingStarted && !isHardwareAccelerated())
        {
            setChildrenDrawnWithCacheEnabled(true);
            setChildrenDrawingCacheEnabled(true);
            mCachingActive = true;
            mCachingStarted = true;
        }
    }

    private void createTextFilter(boolean flag)
    {
        if (mPopup == null)
        {
            Context context = getContext();
            PopupWindow popupwindow = new PopupWindow(context);
            mTextFilter = (EditText)((LayoutInflater)context.getSystemService("layout_inflater")).inflate(0x10900e1, null);
            mTextFilter.setRawInputType(177);
            mTextFilter.setImeOptions(0x10000000);
            mTextFilter.addTextChangedListener(this);
            popupwindow.setFocusable(false);
            popupwindow.setTouchable(false);
            popupwindow.setInputMethodMode(2);
            popupwindow.setContentView(mTextFilter);
            popupwindow.setWidth(-2);
            popupwindow.setHeight(-2);
            popupwindow.setBackgroundDrawable(null);
            mPopup = popupwindow;
            getViewTreeObserver().addOnGlobalLayoutListener(this);
            mGlobalLayoutListenerAddedFilter = true;
        }
        if (flag)
        {
            mPopup.setAnimationStyle(0x10301e5);
            return;
        } else
        {
            mPopup.setAnimationStyle(0x10301e6);
            return;
        }
    }

    private void dismissPopup()
    {
        if (mPopup != null)
            mPopup.dismiss();
    }

    private void drawSelector(Canvas canvas)
    {
        if (!mSelectorRect.isEmpty())
        {
            Drawable drawable = mSelector;
            drawable.setBounds(mSelectorRect);
            drawable.draw(canvas);
        }
    }

    private void finishGlows()
    {
        if (mEdgeGlowTop != null)
        {
            mEdgeGlowTop.finish();
            mEdgeGlowBottom.finish();
        }
    }

    static int getDistance(Rect rect, Rect rect1, int i)
    {
label0:
        {
            int j;
            int k;
            int l;
            int i1;
            switch (i)
            {
            default:
                break label0;

            case 1: // '\001'
            case 2: // '\002'
                j = rect.right + rect.width() / 2;
                k = rect.top + rect.height() / 2;
                l = rect1.left + rect1.width() / 2;
                i1 = rect1.top + rect1.height() / 2;
                break;

            case 33: // '!'
                j = rect.left + rect.width() / 2;
                k = rect.top;
                l = rect1.left + rect1.width() / 2;
                i1 = rect1.bottom;
                break;

            case 17: // '\021'
                j = rect.left;
                k = rect.top + rect.height() / 2;
                l = rect1.right;
                i1 = rect1.top + rect1.height() / 2;
                break;

            case 130: 
                j = rect.left + rect.width() / 2;
                k = rect.bottom;
                l = rect1.left + rect1.width() / 2;
                i1 = rect1.top;
                break;

            case 66: // 'B'
                j = rect.right;
                k = rect.top + rect.height() / 2;
                l = rect1.left;
                i1 = rect1.top + rect1.height() / 2;
                break;
            }
            int j1 = l - j;
            int k1 = i1 - k;
            return k1 * k1 + j1 * j1;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
    }

    private void initAbsListView()
    {
        setClickable(true);
        setFocusableInTouchMode(true);
        setWillNotDraw(false);
        setAlwaysDrawnWithCacheEnabled(false);
        setScrollingCacheEnabled(true);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(super.mContext);
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMinimumVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mOverscrollDistance = viewconfiguration.getScaledOverscrollDistance();
        mOverflingDistance = viewconfiguration.getScaledOverflingDistance();
        mDensityScale = getContext().getResources().getDisplayMetrics().density;
        if (sDbgLayout)
            Xlog.d("AbsListView", (new StringBuilder()).append("initAbsListView here: this = ").append(this).toString());
    }

    private void initOrResetVelocityTracker()
    {
        if (mVelocityTracker == null)
        {
            mVelocityTracker = VelocityTracker.obtain();
            return;
        } else
        {
            mVelocityTracker.clear();
            return;
        }
    }

    private void initVelocityTrackerIfNotExists()
    {
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = (0xff00 & motionevent.getAction()) >> 8;
        int j = motionevent.getPointerId(i);
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("onSecondaryPointerUp:pointerIndex = ").append(i).append(",mActivePointerId = ").append(mActivePointerId).append(",pointerId = ").append(j).toString());
        if (j == mActivePointerId)
        {
            int k;
            if (i == 0)
                k = 1;
            else
                k = 0;
            mMotionX = (int)motionevent.getX(k);
            mMotionY = (int)motionevent.getY(k);
            mMotionCorrection = 0;
            mActivePointerId = motionevent.getPointerId(k);
        }
    }

    private void positionPopup()
    {
        int i = getResources().getDisplayMetrics().heightPixels;
        int ai[] = new int[2];
        getLocationOnScreen(ai);
        int j = (i - ai[1] - getHeight()) + (int)(20F * mDensityScale);
        if (!mPopup.isShowing())
        {
            mPopup.showAtLocation(this, 81, ai[0], j);
            return;
        } else
        {
            mPopup.update(ai[0], j, -1, -1);
            return;
        }
    }

    private void positionSelector(int i, int j, int k, int l)
    {
        mSelectorRect.set(i - mSelectionLeftPadding, j - mSelectionTopPadding, k + mSelectionRightPadding, l + mSelectionBottomPadding);
    }

    private void recycleVelocityTracker()
    {
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    static View retrieveFromScrap(ArrayList arraylist, int i)
    {
        int j = arraylist.size();
        if (sDbgRecycle)
            Xlog.d("AbsListView", (new StringBuilder()).append("retrieveFromScrap: size = ").append(j).append(",position = ").append(i).append(",scrapViews = ").append(arraylist).toString());
        if (j > 0)
        {
            for (int k = 0; k < j; k++)
            {
                View view = (View)arraylist.get(k);
                if (((LayoutParams)view.getLayoutParams()).scrappedFromPosition == i)
                {
                    arraylist.remove(k);
                    return view;
                }
            }

            return (View)arraylist.remove(j - 1);
        } else
        {
            return null;
        }
    }

    private void scrollIfNeeded(int i)
    {
        int j = i - mMotionY;
        int k = j - mMotionCorrection;
        int l;
        if (mLastY != 0x80000000)
            l = i - mLastY;
        else
            l = k;
        if (mTouchMode == 3)
        {
            if (mScrollStrictSpan == null)
                mScrollStrictSpan = StrictMode.enterCriticalSpan("AbsListView-scroll");
            if (i != mLastY)
            {
                if ((0x80000 & super.mGroupFlags) == 0 && Math.abs(j) > mTouchSlop)
                {
                    ViewParent viewparent = getParent();
                    if (viewparent != null)
                        viewparent.requestDisallowInterceptTouchEvent(true);
                }
                int i3;
                if (mMotionPosition >= 0)
                    i3 = mMotionPosition - super.mFirstPosition;
                else
                    i3 = getChildCount() / 2;
                View view1 = getChildAt(i3);
                int j3 = 0;
                if (view1 != null)
                    j3 = view1.getTop();
                boolean flag = false;
                if (l != 0)
                    flag = trackMotionScroll(k, l);
                View view2 = getChildAt(i3);
                if (sDbgMotion)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch scroll: incrementalDeltaY = ").append(l).append(",mScrollY = ").append(super.mScrollY).append(",atEdge = ").append(flag).append(",motionIndex = ").append(i3).append(",motionView = ").append(view2).append(",overscrollMode = ").append(getOverScrollMode()).toString());
                if (view2 != null)
                {
                    int k3 = view2.getTop();
                    if (flag)
                    {
                        int l3 = -l - (k3 - j3);
                        overScrollBy(0, l3, 0, super.mScrollY, 0, 0, 0, mOverscrollDistance, true);
                        if (Math.abs(mOverscrollDistance) == Math.abs(super.mScrollY) && mVelocityTracker != null)
                            mVelocityTracker.clear();
                        int i4 = getOverScrollMode();
                        if (i4 == 0 || i4 == 1 && !contentFits())
                        {
                            mDirection = 0;
                            mTouchMode = 5;
                            if (j > 0)
                            {
                                mEdgeGlowTop.onPull((float)l3 / (float)getHeight());
                                if (!mEdgeGlowBottom.isFinished())
                                    mEdgeGlowBottom.onRelease();
                                invalidate(mEdgeGlowTop.getBounds(false));
                            } else
                            if (j < 0)
                            {
                                mEdgeGlowBottom.onPull((float)l3 / (float)getHeight());
                                if (!mEdgeGlowTop.isFinished())
                                    mEdgeGlowTop.onRelease();
                                invalidate(mEdgeGlowBottom.getBounds(true));
                            }
                        }
                    }
                    mMotionY = i;
                }
                mLastY = i;
            }
        } else
        if (mTouchMode == 5 && i != mLastY)
        {
            int i1 = super.mScrollY;
            int j1 = i1 - l;
            int k1;
            if (i > mLastY)
                k1 = 1;
            else
                k1 = -1;
            if (sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("Touch over scroll: incrementalDeltaY = ").append(l).append(",mScrollY = ").append(super.mScrollY).append(",newScroll = ").append(j1).append(",newDirection = ").append(k1).append(",mDirection = ").append(mDirection).append(",y = ").append(i).append(",mLastY = ").append(mLastY).append(",mFirstPosition = ").append(super.mFirstPosition).toString());
            if (mDirection == 0)
                mDirection = k1;
            int l1 = -l;
            int i2;
            if ((j1 >= 0 || i1 < 0) && (j1 <= 0 || i1 > 0))
            {
                i2 = 0;
            } else
            {
                l1 = -i1;
                i2 = l + l1;
            }
            if (l1 != 0)
            {
                overScrollBy(0, l1, 0, super.mScrollY, 0, 0, 0, mOverscrollDistance, true);
                int l2 = getOverScrollMode();
                if (l2 == 0 || l2 == 1 && !contentFits())
                    if (j > 0)
                    {
                        mEdgeGlowTop.onPull((float)l1 / (float)getHeight());
                        if (!mEdgeGlowBottom.isFinished())
                            mEdgeGlowBottom.onRelease();
                        invalidate(mEdgeGlowTop.getBounds(false));
                    } else
                    if (j < 0)
                    {
                        mEdgeGlowBottom.onPull((float)l1 / (float)getHeight());
                        if (!mEdgeGlowTop.isFinished())
                            mEdgeGlowTop.onRelease();
                        invalidate(mEdgeGlowBottom.getBounds(true));
                    }
            }
            if (i2 != 0)
            {
                if (sDbgMotion)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Coming back to 'real' list scrolling: incrementalDeltaY = ").append(i2).append(",mScrollY = ").append(super.mScrollY).append(",mFirstPosition = ").append(super.mFirstPosition).toString());
                if (super.mScrollY != 0)
                {
                    super.mScrollY = 0;
                    invalidateParentIfNeeded();
                }
                trackMotionScroll(i2, i2);
                mTouchMode = 3;
                int j2 = findClosestMotionRow(i);
                mMotionCorrection = 0;
                View view = getChildAt(j2 - super.mFirstPosition);
                int k2;
                if (view != null)
                    k2 = view.getTop();
                else
                    k2 = 0;
                mMotionViewOriginalTop = k2;
                mMotionY = i;
                mMotionPosition = j2;
            }
            mLastY = i;
            mDirection = k1;
            return;
        }
    }

    private void showPopup()
    {
        if (getWindowVisibility() == 0)
        {
            createTextFilter(true);
            positionPopup();
            checkFocus();
        }
    }

    private boolean startScrollIfNeeded(int i)
    {
        boolean flag1;
label0:
        {
            int j = i - mMotionY;
            int k = Math.abs(j);
            boolean flag;
            if (super.mScrollY != 0)
                flag = true;
            else
                flag = false;
            if (sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("startScrollIfNeeded:deltaY = ").append(j).append(",mScrollY = ").append(super.mScrollY).append(",mTouchSlop = ").append(mTouchSlop).append(",mTouchMode = ").append(mTouchMode).toString());
            if (!flag)
            {
                int j1 = mTouchSlop;
                flag1 = false;
                if (k <= j1)
                    break label0;
            }
            createScrollingCache();
            if (flag)
            {
                mTouchMode = 5;
                mMotionCorrection = 0;
            } else
            {
                mTouchMode = 3;
                int l;
                if (j > 0)
                    l = mTouchSlop;
                else
                    l = -mTouchSlop;
                mMotionCorrection = l;
            }
            Handler handler = getHandler();
            if (handler != null)
                handler.removeCallbacks(mPendingCheckForLongPress);
            setPressed(false);
            for (int i1 = -1 + getChildCount(); i1 >= 0; i1--)
            {
                View view = getChildAt(i1);
                if (view.isPressed())
                    view.setPressed(false);
            }

            reportScrollStateChange(1);
            ViewParent viewparent = getParent();
            if (viewparent != null)
                viewparent.requestDisallowInterceptTouchEvent(true);
            scrollIfNeeded(i);
            flag1 = true;
        }
        return flag1;
    }

    private void updateOnScreenCheckedViews()
    {
        int i = super.mFirstPosition;
        int j = getChildCount();
        boolean flag;
        if (getContext().getApplicationInfo().targetSdkVersion >= 11)
            flag = true;
        else
            flag = false;
        for (int k = 0; k < j; k++)
        {
            View view = getChildAt(k);
            int l = i + k;
            if (view instanceof Checkable)
            {
                ((Checkable)view).setChecked(mCheckStates.get(l));
                continue;
            }
            if (flag)
                view.setActivated(mCheckStates.get(l));
        }

    }

    private void useDefaultSelector()
    {
        setSelector(getResources().getDrawable(0x1080062));
    }

    public void addTouchables(ArrayList arraylist)
    {
        int i = getChildCount();
        int j = super.mFirstPosition;
        ListAdapter listadapter = mAdapter;
        if (listadapter != null)
        {
            for (int k = 0; k < i; k++)
            {
                View view = getChildAt(k);
                if (listadapter.isEnabled(j + k))
                    arraylist.add(view);
                view.addTouchables(arraylist);
            }

        }
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public boolean checkInputConnectionProxy(View view)
    {
        return view == mTextFilter;
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    public void clearChoices()
    {
        if (mCheckStates != null)
            mCheckStates.clear();
        if (mCheckedIdStates != null)
            mCheckedIdStates.clear();
        mCheckedItemCount = 0;
    }

    public void clearTextFilter()
    {
        if (mFiltered)
        {
            mTextFilter.setText("");
            mFiltered = false;
            if (mPopup != null && mPopup.isShowing())
                dismissPopup();
        }
    }

    protected int computeVerticalScrollExtent()
    {
        int i = getChildCount();
        if (i > 0)
        {
            if (mSmoothScrollbarEnabled)
            {
                int j = i * 100;
                View view = getChildAt(0);
                int k = view.getTop();
                int l = view.getHeight();
                if (l > 0)
                    j += (k * 100) / l;
                View view1 = getChildAt(i - 1);
                int i1 = view1.getBottom();
                int j1 = view1.getHeight();
                if (j1 > 0)
                    j -= (100 * (i1 - getHeight())) / j1;
                return j;
            } else
            {
                return 1;
            }
        } else
        {
            return 0;
        }
    }

    protected int computeVerticalScrollOffset()
    {
        int i;
        int j;
label0:
        {
            i = super.mFirstPosition;
            j = getChildCount();
            int k = 0;
            if (i >= 0)
            {
                k = 0;
                if (j > 0)
                {
                    if (!mSmoothScrollbarEnabled)
                        break label0;
                    View view = getChildAt(0);
                    int j1 = view.getTop();
                    int k1 = view.getHeight();
                    k = 0;
                    if (k1 > 0)
                        k = Math.max((i * 100 - (j1 * 100) / k1) + (int)(100F * (((float)super.mScrollY / (float)getHeight()) * (float)super.mItemCount)), 0);
                }
            }
            return k;
        }
        int l = super.mItemCount;
        int i1;
        if (i == 0)
            i1 = 0;
        else
        if (i + j == l)
            i1 = l;
        else
            i1 = i + j / 2;
        return (int)((float)i + (float)j * ((float)i1 / (float)l));
    }

    protected int computeVerticalScrollRange()
    {
        if (mSmoothScrollbarEnabled)
        {
            int i = Math.max(100 * super.mItemCount, 0);
            if (super.mScrollY != 0)
                i += Math.abs((int)(100F * (((float)super.mScrollY / (float)getHeight()) * (float)super.mItemCount)));
            return i;
        } else
        {
            return super.mItemCount;
        }
    }

    void confirmCheckedPositionsById()
    {
        mCheckStates.clear();
        boolean flag = false;
label0:
        for (int i = 0; i < mCheckedIdStates.size(); i++)
        {
            long l = mCheckedIdStates.keyAt(i);
            int j = ((Integer)mCheckedIdStates.valueAt(i)).intValue();
            if (l != mAdapter.getItemId(j))
            {
                int k = Math.max(0, j - 20);
                int i1 = Math.min(j + 20, super.mItemCount);
                int j1 = k;
                do
                {
label1:
                    {
                        boolean flag1 = false;
                        if (j1 < i1)
                        {
                            if (l != mAdapter.getItemId(j1))
                                break label1;
                            flag1 = true;
                            mCheckStates.put(j1, true);
                            mCheckedIdStates.setValueAt(i, Integer.valueOf(j1));
                        }
                        if (flag1)
                            continue label0;
                        mCheckedIdStates.delete(l);
                        i--;
                        mCheckedItemCount = -1 + mCheckedItemCount;
                        flag = true;
                        if (mChoiceActionMode != null && mMultiChoiceModeCallback != null)
                            mMultiChoiceModeCallback.onItemCheckedStateChanged(mChoiceActionMode, j, l, false);
                        continue label0;
                    }
                    j1++;
                } while (true);
            }
            mCheckStates.put(j, true);
        }

        if (flag && mChoiceActionMode != null)
            mChoiceActionMode.invalidate();
    }

    android.view.ContextMenu.ContextMenuInfo createContextMenuInfo(View view, int i, long l)
    {
        return new AdapterContextMenuInfo(view, i, l);
    }

    public void deferNotifyDataSetChanged()
    {
        mDeferNotifyDataSetChanged = true;
    }

    protected void dispatchDraw(Canvas canvas)
    {
        boolean flag;
        if ((0x22 & super.mGroupFlags) == 34)
            flag = true;
        else
            flag = false;
        if (sDbgDraw)
            Xlog.d("AbsListView", (new StringBuilder()).append("dispatchDraw: mScrollY = ").append(super.mScrollY).append(",clipToPadding = ").append(flag).append(",this = ").append(this).toString());
        int i = 0;
        if (flag)
        {
            i = canvas.save();
            int j = super.mScrollX;
            int k = super.mScrollY;
            canvas.clipRect(j + super.mPaddingLeft, k + super.mPaddingTop, (j + super.mRight) - super.mLeft - super.mPaddingRight, (k + super.mBottom) - super.mTop - super.mPaddingBottom);
            super.mGroupFlags = 0xffffffdd & super.mGroupFlags;
        }
        boolean flag1 = mDrawSelectorOnTop;
        if (!flag1)
            drawSelector(canvas);
        dispatchDraw(canvas);
        if (flag1)
            drawSelector(canvas);
        if (flag)
        {
            canvas.restoreToCount(i);
            super.mGroupFlags = 0x22 | super.mGroupFlags;
        }
    }

    protected void dispatchSetPressed(boolean flag)
    {
    }

    public void draw(Canvas canvas)
    {
label0:
        {
            draw(canvas);
            if (mEdgeGlowTop != null)
            {
                int k = super.mScrollY;
                if (!mEdgeGlowTop.isFinished())
                {
                    int k2 = canvas.save();
                    int l2 = mListPadding.left + mGlowPaddingLeft;
                    int i3 = mListPadding.right + mGlowPaddingRight;
                    int j3 = getWidth() - l2 - i3;
                    int k3 = Math.min(0, k + mFirstPositionDistanceGuess);
                    canvas.translate(l2, k3);
                    mEdgeGlowTop.setSize(j3, getHeight());
                    if (mEdgeGlowTop.draw(canvas))
                    {
                        mEdgeGlowTop.setPosition(l2, k3);
                        invalidate(mEdgeGlowTop.getBounds(false));
                    }
                    canvas.restoreToCount(k2);
                }
                if (!mEdgeGlowBottom.isFinished())
                {
                    int l = canvas.save();
                    int i1 = mListPadding.left + mGlowPaddingLeft;
                    int j1 = mListPadding.right + mGlowPaddingRight;
                    int k1 = getWidth() - i1 - j1;
                    int l1 = getHeight();
                    int i2 = i1 + -k1;
                    int j2 = Math.max(l1, k + mLastPositionDistanceGuess);
                    canvas.translate(i2, j2);
                    canvas.rotate(180F, k1, 0.0F);
                    mEdgeGlowBottom.setSize(k1, l1);
                    if (mEdgeGlowBottom.draw(canvas))
                    {
                        mEdgeGlowBottom.setPosition(i2 + k1, j2);
                        invalidate(mEdgeGlowBottom.getBounds(true));
                    }
                    canvas.restoreToCount(l);
                }
            }
            if (mFastScroller != null)
            {
                int i = super.mScrollY;
                if (i == 0)
                    break label0;
                int j = canvas.save();
                canvas.translate(0.0F, i);
                mFastScroller.draw(canvas);
                canvas.restoreToCount(j);
            }
            return;
        }
        mFastScroller.draw(canvas);
    }

    protected void drawableStateChanged()
    {
        drawableStateChanged();
        updateSelectorState();
    }

    abstract void fillGap(boolean flag);

    int findClosestMotionRow(int i)
    {
        int j = getChildCount();
        int k;
        if (j == 0)
        {
            k = -1;
        } else
        {
            k = findMotionRow(i);
            if (k == -1)
                return -1 + (j + super.mFirstPosition);
        }
        return k;
    }

    abstract int findMotionRow(int i);

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams(-1, -2, 0);
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected float getBottomFadingEdgeStrength()
    {
        int i = getChildCount();
        float f = getBottomFadingEdgeStrength();
        if (i != 0)
        {
            if (-1 + (i + super.mFirstPosition) < -1 + super.mItemCount)
                return 1.0F;
            int j = getChildAt(i - 1).getBottom();
            int k = getHeight();
            float f1 = getVerticalFadingEdgeLength();
            if (j > k - super.mPaddingBottom)
                return (float)((j - k) + super.mPaddingBottom) / f1;
        }
        return f;
    }

    protected int getBottomPaddingOffset()
    {
        if ((0x22 & super.mGroupFlags) == 34)
            return 0;
        else
            return super.mPaddingBottom;
    }

    public int getCacheColorHint()
    {
        return mCacheColorHint;
    }

    public int getCheckedItemCount()
    {
        return mCheckedItemCount;
    }

    public long[] getCheckedItemIds()
    {
        long al[];
        if (mChoiceMode != 0 && mCheckedIdStates != null && mAdapter != null)
        {
            LongSparseArray longsparsearray = mCheckedIdStates;
            int i = longsparsearray.size();
            al = new long[i];
            for (int j = 0; j < i; j++)
                al[j] = longsparsearray.keyAt(j);

        } else
        {
            al = new long[0];
        }
        return al;
    }

    public int getCheckedItemPosition()
    {
        if (mChoiceMode == 1 && mCheckStates != null && mCheckStates.size() == 1)
            return mCheckStates.keyAt(0);
        else
            return -1;
    }

    public SparseBooleanArray getCheckedItemPositions()
    {
        if (mChoiceMode != 0)
            return mCheckStates;
        else
            return null;
    }

    public int getChoiceMode()
    {
        return mChoiceMode;
    }

    protected android.view.ContextMenu.ContextMenuInfo getContextMenuInfo()
    {
        return mContextMenuInfo;
    }

    public void getFocusedRect(Rect rect)
    {
        View view = getSelectedView();
        if (view != null && view.getParent() == this)
        {
            view.getFocusedRect(rect);
            offsetDescendantRectToMyCoords(view, rect);
            return;
        } else
        {
            getFocusedRect(rect);
            return;
        }
    }

    int getFooterViewsCount()
    {
        return 0;
    }

    int getHeaderViewsCount()
    {
        return 0;
    }

    protected int getLeftPaddingOffset()
    {
        if ((0x22 & super.mGroupFlags) == 34)
            return 0;
        else
            return -super.mPaddingLeft;
    }

    public int getListPaddingBottom()
    {
        return mListPadding.bottom;
    }

    public int getListPaddingLeft()
    {
        return mListPadding.left;
    }

    public int getListPaddingRight()
    {
        return mListPadding.right;
    }

    public int getListPaddingTop()
    {
        return mListPadding.top;
    }

    protected int getRightPaddingOffset()
    {
        if ((0x22 & super.mGroupFlags) == 34)
            return 0;
        else
            return super.mPaddingRight;
    }

    public View getSelectedView()
    {
        if (super.mItemCount > 0 && super.mSelectedPosition >= 0)
            return getChildAt(super.mSelectedPosition - super.mFirstPosition);
        else
            return null;
    }

    public Drawable getSelector()
    {
        return mSelector;
    }

    public int getSolidColor()
    {
        return mCacheColorHint;
    }

    public CharSequence getTextFilter()
    {
        if (mTextFilterEnabled && mTextFilter != null)
            return mTextFilter.getText();
        else
            return null;
    }

    protected float getTopFadingEdgeStrength()
    {
        int i = getChildCount();
        float f = getTopFadingEdgeStrength();
        if (i != 0)
        {
            if (super.mFirstPosition > 0)
                return 1.0F;
            int j = getChildAt(0).getTop();
            float f1 = getVerticalFadingEdgeLength();
            if (j < super.mPaddingTop)
                return (float)(-(j - super.mPaddingTop)) / f1;
        }
        return f;
    }

    protected int getTopPaddingOffset()
    {
        if ((0x22 & super.mGroupFlags) == 34)
            return 0;
        else
            return -super.mPaddingTop;
    }

    public int getTranscriptMode()
    {
        return mTranscriptMode;
    }

    public int getVerticalScrollbarWidth()
    {
        if (isFastScrollAlwaysVisible())
            return Math.max(getVerticalScrollbarWidth(), mFastScroller.getWidth());
        else
            return getVerticalScrollbarWidth();
    }

    protected void handleDataChanged()
    {
label0:
        {
            int i = 3;
            int j = super.mItemCount;
            int k = mLastHandledItemCount;
            mLastHandledItemCount = super.mItemCount;
            if (mChoiceMode != 0 && mAdapter != null && mAdapter.hasStableIds())
                confirmCheckedPositionsById();
            mRecycler.clearTransientStateViews();
            if (j > 0)
            {
                if (super.mNeedSync)
                {
                    super.mNeedSync = false;
                    mPendingSync = null;
                    if (mTranscriptMode == 2)
                    {
                        mLayoutMode = i;
                        break label0;
                    }
                    if (mTranscriptMode == 1)
                    {
                        if (mForceTranscriptScroll)
                        {
                            mForceTranscriptScroll = false;
                            mLayoutMode = i;
                            return;
                        }
                        int l1 = getChildCount();
                        int i2 = getHeight() - getPaddingBottom();
                        View view = getChildAt(l1 - 1);
                        int j2;
                        if (view != null)
                            j2 = view.getBottom();
                        else
                            j2 = i2;
                        if (l1 + super.mFirstPosition >= k && j2 <= i2)
                        {
                            mLayoutMode = i;
                            return;
                        }
                        awakenScrollBars();
                    }
                    switch (super.mSyncMode)
                    {
                    case 1: // '\001'
                        mLayoutMode = 5;
                        super.mSyncPosition = Math.min(Math.max(0, super.mSyncPosition), j - 1);
                        return;

                    case 0: // '\0'
                        if (isInTouchMode())
                        {
                            mLayoutMode = 5;
                            super.mSyncPosition = Math.min(Math.max(0, super.mSyncPosition), j - 1);
                            return;
                        }
                        int k1 = findSyncPosition();
                        if (k1 >= 0 && lookForSelectablePosition(k1, true) == k1)
                        {
                            super.mSyncPosition = k1;
                            if (super.mSyncHeight == (long)getHeight())
                                mLayoutMode = 5;
                            else
                                mLayoutMode = 2;
                            setNextSelectedPositionInt(k1);
                            return;
                        }
                        break;
                    }
                }
                if (!isInTouchMode())
                {
                    int l = getSelectedItemPosition();
                    if (l >= j)
                        l = j - 1;
                    if (l < 0)
                        l = 0;
                    int i1 = lookForSelectablePosition(l, true);
                    if (i1 >= 0)
                    {
                        setNextSelectedPositionInt(i1);
                        return;
                    }
                    int j1 = lookForSelectablePosition(l, false);
                    if (j1 >= 0)
                    {
                        setNextSelectedPositionInt(j1);
                        return;
                    }
                } else
                if (mResurrectToPosition >= 0)
                    break label0;
            }
            if (!mStackFromBottom)
                i = 1;
            mLayoutMode = i;
            super.mSelectedPosition = -1;
            super.mSelectedRowId = 0x8000000000000000L;
            super.mNextSelectedPosition = -1;
            super.mNextSelectedRowId = 0x8000000000000000L;
            super.mNeedSync = false;
            mPendingSync = null;
            mSelectorPosition = -1;
            checkSelectionChanged();
            return;
        }
    }

    public boolean hasTextFilter()
    {
        return mFiltered;
    }

    void hideSelector()
    {
        if (super.mSelectedPosition != -1)
        {
            if (mLayoutMode != 4)
                mResurrectToPosition = super.mSelectedPosition;
            if (super.mNextSelectedPosition >= 0 && super.mNextSelectedPosition != super.mSelectedPosition)
                mResurrectToPosition = super.mNextSelectedPosition;
            setSelectedPositionInt(-1);
            setNextSelectedPositionInt(-1);
            mSelectedTop = 0;
        }
    }

    public void hideSelectorP()
    {
        hideSelector();
    }

    public void invalidateViews()
    {
        super.mDataChanged = true;
        rememberSyncState();
        requestLayout();
        invalidate();
    }

    void invokeOnItemScrollListener()
    {
        if (mFastScroller != null)
            mFastScroller.onScroll(this, super.mFirstPosition, getChildCount(), super.mItemCount);
        if (mOnScrollListener != null)
            mOnScrollListener.onScroll(this, super.mFirstPosition, getChildCount(), super.mItemCount);
        onScrollChanged(0, 0, 0, 0);
    }

    public boolean isFastScrollAlwaysVisible()
    {
        return mFastScrollEnabled && mFastScroller.isAlwaysShowEnabled();
    }

    public boolean isFastScrollEnabled()
    {
        return mFastScrollEnabled;
    }

    protected boolean isInFilterMode()
    {
        return mFiltered;
    }

    public boolean isItemChecked(int i)
    {
        if (mChoiceMode != 0 && mCheckStates != null)
            return mCheckStates.get(i);
        else
            return false;
    }

    protected boolean isPaddingOffsetRequired()
    {
        return (0x22 & super.mGroupFlags) != 34;
    }

    public boolean isScrollingCacheEnabled()
    {
        return mScrollingCacheEnabled;
    }

    public boolean isSmoothScrollbarEnabled()
    {
        return mSmoothScrollbarEnabled;
    }

    public boolean isStackFromBottom()
    {
        return mStackFromBottom;
    }

    public boolean isTextFilterEnabled()
    {
        return mTextFilterEnabled;
    }

    protected boolean isVerticalScrollBarHidden()
    {
        return mFastScroller != null && mFastScroller.isVisible();
    }

    public void jumpDrawablesToCurrentState()
    {
        jumpDrawablesToCurrentState();
        if (mSelector != null)
            mSelector.jumpToCurrentState();
    }

    void keyPressed()
    {
label0:
        {
            if (!isEnabled() || !isClickable())
                break label0;
            Drawable drawable = mSelector;
            Rect rect = mSelectorRect;
            if (drawable == null || !isFocused() && !touchModeDrawsInPressedState() || rect.isEmpty())
                break label0;
            View view = getChildAt(super.mSelectedPosition - super.mFirstPosition);
            if (view != null)
            {
                if (view.hasFocusable())
                    break label0;
                view.setPressed(true);
            }
            setPressed(true);
            boolean flag = isLongClickable();
            Drawable drawable1 = drawable.getCurrent();
            if (drawable1 != null && (drawable1 instanceof TransitionDrawable))
                if (flag)
                    ((TransitionDrawable)drawable1).startTransition(ViewConfiguration.getLongPressTimeout());
                else
                    ((TransitionDrawable)drawable1).resetTransition();
            if (flag && !super.mDataChanged)
            {
                if (mPendingCheckForKeyLongPress == null)
                    mPendingCheckForKeyLongPress = new CheckForKeyLongPress();
                mPendingCheckForKeyLongPress.rememberWindowAttachCount();
                postDelayed(mPendingCheckForKeyLongPress, ViewConfiguration.getLongPressTimeout());
                return;
            }
        }
    }

    protected void layoutChildren()
    {
    }

    View obtainView(int i, boolean aflag[])
    {
        aflag[0] = false;
        View view = mRecycler.getTransientStateView(i);
        View view2;
        if (view != null)
        {
            view2 = view;
        } else
        {
            View view1 = mRecycler.getScrapView(i);
            if (view1 != null)
            {
                view2 = mAdapter.getView(i, view1, this);
                if (view2.getImportantForAccessibility() == 0)
                    view2.setImportantForAccessibility(1);
                if (sDbgLayout)
                    Xlog.d("AbsListView", (new StringBuilder()).append("obtainView: position = ").append(i).append(",scrapView = ").append(view1).append(",child = ").append(view2).append(",this = ").append(this).toString());
                if (view2 != view1)
                {
                    mRecycler.addScrapView(view1, i);
                    if (mCacheColorHint != 0)
                        view2.setDrawingCacheBackgroundColor(mCacheColorHint);
                } else
                {
                    aflag[0] = true;
                    view2.dispatchFinishTemporaryDetach();
                }
            } else
            {
                view2 = mAdapter.getView(i, null, this);
                if (sDbgLayout)
                    Xlog.d("AbsListView", (new StringBuilder()).append("obtainView scrap view is null: position = ").append(i).append(",scrapView = ").append(view1).append(",child = ").append(view2).append(",this = ").append(this).toString());
                if (view2.getImportantForAccessibility() == 0)
                    view2.setImportantForAccessibility(1);
                if (mCacheColorHint != 0)
                    view2.setDrawingCacheBackgroundColor(mCacheColorHint);
            }
            if (mAdapterHasStableIds)
            {
                android.view.ViewGroup.LayoutParams layoutparams = view2.getLayoutParams();
                LayoutParams layoutparams1;
                if (layoutparams == null)
                    layoutparams1 = (LayoutParams)generateDefaultLayoutParams();
                else
                if (!checkLayoutParams(layoutparams))
                    layoutparams1 = (LayoutParams)generateLayoutParams(layoutparams);
                else
                    layoutparams1 = (LayoutParams)layoutparams;
                layoutparams1.itemId = mAdapter.getItemId(i);
                view2.setLayoutParams(layoutparams1);
            }
            if (AccessibilityManager.getInstance(super.mContext).isEnabled())
            {
                if (mAccessibilityDelegate == null)
                    mAccessibilityDelegate = new ListItemAccessibilityDelegate();
                if (view2.getAccessibilityDelegate() == null)
                {
                    view2.setAccessibilityDelegate(mAccessibilityDelegate);
                    return view2;
                }
            }
        }
        return view2;
    }

    public View obtainViewP(int i, boolean aflag[])
    {
        return obtainView(i, aflag);
    }

    protected void onAttachedToWindow()
    {
        onAttachedToWindow();
        ViewTreeObserver viewtreeobserver = getViewTreeObserver();
        viewtreeobserver.addOnTouchModeChangeListener(this);
        if (mTextFilterEnabled && mPopup != null && !mGlobalLayoutListenerAddedFilter)
            viewtreeobserver.addOnGlobalLayoutListener(this);
        if (mAdapter != null && mDataSetObserver == null)
        {
            mDataSetObserver = new AdapterDataSetObserver();
            mAdapter.registerDataSetObserver(mDataSetObserver);
            super.mDataChanged = true;
            super.mOldItemCount = super.mItemCount;
            super.mItemCount = mAdapter.getCount();
            requestLayout();
        }
        mIsAttached = true;
    }

    protected int[] onCreateDrawableState(int i)
    {
        if (!mIsChildViewEnabled) goto _L2; else goto _L1
_L1:
        int ai[] = onCreateDrawableState(i);
          goto _L3
_L2:
        int j;
        int k;
        int l;
        j = ENABLED_STATE_SET[0];
        ai = onCreateDrawableState(i + 1);
        k = -1;
        l = -1 + ai.length;
_L9:
        if (l < 0) goto _L5; else goto _L4
_L4:
        if (ai[l] != j) goto _L7; else goto _L6
_L6:
        k = l;
_L5:
        if (k >= 0)
        {
            System.arraycopy(ai, k + 1, ai, k, -1 + (ai.length - k));
            return ai;
        }
_L3:
        return ai;
_L7:
        l--;
        if (true) goto _L9; else goto _L8
_L8:
    }

    public InputConnection onCreateInputConnection(EditorInfo editorinfo)
    {
        if (isTextFilterEnabled())
        {
            createTextFilter(false);
            if (mPublicInputConnection == null)
            {
                mDefInputConnection = new BaseInputConnection(this, false);
                mPublicInputConnection = new InputConnectionWrapper(mTextFilter.onCreateInputConnection(editorinfo), true) {

                    final AbsListView this$0;

                    public boolean performEditorAction(int i)
                    {
                        boolean flag = false;
                        if (i == 6)
                        {
                            InputMethodManager inputmethodmanager = (InputMethodManager)getContext().getSystemService("input_method");
                            if (inputmethodmanager != null)
                                inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
                            flag = true;
                        }
                        return flag;
                    }

                    public boolean reportFullscreenMode(boolean flag)
                    {
                        return mDefInputConnection.reportFullscreenMode(flag);
                    }

                    public boolean sendKeyEvent(KeyEvent keyevent)
                    {
                        return mDefInputConnection.sendKeyEvent(keyevent);
                    }

            
            {
                this$0 = AbsListView.this;
                InputConnectionWrapper(inputconnection, flag);
            }
                }
;
            }
            editorinfo.inputType = 177;
            editorinfo.imeOptions = 6;
            return mPublicInputConnection;
        } else
        {
            return null;
        }
    }

    protected void onDetachedFromWindow()
    {
        onDetachedFromWindow();
        dismissPopup();
        mRecycler.clear();
        ViewTreeObserver viewtreeobserver = getViewTreeObserver();
        viewtreeobserver.removeOnTouchModeChangeListener(this);
        if (mTextFilterEnabled && mPopup != null)
        {
            viewtreeobserver.removeOnGlobalLayoutListener(this);
            mGlobalLayoutListenerAddedFilter = false;
        }
        if (mAdapter != null)
        {
            mAdapter.unregisterDataSetObserver(mDataSetObserver);
            mDataSetObserver = null;
        }
        if (mScrollStrictSpan != null)
        {
            mScrollStrictSpan.finish();
            mScrollStrictSpan = null;
        }
        if (mFlingStrictSpan != null)
        {
            mFlingStrictSpan.finish();
            mFlingStrictSpan = null;
        }
        if (mFlingRunnable != null)
            removeCallbacks(mFlingRunnable);
        if (mPositionScroller != null)
            mPositionScroller.stop();
        if (mClearScrollingCache != null)
            removeCallbacks(mClearScrollingCache);
        if (mPerformClick != null)
            removeCallbacks(mPerformClick);
        if (mTouchModeReset != null)
        {
            removeCallbacks(mTouchModeReset);
            mTouchModeReset = null;
        }
        mIsAttached = false;
    }

    protected void onDisplayHint(int i)
    {
        onDisplayHint(i);
        switch (i)
        {
        case 0: // '\0'
            if (mFiltered && mPopup != null && !mPopup.isShowing())
                showPopup();
            break;

        case 4: // '\004'
            if (mPopup != null && mPopup.isShowing())
                dismissPopup();
            break;
        }
        boolean flag;
        if (i == 4)
            flag = true;
        else
            flag = false;
        mPopupHidden = flag;
    }

    public void onFilterComplete(int i)
    {
        if (super.mSelectedPosition < 0 && i > 0)
        {
            mResurrectToPosition = -1;
            resurrectSelection();
        }
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        onFocusChanged(flag, i, rect);
        if (flag && super.mSelectedPosition < 0 && !isInTouchMode())
        {
            if (!mIsAttached && mAdapter != null)
            {
                super.mDataChanged = true;
                super.mOldItemCount = super.mItemCount;
                super.mItemCount = mAdapter.getCount();
            }
            resurrectSelection();
        }
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("onGenericMotionEvent: mScrollY = ").append(super.mScrollY).append(",event = ").append(motionevent).append(",this = ").append(this).toString());
        if ((2 & motionevent.getSource()) != 0)
            switch (motionevent.getAction())
            {
            default:
                break;

            case 8: // '\b'
                if (mTouchMode == -1)
                {
                    float f = motionevent.getAxisValue(9);
                    if (f != 0.0F)
                    {
                        int i = (int)(f * getVerticalScrollFactor());
                        if (!trackMotionScroll(i, i))
                            return true;
                    }
                }
                break;
            }
        return onGenericMotionEvent(motionevent);
    }

    public void onGlobalLayout()
    {
        if (isShown())
        {
            if (mFiltered && mPopup != null && !mPopup.isShowing() && !mPopupHidden)
                showPopup();
        } else
        if (mPopup != null && mPopup.isShowing())
        {
            dismissPopup();
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/AbsListView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/AbsListView.getName());
        if (isEnabled())
        {
            if (getFirstVisiblePosition() > 0)
                accessibilitynodeinfo.addAction(8192);
            if (getLastVisiblePosition() < -1 + getCount())
                accessibilitynodeinfo.addAction(4096);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
label0:
        {
            int i = motionevent.getAction();
            if (sDbgMotion)
                Xlog.d("AbsListView", (new StringBuilder()).append("onInterceptTouchEvent: action = ").append(i).append(",x= ").append(motionevent.getX()).append(",y = ").append(motionevent.getY()).append(",mTouchMode = ").append(mTouchMode).append(",mFastScroller = ").append(mFastScroller).append(",this = ").append(this).toString());
            if (mPositionScroller != null)
                mPositionScroller.stop();
            if (!mIsAttached)
                return false;
            if (mFastScroller != null && mFastScroller.onInterceptTouchEvent(motionevent))
                return true;
            switch (i & 0xff)
            {
            case 4: // '\004'
            case 5: // '\005'
            default:
                break;

            case 6: // '\006'
                onSecondaryPointerUp(motionevent);
                break;

            case 1: // '\001'
            case 3: // '\003'
                mTouchMode = -1;
                mActivePointerId = -1;
                recycleVelocityTracker();
                reportScrollStateChange(0);
                break;

            case 2: // '\002'
                switch (mTouchMode)
                {
                default:
                    break;

                case 0: // '\0'
                    int j1 = motionevent.findPointerIndex(mActivePointerId);
                    if (j1 == -1)
                    {
                        j1 = 0;
                        mActivePointerId = motionevent.getPointerId(0);
                    }
                    int k1 = (int)motionevent.getY(j1);
                    initVelocityTrackerIfNotExists();
                    mVelocityTracker.addMovement(motionevent);
                    if (startScrollIfNeeded(k1))
                        return true;
                    break;
                }
                break;

            case 0: // '\0'
                int j = mTouchMode;
                if (j == 6 || j == 5)
                    break label0;
                int k = (int)motionevent.getX();
                int l = (int)motionevent.getY();
                mActivePointerId = motionevent.getPointerId(0);
                int i1 = findMotionRow(l);
                if (j != 4 && i1 >= 0)
                {
                    mMotionViewOriginalTop = getChildAt(i1 - super.mFirstPosition).getTop();
                    mMotionX = k;
                    mMotionY = l;
                    mMotionPosition = i1;
                    mTouchMode = 0;
                    clearScrollingCache();
                }
                mLastY = 0x80000000;
                initOrResetVelocityTracker();
                mVelocityTracker.addMovement(motionevent);
                if (sDbgMotion)
                    Xlog.d("AbsListView", (new StringBuilder()).append("onInterceptTouchEvent touch down: motionPosition = ").append(i1).append(",mMotionPosition = ").append(mMotionPosition).append(",this = ").append(this).toString());
                if (j == 4)
                    return true;
                break;
            }
            return false;
        }
        mMotionCorrection = 0;
        return true;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        boolean flag;
label0:
        {
            flag = true;
            switch (i)
            {
            default:
                break;

            case 23: // '\027'
            case 66: // 'B'
                if (!isEnabled())
                    break label0;
                if (isClickable() && isPressed() && super.mSelectedPosition >= 0 && mAdapter != null && super.mSelectedPosition < mAdapter.getCount())
                {
                    View view = getChildAt(super.mSelectedPosition - super.mFirstPosition);
                    if (view != null)
                    {
                        performItemClick(view, super.mSelectedPosition, super.mSelectedRowId);
                        view.setPressed(false);
                    }
                    setPressed(false);
                    return flag;
                }
                break;
            }
            flag = onKeyUp(i, keyevent);
        }
        return flag;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        onLayout(flag, i, j, k, l);
        super.mInLayout = true;
        if (flag)
        {
            int i1 = getChildCount();
            for (int j1 = 0; j1 < i1; j1++)
                getChildAt(j1).forceLayout();

            mRecycler.markChildrenDirty();
        }
        if (mFastScroller != null && super.mItemCount != super.mOldItemCount)
            mFastScroller.onItemCountChanged(super.mOldItemCount, super.mItemCount);
        layoutChildren();
        super.mInLayout = false;
        mOverscrollMax = (l - j) / 3;
    }

    protected void onMeasure(int i, int j)
    {
        boolean flag = true;
        if (mSelector == null)
            useDefaultSelector();
        Rect rect = mListPadding;
        rect.left = mSelectionLeftPadding + super.mPaddingLeft;
        rect.top = mSelectionTopPadding + super.mPaddingTop;
        rect.right = mSelectionRightPadding + super.mPaddingRight;
        rect.bottom = mSelectionBottomPadding + super.mPaddingBottom;
        if (mTranscriptMode == flag)
        {
            int k = getChildCount();
            int l = getHeight() - getPaddingBottom();
            View view = getChildAt(k - 1);
            int i1;
            if (view != null)
                i1 = view.getBottom();
            else
                i1 = l;
            if (k + super.mFirstPosition < mLastHandledItemCount || i1 > l)
                flag = false;
            mForceTranscriptScroll = flag;
        }
    }

    protected void onOverScrolled(int i, int j, boolean flag, boolean flag1)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("onOverScrolled: mScrollY = ").append(super.mScrollY).append(",scrollY = ").append(j).append(",clampedY = ").append(flag1).append(",this = ").append(this).toString());
        if (super.mScrollY != j)
        {
            onScrollChanged(super.mScrollX, j, super.mScrollX, super.mScrollY);
            super.mScrollY = j;
            invalidateParentIfNeeded();
            awakenScrollBars();
        }
    }

    public boolean onRemoteAdapterConnected()
    {
        if (mRemoteAdapter != mAdapter)
        {
            setAdapter(mRemoteAdapter);
            if (mDeferNotifyDataSetChanged)
            {
                mRemoteAdapter.notifyDataSetChanged();
                mDeferNotifyDataSetChanged = false;
            }
        } else
        if (mRemoteAdapter != null)
        {
            mRemoteAdapter.superNotifyDataSetChanged();
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
        onRestoreInstanceState(savedstate.getSuperState());
        super.mDataChanged = true;
        super.mSyncHeight = savedstate.height;
        if (savedstate.selectedId >= 0L)
        {
            super.mNeedSync = true;
            mPendingSync = savedstate;
            super.mSyncRowId = savedstate.selectedId;
            super.mSyncPosition = savedstate.position;
            super.mSpecificTop = savedstate.viewTop;
            super.mSyncMode = 0;
        } else
        if (savedstate.firstId >= 0L)
        {
            setSelectedPositionInt(-1);
            setNextSelectedPositionInt(-1);
            mSelectorPosition = -1;
            super.mNeedSync = true;
            mPendingSync = savedstate;
            super.mSyncRowId = savedstate.firstId;
            super.mSyncPosition = savedstate.position;
            super.mSpecificTop = savedstate.viewTop;
            super.mSyncMode = 1;
        }
        setFilterText(savedstate.filter);
        if (savedstate.checkState != null)
            mCheckStates = savedstate.checkState;
        if (savedstate.checkIdState != null)
            mCheckedIdStates = savedstate.checkIdState;
        mCheckedItemCount = savedstate.checkedItemCount;
        if (savedstate.inActionMode && mChoiceMode == 3 && mMultiChoiceModeCallback != null)
            mChoiceActionMode = startActionMode(mMultiChoiceModeCallback);
        if (sDbgLayout)
            Xlog.d("AbsListView", (new StringBuilder()).append("onRestoreInstanceState: ss = ").append(savedstate).append(",this = ").append(this).toString());
        requestLayout();
    }

    public Parcelable onSaveInstanceState()
    {
        dismissPopup();
        SavedState savedstate = new SavedState(onSaveInstanceState());
        if (mPendingSync != null)
        {
            savedstate.selectedId = mPendingSync.selectedId;
            savedstate.firstId = mPendingSync.firstId;
            savedstate.viewTop = mPendingSync.viewTop;
            savedstate.position = mPendingSync.position;
            savedstate.height = mPendingSync.height;
            savedstate.filter = mPendingSync.filter;
            savedstate.inActionMode = mPendingSync.inActionMode;
            savedstate.checkedItemCount = mPendingSync.checkedItemCount;
            savedstate.checkState = mPendingSync.checkState;
            savedstate.checkIdState = mPendingSync.checkIdState;
        } else
        {
            boolean flag;
            if (getChildCount() > 0 && super.mItemCount > 0)
                flag = true;
            else
                flag = false;
            long l = getSelectedItemId();
            savedstate.selectedId = l;
            savedstate.height = getHeight();
            if (l >= 0L)
            {
                savedstate.viewTop = mSelectedTop;
                savedstate.position = getSelectedItemPosition();
                savedstate.firstId = -1L;
            } else
            if (flag && super.mFirstPosition > 0)
            {
                savedstate.viewTop = getChildAt(0).getTop();
                int k = super.mFirstPosition;
                if (k >= super.mItemCount)
                    k = -1 + super.mItemCount;
                savedstate.position = k;
                savedstate.firstId = mAdapter.getItemId(k);
            } else
            {
                savedstate.viewTop = 0;
                savedstate.firstId = -1L;
                savedstate.position = 0;
            }
            savedstate.filter = null;
            if (mFiltered)
            {
                EditText edittext = mTextFilter;
                if (edittext != null)
                {
                    Editable editable = edittext.getText();
                    if (editable != null)
                        savedstate.filter = editable.toString();
                }
            }
            boolean flag1;
            if (mChoiceMode == 3 && mChoiceActionMode != null)
                flag1 = true;
            else
                flag1 = false;
            savedstate.inActionMode = flag1;
            if (mCheckStates != null)
                savedstate.checkState = mCheckStates.clone();
            if (mCheckedIdStates != null)
            {
                LongSparseArray longsparsearray = new LongSparseArray();
                int i = mCheckedIdStates.size();
                for (int j = 0; j < i; j++)
                    longsparsearray.put(mCheckedIdStates.keyAt(j), mCheckedIdStates.valueAt(j));

                savedstate.checkIdState = longsparsearray;
            }
            savedstate.checkedItemCount = mCheckedItemCount;
            if (mRemoteAdapter != null)
                mRemoteAdapter.saveRemoteViewsCache();
            if (sDbgLayout)
            {
                Xlog.d("AbsListView", (new StringBuilder()).append("onSaveInstanceState: ss = ").append(savedstate).append(",this = ").append(this).toString());
                return savedstate;
            }
        }
        return savedstate;
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        if (getChildCount() > 0)
        {
            super.mDataChanged = true;
            rememberSyncState();
        }
        if (mFastScroller != null)
            mFastScroller.onSizeChanged(i, j, k, l);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
label0:
        {
            if (mPopup != null && isTextFilterEnabled())
            {
                int l = charsequence.length();
                boolean flag = mPopup.isShowing();
                if (!flag && l > 0)
                {
                    showPopup();
                    mFiltered = true;
                } else
                if (flag && l == 0)
                {
                    dismissPopup();
                    mFiltered = false;
                }
                if (mAdapter instanceof Filterable)
                {
                    Filter filter = ((Filterable)mAdapter).getFilter();
                    if (filter == null)
                        break label0;
                    filter.filter(charsequence, this);
                }
            }
            return;
        }
        throw new IllegalStateException("You cannot call onTextChanged with a non filterable adapter");
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (!isEnabled())
            return isClickable() || isLongClickable();
        if (mPositionScroller != null)
            mPositionScroller.stop();
        if (!mIsAttached)
            return false;
        if (mFastScroller != null && mFastScroller.onTouchEvent(motionevent))
            return true;
        int i = motionevent.getAction();
        if (getChildCount() != 0 && (!super.mDataChanged || super.mFirstPosition <= super.mItemCount))
        {
            initVelocityTrackerIfNotExists();
            mVelocityTracker.addMovement(motionevent);
            switch (i & 0xff)
            {
            case 4: // '\004'
            default:
                break;

            case 5: // '\005'
                int k4 = motionevent.getActionIndex();
                int l4 = motionevent.getPointerId(k4);
                int i5 = (int)motionevent.getX(k4);
                int j5 = (int)motionevent.getY(k4);
                if (sDbgMotion || sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch second pointer down, touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",mActivePointerId = ").append(mActivePointerId).append(",id = ").append(l4).append(",index = ").append(k4).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                mMotionCorrection = 0;
                mActivePointerId = l4;
                mMotionX = i5;
                mMotionY = j5;
                int k5 = pointToPosition(i5, j5);
                if (k5 >= 0)
                {
                    mMotionViewOriginalTop = getChildAt(k5 - super.mFirstPosition).getTop();
                    mMotionPosition = k5;
                }
                mLastY = j5;
                break;

            case 6: // '\006'
                View view2 = getChildAt(mMotionPosition - super.mFirstPosition);
                if (view2 != null && !view2.hasFocusable() && view2.isPressed())
                    view2.setPressed(false);
                if (sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch second pointer up, touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",mActivePointerId = ").append(mActivePointerId).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                onSecondaryPointerUp(motionevent);
                int l3 = mMotionX;
                int i4 = mMotionY;
                int j4 = pointToPosition(l3, i4);
                if (j4 >= 0)
                {
                    mMotionViewOriginalTop = getChildAt(j4 - super.mFirstPosition).getTop();
                    mMotionPosition = j4;
                }
                mLastY = i4;
                break;

            case 3: // '\003'
                if (sDbgMotion || sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch cancel: touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",mActivePointerId = ").append(mActivePointerId).append(",mMotionPosition = ").append(mMotionPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                switch (mTouchMode)
                {
                case 5: // '\005'
                    if (mFlingRunnable == null)
                    {
                        FlingRunnable flingrunnable2 = new FlingRunnable();
                        mFlingRunnable = flingrunnable2;
                    }
                    mFlingRunnable.startSpringback();
                    break;

                default:
                    mTouchMode = -1;
                    setPressed(false);
                    View view1 = getChildAt(mMotionPosition - super.mFirstPosition);
                    if (view1 != null)
                        view1.setPressed(false);
                    clearScrollingCache();
                    Handler handler2 = getHandler();
                    if (handler2 != null)
                        handler2.removeCallbacks(mPendingCheckForLongPress);
                    recycleVelocityTracker();
                    reportScrollStateChange(0);
                    break;

                case 6: // '\006'
                    break;
                }
                if (mEdgeGlowTop != null)
                {
                    mEdgeGlowTop.onRelease();
                    mEdgeGlowBottom.onRelease();
                }
                mActivePointerId = -1;
                break;

            case 1: // '\001'
                if (sDbgMotion || sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch up: touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",mLastY = ").append(mLastY).append(",mMotionPosition = ").append(mMotionPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                switch (mTouchMode)
                {
                case 4: // '\004'
                default:
                    break;

                case -1: 
                    View view = getChildAt(mMotionPosition - super.mFirstPosition);
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch cancel:mMotionPosition = ").append(mMotionPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",lostChild = ").append(view).append(",this = ").append(this).toString());
                    if (view != null && !view.hasFocusable() && view.isPressed())
                        view.setPressed(false);
                    break;

                case 5: // '\005'
                    if (mFlingRunnable == null)
                    {
                        FlingRunnable flingrunnable1 = new FlingRunnable();
                        mFlingRunnable = flingrunnable1;
                    }
                    VelocityTracker velocitytracker1 = mVelocityTracker;
                    velocitytracker1.computeCurrentVelocity(1000, mMaximumVelocity);
                    int k3 = (int)velocitytracker1.getYVelocity(mActivePointerId);
                    reportScrollStateChange(2);
                    if (Math.abs(k3) > mMinimumVelocity)
                        mFlingRunnable.startOverfling(-k3);
                    else
                        mFlingRunnable.startSpringback();
                    break;

                case 3: // '\003'
                    int i2 = getChildCount();
                    if (i2 > 0)
                    {
                        int j2 = getChildAt(0).getTop();
                        int k2 = getChildAt(i2 - 1).getBottom();
                        int l2 = mListPadding.top;
                        int i3 = getHeight() - mListPadding.bottom;
                        if (super.mFirstPosition == 0 && j2 >= l2 && i2 + super.mFirstPosition < super.mItemCount && k2 <= getHeight() - i3)
                        {
                            mTouchMode = -1;
                            reportScrollStateChange(0);
                            break;
                        }
                        VelocityTracker velocitytracker = mVelocityTracker;
                        velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
                        int j3 = (int)(velocitytracker.getYVelocity(mActivePointerId) * mVelocityScale);
                        Xlog.i("AbsListView", (new StringBuilder()).append("Fling from scroll with initialVelocity = ").append(j3).append(",mActivePointerId = ").append(mActivePointerId).append(",mFirstPosition = ").append(super.mFirstPosition).append(",firstChildTop = ").append(j2).append(",this = ").append(this).toString());
                        if (Math.abs(j3) <= mMinimumVelocity || super.mFirstPosition == 0 && j2 == l2 - mOverscrollDistance || i2 + super.mFirstPosition == super.mItemCount && k2 == i3 + mOverscrollDistance)
                        {
                            mTouchMode = -1;
                            reportScrollStateChange(0);
                            if (mFlingRunnable != null)
                                mFlingRunnable.endFling();
                            if (mPositionScroller != null)
                                mPositionScroller.stop();
                            break;
                        }
                        if (mFlingRunnable == null)
                        {
                            FlingRunnable flingrunnable = new FlingRunnable();
                            mFlingRunnable = flingrunnable;
                        }
                        reportScrollStateChange(2);
                        mFlingRunnable.start(-j3);
                    } else
                    {
                        mTouchMode = -1;
                        reportScrollStateChange(0);
                    }
                    break;

                case 0: // '\0'
                case 1: // '\001'
                case 2: // '\002'
                    int l1 = mMotionPosition;
                    final View child = getChildAt(l1 - super.mFirstPosition);
                    float f = motionevent.getX();
                    boolean flag;
                    if (f > (float)mListPadding.left && f < (float)(getWidth() - mListPadding.right))
                        flag = true;
                    else
                        flag = false;
                    if (child != null && !child.hasFocusable() && flag)
                    {
                        if (mTouchMode != 0)
                            child.setPressed(false);
                        if (mPerformClick == null)
                        {
                            PerformClick performclick = new PerformClick();
                            mPerformClick = performclick;
                        }
                        final PerformClick performClick = mPerformClick;
                        performClick.mClickMotionPosition = l1;
                        performClick.rememberWindowAttachCount();
                        mResurrectToPosition = l1;
                        if (mTouchMode != 0 && mTouchMode != 1)
                        {
                            if (!super.mDataChanged && mAdapter.isEnabled(l1))
                                performClick.run();
                        } else
                        {
                            Handler handler1 = getHandler();
                            if (handler1 != null)
                            {
                                Object obj;
                                if (mTouchMode == 0)
                                    obj = mPendingCheckForTap;
                                else
                                    obj = mPendingCheckForLongPress;
                                handler1.removeCallbacks(((Runnable) (obj)));
                            }
                            mLayoutMode = 0;
                            if (!super.mDataChanged && mAdapter.isEnabled(l1))
                            {
                                mTouchMode = 1;
                                setSelectedPositionInt(mMotionPosition);
                                layoutChildren();
                                child.setPressed(true);
                                positionSelector(mMotionPosition, child);
                                setPressed(true);
                                if (mSelector != null)
                                {
                                    Drawable drawable = mSelector.getCurrent();
                                    if (drawable != null && (drawable instanceof TransitionDrawable))
                                        ((TransitionDrawable)drawable).resetTransition();
                                }
                                if (mTouchModeReset != null)
                                    removeCallbacks(mTouchModeReset);
                                Runnable runnable = new Runnable() {

                                    final AbsListView this$0;
                                    final View val$child;
                                    final PerformClick val$performClick;

                                    public void run()
                                    {
                                        mTouchMode = -1;
                                        child.setPressed(false);
                                        setPressed(false);
                                        if (!mDataChanged)
                                            performClick.run();
                                    }

            
            {
                this$0 = AbsListView.this;
                child = view;
                performClick = performclick;
                super();
            }
                                }
;
                                mTouchModeReset = runnable;
                                postDelayed(mTouchModeReset, ViewConfiguration.getPressedStateDuration());
                            } else
                            {
                                mTouchMode = -1;
                                updateSelectorState();
                            }
                            return true;
                        }
                    } else
                    if (!flag)
                    {
                        Xlog.d("AbsListView", (new StringBuilder()).append("Touch up out of list: mTouchMode = ").append(mTouchMode).append(",pressed = ").append(isPressed()).toString());
                        if (mTouchMode != 0)
                        {
                            setPressed(false);
                            if (child != null)
                                child.setPressed(false);
                        }
                    }
                    mTouchMode = -1;
                    updateSelectorState();
                    break;
                }
                setPressed(false);
                if (mEdgeGlowTop != null)
                {
                    mEdgeGlowTop.onRelease();
                    mEdgeGlowBottom.onRelease();
                }
                invalidate();
                Handler handler = getHandler();
                if (handler != null)
                    handler.removeCallbacks(mPendingCheckForLongPress);
                recycleVelocityTracker();
                mActivePointerId = -1;
                if (mScrollStrictSpan != null)
                {
                    mScrollStrictSpan.finish();
                    mScrollStrictSpan = null;
                }
                break;

            case 2: // '\002'
                int j1 = motionevent.findPointerIndex(mActivePointerId);
                if (j1 == -1)
                {
                    j1 = 0;
                    mActivePointerId = motionevent.getPointerId(0);
                }
                int k1 = (int)motionevent.getY(j1);
                if (sDbgMotion || sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch move: touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",mLastY = ").append(mLastY).append(",y = ").append(k1).append(",mActivePointerId = ").append(mActivePointerId).append(",pointerIndex = ").append(j1).append(",mMotionPosition = ").append(mMotionPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                if (super.mDataChanged)
                    layoutChildren();
                switch (mTouchMode)
                {
                case 3: // '\003'
                case 5: // '\005'
                    scrollIfNeeded(k1);
                    break;

                case 0: // '\0'
                case 1: // '\001'
                case 2: // '\002'
                    startScrollIfNeeded(k1);
                    break;
                }
                break;

            case 0: // '\0'
                if (sDbgMotion || sDbgDataChange)
                    Xlog.d("AbsListView", (new StringBuilder()).append("Touch down: touch mode = ").append(mTouchMode).append(",mScrollY = ").append(super.mScrollY).append(",y = ").append(motionevent.getY()).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mActivePointerId = ").append(mActivePointerId).append(",mDataChanged = ").append(super.mDataChanged).append(",adatper size = ").append(super.mItemCount).append(",this = ").append(this).toString());
                switch (mTouchMode)
                {
                case 6: // '\006'
                    mFlingRunnable.endFling();
                    if (mPositionScroller != null)
                        mPositionScroller.stop();
                    mTouchMode = 5;
                    mMotionX = (int)motionevent.getX();
                    int i1 = (int)motionevent.getY();
                    mLastY = i1;
                    mMotionY = i1;
                    mMotionCorrection = 0;
                    mActivePointerId = motionevent.getPointerId(0);
                    mDirection = 0;
                    break;

                default:
                    mActivePointerId = motionevent.getPointerId(0);
                    int j = (int)motionevent.getX();
                    int k = (int)motionevent.getY();
                    int l = pointToPosition(j, k);
                    if (!super.mDataChanged)
                        if (mTouchMode != 4 && l >= 0 && ((ListAdapter)getAdapter()).isEnabled(l))
                        {
                            mTouchMode = 0;
                            if (mPendingCheckForTap == null)
                            {
                                CheckForTap checkfortap = new CheckForTap();
                                mPendingCheckForTap = checkfortap;
                            }
                            postDelayed(mPendingCheckForTap, ViewConfiguration.getTapTimeout());
                        } else
                        if (mTouchMode == 4)
                        {
                            createScrollingCache();
                            mTouchMode = 3;
                            mMotionCorrection = 0;
                            l = findMotionRow(k);
                            mFlingRunnable.flywheelTouch();
                        }
                    if (l >= 0)
                        mMotionViewOriginalTop = getChildAt(l - super.mFirstPosition).getTop();
                    mMotionX = j;
                    mMotionY = k;
                    mMotionPosition = l;
                    mLastY = 0x80000000;
                    if (sDbgMotion)
                        Xlog.d("AbsListView", (new StringBuilder()).append("Touch down: touch mode = ").append(mTouchMode).append(",mMotionY = ").append(mMotionY).append(",mMotionPosition = ").append(mMotionPosition).append(",mFirstPosition = ").append(super.mFirstPosition).toString());
                    break;
                }
                if (performButtonActionOnTouchDown(motionevent) && mTouchMode == 0)
                    removeCallbacks(mPendingCheckForTap);
                break;
            }
            return true;
        }
        Xlog.w("AbsListView", (new StringBuilder()).append("Intent to operate on non-exist data, childcount = ").append(getChildCount()).append(",mFirstPosition = ").append(super.mFirstPosition).append(",adapter count = ").append(super.mItemCount).append(",action = ").append(i).append(",mActivePointerId = ").append(mActivePointerId).append(",mScrollY = ").append(super.mScrollY).append(",this = ").append(this).toString());
        if ((i & 0xff) == 6)
            onSecondaryPointerUp(motionevent);
        return true;
    }

    public void onTouchModeChanged(boolean flag)
    {
        if (flag)
        {
            hideSelector();
            if (getHeight() > 0 && getChildCount() > 0)
                layoutChildren();
            updateSelectorState();
        } else
        {
            int i = mTouchMode;
            if (i == 5 || i == 6)
            {
                if (mFlingRunnable != null)
                    mFlingRunnable.endFling();
                if (mPositionScroller != null)
                    mPositionScroller.stop();
                if (super.mScrollY != 0)
                {
                    super.mScrollY = 0;
                    invalidateParentCaches();
                    finishGlows();
                    invalidate();
                    return;
                }
            }
        }
    }

    public void onWindowFocusChanged(boolean flag)
    {
        onWindowFocusChanged(flag);
        int i;
        if (isInTouchMode())
            i = 0;
        else
            i = 1;
        if (!flag)
        {
            setChildrenDrawingCacheEnabled(false);
            if (mFlingRunnable != null)
            {
                removeCallbacks(mFlingRunnable);
                mFlingRunnable.endFling();
                if (mPositionScroller != null)
                    mPositionScroller.stop();
                if (super.mScrollY != 0)
                {
                    super.mScrollY = 0;
                    invalidateParentCaches();
                    finishGlows();
                    invalidate();
                }
            }
            dismissPopup();
            if (i == 1)
                mResurrectToPosition = super.mSelectedPosition;
            if (mFastScroller != null)
                mFastScroller.resetDraggingStateIfNecessary();
        } else
        {
            if (isShown() && mFiltered && !mPopupHidden)
                showPopup();
            if (i != mLastTouchMode && mLastTouchMode != -1)
                if (i == 1)
                {
                    resurrectSelection();
                } else
                {
                    hideSelector();
                    mLayoutMode = 0;
                    layoutChildren();
                }
        }
        mLastTouchMode = i;
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (performAccessibilityAction(i, bundle))
            return true;
        switch (i)
        {
        case 8192: 
            if (isEnabled() && super.mFirstPosition > 0)
            {
                smoothScrollBy(-(getHeight() - mListPadding.top - mListPadding.bottom), 200);
                return true;
            } else
            {
                return false;
            }

        case 4096: 
            if (isEnabled() && getLastVisiblePosition() < -1 + getCount())
            {
                smoothScrollBy(getHeight() - mListPadding.top - mListPadding.bottom, 200);
                return true;
            } else
            {
                return false;
            }
        }
        return false;
    }

    public boolean performItemClick(View view, int i, long l)
    {
        boolean flag = true;
        int j = mChoiceMode;
        boolean flag1 = false;
        if (j != 0)
        {
            flag1 = true;
            boolean flag3;
            if (mChoiceMode != 2 && (mChoiceMode != 3 || mChoiceActionMode == null))
            {
                int k = mChoiceMode;
                flag3 = false;
                if (k == 1)
                {
                    boolean flag4;
                    if (!mCheckStates.get(i, false))
                        flag4 = true;
                    else
                        flag4 = false;
                    if (flag4)
                    {
                        mCheckStates.clear();
                        mCheckStates.put(i, true);
                        if (mCheckedIdStates != null && mAdapter.hasStableIds())
                        {
                            mCheckedIdStates.clear();
                            mCheckedIdStates.put(mAdapter.getItemId(i), Integer.valueOf(i));
                        }
                        mCheckedItemCount = 1;
                    } else
                    if (mCheckStates.size() == 0 || !mCheckStates.valueAt(0))
                        mCheckedItemCount = 0;
                    flag3 = true;
                }
            } else
            {
                boolean flag2;
                if (!mCheckStates.get(i, false))
                    flag2 = true;
                else
                    flag2 = false;
                mCheckStates.put(i, flag2);
                if (mCheckedIdStates != null && mAdapter.hasStableIds())
                    if (flag2)
                        mCheckedIdStates.put(mAdapter.getItemId(i), Integer.valueOf(i));
                    else
                        mCheckedIdStates.delete(mAdapter.getItemId(i));
                if (flag2)
                    mCheckedItemCount = 1 + mCheckedItemCount;
                else
                    mCheckedItemCount = -1 + mCheckedItemCount;
                if (mChoiceActionMode != null)
                {
                    mMultiChoiceModeCallback.onItemCheckedStateChanged(mChoiceActionMode, i, l, flag2);
                    flag = false;
                }
                flag3 = true;
            }
            if (flag3)
                updateOnScreenCheckedViews();
        }
        if (flag)
            flag1 |= performItemClick(view, i, l);
        return flag1;
    }

    boolean performLongPress(View view, int i, long l)
    {
        boolean flag = true;
        if (mChoiceMode == 3)
        {
            if (mChoiceActionMode == null)
            {
                ActionMode actionmode = startActionMode(mMultiChoiceModeCallback);
                mChoiceActionMode = actionmode;
                if (actionmode != null)
                {
                    setItemChecked(i, flag);
                    performHapticFeedback(0);
                }
            }
        } else
        {
            AdapterView.OnItemLongClickListener onitemlongclicklistener = super.mOnItemLongClickListener;
            flag = false;
            if (onitemlongclicklistener != null)
                flag = super.mOnItemLongClickListener.onItemLongClick(this, view, i, l);
            if (!flag)
            {
                mContextMenuInfo = createContextMenuInfo(view, i, l);
                flag = showContextMenuForChild(this);
            }
            if (flag)
            {
                performHapticFeedback(0);
                return flag;
            }
        }
        return flag;
    }

    public int pointToPosition(int i, int j)
    {
        Rect rect = mTouchFrame;
        if (rect == null)
        {
            mTouchFrame = new Rect();
            rect = mTouchFrame;
        }
        for (int k = -1 + getChildCount(); k >= 0; k--)
        {
            View view = getChildAt(k);
            if (view.getVisibility() != 0)
                continue;
            view.getHitRect(rect);
            if (rect.contains(i, j))
                return k + super.mFirstPosition;
        }

        return -1;
    }

    public long pointToRowId(int i, int j)
    {
        int k = pointToPosition(i, j);
        if (k >= 0)
            return mAdapter.getItemId(k);
        else
            return 0x8000000000000000L;
    }

    void positionSelector(int i, View view)
    {
        if (i != -1)
            mSelectorPosition = i;
        Rect rect = mSelectorRect;
        rect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        if (view instanceof SelectionBoundsAdjuster)
            ((SelectionBoundsAdjuster)view).adjustListItemSelectionBounds(rect);
        positionSelector(rect.left, rect.top, rect.right, rect.bottom);
        boolean flag = mIsChildViewEnabled;
        if (view.isEnabled() != flag)
        {
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            mIsChildViewEnabled = flag1;
            if (getSelectedItemPosition() != -1)
                refreshDrawableState();
        }
    }

    public void reclaimViews(List list)
    {
        int i = getChildCount();
        RecyclerListener recyclerlistener = mRecycler.mRecyclerListener;
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams == null || !mRecycler.shouldRecycleViewType(layoutparams.viewType))
                continue;
            list.add(view);
            view.setAccessibilityDelegate(null);
            if (recyclerlistener != null)
                recyclerlistener.onMovedToScrapHeap(view);
        }

        mRecycler.reclaimScrapViews(list);
        removeAllViewsInLayout();
    }

    int reconcileSelectedPosition()
    {
        int i = super.mSelectedPosition;
        if (i < 0)
            i = mResurrectToPosition;
        return Math.min(Math.max(0, i), -1 + super.mItemCount);
    }

    void reportScrollStateChange(int i)
    {
        if (i != mLastScrollState && mOnScrollListener != null)
        {
            mLastScrollState = i;
            mOnScrollListener.onScrollStateChanged(this, i);
        }
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
        if (flag)
            recycleVelocityTracker();
        requestDisallowInterceptTouchEvent(flag);
    }

    public void requestLayout()
    {
        if (!super.mBlockLayoutRequests && !super.mInLayout)
            requestLayout();
    }

    void requestLayoutIfNecessary()
    {
        if (getChildCount() > 0)
        {
            resetList();
            requestLayout();
            invalidate();
        }
    }

    void resetList()
    {
        removeAllViewsInLayout();
        super.mFirstPosition = 0;
        super.mDataChanged = false;
        mPositionScrollAfterLayout = null;
        super.mNeedSync = false;
        mPendingSync = null;
        super.mOldSelectedPosition = -1;
        super.mOldSelectedRowId = 0x8000000000000000L;
        setSelectedPositionInt(-1);
        setNextSelectedPositionInt(-1);
        mSelectedTop = 0;
        mSelectorPosition = -1;
        mSelectorRect.setEmpty();
        invalidate();
    }

    boolean resurrectSelection()
    {
        int i;
        int j;
        int k;
        int l;
        int i1;
        int j1;
        boolean flag;
        i = getChildCount();
        if (i <= 0)
            return false;
        j = 0;
        k = mListPadding.top;
        l = super.mBottom - super.mTop - mListPadding.bottom;
        i1 = super.mFirstPosition;
        j1 = mResurrectToPosition;
        flag = true;
        if (j1 < i1 || j1 >= i1 + i) goto _L2; else goto _L1
_L1:
        int l1;
        l1 = j1;
        View view1 = getChildAt(l1 - super.mFirstPosition);
        j = view1.getTop();
        int k3 = view1.getBottom();
        if (j < k)
            j = k + getVerticalFadingEdgeLength();
        else
        if (k3 > l)
            j = l - view1.getMeasuredHeight() - getVerticalFadingEdgeLength();
          goto _L3
_L2:
        if (j1 >= i1) goto _L5; else goto _L4
_L4:
        l1 = i1;
        int i3 = 0;
        do
        {
            if (i3 >= i)
                break;
            int j3 = getChildAt(i3).getTop();
            if (i3 == 0)
            {
                j = j3;
                if (i1 > 0 || j3 < k)
                    k += getVerticalFadingEdgeLength();
            }
            if (j3 >= k)
            {
                l1 = i1 + i3;
                j = j3;
                break;
            }
            i3++;
        } while (true);
          goto _L3
_L5:
        int k1;
        int i2;
        k1 = super.mItemCount;
        l1 = -1 + (i1 + i);
        i2 = i - 1;
_L10:
        flag = false;
        if (i2 < 0) goto _L3; else goto _L6
_L6:
        int k2;
        int l2;
        View view = getChildAt(i2);
        k2 = view.getTop();
        l2 = view.getBottom();
        if (i2 == i - 1)
        {
            j = k2;
            if (i1 + i < k1 || l2 > l)
                l -= getVerticalFadingEdgeLength();
        }
        if (l2 > l) goto _L8; else goto _L7
_L7:
        l1 = i1 + i2;
        j = k2;
        flag = false;
_L3:
        mResurrectToPosition = -1;
        removeCallbacks(mFlingRunnable);
        if (mPositionScroller != null)
            mPositionScroller.stop();
        mTouchMode = -1;
        clearScrollingCache();
        super.mSpecificTop = j;
        int j2 = lookForSelectablePosition(l1, flag);
        if (j2 >= i1 && j2 <= getLastVisiblePosition())
        {
            mLayoutMode = 4;
            updateSelectorState();
            setSelectionInt(j2);
            invokeOnItemScrollListener();
        } else
        {
            j2 = -1;
        }
        reportScrollStateChange(0);
        return j2 >= 0;
_L8:
        i2--;
        if (true) goto _L10; else goto _L9
_L9:
    }

    boolean resurrectSelectionIfNeeded()
    {
        if (super.mSelectedPosition < 0 && resurrectSelection())
        {
            updateSelectorState();
            return true;
        } else
        {
            return false;
        }
    }

    public void sendAccessibilityEvent(int i)
    {
        if (i == 4096)
        {
            int j = getFirstVisiblePosition();
            int k = getLastVisiblePosition();
            if (mLastAccessibilityScrollEventFromIndex == j && mLastAccessibilityScrollEventToIndex == k)
                return;
            mLastAccessibilityScrollEventFromIndex = j;
            mLastAccessibilityScrollEventToIndex = k;
        }
        sendAccessibilityEvent(i);
    }

    boolean sendToTextFilter(int i, int j, KeyEvent keyevent)
    {
        boolean flag1;
        if (!acceptFilter())
        {
            flag1 = false;
        } else
        {
            boolean flag = true;
            flag1 = false;
            switch (i)
            {
            case 62: // '>'
                flag = mFiltered;
                flag1 = false;
                break;

            case 4: // '\004'
                boolean flag2 = mFiltered;
                flag1 = false;
                if (flag2)
                {
                    PopupWindow popupwindow = mPopup;
                    flag1 = false;
                    if (popupwindow != null)
                    {
                        boolean flag3 = mPopup.isShowing();
                        flag1 = false;
                        if (flag3)
                            if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
                            {
                                android.view.KeyEvent.DispatcherState dispatcherstate = getKeyDispatcherState();
                                if (dispatcherstate != null)
                                    dispatcherstate.startTracking(keyevent, this);
                                flag1 = true;
                            } else
                            {
                                int k = keyevent.getAction();
                                flag1 = false;
                                if (k == 1)
                                {
                                    boolean flag4 = keyevent.isTracking();
                                    flag1 = false;
                                    if (flag4)
                                    {
                                        boolean flag5 = keyevent.isCanceled();
                                        flag1 = false;
                                        if (!flag5)
                                        {
                                            flag1 = true;
                                            mTextFilter.setText("");
                                        }
                                    }
                                }
                            }
                    }
                }
                flag = false;
                break;

            case 19: // '\023'
            case 20: // '\024'
            case 21: // '\025'
            case 22: // '\026'
            case 23: // '\027'
            case 66: // 'B'
                flag1 = false;
                flag = false;
                break;
            }
            if (flag)
            {
                createTextFilter(true);
                KeyEvent keyevent1 = keyevent;
                if (keyevent1.getRepeatCount() > 0)
                    keyevent1 = KeyEvent.changeTimeRepeat(keyevent, keyevent.getEventTime(), 0);
                switch (keyevent.getAction())
                {
                case 2: // '\002'
                    return mTextFilter.onKeyMultiple(i, j, keyevent);

                case 1: // '\001'
                    return mTextFilter.onKeyUp(i, keyevent1);

                case 0: // '\0'
                    return mTextFilter.onKeyDown(i, keyevent1);
                }
                return flag1;
            }
        }
        return flag1;
    }

    public volatile void setAdapter(Adapter adapter)
    {
        setAdapter((ListAdapter)adapter);
    }

    public void setAdapter(ListAdapter listadapter)
    {
        if (listadapter != null)
        {
            mAdapterHasStableIds = mAdapter.hasStableIds();
            if (mChoiceMode != 0 && mAdapterHasStableIds && mCheckedIdStates == null)
                mCheckedIdStates = new LongSparseArray();
        }
        if (mCheckStates != null)
            mCheckStates.clear();
        if (mCheckedIdStates != null)
            mCheckedIdStates.clear();
    }

    public void setCacheColorHint(int i)
    {
        if (i != mCacheColorHint)
        {
            mCacheColorHint = i;
            int j = getChildCount();
            for (int k = 0; k < j; k++)
                getChildAt(k).setDrawingCacheBackgroundColor(i);

            mRecycler.setCacheColorHint(i);
        }
    }

    public void setChoiceMode(int i)
    {
        mChoiceMode = i;
        if (mChoiceActionMode != null)
        {
            mChoiceActionMode.finish();
            mChoiceActionMode = null;
        }
        if (mChoiceMode != 0)
        {
            if (mCheckStates == null)
                mCheckStates = new SparseBooleanArray();
            if (mCheckedIdStates == null && mAdapter != null && mAdapter.hasStableIds())
                mCheckedIdStates = new LongSparseArray();
            if (mChoiceMode == 3)
            {
                clearChoices();
                setLongClickable(true);
            }
        }
    }

    public void setDrawSelectorOnTop(boolean flag)
    {
        mDrawSelectorOnTop = flag;
    }

    public void setFastScrollAlwaysVisible(boolean flag)
    {
        if (flag && !mFastScrollEnabled)
            setFastScrollEnabled(true);
        if (mFastScroller != null)
            mFastScroller.setAlwaysShow(flag);
        computeOpaqueFlags();
        recomputePadding();
    }

    public void setFastScrollEnabled(boolean flag)
    {
        mFastScrollEnabled = flag;
        if (flag)
        {
            if (mFastScroller == null)
                mFastScroller = new FastScroller(getContext(), this);
        } else
        if (mFastScroller != null)
        {
            mFastScroller.stop();
            mFastScroller = null;
            return;
        }
    }

    public void setFastScrollerPopupSize(int i, int j)
    {
        if (mFastScroller != null)
        {
            mFastScroller.setOverlayDrawableSize(i, j);
            return;
        } else
        {
            Xlog.i("AbsListView", "Can not set pop up size since FastScroller is not enabled.");
            return;
        }
    }

    public void setFastScrollerPopupTextColor(int i)
    {
        if (mFastScroller != null)
        {
            mFastScroller.setTextPaintColor(i);
            return;
        } else
        {
            Xlog.i("AbsListView", "Can not set pop up text color since FastScroller is not enabled.");
            return;
        }
    }

    public void setFastScrollerPopupTextSize(int i)
    {
        if (mFastScroller != null)
        {
            mFastScroller.setTextPaintSize(i);
            return;
        } else
        {
            Xlog.i("AbsListView", "Can not set pop up text size since FastScroller is not enabled.");
            return;
        }
    }

    public void setFilterText(String s)
    {
        if (mTextFilterEnabled && !TextUtils.isEmpty(s))
        {
            createTextFilter(false);
            mTextFilter.setText(s);
            if (mAdapter instanceof Filterable)
            {
                if (mPopup == null)
                    ((Filterable)mAdapter).getFilter().filter(s);
                mFiltered = true;
                mDataSetObserver.clearSavedState();
            }
        }
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        boolean flag = setFrame(i, j, k, l);
        if (flag)
        {
            boolean flag1;
            if (getWindowVisibility() == 0)
                flag1 = true;
            else
                flag1 = false;
            if (mFiltered && flag1 && mPopup != null && mPopup.isShowing())
                positionPopup();
        }
        return flag;
    }

    public void setFriction(float f)
    {
        if (mFlingRunnable == null)
            mFlingRunnable = new FlingRunnable();
        mFlingRunnable.mScroller.setFriction(f);
    }

    public void setItemChecked(int i, boolean flag)
    {
label0:
        {
            if (mChoiceMode != 0)
            {
                if (flag && mChoiceMode == 3 && mChoiceActionMode == null)
                {
                    if (mMultiChoiceModeCallback == null || !mMultiChoiceModeCallback.hasWrappedCallback())
                        break label0;
                    mChoiceActionMode = startActionMode(mMultiChoiceModeCallback);
                }
                if (mChoiceMode != 2 && mChoiceMode != 3)
                {
                    boolean flag2;
                    if (mCheckedIdStates != null && mAdapter.hasStableIds())
                        flag2 = true;
                    else
                        flag2 = false;
                    if (flag || isItemChecked(i))
                    {
                        mCheckStates.clear();
                        if (flag2)
                            mCheckedIdStates.clear();
                    }
                    if (flag)
                    {
                        mCheckStates.put(i, true);
                        if (flag2)
                            mCheckedIdStates.put(mAdapter.getItemId(i), Integer.valueOf(i));
                        mCheckedItemCount = 1;
                    } else
                    if (mCheckStates.size() == 0 || !mCheckStates.valueAt(0))
                        mCheckedItemCount = 0;
                } else
                {
                    boolean flag1 = mCheckStates.get(i);
                    mCheckStates.put(i, flag);
                    if (mCheckedIdStates != null && mAdapter.hasStableIds())
                        if (flag)
                            mCheckedIdStates.put(mAdapter.getItemId(i), Integer.valueOf(i));
                        else
                            mCheckedIdStates.delete(mAdapter.getItemId(i));
                    if (flag1 != flag)
                        if (flag)
                            mCheckedItemCount = 1 + mCheckedItemCount;
                        else
                            mCheckedItemCount = -1 + mCheckedItemCount;
                    if (mChoiceActionMode != null)
                    {
                        long l = mAdapter.getItemId(i);
                        mMultiChoiceModeCallback.onItemCheckedStateChanged(mChoiceActionMode, i, l, flag);
                    }
                }
                if (!super.mInLayout && !super.mBlockLayoutRequests)
                {
                    super.mDataChanged = true;
                    rememberSyncState();
                    requestLayout();
                    return;
                }
            }
            return;
        }
        throw new IllegalStateException("AbsListView: attempted to start selection mode for CHOICE_MODE_MULTIPLE_MODAL but no choice mode callback was supplied. Call setMultiChoiceModeListener to set a callback.");
    }

    public void setMultiChoiceModeListener(MultiChoiceModeListener multichoicemodelistener)
    {
        if (mMultiChoiceModeCallback == null)
            mMultiChoiceModeCallback = new MultiChoiceModeWrapper();
        mMultiChoiceModeCallback.setWrapped(multichoicemodelistener);
    }

    public void setOnScrollListener(OnScrollListener onscrolllistener)
    {
        mOnScrollListener = onscrolllistener;
        invokeOnItemScrollListener();
    }

    public void setOverScrollEffectPadding(int i, int j)
    {
        mGlowPaddingLeft = i;
        mGlowPaddingRight = j;
    }

    public void setOverScrollMode(int i)
    {
        if (i != 2)
        {
            if (mEdgeGlowTop == null)
            {
                Context context = getContext();
                mEdgeGlowTop = new EdgeEffect(context);
                mEdgeGlowBottom = new EdgeEffect(context);
            }
        } else
        {
            mEdgeGlowTop = null;
            mEdgeGlowBottom = null;
        }
        setOverScrollMode(i);
    }

    public void setRecyclerListener(RecyclerListener recyclerlistener)
    {
        mRecycler.mRecyclerListener = recyclerlistener;
    }

    public void setRemoteViewsAdapter(Intent intent)
    {
        if (mRemoteAdapter == null || !(new FilterComparison(intent)).equals(new FilterComparison(mRemoteAdapter.getRemoteViewsServiceIntent())))
        {
            mDeferNotifyDataSetChanged = false;
            mRemoteAdapter = new RemoteViewsAdapter(getContext(), intent, this);
            if (mRemoteAdapter.isDataReady())
            {
                setAdapter(mRemoteAdapter);
                return;
            }
        }
    }

    public void setRemoteViewsOnClickHandler(RemoteViews.OnClickHandler onclickhandler)
    {
        if (mRemoteAdapter != null)
            mRemoteAdapter.setRemoteViewsOnClickHandler(onclickhandler);
    }

    public void setScrollIndicators(View view, View view1)
    {
        mScrollUp = view;
        mScrollDown = view1;
    }

    public void setScrollingCacheEnabled(boolean flag)
    {
        if (mScrollingCacheEnabled && !flag)
            clearScrollingCache();
        mScrollingCacheEnabled = flag;
    }

    abstract void setSelectionInt(int i);

    public void setSelector(int i)
    {
        setSelector(getResources().getDrawable(i));
    }

    public void setSelector(Drawable drawable)
    {
        if (mSelector != null)
        {
            mSelector.setCallback(null);
            unscheduleDrawable(mSelector);
        }
        mSelector = drawable;
        Rect rect = new Rect();
        drawable.getPadding(rect);
        mSelectionLeftPadding = rect.left;
        mSelectionTopPadding = rect.top;
        mSelectionRightPadding = rect.right;
        mSelectionBottomPadding = rect.bottom;
        drawable.setCallback(this);
        updateSelectorState();
    }

    public void setSmoothScrollbarEnabled(boolean flag)
    {
        mSmoothScrollbarEnabled = flag;
    }

    public void setStackFromBottom(boolean flag)
    {
        if (mStackFromBottom != flag)
        {
            mStackFromBottom = flag;
            requestLayoutIfNecessary();
        }
    }

    public void setTextFilterEnabled(boolean flag)
    {
        mTextFilterEnabled = flag;
    }

    public void setTranscriptMode(int i)
    {
        mTranscriptMode = i;
    }

    public void setVelocityScale(float f)
    {
        mVelocityScale = f;
    }

    public void setVerticalScrollbarPosition(int i)
    {
        setVerticalScrollbarPosition(i);
        if (mFastScroller != null)
            mFastScroller.setScrollbarPosition(i);
    }

    void setVisibleRangeHint(int i, int j)
    {
        if (mRemoteAdapter != null)
            mRemoteAdapter.setVisibleRangeHint(i, j);
    }

    boolean shouldShowSelector()
    {
        return hasFocus() && !isInTouchMode() || touchModeDrawsInPressedState();
    }

    public boolean showContextMenu(float f, float f1, int i)
    {
        int j = pointToPosition((int)f, (int)f1);
        if (j != -1)
        {
            long l = mAdapter.getItemId(j);
            View view = getChildAt(j - super.mFirstPosition);
            if (view != null)
            {
                mContextMenuInfo = createContextMenuInfo(view, j, l);
                return showContextMenuForChild(this);
            }
        }
        return showContextMenu(f, f1, i);
    }

    public boolean showContextMenuForChild(View view)
    {
        int i = getPositionForView(view);
        if (i >= 0)
        {
            long l = mAdapter.getItemId(i);
            AdapterView.OnItemLongClickListener onitemlongclicklistener = super.mOnItemLongClickListener;
            boolean flag = false;
            if (onitemlongclicklistener != null)
                flag = super.mOnItemLongClickListener.onItemLongClick(this, view, i, l);
            if (!flag)
            {
                mContextMenuInfo = createContextMenuInfo(getChildAt(i - super.mFirstPosition), i, l);
                flag = showContextMenuForChild(view);
            }
            return flag;
        } else
        {
            return false;
        }
    }

    public void smoothScrollBy(int i, int j)
    {
        smoothScrollBy(i, j, false);
    }

    void smoothScrollBy(int i, int j, boolean flag)
    {
        if (mFlingRunnable == null)
            mFlingRunnable = new FlingRunnable();
        int k = super.mFirstPosition;
        int l = getChildCount();
        int i1 = k + l;
        int j1 = getPaddingTop();
        int k1 = getHeight() - getPaddingBottom();
        if (i != 0 && super.mItemCount != 0 && l != 0 && (k != 0 || getChildAt(0).getTop() != j1 || i >= 0) && (i1 != super.mItemCount || getChildAt(l - 1).getBottom() != k1 || i <= 0))
        {
            reportScrollStateChange(2);
            mFlingRunnable.startScroll(i, j, flag);
            return;
        }
        Xlog.i("AbsListView", (new StringBuilder()).append("smoothScrollBy: mScrollY = ").append(super.mScrollY).append(",distance = ").append(i).append(",mItemCount = ").append(super.mItemCount).append(",childCount = ").append(l).toString());
        mFlingRunnable.endFling();
        if (mPositionScroller != null)
            mPositionScroller.stop();
    }

    void smoothScrollByOffset(int i)
    {
        int j = -1;
        if (i < 0)
            j = getFirstVisiblePosition();
        else
        if (i > 0)
            j = getLastVisiblePosition();
        if (j > -1)
        {
            View view = getChildAt(j - getFirstVisiblePosition());
            if (view != null)
            {
                Rect rect = new Rect();
                if (view.getGlobalVisibleRect(rect))
                {
                    int k = view.getWidth() * view.getHeight();
                    float f = (float)(rect.width() * rect.height()) / (float)k;
                    if (i < 0 && f < 0.75F)
                        j++;
                    else
                    if (i > 0 && f < 0.75F)
                        j--;
                }
                smoothScrollToPosition(Math.max(0, Math.min(getCount(), j + i)));
            }
        }
    }

    public void smoothScrollToPosition(int i)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("smoothScrollToPosition: position = ").append(i).append(",mScrollY = ").append(super.mScrollY).append(",this = ").append(this).toString());
        if (mPositionScroller == null)
            mPositionScroller = new PositionScroller();
        mPositionScroller.start(i);
    }

    public void smoothScrollToPosition(int i, int j)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("smoothScrollToPosition: position = ").append(i).append(",boundPosition = ").append(j).append(",mPositionScroller = ").append(mPositionScroller).append(",mScrollY = ").append(super.mScrollY).append(",this = ").append(this).toString());
        if (mPositionScroller == null)
            mPositionScroller = new PositionScroller();
        mPositionScroller.start(i, j);
    }

    public void smoothScrollToPositionFromTop(int i, int j)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("smoothScrollToPositionFromTop: position = ").append(i).append(",offset = ").append(j).append(",mPositionScroller = ").append(mPositionScroller).append(",mScrollY = ").append(super.mScrollY).append(",this = ").append(this).toString());
        if (mPositionScroller == null)
            mPositionScroller = new PositionScroller();
        mPositionScroller.startWithOffset(i, j);
    }

    public void smoothScrollToPositionFromTop(int i, int j, int k)
    {
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("smoothScrollToPositionFromTop: position = ").append(i).append(",offset = ").append(j).append(",duration = ").append(k).append(",mScrollY = ").append(super.mScrollY).append(",this = ").append(this).toString());
        if (mPositionScroller == null)
            mPositionScroller = new PositionScroller();
        mPositionScroller.startWithOffset(i, j, k);
    }

    public void startSelctionActionMode()
    {
        if (mChoiceMode == 3 && mChoiceActionMode == null && mMultiChoiceModeCallback != null)
            mChoiceActionMode = startActionMode(mMultiChoiceModeCallback);
        if (!super.mInLayout && !super.mBlockLayoutRequests)
        {
            super.mDataChanged = true;
            rememberSyncState();
            requestLayout();
        }
    }

    boolean touchModeDrawsInPressedState()
    {
        switch (mTouchMode)
        {
        case 1: // '\001'
        case 2: // '\002'
            return true;
        }
        return false;
    }

    boolean trackMotionScroll(int i, int j)
    {
        int k = getChildCount();
        if (k == 0)
            return true;
        int l = getChildAt(0).getTop();
        int i1 = getChildAt(k - 1).getBottom();
        Rect rect = mListPadding;
        int j1 = 0x22 & super.mGroupFlags;
        int k1 = 0;
        int l1 = 0;
        if (j1 == 34)
        {
            l1 = rect.top;
            k1 = rect.bottom;
        }
        int i2 = l1 - l;
        int j2 = i1 - (getHeight() - k1);
        int k2 = getHeight() - super.mPaddingBottom - super.mPaddingTop;
        if (sDbgMotion)
            Xlog.d("AbsListView", (new StringBuilder()).append("trackMotionScroll: deltaY = ").append(i).append(",mScrollY = ").append(super.mScrollY).append(",incrementalDeltaY = ").append(j).append(",firstTop = ").append(l).append(",lastBottom = ").append(i1).append(",height = ").append(k2).append(",childCount = ").append(k).append(",spaceAbove = ").append(i2).append(",this = ").append(this).toString());
        int l2;
        if (i < 0)
            l2 = Math.max(-(k2 - 1), i);
        else
            l2 = Math.min(k2 - 1, i);
        int i3;
        if (j < 0)
            i3 = Math.max(-(k2 - 1), j);
        else
            i3 = Math.min(k2 - 1, j);
        int j3 = super.mFirstPosition;
        if (j3 == 0)
            mFirstPositionDistanceGuess = l - rect.top;
        else
            mFirstPositionDistanceGuess = i3 + mFirstPositionDistanceGuess;
        if (j3 + k == super.mItemCount)
            mLastPositionDistanceGuess = i1 + rect.bottom;
        else
            mLastPositionDistanceGuess = i3 + mLastPositionDistanceGuess;
        boolean flag;
        if (j3 == 0 && l >= rect.top && i3 >= 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (j3 + k == super.mItemCount && i1 <= getHeight() - rect.bottom && i3 <= 0)
            flag1 = true;
        else
            flag1 = false;
        if (!flag && !flag1)
        {
            boolean flag2;
            if (i3 < 0)
                flag2 = true;
            else
                flag2 = false;
            boolean flag3 = isInTouchMode();
            if (flag3)
                hideSelector();
            int k3 = getHeaderViewsCount();
            int l3 = super.mItemCount - getFooterViewsCount();
            int i4 = 0;
            int j4 = 0;
            if (flag2)
            {
                int i6 = -i3;
                if ((0x22 & super.mGroupFlags) == 34)
                    i6 += rect.top;
                int j6 = 0;
                do
                {
                    int k6 = j6;
                    i4 = 0;
                    if (k6 >= k)
                        break;
                    View view1 = getChildAt(j6);
                    int l6 = view1.getBottom();
                    int i7 = i6;
                    i4 = 0;
                    if (l6 >= i7)
                        break;
                    j4++;
                    int j7 = j3 + j6;
                    if (j7 >= k3 && j7 < l3)
                        mRecycler.addScrapView(view1, j7);
                    j6++;
                } while (true);
            } else
            {
                int k4 = getHeight() - i3;
                if ((0x22 & super.mGroupFlags) == 34)
                    k4 -= rect.bottom;
                for (int l4 = k - 1; l4 >= 0; l4--)
                {
                    View view = getChildAt(l4);
                    if (view.getTop() <= k4)
                        break;
                    i4 = l4;
                    j4++;
                    int l5 = j3 + l4;
                    if (l5 >= k3 && l5 < l3)
                        mRecycler.addScrapView(view, l5);
                }

            }
            mMotionViewNewTop = l2 + mMotionViewOriginalTop;
            super.mBlockLayoutRequests = true;
            if (j4 > 0)
            {
                detachViewsFromParent(i4, j4);
                mRecycler.removeSkippedScrap();
            }
            if (!awakenScrollBars())
                invalidate();
            offsetChildrenTopAndBottom(i3);
            if (flag2)
                super.mFirstPosition = j4 + super.mFirstPosition;
            int i5 = Math.abs(i3);
            if (i2 < i5 || j2 < i5)
                fillGap(flag2);
            if (!flag3 && super.mSelectedPosition != -1)
            {
                int k5 = super.mSelectedPosition - super.mFirstPosition;
                if (k5 >= 0 && k5 < getChildCount())
                    positionSelector(super.mSelectedPosition, getChildAt(k5));
            } else
            if (mSelectorPosition != -1)
            {
                int j5 = mSelectorPosition - super.mFirstPosition;
                if (j5 >= 0 && j5 < getChildCount())
                    positionSelector(-1, getChildAt(j5));
            } else
            {
                mSelectorRect.setEmpty();
            }
            super.mBlockLayoutRequests = false;
            invokeOnItemScrollListener();
            return false;
        }
        return i3 != 0;
    }

    void updateScrollIndicators()
    {
        if (mScrollUp != null)
        {
            boolean flag1;
            if (super.mFirstPosition > 0)
                flag1 = true;
            else
                flag1 = false;
            if (!flag1 && getChildCount() > 0)
                if (getChildAt(0).getTop() < mListPadding.top)
                    flag1 = true;
                else
                    flag1 = false;
            View view1 = mScrollUp;
            byte byte1;
            if (flag1)
                byte1 = 0;
            else
                byte1 = 4;
            view1.setVisibility(byte1);
        }
        if (mScrollDown != null)
        {
            int i = getChildCount();
            boolean flag;
            if (i + super.mFirstPosition < super.mItemCount)
                flag = true;
            else
                flag = false;
            if (!flag && i > 0)
                if (getChildAt(i - 1).getBottom() > super.mBottom - mListPadding.bottom)
                    flag = true;
                else
                    flag = false;
            View view = mScrollDown;
            byte byte0 = 0;
            if (!flag)
                byte0 = 4;
            view.setVisibility(byte0);
        }
    }

    void updateSelectorState()
    {
label0:
        {
            if (mSelector != null)
            {
                if (!shouldShowSelector())
                    break label0;
                mSelector.setState(getDrawableState());
            }
            return;
        }
        mSelector.setState(StateSet.NOTHING);
    }

    public boolean verifyDrawable(Drawable drawable)
    {
        return mSelector == drawable || verifyDrawable(drawable);
    }











/*
    static android.os.StrictMode.Span access$1802(AbsListView abslistview, android.os.StrictMode.Span span)
    {
        abslistview.mFlingStrictSpan = span;
        return span;
    }

*/












































/*
    static CheckForLongPress access$602(AbsListView abslistview, CheckForLongPress checkforlongpress)
    {
        abslistview.mPendingCheckForLongPress = checkforlongpress;
        return checkforlongpress;
    }

*/


    // Unreferenced inner class android/widget/AbsListView$FlingRunnable$1

/* anonymous class */

    // Unreferenced inner class android/widget/AbsListView$PositionScroller$1

/* anonymous class */
    class PositionScroller._cls1
        implements Runnable
    {

        final PositionScroller this$1;
        final int val$position;

        public void run()
        {
            start(position);
        }

            
            {
                this$1 = final_positionscroller;
                position = I.this;
                super();
            }
    }


    // Unreferenced inner class android/widget/AbsListView$PositionScroller$2

/* anonymous class */
    class PositionScroller._cls2
        implements Runnable
    {

        final PositionScroller this$1;
        final int val$boundPosition;
        final int val$position;

        public void run()
        {
            start(position, boundPosition);
        }

            
            {
                this$1 = final_positionscroller;
                position = i;
                boundPosition = I.this;
                super();
            }
    }


    // Unreferenced inner class android/widget/AbsListView$PositionScroller$3

/* anonymous class */
    class PositionScroller._cls3
        implements Runnable
    {

        final PositionScroller this$1;
        final int val$duration;
        final int val$position;
        final int val$postOffset;

        public void run()
        {
            startWithOffset(position, postOffset, duration);
        }

            
            {
                this$1 = final_positionscroller;
                position = i;
                postOffset = j;
                duration = I.this;
                super();
            }
    }

}
