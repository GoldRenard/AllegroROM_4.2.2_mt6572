// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            ImmutableListMultimap, ImmutableMap

class EmptyImmutableListMultimap extends ImmutableListMultimap
{

    static final EmptyImmutableListMultimap INSTANCE = new EmptyImmutableListMultimap();
    private static final long serialVersionUID;

    private EmptyImmutableListMultimap()
    {
        super(ImmutableMap.of(), 0);
    }

    private Object readResolve()
    {
        return INSTANCE;
    }

}
