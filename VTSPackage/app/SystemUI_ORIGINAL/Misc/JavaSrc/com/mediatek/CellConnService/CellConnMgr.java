// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.CellConnService;

import android.content.*;
import android.os.*;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.CellConnService:
//            IPhoneStatesMgrService

public class CellConnMgr
{
    private class WorkerThread
        implements Runnable
    {

        private ArrayList mRequstList;
        private boolean mServiceReady;
        private boolean mThreadStarted;
        final CellConnMgr this$0;

        public void addElem(int i, int j)
        {
            mRequstList.add(new Element(i, j));
        }

        public boolean isThreadStarted()
        {
            return mThreadStarted;
        }

        public void resetThreadStarted()
        {
            mThreadStarted = false;
        }

        public void run()
        {
            Log.d("CellConnMgr", "WorkerThread run");
            register(mCtx);
            this;
            JVM INSTR monitorenter ;
            if (!mServiceReady)
            {
                Log.d("CellConnMgr", "WorkerThread wait notify");
                wait(10000L);
            }
            Log.d("CellConnMgr", (new StringBuilder()).append("WorkerThread run current requstList size is ").append(mRequstList.size()).toString());
            Element element;
            for (Iterator iterator = mRequstList.iterator(); iterator.hasNext(); verifyCellState(element.getSlot(), element.getReqType()))
            {
                element = (Element)iterator.next();
                Log.d("CellConnMgr", (new StringBuilder()).append("WorkerThread request slot = ").append(element.getSlot()).append(" reqType = ").append(element.getReqType()).toString());
            }

            break MISSING_BLOCK_LABEL_219;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            try
            {
                throw exception;
            }
            catch (InterruptedException interruptedexception)
            {
                Log.e("CellConnMgr", "WorkerThread wait exception");
                interruptedexception.printStackTrace();
                mResult = 3;
                mHandler.post(mOnServiceComplete);
                return;
            }
            this;
            JVM INSTR monitorexit ;
        }

        public void setServiceReady()
        {
            mServiceReady = true;
        }

        public void setThreadStarted()
        {
            mThreadStarted = true;
        }

        public WorkerThread()
        {
            this$0 = CellConnMgr.this;
            super();
            mRequstList = new ArrayList();
            mThreadStarted = false;
            mServiceReady = false;
        }
    }

    private class WorkerThread.Element
    {

        private int mReqType;
        private int mSlot;
        final WorkerThread this$1;

        public int getReqType()
        {
            return mReqType;
        }

        public int getSlot()
        {
            return mSlot;
        }

        public WorkerThread.Element()
        {
            this$1 = WorkerThread.this;
            super();
            mSlot = 0;
            mReqType = 0;
        }

        public WorkerThread.Element(int i, int j)
        {
            this$1 = WorkerThread.this;
            super();
            mSlot = i;
            mReqType = j;
        }
    }


