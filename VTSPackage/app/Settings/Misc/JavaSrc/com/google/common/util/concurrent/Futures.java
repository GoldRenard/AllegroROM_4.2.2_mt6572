// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package com.google.common.util.concurrent:
//            MoreExecutors, ListenableFuture, Uninterruptibles, SettableFuture, 
//            ExecutionError, UncheckedExecutionException, FutureCallback, CheckedFuture, 
//            AsyncFunction, AbstractFuture, AbstractCheckedFuture

public final class Futures
{
    private static class ChainingListenableFuture extends AbstractFuture
        implements Runnable
    {

        private AsyncFunction function;
        private ListenableFuture inputFuture;
        private final BlockingQueue mayInterruptIfRunningChannel;
        private final CountDownLatch outputCreated;
        private volatile ListenableFuture outputFuture;

        private void cancel(Future future, boolean flag)
        {
            if (future != null)
                future.cancel(flag);
        }

        public boolean cancel(boolean flag)
        {
            if (super.cancel(flag))
            {
                Uninterruptibles.putUninterruptibly(mayInterruptIfRunningChannel, Boolean.valueOf(flag));
                cancel(((Future) (inputFuture)), flag);
                cancel(((Future) (outputFuture)), flag);
                return true;
            } else
            {
                return false;
            }
        }

        public Object get()
            throws InterruptedException, ExecutionException
        {
            if (!isDone())
            {
                ListenableFuture listenablefuture = inputFuture;
                if (listenablefuture != null)
                    listenablefuture.get();
                outputCreated.await();
                ListenableFuture listenablefuture1 = outputFuture;
                if (listenablefuture1 != null)
                    listenablefuture1.get();
            }
            return super.get();
        }

        public Object get(long l, TimeUnit timeunit)
            throws TimeoutException, ExecutionException, InterruptedException
        {
            if (!isDone())
            {
                if (timeunit != TimeUnit.NANOSECONDS)
                {
                    l = TimeUnit.NANOSECONDS.convert(l, timeunit);
                    timeunit = TimeUnit.NANOSECONDS;
                }
                ListenableFuture listenablefuture = inputFuture;
                if (listenablefuture != null)
                {
                    long l2 = System.nanoTime();
                    listenablefuture.get(l, timeunit);
                    l -= Math.max(0L, System.nanoTime() - l2);
                }
                long l1 = System.nanoTime();
                if (!outputCreated.await(l, timeunit))
                    throw new TimeoutException();
                l -= Math.max(0L, System.nanoTime() - l1);
                ListenableFuture listenablefuture1 = outputFuture;
                if (listenablefuture1 != null)
                    listenablefuture1.get(l, timeunit);
            }
            return super.get(l, timeunit);
        }

        public void run()
        {
            Object obj = Uninterruptibles.getUninterruptibly(inputFuture);
            ListenableFuture listenablefuture;
            listenablefuture = function.apply(obj);
            outputFuture = listenablefuture;
            if (!isCancelled())
                break MISSING_BLOCK_LABEL_135;
            listenablefuture.cancel(((Boolean)Uninterruptibles.takeUninterruptibly(mayInterruptIfRunningChannel)).booleanValue());
            outputFuture = null;
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            CancellationException cancellationexception;
            cancellationexception;
            cancel(false);
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            ExecutionException executionexception;
            executionexception;
            setException(executionexception.getCause());
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            listenablefuture.addListener(listenablefuture. new Runnable() {

                final ChainingListenableFuture this$0;
                final ListenableFuture val$outputFuture;

                public void run()
                {
                    set(Uninterruptibles.getUninterruptibly(outputFuture));
                    ChainingListenableFuture.this.outputFuture = null;
                    return;
                    CancellationException cancellationexception;
                    cancellationexception;
                    cancel(false);
                    ChainingListenableFuture.this.outputFuture = null;
                    return;
                    ExecutionException executionexception;
                    executionexception;
                    setException(executionexception.getCause());
                    ChainingListenableFuture.this.outputFuture = null;
                    return;
                    Exception exception;
                    exception;
                    ChainingListenableFuture.this.outputFuture = null;
                    throw exception;
                }

            
            {
                this$0 = final_chaininglistenablefuture;
                outputFuture = ListenableFuture.this;
                super();
            }
            }
, MoreExecutors.sameThreadExecutor());
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            UndeclaredThrowableException undeclaredthrowableexception;
            undeclaredthrowableexception;
            setException(undeclaredthrowableexception.getCause());
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            Exception exception1;
            exception1;
            setException(exception1);
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            Error error;
            error;
            setException(error);
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            return;
            Exception exception;
            exception;
            function = null;
            inputFuture = null;
            outputCreated.countDown();
            throw exception;
        }


/*
        static ListenableFuture access$102(ChainingListenableFuture chaininglistenablefuture, ListenableFuture listenablefuture)
        {
            chaininglistenablefuture.outputFuture = listenablefuture;
            return listenablefuture;
        }

*/

        private ChainingListenableFuture(AsyncFunction asyncfunction, ListenableFuture listenablefuture)
        {
            mayInterruptIfRunningChannel = new LinkedBlockingQueue(1);
            outputCreated = new CountDownLatch(1);
            function = (AsyncFunction)Preconditions.checkNotNull(asyncfunction);
            inputFuture = (ListenableFuture)Preconditions.checkNotNull(listenablefuture);
        }

    }

