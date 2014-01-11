// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.*;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class PhoneInterfaceManagerEx extends com.mediatek.common.telephony.ITelephonyEx.Stub
{
    private final class MainThreadHandler extends Handler
    {

        final PhoneInterfaceManagerEx this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 11 14: default 36
        //                       11 37
        //                       12 103
        //                       13 209
        //                       14 281;
               goto _L1 _L2 _L3 _L4 _L5
_L1:
            return;
_L2:
            MainThreadRequest mainthreadrequest3 = (MainThreadRequest)message.obj;
            Message message2 = obtainMessage(12, mainthreadrequest3);
            if (mainthreadrequest3.argument != null)
            {
                int i = ((ScAddrGemini)mainthreadrequest3.argument).simId;
                Log.d("PhoneInterfaceManagerEx", "[sca get sc gemini");
                ((GeminiPhone)mPhone).getSmscAddressGemini(message2, i);
                return;
            }
            continue; /* Loop/switch isn't completed */
_L3:
            AsyncResult asyncresult1;
            MainThreadRequest mainthreadrequest2;
            asyncresult1 = (AsyncResult)message.obj;
            mainthreadrequest2 = (MainThreadRequest)asyncresult1.userObj;
            if (asyncresult1.exception != null || asyncresult1.result == null) goto _L7; else goto _L6
_L6:
            Log.d("PhoneInterfaceManagerEx", "[sca get result");
            mainthreadrequest2.result = asyncresult1.result;
_L8:
            mainthreadrequest2;
            JVM INSTR monitorenter ;
            Log.d("PhoneInterfaceManagerEx", "[sca notify sleep thread");
            mainthreadrequest2.notifyAll();
            mainthreadrequest2;
            JVM INSTR monitorexit ;
            return;
            Exception exception1;
            exception1;
            mainthreadrequest2;
            JVM INSTR monitorexit ;
            throw exception1;
_L7:
            Log.d("PhoneInterfaceManagerEx", "[sca Fail to get sc address");
            mainthreadrequest2.result = new String("");
            if (true) goto _L8; else goto _L4
_L4:
            MainThreadRequest mainthreadrequest1 = (MainThreadRequest)message.obj;
            Message message1 = obtainMessage(14, mainthreadrequest1);
            ScAddrGemini scaddrgemini = (ScAddrGemini)mainthreadrequest1.argument;
            if (scaddrgemini.simId != -1)
            {
                Log.d("PhoneInterfaceManagerEx", "[sca set sc gemini");
                ((GeminiPhone)mPhone).setSmscAddressGemini(scaddrgemini.scAddr, message1, scaddrgemini.simId);
                return;
            }
            if (true) goto _L1; else goto _L5
_L5:
            AsyncResult asyncresult = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest = (MainThreadRequest)asyncresult.userObj;
            Exception exception;
            if (asyncresult.exception != null)
                Log.d("PhoneInterfaceManagerEx", "[sca Fail: set sc address");
            else
                Log.d("PhoneInterfaceManagerEx", "[sca Done: set sc address");
            mainthreadrequest.result = new Object();
            mainthreadrequest;
            JVM INSTR monitorenter ;
            mainthreadrequest.notifyAll();
            mainthreadrequest;
            JVM INSTR monitorexit ;
            return;
            exception;
            mainthreadrequest;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private MainThreadHandler()
        {
            this$0 = PhoneInterfaceManagerEx.this;
            super();
        }

    }

    private static final class MainThreadRequest
    {

        public Object argument;
        public Object result;

        public MainThreadRequest(Object obj)
        {
            argument = obj;
        }
    }

    private static class QueryAdnInfoThread extends Thread
    {

        private static final int EVENT_QUERY_PHB_ADN_INFO = 100;
        private boolean mDone;
        private Handler mHandler;
        private int mSimId;
        Phone myPhone;
        private int recordSize[];

        public int[] GetAdnStorageInfo()
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            Message message;
            IccFileHandler iccfilehandler;
            message = Message.obtain(mHandler, 100);
            iccfilehandler = ((GeminiPhone)myPhone).getIccFileHandlerGemini(mSimId);
            if (iccfilehandler == null)
                break MISSING_BLOCK_LABEL_108;
            iccfilehandler.getPhbRecordInfo(message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_120;
            Log.d("PhoneInterfaceManagerEx", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            Log.d("PhoneInterfaceManagerEx", "GetAdnStorageInfo: filehandle is null.");
            this;
            JVM INSTR monitorexit ;
            return null;
            int ai[];
            Log.d("PhoneInterfaceManagerEx", "done");
            ai = recordSize;
            this;
            JVM INSTR monitorexit ;
            return ai;
        }

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final QueryAdnInfoThread this$0;

                public void handleMessage(Message message)
                {
                    AsyncResult asyncresult;
                    asyncresult = (AsyncResult)message.obj;
                    switch (message.what)
                    {
                    default:
                        return;

                    case 100: // 'd'
                        Log.d("PhoneInterfaceManagerEx", "EVENT_QUERY_PHB_ADN_INFO");
                        break;
                    }
                    QueryAdnInfoThread queryadninfothread = QueryAdnInfoThread.this;
                    queryadninfothread;
                    JVM INSTR monitorenter ;
                    int ai[];
                    mDone = true;
                    ai = (int[])(int[])asyncresult.result;
                    if (ai == null)
                        break MISSING_BLOCK_LABEL_242;
                    recordSize = new int[4];
                    recordSize[0] = ai[0];
                    recordSize[1] = ai[1];
                    recordSize[2] = ai[2];
                    recordSize[3] = ai[3];
                    Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("recordSize[0]=").append(recordSize[0]).append(",recordSize[1]=").append(recordSize[1]).append("recordSize[2]=").append(recordSize[2]).append(",recordSize[3]=").append(recordSize[3]).toString());
_L1:
                    notifyAll();
                    queryadninfothread;
                    JVM INSTR monitorexit ;
                    return;
                    Exception exception;
                    exception;
                    queryadninfothread;
                    JVM INSTR monitorexit ;
                    throw exception;
                    recordSize = new int[4];
                    recordSize[0] = 0;
                    recordSize[1] = 0;
                    recordSize[2] = 0;
                    recordSize[3] = 0;
                      goto _L1
                }

            
            {
                this$0 = QueryAdnInfoThread.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setSimId(int i)
        {
            mSimId = i;
            mDone = false;
        }


/*
        static boolean access$502(QueryAdnInfoThread queryadninfothread, boolean flag)
        {
            queryadninfothread.mDone = flag;
            return flag;
        }

*/



/*
        static int[] access$602(QueryAdnInfoThread queryadninfothread, int ai[])
        {
            queryadninfothread.recordSize = ai;
            return ai;
        }

*/

        public QueryAdnInfoThread(int i, Phone phone)
        {
            mDone = false;
            mSimId = i;
            myPhone = phone;
        }
    }

    private class ScAddrGemini
    {

        public String scAddr;
        public int simId;
        final PhoneInterfaceManagerEx this$0;

        public ScAddrGemini(String s, int i)
        {
            this$0 = PhoneInterfaceManagerEx.this;
            super();
            scAddr = s;
            if (i != 0 && i != 1 && i != 2 && i != 3)
            {
                simId = 0;
                return;
            } else
            {
                simId = i;
                return;
            }
        }
    }

    private static class UnlockSim extends Thread
    {

        private static final int QUERY_NETWORK_STATUS_COMPLETE = 100;
        private static final int SUPPLY_NETWORK_LOCK_COMPLETE = 101;
        private boolean mDone;
        private Handler mHandler;
        private boolean mResult;
        private int mSIMMELockRetryCount;
        private final IccCard mSimCard;
        private int mVerifyResult;

        Bundle queryNetworkLock(int i)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Log.d("PhoneInterfaceManagerEx", "Enter queryNetworkLock");
            Message message = Message.obtain(mHandler, 100);
            mSimCard.QueryIccNetworkLock(i, 4, null, null, null, null, message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_107;
            Log.d("PhoneInterfaceManagerEx", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            Bundle bundle;
            bundle = new Bundle();
            bundle.putBoolean("com.android.phone.QUERY_SIMME_LOCK_RESULT", mResult);
            bundle.putInt("com.android.phone.SIMME_LOCK_LEFT_COUNT", mSIMMELockRetryCount);
            Log.d("PhoneInterfaceManagerEx", "done");
            this;
            JVM INSTR monitorexit ;
            return bundle;
        }

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final UnlockSim this$0;

                public void handleMessage(Message message)
                {
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    message.what;
                    JVM INSTR tableswitch 100 101: default 36
                //                               100 37
                //                               101 195;
                       goto _L1 _L2 _L3
_L1:
                    return;
_L2:
                    UnlockSim unlocksim1 = UnlockSim.this;
                    unlocksim1;
                    JVM INSTR monitorenter ;
                    int ai[] = (int[])(int[])asyncresult.result;
                    if (asyncresult.exception == null) goto _L5; else goto _L4
_L4:
                    Log.d("PhoneInterfaceManagerEx", "Query network lock fail");
                    mResult = false;
                    mDone = true;
_L6:
                    return;
                    Exception exception1;
                    exception1;
                    unlocksim1;
                    JVM INSTR monitorexit ;
                    throw exception1;
_L5:
                    mSIMMELockRetryCount = ai[2];
                    Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("[SIMQUERY] Category = ").append(ai[0]).append(" ,Network status =").append(ai[1]).append(" ,Retry count = ").append(ai[2]).toString());
                    mDone = true;
                    mResult = true;
                    notifyAll();
                      goto _L6
_L3:
                    Log.d("PhoneInterfaceManagerEx", "SUPPLY_NETWORK_LOCK_COMPLETE");
                    UnlockSim unlocksim = UnlockSim.this;
                    unlocksim;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null || !(asyncresult.exception instanceof CommandException)) goto _L8; else goto _L7
_L7:
                    Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("ar.exception ").append(asyncresult.exception).toString());
                    if (((CommandException)asyncresult.exception).getCommandError() != com.android.internal.telephony.CommandException.Error.PASSWORD_INCORRECT) goto _L10; else goto _L9
_L9:
                    mVerifyResult = 1;
_L11:
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception;
                    exception;
                    unlocksim;
                    JVM INSTR monitorexit ;
                    throw exception;
_L10:
                    mVerifyResult = 2;
                      goto _L11
_L8:
                    mVerifyResult = 0;
                      goto _L11
                }

            
            {
                this$0 = UnlockSim.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        int supplyNetworkLock(String s)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Log.d("PhoneInterfaceManagerEx", "Enter supplyNetworkLock");
            Message message = Message.obtain(mHandler, 101);
            mSimCard.supplyNetworkDepersonalization(s, message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_102;
            Log.d("PhoneInterfaceManagerEx", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            int i;
            Log.d("PhoneInterfaceManagerEx", "done");
            i = mVerifyResult;
            this;
            JVM INSTR monitorexit ;
            return i;
        }


/*
        static boolean access$102(UnlockSim unlocksim, boolean flag)
        {
            unlocksim.mResult = flag;
            return flag;
        }

*/


/*
        static boolean access$202(UnlockSim unlocksim, boolean flag)
        {
            unlocksim.mDone = flag;
            return flag;
        }

*/


/*
        static int access$302(UnlockSim unlocksim, int i)
        {
            unlocksim.mSIMMELockRetryCount = i;
            return i;
        }

*/


/*
        static int access$402(UnlockSim unlocksim, int i)
        {
            unlocksim.mVerifyResult = i;
            return i;
        }

*/

        public UnlockSim(IccCard icccard)
        {
            mDone = false;
            mResult = false;
            mVerifyResult = -1;
            mSIMMELockRetryCount = -1;
            mSimCard = icccard;
        }
    }


    private static final int CMD_GET_SCA_DONE = 12;
    private static final int CMD_HANDLE_GET_SCA = 11;
    private static final int CMD_HANDLE_SET_SCA = 13;
    private static final int CMD_SET_SCA_DONE = 14;
    private static final boolean DBG = true;
    private static final String LOG_TAG = "PhoneInterfaceManagerEx";
    public static final int NETWORK_LOCK_TOTAL_COUNT = 5;
    public static final String QUERY_SIMME_LOCK_RESULT = "com.android.phone.QUERY_SIMME_LOCK_RESULT";
    public static final String SIMME_LOCK_LEFT_COUNT = "com.android.phone.SIMME_LOCK_LEFT_COUNT";
    public static final int VERIFY_INCORRECT_PASSWORD = 1;
    public static final int VERIFY_RESULT_EXCEPTION = 2;
    public static final int VERIFY_RESULT_PASS;
    private static PhoneInterfaceManagerEx sInstance;
    private QueryAdnInfoThread mAdnInfoThread;
    PhoneGlobals mApp;
    CallManager mCM;
    MainThreadHandler mMainThreadHandler;
    Phone mPhone;

    private PhoneInterfaceManagerEx(PhoneGlobals phoneglobals, Phone phone)
    {
        mAdnInfoThread = null;
        mApp = phoneglobals;
        mPhone = phone;
        mCM = PhoneGlobals.getInstance().mCM;
        mMainThreadHandler = new MainThreadHandler();
        publish();
    }

    static PhoneInterfaceManagerEx init(PhoneGlobals phoneglobals, Phone phone)
    {
        com/android/phone/PhoneInterfaceManagerEx;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_32;
        sInstance = new PhoneInterfaceManagerEx(phoneglobals, phone);
_L1:
        PhoneInterfaceManagerEx phoneinterfacemanagerex = sInstance;
        com/android/phone/PhoneInterfaceManagerEx;
        JVM INSTR monitorexit ;
        return phoneinterfacemanagerex;
        Log.wtf("PhoneInterfaceManagerEx", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/PhoneInterfaceManagerEx;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void log(String s)
    {
        Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("[PhoneIntfMgrEx] ").append(s).toString());
    }

    private void loge(String s)
    {
        Log.e("PhoneInterfaceManagerEx", (new StringBuilder()).append("[PhoneIntfMgrEx] ").append(s).toString());
    }

    private void publish()
    {
        log((new StringBuilder()).append("publish: ").append(this).toString());
        ServiceManager.addService("phoneEx", this);
    }

    private Object sendRequest(int i, Object obj)
    {
        MainThreadRequest mainthreadrequest;
        if (Looper.myLooper() == mMainThreadHandler.getLooper())
            throw new RuntimeException("This method will deadlock if called from the main thread.");
        mainthreadrequest = new MainThreadRequest(obj);
        mMainThreadHandler.obtainMessage(i, mainthreadrequest).sendToTarget();
        mainthreadrequest;
        JVM INSTR monitorenter ;
_L2:
        Object obj1 = mainthreadrequest.result;
        if (obj1 != null)
            break; /* Loop/switch isn't completed */
        try
        {
            mainthreadrequest.wait();
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
        mainthreadrequest;
        JVM INSTR monitorexit ;
        return mainthreadrequest.result;
        Exception exception;
        exception;
        mainthreadrequest;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int[] getAdnStorageInfo(int i)
    {
        Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("getAdnStorageInfo ").append(i).toString());
        if (mAdnInfoThread == null)
        {
            Log.d("PhoneInterfaceManagerEx", "getAdnStorageInfo new thread ");
            mAdnInfoThread = new QueryAdnInfoThread(i, mPhone);
            mAdnInfoThread.start();
        } else
        {
            mAdnInfoThread.setSimId(i);
            Log.d("PhoneInterfaceManagerEx", "getAdnStorageInfo old thread ");
        }
        return mAdnInfoThread.GetAdnStorageInfo();
    }

    public String getScAddressGemini(int i)
    {
        Log.d("PhoneInterfaceManagerEx", "getScAddressGemini: enter");
        if (i != 0 && i != 1 && i != 2 && i != 3)
        {
            Log.d("PhoneInterfaceManagerEx", "[sca Invalid sim id");
            return null;
        }
        final ScAddrGemini addr = new ScAddrGemini(null, i);
        Thread thread = new Thread() {

            final PhoneInterfaceManagerEx this$0;
            final ScAddrGemini val$addr;

            public void run()
            {
                try
                {
                    addr.scAddr = (String)sendRequest(11, addr);
                    return;
                }
                catch (RuntimeException runtimeexception)
                {
                    Log.e("PhoneInterfaceManagerEx", (new StringBuilder()).append("[sca getScAddressGemini ").append(runtimeexception).toString());
                }
            }

            
            {
                this$0 = PhoneInterfaceManagerEx.this;
                addr = scaddrgemini;
                super();
            }
        }
;
        thread.start();
        try
        {
            Log.d("PhoneInterfaceManagerEx", "[sca thread join");
            thread.join();
        }
        catch (InterruptedException interruptedexception)
        {
            Log.d("PhoneInterfaceManagerEx", "[sca throw interrupted exception");
        }
        Log.d("PhoneInterfaceManagerEx", (new StringBuilder()).append("getScAddressGemini: exit with ").append(addr.scAddr).toString());
        return addr.scAddr;
    }

    public int getSmsDefaultSim()
    {
        return ((GeminiPhone)mPhone).getSmsDefaultSim();
    }

    public boolean isPhbReady()
    {
        return isPhbReadyExt(mPhone.getMySimId());
    }

    public boolean isPhbReadyExt(int i)
    {
        String s;
        if (1 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.2", "false");
        else
        if (2 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.3", "false");
        else
        if (3 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.4", "false");
        else
            s = SystemProperties.get("gsm.sim.ril.phbready", "false");
        log((new StringBuilder()).append("[isPhbReady] sim id:").append(i).append(", isPhbReady: ").append(s).toString());
        return s.equals("true");
    }

    public boolean isPhbReadyGemini(int i)
    {
        String s;
        if (1 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.2", "false");
        else
        if (2 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.3", "false");
        else
        if (3 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.4", "false");
        else
            s = SystemProperties.get("gsm.sim.ril.phbready", "false");
        log((new StringBuilder()).append("[isPhbReady] sim id:").append(i).append(", isPhbReady: ").append(s).toString());
        return s.equals("true");
    }

    public Bundle queryNetworkLock(int i, int j)
    {
        Log.d("PhoneInterfaceManagerEx", "queryNetworkLock");
        UnlockSim unlocksim = new UnlockSim(((GeminiPhone)mPhone).getIccCardGemini(j));
        unlocksim.start();
        return unlocksim.queryNetworkLock(i);
    }

    public void setScAddressGemini(String s, int i)
    {
        Log.d("PhoneInterfaceManagerEx", "setScAddressGemini: enter");
        if (i != 0 && i != 1 && i != 2 && i != 3)
        {
            Log.d("PhoneInterfaceManagerEx", "[sca Invalid sim id");
            return;
        }
        Thread thread = new Thread() {

            final PhoneInterfaceManagerEx this$0;
            final ScAddrGemini val$addr;

            public void run()
            {
                try
                {
                    addr.scAddr = (String)sendRequest(13, addr);
                    return;
                }
                catch (RuntimeException runtimeexception)
                {
                    Log.e("PhoneInterfaceManagerEx", (new StringBuilder()).append("[sca setScAddressGemini ").append(runtimeexception).toString());
                }
            }

            
            {
                this$0 = PhoneInterfaceManagerEx.this;
                addr = scaddrgemini;
                super();
            }
        }
;
        thread.start();
        try
        {
            Log.d("PhoneInterfaceManagerEx", "[sca thread join");
            thread.join();
        }
        catch (InterruptedException interruptedexception)
        {
            Log.d("PhoneInterfaceManagerEx", "[sca throw interrupted exception");
        }
        Log.d("PhoneInterfaceManagerEx", "setScAddressGemini: exit");
    }

    public int supplyNetworkDepersonalization(String s, int i)
    {
        Log.d("PhoneInterfaceManagerEx", "supplyNetworkDepersonalization");
        UnlockSim unlocksim = new UnlockSim(((GeminiPhone)mPhone).getIccCardGemini(i));
        unlocksim.start();
        return unlocksim.supplyNetworkLock(s);
    }

}
