// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.Bundle;
import android.os.Handler;
import android.view.*;
import android.view.animation.AnimationUtils;
import android.widget.*;

// Referenced classes of package android.app:
//            Fragment

public class ListFragment extends Fragment
{

    ListAdapter mAdapter;
    CharSequence mEmptyText;
    View mEmptyView;
    private final Handler mHandler = new Handler();
    ListView mList;
    View mListContainer;
    boolean mListShown;
    private final android.widget.AdapterView.OnItemClickListener mOnClickListener = new android.widget.AdapterView.OnItemClickListener() {

        final ListFragment this$0;

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            onListItemClick((ListView)adapterview, view, i, l);
        }

            
            {
                this$0 = ListFragment.this;
                super();
            }
    }
;
    View mProgressContainer;
    private final Runnable mRequestFocus = new Runnable() {

        final ListFragment this$0;

        public void run()
        {
            mList.focusableViewAvailable(mList);
        }

            
            {
                this$0 = ListFragment.this;
                super();
            }
    }
;
    TextView mStandardEmptyView;


    private void ensureList()
    {
        if (mList != null)
            return;
        View view = getView();
        if (view == null)
            throw new IllegalStateException("Content view not yet created");
        if (view instanceof ListView)
        {
            mList = (ListView)view;
        } else
        {
            mStandardEmptyView = (TextView)view.findViewById(0x1020316);
            if (mStandardEmptyView == null)
                mEmptyView = view.findViewById(0x1020004);
            else
                mStandardEmptyView.setVisibility(8);
            mProgressContainer = view.findViewById(0x1020314);
            mListContainer = view.findViewById(0x1020315);
            View view1 = view.findViewById(0x102000a);
            if (!(view1 instanceof ListView))
                throw new RuntimeException("Content has view with id attribute 'android.R.id.list' that is not a ListView class");
            mList = (ListView)view1;
            if (mList == null)
                throw new RuntimeException("Your content must have a ListView whose id attribute is 'android.R.id.list'");
            if (mEmptyView != null)
                mList.setEmptyView(mEmptyView);
            else
            if (mEmptyText != null)
            {
                mStandardEmptyView.setText(mEmptyText);
                mList.setEmptyView(mStandardEmptyView);
            }
        }
        mListShown = true;
        mList.setOnItemClickListener(mOnClickListener);
        if (mAdapter != null)
        {
            ListAdapter listadapter = mAdapter;
            mAdapter = null;
            setListAdapter(listadapter);
        } else
        if (mProgressContainer != null)
            setListShown(false, false);
        mHandler.post(mRequestFocus);
    }

    private void setListShown(boolean flag, boolean flag1)
    {
        ensureList();
        if (mProgressContainer == null)
            throw new IllegalStateException("Can't be used with a custom content view");
        if (mListShown == flag)
            return;
        mListShown = flag;
        if (flag)
        {
            if (flag1)
            {
                mProgressContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 0x10a0001));
                mListContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 0x10a0000));
            } else
            {
                mProgressContainer.clearAnimation();
                mListContainer.clearAnimation();
            }
            mProgressContainer.setVisibility(8);
            mListContainer.setVisibility(0);
            return;
        }
        if (flag1)
        {
            mProgressContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 0x10a0000));
            mListContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 0x10a0001));
        } else
        {
            mProgressContainer.clearAnimation();
            mListContainer.clearAnimation();
        }
        mProgressContainer.setVisibility(0);
        mListContainer.setVisibility(8);
    }

    public ListAdapter getListAdapter()
    {
        return mAdapter;
    }

    public ListView getListView()
    {
        ensureList();
        return mList;
    }

    public long getSelectedItemId()
    {
        ensureList();
        return mList.getSelectedItemId();
    }

    public int getSelectedItemPosition()
    {
        ensureList();
        return mList.getSelectedItemPosition();
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        return layoutinflater.inflate(0x1090014, viewgroup, false);
    }

    public void onDestroyView()
    {
        mHandler.removeCallbacks(mRequestFocus);
        mList = null;
        mListShown = false;
        mListContainer = null;
        mProgressContainer = null;
        mEmptyView = null;
        mStandardEmptyView = null;
        super.onDestroyView();
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
    }

    public void onViewCreated(View view, Bundle bundle)
    {
        super.onViewCreated(view, bundle);
        ensureList();
    }

    public void setEmptyText(CharSequence charsequence)
    {
        ensureList();
        if (mStandardEmptyView == null)
            throw new IllegalStateException("Can't be used with a custom content view");
        mStandardEmptyView.setText(charsequence);
        if (mEmptyText == null)
            mList.setEmptyView(mStandardEmptyView);
        mEmptyText = charsequence;
    }

    public void setListAdapter(ListAdapter listadapter)
    {
        boolean flag;
        if (mAdapter != null)
            flag = true;
        else
            flag = false;
        mAdapter = listadapter;
        if (mList != null)
        {
            mList.setAdapter(listadapter);
            if (!mListShown && !flag)
            {
                android.os.IBinder ibinder = getView().getWindowToken();
                boolean flag1 = false;
                if (ibinder != null)
                    flag1 = true;
                setListShown(true, flag1);
            }
        }
    }

    public void setListShown(boolean flag)
    {
        setListShown(flag, true);
    }

    public void setListShownNoAnimation(boolean flag)
    {
        setListShown(flag, false);
    }

    public void setSelection(int i)
    {
        ensureList();
        mList.setSelection(i);
    }
}