    private static class ListFuture extends AbstractFuture
    {

        final boolean allMustSucceed;
        ImmutableList futures;
        final AtomicInteger remaining;
        List values;

        private void callAllGets()
            throws InterruptedException
        {
            ImmutableList immutablelist = futures;
            if (immutablelist == null || isDone()) goto _L2; else goto _L1
_L1:
            Iterator iterator = immutablelist.iterator();
_L6:
            ListenableFuture listenablefuture;
            if (!iterator.hasNext())
                break; /* Loop/switch isn't completed */
            listenablefuture = (ListenableFuture)iterator.next();
_L4:
            if (listenablefuture.isDone())
                continue; /* Loop/switch isn't completed */
            listenablefuture.get();
            if (true) goto _L4; else goto _L3
_L3:
            continue; /* Loop/switch isn't completed */
            Error error;
            error;
            throw error;
            InterruptedException interruptedexception;
            interruptedexception;
            throw interruptedexception;
            Throwable throwable;
            throwable;
            if (!allMustSucceed) goto _L4; else goto _L2
_L2:
            return;
            if (true) goto _L6; else goto _L5
_L5:
        }

        private void init(Executor executor)
        {
            addListener(new Runnable() {

                final ListFuture this$0;

                public void run()
                {
                    values = null;
                    futures = null;
                }

            
            {
                this$0 = ListFuture.this;
                super();
            }
            }
, MoreExecutors.sameThreadExecutor());
            if (futures.isEmpty())
            {
                set(Lists.newArrayList(values));
            } else
            {
                for (int i = 0; i < futures.size(); i++)
                    values.add(null);

                ImmutableList immutablelist = futures;
                for (final int index = 0; index < immutablelist.size(); index++)
                {
                    ListenableFuture listenablefuture = (ListenableFuture)immutablelist.get(index);
                    listenablefuture.addListener(listenablefuture. new Runnable() {

                        final ListFuture this$0;
                        final int val$index;
                        final ListenableFuture val$listenable;

                        public void run()
                        {
                            setOneValue(index, listenable);
                        }

            
            {
                this$0 = final_listfuture;
                index = i;
                listenable = ListenableFuture.this;
                super();
            }
                    }
, executor);
                }

            }
        }

