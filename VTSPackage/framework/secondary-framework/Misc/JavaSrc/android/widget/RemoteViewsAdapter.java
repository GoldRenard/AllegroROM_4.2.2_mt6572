// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.*;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;
import com.android.internal.widget.IRemoteViewsFactory;
import com.android.internal.widget.LockPatternUtils;
import java.lang.ref.WeakReference;
import java.util.*;

// Referenced classes of package android.widget:
//            BaseAdapter, RemoteViews, TextView, FrameLayout

public class RemoteViewsAdapter extends BaseAdapter
    implements android.os.Handler.Callback
{
    private static class FixedSizeRemoteViewsCache
    {

        private static final String TAG = "FixedSizeRemoteViewsCache";
        private static final float sMaxCountSlackPercent = 0.75F;
        private static final int sMaxMemoryLimitInBytes = 0x200000;
        private HashMap mIndexMetaData;
        private HashMap mIndexRemoteViews;
        private int mLastRequestedIndex;
        private HashSet mLoadIndices;
        private int mMaxCount;
        private int mMaxCountSlack;
        private final RemoteViewsMetaData mMetaData = new RemoteViewsMetaData();
        private int mPreloadLowerBound;
        private int mPreloadUpperBound;
        private HashSet mRequestedIndices;
        private final RemoteViewsMetaData mTemporaryMetaData = new RemoteViewsMetaData();

        private int getFarthestPositionFrom(int i, ArrayList arraylist)
        {
            int j = 0;
            int k = -1;
            int l = 0;
            int i1 = -1;
            Iterator iterator = mIndexRemoteViews.keySet().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                int j1 = ((Integer)iterator.next()).intValue();
                int k1 = Math.abs(j1 - i);
                if (k1 > l && !arraylist.contains(Integer.valueOf(j1)))
                {
                    i1 = j1;
                    l = k1;
                }
                if (k1 >= j)
                {
                    k = j1;
                    j = k1;
                }
            } while (true);
            if (i1 > -1)
                return i1;
            else
                return k;
        }

        private int getRemoteViewsBitmapMemoryUsage()
        {
            int i = 0;
            Iterator iterator = mIndexRemoteViews.keySet().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                Integer integer = (Integer)iterator.next();
                RemoteViews remoteviews = (RemoteViews)mIndexRemoteViews.get(integer);
                if (remoteviews != null)
                    i += remoteviews.estimateMemoryUsage();
            } while (true);
            return i;
        }

        public void commitTemporaryMetaData()
        {
            RemoteViewsMetaData remoteviewsmetadata = mTemporaryMetaData;
            remoteviewsmetadata;
            JVM INSTR monitorenter ;
            synchronized (mMetaData)
            {
                mMetaData.set(mTemporaryMetaData);
            }
            remoteviewsmetadata;
            JVM INSTR monitorexit ;
            return;
            exception1;
            remoteviewsmetadata1;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            remoteviewsmetadata;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsMetaDataAt(int i)
        {
            return mIndexMetaData.containsKey(Integer.valueOf(i));
        }

        public boolean containsRemoteViewAt(int i)
        {
            return mIndexRemoteViews.containsKey(Integer.valueOf(i));
        }

        public RemoteViewsMetaData getMetaData()
        {
            return mMetaData;
        }

        public RemoteViewsIndexMetaData getMetaDataAt(int i)
        {
            if (mIndexMetaData.containsKey(Integer.valueOf(i)))
                return (RemoteViewsIndexMetaData)mIndexMetaData.get(Integer.valueOf(i));
            else
                return null;
        }

        public int[] getNextIndexToLoad()
        {
label0:
            {
                int ai2[];
                synchronized (mLoadIndices)
                {
                    if (mRequestedIndices.isEmpty())
                        break label0;
                    Integer integer1 = (Integer)mRequestedIndices.iterator().next();
                    mRequestedIndices.remove(integer1);
                    mLoadIndices.remove(integer1);
                    ai2 = new int[2];
                    ai2[0] = integer1.intValue();
                    ai2[1] = 1;
                }
                return ai2;
            }
            int ai1[];
            if (mLoadIndices.isEmpty())
                break MISSING_BLOCK_LABEL_144;
            Integer integer = (Integer)mLoadIndices.iterator().next();
            mLoadIndices.remove(integer);
            ai1 = new int[2];
            ai1[0] = integer.intValue();
            ai1[1] = 0;
            hashset;
            JVM INSTR monitorexit ;
            return ai1;
            exception;
            hashset;
            JVM INSTR monitorexit ;
            throw exception;
            int ai[] = {
                -1, 0
            };
            hashset;
            JVM INSTR monitorexit ;
            return ai;
        }

        public RemoteViews getRemoteViewsAt(int i)
        {
            if (mIndexRemoteViews.containsKey(Integer.valueOf(i)))
                return (RemoteViews)mIndexRemoteViews.get(Integer.valueOf(i));
            else
                return null;
        }

        public RemoteViewsMetaData getTemporaryMetaData()
        {
            return mTemporaryMetaData;
        }

        public void insert(int i, RemoteViews remoteviews, long l, ArrayList arraylist)
        {
            if (mIndexRemoteViews.size() >= mMaxCount)
                mIndexRemoteViews.remove(Integer.valueOf(getFarthestPositionFrom(i, arraylist)));
            int j;
            if (mLastRequestedIndex > -1)
                j = mLastRequestedIndex;
            else
                j = i;
            for (; getRemoteViewsBitmapMemoryUsage() >= 0x200000; mIndexRemoteViews.remove(Integer.valueOf(getFarthestPositionFrom(j, arraylist))));
            if (mIndexMetaData.containsKey(Integer.valueOf(i)))
                ((RemoteViewsIndexMetaData)mIndexMetaData.get(Integer.valueOf(i))).set(remoteviews, l);
            else
                mIndexMetaData.put(Integer.valueOf(i), new RemoteViewsIndexMetaData(remoteviews, l));
            mIndexRemoteViews.put(Integer.valueOf(i), remoteviews);
        }

        public boolean queuePositionsToBePreloadedFromRequestedPosition(int i)
        {
            int j;
            if (mPreloadLowerBound <= i && i <= mPreloadUpperBound && Math.abs(i - (mPreloadUpperBound + mPreloadLowerBound) / 2) < mMaxCountSlack)
                return false;
            synchronized (mMetaData)
            {
                j = mMetaData.count;
            }
            HashSet hashset = mLoadIndices;
            hashset;
            JVM INSTR monitorenter ;
            int l;
            int i1;
            mLoadIndices.clear();
            mLoadIndices.addAll(mRequestedIndices);
            int k = mMaxCount / 2;
            mPreloadLowerBound = i - k;
            mPreloadUpperBound = i + k;
            l = Math.max(0, mPreloadLowerBound);
            i1 = Math.min(mPreloadUpperBound, j - 1);
            int j1 = l;
_L2:
            if (j1 > i1)
                break; /* Loop/switch isn't completed */
            mLoadIndices.add(Integer.valueOf(j1));
            j1++;
            if (true) goto _L2; else goto _L1
            exception;
            remoteviewsmetadata;
            JVM INSTR monitorexit ;
            throw exception;
_L1:
            mLoadIndices.removeAll(mIndexRemoteViews.keySet());
            hashset;
            JVM INSTR monitorexit ;
            return true;
            Exception exception1;
            exception1;
            hashset;
            JVM INSTR monitorexit ;
            throw exception1;
        }

        public void queueRequestedPositionToLoad(int i)
        {
            mLastRequestedIndex = i;
            synchronized (mLoadIndices)
            {
                mRequestedIndices.add(Integer.valueOf(i));
                mLoadIndices.add(Integer.valueOf(i));
            }
            return;
            exception;
            hashset;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void reset()
        {
            mPreloadLowerBound = 0;
            mPreloadUpperBound = -1;
            mLastRequestedIndex = -1;
            mIndexRemoteViews.clear();
            mIndexMetaData.clear();
            synchronized (mLoadIndices)
            {
                mRequestedIndices.clear();
                mLoadIndices.clear();
            }
            return;
            exception;
            hashset;
            JVM INSTR monitorexit ;
            throw exception;
        }



        public FixedSizeRemoteViewsCache(int i)
        {
            mMaxCount = i;
            mMaxCountSlack = Math.round(0.75F * (float)(mMaxCount / 2));
            mPreloadLowerBound = 0;
            mPreloadUpperBound = -1;
            mIndexMetaData = new HashMap();
            mIndexRemoteViews = new HashMap();
            mRequestedIndices = new HashSet();
            mLastRequestedIndex = -1;
            mLoadIndices = new HashSet();
        }
    }

    public static interface RemoteAdapterConnectionCallback
    {

        public abstract void deferNotifyDataSetChanged();

        public abstract boolean onRemoteAdapterConnected();

        public abstract void onRemoteAdapterDisconnected();
    }

    private static class RemoteViewsAdapterServiceConnection extends com.android.internal.widget.IRemoteViewsAdapterConnection.Stub
    {

        private WeakReference mAdapter;
        private boolean mIsConnected;
        private boolean mIsConnecting;
        private IRemoteViewsFactory mRemoteViewsFactory;

        public void bind(Context context, int i, Intent intent)
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mIsConnecting;
            if (flag) goto _L2; else goto _L1
_L1:
            AppWidgetManager appwidgetmanager = AppWidgetManager.getInstance(context);
            if (Process.myUid() != 1000) goto _L4; else goto _L3
_L3:
            RemoteViewsAdapter remoteviewsadapter = (RemoteViewsAdapter)mAdapter.get();
            if (remoteviewsadapter == null) goto _L4; else goto _L5
_L5:
            appwidgetmanager.bindRemoteViewsService(i, intent, asBinder(), new UserHandle(remoteviewsadapter.mUserId));
_L6:
            mIsConnecting = true;
_L2:
            this;
            JVM INSTR monitorexit ;
            return;
_L4:
            appwidgetmanager.bindRemoteViewsService(i, intent, asBinder(), Process.myUserHandle());
              goto _L6
            Exception exception1;
            exception1;
            Log.e("RemoteViewsAdapterServiceConnection", (new StringBuilder()).append("bind(): ").append(exception1.getMessage()).toString());
            mIsConnecting = false;
            mIsConnected = false;
              goto _L2
            Exception exception;
            exception;
            throw exception;
              goto _L6
        }

        public IRemoteViewsFactory getRemoteViewsFactory()
        {
            this;
            JVM INSTR monitorenter ;
            IRemoteViewsFactory iremoteviewsfactory = mRemoteViewsFactory;
            this;
            JVM INSTR monitorexit ;
            return iremoteviewsfactory;
            Exception exception;
            exception;
            throw exception;
        }

        public boolean isConnected()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mIsConnected;
            this;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            throw exception;
        }

        public void onServiceConnected(IBinder ibinder)
        {
            this;
            JVM INSTR monitorenter ;
            RemoteViewsAdapter remoteviewsadapter;
            mRemoteViewsFactory = com.android.internal.widget.IRemoteViewsFactory.Stub.asInterface(ibinder);
            remoteviewsadapter = (RemoteViewsAdapter)mAdapter.get();
            if (remoteviewsadapter != null) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            remoteviewsadapter.mWorkerQueue.post(remoteviewsadapter. new Runnable() {

                final RemoteViewsAdapterServiceConnection this$0;
                final RemoteViewsAdapter val$adapter;

                public void run()
                {
                    if (!adapter.mNotifyDataSetChangedAfterOnServiceConnected) goto _L2; else goto _L1
_L1:
                    adapter.onNotifyDataSetChanged();
_L4:
                    adapter.enqueueDeferredUnbindServiceMessage();
                    mIsConnected = true;
                    mIsConnecting = false;
                    return;
_L2:
                    IRemoteViewsFactory iremoteviewsfactory = adapter.mServiceConnection.getRemoteViewsFactory();
                    try
                    {
                        if (!iremoteviewsfactory.isCreated())
                            iremoteviewsfactory.onDataSetChanged();
                    }
                    catch (RemoteException remoteexception)
                    {
                        Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error notifying factory of data set changed in onServiceConnected(): ").append(remoteexception.getMessage()).toString());
                        return;
                    }
                    catch (RuntimeException runtimeexception)
                    {
                        Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error notifying factory of data set changed in onServiceConnected(): ").append(runtimeexception.getMessage()).toString());
                    }
                    adapter.updateTemporaryMetaData();
                    adapter.mMainQueue.post(new Runnable() {

                        final RemoteViewsAdapterServiceConnection._cls1 this$1;

                        public void run()
                        {
                            synchronized (adapter.mCache)
                            {
                                adapter.mCache.commitTemporaryMetaData();
                            }
                            RemoteAdapterConnectionCallback remoteadapterconnectioncallback = (RemoteAdapterConnectionCallback)adapter.mCallback.get();
                            if (remoteadapterconnectioncallback != null)
                                remoteadapterconnectioncallback.onRemoteAdapterConnected();
                            return;
                            exception;
                            fixedsizeremoteviewscache;
                            JVM INSTR monitorexit ;
                            throw exception;
                        }

            
            {
                this$1 = RemoteViewsAdapterServiceConnection._cls1.this;
                super();
            }
                    }
);
                    if (true) goto _L4; else goto _L3
_L3:
                }

            
            {
                this$0 = final_remoteviewsadapterserviceconnection;
                adapter = RemoteViewsAdapter.this;
                super();
            }
            }
);
            if (true) goto _L1; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        public void onServiceDisconnected()
        {
            this;
            JVM INSTR monitorenter ;
            RemoteViewsAdapter remoteviewsadapter;
            mIsConnected = false;
            mIsConnecting = false;
            mRemoteViewsFactory = null;
            remoteviewsadapter = (RemoteViewsAdapter)mAdapter.get();
            if (remoteviewsadapter != null) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            remoteviewsadapter.mMainQueue.post(remoteviewsadapter. new Runnable() {

                final RemoteViewsAdapterServiceConnection this$0;
                final RemoteViewsAdapter val$adapter;

                public void run()
                {
                    adapter.mMainQueue.removeMessages(1);
                    RemoteAdapterConnectionCallback remoteadapterconnectioncallback = (RemoteAdapterConnectionCallback)adapter.mCallback.get();
                    if (remoteadapterconnectioncallback != null)
                        remoteadapterconnectioncallback.onRemoteAdapterDisconnected();
                }

            
            {
                this$0 = final_remoteviewsadapterserviceconnection;
                adapter = RemoteViewsAdapter.this;
                super();
            }
            }
);
            if (true) goto _L1; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        public void unbind(Context context, int i, Intent intent)
        {
            this;
            JVM INSTR monitorenter ;
            AppWidgetManager appwidgetmanager = AppWidgetManager.getInstance(context);
            if (Process.myUid() != 1000) goto _L2; else goto _L1
_L1:
            RemoteViewsAdapter remoteviewsadapter = (RemoteViewsAdapter)mAdapter.get();
            if (remoteviewsadapter == null) goto _L2; else goto _L3
_L3:
            appwidgetmanager.unbindRemoteViewsService(i, intent, new UserHandle(remoteviewsadapter.mUserId));
_L4:
            mIsConnecting = false;
_L5:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            appwidgetmanager.unbindRemoteViewsService(i, intent, Process.myUserHandle());
              goto _L4
            Exception exception1;
            exception1;
            Log.e("RemoteViewsAdapterServiceConnection", (new StringBuilder()).append("unbind(): ").append(exception1.getMessage()).toString());
            mIsConnecting = false;
            mIsConnected = false;
              goto _L5
            Exception exception;
            exception;
            throw exception;
              goto _L4
        }


/*
        static boolean access$802(RemoteViewsAdapterServiceConnection remoteviewsadapterserviceconnection, boolean flag)
        {
            remoteviewsadapterserviceconnection.mIsConnected = flag;
            return flag;
        }

*/


/*
        static boolean access$902(RemoteViewsAdapterServiceConnection remoteviewsadapterserviceconnection, boolean flag)
        {
            remoteviewsadapterserviceconnection.mIsConnecting = flag;
            return flag;
        }

*/

        public RemoteViewsAdapterServiceConnection(RemoteViewsAdapter remoteviewsadapter)
        {
            mAdapter = new WeakReference(remoteviewsadapter);
        }
    }

    static class RemoteViewsCacheKey
    {

        final android.content.Intent.FilterComparison filter;
        final int userId;
        final int widgetId;

        public boolean equals(Object obj)
        {
            if (obj instanceof RemoteViewsCacheKey)
            {
                RemoteViewsCacheKey remoteviewscachekey = (RemoteViewsCacheKey)obj;
                if (remoteviewscachekey.filter.equals(filter) && remoteviewscachekey.widgetId == widgetId && remoteviewscachekey.userId == userId)
                    return true;
            }
            return false;
        }

        public int hashCode()
        {
            int i;
            if (filter == null)
                i = 0;
            else
                i = filter.hashCode();
            return i ^ widgetId << 2 ^ userId << 10;
        }

        RemoteViewsCacheKey(android.content.Intent.FilterComparison filtercomparison, int i, int j)
        {
            filter = filtercomparison;
            widgetId = i;
            userId = j;
        }
    }

    private static class RemoteViewsFrameLayout extends FrameLayout
    {

        public void onRemoteViewsLoaded(RemoteViews remoteviews, RemoteViews.OnClickHandler onclickhandler)
        {
            try
            {
                removeAllViews();
                addView(remoteviews.apply(getContext(), this, onclickhandler));
                return;
            }
            catch (Exception exception)
            {
                Log.e("RemoteViewsAdapter", "Failed to apply RemoteViews.");
            }
        }

        public RemoteViewsFrameLayout(Context context)
        {
            super(context);
        }
    }

    private class RemoteViewsFrameLayoutRefSet
    {

        private HashMap mReferences;
        private HashMap mViewToLinkedList;
        final RemoteViewsAdapter this$0;

        public void add(int i, RemoteViewsFrameLayout remoteviewsframelayout)
        {
            Integer integer = Integer.valueOf(i);
            LinkedList linkedlist;
            if (mReferences.containsKey(integer))
            {
                linkedlist = (LinkedList)mReferences.get(integer);
            } else
            {
                linkedlist = new LinkedList();
                mReferences.put(integer, linkedlist);
            }
            mViewToLinkedList.put(remoteviewsframelayout, linkedlist);
            linkedlist.add(remoteviewsframelayout);
        }

        public void clear()
        {
            mReferences.clear();
            mViewToLinkedList.clear();
        }

        public void notifyOnRemoteViewsLoaded(int i, RemoteViews remoteviews)
        {
            if (remoteviews != null)
            {
                Integer integer = Integer.valueOf(i);
                if (mReferences.containsKey(integer))
                {
                    LinkedList linkedlist = (LinkedList)mReferences.get(integer);
                    Iterator iterator = linkedlist.iterator();
                    do
                    {
                        if (!iterator.hasNext())
                            break;
                        RemoteViewsFrameLayout remoteviewsframelayout = (RemoteViewsFrameLayout)iterator.next();
                        remoteviewsframelayout.onRemoteViewsLoaded(remoteviews, mRemoteViewsOnClickHandler);
                        if (mViewToLinkedList.containsKey(remoteviewsframelayout))
                            mViewToLinkedList.remove(remoteviewsframelayout);
                    } while (true);
                    linkedlist.clear();
                    mReferences.remove(integer);
                    return;
                }
            }
        }

        public void removeView(RemoteViewsFrameLayout remoteviewsframelayout)
        {
            if (mViewToLinkedList.containsKey(remoteviewsframelayout))
            {
                ((LinkedList)mViewToLinkedList.get(remoteviewsframelayout)).remove(remoteviewsframelayout);
                mViewToLinkedList.remove(remoteviewsframelayout);
            }
        }

        public RemoteViewsFrameLayoutRefSet()
        {
            this$0 = RemoteViewsAdapter.this;
            super();
            mReferences = new HashMap();
            mViewToLinkedList = new HashMap();
        }
    }

    private static class RemoteViewsIndexMetaData
    {

        long itemId;
        int typeId;

        public void set(RemoteViews remoteviews, long l)
        {
            itemId = l;
            if (remoteviews != null)
            {
                typeId = remoteviews.getLayoutId();
                return;
            } else
            {
                typeId = 0;
                return;
            }
        }

        public RemoteViewsIndexMetaData(RemoteViews remoteviews, long l)
        {
            set(remoteviews, l);
        }
    }

    private static class RemoteViewsMetaData
    {

        int count;
        boolean hasStableIds;
        RemoteViews mFirstView;
        int mFirstViewHeight;
        private final HashMap mTypeIdIndexMap = new HashMap();
        RemoteViews mUserLoadingView;
        int viewTypeCount;

        private RemoteViewsFrameLayout createLoadingView(int i, View view, ViewGroup viewgroup, Object obj, LayoutInflater layoutinflater, RemoteViews.OnClickHandler onclickhandler)
        {
            Context context = viewgroup.getContext();
            RemoteViewsFrameLayout remoteviewsframelayout = new RemoteViewsFrameLayout(context);
            obj;
            JVM INSTR monitorenter ;
            RemoteViews remoteviews = mUserLoadingView;
            boolean flag;
            flag = false;
            if (remoteviews == null)
                break MISSING_BLOCK_LABEL_75;
            View view2 = mUserLoadingView.apply(viewgroup.getContext(), viewgroup, onclickhandler);
            view2.setTagInternal(0x1020248, new Integer(0));
            remoteviewsframelayout.addView(view2);
            flag = true;
_L3:
            if (flag) goto _L2; else goto _L1
_L1:
            int j = mFirstViewHeight;
            if (j >= 0)
                break MISSING_BLOCK_LABEL_136;
            View view1 = mFirstView.apply(viewgroup.getContext(), viewgroup, onclickhandler);
            view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(0, 0), android.view.View.MeasureSpec.makeMeasureSpec(0, 0));
            mFirstViewHeight = view1.getMeasuredHeight();
            mFirstView = null;
_L4:
            TextView textview = (TextView)layoutinflater.inflate(0x10900b1, remoteviewsframelayout, false);
            textview.setHeight(mFirstViewHeight);
            textview.setTag(new Integer(0));
            remoteviewsframelayout.addView(textview);
_L2:
            obj;
            JVM INSTR monitorexit ;
            return remoteviewsframelayout;
            Exception exception2;
            exception2;
            Log.w("RemoteViewsAdapter", "Error inflating custom loading view, using default loadingview instead", exception2);
            flag = false;
              goto _L3
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
            Exception exception1;
            exception1;
            mFirstViewHeight = Math.round(50F * context.getResources().getDisplayMetrics().density);
            mFirstView = null;
            Log.w("RemoteViewsAdapter", (new StringBuilder()).append("Error inflating first RemoteViews").append(exception1).toString());
              goto _L4
        }

        public int getMappedViewType(int i)
        {
            if (mTypeIdIndexMap.containsKey(Integer.valueOf(i)))
            {
                return ((Integer)mTypeIdIndexMap.get(Integer.valueOf(i))).intValue();
            } else
            {
                int j = 1 + mTypeIdIndexMap.size();
                mTypeIdIndexMap.put(Integer.valueOf(i), Integer.valueOf(j));
                return j;
            }
        }

        public boolean isViewTypeInRange(int i)
        {
            return getMappedViewType(i) < viewTypeCount;
        }

        public void reset()
        {
            count = 0;
            viewTypeCount = 1;
            hasStableIds = true;
            mUserLoadingView = null;
            mFirstView = null;
            mFirstViewHeight = 0;
            mTypeIdIndexMap.clear();
        }

        public void set(RemoteViewsMetaData remoteviewsmetadata)
        {
            remoteviewsmetadata;
            JVM INSTR monitorenter ;
            count = remoteviewsmetadata.count;
            viewTypeCount = remoteviewsmetadata.viewTypeCount;
            hasStableIds = remoteviewsmetadata.hasStableIds;
            setLoadingViewTemplates(remoteviewsmetadata.mUserLoadingView, remoteviewsmetadata.mFirstView);
            remoteviewsmetadata;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            remoteviewsmetadata;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setLoadingViewTemplates(RemoteViews remoteviews, RemoteViews remoteviews1)
        {
            mUserLoadingView = remoteviews;
            if (remoteviews1 != null)
            {
                mFirstView = remoteviews1;
                mFirstViewHeight = -1;
            }
        }


        public RemoteViewsMetaData()
        {
            reset();
        }
    }


    private static final int REMOTE_VIEWS_CACHE_DURATION = 5000;
    private static final String TAG = "RemoteViewsAdapter";
    private static Handler sCacheRemovalQueue;
    private static HandlerThread sCacheRemovalThread;
    private static final HashMap sCachedRemoteViewsCaches = new HashMap();
    private static final int sDefaultCacheSize = 40;
    private static final int sDefaultLoadingViewHeight = 50;
    private static final int sDefaultMessageType = 0;
    private static final HashMap sRemoteViewsCacheRemoveRunnables = new HashMap();
    private static final int sUnbindServiceDelay = 5000;
    private static final int sUnbindServiceMessageType = 1;
    private final int mAppWidgetId;
    private FixedSizeRemoteViewsCache mCache;
    private WeakReference mCallback;
    private final Context mContext;
    private boolean mDataReady;
    private final Intent mIntent;
    private LayoutInflater mLayoutInflater;
    private Handler mMainQueue;
    private boolean mNotifyDataSetChangedAfterOnServiceConnected;
    private RemoteViews.OnClickHandler mRemoteViewsOnClickHandler;
    private RemoteViewsFrameLayoutRefSet mRequestedViews;
    private RemoteViewsAdapterServiceConnection mServiceConnection;
    int mUserId;
    private int mVisibleWindowLowerBound;
    private int mVisibleWindowUpperBound;
    private Handler mWorkerQueue;
    private HandlerThread mWorkerThread;

    public RemoteViewsAdapter(Context context, Intent intent, RemoteAdapterConnectionCallback remoteadapterconnectioncallback)
    {
        HashMap hashmap;
        mNotifyDataSetChangedAfterOnServiceConnected = false;
        mDataReady = false;
        mContext = context;
        mIntent = intent;
        mAppWidgetId = intent.getIntExtra("remoteAdapterAppWidgetId", -1);
        mLayoutInflater = LayoutInflater.from(context);
        if (mIntent == null)
            throw new IllegalArgumentException("Non-null Intent must be specified.");
        mRequestedViews = new RemoteViewsFrameLayoutRefSet();
        RemoteViewsCacheKey remoteviewscachekey;
        if (Process.myUid() == 1000)
            mUserId = (new LockPatternUtils(context)).getCurrentUser();
        else
            mUserId = UserHandle.myUserId();
        if (intent.hasExtra("remoteAdapterAppWidgetId"))
            intent.removeExtra("remoteAdapterAppWidgetId");
        mWorkerThread = new HandlerThread("RemoteViewsCache-loader");
        mWorkerThread.start();
        mWorkerQueue = new Handler(mWorkerThread.getLooper());
        mMainQueue = new Handler(Looper.myLooper(), this);
        if (sCacheRemovalThread == null)
        {
            sCacheRemovalThread = new HandlerThread("RemoteViewsAdapter-cachePruner");
            sCacheRemovalThread.start();
            sCacheRemovalQueue = new Handler(sCacheRemovalThread.getLooper());
        }
        mCallback = new WeakReference(remoteadapterconnectioncallback);
        mServiceConnection = new RemoteViewsAdapterServiceConnection(this);
        remoteviewscachekey = new RemoteViewsCacheKey(new android.content.Intent.FilterComparison(mIntent), mAppWidgetId, mUserId);
        hashmap = sCachedRemoteViewsCaches;
        hashmap;
        JVM INSTR monitorenter ;
        if (!sCachedRemoteViewsCaches.containsKey(remoteviewscachekey))
            break MISSING_BLOCK_LABEL_365;
        mCache = (FixedSizeRemoteViewsCache)sCachedRemoteViewsCaches.get(remoteviewscachekey);
        synchronized (mCache.mMetaData)
        {
            if (mCache.mMetaData.count > 0)
                mDataReady = true;
        }
_L1:
        if (!mDataReady)
            requestBindService();
        hashmap;
        JVM INSTR monitorexit ;
        return;
        exception1;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        mCache = new FixedSizeRemoteViewsCache(40);
          goto _L1
    }

    private void enqueueDeferredUnbindServiceMessage()
    {
        mMainQueue.removeMessages(1);
        mMainQueue.sendEmptyMessageDelayed(1, 5000L);
    }

    private int getConvertViewTypeId(View view)
    {
        int i = -1;
        if (view != null)
        {
            Object obj = view.getTag(0x1020248);
            if (obj != null)
                i = ((Integer)obj).intValue();
        }
        return i;
    }

    private ArrayList getVisibleWindow(int i, int j, int k)
    {
        ArrayList arraylist = new ArrayList();
        if ((i != 0 || j != 0) && i >= 0 && j >= 0)
            if (i <= j)
            {
                for (int j1 = i; j1 <= j; j1++)
                    arraylist.add(Integer.valueOf(j1));

            } else
            {
                for (int l = i; l < k; l++)
                    arraylist.add(Integer.valueOf(l));

                for (int i1 = 0; i1 <= j; i1++)
                    arraylist.add(Integer.valueOf(i1));

            }
        return arraylist;
    }

    private void loadNextIndexInBackground()
    {
        mWorkerQueue.post(new Runnable() {

            final RemoteViewsAdapter this$0;

            public void run()
            {
                if (mServiceConnection.isConnected())
                {
                    int i;
                    synchronized (mCache)
                    {
                        i = mCache.getNextIndexToLoad()[0];
                    }
                    if (i <= -1)
                        break MISSING_BLOCK_LABEL_65;
                    updateRemoteViews(i, true);
                    loadNextIndexInBackground();
                }
                return;
                exception;
                fixedsizeremoteviewscache;
                JVM INSTR monitorexit ;
                throw exception;
                enqueueDeferredUnbindServiceMessage();
                return;
            }

            
            {
                this$0 = RemoteViewsAdapter.this;
                super();
            }
        }
);
    }

    private void onNotifyDataSetChanged()
    {
        IRemoteViewsFactory iremoteviewsfactory = mServiceConnection.getRemoteViewsFactory();
        int i;
        ArrayList arraylist;
        Iterator iterator;
        try
        {
            iremoteviewsfactory.onDataSetChanged();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in updateNotifyDataSetChanged(): ").append(remoteexception.getMessage()).toString());
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in updateNotifyDataSetChanged(): ").append(runtimeexception.getMessage()).toString());
            return;
        }
        synchronized (mCache)
        {
            mCache.reset();
        }
        updateTemporaryMetaData();
        synchronized (mCache.getTemporaryMetaData())
        {
            i = mCache.getTemporaryMetaData().count;
            arraylist = getVisibleWindow(mVisibleWindowLowerBound, mVisibleWindowUpperBound, i);
        }
        iterator = arraylist.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            int j = ((Integer)iterator.next()).intValue();
            if (j < i)
                updateRemoteViews(j, false);
        } while (true);
        break MISSING_BLOCK_LABEL_209;
        exception;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception1;
        mMainQueue.post(new Runnable() {

            final RemoteViewsAdapter this$0;

            public void run()
            {
                synchronized (mCache)
                {
                    mCache.commitTemporaryMetaData();
                }
                superNotifyDataSetChanged();
                enqueueDeferredUnbindServiceMessage();
                return;
                exception2;
                fixedsizeremoteviewscache1;
                JVM INSTR monitorexit ;
                throw exception2;
            }

            
            {
                this$0 = RemoteViewsAdapter.this;
                super();
            }
        }
);
        mNotifyDataSetChangedAfterOnServiceConnected = false;
        return;
    }

    private void processException(String s, Exception exception)
    {
        Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in ").append(s).append(": ").append(exception.getMessage()).toString());
        synchronized (mCache.getMetaData())
        {
            remoteviewsmetadata.reset();
        }
        synchronized (mCache)
        {
            mCache.reset();
        }
        mMainQueue.post(new Runnable() {

            final RemoteViewsAdapter this$0;

            public void run()
            {
                superNotifyDataSetChanged();
            }

            
            {
                this$0 = RemoteViewsAdapter.this;
                super();
            }
        }
);
        return;
        exception1;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception1;
        exception2;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception2;
    }

    private boolean requestBindService()
    {
        if (!mServiceConnection.isConnected())
            mServiceConnection.bind(mContext, mAppWidgetId, mIntent);
        mMainQueue.removeMessages(1);
        return mServiceConnection.isConnected();
    }

    private void updateRemoteViews(final int position, boolean flag)
    {
        final RemoteViews rv;
        long l;
        boolean flag1;
        int j;
        IRemoteViewsFactory iremoteviewsfactory = mServiceConnection.getRemoteViewsFactory();
        try
        {
            rv = iremoteviewsfactory.getViewAt(position);
            rv.setUser(new UserHandle(mUserId));
            l = iremoteviewsfactory.getItemId(position);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in updateRemoteViews(").append(position).append("): ").append(remoteexception.getMessage()).toString());
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in updateRemoteViews(").append(position).append("): ").append(runtimeexception.getMessage()).toString());
            return;
        }
        if (rv == null)
        {
            Log.e("RemoteViewsAdapter", (new StringBuilder()).append("Error in updateRemoteViews(").append(position).append("): ").append(" null RemoteViews ").append("returned from RemoteViewsFactory.").toString());
            return;
        }
        int i = rv.getLayoutId();
        synchronized (mCache.getMetaData())
        {
            flag1 = remoteviewsmetadata.isViewTypeInRange(i);
            j = mCache.mMetaData.count;
        }
        FixedSizeRemoteViewsCache fixedsizeremoteviewscache = mCache;
        fixedsizeremoteviewscache;
        JVM INSTR monitorenter ;
        if (!flag1)
            break MISSING_BLOCK_LABEL_308;
        ArrayList arraylist = getVisibleWindow(mVisibleWindowLowerBound, mVisibleWindowUpperBound, j);
        mCache.insert(position, rv, l, arraylist);
        if (!flag)
            break MISSING_BLOCK_LABEL_288;
        mMainQueue.post(new Runnable() {

            final RemoteViewsAdapter this$0;
            final int val$position;
            final RemoteViews val$rv;

            public void run()
            {
                mRequestedViews.notifyOnRemoteViewsLoaded(position, rv);
            }

            
            {
                this$0 = RemoteViewsAdapter.this;
                position = i;
                rv = remoteviews;
                super();
            }
        }
);
_L1:
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return;
        Exception exception1;
        exception1;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception1;
        exception;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception;
        Log.e("RemoteViewsAdapter", "Error: widget's RemoteViewsFactory returns more view types than  indicated by getViewTypeCount() ");
          goto _L1
    }

    private void updateTemporaryMetaData()
    {
        IRemoteViewsFactory iremoteviewsfactory = mServiceConnection.getRemoteViewsFactory();
        boolean flag;
        int i;
        int j;
        RemoteViews remoteviews;
        flag = iremoteviewsfactory.hasStableIds();
        i = iremoteviewsfactory.getViewTypeCount();
        j = iremoteviewsfactory.getCount();
        remoteviews = iremoteviewsfactory.getLoadingView();
        RemoteViews remoteviews1;
        remoteviews1 = null;
        if (j <= 0)
            break MISSING_BLOCK_LABEL_65;
        remoteviews1 = null;
        if (remoteviews != null)
            break MISSING_BLOCK_LABEL_65;
        remoteviews1 = iremoteviewsfactory.getViewAt(0);
        synchronized (mCache.getTemporaryMetaData())
        {
            remoteviewsmetadata.hasStableIds = flag;
            remoteviewsmetadata.viewTypeCount = i + 1;
            remoteviewsmetadata.count = j;
            remoteviewsmetadata.setLoadingViewTemplates(remoteviews, remoteviews1);
        }
        return;
        exception;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        try
        {
            throw exception;
        }
        catch (RemoteException remoteexception)
        {
            processException("updateMetaData", remoteexception);
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            processException("updateMetaData", runtimeexception);
        }
        return;
    }

    protected void finalize()
        throws Throwable
    {
        if (mWorkerThread != null)
            mWorkerThread.quit();
        super.finalize();
        return;
        Exception exception;
        exception;
        super.finalize();
        throw exception;
    }

    public int getCount()
    {
        int i;
        synchronized (mCache.getMetaData())
        {
            i = remoteviewsmetadata.count;
        }
        return i;
        exception;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Object getItem(int i)
    {
        return null;
    }

    public long getItemId(int i)
    {
        FixedSizeRemoteViewsCache fixedsizeremoteviewscache = mCache;
        fixedsizeremoteviewscache;
        JVM INSTR monitorenter ;
        long l;
        if (!mCache.containsMetaDataAt(i))
            break MISSING_BLOCK_LABEL_36;
        l = mCache.getMetaDataAt(i).itemId;
        return l;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return 0L;
        Exception exception;
        exception;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getItemViewType(int i)
    {
label0:
        {
            int j;
            synchronized (mCache)
            {
                if (!mCache.containsMetaDataAt(i))
                    break label0;
                j = mCache.getMetaDataAt(i).typeId;
            }
            int k;
            synchronized (mCache.getMetaData())
            {
                k = remoteviewsmetadata.getMappedViewType(j);
            }
            return k;
        }
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return 0;
        exception;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public Intent getRemoteViewsServiceIntent()
    {
        return mIntent;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        FixedSizeRemoteViewsCache fixedsizeremoteviewscache = mCache;
        fixedsizeremoteviewscache;
        JVM INSTR monitorenter ;
        boolean flag;
        boolean flag1;
        flag = mCache.containsRemoteViewAt(i);
        flag1 = mServiceConnection.isConnected();
        boolean flag2;
        flag2 = false;
        if (view == null)
            break MISSING_BLOCK_LABEL_53;
        if (view instanceof RemoteViewsFrameLayout)
            mRequestedViews.removeView((RemoteViewsFrameLayout)view);
        if (flag || flag1) goto _L2; else goto _L1
_L1:
        requestBindService();
_L9:
        if (!flag) goto _L4; else goto _L3
_L3:
        View view1;
        int j;
        RemoteViewsFrameLayout remoteviewsframelayout3;
        if (!(view instanceof RemoteViewsFrameLayout))
            break MISSING_BLOCK_LABEL_484;
        remoteviewsframelayout3 = (RemoteViewsFrameLayout)view;
        view1 = remoteviewsframelayout3.getChildAt(0);
        j = getConvertViewTypeId(view1);
        RemoteViewsFrameLayout remoteviewsframelayout = remoteviewsframelayout3;
_L15:
        Context context;
        RemoteViews remoteviews;
        int k;
        context = viewgroup.getContext();
        remoteviews = mCache.getRemoteViewsAt(i);
        k = mCache.getMetaDataAt(i).typeId;
        if (remoteviewsframelayout == null) goto _L6; else goto _L5
_L5:
        if (j != k) goto _L8; else goto _L7
_L7:
        remoteviews.reapply(context, view1, mRemoteViewsOnClickHandler);
        if (!flag2)
            break MISSING_BLOCK_LABEL_169;
        loadNextIndexInBackground();
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return remoteviewsframelayout;
_L2:
        boolean flag3 = mCache.queuePositionsToBePreloadedFromRequestedPosition(i);
        flag2 = flag3;
          goto _L9
_L8:
        remoteviewsframelayout.removeAllViews();
        RemoteViewsFrameLayout remoteviewsframelayout1 = remoteviewsframelayout;
_L10:
        View view2 = remoteviews.apply(context, viewgroup, mRemoteViewsOnClickHandler);
        view2.setTagInternal(0x1020248, new Integer(k));
        remoteviewsframelayout1.addView(view2);
        if (!flag2)
            break MISSING_BLOCK_LABEL_248;
        loadNextIndexInBackground();
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return remoteviewsframelayout1;
_L6:
        remoteviewsframelayout1 = new RemoteViewsFrameLayout(context);
          goto _L10
        Exception exception1;
        exception1;
        remoteviewsframelayout;
_L14:
        Log.w("RemoteViewsAdapter", (new StringBuilder()).append("Error inflating RemoteViews at position: ").append(i).append(", using").append("loading view instead").append(exception1).toString());
        RemoteViewsFrameLayout remoteviewsframelayout2;
        synchronized (mCache.getMetaData())
        {
            remoteviewsframelayout2 = remoteviewsmetadata.createLoadingView(i, view, viewgroup, mCache, mLayoutInflater, mRemoteViewsOnClickHandler);
        }
        if (!flag2)
            break MISSING_BLOCK_LABEL_362;
        loadNextIndexInBackground();
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return remoteviewsframelayout2;
        Exception exception;
        exception;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception;
        exception3;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception3;
        Exception exception2;
        exception2;
_L12:
        if (!flag2)
            break MISSING_BLOCK_LABEL_395;
        loadNextIndexInBackground();
        throw exception2;
_L4:
        RemoteViewsFrameLayout remoteviewsframelayout4;
        synchronized (mCache.getMetaData())
        {
            remoteviewsframelayout4 = remoteviewsmetadata1.createLoadingView(i, view, viewgroup, mCache, mLayoutInflater, mRemoteViewsOnClickHandler);
        }
        mRequestedViews.add(i, remoteviewsframelayout4);
        mCache.queueRequestedPositionToLoad(i);
        loadNextIndexInBackground();
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        return remoteviewsframelayout4;
        exception4;
        remoteviewsmetadata1;
        JVM INSTR monitorexit ;
        throw exception4;
        exception2;
        remoteviewsframelayout;
        if (true) goto _L12; else goto _L11
_L11:
        exception1;
        if (true) goto _L14; else goto _L13
_L13:
        view1 = null;
        j = 0;
        remoteviewsframelayout = null;
          goto _L15
    }

    public int getViewTypeCount()
    {
        int i;
        synchronized (mCache.getMetaData())
        {
            i = remoteviewsmetadata.viewTypeCount;
        }
        return i;
        exception;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean handleMessage(Message message)
    {
        switch (message.what)
        {
        case 1: // '\001'
            if (mServiceConnection.isConnected())
                mServiceConnection.unbind(mContext, mAppWidgetId, mIntent);
            return true;
        }
        return false;
    }

    public boolean hasStableIds()
    {
        boolean flag;
        synchronized (mCache.getMetaData())
        {
            flag = remoteviewsmetadata.hasStableIds;
        }
        return flag;
        exception;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isDataReady()
    {
        return mDataReady;
    }

    public boolean isEmpty()
    {
        return getCount() <= 0;
    }

    public void notifyDataSetChanged()
    {
        mMainQueue.removeMessages(1);
        if (!mServiceConnection.isConnected())
        {
            if (mNotifyDataSetChangedAfterOnServiceConnected)
            {
                mWorkerQueue.post(new Runnable() {

                    final RemoteViewsAdapter this$0;

                    public void run()
                    {
                        onNotifyDataSetChanged();
                    }

            
            {
                this$0 = RemoteViewsAdapter.this;
                super();
            }
                }
);
                return;
            } else
            {
                mNotifyDataSetChangedAfterOnServiceConnected = true;
                requestBindService();
                return;
            }
        } else
        {
            mWorkerQueue.post(new Runnable() {

                final RemoteViewsAdapter this$0;

                public void run()
                {
                    onNotifyDataSetChanged();
                }

            
            {
                this$0 = RemoteViewsAdapter.this;
                super();
            }
            }
);
            return;
        }
    }

    public void saveRemoteViewsCache()
    {
        final RemoteViewsCacheKey key = new RemoteViewsCacheKey(new android.content.Intent.FilterComparison(mIntent), mAppWidgetId, mUserId);
        HashMap hashmap = sCachedRemoteViewsCaches;
        hashmap;
        JVM INSTR monitorenter ;
        if (sRemoteViewsCacheRemoveRunnables.containsKey(key))
        {
            sCacheRemovalQueue.removeCallbacks((Runnable)sRemoteViewsCacheRemoveRunnables.get(key));
            sRemoteViewsCacheRemoveRunnables.remove(key);
        }
        int i;
        synchronized (mCache.mMetaData)
        {
            i = mCache.mMetaData.count;
        }
        int j;
        synchronized (mCache)
        {
            j = mCache.mIndexRemoteViews.size();
        }
        if (i <= 0 || j <= 0)
            break MISSING_BLOCK_LABEL_140;
        sCachedRemoteViewsCaches.put(key, mCache);
        Runnable runnable = new Runnable() {

            final RemoteViewsAdapter this$0;
            final RemoteViewsCacheKey val$key;

            public void run()
            {
                synchronized (RemoteViewsAdapter.sCachedRemoteViewsCaches)
                {
                    if (RemoteViewsAdapter.sCachedRemoteViewsCaches.containsKey(key))
                        RemoteViewsAdapter.sCachedRemoteViewsCaches.remove(key);
                    if (RemoteViewsAdapter.sRemoteViewsCacheRemoveRunnables.containsKey(key))
                        RemoteViewsAdapter.sRemoteViewsCacheRemoveRunnables.remove(key);
                }
                return;
                exception3;
                hashmap1;
                JVM INSTR monitorexit ;
                throw exception3;
            }

            
            {
                this$0 = RemoteViewsAdapter.this;
                key = remoteviewscachekey;
                super();
            }
        }
;
        sRemoteViewsCacheRemoveRunnables.put(key, runnable);
        sCacheRemovalQueue.postDelayed(runnable, 5000L);
        hashmap;
        JVM INSTR monitorexit ;
        return;
        exception1;
        remoteviewsmetadata;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        exception2;
        fixedsizeremoteviewscache;
        JVM INSTR monitorexit ;
        throw exception2;
    }

    public void setRemoteViewsOnClickHandler(RemoteViews.OnClickHandler onclickhandler)
    {
        mRemoteViewsOnClickHandler = onclickhandler;
    }

    public void setVisibleRangeHint(int i, int j)
    {
        mVisibleWindowLowerBound = i;
        mVisibleWindowUpperBound = j;
    }

    void superNotifyDataSetChanged()
    {
        super.notifyDataSetChanged();
    }
















}
