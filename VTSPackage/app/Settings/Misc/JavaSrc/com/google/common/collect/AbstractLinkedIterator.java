// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.NoSuchElementException;

// Referenced classes of package com.google.common.collect:
//            UnmodifiableIterator

public abstract class AbstractLinkedIterator extends UnmodifiableIterator
{

    private Object nextOrNull;

    protected AbstractLinkedIterator(Object obj)
    {
        nextOrNull = obj;
    }

    protected abstract Object computeNext(Object obj);

    public final boolean hasNext()
    {
        return nextOrNull != null;
    }

    public final Object next()
    {
        if (!hasNext())
            throw new NoSuchElementException();
        Object obj = nextOrNull;
        nextOrNull = computeNext(nextOrNull);
        return obj;
        Exception exception;
        exception;
        nextOrNull = computeNext(nextOrNull);
        throw exception;
    }
}
