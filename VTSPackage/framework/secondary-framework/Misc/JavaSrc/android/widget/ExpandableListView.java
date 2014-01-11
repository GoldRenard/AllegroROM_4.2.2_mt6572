// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.ArrayList;

// Referenced classes of package android.widget:
//            ListView, ExpandableListPosition, ExpandableListAdapter, AdapterView, 
//            ExpandableListConnector, AbsListView, ListAdapter, Adapter

public class ExpandableListView extends ListView
{
    public static class ExpandableListContextMenuInfo
        implements android.view.ContextMenu.ContextMenuInfo
    {

        public long id;
        public long packedPosition;
        public View targetView;

        public ExpandableListContextMenuInfo(View view, long l, long l1)
        {
            targetView = view;
            packedPosition = l;
            id = l1;
        }
    }

    public static interface OnChildClickListener
    {

        public abstract boolean onChildClick(ExpandableListView expandablelistview, View view, int i, int j, long l);
    }

    public static interface OnGroupClickListener
    {

        public abstract boolean onGroupClick(ExpandableListView expandablelistview, View view, int i, long l);
    }

    public static interface OnGroupCollapseListener
    {

        public abstract void onGroupCollapse(int i);
    }

    public static interface OnGroupExpandListener
    {

        public abstract void onGroupExpand(int i);
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
        ArrayList expandedGroupMetadataList;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeList(expandedGroupMetadataList);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            expandedGroupMetadataList = new ArrayList();
            parcel.readList(expandedGroupMetadataList, android/widget/ExpandableListConnector.getClassLoader());
        }