        private void setOneValue(int i, Future future)
        {
            boolean flag;
            List list;
            flag = true;
            list = values;
            if (!isDone() && list != null) goto _L2; else goto _L1
_L1:
            Preconditions.checkState(allMustSucceed, "Future was done before all dependencies completed");
_L3:
            return;
_L2:
            Preconditions.checkState(future.isDone(), "Tried to set value from future which is not done");
            list.set(i, Uninterruptibles.getUninterruptibly(future));
            int k1 = remaining.decrementAndGet();
            if (k1 < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (k1 == 0)
            {
                List list6 = values;
                if (list6 != null)
                {
                    set(Lists.newArrayList(list6));
                    return;
                } else
                {
                    Preconditions.checkState(isDone());
                    return;
                }
            }
              goto _L3
            CancellationException cancellationexception;
            cancellationexception;
            if (allMustSucceed)
                cancel(false);
            int j1 = remaining.decrementAndGet();
            if (j1 < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (j1 == 0)
            {
                List list5 = values;
                if (list5 != null)
                {
                    set(Lists.newArrayList(list5));
                    return;
                } else
                {
                    Preconditions.checkState(isDone());
                    return;
                }
            }
              goto _L3
            ExecutionException executionexception;
            executionexception;
            if (allMustSucceed)
                setException(executionexception.getCause());
            int i1 = remaining.decrementAndGet();
            if (i1 < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (i1 == 0)
            {
                List list4 = values;
                if (list4 != null)
                {
                    set(Lists.newArrayList(list4));
                    return;
                } else
                {
                    Preconditions.checkState(isDone());
                    return;
                }
            }
              goto _L3
            RuntimeException runtimeexception;
            runtimeexception;
            if (allMustSucceed)
                setException(runtimeexception);
            int l = remaining.decrementAndGet();
            if (l < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (l == 0)
            {
                List list3 = values;
                if (list3 != null)
                {
                    set(Lists.newArrayList(list3));
                    return;
                } else
                {
                    Preconditions.checkState(isDone());
                    return;
                }
            }
              goto _L3
            Error error;
            error;
            setException(error);
            int k = remaining.decrementAndGet();
            List list2;
            if (k < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (k != 0) goto _L3; else goto _L4
_L4:
            list2 = values;
            if (list2 != null)
            {
                set(Lists.newArrayList(list2));
                return;
            } else
            {
                Preconditions.checkState(isDone());
                return;
            }
            Exception exception;
            exception;
            int j = remaining.decrementAndGet();
            if (j < 0)
                flag = false;
            Preconditions.checkState(flag, "Less than 0 remaining futures");
            if (j == 0)
            {
                List list1 = values;
                if (list1 != null)
                    set(Lists.newArrayList(list1));
                else
                    Preconditions.checkState(isDone());
            }
            throw exception;
        }

        public volatile Object get()
            throws InterruptedException, ExecutionException
        {
            return get();
        }

        public List get()
            throws InterruptedException, ExecutionException
        {
            callAllGets();
            return (List)super.get();
        }


        ListFuture(ImmutableList immutablelist, boolean flag, Executor executor)
        {
            futures = immutablelist;
            values = Lists.newArrayListWithCapacity(immutablelist.size());
            allMustSucceed = flag;
            remaining = new AtomicInteger(immutablelist.size());
            init(executor);
        }
    }

    private static class MappingCheckedFuture extends AbstractCheckedFuture
    {

        final Function mapper;

        protected Exception mapException(Exception exception)
        {
            return (Exception)mapper.apply(exception);
        }

        MappingCheckedFuture(ListenableFuture listenablefuture, Function function)
        {
            super(listenablefuture);
            mapper = (Function)Preconditions.checkNotNull(function);
        }
    }


    private static final Ordering WITH_STRING_PARAM_FIRST = Ordering.natural().onResultOf(new Function() {

        public Boolean apply(Constructor constructor)
        {
            return Boolean.valueOf(Arrays.asList(constructor.getParameterTypes()).contains(java/lang/String));
        }

        public volatile Object apply(Object obj)
        {
            return apply((Constructor)obj);
        }

    }
).reverse();

    private Futures()
    {
    }

    public static void addCallback(ListenableFuture listenablefuture, FutureCallback futurecallback)
    {
        addCallback(listenablefuture, futurecallback, ((Executor) (MoreExecutors.sameThreadExecutor())));
    }

    public static void addCallback(ListenableFuture listenablefuture, FutureCallback futurecallback, Executor executor)
    {
        Preconditions.checkNotNull(futurecallback);
        listenablefuture.addListener(new Runnable(listenablefuture, futurecallback) {

            final FutureCallback val$callback;
            final ListenableFuture val$future;

            public void run()
            {
                try
                {
                    Object obj = Uninterruptibles.getUninterruptibly(future);
                    callback.onSuccess(obj);
                    return;
                }
                catch (ExecutionException executionexception)
                {
                    callback.onFailure(executionexception.getCause());
                    return;
                }
                catch (RuntimeException runtimeexception)
                {
                    callback.onFailure(runtimeexception);
                    return;
                }
                catch (Error error)
                {
                    callback.onFailure(error);
                }
            }

            
            {
                future = listenablefuture;
                callback = futurecallback;
                super();
            }
        }
, executor);
    }

    public static ListenableFuture allAsList(Iterable iterable)
    {
        return new ListFuture(ImmutableList.copyOf(iterable), true, MoreExecutors.sameThreadExecutor());
    }

    public static transient ListenableFuture allAsList(ListenableFuture alistenablefuture[])
    {
        return new ListFuture(ImmutableList.copyOf(alistenablefuture), true, MoreExecutors.sameThreadExecutor());
    }

    public static ListenableFuture chain(ListenableFuture listenablefuture, Function function)
    {
        return chain(listenablefuture, function, ((Executor) (MoreExecutors.sameThreadExecutor())));
    }

    public static ListenableFuture chain(ListenableFuture listenablefuture, Function function, Executor executor)
    {
        Preconditions.checkNotNull(function);
        ChainingListenableFuture chaininglistenablefuture = new ChainingListenableFuture(new AsyncFunction(function) {

            final Function val$function;

            public ListenableFuture apply(Object obj)
            {
                return (ListenableFuture)function.apply(obj);
            }

            
            {
                function = function1;
                super();
            }
        }
, listenablefuture);
        listenablefuture.addListener(chaininglistenablefuture, executor);
        return chaininglistenablefuture;
    }

    public static Object get(Future future, long l, TimeUnit timeunit, Class class1)
        throws Exception
    {
        Preconditions.checkNotNull(future);
        Preconditions.checkNotNull(timeunit);
        boolean flag;
        Object obj;
        if (!java/lang/RuntimeException.isAssignableFrom(class1))
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] {
            class1
        });
        try
        {
            obj = future.get(l, timeunit);
        }
        catch (InterruptedException interruptedexception)
        {
            Thread.currentThread().interrupt();
            throw newWithCause(class1, interruptedexception);
        }
        catch (TimeoutException timeoutexception)
        {
            throw newWithCause(class1, timeoutexception);
        }
        catch (ExecutionException executionexception)
        {
            wrapAndThrowExceptionOrError(executionexception.getCause(), class1);
            throw new AssertionError();
        }
        return obj;
    }

    public static Object get(Future future, Class class1)
        throws Exception
    {
        Preconditions.checkNotNull(future);
        boolean flag;
        Object obj;
        if (!java/lang/RuntimeException.isAssignableFrom(class1))
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] {
            class1
        });
        try
        {
            obj = future.get();
        }
        catch (InterruptedException interruptedexception)
        {
            Thread.currentThread().interrupt();
            throw newWithCause(class1, interruptedexception);
        }
        catch (ExecutionException executionexception)
        {
            wrapAndThrowExceptionOrError(executionexception.getCause(), class1);
            throw new AssertionError();
        }
        return obj;
    }

