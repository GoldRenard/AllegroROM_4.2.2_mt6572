// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.screenshot;

import android.app.Service;
import android.content.Intent;
import android.os.*;

// Referenced classes of package com.android.systemui.screenshot:
//            GlobalScreenshot

public class TakeScreenshotService extends Service
{

    private static final String TAG = "TakeScreenshotService";
    private static GlobalScreenshot mScreenshot;
    private Handler mHandler;

    public TakeScreenshotService()
    {
        mHandler = new Handler() {

            final TakeScreenshotService this$0;

            public void handleMessage(Message message)
            {
                boolean flag = true;
                switch (message.what)
                {
                case 1: // '\001'
                    Messenger messenger = message.replyTo;
                    if (TakeScreenshotService.mScreenshot == null)
                        TakeScreenshotService.mScreenshot = new GlobalScreenshot(TakeScreenshotService.this);
                    GlobalScreenshot globalscreenshot = TakeScreenshotService.mScreenshot;
                    Runnable runnable = messenger. new Runnable() {

                        final _cls1 this$1;
                        final Messenger val$callback;

                        public void run()
                        {
                            Message message = Message.obtain(null, 1);
                            try
                            {
                                callback.send(message);
                                return;
                            }
                            catch (RemoteException remoteexception)
                            {
                                return;
                            }
                        }

            
            {
                this$1 = final__pcls1;
                callback = Messenger.this;
                super();
            }
                    }
;
                    boolean flag1;
                    if (message.arg1 > 0)
                        flag1 = flag;
                    else
                        flag1 = false;
                    if (message.arg2 <= 0)
                        flag = false;
                    globalscreenshot.takeScreenshot(runnable, flag1, flag);
                    return;
                }
            }

            
            {
                this$0 = TakeScreenshotService.this;
                super();
            }
        }
;
    }

    public IBinder onBind(Intent intent)
    {
        return (new Messenger(mHandler)).getBinder();
    }



/*
    static GlobalScreenshot access$002(GlobalScreenshot globalscreenshot)
    {
        mScreenshot = globalscreenshot;
        return globalscreenshot;
    }

*/
}
