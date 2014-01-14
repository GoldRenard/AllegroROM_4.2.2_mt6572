// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            SetMultimap

public interface SortedSetMultimap
    extends SetMultimap
{

    public abstract Map asMap();

    public abstract SortedSet get(Object obj);

    public abstract SortedSet removeAll(Object obj);

    public abstract SortedSet replaceValues(Object obj, Iterable iterable);

    public abstract Comparator valueComparator();
}