    public static final String ACTION_UNLOCK_SIM_LOCK = "com.android.phone.ACTION_UNLOCK_SIM_LOCK";
    public static final String EXTRA_SIMME_LOCK_TYPE = "com.android.phone.EXTRA_SIMME_LOCK_TYPE";
    public static final String EXTRA_SIM_SLOT = "com.android.phone.EXTRA_SIM_SLOT";
    public static final String EXTRA_UNLOCK_TYPE = "com.android.phone.EXTRA_UNLOCK_TYPE";
    public static final int FLAG_REQUEST_NOPREFER = 0x40000000;
    public static final int FLAG_SUPPRESS_CONFIRMDLG = 0x80000000;
    public static final int REQUEST_TYPE_FDN = 304;
    public static final int REQUEST_TYPE_ROAMING = 306;
    public static final int REQUEST_TYPE_SIMLOCK = 302;
    public static final int REQUEST_TYPE_UNKNOWN = 300;
    public static final int RESULT_ABORT = 2;
    public static final int RESULT_EXCEPTION = 3;
    public static final int RESULT_OK = 0;
    public static final int RESULT_STATE_NORMAL = 4;
    public static final int RESULT_UNKNOWN = -1;
    public static final int RESULT_WAIT = 1;
    private static final String TAG = "CellConnMgr";
    public static final int VERIFY_TYPE_PIN = 501;
    public static final int VERIFY_TYPE_PIN2 = 504;
    public static final int VERIFY_TYPE_PUK = 502;
    public static final int VERIFY_TYPE_PUK2 = 505;
    public static final int VERIFY_TYPE_SIMMELOCK = 503;
    private IPhoneStatesCallback.Stub mCallback = new IPhoneStatesCallback.Stub() {

        final CellConnMgr this$0;

        public void onComplete(int i)
        {
            Log.d("CellConnMgr", "IPhoneStatesCallback onComplete");
            mResult = i;
            if (mOnServiceComplete != null)
            {
                Log.d("CellConnMgr", "IPhoneStatesCallback call service complete");
                mHandler.post(mOnServiceComplete);
                return;
            } else
            {
                Log.d("CellConnMgr", "IPhoneStatesCallback no callback to call");
                return;
            }
        }

        public void onCompleteWithPrefer(int i, int j)
        {
            Log.d("CellConnMgr", "IPhoneStatesCallback onComplete with PreferSlot");
            Log.d("CellConnMgr", (new StringBuilder()).append("IPhoneStatesCallback nRet = ").append(i).append(" nPreferSlot = ").append(j).toString());
            mResult = i;
            if (4 == mResult && mPreferSlot != j)
            {
                Log.d("CellConnMgr", "fzw");
                mPreferSlot = j;
                handleCellConn(mPreferSlot, 302);
                return;
            }
            mPreferSlot = j;
            if (mOnServiceComplete != null)
            {
                Log.d("CellConnMgr", "IPhoneStatesCallback call service complete");
                mHandler.post(mOnServiceComplete);
                return;
            } else
            {
                Log.d("CellConnMgr", "IPhoneStatesCallback no callback to call");
                return;
            }
        }

            
            {
                this$0 = CellConnMgr.this;
                super();
            }
    }
;
    private ServiceConnection mConnection = new ServiceConnection() {

        final CellConnMgr this$0;

        public void onServiceConnected(ComponentName componentname, IBinder ibinder)
        {
            Log.d("CellConnMgr", "onServiceConnected PhoneStateService connected");
            mService = IPhoneStatesMgrService.Stub.asInterface(ibinder);
            if (mService == null)
            {
                Log.e("CellConnMgr", "onServiceConnected PhoneStateService get service is null");
                return;
            }
            Log.d("CellConnMgr", "onServiceConnected notify service ready");
            synchronized (workerThread)
            {
                workerThread.setServiceReady();
                workerThread.notify();
            }
            return;
            exception;
            workerthread;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onServiceDisconnected(ComponentName componentname)
        {
            Log.d("CellConnMgr", "onServiceDisconnected PhoneStateService disconnected");
            workerThread.resetThreadStarted();
            mService = null;
        }

            
            {
                this$0 = CellConnMgr.this;
                super();
            }
    }
;
    private Context mCtx;
    private Handler mHandler;
    private Runnable mOnServiceComplete;
    private int mPreferSlot;
    private int mResult;
    private IPhoneStatesMgrService mService;
    private WorkerThread workerThread;

    public CellConnMgr()
    {
        mHandler = new Handler(Looper.getMainLooper());
        workerThread = new WorkerThread();
        mOnServiceComplete = null;
        mResult = -1;
    }

    public CellConnMgr(Runnable runnable)
    {
        mHandler = new Handler(Looper.getMainLooper());
        workerThread = new WorkerThread();
        mOnServiceComplete = runnable;
        mResult = -1;
    }

    public static String resultToString(int i)
    {
        if (i == 0)
            return "RESULT_OK";
        if (1 == i)
            return "RESULT_WAIT";
        if (2 == i)
            return "RESULT_ABORT";
        if (-1 == i)
            return "RESULT_UNKNOWN";
        if (3 == i)
            return "RESULT_EXCEPTION";
        if (4 == i)
            return "RESULT_STATE_NORMAL";
        else
            return "null";
    }

    private int verifyCellState(int i, int j)
    {
        Log.d("CellConnMgr", (new StringBuilder()).append("verifyCellState slot = ").append(i).append(" reqType = ").append(j).toString());
        if (mService != null)
        {
            try
            {
                if (mCallback != null)
                    return mService.verifyPhoneState(i, j, mCallback);
                Log.e("CellConnMgr", "verifyCellState mCallback is null");
            }
            catch (RemoteException remoteexception)
            {
                Log.e("CellConnMgr", remoteexception.toString());
                Log.d("CellConnMgr", "verifyCellState excpetion");
                mResult = 3;
                mHandler.post(mOnServiceComplete);
                remoteexception.printStackTrace();
                return 3;
            }
            return 3;
        } else
        {
            Log.e("CellConnMgr", "verifyCellState mService is null");
            mResult = 3;
            mHandler.post(mOnServiceComplete);
            return 3;
        }
    }

    public int getPreferSlot()
    {
        return mPreferSlot;
    }

    public int getResult()
    {
        return mResult;
    }

    public int handleCellConn(int i, int j)
    {
        Log.d("CellConnMgr", (new StringBuilder()).append("handleCellConn slot = ").append(i).append(" reqType = ").append(j).toString());
        mPreferSlot = i;
        if (mService == null)
        {
            Log.d("CellConnMgr", "handleCellConn mService is not ready and start thread to handle this request");
            workerThread.addElem(i, j);
            if (!workerThread.isThreadStarted())
            {
                Log.d("CellConnMgr", "handleCellConn start workerThread");
                workerThread.setThreadStarted();
                (new Thread(workerThread)).start();
            }
            return 1;
        } else
        {
            return verifyCellState(i, j);
        }
    }

    public int handleCellConn(int i, int j, Runnable runnable)
    {
        Log.d("CellConnMgr", (new StringBuilder()).append("handleCellConn slot = ").append(i).append(" reqType = ").append(j).append("and Runable").toString());
        mPreferSlot = i;
        if (runnable == null)
            Log.d("CellConnMgr", "handleCellConn runable is null");
        mOnServiceComplete = runnable;
        return handleCellConn(i, j);
    }

    public void register(Context context)
    {
        Log.d("CellConnMgr", "register");
        mCtx = context;
        Intent intent = new Intent("android.intent.action.CELLCONNSERVICE");
        mCtx.startService(intent);
        mCtx.bindService(intent, mConnection, 1);
    }

    public void unregister()
    {
        Log.d("CellConnMgr", "unregister");
        if (mService != null)
            mCtx.unbindService(mConnection);
    }



/*
    static int access$002(CellConnMgr cellconnmgr, int i)
    {
        cellconnmgr.mResult = i;
        return i;
    }

*/





/*
    static int access$302(CellConnMgr cellconnmgr, int i)
    {
        cellconnmgr.mPreferSlot = i;
        return i;
    }

*/



/*
    static IPhoneStatesMgrService access$402(CellConnMgr cellconnmgr, IPhoneStatesMgrService iphonestatesmgrservice)
    {
        cellconnmgr.mService = iphonestatesmgrservice;
        return iphonestatesmgrservice;
    }

*/



}
