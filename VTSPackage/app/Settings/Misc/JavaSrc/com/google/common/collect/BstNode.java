// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;

// Referenced classes of package com.google.common.collect:
//            BstSide

class BstNode
{

    private final Object key;
    private final BstNode left;
    private final BstNode right;

    BstNode(Object obj, BstNode bstnode, BstNode bstnode1)
    {
        key = obj;
        left = bstnode;
        right = bstnode1;
    }

    public final BstNode childOrNull(BstSide bstside)
    {
        static class _cls1
        {

            static final int $SwitchMap$com$google$common$collect$BstSide[];

            static 
            {
                $SwitchMap$com$google$common$collect$BstSide = new int[BstSide.values().length];
                try
                {
                    $SwitchMap$com$google$common$collect$BstSide[BstSide.LEFT.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$google$common$collect$BstSide[BstSide.RIGHT.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.com.google.common.collect.BstSide[bstside.ordinal()])
        {
        case 2: // '\002'
            return right;

        case 1: // '\001'
            return left;
        }
        throw new AssertionError();
    }

    public final BstNode getChild(BstSide bstside)
    {
        BstNode bstnode = childOrNull(bstside);
        boolean flag;
        if (bstnode != null)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        return bstnode;
    }

    public final Object getKey()
    {
        return key;
    }

    public final boolean hasChild(BstSide bstside)
    {
        return childOrNull(bstside) != null;
    }

    protected final boolean orderingInvariantHolds(Comparator comparator)
    {
        boolean flag = true;
        Preconditions.checkNotNull(comparator);
        boolean flag1 = true;
        if (hasChild(BstSide.LEFT))
        {
            boolean flag2;
            if (comparator.compare(getChild(BstSide.LEFT).getKey(), key) < 0)
                flag2 = flag;
            else
                flag2 = false;
            flag1 &= flag2;
        }
        if (hasChild(BstSide.RIGHT))
        {
            if (comparator.compare(getChild(BstSide.RIGHT).getKey(), key) <= 0)
                flag = false;
            flag1 &= flag;
        }
        return flag1;
    }
}
