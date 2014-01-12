// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.List;
import java.util.Map;

// Referenced classes of package com.google.common.collect:
//            Multimap

public interface ListMultimap
    extends Multimap
{

    public abstract Map asMap();

    public abstract boolean equals(Object obj);

    public abstract List get(Object obj);

    public abstract List removeAll(Object obj);

    public abstract List replaceValues(Object obj, Iterable iterable);
}
