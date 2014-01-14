// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;

// Referenced classes of package com.google.common.collect:
//            BstSide, BstNode, BstMutationResult, BstModificationResult, 
//            BstNodeFactory, BstBalancePolicy, BstMutationRule, BstModifier, 
//            BstInOrderPath

final class BstOperations
{

    private BstOperations()
    {
    }

    public static BstMutationResult extractMax(BstNode bstnode, BstNodeFactory bstnodefactory, BstBalancePolicy bstbalancepolicy)
    {
        Preconditions.checkNotNull(bstnode);
        Preconditions.checkNotNull(bstnodefactory);
        Preconditions.checkNotNull(bstbalancepolicy);
        if (bstnode.hasChild(BstSide.RIGHT))
            return extractMax(bstnode.getChild(BstSide.RIGHT), bstnodefactory, bstbalancepolicy).lift(bstnode, BstSide.RIGHT, bstnodefactory, bstbalancepolicy);
        else
            return BstMutationResult.mutationResult(bstnode.getKey(), bstnode, bstnode.childOrNull(BstSide.LEFT), BstModificationResult.rebalancingChange(bstnode, null));
    }

    public static BstMutationResult extractMin(BstNode bstnode, BstNodeFactory bstnodefactory, BstBalancePolicy bstbalancepolicy)
    {
        Preconditions.checkNotNull(bstnode);
        Preconditions.checkNotNull(bstnodefactory);
        Preconditions.checkNotNull(bstbalancepolicy);
        if (bstnode.hasChild(BstSide.LEFT))
            return extractMin(bstnode.getChild(BstSide.LEFT), bstnodefactory, bstbalancepolicy).lift(bstnode, BstSide.LEFT, bstnodefactory, bstbalancepolicy);
        else
            return BstMutationResult.mutationResult(bstnode.getKey(), bstnode, bstnode.childOrNull(BstSide.RIGHT), BstModificationResult.rebalancingChange(bstnode, null));
    }

    public static BstNode insertMax(BstNode bstnode, BstNode bstnode1, BstNodeFactory bstnodefactory, BstBalancePolicy bstbalancepolicy)
    {
        Preconditions.checkNotNull(bstnode1);
        Preconditions.checkNotNull(bstnodefactory);
        Preconditions.checkNotNull(bstbalancepolicy);
        if (bstnode == null)
            return bstnodefactory.createLeaf(bstnode1);
        else
            return bstbalancepolicy.balance(bstnodefactory, bstnode, bstnode.childOrNull(BstSide.LEFT), insertMax(bstnode.childOrNull(BstSide.RIGHT), bstnode1, bstnodefactory, bstbalancepolicy));
    }

    public static BstNode insertMin(BstNode bstnode, BstNode bstnode1, BstNodeFactory bstnodefactory, BstBalancePolicy bstbalancepolicy)
    {
        Preconditions.checkNotNull(bstnode1);
        Preconditions.checkNotNull(bstnodefactory);
        Preconditions.checkNotNull(bstbalancepolicy);
        if (bstnode == null)
            return bstnodefactory.createLeaf(bstnode1);
        else
            return bstbalancepolicy.balance(bstnodefactory, bstnode, insertMin(bstnode.childOrNull(BstSide.LEFT), bstnode1, bstnodefactory, bstbalancepolicy), bstnode.childOrNull(BstSide.RIGHT));
    }

