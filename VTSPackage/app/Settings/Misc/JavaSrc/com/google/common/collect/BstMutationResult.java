// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstModificationResult, BstSide, BstNode, BstNodeFactory, 
//            BstBalancePolicy

final class BstMutationResult
{

    static final boolean $assertionsDisabled;
    private BstNode changedRoot;
    private final BstModificationResult modificationResult;
    private BstNode originalRoot;
    private final Object targetKey;

    private BstMutationResult(Object obj, BstNode bstnode, BstNode bstnode1, BstModificationResult bstmodificationresult)
    {
        targetKey = obj;
        originalRoot = bstnode;
        changedRoot = bstnode1;
        modificationResult = (BstModificationResult)Preconditions.checkNotNull(bstmodificationresult);
    }

    public static BstMutationResult mutationResult(Object obj, BstNode bstnode, BstNode bstnode1, BstModificationResult bstmodificationresult)
    {
        return new BstMutationResult(obj, bstnode, bstnode1, bstmodificationresult);
    }

    public BstNode getChangedRoot()
    {
        return changedRoot;
    }

    public BstNode getChangedTarget()
    {
        return modificationResult.getChangedTarget();
    }

    public BstNode getOriginalRoot()
    {
        return originalRoot;
    }

    public BstNode getOriginalTarget()
    {
        return modificationResult.getOriginalTarget();
    }

    public Object getTargetKey()
    {
        return targetKey;
    }

    public BstMutationResult lift(BstNode bstnode, BstSide bstside, BstNodeFactory bstnodefactory, BstBalancePolicy bstbalancepolicy)
    {
        boolean flag = true;
        if (!$assertionsDisabled)
        {
            boolean flag1;
            if (bstnode != null)
                flag1 = flag;
            else
                flag1 = false;
            boolean flag2;
            if (bstside != null)
                flag2 = flag;
            else
                flag2 = false;
            boolean flag3 = flag1 & flag2;
            boolean flag4;
            if (bstnodefactory != null)
                flag4 = flag;
            else
                flag4 = false;
            boolean flag5 = flag4 & flag3;
            if (bstbalancepolicy == null)
                flag = false;
            if (!(flag & flag5))
                throw new AssertionError();
        }
        static class _cls1
        {

            static final int $SwitchMap$com$google$common$collect$BstModificationResult$ModificationType[];
            static final int $SwitchMap$com$google$common$collect$BstSide[];

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
                catch (NoSuchFieldError nosuchfielderror2) { }
                $SwitchMap$com$google$common$collect$BstSide = new int[BstSide.values().length];
                try
                {
                    $SwitchMap$com$google$common$collect$BstSide[BstSide.LEFT.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$google$common$collect$BstSide[BstSide.RIGHT.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror4)
                {
                    return;
                }
            }
        }

        _cls1..SwitchMap.com.google.common.collect.BstModificationResult.ModificationType[modificationType().ordinal()];
        JVM INSTR tableswitch 1 3: default 259
    //                   1 247
    //                   2 128
    //                   3 128;
           goto _L1 _L2 _L3 _L3
_L3:
        BstNode bstnode1;
        BstNode bstnode2;
        originalRoot = bstnode;
        bstnode1 = bstnode.childOrNull(BstSide.LEFT);
        bstnode2 = bstnode.childOrNull(BstSide.RIGHT);
        _cls1..SwitchMap.com.google.common.collect.BstSide[bstside.ordinal()];
        JVM INSTR tableswitch 1 2: default 239
    //                   1 189
    //                   2 180;
           goto _L4 _L5 _L6
_L6:
        bstnode2 = changedRoot;
        break; /* Loop/switch isn't completed */
_L5:
        bstnode1 = changedRoot;
        if (modificationType() == BstModificationResult.ModificationType.REBUILDING_CHANGE)
        {
            changedRoot = bstnodefactory.createNode(bstnode, bstnode1, bstnode2);
            return this;
        } else
        {
            changedRoot = bstbalancepolicy.balance(bstnodefactory, bstnode, bstnode1, bstnode2);
            return this;
        }
_L4:
        throw new AssertionError();
_L2:
        changedRoot = bstnode;
        originalRoot = bstnode;
        return this;
_L1:
        throw new AssertionError();
    }

    BstModificationResult.ModificationType modificationType()
    {
        return modificationResult.getType();
    }

    static 
    {
        boolean flag;
        if (!com/google/common/collect/BstMutationResult.desiredAssertionStatus())
            flag = true;
        else
            flag = false;
        $assertionsDisabled = flag;
    }
}
