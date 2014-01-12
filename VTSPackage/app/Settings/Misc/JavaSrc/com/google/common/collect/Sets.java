// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import com.google.common.math.IntMath;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSet, ImmutableEnumSet, Iterables, Collections2, 
//            Maps, ImmutableList, UnmodifiableIterator, AbstractIndexedListIterator, 
//            Iterators

public final class Sets
{
    private static class CartesianSet extends AbstractSet
    {

        final ImmutableList axes;
        final int size;

        public boolean contains(Object obj)
        {
            if (!(obj instanceof List))
                return false;
            List list = (List)obj;
            int i = axes.size();
            if (list.size() != i)
                return false;
            for (int j = 0; j < i; j++)
                if (!((Axis)axes.get(j)).contains(list.get(j)))
                    return false;

            return true;
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof CartesianSet)
            {
                CartesianSet cartesianset = (CartesianSet)obj;
                return axes.equals(cartesianset.axes);
            } else
            {
                return super.equals(obj);
            }
        }

        public int hashCode()
        {
            int i = -1 + size;
            for (int j = 0; j < axes.size(); j++)
                i *= 31;

            return i + axes.hashCode();
        }

        public UnmodifiableIterator iterator()
        {
            return new UnmodifiableIterator() {

                int index;
                final CartesianSet this$0;

                public boolean hasNext()
                {
                    return index < size;
                }

                public volatile Object next()
                {
                    return next();
                }

                public List next()
                {
                    if (!hasNext())
                        throw new NoSuchElementException();
                    Object aobj[] = new Object[axes.size()];
                    for (int i = 0; i < aobj.length; i++)
                        aobj[i] = ((CartesianSet.Axis)axes.get(i)).getForIndex(index);

                    index = 1 + index;
                    return ImmutableList.copyOf(aobj);
                }

            
            {
                this$0 = CartesianSet.this;
                super();
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
            return size;
        }

        CartesianSet(List list)
        {
            int i;
            ImmutableList.Builder builder;
            i = 1;
            builder = ImmutableList.builder();
            Iterator iterator1 = list.iterator();
_L1:
            int j;
            if (!iterator1.hasNext())
                break MISSING_BLOCK_LABEL_85;
            Axis axis = new Axis((Set)iterator1.next(), i);
            builder.add(axis);
            j = IntMath.checkedMultiply(i, axis.size());
            i = j;
              goto _L1
            ArithmeticException arithmeticexception;
            arithmeticexception;
            throw new IllegalArgumentException("cartesian product too big");
            axes = builder.build();
            size = i;
            return;
        }
    }

    private class CartesianSet.Axis
    {

        final ImmutableSet choices;
        final ImmutableList choicesList;
        final int dividend;
        final CartesianSet this$0;

        boolean contains(Object obj)
        {
            return choices.contains(obj);
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof CartesianSet.Axis)
            {
                CartesianSet.Axis axis = (CartesianSet.Axis)obj;
                return choices.equals(axis.choices);
            } else
            {
                return false;
            }
        }

        Object getForIndex(int i)
        {
            return choicesList.get((i / dividend) % size());
        }

        public int hashCode()
        {
            return (CartesianSet.this.size / choices.size()) * choices.hashCode();
        }

        int size()
        {
            return choices.size();
        }

        CartesianSet.Axis(Set set, int i)
        {
            this$0 = CartesianSet.this;
            super();
            choices = ImmutableSet.copyOf(set);
            choicesList = choices.asList();
            dividend = i;
        }
    }

    private static class FilteredSet extends Collections2.FilteredCollection
        implements Set
    {

        public boolean equals(Object obj)
        {
            return Sets.equalsImpl(this, obj);
        }

        public int hashCode()
        {
            return Sets.hashCodeImpl(this);
        }

        FilteredSet(Set set, Predicate predicate)
        {
            super(set, predicate);
        }
    }

