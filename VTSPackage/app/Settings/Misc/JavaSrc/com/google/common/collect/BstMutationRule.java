// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstBalancePolicy, BstNodeFactory, BstModifier

final class BstMutationRule
{

    private final BstBalancePolicy balancePolicy;
    private final BstModifier modifier;
    private final BstNodeFactory nodeFactory;

    private BstMutationRule(BstModifier bstmodifier, BstBalancePolicy bstbalancepolicy, BstNodeFactory bstnodefactory)
    {
        balancePolicy = (BstBalancePolicy)Preconditions.checkNotNull(bstbalancepolicy);
        nodeFactory = (BstNodeFactory)Preconditions.checkNotNull(bstnodefactory);
        modifier = (BstModifier)Preconditions.checkNotNull(bstmodifier);
    }

    public static BstMutationRule createRule(BstModifier bstmodifier, BstBalancePolicy bstbalancepolicy, BstNodeFactory bstnodefactory)
    {
        return new BstMutationRule(bstmodifier, bstbalancepolicy, bstnodefactory);
    }

    public BstBalancePolicy getBalancePolicy()
    {
        return balancePolicy;
    }

    public BstModifier getModifier()
    {
        return modifier;
    }

    public BstNodeFactory getNodeFactory()
    {
        return nodeFactory;
    }
}
