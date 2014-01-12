// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstAggregate, BstBalancePolicy, BstNodeFactory, BstSide, 
//            BstNode, BstOperations, BstMutationResult

final class BstCountBasedBalancePolicies
{

    private static final int SECOND_ROTATE_RATIO = 2;
    private static final int SINGLE_ROTATE_RATIO = 4;

    private BstCountBasedBalancePolicies()
    {
    }

    public static BstBalancePolicy fullRebalancePolicy(BstAggregate bstaggregate)
    {
        Preconditions.checkNotNull(bstaggregate);
        return new BstBalancePolicy(singleRebalancePolicy(bstaggregate), bstaggregate) {

            final BstAggregate val$countAggregate;
            final BstBalancePolicy val$singleBalancePolicy;

            public BstNode balance(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                if (bstnode1 == null)
                    return BstOperations.insertMin(bstnode2, bstnode, bstnodefactory, singleBalancePolicy);
                if (bstnode2 == null)
                    return BstOperations.insertMax(bstnode1, bstnode, bstnodefactory, singleBalancePolicy);
                long l = countAggregate.treeValue(bstnode1);
                long l1 = countAggregate.treeValue(bstnode2);
                if (4L * l <= l1)
                {
                    BstNode bstnode4 = balance(bstnodefactory, bstnode, bstnode1, bstnode2.childOrNull(BstSide.LEFT));
                    return singleBalancePolicy.balance(bstnodefactory, bstnode2, bstnode4, bstnode2.childOrNull(BstSide.RIGHT));
                }
                if (4L * l1 <= l)
                {
                    BstNode bstnode3 = balance(bstnodefactory, bstnode, bstnode1.childOrNull(BstSide.RIGHT), bstnode2);
                    return singleBalancePolicy.balance(bstnodefactory, bstnode1, bstnode1.childOrNull(BstSide.LEFT), bstnode3);
                } else
                {
                    return bstnodefactory.createNode(bstnode, bstnode1, bstnode2);
                }
            }

            public BstNode combine(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1)
            {
                if (bstnode == null)
                    return bstnode1;
                if (bstnode1 == null)
                    return bstnode;
                long l = countAggregate.treeValue(bstnode);
                long l1 = countAggregate.treeValue(bstnode1);
                if (4L * l <= l1)
                {
                    BstNode bstnode3 = combine(bstnodefactory, bstnode, bstnode1.childOrNull(BstSide.LEFT));
                    return singleBalancePolicy.balance(bstnodefactory, bstnode1, bstnode3, bstnode1.childOrNull(BstSide.RIGHT));
                }
                if (4L * l1 <= l)
                {
                    BstNode bstnode2 = combine(bstnodefactory, bstnode.childOrNull(BstSide.RIGHT), bstnode1);
                    return singleBalancePolicy.balance(bstnodefactory, bstnode, bstnode.childOrNull(BstSide.LEFT), bstnode2);
                } else
                {
                    return singleBalancePolicy.combine(bstnodefactory, bstnode, bstnode1);
                }
            }

            
            {
                singleBalancePolicy = bstbalancepolicy;
                countAggregate = bstaggregate;
                super();
            }
        }
;
    }

    public static BstBalancePolicy noRebalancePolicy(BstAggregate bstaggregate)
    {
        Preconditions.checkNotNull(bstaggregate);
        return new BstBalancePolicy(bstaggregate) {

            final BstAggregate val$countAggregate;

            public BstNode balance(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                return ((BstNodeFactory)Preconditions.checkNotNull(bstnodefactory)).createNode(bstnode, bstnode1, bstnode2);
            }

            public BstNode combine(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1)
            {
                if (bstnode == null)
                    return bstnode1;
                if (bstnode1 == null)
                    return bstnode;
                if (countAggregate.treeValue(bstnode) > countAggregate.treeValue(bstnode1))
                    return bstnodefactory.createNode(bstnode, bstnode.childOrNull(BstSide.LEFT), combine(bstnodefactory, bstnode.childOrNull(BstSide.RIGHT), bstnode1));
                else
                    return bstnodefactory.createNode(bstnode1, combine(bstnodefactory, bstnode, bstnode1.childOrNull(BstSide.LEFT)), bstnode1.childOrNull(BstSide.RIGHT));
            }

            
            {
                countAggregate = bstaggregate;
                super();
            }
        }
;
    }

