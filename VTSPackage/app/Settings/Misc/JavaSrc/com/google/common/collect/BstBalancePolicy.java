// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            BstNodeFactory, BstNode

interface BstBalancePolicy
{

    public abstract BstNode balance(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2);

    public abstract BstNode combine(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1);
}