    private static class FilteredSortedSet extends Collections2.FilteredCollection
        implements SortedSet
    {

        public Comparator comparator()
        {
            return ((SortedSet)super.unfiltered).comparator();
        }

        public boolean equals(Object obj)
        {
            return Sets.equalsImpl(this, obj);
        }

        public Object first()
        {
            return iterator().next();
        }

        public int hashCode()
        {
            return Sets.hashCodeImpl(this);
        }

        public SortedSet headSet(Object obj)
        {
            return new FilteredSortedSet(((SortedSet)super.unfiltered).headSet(obj), super.predicate);
        }

        public Object last()
        {
            SortedSet sortedset = (SortedSet)super.unfiltered;
            do
            {
                Object obj = sortedset.last();
                if (super.predicate.apply(obj))
                    return obj;
                sortedset = sortedset.headSet(obj);
            } while (true);
        }

        public SortedSet subSet(Object obj, Object obj1)
        {
            return new FilteredSortedSet(((SortedSet)super.unfiltered).subSet(obj, obj1), super.predicate);
        }

        public SortedSet tailSet(Object obj)
        {
            return new FilteredSortedSet(((SortedSet)super.unfiltered).tailSet(obj), super.predicate);
        }

        FilteredSortedSet(SortedSet sortedset, Predicate predicate)
        {
            super(sortedset, predicate);
        }
    }

    static abstract class InvertibleFunction
        implements Function
    {

        public InvertibleFunction inverse()
        {
            return new InvertibleFunction() {

                final InvertibleFunction this$0;

                public Object apply(Object obj)
                {
                    return InvertibleFunction.this.invert(obj);
                }

                public InvertibleFunction inverse()
                {
                    return InvertibleFunction.this;
                }

                Object invert(Object obj)
                {
                    return InvertibleFunction.this.apply(obj);
                }

            
            {
                this$0 = InvertibleFunction.this;
                super();
            }
            }
;
        }

        abstract Object invert(Object obj);

    }

    private static final class PowerSet extends AbstractSet
    {

        final ImmutableList inputList;
        final ImmutableSet inputSet;
        final int powerSetSize;

        public boolean contains(Object obj)
        {
            if (obj instanceof Set)
            {
                Set set = (Set)obj;
                return inputSet.containsAll(set);
            } else
            {
                return false;
            }
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof PowerSet)
            {
                PowerSet powerset = (PowerSet)obj;
                return inputSet.equals(powerset.inputSet);
            } else
            {
                return super.equals(obj);
            }
        }

        public int hashCode()
        {
            return inputSet.hashCode() << -1 + inputSet.size();
        }

        public boolean isEmpty()
        {
            return false;
        }

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(powerSetSize) {

                final PowerSet this$0;

                protected volatile Object get(int i)
                {
                    return get(i);
                }

                protected Set get(int i)
                {
                    return i. new AbstractSet() {

                        final PowerSet._cls1 this$1;
                        final int val$setBits;

                        public Iterator iterator()
                        {
                            return new PowerSet.BitFilteredSetIterator(inputList, setBits);
                        }

                        public int size()
                        {
                            return Integer.bitCount(setBits);
                        }

            
            {
                this$1 = final__pcls1;
                setBits = I.this;
                super();
            }
                    }
;
                }

            
            {
                this$0 = PowerSet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return powerSetSize;
        }

        public String toString()
        {
            return (new StringBuilder()).append("powerSet(").append(inputSet).append(")").toString();
        }

        PowerSet(ImmutableSet immutableset)
        {
            inputSet = immutableset;
            inputList = immutableset.asList();
            powerSetSize = 1 << immutableset.size();
        }
    }

    private static final class PowerSet.BitFilteredSetIterator extends UnmodifiableIterator
    {

        final ImmutableList input;
        int remainingSetBits;

        public boolean hasNext()
        {
            return remainingSetBits != 0;
        }

        public Object next()
        {
            int i = Integer.numberOfTrailingZeros(remainingSetBits);
            if (i == 32)
            {
                throw new NoSuchElementException();
            } else
            {
                int j = 1 << i;
                remainingSetBits = remainingSetBits & ~j;
                return input.get(i);
            }
        }

        PowerSet.BitFilteredSetIterator(ImmutableList immutablelist, int i)
        {
            input = immutablelist;
            remainingSetBits = i;
        }
    }

    private static class SetFromMap extends AbstractSet
        implements Set, Serializable
    {

        private static final long serialVersionUID;
        private final Map m;
        private transient Set s;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            s = m.keySet();
        }

        public boolean add(Object obj)
        {
            return m.put(obj, Boolean.TRUE) == null;
        }

        public void clear()
        {
            m.clear();
        }

        public boolean contains(Object obj)
        {
            return m.containsKey(obj);
        }

