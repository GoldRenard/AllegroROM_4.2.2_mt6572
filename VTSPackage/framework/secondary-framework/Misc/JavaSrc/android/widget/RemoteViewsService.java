// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.util.HashMap;

// Referenced classes of package android.widget:
//            RemoteViews

public abstract class RemoteViewsService extends Service
{
    public static interface RemoteViewsFactory
    {

        public abstract int getCount();

        public abstract long getItemId(int i);

        public abstract RemoteViews getLoadingView();

        public abstract RemoteViews getViewAt(int i);

        public abstract int getViewTypeCount();

        public abstract boolean hasStableIds();

        public abstract void onCreate();

        public abstract void onDataSetChanged();

        public abstract void onDestroy();
    }

    private static class RemoteViewsFactoryAdapter extends com.android.internal.widget.IRemoteViewsFactory.Stub
    {

        private RemoteViewsFactory mFactory;
        private boolean mIsCreated;

        public int getCount()
        {
            this;
            JVM INSTR monitorenter ;
            int j = mFactory.getCount();
            int i = j;
_L2:
            this;
            JVM INSTR monitorexit ;
            return i;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
            i = 0;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public long getItemId(int i)
        {
            this;
            JVM INSTR monitorenter ;
            long l = 0L;
            long l1 = mFactory.getItemId(i);
            l = l1;
_L2:
            this;
            JVM INSTR monitorexit ;
            return l;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public RemoteViews getLoadingView()
        {
            this;
            JVM INSTR monitorenter ;
            RemoteViews remoteviews1 = mFactory.getLoadingView();
            RemoteViews remoteviews = remoteviews1;
_L2:
            this;
            JVM INSTR monitorexit ;
            return remoteviews;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
            remoteviews = null;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public RemoteViews getViewAt(int i)
        {
            this;
            JVM INSTR monitorenter ;
            RemoteViews remoteviews = null;
            remoteviews = mFactory.getViewAt(i);
            if (remoteviews == null)
                break MISSING_BLOCK_LABEL_24;
            remoteviews.setIsWidgetCollectionChild(true);
_L1:
            this;
            JVM INSTR monitorexit ;
            return remoteviews;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
              goto _L1
            Exception exception;
            exception;
            throw exception;
        }

        public int getViewTypeCount()
        {
            this;
            JVM INSTR monitorenter ;
            int j = mFactory.getViewTypeCount();
            int i = j;
_L2:
            this;
            JVM INSTR monitorexit ;
            return i;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
            i = 0;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public boolean hasStableIds()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag1 = mFactory.hasStableIds();
            boolean flag = flag1;
_L2:
            this;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
            flag = false;
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            throw exception;
        }

        public boolean isCreated()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mIsCreated;
            this;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            throw exception;
        }

        public void onDataSetChanged()
        {
            this;
            JVM INSTR monitorenter ;
            mFactory.onDataSetChanged();
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
              goto _L1
            Exception exception;
            exception;
            throw exception;
        }

        public void onDataSetChangedAsync()
        {
            this;
            JVM INSTR monitorenter ;
            onDataSetChanged();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            throw exception;
        }

        public void onDestroy(Intent intent)
        {
            Object obj = RemoteViewsService.sLock;
            obj;
            JVM INSTR monitorenter ;
            android.content.Intent.FilterComparison filtercomparison = new android.content.Intent.FilterComparison(intent);
            if (!RemoteViewsService.sRemoteViewFactories.containsKey(filtercomparison)) goto _L2; else goto _L1
_L1:
            RemoteViewsFactory remoteviewsfactory = (RemoteViewsFactory)RemoteViewsService.sRemoteViewFactories.get(filtercomparison);
            remoteviewsfactory.onDestroy();
_L3:
            RemoteViewsService.sRemoteViewFactories.remove(filtercomparison);
_L2:
            return;
            Exception exception1;
            exception1;
            Thread thread = Thread.currentThread();
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, exception1);
              goto _L3
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public RemoteViewsFactoryAdapter(RemoteViewsFactory remoteviewsfactory, boolean flag)
        {
            mFactory = remoteviewsfactory;
            mIsCreated = flag;
        }
    }


    private static final String LOG_TAG = "RemoteViewsService";
    private static final Object sLock = new Object();
    private static final HashMap sRemoteViewFactories = new HashMap();


    public IBinder onBind(Intent intent)
    {
        Object obj = sLock;
        obj;
        JVM INSTR monitorenter ;
        android.content.Intent.FilterComparison filtercomparison = new android.content.Intent.FilterComparison(intent);
        if (sRemoteViewFactories.containsKey(filtercomparison)) goto _L2; else goto _L1
_L1:
        RemoteViewsFactory remoteviewsfactory;
        remoteviewsfactory = onGetViewFactory(intent);
        sRemoteViewFactories.put(filtercomparison, remoteviewsfactory);
        remoteviewsfactory.onCreate();
        boolean flag = false;
_L4:
        RemoteViewsFactoryAdapter remoteviewsfactoryadapter = new RemoteViewsFactoryAdapter(remoteviewsfactory, flag);
        obj;
        JVM INSTR monitorexit ;
        return remoteviewsfactoryadapter;
_L2:
        remoteviewsfactory = (RemoteViewsFactory)sRemoteViewFactories.get(filtercomparison);
        flag = true;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public abstract RemoteViewsFactory onGetViewFactory(Intent intent);



}
