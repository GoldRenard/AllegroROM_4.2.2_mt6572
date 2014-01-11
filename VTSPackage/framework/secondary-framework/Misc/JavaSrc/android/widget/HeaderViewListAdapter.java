// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package android.widget:
//            WrapperListAdapter, Filterable, ListAdapter, Filter

public class HeaderViewListAdapter
    implements WrapperListAdapter, Filterable
{

    static final ArrayList EMPTY_INFO_LIST = new ArrayList();
    private final ListAdapter mAdapter;
    boolean mAreAllFixedViewsSelectable;
    ArrayList mFooterViewInfos;
    ArrayList mHeaderViewInfos;
    private final boolean mIsFilterable;

    public HeaderViewListAdapter(ArrayList arraylist, ArrayList arraylist1, ListAdapter listadapter)
    {
        mAdapter = listadapter;
        mIsFilterable = listadapter instanceof Filterable;
        if (arraylist == null)
            mHeaderViewInfos = EMPTY_INFO_LIST;
        else
            mHeaderViewInfos = arraylist;
        if (arraylist1 == null)
            mFooterViewInfos = EMPTY_INFO_LIST;
        else
            mFooterViewInfos = arraylist1;
        boolean flag;
        if (areAllListInfosSelectable(mHeaderViewInfos) && areAllListInfosSelectable(mFooterViewInfos))
            flag = true;
        else
            flag = false;
        mAreAllFixedViewsSelectable = flag;
    }

    private boolean areAllListInfosSelectable(ArrayList arraylist)
    {
label0:
        {
            if (arraylist == null)
                break label0;
            Iterator iterator = arraylist.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (((ListView.FixedViewInfo)iterator.next()).isSelectable);
            return false;
        }
        return true;
    }

    public boolean areAllItemsEnabled()
    {
        return mAdapter == null || mAreAllFixedViewsSelectable && mAdapter.areAllItemsEnabled();
    }

    public int getCount()
    {
        if (mAdapter != null)
            return getFootersCount() + getHeadersCount() + mAdapter.getCount();
        else
            return getFootersCount() + getHeadersCount();
    }

    public Filter getFilter()
    {
        if (mIsFilterable)
            return ((Filterable)mAdapter).getFilter();
        else
            return null;
    }

    public int getFootersCount()
    {
        return mFooterViewInfos.size();
    }

    public int getHeadersCount()
    {
        return mHeaderViewInfos.size();
    }

    public Object getItem(int i)
    {
        int j = getHeadersCount();
        if (i < j)
            return ((ListView.FixedViewInfo)mHeaderViewInfos.get(i)).data;
        int k = i - j;
        ListAdapter listadapter = mAdapter;
        int l = 0;
        if (listadapter != null)
        {
            l = mAdapter.getCount();
            if (k < l)
                return mAdapter.getItem(k);
        }
        return ((ListView.FixedViewInfo)mFooterViewInfos.get(k - l)).data;
    }

    public long getItemId(int i)
    {
        int j = getHeadersCount();
        if (mAdapter != null && i >= j)
        {
            int k = i - j;
            if (k < mAdapter.getCount())
                return mAdapter.getItemId(k);
        }
        return -1L;
    }

    public int getItemViewType(int i)
    {
        int j = getHeadersCount();
        if (mAdapter != null && i >= j)
        {
            int k = i - j;
            if (k < mAdapter.getCount())
                return mAdapter.getItemViewType(k);
        }
        return -2;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        int j = getHeadersCount();
        if (i < j)
            return ((ListView.FixedViewInfo)mHeaderViewInfos.get(i)).view;
        int k = i - j;
        ListAdapter listadapter = mAdapter;
        int l = 0;
        if (listadapter != null)
        {
            l = mAdapter.getCount();
            if (k < l)
                return mAdapter.getView(k, view, viewgroup);
        }
        return ((ListView.FixedViewInfo)mFooterViewInfos.get(k - l)).view;
    }

    public int getViewTypeCount()
    {
        if (mAdapter != null)
            return mAdapter.getViewTypeCount();
        else
            return 1;
    }

    public ListAdapter getWrappedAdapter()
    {
        return mAdapter;
    }

    public boolean hasStableIds()
    {
        if (mAdapter != null)
            return mAdapter.hasStableIds();
        else
            return false;
    }

    public boolean isEmpty()
    {
        return mAdapter == null || mAdapter.isEmpty();
    }

    public boolean isEnabled(int i)
    {
        int j = getHeadersCount();
        if (i < j)
            return ((ListView.FixedViewInfo)mHeaderViewInfos.get(i)).isSelectable;
        int k = i - j;
        ListAdapter listadapter = mAdapter;
        int l = 0;
        if (listadapter != null)
        {
            l = mAdapter.getCount();
            if (k < l)
                return mAdapter.isEnabled(k);
        }
        return ((ListView.FixedViewInfo)mFooterViewInfos.get(k - l)).isSelectable;
    }

    public void registerDataSetObserver(DataSetObserver datasetobserver)
    {
        if (mAdapter != null)
            mAdapter.registerDataSetObserver(datasetobserver);
    }

    public boolean removeFooter(View view)
    {
        for (int i = 0; i < mFooterViewInfos.size(); i++)
            if (((ListView.FixedViewInfo)mFooterViewInfos.get(i)).view == view)
            {
                mFooterViewInfos.remove(i);
                boolean flag = areAllListInfosSelectable(mHeaderViewInfos);
                boolean flag1 = false;
                if (flag)
                {
                    boolean flag2 = areAllListInfosSelectable(mFooterViewInfos);
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
                mAreAllFixedViewsSelectable = flag1;
                return true;
            }

        return false;
    }

    public boolean removeHeader(View view)
    {
        for (int i = 0; i < mHeaderViewInfos.size(); i++)
            if (((ListView.FixedViewInfo)mHeaderViewInfos.get(i)).view == view)
            {
                mHeaderViewInfos.remove(i);
                boolean flag = areAllListInfosSelectable(mHeaderViewInfos);
                boolean flag1 = false;
                if (flag)
                {
                    boolean flag2 = areAllListInfosSelectable(mFooterViewInfos);
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
                mAreAllFixedViewsSelectable = flag1;
                return true;
            }

        return false;
    }

    public void unregisterDataSetObserver(DataSetObserver datasetobserver)
    {
        if (mAdapter != null)
            mAdapter.unregisterDataSetObserver(datasetobserver);
    }

}
