// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableCollection, Multiset, ImmutableMap, RegularImmutableMultiset, 
//            Multisets, LinkedHashMultiset, Iterators, EmptyImmutableMultiset, 
//            Sets, ImmutableSet, UnmodifiableIterator, ObjectArrays

public abstract class ImmutableMultiset extends ImmutableCollection
    implements Multiset
{
    public static class Builder extends ImmutableCollection.Builder
    {

        final Multiset contents;

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
            if (iterable instanceof Multiset)
            {
                Multiset.Entry entry;
                for (Iterator iterator1 = Multisets.cast(iterable).entrySet().iterator(); iterator1.hasNext(); addCopies(entry.getElement(), entry.getCount()))
                    entry = (Multiset.Entry)iterator1.next();

            } else
            {
                super.addAll(iterable);
            }
            return this;
        }

        public Builder addAll(Iterator iterator1)
        {
            super.addAll(iterator1);
            return this;
        }

        public Builder addCopies(Object obj, int i)
        {
            contents.add(Preconditions.checkNotNull(obj), i);
            return this;
        }

        public volatile ImmutableCollection build()
        {
            return build();
        }

        public ImmutableMultiset build()
        {
            return ImmutableMultiset.copyOf(contents);
        }

        public Builder setCount(Object obj, int i)
        {
            contents.setCount(Preconditions.checkNotNull(obj), i);
            return this;
        }

        public Builder()
        {
            this(((Multiset) (LinkedHashMultiset.create())));
        }

        Builder(Multiset multiset)
        {
            contents = multiset;
        }
    }

    static class EntrySet extends ImmutableSet
    {

        private static final long serialVersionUID;
        final transient ImmutableMultiset multiset;

        public boolean contains(Object obj)
        {
            if (obj instanceof Multiset.Entry)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                if (entry.getCount() > 0 && multiset.count(entry.getElement()) == entry.getCount())
                    return true;
            }
            return false;
        }

        public int hashCode()
        {
            return multiset.hashCode();
        }

        boolean isPartialView()
        {
            return multiset.isPartialView();
        }

        public UnmodifiableIterator iterator()
        {
            return multiset.entryIterator();
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return multiset.distinctElements();
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
            int j = 0;
            for (Iterator iterator1 = iterator(); iterator1.hasNext();)
            {
                Multiset.Entry entry = (Multiset.Entry)iterator1.next();
                int k = j + 1;
                aobj1[j] = entry;
                j = k;
            }

            return aobj;
        }

        Object writeReplace()
        {
            return new EntrySetSerializedForm(multiset);
        }

        public EntrySet(ImmutableMultiset immutablemultiset)
        {
            multiset = immutablemultiset;
        }
    }

    static class EntrySet.EntrySetSerializedForm
        implements Serializable
    {

        final ImmutableMultiset multiset;

        Object readResolve()
        {
            return multiset.entrySet();
        }

        EntrySet.EntrySetSerializedForm(ImmutableMultiset immutablemultiset)
        {
            multiset = immutablemultiset;
        }
    }

    private static class SerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final int counts[];
        final Object elements[];

        Object readResolve()
        {
            LinkedHashMultiset linkedhashmultiset = LinkedHashMultiset.create(elements.length);
            for (int i = 0; i < elements.length; i++)
                linkedhashmultiset.add(elements[i], counts[i]);

            return ImmutableMultiset.copyOf(linkedhashmultiset);
        }

        SerializedForm(Multiset multiset)
        {
            int i = multiset.entrySet().size();
            elements = new Object[i];
            counts = new int[i];
            int j = 0;
            for (Iterator iterator1 = multiset.entrySet().iterator(); iterator1.hasNext();)
            {
                Multiset.Entry entry = (Multiset.Entry)iterator1.next();
                elements[j] = entry.getElement();
                counts[j] = entry.getCount();
                j++;
            }

        }
    }


    private transient ImmutableSet entrySet;


    public static Builder builder()
    {
        return new Builder();
    }

    static ImmutableMultiset copyFromEntries(Collection collection)
    {
        long l = 0L;
        ImmutableMap.Builder builder1 = ImmutableMap.builder();
        Iterator iterator1 = collection.iterator();
        do
        {
            if (!iterator1.hasNext())
                break;
            Multiset.Entry entry = (Multiset.Entry)iterator1.next();
            int i = entry.getCount();
            if (i > 0)
            {
                builder1.put(entry.getElement(), Integer.valueOf(i));
                l += i;
            }
        } while (true);
        if (l == 0L)
            return of();
        else
            return new RegularImmutableMultiset(builder1.build(), Ints.saturatedCast(l));
    }

    public static ImmutableMultiset copyOf(Iterable iterable)
    {
        if (iterable instanceof ImmutableMultiset)
        {
            ImmutableMultiset immutablemultiset = (ImmutableMultiset)iterable;
            if (!immutablemultiset.isPartialView())
                return immutablemultiset;
        }
        Object obj;
        if (iterable instanceof Multiset)
            obj = Multisets.cast(iterable);
        else
            obj = LinkedHashMultiset.create(iterable);
        return copyOfInternal(((Multiset) (obj)));
    }

    public static ImmutableMultiset copyOf(Iterator iterator1)
    {
        LinkedHashMultiset linkedhashmultiset = LinkedHashMultiset.create();
        Iterators.addAll(linkedhashmultiset, iterator1);
        return copyOfInternal(linkedhashmultiset);
    }

    public static ImmutableMultiset copyOf(Object aobj[])
    {
        return copyOf(((Iterable) (Arrays.asList(aobj))));
    }

    private static ImmutableMultiset copyOfInternal(Multiset multiset)
    {
        return copyFromEntries(multiset.entrySet());
    }

    private static transient ImmutableMultiset copyOfInternal(Object aobj[])
    {
        return copyOf(Arrays.asList(aobj));
    }

    public static ImmutableMultiset of()
    {
        return EmptyImmutableMultiset.INSTANCE;
    }

    public static ImmutableMultiset of(Object obj)
    {
        return copyOfInternal(new Object[] {
            obj
        });
    }

    public static ImmutableMultiset of(Object obj, Object obj1)
    {
        return copyOfInternal(new Object[] {
            obj, obj1
        });
    }

    public static ImmutableMultiset of(Object obj, Object obj1, Object obj2)
    {
        return copyOfInternal(new Object[] {
            obj, obj1, obj2
        });
    }

    public static ImmutableMultiset of(Object obj, Object obj1, Object obj2, Object obj3)
    {
        return copyOfInternal(new Object[] {
            obj, obj1, obj2, obj3
        });
    }

    public static ImmutableMultiset of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4)
    {
        return copyOfInternal(new Object[] {
            obj, obj1, obj2, obj3, obj4
        });
    }

    public static transient ImmutableMultiset of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object aobj[])
    {
        ArrayList arraylist = new ArrayList(6 + aobj.length);
        Collections.addAll(arraylist, new Object[] {
            obj, obj1, obj2, obj3, obj4, obj5
        });
        Collections.addAll(arraylist, aobj);
        return copyOf(arraylist);
    }

    public static ImmutableMultiset of(Object aobj[])
    {
        return copyOf(Arrays.asList(aobj));
    }

    public final int add(Object obj, int i)
    {
        throw new UnsupportedOperationException();
    }

    public boolean contains(Object obj)
    {
        return count(obj) > 0;
    }

    public boolean containsAll(Collection collection)
    {
        return elementSet().containsAll(collection);
    }

    ImmutableSet createEntrySet()
    {
        return new EntrySet(this);
    }

    abstract int distinctElements();

    abstract UnmodifiableIterator entryIterator();

    public Set entrySet()
    {
        ImmutableSet immutableset = entrySet;
        if (immutableset == null)
        {
            immutableset = createEntrySet();
            entrySet = immutableset;
        }
        return immutableset;
    }

    public boolean equals(Object obj)
    {
label0:
        {
label1:
            {
                if (obj == this)
                    break label1;
                if (!(obj instanceof Multiset))
                    break label0;
                Multiset multiset = (Multiset)obj;
                if (size() != multiset.size())
                    return false;
                Iterator iterator1 = multiset.entrySet().iterator();
                Multiset.Entry entry;
                do
                {
                    if (!iterator1.hasNext())
                        break label1;
                    entry = (Multiset.Entry)iterator1.next();
                } while (count(entry.getElement()) == entry.getCount());
                return false;
            }
            return true;
        }
        return false;
    }

    public int hashCode()
    {
        return Sets.hashCodeImpl(entrySet());
    }

    public UnmodifiableIterator iterator()
    {
        return new UnmodifiableIterator() {

            Object element;
            int remaining;
            final ImmutableMultiset this$0;
            final Iterator val$entryIterator;

            public boolean hasNext()
            {
                return remaining > 0 || entryIterator.hasNext();
            }

            public Object next()
            {
                if (remaining <= 0)
                {
                    Multiset.Entry entry = (Multiset.Entry)entryIterator.next();
                    element = entry.getElement();
                    remaining = entry.getCount();
                }
                remaining = -1 + remaining;
                return element;
            }

            
            {
                this$0 = ImmutableMultiset.this;
                entryIterator = iterator1;
                super();
            }
        }
;
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public final int remove(Object obj, int i)
    {
        throw new UnsupportedOperationException();
    }

    public final int setCount(Object obj, int i)
    {
        throw new UnsupportedOperationException();
    }

    public final boolean setCount(Object obj, int i, int j)
    {
        throw new UnsupportedOperationException();
    }

    public String toString()
    {
        return entrySet().toString();
    }

    Object writeReplace()
    {
        return new SerializedForm(this);
    }
}
