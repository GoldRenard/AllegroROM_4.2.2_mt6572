// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.math.RoundingMode;

// Referenced classes of package com.google.common.hash:
//            Hashing, HashFunction, Hasher, HashCode, 
//            Funnel

abstract class BloomFilterStrategies extends Enum
    implements BloomFilter.Strategy
{
    static class BitArray
    {

        final long data[];

        boolean get(int i)
        {
            return (data[i >> 6] & 1L << i) != 0L;
        }

        void set(int i)
        {
            long al[] = data;
            int j = i >> 6;
            al[j] = al[j] | 1L << i;
        }

        int size()
        {
            return 64 * data.length;
        }

        BitArray(int i)
        {
            this(new long[IntMath.divide(i, 64, RoundingMode.CEILING)]);
        }

        BitArray(long al[])
        {
            boolean flag;
            if (al.length > 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag, "data length is zero!");
            data = al;
        }
    }


    private static final BloomFilterStrategies $VALUES[];
    public static final BloomFilterStrategies MURMUR128_MITZ_32;

    private BloomFilterStrategies(String s, int i)
    {
        super(s, i);
    }


    public static BloomFilterStrategies valueOf(String s)
    {
        return (BloomFilterStrategies)Enum.valueOf(com/google/common/hash/BloomFilterStrategies, s);
    }

    public static BloomFilterStrategies[] values()
    {
        return (BloomFilterStrategies[])$VALUES.clone();
    }

    static 
    {
        MURMUR128_MITZ_32 = new BloomFilterStrategies("MURMUR128_MITZ_32", 0) {

            public boolean mightContain(Object obj, Funnel funnel, int i, BitArray bitarray)
            {
                long l = Hashing.murmur3_128().newHasher().putObject(obj, funnel).hash().asLong();
                int j = (int)l;
                int k = (int)(l >>> 32);
                for (int i1 = 1; i1 <= i; i1++)
                {
                    int j1 = j + i1 * k;
                    if (j1 < 0)
                        j1 = ~j1;
                    if (!bitarray.get(j1 % bitarray.size()))
                        return false;
                }

                return true;
            }

            public void put(Object obj, Funnel funnel, int i, BitArray bitarray)
            {
                long l = Hashing.murmur3_128().newHasher().putObject(obj, funnel).hash().asLong();
                int j = (int)l;
                int k = (int)(l >>> 32);
                for (int i1 = 1; i1 <= i; i1++)
                {
                    int j1 = j + i1 * k;
                    if (j1 < 0)
                        j1 = ~j1;
                    bitarray.set(j1 % bitarray.size());
                }

            }

        }
;
        BloomFilterStrategies abloomfilterstrategies[] = new BloomFilterStrategies[1];
        abloomfilterstrategies[0] = MURMUR128_MITZ_32;
        $VALUES = abloomfilterstrategies;
    }
}
