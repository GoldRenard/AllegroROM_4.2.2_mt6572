// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.primitives.UnsignedBytes;
import java.io.Serializable;
import java.nio.ByteBuffer;

// Referenced classes of package com.google.common.hash:
//            AbstractStreamingHashFunction, Hasher, HashCodes, HashCode

final class Murmur3_32HashFunction extends AbstractStreamingHashFunction
    implements Serializable
{
    private static final class Murmur3_32Hasher extends AbstractStreamingHashFunction.AbstractStreamingHasher
    {

        int c1;
        int c2;
        int h1;
        int len;

        public HashCode makeHash()
        {
            h1 = h1 ^ len;
            h1 = h1 ^ h1 >>> 16;
            h1 = 0x85ebca6b * h1;
            h1 = h1 ^ h1 >>> 13;
            h1 = 0xc2b2ae35 * h1;
            h1 = h1 ^ h1 >>> 16;
            return HashCodes.fromInt(h1);
        }

        protected void process(ByteBuffer bytebuffer)
        {
            int i = bytebuffer.getInt();
            len = 4 + len;
            h1 = Integer.rotateLeft(i * c1, 15) * c2 ^ h1;
            h1 = Integer.rotateLeft(h1, 13);
            h1 = 0xe6546b64 + 5 * h1;
        }

        protected void processRemaining(ByteBuffer bytebuffer)
        {
            len = len + bytebuffer.remaining();
            int i = bytebuffer.remaining();
            int j = 0;
            switch (i)
            {
            case 3: // '\003'
                j = 0 ^ UnsignedBytes.toInt(bytebuffer.get(2)) << 16;
                // fall through

            case 2: // '\002'
                j ^= UnsignedBytes.toInt(bytebuffer.get(1)) << 8;
                // fall through

            case 1: // '\001'
                j ^= UnsignedBytes.toInt(bytebuffer.get(0));
                // fall through

            default:
                h1 = Integer.rotateLeft(j * c1, 15) * c2 ^ h1;
                break;
            }
        }

        Murmur3_32Hasher(int i)
        {
            super(4);
            c1 = 0xcc9e2d51;
            c2 = 0x1b873593;
            h1 = i;
        }
    }


    private static final long serialVersionUID;
    private final int seed;

    Murmur3_32HashFunction(int i)
    {
        seed = i;
    }

    public int bits()
    {
        return 32;
    }

    public Hasher newHasher()
    {
        return new Murmur3_32Hasher(seed);
    }
}
