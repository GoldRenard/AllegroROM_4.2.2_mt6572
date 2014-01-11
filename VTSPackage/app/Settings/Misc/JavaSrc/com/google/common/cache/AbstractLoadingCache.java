// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ExecutionException;

// Referenced classes of package com.google.common.cache:
//            AbstractCache, LoadingCache

public abstract class AbstractLoadingCache extends AbstractCache
    implements LoadingCache
{


    public final Object apply(Object obj)
    {
        return getUnchecked(obj);
    }

    public ImmutableMap getAll(Iterable iterable)
        throws ExecutionException
    {
        java.util.LinkedHashMap linkedhashmap = Maps.newLinkedHashMap();
        Iterator iterator = iterable.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Object obj = iterator.next();
            if (!linkedhashmap.containsKey(obj))
                linkedhashmap.put(obj, get(obj));
        } while (true);
        return ImmutableMap.copyOf(linkedhashmap);
    }

    public Object getUnchecked(Object obj)
    {
        Object obj1;
        try
        {
            obj1 = get(obj);
        }
        catch (ExecutionException executionexception)
        {
            throw new UncheckedExecutionException(executionexception.getCause());
        }
        return obj1;
    }

    public void refresh(Object obj)
    {
        throw new UnsupportedOperationException();
    }
}
