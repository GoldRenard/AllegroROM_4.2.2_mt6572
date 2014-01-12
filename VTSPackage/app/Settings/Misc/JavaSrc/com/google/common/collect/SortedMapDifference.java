// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.SortedMap;

// Referenced classes of package com.google.common.collect:
//            MapDifference

public interface SortedMapDifference
    extends MapDifference
{

    public abstract SortedMap entriesDiffering();

    public abstract SortedMap entriesInCommon();

    public abstract SortedMap entriesOnlyOnLeft();

    public abstract SortedMap entriesOnlyOnRight();
}
