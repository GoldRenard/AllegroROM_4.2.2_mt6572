// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multiset, SortedIterable, BoundType

public interface SortedMultiset
    extends Multiset, SortedIterable
{

    public abstract Comparator comparator();

    public abstract SortedMultiset descendingMultiset();

    public abstract SortedSet elementSet();

    public abstract Multiset.Entry firstEntry();

    public abstract SortedMultiset headMultiset(Object obj, BoundType boundtype);

    public abstract Iterator iterator();

    public abstract Multiset.Entry lastEntry();

    public abstract Multiset.Entry pollFirstEntry();

    public abstract Multiset.Entry pollLastEntry();

    public abstract SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1);

    public abstract SortedMultiset tailMultiset(Object obj, BoundType boundtype);
}
