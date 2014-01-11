// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;

// Referenced classes of package com.google.common.base:
//            Equivalence, Preconditions, Function, Objects

final class FunctionalEquivalence extends Equivalence
    implements Serializable
{

    private static final long serialVersionUID;
    private final Function function;
    private final Equivalence resultEquivalence;

    FunctionalEquivalence(Function function1, Equivalence equivalence)
    {
        function = (Function)Preconditions.checkNotNull(function1);
        resultEquivalence = (Equivalence)Preconditions.checkNotNull(equivalence);
    }

    protected boolean doEquivalent(Object obj, Object obj1)
    {
        return resultEquivalence.equivalent(function.apply(obj), function.apply(obj1));
    }

    protected int doHash(Object obj)
    {
        return resultEquivalence.hash(function.apply(obj));
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof FunctionalEquivalence))
                    break label0;
                FunctionalEquivalence functionalequivalence = (FunctionalEquivalence)obj;
                if (!function.equals(functionalequivalence.function) || !resultEquivalence.equals(functionalequivalence.resultEquivalence))
                    return false;
            }
            return true;
        }
        return false;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[2];
        aobj[0] = function;
        aobj[1] = resultEquivalence;
        return Objects.hashCode(aobj);
    }

    public String toString()
    {
        return (new StringBuilder()).append(resultEquivalence).append(".onResultOf(").append(function).append(")").toString();
    }
}