    public static Object getUnchecked(Future future)
    {
        Preconditions.checkNotNull(future);
        Object obj;
        try
        {
            obj = Uninterruptibles.getUninterruptibly(future);
        }
        catch (ExecutionException executionexception)
        {
            wrapAndThrowUnchecked(executionexception.getCause());
            throw new AssertionError();
        }
        return obj;
    }

    public static CheckedFuture immediateCheckedFuture(Object obj)
    {
        SettableFuture settablefuture = SettableFuture.create();
        settablefuture.set(obj);
        return makeChecked(settablefuture, new Function() {

            public Exception apply(Exception exception)
            {
                throw new AssertionError("impossible");
            }

            public volatile Object apply(Object obj1)
            {
                return apply((Exception)obj1);
            }

        }
);
    }

    public static CheckedFuture immediateFailedCheckedFuture(Exception exception)
    {
        Preconditions.checkNotNull(exception);
        return makeChecked(immediateFailedFuture(exception), new Function(exception) {

            final Exception val$exception;

            public Exception apply(Exception exception1)
            {
                return exception;
            }

            public volatile Object apply(Object obj)
            {
                return apply((Exception)obj);
            }

            
            {
                exception = exception1;
                super();
            }
        }
);
    }

    public static ListenableFuture immediateFailedFuture(Throwable throwable)
    {
        Preconditions.checkNotNull(throwable);
        SettableFuture settablefuture = SettableFuture.create();
        settablefuture.setException(throwable);
        return settablefuture;
    }

    public static ListenableFuture immediateFuture(Object obj)
    {
        SettableFuture settablefuture = SettableFuture.create();
        settablefuture.set(obj);
        return settablefuture;
    }

    public static Future lazyTransform(Future future, Function function)
    {
        Preconditions.checkNotNull(future);
        Preconditions.checkNotNull(function);
        return new Future(future, function) {

            final Function val$function;
            final Future val$future;

            private Object applyTransformation(Object obj)
                throws ExecutionException
            {
                Object obj1;
                try
                {
                    obj1 = function.apply(obj);
                }
                catch (Throwable throwable)
                {
                    throw new ExecutionException(throwable);
                }
                return obj1;
            }

            public boolean cancel(boolean flag)
            {
                return future.cancel(flag);
            }

            public Object get()
                throws InterruptedException, ExecutionException
            {
                return applyTransformation(future.get());
            }

            public Object get(long l, TimeUnit timeunit)
                throws InterruptedException, ExecutionException, TimeoutException
            {
                return applyTransformation(future.get(l, timeunit));
            }

            public boolean isCancelled()
            {
                return future.isCancelled();
            }

            public boolean isDone()
            {
                return future.isDone();
            }

            
            {
                future = future1;
                function = function1;
                super();
            }
        }
;
    }

