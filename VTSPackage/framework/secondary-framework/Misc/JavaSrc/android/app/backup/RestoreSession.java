// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.content.Context;
import android.os.*;
import android.util.Log;

// Referenced classes of package android.app.backup:
//            IRestoreSession, RestoreObserver, RestoreSet

public class RestoreSession
{
    private class RestoreObserverWrapper extends IRestoreObserver.Stub
    {

        static final int MSG_RESTORE_FINISHED = 3;
        static final int MSG_RESTORE_SETS_AVAILABLE = 4;
        static final int MSG_RESTORE_STARTING = 1;
        static final int MSG_UPDATE = 2;
        final RestoreObserver mAppObserver;
        final Handler mHandler;
        final RestoreSession this$0;

        public void onUpdate(int i, String s)
        {
            mHandler.sendMessage(mHandler.obtainMessage(2, i, 0, s));
        }

        public void restoreFinished(int i)
        {
            mHandler.sendMessage(mHandler.obtainMessage(3, i, 0));
        }

        public void restoreSetsAvailable(RestoreSet arestoreset[])
        {
            mHandler.sendMessage(mHandler.obtainMessage(4, arestoreset));
        }

        public void restoreStarting(int i)
        {
            mHandler.sendMessage(mHandler.obtainMessage(1, i, 0));
        }

        RestoreObserverWrapper(Context context, RestoreObserver restoreobserver)
        {
            this$0 = RestoreSession.this;
            super();
            mHandler = context.getMainLooper(). new _cls1(RestoreSession.this);
            mAppObserver = restoreobserver;
        }
    }


    static final String TAG = "RestoreSession";
    IRestoreSession mBinder;
    final Context mContext;
    RestoreObserverWrapper mObserver;

    RestoreSession(Context context, IRestoreSession irestoresession)
    {
        mObserver = null;
        mContext = context;
        mBinder = irestoresession;
    }

    public void endRestoreSession()
    {
        mBinder.endRestoreSession();
_L2:
        mBinder = null;
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.d("RestoreSession", "Can't contact server to get available sets");
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        mBinder = null;
        throw exception;
    }

    public int getAvailableRestoreSets(RestoreObserver restoreobserver)
    {
        RestoreObserverWrapper restoreobserverwrapper = new RestoreObserverWrapper(mContext, restoreobserver);
        int i;
        try
        {
            i = mBinder.getAvailableRestoreSets(restoreobserverwrapper);
        }
        catch (RemoteException remoteexception)
        {
            Log.d("RestoreSession", "Can't contact server to get available sets");
            return -1;
        }
        return i;
    }

    public int restoreAll(long l, RestoreObserver restoreobserver)
    {
        int i;
        i = -1;
        if (mObserver != null)
        {
            Log.d("RestoreSession", "restoreAll() called during active restore");
            return -1;
        }
        mObserver = new RestoreObserverWrapper(mContext, restoreobserver);
        int j = mBinder.restoreAll(l, mObserver);
        i = j;
_L2:
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.d("RestoreSession", "Can't contact server to restore");
        if (true) goto _L2; else goto _L1
_L1:
    }

    public int restorePackage(String s, RestoreObserver restoreobserver)
    {
        int i;
        i = -1;
        if (mObserver != null)
        {
            Log.d("RestoreSession", "restorePackage() called during active restore");
            return -1;
        }
        mObserver = new RestoreObserverWrapper(mContext, restoreobserver);
        int j = mBinder.restorePackage(s, mObserver);
        i = j;
_L2:
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.d("RestoreSession", "Can't contact server to restore package");
        if (true) goto _L2; else goto _L1
_L1:
    }

    public int restoreSome(long l, RestoreObserver restoreobserver, String as[])
    {
        int i;
        i = -1;
        if (mObserver != null)
        {
            Log.d("RestoreSession", "restoreAll() called during active restore");
            return -1;
        }
        mObserver = new RestoreObserverWrapper(mContext, restoreobserver);
        int j = mBinder.restoreSome(l, mObserver, as);
        i = j;
_L2:
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.d("RestoreSession", "Can't contact server to restore packages");
        if (true) goto _L2; else goto _L1
_L1:
    }

    // Unreferenced inner class android/app/backup/RestoreSession$RestoreObserverWrapper$1

/* anonymous class */
    class RestoreObserverWrapper._cls1 extends Handler
    {

        final RestoreObserverWrapper this$1;
        final RestoreSession val$this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 4: // '\004'
                mAppObserver.restoreSetsAvailable((RestoreSet[])(RestoreSet[])message.obj);
                return;

            case 3: // '\003'
                mAppObserver.restoreFinished(message.arg1);
                return;

            case 2: // '\002'
                mAppObserver.onUpdate(message.arg1, (String)message.obj);
                return;

            case 1: // '\001'
                mAppObserver.restoreStarting(message.arg1);
                return;
            }
        }

            
            {
                this$1 = final_restoreobserverwrapper;
                this$0 = restoresession;
                super(Looper.this);
            }
    }

}
