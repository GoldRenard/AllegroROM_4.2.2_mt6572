// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.*;
import android.content.Context;
import android.content.res.Resources;
import android.os.*;
import android.preference.PreferenceActivity;
import android.text.format.DateUtils;
import android.text.format.Formatter;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.util.MemInfoReader;
import java.util.*;

// Referenced classes of package com.android.settings.applications:
//            RunningServiceDetails, RunningState, LinearColorBar

public class RunningProcessesView extends FrameLayout
    implements android.widget.AdapterView.OnItemClickListener, android.widget.AbsListView.RecyclerListener, RunningState.OnRefreshUiListener
{
    public static class ActiveItem
    {

        long mFirstRunTime;
        ViewHolder mHolder;
        RunningState.BaseItem mItem;
        View mRootView;
        android.app.ActivityManager.RunningServiceInfo mService;
        boolean mSetBackground;

        void updateTime(Context context, StringBuilder stringbuilder)
        {
            TextView textview;
label0:
            {
                if (mItem instanceof RunningState.ServiceItem)
                {
                    textview = mHolder.size;
                } else
                {
                    String s;
                    if (mItem.mSizeStr != null)
                        s = mItem.mSizeStr;
                    else
                        s = "";
                    if (!s.equals(mItem.mCurSizeStr))
                    {
                        mItem.mCurSizeStr = s;
                        mHolder.size.setText(s);
                    }
                    if (mItem.mBackground)
                    {
                        boolean flag3 = mSetBackground;
                        textview = null;
                        if (!flag3)
                        {
                            mSetBackground = true;
                            mHolder.uptime.setText("");
                            textview = null;
                        }
                    } else
                    {
                        boolean flag = mItem instanceof RunningState.MergedItem;
                        textview = null;
                        if (flag)
                            textview = mHolder.uptime;
                    }
                }
                if (textview != null)
                {
                    mSetBackground = false;
                    if (mFirstRunTime < 0L)
                        break label0;
                    textview.setText(DateUtils.formatElapsedTime(stringbuilder, (SystemClock.elapsedRealtime() - mFirstRunTime) / 1000L));
                }
                return;
            }
            boolean flag1 = mItem instanceof RunningState.MergedItem;
            boolean flag2 = false;
            if (flag1)
                if (((RunningState.MergedItem)mItem).mServices.size() > 0)
                    flag2 = true;
                else
                    flag2 = false;
            if (flag2)
            {
                textview.setText(context.getResources().getText(0x7f0b0699));
                return;
            } else
            {
                textview.setText("");
                return;
            }
        }

    }

    class ServiceListAdapter extends BaseAdapter
    {

        final LayoutInflater mInflater;
        final ArrayList mItems = new ArrayList();
        ArrayList mOrigItems;
        boolean mShowBackground;
        final RunningState mState;
        final RunningProcessesView this$0;

        public boolean areAllItemsEnabled()
        {
            return false;
        }

        public void bindView(View view, int i)
        {
label0:
            {
                synchronized (mState.mLock)
                {
                    if (i < mItems.size())
                        break label0;
                }
                return;
            }
            ViewHolder viewholder = (ViewHolder)view.getTag();
            RunningState.MergedItem mergeditem = (RunningState.MergedItem)mItems.get(i);
            ActiveItem activeitem = viewholder.bind(mState, mergeditem, mBuilder);
            mActiveItems.put(view, activeitem);
            obj;
            JVM INSTR monitorexit ;
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int getCount()
        {
            return mItems.size();
        }

        public Object getItem(int i)
        {
            return mItems.get(i);
        }

        public long getItemId(int i)
        {
            return (long)((RunningState.MergedItem)mItems.get(i)).hashCode();
        }

        boolean getShowBackground()
        {
            return mShowBackground;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            View view1;
            if (view == null)
                view1 = newView(viewgroup);
            else
                view1 = view;
            bindView(view1, i);
            return view1;
        }

        public boolean hasStableIds()
        {
            return true;
        }

        public boolean isEmpty()
        {
            return mState.hasData() && mItems.size() == 0;
        }

        public boolean isEnabled(int i)
        {
            if (i >= mItems.size())
                return false;
            boolean flag;
            if (!((RunningState.BaseItem) ((RunningState.MergedItem)mItems.get(i))).mIsProcess)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public View newView(ViewGroup viewgroup)
        {
            View view = mInflater.inflate(0x7f040081, viewgroup, false);
            new ViewHolder(view);
            return view;
        }

        void refreshItems()
        {
            ArrayList arraylist;
            if (mShowBackground)
                arraylist = mState.getCurrentBackgroundItems();
            else
                arraylist = mState.getCurrentMergedItems();
            if (mOrigItems != arraylist)
            {
                mOrigItems = arraylist;
                if (arraylist == null)
                {
                    mItems.clear();
                } else
                {
                    mItems.clear();
                    mItems.addAll(arraylist);
                    if (mShowBackground)
                    {
                        Collections.sort(mItems, mState.mBackgroundComparator);
                        return;
                    }
                }
            }
        }

        void setShowBackground(boolean flag)
        {
            if (mShowBackground != flag)
            {
                mShowBackground = flag;
                mState.setWatchingBackgroundItems(flag);
                refreshItems();
                notifyDataSetChanged();
                mColorBar.setShowingGreen(mShowBackground);
            }
        }

        ServiceListAdapter(RunningState runningstate)
        {
            this$0 = RunningProcessesView.this;
            super();
            mState = runningstate;
            mInflater = (LayoutInflater)getContext().getSystemService("layout_inflater");
            refreshItems();
        }
    }

    static class TimeTicker extends TextView
    {

        public TimeTicker(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }

    public static class ViewHolder
    {

        public TextView description;
        public ImageView icon;
        public TextView name;
        public View rootView;
        public TextView size;
        public TextView uptime;

        public ActiveItem bind(RunningState runningstate, RunningState.BaseItem baseitem, StringBuilder stringbuilder)
        {
            Object obj = runningstate.mLock;
            obj;
            JVM INSTR monitorenter ;
            ActiveItem activeitem;
            android.content.pm.PackageManager packagemanager = rootView.getContext().getPackageManager();
            if (baseitem.mPackageInfo == null && (baseitem instanceof RunningState.MergedItem) && ((RunningState.MergedItem)baseitem).mProcess != null)
            {
                ((RunningState.MergedItem)baseitem).mProcess.ensureLabel(packagemanager);
                baseitem.mPackageInfo = ((RunningState.BaseItem) (((RunningState.MergedItem)baseitem).mProcess)).mPackageInfo;
                baseitem.mDisplayLabel = ((RunningState.BaseItem) (((RunningState.MergedItem)baseitem).mProcess)).mDisplayLabel;
            }
            name.setText(baseitem.mDisplayLabel);
            activeitem = new ActiveItem();
            activeitem.mRootView = rootView;
            activeitem.mItem = baseitem;
            activeitem.mHolder = this;
            activeitem.mFirstRunTime = baseitem.mActiveSince;
            if (!baseitem.mBackground)
                break MISSING_BLOCK_LABEL_212;
            description.setText(rootView.getContext().getText(0x7f0b069a));
_L1:
            baseitem.mCurSizeStr = null;
            icon.setImageDrawable(baseitem.loadIcon(rootView.getContext(), runningstate));
            icon.setVisibility(0);
            activeitem.updateTime(rootView.getContext(), stringbuilder);
            return activeitem;
            description.setText(baseitem.mDescription);
              goto _L1
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public ViewHolder(View view)
        {
            rootView = view;
            icon = (ImageView)view.findViewById(0x7f080023);
            name = (TextView)view.findViewById(0x7f08007a);
            description = (TextView)view.findViewById(0x7f08007b);
            size = (TextView)view.findViewById(0x7f08015d);
            uptime = (TextView)view.findViewById(0x7f080016);
            view.setTag(this);
        }
    }


    long SECONDARY_SERVER_MEM;
    final HashMap mActiveItems = new HashMap();
    ServiceListAdapter mAdapter;
    ActivityManager mAm;
    TextView mBackgroundProcessText;
    StringBuilder mBuilder;
    LinearColorBar mColorBar;
    Dialog mCurDialog;
    RunningState.BaseItem mCurSelected;
    Runnable mDataAvail;
    TextView mForegroundProcessText;
    long mLastAvailMemory;
    long mLastBackgroundProcessMemory;
    long mLastForegroundProcessMemory;
    int mLastNumBackgroundProcesses;
    int mLastNumForegroundProcesses;
    int mLastNumServiceProcesses;
    long mLastServiceProcessMemory;
    ListView mListView;
    MemInfoReader mMemInfoReader;
    final int mMyUserId = UserHandle.myUserId();
    Fragment mOwner;
    RunningState mState;

    public RunningProcessesView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mBuilder = new StringBuilder(128);
        mLastNumBackgroundProcesses = -1;
        mLastNumForegroundProcesses = -1;
        mLastNumServiceProcesses = -1;
        mLastBackgroundProcessMemory = -1L;
        mLastForegroundProcessMemory = -1L;
        mLastServiceProcessMemory = -1L;
        mLastAvailMemory = -1L;
        mMemInfoReader = new MemInfoReader();
    }

    private void startServiceDetailsActivity(RunningState.MergedItem mergeditem)
    {
        if (mOwner != null)
        {
            Bundle bundle = new Bundle();
            if (mergeditem.mProcess != null)
            {
                bundle.putInt("uid", mergeditem.mProcess.mUid);
                bundle.putString("process", mergeditem.mProcess.mProcessName);
            }
            bundle.putInt("user_id", ((RunningState.BaseItem) (mergeditem)).mUserId);
            bundle.putBoolean("background", mAdapter.mShowBackground);
            ((PreferenceActivity)mOwner.getActivity()).startPreferencePanel(com/android/settings/applications/RunningServiceDetails.getName(), bundle, 0x7f0b06a8, null, null, 0);
        }
    }

    public void doCreate(Bundle bundle)
    {
        mAm = (ActivityManager)getContext().getSystemService("activity");
        mState = RunningState.getInstance(getContext());
        ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(0x7f040082, this);
        mListView = (ListView)findViewById(0x102000a);
        View view = findViewById(0x1020004);
        if (view != null)
            mListView.setEmptyView(view);
        mListView.setOnItemClickListener(this);
        mListView.setRecyclerListener(this);
        mAdapter = new ServiceListAdapter(mState);
        mListView.setAdapter(mAdapter);
        mColorBar = (LinearColorBar)findViewById(0x7f08015e);
        mBackgroundProcessText = (TextView)findViewById(0x7f080160);
        mBackgroundProcessText.setOnClickListener(new android.view.View.OnClickListener() {

            final RunningProcessesView this$0;

            public void onClick(View view1)
            {
                mAdapter.setShowBackground(true);
            }

            
            {
                this$0 = RunningProcessesView.this;
                super();
            }
        }
);
        mForegroundProcessText = (TextView)findViewById(0x7f08015f);
        mForegroundProcessText.setOnClickListener(new android.view.View.OnClickListener() {

            final RunningProcessesView this$0;

            public void onClick(View view1)
            {
                mAdapter.setShowBackground(false);
            }

            
            {
                this$0 = RunningProcessesView.this;
                super();
            }
        }
);
        android.app.ActivityManager.MemoryInfo memoryinfo = new android.app.ActivityManager.MemoryInfo();
        mAm.getMemoryInfo(memoryinfo);
        SECONDARY_SERVER_MEM = memoryinfo.secondaryServerThreshold;
    }

    public void doPause()
    {
        mState.pause();
        mDataAvail = null;
        mOwner = null;
    }

    public boolean doResume(Fragment fragment, Runnable runnable)
    {
        mOwner = fragment;
        mState.resume(this);
        if (mState.hasData())
        {
            refreshUi(true);
            return true;
        } else
        {
            mDataAvail = runnable;
            return false;
        }
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        RunningState.MergedItem mergeditem = (RunningState.MergedItem)((ListView)adapterview).getAdapter().getItem(i);
        mCurSelected = mergeditem;
        startServiceDetailsActivity(mergeditem);
    }

    public void onMovedToScrapHeap(View view)
    {
        mActiveItems.remove(view);
    }

    public void onRefreshUi(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            refreshUi(true);
            updateTimes();
            return;

        case 1: // '\001'
            refreshUi(false);
            updateTimes();
            return;

        case 0: // '\0'
            updateTimes();
            return;
        }
    }

    void refreshUi(boolean flag)
    {
        long l2;
        long l3;
        if (flag)
        {
            ServiceListAdapter servicelistadapter = (ServiceListAdapter)(ServiceListAdapter)mListView.getAdapter();
            servicelistadapter.refreshItems();
            servicelistadapter.notifyDataSetChanged();
        }
        if (mDataAvail != null)
        {
            mDataAvail.run();
            mDataAvail = null;
        }
        mMemInfoReader.readMemInfo();
        long l = (mMemInfoReader.getFreeSize() + mMemInfoReader.getCachedSize()) - SECONDARY_SERVER_MEM;
        if (l < 0L)
            l = 0L;
        long l1 = Process.getZramExtraAvailableSize();
        l2 = l + l1;
        Log.i("RunningProcessView", (new StringBuilder()).append("extraAvailableSize = ").append(l1).toString());
        l3 = mMemInfoReader.getTotalSize();
        Object obj = mState.mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mLastNumBackgroundProcesses != mState.mNumBackgroundProcesses || mLastBackgroundProcessMemory != mState.mBackgroundProcessMemory || mLastAvailMemory != l2)
        {
            mLastNumBackgroundProcesses = mState.mNumBackgroundProcesses;
            mLastBackgroundProcessMemory = mState.mBackgroundProcessMemory;
            mLastAvailMemory = l2;
            long l4 = mLastAvailMemory + mLastBackgroundProcessMemory;
            String s = Formatter.formatShortFileSize(getContext(), l4);
            mBackgroundProcessText.setText(getResources().getString(0x7f0b069e, new Object[] {
                s
            }));
            String s1 = Formatter.formatShortFileSize(getContext(), l3 - l4);
            mForegroundProcessText.setText(getResources().getString(0x7f0b069f, new Object[] {
                s1
            }));
        }
        if (mLastNumForegroundProcesses != mState.mNumForegroundProcesses || mLastForegroundProcessMemory != mState.mForegroundProcessMemory || mLastNumServiceProcesses != mState.mNumServiceProcesses || mLastServiceProcessMemory != mState.mServiceProcessMemory)
        {
            mLastNumForegroundProcesses = mState.mNumForegroundProcesses;
            mLastForegroundProcessMemory = mState.mForegroundProcessMemory;
            mLastNumServiceProcesses = mState.mNumServiceProcesses;
            mLastServiceProcessMemory = mState.mServiceProcessMemory;
        }
        float f = l3;
        float f1 = l2 + mLastBackgroundProcessMemory + mLastServiceProcessMemory;
        Log.i("RunningProcessView", (new StringBuilder()).append("totalShownMem = ").append(mMemInfoReader.getFreeSize()).append(" + ").append(mMemInfoReader.getCachedSize()).append(" - ").append(SECONDARY_SERVER_MEM).append(" + ").append(mLastBackgroundProcessMemory).append(" + ").append(mLastServiceProcessMemory).toString());
        mColorBar.setRatios((f - f1) / f, (float)mLastServiceProcessMemory / f, (float)mLastBackgroundProcessMemory / f);
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void updateTimes()
    {
        for (Iterator iterator = mActiveItems.values().iterator(); iterator.hasNext();)
        {
            ActiveItem activeitem = (ActiveItem)iterator.next();
            if (activeitem.mRootView.getWindowToken() == null)
                iterator.remove();
            else
                activeitem.updateTime(getContext(), mBuilder);
        }

    }
}
