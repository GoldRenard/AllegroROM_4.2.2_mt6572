// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;

// Referenced classes of package com.google.common.base:
//            FunctionalEquivalence, PairwiseEquivalence, Predicate, Function, 
//            Preconditions, Objects

public abstract class Equivalence
{
    private static final class EquivalentToPredicate
        implements Predicate, Serializable
    {

        private static final long serialVersionUID;
        private final Equivalence equivalence;
        private final Object target;

        public boolean apply(Object obj)
        {
            return equivalence.equivalent(obj, target);
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (this != obj)
                {
                    if (!(obj instanceof EquivalentToPredicate))
                        break label0;
                    EquivalentToPredicate equivalenttopredicate = (EquivalentToPredicate)obj;
                    if (!equivalence.equals(equivalenttopredicate.equivalence) || !Objects.equal(target, equivalenttopredicate.target))
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[2];
            aobj[0] = equivalence;
            aobj[1] = target;
            return Objects.hashCode(aobj);
        }

        public String toString()
        {
            return (new StringBuilder()).append(equivalence).append(".equivalentTo(").append(target).append(")").toString();
        }

        EquivalentToPredicate(Equivalence equivalence1, Object obj)
        {
            equivalence = (Equivalence)Preconditions.checkNotNull(equivalence1);
            target = obj;
        }
    }

    public static final class Wrapper
        implements Serializable
    {

        private static final long serialVersionUID;
        private final Equivalence equivalence;
        private final Object reference;

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof Wrapper))
                        break label0;
                    Wrapper wrapper = (Wrapper)obj;
                    Equivalence equivalence1 = equivalence;
                    if (!equivalence1.equals(wrapper.equivalence) || !equivalence1.equivalent(reference, wrapper.reference))
                        return false;
                }
                return true;
            }
            return false;
        }

        public Object get()
        {
            return reference;
        }

        public int hashCode()
        {
            return equivalence.hash(reference);
        }

        public String toString()
        {
            return (new StringBuilder()).append(equivalence).append(".wrap(").append(reference).append(")").toString();
        }

        private Wrapper(Equivalence equivalence1, Object obj)
        {
            equivalence = (Equivalence)Preconditions.checkNotNull(equivalence1);
            reference = obj;
        }

    }



    protected abstract boolean doEquivalent(Object obj, Object obj1);

    protected abstract int doHash(Object obj);

    public final boolean equivalent(Object obj, Object obj1)
    {
        if (obj == obj1)
            return true;
        if (obj != null && obj1 != null)
            return doEquivalent(obj, obj1);
        else
            return false;
    }

    public final Predicate equivalentTo(Object obj)
    {
        return new EquivalentToPredicate(this, obj);
    }

    public final int hash(Object obj)
    {
        if (obj == null)
            return 0;
        else
            return doHash(obj);
    }

    public final Equivalence onResultOf(Function function)
    {
        return new FunctionalEquivalence(function, this);
    }

    public final Equivalence pairwise()
    {
        return new PairwiseEquivalence(this);
    }

    public final Wrapper wrap(Object obj)
    {
        return new Wrapper(this, obj);
    }
}
