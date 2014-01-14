// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;

// Referenced classes of package com.google.common.hash:
//            Funnel, BloomFilterStrategies

public final class BloomFilter
    implements Serializable
{
    private static class SerialForm
        implements Serializable
    {

        private static final long serialVersionUID = 1L;
        final long data[];
        final Funnel funnel;
        final int numHashFunctions;
        final Strategy strategy;

        Object readResolve()
        {
            return new BloomFilter(new BloomFilterStrategies.BitArray(data), numHashFunctions, funnel, strategy);
        }

        SerialForm(BloomFilter bloomfilter)
        {
            data = bloomfilter.bits.data;
            numHashFunctions = bloomfilter.numHashFunctions;
            funnel = bloomfilter.funnel;
            strategy = bloomfilter.strategy;
        }
    }

    static interface Strategy
        extends Serializable
    {

        public abstract boolean mightContain(Object obj, Funnel funnel1, int i, BloomFilterStrategies.BitArray bitarray);

        public abstract void put(Object obj, Funnel funnel1, int i, BloomFilterStrategies.BitArray bitarray);
    }


    private static final double LN2;
    private static final double LN2_SQUARED;
    private final BloomFilterStrategies.BitArray bits;
    private final Funnel funnel;
    private final int numHashFunctions;
    private final Strategy strategy;

    private BloomFilter(BloomFilterStrategies.BitArray bitarray, int i, Funnel funnel1, Strategy strategy1)
    {
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "numHashFunctions zero or negative");
        bits = (BloomFilterStrategies.BitArray)Preconditions.checkNotNull(bitarray);
        numHashFunctions = i;
        funnel = (Funnel)Preconditions.checkNotNull(funnel1);
        strategy = strategy1;
    }


    public static BloomFilter create(Funnel funnel1, int i)
    {
        return create(funnel1, i, 0.029999999999999999D);
    }

    public static BloomFilter create(Funnel funnel1, int i, double d)
    {
        boolean flag = true;
        Preconditions.checkNotNull(funnel1);
        boolean flag1;
        if (i > 0)
            flag1 = flag;
        else
            flag1 = false;
        Preconditions.checkArgument(flag1, "Expected insertions must be positive");
        boolean flag2;
        if (d > 0.0D)
            flag2 = flag;
        else
            flag2 = false;
        if (d >= 1.0D)
            flag = false;
        Preconditions.checkArgument(flag2 & flag, "False positive probability in (0.0, 1.0)");
        int j = optimalNumOfBits(i, d);
        int k = optimalNumOfHashFunctions(i, j);
        return new BloomFilter(new BloomFilterStrategies.BitArray(j), k, funnel1, BloomFilterStrategies.MURMUR128_MITZ_32);
    }

    static int optimalNumOfBits(int i, double d)
    {
        return (int)(((double)(-i) * Math.log(d)) / LN2_SQUARED);
    }

    static int optimalNumOfHashFunctions(int i, int j)
    {
        return Math.max(1, (int)Math.round((double)(j / i) * LN2));
    }

    private Object writeReplace()
    {
        return new SerialForm(this);
    }

    double computeExpectedFalsePositiveRate(int i)
    {
        return Math.pow(1.0D - Math.exp((double)(-numHashFunctions) * ((double)i / (double)bits.size())), numHashFunctions);
    }

    int getHashCount()
    {
        return numHashFunctions;
    }

    public boolean mightContain(Object obj)
    {
        return strategy.mightContain(obj, funnel, numHashFunctions, bits);
    }

    public void put(Object obj)
    {
        strategy.put(obj, funnel, numHashFunctions, bits);
    }

    static 
    {
        LN2 = Math.log(2D);
        LN2_SQUARED = LN2 * LN2;
    }




}
