// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstSide, GeneralRange, BstPathFactory, BstPath, 
//            BstNode, BstBalancePolicy, BstAggregate, BstNodeFactory

final class BstRangeOps
{

    private BstRangeOps()
    {
    }

    public static boolean beyond(GeneralRange generalrange, Object obj, BstSide bstside)
    {
        Preconditions.checkNotNull(generalrange);
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
            return generalrange.tooHigh(obj);

        case 1: // '\001'
            return generalrange.tooLow(obj);
        }
        throw new AssertionError();
    }

    public static BstPath furthestPath(GeneralRange generalrange, BstSide bstside, BstPathFactory bstpathfactory, BstNode bstnode)
    {
        Preconditions.checkNotNull(generalrange);
        Preconditions.checkNotNull(bstpathfactory);
        Preconditions.checkNotNull(bstside);
        if (bstnode == null)
            return null;
        else
            return furthestPath(generalrange, bstside, bstpathfactory, bstpathfactory.initialPath(bstnode));
    }

    private static BstPath furthestPath(GeneralRange generalrange, BstSide bstside, BstPathFactory bstpathfactory, BstPath bstpath)
    {
        BstNode bstnode = bstpath.getTip();
        Object obj = bstnode.getKey();
        BstPath bstpath1;
        if (beyond(generalrange, obj, bstside))
        {
            boolean flag1 = bstnode.hasChild(bstside.other());
            bstpath1 = null;
            if (flag1)
                bstpath1 = furthestPath(generalrange, bstside, bstpathfactory, bstpathfactory.extension(bstpath, bstside.other()));
        } else
        {
            if (bstnode.hasChild(bstside))
            {
                BstPath bstpath2 = furthestPath(generalrange, bstside, bstpathfactory, bstpathfactory.extension(bstpath, bstside));
                if (bstpath2 != null)
                    return bstpath2;
            }
            boolean flag = beyond(generalrange, obj, bstside.other());
            bstpath1 = null;
            if (!flag)
                return bstpath;
        }
        return bstpath1;
    }

    public static BstNode minusRange(GeneralRange generalrange, BstBalancePolicy bstbalancepolicy, BstNodeFactory bstnodefactory, BstNode bstnode)
    {
        Preconditions.checkNotNull(generalrange);
        Preconditions.checkNotNull(bstbalancepolicy);
        Preconditions.checkNotNull(bstnodefactory);
        BstNode bstnode1;
        if (generalrange.hasUpperBound())
            bstnode1 = subTreeBeyondRangeToSide(generalrange, bstbalancepolicy, bstnodefactory, BstSide.RIGHT, bstnode);
        else
            bstnode1 = null;
        BstNode bstnode2;
        if (generalrange.hasLowerBound())
            bstnode2 = subTreeBeyondRangeToSide(generalrange, bstbalancepolicy, bstnodefactory, BstSide.LEFT, bstnode);
        else
            bstnode2 = null;
        return bstbalancepolicy.combine(bstnodefactory, bstnode2, bstnode1);
    }

    private static BstNode subTreeBeyondRangeToSide(GeneralRange generalrange, BstBalancePolicy bstbalancepolicy, BstNodeFactory bstnodefactory, BstSide bstside, BstNode bstnode)
    {
label0:
        {
label1:
            {
                if (bstnode == null)
                    return null;
                if (!beyond(generalrange, bstnode.getKey(), bstside))
                    break label0;
                BstNode bstnode1 = bstnode.childOrNull(BstSide.LEFT);
                BstNode bstnode2 = bstnode.childOrNull(BstSide.RIGHT);
                switch (_cls1..SwitchMap.com.google.common.collect.BstSide[bstside.ordinal()])
                {
                default:
                    break label1;

                case 2: // '\002'
                    bstnode1 = subTreeBeyondRangeToSide(generalrange, bstbalancepolicy, bstnodefactory, BstSide.RIGHT, bstnode1);
                    break;

                case 1: // '\001'
                    bstnode2 = subTreeBeyondRangeToSide(generalrange, bstbalancepolicy, bstnodefactory, BstSide.LEFT, bstnode2);
                    break;
                }
                return bstbalancepolicy.balance(bstnodefactory, bstnode, bstnode1, bstnode2);
            }
            throw new AssertionError();
        }
        return subTreeBeyondRangeToSide(generalrange, bstbalancepolicy, bstnodefactory, bstside, bstnode.childOrNull(bstside));
    }

    private static long totalBeyondRangeToSide(BstAggregate bstaggregate, GeneralRange generalrange, BstSide bstside, BstNode bstnode)
    {
        long l = 0L;
        while (bstnode != null) 
            if (beyond(generalrange, bstnode.getKey(), bstside))
            {
                l = l + (long)bstaggregate.entryValue(bstnode) + bstaggregate.treeValue(bstnode.childOrNull(bstside));
                bstnode = bstnode.childOrNull(bstside.other());
            } else
            {
                bstnode = bstnode.childOrNull(bstside);
            }
        return l;
    }

    public static long totalInRange(BstAggregate bstaggregate, GeneralRange generalrange, BstNode bstnode)
    {
        Preconditions.checkNotNull(bstaggregate);
        Preconditions.checkNotNull(generalrange);
        long l;
        if (bstnode != null && !generalrange.isEmpty())
        {
            l = bstaggregate.treeValue(bstnode);
            if (generalrange.hasLowerBound())
                l -= totalBeyondRangeToSide(bstaggregate, generalrange, BstSide.LEFT, bstnode);
            if (generalrange.hasUpperBound())
                return l - totalBeyondRangeToSide(bstaggregate, generalrange, BstSide.RIGHT, bstnode);
        } else
        {
            l = 0L;
        }
        return l;
    }
}
