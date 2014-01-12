// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;

// Referenced classes of package com.google.common.base:
//            Equivalence

public final class Equivalences
{
    private static final class Equals extends Equivalence
        implements Serializable
    {

        static final Equals INSTANCE = new Equals();
        private static final long serialVersionUID = 1L;

        private Object readResolve()
        {
            return INSTANCE;
        }

        protected boolean doEquivalent(Object obj, Object obj1)
        {
            return obj.equals(obj1);
        }

        public int doHash(Object obj)
        {
            return obj.hashCode();
        }


        private Equals()
        {
        }
    }

    private static final class Identity extends Equivalence
        implements Serializable
    {

        static final Identity INSTANCE = new Identity();
        private static final long serialVersionUID = 1L;

        private Object readResolve()
        {
            return INSTANCE;
        }

        protected boolean doEquivalent(Object obj, Object obj1)
        {
            return false;
        }

        protected int doHash(Object obj)
        {
            return System.identityHashCode(obj);
        }


        private Identity()
        {
        }
    }


    private Equivalences()
    {
    }

    public static Equivalence equals()
    {
        return Equals.INSTANCE;
    }

    public static Equivalence identity()
    {
        return Identity.INSTANCE;
    }
}
