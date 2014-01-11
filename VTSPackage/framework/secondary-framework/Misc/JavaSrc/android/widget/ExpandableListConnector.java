// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.database.DataSetObserver;
import android.os.*;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collections;

// Referenced classes of package android.widget:
//            BaseAdapter, Filterable, ExpandableListAdapter, ExpandableListPosition, 
//            HeterogeneousExpandableList, Filter

class ExpandableListConnector extends BaseAdapter
    implements Filterable
{
    static class GroupMetadata
        implements Parcelable, Comparable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public GroupMetadata createFromParcel(Parcel parcel)
            {
                return GroupMetadata.obtain(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readLong());
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public GroupMetadata[] newArray(int i)
            {
                return new GroupMetadata[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        static final int REFRESH = -1;
        int flPos;
        long gId;
        int gPos;
        int lastChildFlPos;

        static GroupMetadata obtain(int i, int j, int k, long l)
        {
            GroupMetadata groupmetadata = new GroupMetadata();
            groupmetadata.flPos = i;
            groupmetadata.lastChildFlPos = j;
            groupmetadata.gPos = k;
            groupmetadata.gId = l;
            return groupmetadata;
        }

        public int compareTo(GroupMetadata groupmetadata)
        {
            if (groupmetadata == null)
                throw new IllegalArgumentException();
            else
                return gPos - groupmetadata.gPos;
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((GroupMetadata)obj);
        }

        public int describeContents()
        {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(flPos);
            parcel.writeInt(lastChildFlPos);
            parcel.writeInt(gPos);
            parcel.writeLong(gId);
        }


        private GroupMetadata()
        {
        }
    }

    protected class MyDataSetObserver extends DataSetObserver
    {

        final ExpandableListConnector this$0;

        public void onChanged()
        {
            refreshExpGroupMetadataList(true, true);
            notifyDataSetChanged();
        }

        public void onInvalidated()
        {
            refreshExpGroupMetadataList(true, true);
            notifyDataSetInvalidated();
        }

        protected MyDataSetObserver()
        {
            this$0 = ExpandableListConnector.this;
            super();
        }
    }

    public static class PositionMetadata
    {

        private static final int MAX_POOL_SIZE = 5;
        private static ArrayList sPool = new ArrayList(5);
        public int groupInsertIndex;
        public GroupMetadata groupMetadata;
        public ExpandableListPosition position;

        private static PositionMetadata getRecycledOrCreate()
        {
label0:
            {
                PositionMetadata positionmetadata1;
                synchronized (sPool)
                {
                    if (sPool.size() <= 0)
                        break label0;
                    positionmetadata1 = (PositionMetadata)sPool.remove(0);
                }
                positionmetadata1.resetState();
                return positionmetadata1;
            }
            PositionMetadata positionmetadata = new PositionMetadata();
            arraylist;
            JVM INSTR monitorexit ;
            return positionmetadata;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        static PositionMetadata obtain(int i, int j, int k, int l, GroupMetadata groupmetadata, int i1)
        {
            PositionMetadata positionmetadata = getRecycledOrCreate();
            positionmetadata.position = ExpandableListPosition.obtain(j, k, l, i);
            positionmetadata.groupMetadata = groupmetadata;
            positionmetadata.groupInsertIndex = i1;
            return positionmetadata;
        }

        private void resetState()
        {
            if (position != null)
            {
                position.recycle();
                position = null;
            }
            groupMetadata = null;
            groupInsertIndex = 0;
        }

        public boolean isExpanded()
        {
            return groupMetadata != null;
        }

        public void recycle()
        {
            resetState();
            synchronized (sPool)
            {
                if (sPool.size() < 5)
                    sPool.add(this);
            }
            return;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }


        private PositionMetadata()
        {
        }
    }


    private final DataSetObserver mDataSetObserver = new MyDataSetObserver();
    private ArrayList mExpGroupMetadataList;
    private ExpandableListAdapter mExpandableListAdapter;
    private int mMaxExpGroupCount;
    private int mTotalExpChildrenCount;

    public ExpandableListConnector(ExpandableListAdapter expandablelistadapter)
    {
        mMaxExpGroupCount = 0x7fffffff;
        mExpGroupMetadataList = new ArrayList();
        setExpandableListAdapter(expandablelistadapter);
    }

    private void refreshExpGroupMetadataList(boolean flag, boolean flag1)
    {
        ArrayList arraylist = mExpGroupMetadataList;
        int i = arraylist.size();
        int j = 0;
        mTotalExpChildrenCount = 0;
        if (flag1)
        {
            boolean flag2 = false;
            for (int k1 = i - 1; k1 >= 0; k1--)
            {
                GroupMetadata groupmetadata1 = (GroupMetadata)arraylist.get(k1);
                int l1 = findGroupPosition(groupmetadata1.gId, groupmetadata1.gPos);
                if (l1 == groupmetadata1.gPos)
                    continue;
                if (l1 == -1)
                {
                    arraylist.remove(k1);
                    i--;
                }
                groupmetadata1.gPos = l1;
                if (!flag2)
                    flag2 = true;
            }

            if (flag2)
                Collections.sort(arraylist);
        }
        int k = 0;
        for (int l = 0; l < i; l++)
        {
            GroupMetadata groupmetadata = (GroupMetadata)arraylist.get(l);
            int i1;
            if (groupmetadata.lastChildFlPos != -1 && !flag)
                i1 = groupmetadata.lastChildFlPos - groupmetadata.flPos;
            else
                i1 = mExpandableListAdapter.getChildrenCount(groupmetadata.gPos);
            mTotalExpChildrenCount = i1 + mTotalExpChildrenCount;
            int j1 = j + (groupmetadata.gPos - k);
            k = groupmetadata.gPos;
            groupmetadata.flPos = j1;
            j = j1 + i1;
            groupmetadata.lastChildFlPos = j;
        }

    }

    public boolean areAllItemsEnabled()
    {
        return mExpandableListAdapter.areAllItemsEnabled();
    }

    boolean collapseGroup(int i)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtain(2, i, -1, -1);
        PositionMetadata positionmetadata = getFlattenedPos(expandablelistposition);
        expandablelistposition.recycle();
        if (positionmetadata == null)
        {
            return false;
        } else
        {
            boolean flag = collapseGroup(positionmetadata);
            positionmetadata.recycle();
            return flag;
        }
    }

    boolean collapseGroup(PositionMetadata positionmetadata)
    {
        if (positionmetadata.groupMetadata == null)
        {
            return false;
        } else
        {
            mExpGroupMetadataList.remove(positionmetadata.groupMetadata);
            refreshExpGroupMetadataList(false, false);
            notifyDataSetChanged();
            mExpandableListAdapter.onGroupCollapsed(positionmetadata.groupMetadata.gPos);
            return true;
        }
    }

    boolean expandGroup(int i)
    {
        ExpandableListPosition expandablelistposition = ExpandableListPosition.obtain(2, i, -1, -1);
        PositionMetadata positionmetadata = getFlattenedPos(expandablelistposition);
        expandablelistposition.recycle();
        boolean flag = expandGroup(positionmetadata);
        positionmetadata.recycle();
        return flag;
    }

    boolean expandGroup(PositionMetadata positionmetadata)
    {
        if (positionmetadata.position.groupPos < 0)
            throw new RuntimeException("Need group");
        if (mMaxExpGroupCount != 0 && positionmetadata.groupMetadata == null)
        {
            if (mExpGroupMetadataList.size() >= mMaxExpGroupCount)
            {
                GroupMetadata groupmetadata1 = (GroupMetadata)mExpGroupMetadataList.get(0);
                int i = mExpGroupMetadataList.indexOf(groupmetadata1);
                collapseGroup(groupmetadata1.gPos);
                if (positionmetadata.groupInsertIndex > i)
                    positionmetadata.groupInsertIndex = -1 + positionmetadata.groupInsertIndex;
            }
            GroupMetadata groupmetadata = GroupMetadata.obtain(-1, -1, positionmetadata.position.groupPos, mExpandableListAdapter.getGroupId(positionmetadata.position.groupPos));
            mExpGroupMetadataList.add(positionmetadata.groupInsertIndex, groupmetadata);
            refreshExpGroupMetadataList(false, false);
            notifyDataSetChanged();
            mExpandableListAdapter.onGroupExpanded(groupmetadata.gPos);
            return true;
        } else
        {
            return false;
        }
    }

    int findGroupPosition(long l, int i)
    {
        int j = mExpandableListAdapter.getGroupCount();
        if (j == 0)
            return -1;
        if (l == 0x8000000000000000L)
            return -1;
        int k = Math.max(0, i);
        int i1 = Math.min(j - 1, k);
        long l1 = 100L + SystemClock.uptimeMillis();
        int j1 = i1;
        int k1 = i1;
        ExpandableListAdapter expandablelistadapter = getAdapter();
        boolean flag = false;
        if (expandablelistadapter == null)
            return -1;
        do
        {
            boolean flag1;
            boolean flag2;
label0:
            {
                if (SystemClock.uptimeMillis() <= l1)
                {
                    if (expandablelistadapter.getGroupId(i1) == l)
                        return i1;
                    if (k1 == j - 1)
                        flag1 = true;
                    else
                        flag1 = false;
                    if (j1 == 0)
                        flag2 = true;
                    else
                        flag2 = false;
                    if (!flag1 || !flag2)
                        break label0;
                }
                return -1;
            }
            if (!flag2 && (!flag || flag1))
            {
                if (flag1 || !flag && !flag2)
                {
                    i1 = --j1;
                    flag = true;
                }
            } else
            {
                i1 = ++k1;
                flag = false;
            }
        } while (true);
    }

    ExpandableListAdapter getAdapter()
    {
        return mExpandableListAdapter;
    }

    public int getCount()
    {
        return mExpandableListAdapter.getGroupCount() + mTotalExpChildrenCount;
    }

    ArrayList getExpandedGroupMetadataList()
    {
        return mExpGroupMetadataList;
    }

    public Filter getFilter()
    {
        ExpandableListAdapter expandablelistadapter = getAdapter();
        if (expandablelistadapter instanceof Filterable)
            return ((Filterable)expandablelistadapter).getFilter();
        else
            return null;
    }

    PositionMetadata getFlattenedPos(ExpandableListPosition expandablelistposition)
    {
        ArrayList arraylist;
        int j;
        int k;
        int l;
label0:
        {
            arraylist = mExpGroupMetadataList;
            int i = arraylist.size();
            j = i - 1;
            if (i == 0)
                return PositionMetadata.obtain(expandablelistposition.groupPos, expandablelistposition.type, expandablelistposition.groupPos, expandablelistposition.childPos, null, 0);
            k = 0;
            GroupMetadata groupmetadata2;
label1:
            do
            {
                for (l = 0; l <= j;)
                {
                    k = l + (j - l) / 2;
                    groupmetadata2 = (GroupMetadata)arraylist.get(k);
                    if (expandablelistposition.groupPos > groupmetadata2.gPos)
                    {
                        l = k + 1;
                    } else
                    {
                        if (expandablelistposition.groupPos >= groupmetadata2.gPos)
                            continue label1;
                        j = k - 1;
                    }
                }

                break label0;
            } while (expandablelistposition.groupPos != groupmetadata2.gPos);
            if (expandablelistposition.type == 2)
                return PositionMetadata.obtain(groupmetadata2.flPos, expandablelistposition.type, expandablelistposition.groupPos, expandablelistposition.childPos, groupmetadata2, k);
            if (expandablelistposition.type == 1)
                return PositionMetadata.obtain(1 + (groupmetadata2.flPos + expandablelistposition.childPos), expandablelistposition.type, expandablelistposition.groupPos, expandablelistposition.childPos, groupmetadata2, k);
            else
                return null;
        }
        if (expandablelistposition.type != 2)
            return null;
        if (l > k)
        {
            GroupMetadata groupmetadata1 = (GroupMetadata)arraylist.get(l - 1);
            return PositionMetadata.obtain(groupmetadata1.lastChildFlPos + (expandablelistposition.groupPos - groupmetadata1.gPos), expandablelistposition.type, expandablelistposition.groupPos, expandablelistposition.childPos, null, l);
        }
        if (j < k)
        {
            int i1 = j + 1;
            GroupMetadata groupmetadata = (GroupMetadata)arraylist.get(i1);
            return PositionMetadata.obtain(groupmetadata.flPos - (groupmetadata.gPos - expandablelistposition.groupPos), expandablelistposition.type, expandablelistposition.groupPos, expandablelistposition.childPos, null, i1);
        } else
        {
            return null;
        }
    }

    public Object getItem(int i)
    {
label0:
        {
            PositionMetadata positionmetadata = getUnflattenedPos(i);
            Object obj;
            if (positionmetadata.position.type == 2)
            {
                obj = mExpandableListAdapter.getGroup(positionmetadata.position.groupPos);
            } else
            {
                if (positionmetadata.position.type != 1)
                    break label0;
                obj = mExpandableListAdapter.getChild(positionmetadata.position.groupPos, positionmetadata.position.childPos);
            }
            positionmetadata.recycle();
            return obj;
        }
        throw new RuntimeException("Flat list position is of unknown type");
    }

    public long getItemId(int i)
    {
label0:
        {
            PositionMetadata positionmetadata = getUnflattenedPos(i);
            long l = mExpandableListAdapter.getGroupId(positionmetadata.position.groupPos);
            long l2;
            if (positionmetadata.position.type == 2)
            {
                l2 = mExpandableListAdapter.getCombinedGroupId(l);
            } else
            {
                if (positionmetadata.position.type != 1)
                    break label0;
                long l1 = mExpandableListAdapter.getChildId(positionmetadata.position.groupPos, positionmetadata.position.childPos);
                l2 = mExpandableListAdapter.getCombinedChildId(l, l1);
            }
            positionmetadata.recycle();
            return l2;
        }
        throw new RuntimeException("Flat list position is of unknown type");
    }

    public int getItemViewType(int i)
    {
        PositionMetadata positionmetadata = getUnflattenedPos(i);
        ExpandableListPosition expandablelistposition = positionmetadata.position;
        int j;
        if (mExpandableListAdapter instanceof HeterogeneousExpandableList)
        {
            HeterogeneousExpandableList heterogeneousexpandablelist = (HeterogeneousExpandableList)mExpandableListAdapter;
            if (expandablelistposition.type == 2)
                j = heterogeneousexpandablelist.getGroupType(expandablelistposition.groupPos);
            else
                j = heterogeneousexpandablelist.getChildType(expandablelistposition.groupPos, expandablelistposition.childPos) + heterogeneousexpandablelist.getGroupTypeCount();
        } else
        if (expandablelistposition.type == 2)
            j = 0;
        else
            j = 1;
        positionmetadata.recycle();
        return j;
    }

    PositionMetadata getUnflattenedPos(int i)
    {
label0:
        {
            ArrayList arraylist = mExpGroupMetadataList;
            int j = arraylist.size();
            int k = j - 1;
            if (j == 0)
                return PositionMetadata.obtain(i, 2, i, -1, null, 0);
            int l = 0;
            int i1;
            for (i1 = 0; i1 <= k;)
            {
                l = i1 + (k - i1) / 2;
                GroupMetadata groupmetadata2 = (GroupMetadata)arraylist.get(l);
                if (i > groupmetadata2.lastChildFlPos)
                    i1 = l + 1;
                else
                if (i < groupmetadata2.flPos)
                {
                    k = l - 1;
                } else
                {
                    if (i == groupmetadata2.flPos)
                        return PositionMetadata.obtain(i, 2, groupmetadata2.gPos, -1, groupmetadata2, l);
                    if (i <= groupmetadata2.lastChildFlPos)
                    {
                        int i2 = i - (1 + groupmetadata2.flPos);
                        return PositionMetadata.obtain(i, 1, groupmetadata2.gPos, i2, groupmetadata2, l);
                    }
                }
            }

            int k1;
            int l1;
            if (i1 > l)
            {
                GroupMetadata groupmetadata1 = (GroupMetadata)arraylist.get(i1 - 1);
                k1 = i1;
                l1 = (i - groupmetadata1.lastChildFlPos) + groupmetadata1.gPos;
            } else
            {
                if (k >= l)
                    break label0;
                int j1 = k + 1;
                GroupMetadata groupmetadata = (GroupMetadata)arraylist.get(j1);
                k1 = j1;
                l1 = groupmetadata.gPos - (groupmetadata.flPos - i);
            }
            return PositionMetadata.obtain(i, 2, l1, -1, null, k1);
        }
        throw new RuntimeException("Unknown state");
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
label0:
        {
            boolean flag = true;
            PositionMetadata positionmetadata = getUnflattenedPos(i);
            View view1;
            if (positionmetadata.position.type == 2)
            {
                view1 = mExpandableListAdapter.getGroupView(positionmetadata.position.groupPos, positionmetadata.isExpanded(), view, viewgroup);
            } else
            {
                if (positionmetadata.position.type != flag)
                    break label0;
                if (positionmetadata.groupMetadata.lastChildFlPos != i)
                    flag = false;
                view1 = mExpandableListAdapter.getChildView(positionmetadata.position.groupPos, positionmetadata.position.childPos, flag, view, viewgroup);
            }
            positionmetadata.recycle();
            return view1;
        }
        throw new RuntimeException("Flat list position is of unknown type");
    }

    public int getViewTypeCount()
    {
        if (mExpandableListAdapter instanceof HeterogeneousExpandableList)
        {
            HeterogeneousExpandableList heterogeneousexpandablelist = (HeterogeneousExpandableList)mExpandableListAdapter;
            return heterogeneousexpandablelist.getGroupTypeCount() + heterogeneousexpandablelist.getChildTypeCount();
        } else
        {
            return 2;
        }
    }

    public boolean hasStableIds()
    {
        return mExpandableListAdapter.hasStableIds();
    }

    public boolean isEmpty()
    {
        ExpandableListAdapter expandablelistadapter = getAdapter();
        if (expandablelistadapter != null)
            return expandablelistadapter.isEmpty();
        else
            return true;
    }

    public boolean isEnabled(int i)
    {
        PositionMetadata positionmetadata = getUnflattenedPos(i);
        ExpandableListPosition expandablelistposition = positionmetadata.position;
        boolean flag;
        if (expandablelistposition.type == 1)
            flag = mExpandableListAdapter.isChildSelectable(expandablelistposition.groupPos, expandablelistposition.childPos);
        else
            flag = true;
        positionmetadata.recycle();
        return flag;
    }

    public boolean isGroupExpanded(int i)
    {
        for (int j = -1 + mExpGroupMetadataList.size(); j >= 0; j--)
            if (((GroupMetadata)mExpGroupMetadataList.get(j)).gPos == i)
                return true;

        return false;
    }

    public void setExpandableListAdapter(ExpandableListAdapter expandablelistadapter)
    {
        if (mExpandableListAdapter != null)
            mExpandableListAdapter.unregisterDataSetObserver(mDataSetObserver);
        mExpandableListAdapter = expandablelistadapter;
        expandablelistadapter.registerDataSetObserver(mDataSetObserver);
    }

    void setExpandedGroupMetadataList(ArrayList arraylist)
    {
label0:
        {
            if (arraylist != null && mExpandableListAdapter != null)
            {
                int i = mExpandableListAdapter.getGroupCount();
                int j = -1 + arraylist.size();
                do
                {
                    if (j < 0)
                        break label0;
                    if (((GroupMetadata)arraylist.get(j)).gPos >= i)
                        break;
                    j--;
                } while (true);
            }
            return;
        }
        mExpGroupMetadataList = arraylist;
        refreshExpGroupMetadataList(true, false);
    }

    public void setMaxExpGroupCount(int i)
    {
        mMaxExpGroupCount = i;
    }

}
