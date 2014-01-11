// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Service;
import android.content.Intent;
import android.os.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.android.phone:
//            INetworkQueryServiceCallback, INetworkQueryService

public class NetworkQueryService extends Service
{
    public class LocalBinder extends Binder
    {

        final NetworkQueryService this$0;

        public INetworkQueryService getService()
        {
            return mBinder;
        }

        public LocalBinder()
        {
            this$0 = NetworkQueryService.this;
            super();
        }
    }


    private static final boolean DBG = true;
    private static final int EVENT_NETWORK_SCAN_COMPLETED = 100;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_2 = 101;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_3 = 102;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_4 = 103;
    private static final String LOG_TAG = "Settings/NetworkQuery";
    public static final int QUERY_EXCEPTION = 1;
    private static final int QUERY_IS_RUNNING = -2;
    public static final int QUERY_OK = 0;
    private static final int QUERY_READY = -1;
    private final INetworkQueryService.Stub mBinder = new INetworkQueryService.Stub() {

        final NetworkQueryService this$0;

        public void startNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
        {
            if (inetworkqueryservicecallback == null)
                break MISSING_BLOCK_LABEL_186;
            RemoteCallbackList remotecallbacklist = mCallbacks;
            remotecallbacklist;
            JVM INSTR monitorenter ;
            mCallbacks.register(inetworkqueryservicecallback);
            NetworkQueryService.log((new StringBuilder()).append("registering callback ").append(inetworkqueryservicecallback.getClass().toString()).toString());
            mState;
            JVM INSTR tableswitch -2 -1: default 84
        //                       -2 178
        //                       -1 87;
               goto _L1 _L2 _L3
_L1:
            break; /* Loop/switch isn't completed */
_L2:
            break MISSING_BLOCK_LABEL_178;
_L4:
            return;
_L3:
            int i = getSimMsgType(mSimId);
            NetworkQueryService.log((new StringBuilder()).append("startNetworkQuery---msgType=").append(i).toString());
            mGeminiPhone.getAvailableNetworksGemini(mHandler.obtainMessage(i), mSimId);
            mState = -2;
            NetworkQueryService.log("starting new query");
              goto _L4
            Exception exception;
            exception;
            remotecallbacklist;
            JVM INSTR monitorexit ;
            throw exception;
            NetworkQueryService.log("query already in progress");
              goto _L4
        }

        public void stopNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
        {
            if (inetworkqueryservicecallback != null)
            {
                synchronized (mCallbacks)
                {
                    NetworkQueryService.log((new StringBuilder()).append("unregistering callback ").append(inetworkqueryservicecallback.getClass().toString()).toString());
                    mCallbacks.unregister(inetworkqueryservicecallback);
                }
                return;
            } else
            {
                return;
            }
            exception;
            remotecallbacklist;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$0 = NetworkQueryService.this;
                super();
            }
    }
;
    final RemoteCallbackList mCallbacks = new RemoteCallbackList();
    private GeminiPhone mGeminiPhone;
    Handler mHandler;
    private final IBinder mLocalBinder = new LocalBinder();
    private Phone mPhone;
    private int mSimId;
    private int mState;

