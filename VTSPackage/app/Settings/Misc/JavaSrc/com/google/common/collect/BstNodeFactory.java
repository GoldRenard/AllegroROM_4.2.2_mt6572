// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            BstNode

abstract class BstNodeFactory
{


    public final BstNode createLeaf(BstNode bstnode)
    {
        return createNode(bstnode, null, null);
    }

    public abstract BstNode createNode(BstNode bstnode, BstNode bstnode1, BstNode bstnode2);
}