    public static BstBalancePolicy singleRebalancePolicy(BstAggregate bstaggregate)
    {
        Preconditions.checkNotNull(bstaggregate);
        return new BstBalancePolicy(bstaggregate) {

            final BstAggregate val$countAggregate;

            private BstNode rotateL(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                Preconditions.checkNotNull(bstnode2);
                BstNode bstnode3 = bstnode2.childOrNull(BstSide.LEFT);
                BstNode bstnode4 = bstnode2.childOrNull(BstSide.RIGHT);
                if (countAggregate.treeValue(bstnode3) >= 2L * countAggregate.treeValue(bstnode4))
                    bstnode2 = singleR(bstnodefactory, bstnode2, bstnode3, bstnode4);
                return singleL(bstnodefactory, bstnode, bstnode1, bstnode2);
            }

            private BstNode rotateR(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                Preconditions.checkNotNull(bstnode1);
                BstNode bstnode3 = bstnode1.childOrNull(BstSide.RIGHT);
                BstNode bstnode4 = bstnode1.childOrNull(BstSide.LEFT);
                if (countAggregate.treeValue(bstnode3) >= 2L * countAggregate.treeValue(bstnode4))
                    bstnode1 = singleL(bstnodefactory, bstnode1, bstnode4, bstnode3);
                return singleR(bstnodefactory, bstnode, bstnode1, bstnode2);
            }

            private BstNode singleL(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                Preconditions.checkNotNull(bstnode2);
                return bstnodefactory.createNode(bstnode2, bstnodefactory.createNode(bstnode, bstnode1, bstnode2.childOrNull(BstSide.LEFT)), bstnode2.childOrNull(BstSide.RIGHT));
            }

            private BstNode singleR(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                Preconditions.checkNotNull(bstnode1);
                return bstnodefactory.createNode(bstnode1, bstnode1.childOrNull(BstSide.LEFT), bstnodefactory.createNode(bstnode, bstnode1.childOrNull(BstSide.RIGHT), bstnode2));
            }

            public BstNode balance(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
            {
                long l = countAggregate.treeValue(bstnode1);
                long l1 = countAggregate.treeValue(bstnode2);
                if (l + l1 > 1L)
                {
                    if (l1 >= 4L * l)
                        return rotateL(bstnodefactory, bstnode, bstnode1, bstnode2);
                    if (l >= 4L * l1)
                        return rotateR(bstnodefactory, bstnode, bstnode1, bstnode2);
                }
                return bstnodefactory.createNode(bstnode, bstnode1, bstnode2);
            }

            public BstNode combine(BstNodeFactory bstnodefactory, BstNode bstnode, BstNode bstnode1)
            {
                if (bstnode == null)
                    return bstnode1;
                if (bstnode1 == null)
                    return bstnode;
                BstNode bstnode2;
                if (countAggregate.treeValue(bstnode) > countAggregate.treeValue(bstnode1))
                {
                    BstMutationResult bstmutationresult1 = BstOperations.extractMax(bstnode, bstnodefactory, this);
                    bstnode2 = bstmutationresult1.getOriginalTarget();
                    bstnode = bstmutationresult1.getChangedRoot();
                } else
                {
                    BstMutationResult bstmutationresult = BstOperations.extractMin(bstnode1, bstnodefactory, this);
                    bstnode2 = bstmutationresult.getOriginalTarget();
                    bstnode1 = bstmutationresult.getChangedRoot();
                }
                return bstnodefactory.createNode(bstnode2, bstnode, bstnode1);
            }

            
            {
                countAggregate = bstaggregate;
                super();
            }
        }
;
    }
}
