// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import java.util.concurrent.Executor;

// Referenced classes of package com.google.common.cache:
//            RemovalListener, RemovalNotification

public final class RemovalListeners
{

    private RemovalListeners()
    {
    }

    public static RemovalListener asynchronous(RemovalListener removallistener, Executor executor)
    {
        return new RemovalListener(executor, removallistener) {

            final Executor val$executor;
            final RemovalListener val$listener;

            public void onRemoval(RemovalNotification removalnotification)
            {
                executor.execute(removalnotification. new Runnable() {

                    final _cls1 this$0;
                    final RemovalNotification val$notification;

                    public void run()
                    {
                        listener.onRemoval(notification);
                    }

            
            {
                this$0 = final__pcls1;
                notification = RemovalNotification.this;
                super();
            }
                }
);
            }

            
            {
                executor = executor1;
                listener = removallistener;
                super();
            }
        }
;
    }
}
