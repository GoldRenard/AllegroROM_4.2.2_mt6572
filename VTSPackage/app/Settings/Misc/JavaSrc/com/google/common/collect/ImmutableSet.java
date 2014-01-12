// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableCollection, Hashing, SingletonImmutableSet, RegularImmutableSet, 
//            Collections2, ImmutableSortedSet, Lists, EmptyImmutableSet, 
//            Sets, UnmodifiableIterator, ImmutableAsList, Iterators, 
//            ObjectArrays, ImmutableList, AbstractIndexedListIterator

public abstract class ImmutableSet extends ImmutableCollection
    implements Set
{
    static abstract class ArrayImmutableSet extends ImmutableSet
    {

        final transient Object elements[];

        public boolean containsAll(Collection collection)
        {
            if (collection != this)
            {
                if (!(collection instanceof ArrayImmutableSet))
                    return containsAll(collection);
                if (collection.size() > size())
                    return false;
                Object aobj[] = ((ArrayImmutableSet)collection).elements;
                int i = aobj.length;
                for (int j = 0; j < i; j++)
                    if (!contains(aobj[j]))
                        return false;

            }
            return true;
        }

        ImmutableList createAsList()
        {
            return new ImmutableAsList(elements, this);
        }

        public boolean isEmpty()
        {
            return false;
        }

        boolean isPartialView()
        {
            return false;
        }

        public UnmodifiableIterator iterator()
        {
            return Iterators.forArray(elements);
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return elements.length;
        }

        public Object[] toArray()
        {
            Object aobj[] = new Object[size()];
            System.arraycopy(((Object) (elements)), 0, ((Object) (aobj)), 0, size());
            return aobj;
        }

        public Object[] toArray(Object aobj[])
        {
            int i = size();
            if (aobj.length < i)
                aobj = ObjectArrays.newArray(aobj, i);
            else
            if (aobj.length > i)
                aobj[i] = null;
            System.arraycopy(((Object) (elements)), 0, ((Object) (aobj)), 0, i);
            return aobj;
        }

        ArrayImmutableSet(Object aobj[])
        {
            elements = aobj;
        }
    }

    public static class Builder extends ImmutableCollection.Builder
    {

        final ArrayList contents = Lists.newArrayList();

        public volatile ImmutableCollection.Builder add(Object obj)
        {
            return add(obj);
        }

        public volatile ImmutableCollection.Builder add(Object aobj[])
        {
            return add(aobj);
        }

        public Builder add(Object obj)
        {
            contents.add(Preconditions.checkNotNull(obj));
            return this;
        }

        public transient Builder add(Object aobj[])
        {
            contents.ensureCapacity(contents.size() + aobj.length);
            super.add(aobj);
            return this;
        }

        public volatile ImmutableCollection.Builder addAll(Iterable iterable)
        {
            return addAll(iterable);
        }

        public volatile ImmutableCollection.Builder addAll(Iterator iterator1)
        {
            return addAll(iterator1);
        }

        public Builder addAll(Iterable iterable)
        {
            if (iterable instanceof Collection)
            {
                Collection collection = (Collection)iterable;
                contents.ensureCapacity(contents.size() + collection.size());
            }
            super.addAll(iterable);
            return this;
        }

        public Builder addAll(Iterator iterator1)
        {
            super.addAll(iterator1);
            return this;
        }

        public volatile ImmutableCollection build()
        {
            return build();
        }

        public ImmutableSet build()
        {
            return ImmutableSet.copyOf(contents);
        }

    }

    private static class SerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final Object elements[];

        Object readResolve()
        {
            return ImmutableSet.copyOf(elements);
        }

        SerializedForm(Object aobj[])
        {
            elements = aobj;
        }
    }

    static abstract class TransformedImmutableSet extends ImmutableSet
    {

        final int hashCode;
        final Object source[];

        public final int hashCode()
        {
            return hashCode;
        }

        public boolean isEmpty()
        {
            return false;
        }

        boolean isHashCodeFast()
        {
            return true;
        }

        public UnmodifiableIterator iterator()
        {
            return new AbstractIndexedListIterator(source.length) {

                final TransformedImmutableSet this$0;

                protected Object get(int i)
                {
                    return transform(source[i]);
                }

            
            {
                this$0 = TransformedImmutableSet.this;
                super(i);
            }
            }
;
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return source.length;
        }

        public Object[] toArray()
        {
            return toArray(new Object[size()]);
        }

        public Object[] toArray(Object aobj[])
        {
            int i = size();
            if (aobj.length < i)
                aobj = ObjectArrays.newArray(aobj, i);
            else
            if (aobj.length > i)
                aobj[i] = null;
            Object aobj1[] = aobj;
            for (int j = 0; j < source.length; j++)
                aobj1[j] = transform(source[j]);

            return aobj;
        }

        abstract Object transform(Object obj);

        TransformedImmutableSet(Object aobj[], int i)
        {
            source = aobj;
            hashCode = i;
        }
    }


    static final int CUTOFF = 0x20000000;
    static final int MAX_TABLE_SIZE = 0x40000000;


    public static Builder builder()
    {
        return new Builder();
    }

    static int chooseTableSize(int i)
    {
        if (i < 0x20000000)
            return Integer.highestOneBit(i) << 2;
        boolean flag;
        if (i < 0x40000000)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "collection too large");
        return 0x40000000;
    }

    private static transient ImmutableSet construct(Object aobj[])
    {
        int i = chooseTableSize(aobj.length);
        Object aobj1[] = new Object[i];
        int j = i - 1;
        ArrayList arraylist = null;
        int k = 0;
        int l = 0;
label0:
        do
        {
            if (l < aobj.length)
            {
                Object obj1 = aobj[l];
                int i1 = obj1.hashCode();
                int j1 = Hashing.smear(i1);
                do
                {
label1:
                    {
                        int k1 = j1 & j;
                        Object obj2 = aobj1[k1];
                        if (obj2 == null)
                        {
                            if (arraylist != null)
                                arraylist.add(obj1);
                            aobj1[k1] = obj1;
                            k += i1;
                        } else
                        {
                            if (!obj2.equals(obj1))
                                break label1;
                            if (arraylist == null)
                            {
                                arraylist = new ArrayList(aobj.length);
                                for (int l1 = 0; l1 < l; l1++)
                                    arraylist.add(aobj[l1]);

                            }
                        }
                        l++;
                        continue label0;
                    }
                    j1++;
                } while (true);
            }
            Object aobj2[];
            if (arraylist == null)
                aobj2 = aobj;
            else
                aobj2 = arraylist.toArray();
            if (aobj2.length == 1)
            {
                Object obj = aobj2[0];
                SingletonImmutableSet singletonimmutableset = new SingletonImmutableSet(obj, k);
                return singletonimmutableset;
            }
            if (i > 2 * chooseTableSize(aobj2.length))
                return construct(aobj2);
            RegularImmutableSet regularimmutableset = new RegularImmutableSet(aobj2, k, aobj1, j);
            return regularimmutableset;
        } while (true);
    }

    private static ImmutableSet copyFromCollection(Collection collection)
    {
        Object aobj[] = collection.toArray();
        switch (aobj.length)
        {
        case 1: // '\001'
            return of(aobj[0]);

        case 0: // '\0'
            return of();
        }
        return construct(aobj);
    }

    public static ImmutableSet copyOf(Iterable iterable)
    {
        if (iterable instanceof Collection)
            return copyOf(Collections2.cast(iterable));
        else
            return copyOf(iterable.iterator());
    }

    public static ImmutableSet copyOf(Collection collection)
    {
        if ((collection instanceof ImmutableSet) && !(collection instanceof ImmutableSortedSet))
        {
            ImmutableSet immutableset = (ImmutableSet)collection;
            if (!immutableset.isPartialView())
                return immutableset;
        }
        return copyFromCollection(collection);
    }

    public static ImmutableSet copyOf(Iterator iterator1)
    {
        return copyFromCollection(Lists.newArrayList(iterator1));
    }

    public static ImmutableSet copyOf(Object aobj[])
    {
        switch (aobj.length)
        {
        case 1: // '\001'
            return of(aobj[0]);

        case 0: // '\0'
            return of();
        }
        return construct((Object[])((Object []) (aobj)).clone());
    }

    public static ImmutableSet of()
    {
        return EmptyImmutableSet.INSTANCE;
    }

    public static ImmutableSet of(Object obj)
    {
        return new SingletonImmutableSet(obj);
    }

    public static ImmutableSet of(Object obj, Object obj1)
    {
        return construct(new Object[] {
            obj, obj1
        });
    }

    public static ImmutableSet of(Object obj, Object obj1, Object obj2)
    {
        return construct(new Object[] {
            obj, obj1, obj2
        });
    }

    public static ImmutableSet of(Object obj, Object obj1, Object obj2, Object obj3)
    {
        return construct(new Object[] {
            obj, obj1, obj2, obj3
        });
    }

    public static ImmutableSet of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4)
    {
        return construct(new Object[] {
            obj, obj1, obj2, obj3, obj4
        });
    }

    public static transient ImmutableSet of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object aobj[])
    {
        Object aobj1[] = new Object[6 + aobj.length];
        aobj1[0] = obj;
        aobj1[1] = obj1;
        aobj1[2] = obj2;
        aobj1[3] = obj3;
        aobj1[4] = obj4;
        aobj1[5] = obj5;
        for (int i = 6; i < aobj1.length; i++)
            aobj1[i] = aobj[i - 6];

        return construct(aobj1);
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if ((obj instanceof ImmutableSet) && isHashCodeFast() && ((ImmutableSet)obj).isHashCodeFast() && hashCode() != obj.hashCode())
            return false;
        else
            return Sets.equalsImpl(this, obj);
    }

    public int hashCode()
    {
        return Sets.hashCodeImpl(this);
    }

    boolean isHashCodeFast()
    {
        return false;
    }

    public abstract UnmodifiableIterator iterator();

    public volatile Iterator iterator()
    {
        return iterator();
    }

    Object writeReplace()
    {
        return new SerializedForm(toArray());
    }
}
