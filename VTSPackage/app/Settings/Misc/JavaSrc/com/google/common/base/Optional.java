// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.base:
//            Preconditions, Supplier, AbstractIterator

public abstract class Optional
    implements Serializable
{
    private static final class Absent extends Optional
    {

        private static final Absent INSTANCE = new Absent();
        private static final long serialVersionUID;

        private Object readResolve()
        {
            return INSTANCE;
        }

        public Set asSet()
        {
            return Collections.emptySet();
        }

        public boolean equals(Object obj)
        {
            return obj == this;
        }

        public Object get()
        {
            throw new IllegalStateException("value is absent");
        }

        public int hashCode()
        {
            return 0x598df91c;
        }

        public boolean isPresent()
        {
            return false;
        }

        public Optional or(Optional optional)
        {
            return (Optional)Preconditions.checkNotNull(optional);
        }

        public Object or(Supplier supplier)
        {
            return Preconditions.checkNotNull(supplier.get(), "use orNull() instead of a Supplier that returns null");
        }

        public Object or(Object obj)
        {
            return Preconditions.checkNotNull(obj, "use orNull() instead of or(null)");
        }

        public Object orNull()
        {
            return null;
        }

        public String toString()
        {
            return "Optional.absent()";
        }



        private Absent()
        {
        }
    }

    private static final class Present extends Optional
    {

        private static final long serialVersionUID;
        private final Object reference;

        public Set asSet()
        {
            return Collections.singleton(reference);
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof Present)
            {
                Present present = (Present)obj;
                return reference.equals(present.reference);
            } else
            {
                return false;
            }
        }

        public Object get()
        {
            return reference;
        }

        public int hashCode()
        {
            return 0x598df91c + reference.hashCode();
        }

        public boolean isPresent()
        {
            return true;
        }

        public Optional or(Optional optional)
        {
            Preconditions.checkNotNull(optional);
            return this;
        }

        public Object or(Supplier supplier)
        {
            Preconditions.checkNotNull(supplier);
            return reference;
        }

        public Object or(Object obj)
        {
            Preconditions.checkNotNull(obj, "use orNull() instead of or(null)");
            return reference;
        }

        public Object orNull()
        {
            return reference;
        }

        public String toString()
        {
            return (new StringBuilder()).append("Optional.of(").append(reference).append(")").toString();
        }

        Present(Object obj)
        {
            reference = obj;
        }
    }


    private static final long serialVersionUID;

    private Optional()
    {
    }


    public static Optional absent()
    {
        return Absent.INSTANCE;
    }

    public static Optional fromNullable(Object obj)
    {
        if (obj == null)
            return absent();
        else
            return new Present(obj);
    }

    public static Optional of(Object obj)
    {
        return new Present(Preconditions.checkNotNull(obj));
    }

    public static Iterable presentInstances(Iterable iterable)
    {
        Preconditions.checkNotNull(iterable);
        return new Iterable(iterable) {

            final Iterable val$optionals;

            public Iterator iterator()
            {
                return new AbstractIterator() {

                    private final Iterator iterator;
                    final _cls1 this$0;

                    protected Object computeNext()
                    {
                        while (iterator.hasNext()) 
                        {
                            Optional optional = (Optional)iterator.next();
                            if (optional.isPresent())
                                return optional.get();
                        }
                        return endOfData();
                    }

            
            {
                this$0 = _cls1.this;
                super();
                iterator = (Iterator)Preconditions.checkNotNull(optionals.iterator());
            }
                }
;
            }

            
            {
                optionals = iterable;
                super();
            }
        }
;
    }

    public abstract Set asSet();

    public abstract boolean equals(Object obj);

    public abstract Object get();

    public abstract int hashCode();

    public abstract boolean isPresent();

    public abstract Optional or(Optional optional);

    public abstract Object or(Supplier supplier);

    public abstract Object or(Object obj);

    public abstract Object orNull();

    public abstract String toString();
}
