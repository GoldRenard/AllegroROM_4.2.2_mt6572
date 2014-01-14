// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;

// Referenced classes of package com.google.common.eventbus:
//            EventBus, EventHandler

public class AsyncEventBus extends EventBus
{

    private final ConcurrentLinkedQueue eventsToDispatch;
    private final Executor executor;

    public AsyncEventBus(String s, Executor executor1)
    {
        super(s);
        eventsToDispatch = new ConcurrentLinkedQueue();
        executor = executor1;
    }

    public AsyncEventBus(Executor executor1)
    {
        eventsToDispatch = new ConcurrentLinkedQueue();
        executor = executor1;
    }

    protected void dispatch(final Object event, final EventHandler handler)
    {
        executor.execute(new Runnable() {

            final AsyncEventBus this$0;
            final Object val$event;
            final EventHandler val$handler;

            public void run()
            {
                dispatch(event, handler);
            }

            
            {
                this$0 = AsyncEventBus.this;
                event = obj;
                handler = eventhandler;
                super();
            }
        }
);
    }

    protected void dispatchQueuedEvents()
    {
        do
        {
            EventBus.EventWithHandler eventwithhandler = (EventBus.EventWithHandler)eventsToDispatch.poll();
            if (eventwithhandler == null)
                return;
            dispatch(eventwithhandler.event, eventwithhandler.handler);
        } while (true);
    }

    protected void enqueueEvent(Object obj, EventHandler eventhandler)
    {
        eventsToDispatch.offer(new EventBus.EventWithHandler(obj, eventhandler));
    }

}