        public boolean containsAll(Collection collection)
        {
            return s.containsAll(collection);
        }

        public boolean equals(Object obj)
        {
            return this == obj || s.equals(obj);
        }

        public int hashCode()
        {
            return s.hashCode();
        }

        public boolean isEmpty()
        {
            return m.isEmpty();
        }

        public Iterator iterator()
        {
            return s.iterator();
        }

        public boolean remove(Object obj)
        {
            return m.remove(obj) != null;
        }

        public boolean removeAll(Collection collection)
        {
            return s.removeAll(collection);
        }

        public boolean retainAll(Collection collection)
        {
            return s.retainAll(collection);
        }

        public int size()
        {
            return m.size();
        }

        public Object[] toArray()
        {
            return s.toArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return s.toArray(aobj);
        }

        public String toString()
        {
            return s.toString();
        }

        SetFromMap(Map map)
        {
            Preconditions.checkArgument(map.isEmpty(), "Map is non-empty");
            m = map;
            s = map.keySet();
        }
    }

    public static abstract class SetView extends AbstractSet
    {

        public Set copyInto(Set set)
        {
            set.addAll(this);
            return set;
        }

        public ImmutableSet immutableCopy()
        {
            return ImmutableSet.copyOf(this);
        }

        private SetView()
        {
        }

    }

    private static class TransformedSet extends AbstractSet
    {

        final InvertibleFunction bijection;
        final Set _flddelegate;

        public boolean add(Object obj)
        {
            return _flddelegate.add(bijection.invert(obj));
        }

        public void clear()
        {
            _flddelegate.clear();
        }

        public boolean contains(Object obj)
        {
            Object obj1 = bijection.invert(obj);
            return _flddelegate.contains(obj1) && Objects.equal(bijection.apply(obj1), obj);
        }

        public Iterator iterator()
        {
            return Iterators.transform(_flddelegate.iterator(), bijection);
        }

        public boolean remove(Object obj)
        {
            return contains(obj) && _flddelegate.remove(bijection.invert(obj));
        }

        public int size()
        {
            return _flddelegate.size();
        }

        TransformedSet(Set set, InvertibleFunction invertiblefunction)
        {
            _flddelegate = set;
            bijection = invertiblefunction;
        }
    }


    private Sets()
    {
    }

    public static Set cartesianProduct(List list)
    {
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
            if (((Set)iterator.next()).isEmpty())
                return ImmutableSet.of();

        return new CartesianSet(list);
    }

    public static transient Set cartesianProduct(Set aset[])
    {
        return cartesianProduct(Arrays.asList(aset));
    }

    public static EnumSet complementOf(Collection collection)
    {
        if (collection instanceof EnumSet)
            return EnumSet.complementOf((EnumSet)collection);
        boolean flag;
        if (!collection.isEmpty())
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "collection is empty; use the other version of this method");
        return makeComplementByHand(collection, ((Enum)collection.iterator().next()).getDeclaringClass());
    }

    public static EnumSet complementOf(Collection collection, Class class1)
    {
        Preconditions.checkNotNull(collection);
        if (collection instanceof EnumSet)
            return EnumSet.complementOf((EnumSet)collection);
        else
            return makeComplementByHand(collection, class1);
    }

    public static SetView difference(Set set, Set set1)
    {
        Preconditions.checkNotNull(set, "set1");
        Preconditions.checkNotNull(set1, "set2");
        return new SetView(set, Predicates.not(Predicates.in(set1)), set1) {

            final Predicate val$notInSet2;
            final Set val$set1;
            final Set val$set2;

            public boolean contains(Object obj)
            {
                return set1.contains(obj) && !set2.contains(obj);
            }

            public boolean isEmpty()
            {
                return set2.containsAll(set1);
            }

            public Iterator iterator()
            {
                return Iterators.filter(set1.iterator(), notInSet2);
            }

            public int size()
            {
                return Iterators.size(iterator());
            }

            
            {
                set1 = set;
                notInSet2 = predicate;
                set2 = set3;
                super();
            }
        }
;
    }

    static boolean equalsImpl(Set set, Object obj)
    {
        boolean flag = true;
        if (set != obj) goto _L2; else goto _L1
_L1:
        boolean flag2 = flag;
_L4:
        return flag2;
_L2:
        boolean flag1;
        flag1 = obj instanceof Set;
        flag2 = false;
        if (!flag1) goto _L4; else goto _L3
_L3:
        Set set1 = (Set)obj;
        if (set.size() != set1.size()) goto _L6; else goto _L5
_L5:
        boolean flag3 = set.containsAll(set1);
        if (!flag3) goto _L6; else goto _L7
_L7:
        return flag;
_L6:
        flag = false;
        if (true) goto _L7; else goto _L8
_L8:
        NullPointerException nullpointerexception;
        nullpointerexception;
        return false;
        ClassCastException classcastexception;
        classcastexception;
        return false;
    }

    public static Set filter(Set set, Predicate predicate)
    {
        if (set instanceof SortedSet)
            return filter((SortedSet)set, predicate);
        if (set instanceof FilteredSet)
        {
            FilteredSet filteredset = (FilteredSet)set;
            Predicate predicate1 = Predicates.and(((Collections2.FilteredCollection) (filteredset)).predicate, predicate);
            return new FilteredSet((Set)((Collections2.FilteredCollection) (filteredset)).unfiltered, predicate1);
        } else
        {
            return new FilteredSet((Set)Preconditions.checkNotNull(set), (Predicate)Preconditions.checkNotNull(predicate));
        }
    }

    public static SortedSet filter(SortedSet sortedset, Predicate predicate)
    {
        if (sortedset instanceof FilteredSet)
        {
            FilteredSet filteredset = (FilteredSet)sortedset;
            Predicate predicate1 = Predicates.and(((Collections2.FilteredCollection) (filteredset)).predicate, predicate);
            return new FilteredSortedSet((SortedSet)((Collections2.FilteredCollection) (filteredset)).unfiltered, predicate1);
        } else
        {
            return new FilteredSortedSet((SortedSet)Preconditions.checkNotNull(sortedset), (Predicate)Preconditions.checkNotNull(predicate));
        }
    }

    static int hashCodeImpl(Set set)
    {
        int i = 0;
        for (Iterator iterator = set.iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            int j;
            if (obj != null)
                j = obj.hashCode();
            else
                j = 0;
            i += j;
        }

        return i;
    }

    public static transient ImmutableSet immutableEnumSet(Enum enum, Enum aenum[])
    {
        return new ImmutableEnumSet(EnumSet.of(enum, aenum));
    }

    public static ImmutableSet immutableEnumSet(Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        if (!iterator.hasNext())
            return ImmutableSet.of();
        if (iterable instanceof EnumSet)
            return new ImmutableEnumSet(EnumSet.copyOf((EnumSet)iterable));
        EnumSet enumset = EnumSet.of((Enum)iterator.next());
        for (; iterator.hasNext(); enumset.add(iterator.next()));
        return new ImmutableEnumSet(enumset);
    }

    public static SetView intersection(Set set, Set set1)
    {
        Preconditions.checkNotNull(set, "set1");
        Preconditions.checkNotNull(set1, "set2");
        return new SetView(set, Predicates.in(set1), set1) {

            final Predicate val$inSet2;
            final Set val$set1;
            final Set val$set2;

            public boolean contains(Object obj)
            {
                return set1.contains(obj) && set2.contains(obj);
            }

            public boolean containsAll(Collection collection)
            {
                return set1.containsAll(collection) && set2.containsAll(collection);
            }

            public boolean isEmpty()
            {
                return !iterator().hasNext();
            }

            public Iterator iterator()
            {
                return Iterators.filter(set1.iterator(), inSet2);
            }

            public int size()
            {
                return Iterators.size(iterator());
            }

            
            {
                set1 = set;
                inSet2 = predicate;
                set2 = set3;
                super();
            }
        }
;
    }

    private static EnumSet makeComplementByHand(Collection collection, Class class1)
    {
        EnumSet enumset = EnumSet.allOf(class1);
        enumset.removeAll(collection);
        return enumset;
    }

    public static EnumSet newEnumSet(Iterable iterable, Class class1)
    {
        Preconditions.checkNotNull(iterable);
        EnumSet enumset = EnumSet.noneOf(class1);
        Iterables.addAll(enumset, iterable);
        return enumset;
    }

    public static HashSet newHashSet()
    {
        return new HashSet();
    }

    public static HashSet newHashSet(Iterable iterable)
    {
        if (iterable instanceof Collection)
            return new HashSet(Collections2.cast(iterable));
        else
            return newHashSet(iterable.iterator());
    }

    public static HashSet newHashSet(Iterator iterator)
    {
        HashSet hashset = newHashSet();
        for (; iterator.hasNext(); hashset.add(iterator.next()));
        return hashset;
    }

    public static transient HashSet newHashSet(Object aobj[])
    {
        HashSet hashset = newHashSetWithExpectedSize(aobj.length);
        Collections.addAll(hashset, aobj);
        return hashset;
    }

    public static HashSet newHashSetWithExpectedSize(int i)
    {
        return new HashSet(Maps.capacity(i));
    }

    public static Set newIdentityHashSet()
    {
        return newSetFromMap(Maps.newIdentityHashMap());
    }

    public static LinkedHashSet newLinkedHashSet()
    {
        return new LinkedHashSet();
    }

    public static LinkedHashSet newLinkedHashSet(Iterable iterable)
    {
        LinkedHashSet linkedhashset;
        if (iterable instanceof Collection)
        {
            linkedhashset = new LinkedHashSet(Collections2.cast(iterable));
        } else
        {
            linkedhashset = newLinkedHashSet();
            for (Iterator iterator = iterable.iterator(); iterator.hasNext(); linkedhashset.add(iterator.next()));
        }
        return linkedhashset;
    }

    public static LinkedHashSet newLinkedHashSetWithExpectedSize(int i)
    {
        return new LinkedHashSet(Maps.capacity(i));
    }

    public static Set newSetFromMap(Map map)
    {
        return new SetFromMap(map);
    }

    public static TreeSet newTreeSet()
    {
        return new TreeSet();
    }

    public static TreeSet newTreeSet(Iterable iterable)
    {
        TreeSet treeset = newTreeSet();
        for (Iterator iterator = iterable.iterator(); iterator.hasNext(); treeset.add((Comparable)iterator.next()));
        return treeset;
    }

    public static TreeSet newTreeSet(Comparator comparator)
    {
        return new TreeSet((Comparator)Preconditions.checkNotNull(comparator));
    }

    public static Set powerSet(Set set)
    {
        ImmutableSet immutableset = ImmutableSet.copyOf(set);
        boolean flag;
        if (immutableset.size() <= 30)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(immutableset.size());
        Preconditions.checkArgument(flag, "Too many elements to create power set: %s > 30", aobj);
        return new PowerSet(immutableset);
    }

    static boolean removeAllImpl(Set set, Iterable iterable)
    {
        boolean flag = false;
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
            flag |= set.remove(iterator.next());

        return flag;
    }

    public static SetView symmetricDifference(Set set, Set set1)
    {
        Preconditions.checkNotNull(set, "set1");
        Preconditions.checkNotNull(set1, "set2");
        return difference(union(set, set1), intersection(set, set1));
    }

    static Set transform(Set set, InvertibleFunction invertiblefunction)
    {
        return new TransformedSet((Set)Preconditions.checkNotNull(set, "set"), (InvertibleFunction)Preconditions.checkNotNull(invertiblefunction, "bijection"));
    }

    public static SetView union(Set set, Set set1)
    {
        Preconditions.checkNotNull(set, "set1");
        Preconditions.checkNotNull(set1, "set2");
        return new SetView(set, difference(set1, set), set1) {

            final Set val$set1;
            final Set val$set2;
            final Set val$set2minus1;

            public boolean contains(Object obj)
            {
                return set1.contains(obj) || set2.contains(obj);
            }

            public Set copyInto(Set set3)
            {
                set3.addAll(set1);
                set3.addAll(set2);
                return set3;
            }

            public ImmutableSet immutableCopy()
            {
                return (new ImmutableSet.Builder()).addAll(set1).addAll(set2).build();
            }

            public boolean isEmpty()
            {
                return set1.isEmpty() && set2.isEmpty();
            }

            public Iterator iterator()
            {
                return Iterators.unmodifiableIterator(Iterators.concat(set1.iterator(), set2minus1.iterator()));
            }

            public int size()
            {
                return set1.size() + set2minus1.size();
            }

            
            {
                set1 = set;
                set2minus1 = set3;
                set2 = set4;
                super();
            }
        }
;
    }
}
