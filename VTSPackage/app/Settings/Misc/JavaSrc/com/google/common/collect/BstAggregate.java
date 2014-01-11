// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            BstNode

interface BstAggregate
{

    public abstract int entryValue(BstNode bstnode);

    public abstract long treeValue(BstNode bstnode);
}
