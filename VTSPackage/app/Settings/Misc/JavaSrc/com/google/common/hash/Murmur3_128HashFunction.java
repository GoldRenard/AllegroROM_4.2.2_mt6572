// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.primitives.UnsignedBytes;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

// Referenced classes of package com.google.common.hash:
//            AbstractStreamingHashFunction, Hasher, HashCodes, HashCode

final class Murmur3_128HashFunction extends AbstractStreamingHashFunction
    implements Serializable
{
    private static final class Murmur3_128Hasher extends AbstractStreamingHashFunction.AbstractStreamingHasher
    {

        long c1;
        long c2;
        long h1;
        long h2;
        int len;

        private void bmix64(long l, long l1)
        {
            h1 = Long.rotateLeft(l * c1, 31) * c2 ^ h1;
            h1 = Long.rotateLeft(h1, 27);
            h1 = h1 + h2;
            h1 = 0x52dce729L + 5L * h1;
            h2 = Long.rotateLeft(l1 * c2, 33) * c1 ^ h2;
            h2 = Long.rotateLeft(h2, 31);
            h2 = h2 + h1;
            h2 = 0x38495ab5L + 5L * h2;
        }

        private long fmix64(long l)
        {
            long l1 = 0xff51afd7ed558ccdL * (l ^ l >>> 33);
            long l2 = 0xc4ceb9fe1a85ec53L * (l1 ^ l1 >>> 33);
            return l2 ^ l2 >>> 33;
        }

        public HashCode makeHash()
        {
            h1 = h1 ^ (long)len;
            h2 = h2 ^ (long)len;
            h1 = h1 + h2;
            h2 = h2 + h1;
            h1 = fmix64(h1);
            h2 = fmix64(h2);
            h1 = h1 + h2;
            h2 = h2 + h1;
            ByteBuffer bytebuffer = ByteBuffer.wrap(new byte[16]).order(ByteOrder.LITTLE_ENDIAN);
            bytebuffer.putLong(h1);
            bytebuffer.putLong(h2);
            return HashCodes.fromBytes(bytebuffer.array());
        }

        protected void process(ByteBuffer bytebuffer)
        {
            long l = bytebuffer.getLong();
            long l1 = bytebuffer.getLong();
            len = 16 + len;
            bmix64(l, l1);
        }

        protected void processRemaining(ByteBuffer bytebuffer)
        {
            long l = 0L;
            long l1 = 0L;
            len = len + bytebuffer.remaining();
            switch (bytebuffer.remaining())
            {
            case 15: // '\017'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(14)) << 48;
                // fall through

            case 14: // '\016'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(13)) << 40;
                // fall through

            case 13: // '\r'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(12)) << 32;
                // fall through

            case 12: // '\f'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(11)) << 24;
                // fall through

            case 11: // '\013'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(10)) << 16;
                // fall through

            case 10: // '\n'
                l1 ^= (long)UnsignedBytes.toInt(bytebuffer.get(9)) << 8;
                // fall through

            case 9: // '\t'
                h2 = Long.rotateLeft((l1 ^ (long)UnsignedBytes.toInt(bytebuffer.get(8)) << 0) * c2, 33) * c1 ^ h2;
                // fall through

            case 8: // '\b'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(7)) << 56;
                // fall through

            case 7: // '\007'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(6)) << 48;
                // fall through

            case 6: // '\006'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(5)) << 40;
                // fall through

            case 5: // '\005'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(4)) << 32;
                // fall through

            case 4: // '\004'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(3)) << 24;
                // fall through

            case 3: // '\003'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(2)) << 16;
                // fall through

            case 2: // '\002'
                l ^= (long)UnsignedBytes.toInt(bytebuffer.get(1)) << 8;
                // fall through

            case 1: // '\001'
                h1 = Long.rotateLeft((l ^ (long)UnsignedBytes.toInt(bytebuffer.get(0)) << 0) * c1, 31) * c2 ^ h1;
                return;

            default:
                return;
            }
        }

        Murmur3_128Hasher(int i)
        {
            super(16);
            c1 = 0x87c37b91114253d5L;
            c2 = 0x4cf5ad432745937fL;
            h1 = i;
            h2 = i;
        }
    }


    private static final long serialVersionUID;
    private final int seed;

    Murmur3_128HashFunction(int i)
    {
        seed = i;
    }

    public int bits()
    {
        return 128;
    }

    public Hasher newHasher()
    {
        return new Murmur3_128Hasher(seed);
    }
}
