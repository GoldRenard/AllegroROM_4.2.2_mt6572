// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.primitives.UnsignedInts;
import java.nio.ByteBuffer;
import java.util.Iterator;

// Referenced classes of package com.google.common.hash:
//            Murmur3_32HashFunction, Murmur3_128HashFunction, MessageDigestHashFunction, HashCode, 
//            HashCodes, HashFunction, AbstractCompositeHashFunction, Hasher

public final class Hashing
{
    private static class ConcatenatedHashFunction extends AbstractCompositeHashFunction
    {

        final int bits;

        public int bits()
        {
            return bits;
        }

        HashCode makeHash(Hasher ahasher[])
        {
            byte abyte0[] = new byte[bits / 8];
            ByteBuffer bytebuffer = ByteBuffer.wrap(abyte0);
            int i = ahasher.length;
            for (int j = 0; j < i; j++)
                bytebuffer.put(ahasher[j].hash().asBytes());

            return HashCodes.fromBytes(abyte0);
        }

        ConcatenatedHashFunction(HashFunction ahashfunction[])
        {
            super(ahashfunction);
            int i = 0;
            HashFunction ahashfunction1[] = super.functions;
            int j = ahashfunction1.length;
            for (int k = 0; k < j; k++)
                i += ahashfunction1[k].bits();

            bits = i;
        }
    }


    private static final HashFunction MD5 = new MessageDigestHashFunction("MD5");
    private static final Murmur3_128HashFunction MURMUR3_128 = new Murmur3_128HashFunction(0);
    private static final Murmur3_32HashFunction MURMUR3_32 = new Murmur3_32HashFunction(0);
    private static final HashFunction SHA_1 = new MessageDigestHashFunction("SHA-1");
    private static final HashFunction SHA_256 = new MessageDigestHashFunction("SHA-256");
    private static final HashFunction SHA_512 = new MessageDigestHashFunction("SHA-512");

    private Hashing()
    {
    }

    static int checkPositiveAndMakeMultipleOf32(int i)
    {
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Number of bits must be positive");
        return 0xffffffe0 & i + 31;
    }

    public static HashCode combineOrdered(Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        Preconditions.checkArgument(iterator.hasNext(), "Must be at least 1 hash code to combine.");
        byte abyte0[] = new byte[((HashCode)iterator.next()).bits() / 8];
        for (Iterator iterator1 = iterable.iterator(); iterator1.hasNext();)
        {
            byte abyte1[] = ((HashCode)iterator1.next()).asBytes();
            boolean flag;
            if (abyte1.length == abyte0.length)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag, "All hashcodes must have the same bit length.");
            int i = 0;
            while (i < abyte1.length) 
            {
                abyte0[i] = (byte)(37 * abyte0[i] ^ abyte1[i]);
                i++;
            }
        }

        return HashCodes.fromBytes(abyte0);
    }

    public static HashCode combineUnordered(Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        Preconditions.checkArgument(iterator.hasNext(), "Must be at least 1 hash code to combine.");
        byte abyte0[] = new byte[((HashCode)iterator.next()).bits() / 8];
        for (Iterator iterator1 = iterable.iterator(); iterator1.hasNext();)
        {
            byte abyte1[] = ((HashCode)iterator1.next()).asBytes();
            boolean flag;
            if (abyte1.length == abyte0.length)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag, "All hashcodes must have the same bit length.");
            int i = 0;
            while (i < abyte1.length) 
            {
                abyte0[i] = (byte)(abyte0[i] + abyte1[i]);
                i++;
            }
        }

        return HashCodes.fromBytes(abyte0);
    }

    public static int consistentHash(long l, int i)
    {
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "buckets must be positive: %s", aobj);
        long l1 = l;
        int j = 0;
        do
        {
            l1 = 1L + 0x27bb2ee687b0b0fdL * l1;
            int k = (int)((2147483648D / (double)(1 + (int)(l1 >>> 33))) * (double)(j + 1));
            if (k >= 0 && k < i)
                j = k;
            else
                return j;
        } while (true);
    }

    public static int consistentHash(HashCode hashcode, int i)
    {
        return consistentHash(padToLong(hashcode), i);
    }

    public static HashFunction goodFastHash(int i)
    {
        int j = checkPositiveAndMakeMultipleOf32(i);
        if (j == 32)
            return murmur3_32();
        if (j <= 128)
            return murmur3_128();
        int k = (j + 127) / 128;
        HashFunction ahashfunction[] = new HashFunction[k];
        for (int l = 0; l < k; l++)
            ahashfunction[l] = murmur3_128(0x596f0ddf * l);

        return new ConcatenatedHashFunction(ahashfunction);
    }

    public static HashFunction md5()
    {
        return MD5;
    }

    public static HashFunction murmur3_128()
    {
        return MURMUR3_128;
    }

    public static HashFunction murmur3_128(int i)
    {
        return new Murmur3_128HashFunction(i);
    }

    public static HashFunction murmur3_32()
    {
        return MURMUR3_32;
    }

    public static HashFunction murmur3_32(int i)
    {
        return new Murmur3_32HashFunction(i);
    }

    public static long padToLong(HashCode hashcode)
    {
        if (hashcode.bits() < 64)
            return UnsignedInts.toLong(hashcode.asInt());
        else
            return hashcode.asLong();
    }

    public static HashFunction sha1()
    {
        return SHA_1;
    }

    public static HashFunction sha256()
    {
        return SHA_256;
    }

    public static HashFunction sha512()
    {
        return SHA_512;
    }

}