    public NetworkQueryService()
    {
        mSimId = -1;
        mHandler = new Handler() {

            final NetworkQueryService this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 103: // 'g'
                    NetworkQueryService.log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED--mSimId:").append(mSimId).toString());
                    if (mSimId != 3)
                    {
                        NetworkQueryService.log((new StringBuilder()).append("SIM").append(mSimId).append(" receives the query result of SIM4").toString());
                        mState = -1;
                        mGeminiPhone.getAvailableNetworksGemini(mHandler.obtainMessage(getSimMsgType(mSimId)), mSimId);
                        mState = -2;
                        return;
                    } else
                    {
                        NetworkQueryService.log("scan completed, broadcasting results");
                        broadcastQueryResults((AsyncResult)message.obj);
                        return;
                    }

                case 102: // 'f'
                    NetworkQueryService.log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED--mSimId:").append(mSimId).toString());
                    if (mSimId != 2)
                    {
                        NetworkQueryService.log((new StringBuilder()).append("SIM").append(mSimId).append(" receives the query result of SIM3").toString());
                        mState = -1;
                        mGeminiPhone.getAvailableNetworksGemini(mHandler.obtainMessage(getSimMsgType(mSimId)), mSimId);
                        mState = -2;
                        return;
                    } else
                    {
                        NetworkQueryService.log("scan completed, broadcasting results");
                        broadcastQueryResults((AsyncResult)message.obj);
                        return;
                    }

                case 101: // 'e'
                    NetworkQueryService.log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED_2--mSimId:").append(mSimId).toString());
                    if (mSimId != 1)
                    {
                        NetworkQueryService.log((new StringBuilder()).append("SIM").append(mSimId).append(" receives the query result of SIM2").toString());
                        mState = -1;
                        mGeminiPhone.getAvailableNetworksGemini(mHandler.obtainMessage(getSimMsgType(mSimId)), mSimId);
                        mState = -2;
                        return;
                    } else
                    {
                        NetworkQueryService.log("scan completed, broadcasting results.");
                        broadcastQueryResults((AsyncResult)message.obj);
                        return;
                    }

                case 100: // 'd'
                    NetworkQueryService.log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED--mSimId:").append(mSimId).toString());
                    if (mSimId != 0)
                    {
                        NetworkQueryService.log((new StringBuilder()).append("SIM").append(mSimId).append(" receives the query result of SIM1").toString());
                        mState = -1;
                        mGeminiPhone.getAvailableNetworksGemini(mHandler.obtainMessage(getSimMsgType(mSimId)), mSimId);
                        mState = -2;
                        return;
                    } else
                    {
                        NetworkQueryService.log("scan completed, broadcasting results");
                        broadcastQueryResults((AsyncResult)message.obj);
                        return;
                    }
                }
            }

            
            {
                this$0 = NetworkQueryService.this;
                super();
            }
        }
;
    }

    private void broadcastQueryResults(AsyncResult asyncresult)
    {
        RemoteCallbackList remotecallbacklist = mCallbacks;
        remotecallbacklist;
        JVM INSTR monitorenter ;
        mState = -1;
        if (asyncresult != null)
            break MISSING_BLOCK_LABEL_24;
        log("AsyncResult is null.");
        remotecallbacklist;
        JVM INSTR monitorexit ;
        return;
        int i;
        int j;
        INetworkQueryServiceCallback inetworkqueryservicecallback;
        if (asyncresult.exception == null)
            i = 0;
        else
            i = 1;
        log((new StringBuilder()).append("AsyncResult has exception ").append(i).toString());
        j = -1 + mCallbacks.beginBroadcast();
_L2:
        if (j < 0)
            break; /* Loop/switch isn't completed */
        inetworkqueryservicecallback = (INetworkQueryServiceCallback)mCallbacks.getBroadcastItem(j);
        log((new StringBuilder()).append("broadcasting results to ").append(inetworkqueryservicecallback.getClass().toString()).toString());
        inetworkqueryservicecallback.onQueryComplete((ArrayList)asyncresult.result, i);
_L3:
        j--;
        if (true) goto _L2; else goto _L1
        RemoteException remoteexception;
        remoteexception;
        log((new StringBuilder()).append("e = ").append(remoteexception).toString());
          goto _L3
        Exception exception;
        exception;
        remotecallbacklist;
        JVM INSTR monitorexit ;
        throw exception;
_L1:
        mCallbacks.finishBroadcast();
        remotecallbacklist;
        JVM INSTR monitorexit ;
    }

    private int getSimMsgType(int i)
    {
        switch (mSimId)
        {
        case 3: // '\003'
            return 103;

        case 2: // '\002'
            return 102;

        case 1: // '\001'
            return 101;

        case 0: // '\0'
            return 100;
        }
        log("Error wrong sim id");
        return 100;
    }

    private static void log(String s)
    {
        Xlog.d("Settings/NetworkQuery", s);
    }

    public IBinder onBind(Intent intent)
    {
        log("binding service implementation");
        return mLocalBinder;
    }

    public void onCreate()
    {
        mState = -1;
        mPhone = PhoneFactory.getDefaultPhone();
        mGeminiPhone = (GeminiPhone)PhoneFactory.getDefaultPhone();
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        log("onStartCommand");
        if (intent != null)
            mSimId = intent.getIntExtra("simId", -1);
        else
            mSimId = -1;
        return 2;
    }






/*
    static int access$302(NetworkQueryService networkqueryservice, int i)
    {
        networkqueryservice.mState = i;
        return i;
    }

*/



}
