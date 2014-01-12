// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstNode

abstract class BstPath
{

    private final BstPath prefix;
    private final BstNode tip;

    BstPath(BstNode bstnode, BstPath bstpath)
    {
        tip = (BstNode)Preconditions.checkNotNull(bstnode);
        prefix = bstpath;
    }

    public final BstPath getPrefix()
    {
        Preconditions.checkState(hasPrefix());
        return prefix;
    }

    public final BstNode getTip()
    {
        return tip;
    }

    public final boolean hasPrefix()
    {
        return prefix != null;
    }

    public final BstPath prefixOrNull()
    {
        return prefix;
    }
}
