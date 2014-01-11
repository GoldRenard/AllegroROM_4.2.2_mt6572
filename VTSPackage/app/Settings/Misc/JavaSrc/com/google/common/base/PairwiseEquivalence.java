// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;
import java.util.Iterator;

// Referenced classes of package com.google.common.base:
//            Equivalence, Preconditions

final class PairwiseEquivalence extends Equivalence
    implements Serializable
{

    private static final long serialVersionUID = 1L;
    final Equivalence elementEquivalence;

    PairwiseEquivalence(Equivalence equivalence)
    {
        elementEquivalence = (Equivalence)Preconditions.checkNotNull(equivalence);
    }

    protected boolean doEquivalent(Iterable iterable, Iterable iterable1)
    {
label0:
        {
            Iterator iterator = iterable.iterator();
            Iterator iterator1;
            for (iterator1 = iterable1.iterator(); iterator.hasNext() && iterator1.hasNext();)
                if (!elementEquivalence.equivalent(iterator.next(), iterator1.next()))
                    break label0;

            if (!iterator.hasNext() && !iterator1.hasNext())
                return true;
        }
        return false;
    }

    protected volatile boolean doEquivalent(Object obj, Object obj1)
    {
        return doEquivalent((Iterable)obj, (Iterable)obj1);
    }

    protected int doHash(Iterable iterable)
    {
        int i = 0x13381;
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            i = i * 24943 + elementEquivalence.hash(obj);
        }

        return i;
    }

    protected volatile int doHash(Object obj)
    {
        return doHash((Iterable)obj);
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof PairwiseEquivalence)
        {
            PairwiseEquivalence pairwiseequivalence = (PairwiseEquivalence)obj;
            return elementEquivalence.equals(pairwiseequivalence.elementEquivalence);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return 0x46a3eb07 ^ elementEquivalence.hashCode();
    }

    public String toString()
    {
        return (new StringBuilder()).append(elementEquivalence).append(".pairwise()").toString();
    }
}
