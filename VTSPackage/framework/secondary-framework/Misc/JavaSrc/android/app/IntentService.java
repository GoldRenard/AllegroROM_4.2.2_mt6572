// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Intent;
import android.os.*;

// Referenced classes of package android.app:
//            Service

public abstract class IntentService extends Service
{
    private final class ServiceHandler extends Handler
    {

        final IntentService this$0;

        public void handleMessage(Message message)
        {
            onHandleIntent((Intent)message.obj);
            stopSelf(message.arg1);
        }

        public ServiceHandler(Looper looper)
        {
            this$0 = IntentService.this;
            super(looper);
        }
    }


    private String mName;
    private boolean mRedelivery;
    private volatile ServiceHandler mServiceHandler;
    private volatile Looper mServiceLooper;

    public IntentService(String s)
    {
        mName = s;
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onCreate()
    {
        super.onCreate();
        HandlerThread handlerthread = new HandlerThread((new StringBuilder()).append("IntentService[").append(mName).append("]").toString());
        handlerthread.start();
        mServiceLooper = handlerthread.getLooper();
        mServiceHandler = new ServiceHandler(mServiceLooper);
    }

    public void onDestroy()
    {
        mServiceLooper.quit();
    }

    protected abstract void onHandleIntent(Intent intent);

    public void onStart(Intent intent, int i)
    {
        Message message = mServiceHandler.obtainMessage();
        message.arg1 = i;
        message.obj = intent;
        mServiceHandler.sendMessage(message);
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        onStart(intent, j);
        return !mRedelivery ? 2 : 3;
    }

    public void setIntentRedelivery(boolean flag)
    {
        mRedelivery = flag;
    }
}
