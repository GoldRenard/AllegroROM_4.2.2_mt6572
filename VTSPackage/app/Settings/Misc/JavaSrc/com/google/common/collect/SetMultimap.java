// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Map;
import java.util.Set;

// Referenced classes of package com.google.common.collect:
//            Multimap

public interface SetMultimap
    extends Multimap
{

    public abstract Map asMap();

    public abstract Set entries();

    public abstract boolean equals(Object obj);

    public abstract Set get(Object obj);

    public abstract Set removeAll(Object obj);

    public abstract Set replaceValues(Object obj, Iterable iterable);
}
