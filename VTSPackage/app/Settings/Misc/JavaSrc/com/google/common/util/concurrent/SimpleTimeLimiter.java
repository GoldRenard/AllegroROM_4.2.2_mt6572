// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.ObjectArrays;
import com.google.common.collect.Sets;
import java.lang.reflect.*;
import java.util.Set;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            TimeLimiter, Uninterruptibles, UncheckedTimeoutException

public final class SimpleTimeLimiter
    implements TimeLimiter
{

    private final ExecutorService executor;

    public SimpleTimeLimiter()
    {
        this(Executors.newCachedThreadPool());
    }

    public SimpleTimeLimiter(ExecutorService executorservice)
    {
        executor = (ExecutorService)Preconditions.checkNotNull(executorservice);
    }

    private static boolean declaresInterruptedEx(Method method)
    {
        Class aclass[] = method.getExceptionTypes();
        int i = aclass.length;
        for (int j = 0; j < i; j++)
            if (aclass[j] == java/lang/InterruptedException)
                return true;

        return false;
    }

    private static Set findInterruptibleMethods(Class class1)
    {
        java.util.HashSet hashset = Sets.newHashSet();
        Method amethod[] = class1.getMethods();
        int i = amethod.length;
        for (int j = 0; j < i; j++)
        {
            Method method = amethod[j];
            if (declaresInterruptedEx(method))
                hashset.add(method);
        }

        return hashset;
    }

    private static Object newProxy(Class class1, InvocationHandler invocationhandler)
    {
        return class1.cast(Proxy.newProxyInstance(class1.getClassLoader(), new Class[] {
            class1
        }, invocationhandler));
    }

    private static Exception throwCause(Exception exception, boolean flag)
        throws Exception
    {
        Throwable throwable = exception.getCause();
        if (throwable == null)
            throw exception;
        if (flag)
            throwable.setStackTrace((StackTraceElement[])ObjectArrays.concat(throwable.getStackTrace(), exception.getStackTrace(), java/lang/StackTraceElement));
        if (throwable instanceof Exception)
            throw (Exception)throwable;
        if (throwable instanceof Error)
            throw (Error)throwable;
        else
            throw exception;
    }

    public Object callWithTimeout(Callable callable, long l, TimeUnit timeunit, boolean flag)
        throws Exception
    {
        Future future;
        Preconditions.checkNotNull(callable);
        Preconditions.checkNotNull(timeunit);
        boolean flag1;
        Object aobj[];
        Object obj1;
        if (l > 0L)
            flag1 = true;
        else
            flag1 = false;
        aobj = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag1, "timeout must be positive: %s", aobj);
        future = executor.submit(callable);
        if (!flag)
            break MISSING_BLOCK_LABEL_104;
        obj1 = future.get(l, timeunit);
        return obj1;
        InterruptedException interruptedexception;
        interruptedexception;
        Object obj;
        try
        {
            future.cancel(true);
            throw interruptedexception;
        }
        catch (ExecutionException executionexception)
        {
            throw throwCause(executionexception, true);
        }
        catch (TimeoutException timeoutexception)
        {
            future.cancel(true);
            throw new UncheckedTimeoutException(timeoutexception);
        }
        obj = Uninterruptibles.getUninterruptibly(future, l, timeunit);
        return obj;
    }

    public Object newProxy(final Object target, Class class1, final long timeoutDuration, final TimeUnit timeoutUnit)
    {
        Preconditions.checkNotNull(target);
        Preconditions.checkNotNull(class1);
        Preconditions.checkNotNull(timeoutUnit);
        boolean flag;
        if (timeoutDuration > 0L)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, (new StringBuilder()).append("bad timeout: ").append(timeoutDuration).toString());
        Preconditions.checkArgument(class1.isInterface(), "interfaceType must be an interface type");
        return newProxy(class1, new InvocationHandler() {

            final SimpleTimeLimiter this$0;
            final Set val$interruptibleMethods;
            final Object val$target;
            final long val$timeoutDuration;
            final TimeUnit val$timeoutUnit;

            public Object invoke(Object obj, final Method method, Object aobj[])
                throws Throwable
            {
                Callable callable = ((_cls1) (aobj)). new Callable() {

                    final _cls1 this$1;
                    final Object val$args[];
                    final Method val$method;

                    public Object call()
                        throws Exception
                    {
                        Object obj;
                        try
                        {
                            obj = method.invoke(target, args);
                        }
                        catch (InvocationTargetException invocationtargetexception)
                        {
                            SimpleTimeLimiter.throwCause(invocationtargetexception, false);
                            throw new AssertionError("can't get here");
                        }
                        return obj;
                    }

            
            {
                this$1 = final__pcls1;
                method = method1;
                args = _5B_Ljava.lang.Object_3B_.this;
                super();
            }
                }
;
                return callWithTimeout(callable, timeoutDuration, timeoutUnit, interruptibleMethods.contains(method));
            }

            
            {
                this$0 = SimpleTimeLimiter.this;
                target = obj;
                timeoutDuration = l;
                timeoutUnit = timeunit;
                interruptibleMethods = set;
                super();
            }
        }
);
    }

}
