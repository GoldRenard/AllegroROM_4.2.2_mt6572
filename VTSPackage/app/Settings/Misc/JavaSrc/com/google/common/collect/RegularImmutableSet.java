// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            Hashing

final class RegularImmutableSet extends ImmutableSet.ArrayImmutableSet
{

    private final transient int hashCode;
    private final transient int mask;
    final transient Object table[];

    RegularImmutableSet(Object aobj[], int i, Object aobj1[], int j)
    {
        super(aobj);
        table = aobj1;
        mask = j;
        hashCode = i;
    }

    public boolean contains(Object obj)
    {
        if (obj != null)
        {
            int i = Hashing.smear(obj.hashCode());
            do
            {
                Object obj1 = table[i & mask];
                if (obj1 == null)
                    break;
                if (obj1.equals(obj))
                    return true;
                i++;
            } while (true);
        }
        return false;
    }

    public int hashCode()
    {
        return hashCode;
    }

    boolean isHashCodeFast()
    {
        return true;
    }
}
