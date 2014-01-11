// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.*;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.Serializable;
import java.util.Map;

public abstract class CacheLoader
{
    private static final class FunctionToCacheLoader extends CacheLoader
        implements Serializable
    {

        private static final long serialVersionUID;
        private final Function computingFunction;

        public Object load(Object obj)
        {
            return computingFunction.apply(obj);
        }

        public FunctionToCacheLoader(Function function)
        {
            computingFunction = (Function)Preconditions.checkNotNull(function);
        }
    }

    public static final class InvalidCacheLoadException extends RuntimeException
    {

        public InvalidCacheLoadException(String s)
        {
            super(s);
        }
    }

    private static final class SupplierToCacheLoader extends CacheLoader
        implements Serializable
    {

        private static final long serialVersionUID;
        private final Supplier computingSupplier;

        public Object load(Object obj)
        {
            return computingSupplier.get();
        }

        public SupplierToCacheLoader(Supplier supplier)
        {
            computingSupplier = (Supplier)Preconditions.checkNotNull(supplier);
        }
    }

    static final class UnsupportedLoadingOperationException extends UnsupportedOperationException
    {

    }



    public static CacheLoader from(Function function)
    {
        return new FunctionToCacheLoader(function);
    }

    public static CacheLoader from(Supplier supplier)
    {
        return new SupplierToCacheLoader(supplier);
    }

    public abstract Object load(Object obj)
        throws Exception;

    public Map loadAll(Iterable iterable)
        throws Exception
    {
        throw new UnsupportedLoadingOperationException();
    }

    public ListenableFuture reload(Object obj, Object obj1)
        throws Exception
    {
        return Futures.immediateFuture(load(obj));
    }
}
