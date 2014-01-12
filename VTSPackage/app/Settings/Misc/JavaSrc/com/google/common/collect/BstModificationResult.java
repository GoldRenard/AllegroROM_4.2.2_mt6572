// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.collect:
//            BstNode

final class BstModificationResult
{
    static final class ModificationType extends Enum
    {

        private static final ModificationType $VALUES[];
        public static final ModificationType IDENTITY;
        public static final ModificationType REBALANCING_CHANGE;
        public static final ModificationType REBUILDING_CHANGE;

        public static ModificationType valueOf(String s)
        {
            return (ModificationType)Enum.valueOf(com/google/common/collect/BstModificationResult$ModificationType, s);
        }

        public static ModificationType[] values()
        {
            return (ModificationType[])$VALUES.clone();
        }

        static 
        {
            IDENTITY = new ModificationType("IDENTITY", 0);
            REBUILDING_CHANGE = new ModificationType("REBUILDING_CHANGE", 1);
            REBALANCING_CHANGE = new ModificationType("REBALANCING_CHANGE", 2);
            ModificationType amodificationtype[] = new ModificationType[3];
            amodificationtype[0] = IDENTITY;
            amodificationtype[1] = REBUILDING_CHANGE;
            amodificationtype[2] = REBALANCING_CHANGE;
            $VALUES = amodificationtype;
        }

        private ModificationType(String s, int i)
        {
            super(s, i);
        }
    }


    private final BstNode changedTarget;
    private final BstNode originalTarget;
    private final ModificationType type;

    private BstModificationResult(BstNode bstnode, BstNode bstnode1, ModificationType modificationtype)
    {
        originalTarget = bstnode;
        changedTarget = bstnode1;
        type = (ModificationType)Preconditions.checkNotNull(modificationtype);
    }

    static BstModificationResult identity(BstNode bstnode)
    {
        return new BstModificationResult(bstnode, bstnode, ModificationType.IDENTITY);
    }

    static BstModificationResult rebalancingChange(BstNode bstnode, BstNode bstnode1)
    {
        return new BstModificationResult(bstnode, bstnode1, ModificationType.REBALANCING_CHANGE);
    }

    static BstModificationResult rebuildingChange(BstNode bstnode, BstNode bstnode1)
    {
        return new BstModificationResult(bstnode, bstnode1, ModificationType.REBUILDING_CHANGE);
    }

    BstNode getChangedTarget()
    {
        return changedTarget;
    }

    BstNode getOriginalTarget()
    {
        return originalTarget;
    }

    ModificationType getType()
    {
        return type;
    }
}
