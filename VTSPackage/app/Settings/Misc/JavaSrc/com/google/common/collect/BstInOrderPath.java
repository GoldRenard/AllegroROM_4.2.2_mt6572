// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import java.util.NoSuchElementException;

// Referenced classes of package com.google.common.collect:
//            BstPath, BstNode, BstSide, BstPathFactory

final class BstInOrderPath extends BstPath
{

    static final boolean $assertionsDisabled;
    private transient Optional nextInOrder;
    private transient Optional prevInOrder;
    private final BstSide sideExtension;

    private BstInOrderPath(BstNode bstnode, BstSide bstside, BstInOrderPath bstinorderpath)
    {
        boolean flag = true;
        super(bstnode, bstinorderpath);
        sideExtension = bstside;
        if (!$assertionsDisabled)
        {
            boolean flag1;
            if (bstside == null)
                flag1 = flag;
            else
                flag1 = false;
            if (bstinorderpath != null)
                flag = false;
            if (flag1 != flag)
                throw new AssertionError();
        }
    }


    private Optional computeNextInOrder(BstSide bstside)
    {
        if (getTip().hasChild(bstside))
        {
            BstInOrderPath bstinorderpath1 = extension(this, bstside);
            for (BstSide bstside1 = bstside.other(); bstinorderpath1.getTip().hasChild(bstside1); bstinorderpath1 = extension(bstinorderpath1, bstside1));
            return Optional.of(bstinorderpath1);
        }
        BstInOrderPath bstinorderpath;
        for (bstinorderpath = this; bstinorderpath.sideExtension == bstside; bstinorderpath = (BstInOrderPath)bstinorderpath.getPrefix());
        return Optional.fromNullable((BstInOrderPath)bstinorderpath.prefixOrNull());
    }

    private static BstInOrderPath extension(BstInOrderPath bstinorderpath, BstSide bstside)
    {
        Preconditions.checkNotNull(bstinorderpath);
        return new BstInOrderPath(bstinorderpath.getTip().getChild(bstside), bstside, bstinorderpath);
    }

    public static BstPathFactory inOrderFactory()
    {
        return new BstPathFactory() {

            public BstInOrderPath extension(BstInOrderPath bstinorderpath, BstSide bstside)
            {
                return BstInOrderPath.extension(bstinorderpath, bstside);
            }

            public volatile BstPath extension(BstPath bstpath, BstSide bstside)
            {
                return extension((BstInOrderPath)bstpath, bstside);
            }

            public BstInOrderPath initialPath(BstNode bstnode)
            {
                return new BstInOrderPath(bstnode, null, null);
            }

            public volatile BstPath initialPath(BstNode bstnode)
            {
                return initialPath(bstnode);
            }

        }
;
    }

    private Optional nextInOrder(BstSide bstside)
    {
        static class _cls2
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

        switch (_cls2..SwitchMap.com.google.common.collect.BstSide[bstside.ordinal()])
        {
        case 2: // '\002'
            Optional optional2 = nextInOrder;
            if (optional2 == null)
            {
                Optional optional3 = computeNextInOrder(bstside);
                nextInOrder = optional3;
                return optional3;
            } else
            {
                return optional2;
            }

        case 1: // '\001'
            Optional optional = prevInOrder;
            if (optional == null)
            {
                Optional optional1 = computeNextInOrder(bstside);
                prevInOrder = optional1;
                return optional1;
            } else
            {
                return optional;
            }
        }
        throw new AssertionError();
    }

    public BstSide getSideOfExtension()
    {
        return sideExtension;
    }

    public boolean hasNext(BstSide bstside)
    {
        return nextInOrder(bstside).isPresent();
    }

    public BstInOrderPath next(BstSide bstside)
    {
        if (!hasNext(bstside))
            throw new NoSuchElementException();
        else
            return (BstInOrderPath)nextInOrder(bstside).get();
    }

    static 
    {
        boolean flag;
        if (!com/google/common/collect/BstInOrderPath.desiredAssertionStatus())
            flag = true;
        else
            flag = false;
        $assertionsDisabled = flag;
    }

}