    private static BstMutationResult modify(BstNode bstnode, Object obj, BstMutationRule bstmutationrule)
    {
label0:
        {
            BstBalancePolicy bstbalancepolicy = bstmutationrule.getBalancePolicy();
            BstNodeFactory bstnodefactory = bstmutationrule.getNodeFactory();
            BstModifier bstmodifier = bstmutationrule.getModifier();
            BstNode bstnode1;
            if (bstnode == null)
                bstnode1 = null;
            else
                bstnode1 = bstnodefactory.createLeaf(bstnode);
            BstModificationResult bstmodificationresult = bstmodifier.modify(obj, bstnode1);
            BstNode bstnode2 = null;
            BstNode bstnode3 = null;
            if (bstnode != null)
            {
                bstnode2 = bstnode.childOrNull(BstSide.LEFT);
                bstnode3 = bstnode.childOrNull(BstSide.RIGHT);
            }
            static class _cls1
            {

                static final int $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType[];

                static 
                {
                    $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType = new int[BstModificationResult.ModificationType.values().length];
                    try
                    {
                        $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType[BstModificationResult.ModificationType.IDENTITY.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType[BstModificationResult.ModificationType.REBUILDING_CHANGE.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType[BstModificationResult.ModificationType.REBALANCING_CHANGE.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2)
                    {
                        return;
                    }
                }
            }

            BstNode bstnode4;
            switch (_cls1..SwitchMap.com.google.common.collect.BstModificationResult.ModificationType[bstmodificationresult.getType().ordinal()])
            {
            default:
                break label0;

            case 3: // '\003'
                if (bstmodificationresult.getChangedTarget() != null)
                {
                    bstnode4 = bstbalancepolicy.balance(bstnodefactory, bstmodificationresult.getChangedTarget(), bstnode2, bstnode3);
                    break;
                }
                if (bstnode != null)
                    bstnode4 = bstbalancepolicy.combine(bstnodefactory, bstnode2, bstnode3);
                else
                    bstnode4 = null;
                break;

            case 2: // '\002'
                if (bstmodificationresult.getChangedTarget() != null)
                {
                    bstnode4 = bstnodefactory.createNode(bstmodificationresult.getChangedTarget(), bstnode2, bstnode3);
                    break;
                }
                if (bstnode == null)
                    bstnode4 = null;
                else
                    throw new AssertionError("Modification result is a REBUILDING_CHANGE, but rebalancing required");
                break;

            case 1: // '\001'
                bstnode4 = bstnode;
                break;
            }
            return BstMutationResult.mutationResult(obj, bstnode, bstnode4, bstmodificationresult);
        }
        throw new AssertionError();
    }

    public static BstMutationResult mutate(BstInOrderPath bstinorderpath, BstMutationRule bstmutationrule)
    {
        Preconditions.checkNotNull(bstinorderpath);
        Preconditions.checkNotNull(bstmutationrule);
        BstBalancePolicy bstbalancepolicy = bstmutationrule.getBalancePolicy();
        BstNodeFactory bstnodefactory = bstmutationrule.getNodeFactory();
        bstmutationrule.getModifier();
        BstNode bstnode = bstinorderpath.getTip();
        BstMutationResult bstmutationresult = modify(bstnode, bstnode.getKey(), bstmutationrule);
        BstInOrderPath bstinorderpath1;
        for (; bstinorderpath.hasPrefix(); bstinorderpath = bstinorderpath1)
        {
            bstinorderpath1 = (BstInOrderPath)bstinorderpath.getPrefix();
            bstmutationresult = bstmutationresult.lift(bstinorderpath1.getTip(), bstinorderpath.getSideOfExtension(), bstnodefactory, bstbalancepolicy);
        }

        return bstmutationresult;
    }

    public static BstMutationResult mutate(Comparator comparator, BstMutationRule bstmutationrule, BstNode bstnode, Object obj)
    {
        Preconditions.checkNotNull(comparator);
        Preconditions.checkNotNull(bstmutationrule);
        if (bstnode != null)
        {
            int i = comparator.compare(obj, bstnode.getKey());
            if (i != 0)
            {
                BstSide bstside;
                if (i < 0)
                    bstside = BstSide.LEFT;
                else
                    bstside = BstSide.RIGHT;
                return mutate(comparator, bstmutationrule, bstnode.childOrNull(bstside), obj).lift(bstnode, bstside, bstmutationrule.getNodeFactory(), bstmutationrule.getBalancePolicy());
            }
        }
        return modify(bstnode, obj, bstmutationrule);
    }

    public static BstNode seek(Comparator comparator, BstNode bstnode, Object obj)
    {
        Preconditions.checkNotNull(comparator);
        if (bstnode == null)
        {
            bstnode = null;
        } else
        {
            int i = comparator.compare(obj, bstnode.getKey());
            if (i != 0)
            {
                BstSide bstside;
                if (i < 0)
                    bstside = BstSide.LEFT;
                else
                    bstside = BstSide.RIGHT;
                return seek(comparator, bstnode.childOrNull(bstside), obj);
            }
        }
        return bstnode;
    }
}