        SavedState(Parcelable parcelable, ArrayList arraylist)
        {
            super(parcelable);
            expandedGroupMetadataList = arraylist;
        }
    }


    public static final int CHILD_INDICATOR_INHERIT = -1;
    private static final int CHILD_LAST_STATE_SET[] = {
        0x10100a6
    };
    private static final int EMPTY_STATE_SET[];
    private static final int GROUP_EMPTY_STATE_SET[] = {
        0x10100a9
    };
    private static final int GROUP_EXPANDED_EMPTY_STATE_SET[] = {
        0x10100a8, 0x10100a9
    };
    private static final int GROUP_EXPANDED_STATE_SET[] = {
        0x10100a8
    };
    private static final int GROUP_STATE_SETS[][];
    private static final long PACKED_POSITION_INT_MASK_CHILD = -1L;
    private static final long PACKED_POSITION_INT_MASK_GROUP = 0x7fffffffL;
    private static final long PACKED_POSITION_MASK_CHILD = 0xffffffffL;
    private static final long PACKED_POSITION_MASK_GROUP = 0x7fffffff00000000L;
    private static final long PACKED_POSITION_MASK_TYPE = 0x8000000000000000L;
    private static final long PACKED_POSITION_SHIFT_GROUP = 32L;
    private static final long PACKED_POSITION_SHIFT_TYPE = 63L;
    public static final int PACKED_POSITION_TYPE_CHILD = 1;
    public static final int PACKED_POSITION_TYPE_GROUP = 0;
    public static final int PACKED_POSITION_TYPE_NULL = 2;
    public static final long PACKED_POSITION_VALUE_NULL = 0xffffffffL;
    private ExpandableListAdapter mAdapter;
    private Drawable mChildDivider;
    private Drawable mChildIndicator;
    private int mChildIndicatorLeft;
    private int mChildIndicatorRight;
    private ExpandableListConnector mConnector;
    private Drawable mGroupIndicator;
    private int mIndicatorLeft;
    private final Rect mIndicatorRect;
    private int mIndicatorRight;
    private OnChildClickListener mOnChildClickListener;
    private OnGroupClickListener mOnGroupClickListener;
    private OnGroupCollapseListener mOnGroupCollapseListener;
    private OnGroupExpandListener mOnGroupExpandListener;

    public ExpandableListView(Context context)
    {
        this(context, null);
    }

    public ExpandableListView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101006f);
    }

    public ExpandableListView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mIndicatorRect = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ExpandableListView, i, 0);
        mGroupIndicator = typedarray.getDrawable(0);
        mChildIndicator = typedarray.getDrawable(1);
        mIndicatorLeft = typedarray.getDimensionPixelSize(2, 0);
        mIndicatorRight = typedarray.getDimensionPixelSize(3, 0);
        if (mIndicatorRight == 0 && mGroupIndicator != null)
            mIndicatorRight = mIndicatorLeft + mGroupIndicator.getIntrinsicWidth();
        mChildIndicatorLeft = typedarray.getDimensionPixelSize(4, -1);
        mChildIndicatorRight = typedarray.getDimensionPixelSize(5, -1);
        mChildDivider = typedarray.getDrawable(6);
        typedarray.recycle();
    }

    private int getAbsoluteFlatPosition(int i)
    {
        return i + getHeaderViewsCount();
    }

    private long getChildOrGroupId(ExpandableListPosition expandablelistposition)
    {
        if (expandablelistposition.type == 1)
            return mAdapter.getChildId(expandablelistposition.groupPos, expandablelistposition.childPos);
        else
            return mAdapter.getGroupId(expandablelistposition.groupPos);
    }

    private int getFlatPositionForConnector(int i)
    {
        return i - getHeaderViewsCount();
    }

    private Drawable getIndicator(ExpandableListConnector.PositionMetadata positionmetadata)
    {
        boolean flag = true;
        Drawable drawable;
        if (positionmetadata.position.type == 2)
        {
            drawable = mGroupIndicator;
            if (drawable != null && drawable.isStateful())
            {
                boolean flag1;
                if (positionmetadata.groupMetadata != null && positionmetadata.groupMetadata.lastChildFlPos != positionmetadata.groupMetadata.flPos)
                    flag1 = false;
                else
                    flag1 = flag;
                if (!positionmetadata.isExpanded())
                    flag = false;
                byte byte0 = 0;
                if (flag1)
                    byte0 = 2;
                int i = flag | byte0;
                drawable.setState(GROUP_STATE_SETS[i]);
            }
        } else
        {
            drawable = mChildIndicator;
            if (drawable != null && drawable.isStateful())
            {
                int ai[];
                if (positionmetadata.position.flatListPos == positionmetadata.groupMetadata.lastChildFlPos)
                    ai = CHILD_LAST_STATE_SET;
                else
                    ai = EMPTY_STATE_SET;
                drawable.setState(ai);
                return drawable;
            }
        }
        return drawable;
    }

    public static int getPackedPositionChild(long l)
    {
        if (l != 0xffffffffL && (l & 0x8000000000000000L) == 0x8000000000000000L)
            return (int)(l & 0xffffffffL);
        else
            return -1;
    }

    public static long getPackedPositionForChild(int i, int j)
    {
        return 0x8000000000000000L | (0x7fffffffL & (long)i) << 32 | -1L & (long)j;
    }

    public static long getPackedPositionForGroup(int i)
    {
        return (0x7fffffffL & (long)i) << 32;
    }

    public static int getPackedPositionGroup(long l)
    {
        if (l == 0xffffffffL)
            return -1;
        else
            return (int)((0x7fffffff00000000L & l) >> 32);
    }

    public static int getPackedPositionType(long l)
    {
        if (l == 0xffffffffL)
            return 2;
        return (l & 0x8000000000000000L) != 0x8000000000000000L ? 0 : 1;
    }

    private boolean isHeaderOrFooterPosition(int i)
    {
        int j = super.mItemCount - getFooterViewsCount();
        return i < getHeaderViewsCount() || i >= j;
    }

    public boolean collapseGroup(int i)
    {
        boolean flag = mConnector.collapseGroup(i);
        if (mOnGroupCollapseListener != null)
            mOnGroupCollapseListener.onGroupCollapse(i);
        return flag;
    }

    android.view.ContextMenu.ContextMenuInfo createContextMenuInfo(View view, int i, long l)
    {
        if (isHeaderOrFooterPosition(i))
        {
            return new AdapterView.AdapterContextMenuInfo(view, i, l);
        } else
        {
            int j = getFlatPositionForConnector(i);
            ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getUnflattenedPos(j);
            ExpandableListPosition expandablelistposition = positionmetadata.position;
            long l1 = getChildOrGroupId(expandablelistposition);
            long l2 = expandablelistposition.getPackedPosition();
            positionmetadata.recycle();
            return new ExpandableListContextMenuInfo(view, l2, l1);
        }
    }

    protected void dispatchDraw(Canvas canvas)
    {
        super.dispatchDraw(canvas);
        if (mChildIndicator != null || mGroupIndicator != null)
        {
            boolean flag;
            if ((0x22 & super.mGroupFlags) == 34)
                flag = true;
            else
                flag = false;
            int i = 0;
            if (flag)
            {
                i = canvas.save();
                int i3 = super.mScrollX;
                int j3 = super.mScrollY;
                canvas.clipRect(i3 + super.mPaddingLeft, j3 + super.mPaddingTop, (i3 + super.mRight) - super.mLeft - super.mPaddingRight, (j3 + super.mBottom) - super.mTop - super.mPaddingBottom);
            }
            int j = getHeaderViewsCount();
            int k = -1 + (super.mItemCount - getFooterViewsCount() - j);
            int l = super.mBottom;
            int i1 = -4;
            Rect rect = mIndicatorRect;
            int j1 = getChildCount();
            int k1 = 0;
            for (int l1 = super.mFirstPosition - j; k1 < j1; l1++)
            {
                if (l1 >= 0)
                {
                    if (l1 > k)
                        break;
                    View view = getChildAt(k1);
                    int i2 = view.getTop();
                    int j2 = view.getBottom();
                    if (j2 >= 0 && i2 <= l)
                    {
                        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getUnflattenedPos(l1);
                        if (positionmetadata.position.type != i1)
                        {
                            if (positionmetadata.position.type == 1)
                            {
                                int k2;
                                if (mChildIndicatorLeft == -1)
                                    k2 = mIndicatorLeft;
                                else
                                    k2 = mChildIndicatorLeft;
                                rect.left = k2;
                                int l2;
                                if (mChildIndicatorRight == -1)
                                    l2 = mIndicatorRight;
                                else
                                    l2 = mChildIndicatorRight;
                                rect.right = l2;
                            } else
                            {
                                rect.left = mIndicatorLeft;
                                rect.right = mIndicatorRight;
                            }
                            rect.left = rect.left + super.mPaddingLeft;
                            rect.right = rect.right + super.mPaddingLeft;
                            i1 = positionmetadata.position.type;
                        }
                        if (rect.left != rect.right)
                        {
                            if (super.mStackFromBottom)
                            {
                                rect.top = i2;
                                rect.bottom = j2;
                            } else
                            {
                                rect.top = i2;
                                rect.bottom = j2;
                            }
                            Drawable drawable = getIndicator(positionmetadata);
                            if (drawable != null)
                            {
                                drawable.setBounds(rect);
                                drawable.draw(canvas);
                            }
                        }
                        positionmetadata.recycle();
                    }
                }
                k1++;
            }

            if (flag)
            {
                canvas.restoreToCount(i);
                return;
            }
        }
    }

    void drawDivider(Canvas canvas, Rect rect, int i)
    {
        ExpandableListConnector.PositionMetadata positionmetadata;
label0:
        {
            int j = i + super.mFirstPosition;
            if (j >= 0)
            {
                int k = getFlatPositionForConnector(j);
                positionmetadata = mConnector.getUnflattenedPos(k);
                if (positionmetadata.position.type == 1 || positionmetadata.isExpanded() && positionmetadata.groupMetadata.lastChildFlPos != positionmetadata.groupMetadata.flPos)
                    break label0;
                positionmetadata.recycle();
            }
            super.drawDivider(canvas, rect, j);
            return;
        }
        Drawable drawable = mChildDivider;
        drawable.setBounds(rect);
        drawable.draw(canvas);
        positionmetadata.recycle();
    }

    public boolean expandGroup(int i)
    {
        return expandGroup(i, false);
    }

    public boolean expandGroup(int i, boolean flag)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtain(2, i, -1, -1);
        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getFlattenedPos(expandablelistposition);
        expandablelistposition.recycle();
        boolean flag1 = mConnector.expandGroup(positionmetadata);
        if (mOnGroupExpandListener != null)
            mOnGroupExpandListener.onGroupExpand(i);
        if (flag)
        {
            int j = positionmetadata.position.flatListPos + getHeaderViewsCount();
            smoothScrollToPosition(j + mAdapter.getChildrenCount(i), j);
        }
        positionmetadata.recycle();
        return flag1;
    }

    public volatile Adapter getAdapter()
    {
        return getAdapter();
    }

    public ListAdapter getAdapter()
    {
        return super.getAdapter();
    }

    public ExpandableListAdapter getExpandableListAdapter()
    {
        return mAdapter;
    }

    public long getExpandableListPosition(int i)
    {
        if (isHeaderOrFooterPosition(i))
        {
            return 0xffffffffL;
        } else
        {
            int j = getFlatPositionForConnector(i);
            ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getUnflattenedPos(j);
            long l = positionmetadata.position.getPackedPosition();
            positionmetadata.recycle();
            return l;
        }
    }

    public int getFlatListPosition(long l)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtainPosition(l);
        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getFlattenedPos(expandablelistposition);
        expandablelistposition.recycle();
        int i = positionmetadata.position.flatListPos;
        positionmetadata.recycle();
        return getAbsoluteFlatPosition(i);
    }

    public long getSelectedId()
    {
        long l = getSelectedPosition();
        if (l == 0xffffffffL)
            return -1L;
        int i = getPackedPositionGroup(l);
        if (getPackedPositionType(l) == 0)
            return mAdapter.getGroupId(i);
        else
            return mAdapter.getChildId(i, getPackedPositionChild(l));
    }

    public long getSelectedPosition()
    {
        return getExpandableListPosition(getSelectedItemPosition());
    }

    boolean handleItemClick(View view, int i, long l)
    {
        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getUnflattenedPos(i);
        long l1 = getChildOrGroupId(positionmetadata.position);
        boolean flag;
        if (positionmetadata.position.type == 2)
        {
            if (mOnGroupClickListener != null && mOnGroupClickListener.onGroupClick(this, view, positionmetadata.position.groupPos, l1))
            {
                positionmetadata.recycle();
                return true;
            }
            if (positionmetadata.isExpanded())
            {
                mConnector.collapseGroup(positionmetadata);
                playSoundEffect(0);
                if (mOnGroupCollapseListener != null)
                    mOnGroupCollapseListener.onGroupCollapse(positionmetadata.position.groupPos);
            } else
            {
                mConnector.expandGroup(positionmetadata);
                playSoundEffect(0);
                if (mOnGroupExpandListener != null)
                    mOnGroupExpandListener.onGroupExpand(positionmetadata.position.groupPos);
                int j = positionmetadata.position.groupPos;
                int k = positionmetadata.position.flatListPos + getHeaderViewsCount();
                smoothScrollToPosition(k + mAdapter.getChildrenCount(j), k);
            }
            flag = true;
        } else
        {
            if (mOnChildClickListener != null)
            {
                playSoundEffect(0);
                return mOnChildClickListener.onChildClick(this, view, positionmetadata.position.groupPos, positionmetadata.position.childPos, l1);
            }
            flag = false;
        }
        positionmetadata.recycle();
        return flag;
    }

    public boolean isGroupExpanded(int i)
    {
        return mConnector.isGroupExpanded(i);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/ExpandableListView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/ExpandableListView.getName());
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
        } else
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            if (mConnector != null && savedstate.expandedGroupMetadataList != null)
            {
                mConnector.setExpandedGroupMetadataList(savedstate.expandedGroupMetadataList);
                return;
            }
        }
    }

    public Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        ArrayList arraylist;
        if (mConnector != null)
            arraylist = mConnector.getExpandedGroupMetadataList();
        else
            arraylist = null;
        return new SavedState(parcelable, arraylist);
    }

    public boolean performItemClick(View view, int i, long l)
    {
        if (isHeaderOrFooterPosition(i))
            return super.performItemClick(view, i, l);
        else
            return handleItemClick(view, getFlatPositionForConnector(i), l);
    }

    public volatile void setAdapter(Adapter adapter)
    {
        setAdapter((ListAdapter)adapter);
    }

    public void setAdapter(ExpandableListAdapter expandablelistadapter)
    {
        mAdapter = expandablelistadapter;
        if (expandablelistadapter != null)
            mConnector = new ExpandableListConnector(expandablelistadapter);
        else
            mConnector = null;
        super.setAdapter(mConnector);
    }

    public void setAdapter(ListAdapter listadapter)
    {
        throw new RuntimeException("For ExpandableListView, use setAdapter(ExpandableListAdapter) instead of setAdapter(ListAdapter)");
    }

    public void setChildDivider(Drawable drawable)
    {
        mChildDivider = drawable;
    }

    public void setChildIndicator(Drawable drawable)
    {
        mChildIndicator = drawable;
    }

    public void setChildIndicatorBounds(int i, int j)
    {
        mChildIndicatorLeft = i;
        mChildIndicatorRight = j;
    }

    public void setGroupIndicator(Drawable drawable)
    {
        mGroupIndicator = drawable;
        if (mIndicatorRight == 0 && mGroupIndicator != null)
            mIndicatorRight = mIndicatorLeft + mGroupIndicator.getIntrinsicWidth();
    }

    public void setIndicatorBounds(int i, int j)
    {
        mIndicatorLeft = i;
        mIndicatorRight = j;
    }

    public void setOnChildClickListener(OnChildClickListener onchildclicklistener)
    {
        mOnChildClickListener = onchildclicklistener;
    }

    public void setOnGroupClickListener(OnGroupClickListener ongroupclicklistener)
    {
        mOnGroupClickListener = ongroupclicklistener;
    }

    public void setOnGroupCollapseListener(OnGroupCollapseListener ongroupcollapselistener)
    {
        mOnGroupCollapseListener = ongroupcollapselistener;
    }

    public void setOnGroupExpandListener(OnGroupExpandListener ongroupexpandlistener)
    {
        mOnGroupExpandListener = ongroupexpandlistener;
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener onitemclicklistener)
    {
        super.setOnItemClickListener(onitemclicklistener);
    }

    public boolean setSelectedChild(int i, int j, boolean flag)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtainChildPosition(i, j);
        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getFlattenedPos(expandablelistposition);
        if (positionmetadata == null)
        {
            if (!flag)
                return false;
            expandGroup(i);
            positionmetadata = mConnector.getFlattenedPos(expandablelistposition);
            if (positionmetadata == null)
                throw new IllegalStateException("Could not find child");
        }
        super.setSelection(getAbsoluteFlatPosition(positionmetadata.position.flatListPos));
        expandablelistposition.recycle();
        positionmetadata.recycle();
        return true;
    }

    public void setSelectedGroup(int i)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtainGroupPosition(i);
        ExpandableListConnector.PositionMetadata positionmetadata = mConnector.getFlattenedPos(expandablelistposition);
        expandablelistposition.recycle();
        super.setSelection(getAbsoluteFlatPosition(positionmetadata.position.flatListPos));
        positionmetadata.recycle();
    }

    static 
    {
        EMPTY_STATE_SET = new int[0];
        int ai[][] = new int[4][];
        ai[0] = EMPTY_STATE_SET;
        ai[1] = GROUP_EXPANDED_STATE_SET;
        ai[2] = GROUP_EMPTY_STATE_SET;
        ai[3] = GROUP_EXPANDED_EMPTY_STATE_SET;
        GROUP_STATE_SETS = ai;
    }
}
