// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            ImmutableSetMultimap, ImmutableMap

class EmptyImmutableSetMultimap extends ImmutableSetMultimap
{

    static final EmptyImmutableSetMultimap INSTANCE = new EmptyImmutableSetMultimap();
    private static final long serialVersionUID;

    private EmptyImmutableSetMultimap()
    {
        super(ImmutableMap.of(), 0, null);
    }

    private Object readResolve()
    {
        return INSTANCE;
    }

}