    public static CheckedFuture makeChecked(ListenableFuture listenablefuture, Function function)
    {
        return new MappingCheckedFuture((ListenableFuture)Preconditions.checkNotNull(listenablefuture), function);
    }

    private static Object newFromConstructor(Constructor constructor, Throwable throwable)
    {
label0:
        {
            Class aclass[] = constructor.getParameterTypes();
            Object aobj[] = new Object[aclass.length];
            int i = 0;
            Object obj1;
            while (i < aclass.length) 
            {
                Class class1 = aclass[i];
                if (class1.equals(java/lang/String))
                {
                    aobj[i] = throwable.toString();
                } else
                {
                    boolean flag = class1.equals(java/lang/Throwable);
                    obj1 = null;
                    if (!flag)
                        break label0;
                    aobj[i] = throwable;
                }
                i++;
            }
            Object obj;
            try
            {
                obj = constructor.newInstance(aobj);
            }
            catch (IllegalArgumentException illegalargumentexception)
            {
                return null;
            }
            catch (InstantiationException instantiationexception)
            {
                return null;
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                return null;
            }
            catch (InvocationTargetException invocationtargetexception)
            {
                return null;
            }
            obj1 = obj;
        }
        return obj1;
    }

    private static Exception newWithCause(Class class1, Throwable throwable)
    {
        for (Iterator iterator = preferringStrings(Arrays.asList(class1.getConstructors())).iterator(); iterator.hasNext();)
        {
            Exception exception = (Exception)newFromConstructor((Constructor)iterator.next(), throwable);
            if (exception != null)
            {
                if (exception.getCause() == null)
                    exception.initCause(throwable);
                return exception;
            }
        }

        throw new IllegalArgumentException((new StringBuilder()).append("No appropriate constructor for exception of type ").append(class1).append(" in response to chained exception").toString(), throwable);
    }

    private static List preferringStrings(List list)
    {
        return WITH_STRING_PARAM_FIRST.sortedCopy(list);
    }

    public static ListenableFuture successfulAsList(Iterable iterable)
    {
        return new ListFuture(ImmutableList.copyOf(iterable), false, MoreExecutors.sameThreadExecutor());
    }

    public static transient ListenableFuture successfulAsList(ListenableFuture alistenablefuture[])
    {
        return new ListFuture(ImmutableList.copyOf(alistenablefuture), false, MoreExecutors.sameThreadExecutor());
    }

    public static ListenableFuture transform(ListenableFuture listenablefuture, Function function)
    {
        return transform(listenablefuture, function, ((Executor) (MoreExecutors.sameThreadExecutor())));
    }

    public static ListenableFuture transform(ListenableFuture listenablefuture, Function function, Executor executor)
    {
        Preconditions.checkNotNull(function);
        return chain(listenablefuture, new Function(function) {

            final Function val$function;

            public ListenableFuture apply(Object obj)
            {
                return Futures.immediateFuture(function.apply(obj));
            }

            public volatile Object apply(Object obj)
            {
                return apply(obj);
            }

            
            {
                function = function1;
                super();
            }
        }
, executor);
    }

    public static ListenableFuture transform(ListenableFuture listenablefuture, AsyncFunction asyncfunction)
    {
        return transform(listenablefuture, asyncfunction, ((Executor) (MoreExecutors.sameThreadExecutor())));
    }

    public static ListenableFuture transform(ListenableFuture listenablefuture, AsyncFunction asyncfunction, Executor executor)
    {
        ChainingListenableFuture chaininglistenablefuture = new ChainingListenableFuture(asyncfunction, listenablefuture);
        listenablefuture.addListener(chaininglistenablefuture, executor);
        return chaininglistenablefuture;
    }

    private static void wrapAndThrowExceptionOrError(Throwable throwable, Class class1)
        throws Exception
    {
        if (throwable instanceof Error)
            throw new ExecutionError((Error)throwable);
        if (throwable instanceof RuntimeException)
            throw new UncheckedExecutionException(throwable);
        else
            throw newWithCause(class1, throwable);
    }

    private static void wrapAndThrowUnchecked(Throwable throwable)
    {
        if (throwable instanceof Error)
            throw new ExecutionError((Error)throwable);
        else
            throw new UncheckedExecutionException(throwable);
    }

}
