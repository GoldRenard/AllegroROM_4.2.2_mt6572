// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import com.google.common.cache.*;
import com.google.common.collect.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import java.util.concurrent.*;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.eventbus:
//            AnnotatedHandlerFinder, EventHandler, DeadEvent, HandlerFindingStrategy

public class EventBus
{
    static class EventWithHandler
    {

        final Object event;
        final EventHandler handler;

        public EventWithHandler(Object obj, EventHandler eventhandler)
        {
            event = obj;
            handler = eventhandler;
        }
    }


    private final ThreadLocal eventsToDispatch;
    private final HandlerFindingStrategy finder;
    private LoadingCache flattenHierarchyCache;
    private final SetMultimap handlersByType;
    private final ThreadLocal isDispatching;
    private final Logger logger;

    public EventBus()
    {
        this("default");
    }

    public EventBus(String s)
    {
        handlersByType = Multimaps.newSetMultimap(new ConcurrentHashMap(), new Supplier() {

            final EventBus this$0;

            public volatile Object get()
            {
                return get();
            }

            public Set get()
            {
                return new CopyOnWriteArraySet();
            }

            
            {
                this$0 = EventBus.this;
                super();
            }
        }
);
        finder = new AnnotatedHandlerFinder();
        eventsToDispatch = new ThreadLocal() {

            final EventBus this$0;

            protected volatile Object initialValue()
            {
                return initialValue();
            }

            protected ConcurrentLinkedQueue initialValue()
            {
                return new ConcurrentLinkedQueue();
            }

            
            {
                this$0 = EventBus.this;
                super();
            }
        }
;
        isDispatching = new ThreadLocal() {

            final EventBus this$0;

            protected Boolean initialValue()
            {
                return Boolean.valueOf(false);
            }

            protected volatile Object initialValue()
            {
                return initialValue();
            }

            
            {
                this$0 = EventBus.this;
                super();
            }
        }
;
        flattenHierarchyCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader() {

            final EventBus this$0;

            public volatile Object load(Object obj)
                throws Exception
            {
                return load((Class)obj);
            }

            public Set load(Class class1)
                throws Exception
            {
                java.util.LinkedList linkedlist = Lists.newLinkedList();
                java.util.HashSet hashset = Sets.newHashSet();
                linkedlist.add(class1);
                while (!linkedlist.isEmpty()) 
                {
                    Class class2 = (Class)linkedlist.remove(0);
                    hashset.add(class2);
                    Class class3 = class2.getSuperclass();
                    if (class3 != null)
                        linkedlist.add(class3);
                    Class aclass[] = class2.getInterfaces();
                    int i = aclass.length;
                    int j = 0;
                    while (j < i) 
                    {
                        linkedlist.add(aclass[j]);
                        j++;
                    }
                }
                return hashset;
            }

            
            {
                this$0 = EventBus.this;
                super();
            }
        }
);
        logger = Logger.getLogger((new StringBuilder()).append(com/google/common/eventbus/EventBus.getName()).append(".").append(s).toString());
    }

    protected void dispatch(Object obj, EventHandler eventhandler)
    {
        try
        {
            eventhandler.handleEvent(obj);
            return;
        }
        catch (InvocationTargetException invocationtargetexception)
        {
            logger.log(Level.SEVERE, (new StringBuilder()).append("Could not dispatch event: ").append(obj).append(" to handler ").append(eventhandler).toString(), invocationtargetexception);
        }
    }

    protected void dispatchQueuedEvents()
    {
        if (((Boolean)isDispatching.get()).booleanValue())
            return;
        isDispatching.set(Boolean.valueOf(true));
_L1:
        EventWithHandler eventwithhandler = (EventWithHandler)((ConcurrentLinkedQueue)eventsToDispatch.get()).poll();
        if (eventwithhandler == null)
        {
            isDispatching.set(Boolean.valueOf(false));
            return;
        }
        dispatch(eventwithhandler.event, eventwithhandler.handler);
          goto _L1
        Exception exception;
        exception;
        isDispatching.set(Boolean.valueOf(false));
        throw exception;
    }

    protected void enqueueEvent(Object obj, EventHandler eventhandler)
    {
        ((ConcurrentLinkedQueue)eventsToDispatch.get()).offer(new EventWithHandler(obj, eventhandler));
    }

    Set flattenHierarchy(Class class1)
    {
        Set set;
        try
        {
            set = (Set)flattenHierarchyCache.get(class1);
        }
        catch (ExecutionException executionexception)
        {
            throw Throwables.propagate(executionexception.getCause());
        }
        return set;
    }

    Set getHandlersForEventType(Class class1)
    {
        return handlersByType.get(class1);
    }

    protected Set newHandlerSet()
    {
        return new CopyOnWriteArraySet();
    }

    public void post(Object obj)
    {
        Set set = flattenHierarchy(obj.getClass());
        boolean flag = false;
        Iterator iterator = set.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Set set1 = getHandlersForEventType((Class)iterator.next());
            if (set1 != null && !set1.isEmpty())
            {
                flag = true;
                Iterator iterator1 = set1.iterator();
                while (iterator1.hasNext()) 
                    enqueueEvent(obj, (EventHandler)iterator1.next());
            }
        } while (true);
        if (!flag && !(obj instanceof DeadEvent))
            post(new DeadEvent(this, obj));
        dispatchQueuedEvents();
    }

    public void register(Object obj)
    {
        handlersByType.putAll(finder.findAllHandlers(obj));
    }

    public void unregister(Object obj)
    {
        for (Iterator iterator = finder.findAllHandlers(obj).asMap().entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            Set set = getHandlersForEventType((Class)entry.getKey());
            Collection collection = (Collection)entry.getValue();
            if (set != null && set.containsAll((Collection)entry.getValue()))
                set.removeAll(collection);
            else
                throw new IllegalArgumentException((new StringBuilder()).append("missing event handler for an annotated method. Is ").append(obj).append(" registered?").toString());
        }

    }
}
