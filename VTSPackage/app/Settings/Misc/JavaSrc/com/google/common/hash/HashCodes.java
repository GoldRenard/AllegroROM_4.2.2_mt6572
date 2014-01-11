// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;


// Referenced classes of package com.google.common.hash:
//            HashCode

final class HashCodes
{
    private static class BytesHashCode extends HashCode
    {

        final byte bytes[];

        public byte[] asBytes()
        {
            return (byte[])bytes.clone();
        }

        public int asInt()
        {
            return 0xff & bytes[0] | (0xff & bytes[1]) << 8 | (0xff & bytes[2]) << 16 | (0xff & bytes[3]) << 24;
        }

        public long asLong()
        {
            if (bytes.length < 8)
                throw new IllegalStateException("Not enough bytes");
            else
                return 255L & (long)bytes[0] | (255L & (long)bytes[1]) << 8 | (255L & (long)bytes[2]) << 16 | (255L & (long)bytes[3]) << 24 | (255L & (long)bytes[4]) << 32 | (255L & (long)bytes[5]) << 40 | (255L & (long)bytes[6]) << 48 | (255L & (long)bytes[7]) << 56;
        }

        public int bits()
        {
            return 8 * bytes.length;
        }

        BytesHashCode(byte abyte0[])
        {
            bytes = abyte0;
        }
    }

    private static class IntHashCode extends HashCode
    {

        final int hash;

        public byte[] asBytes()
        {
            byte abyte0[] = new byte[4];
            abyte0[0] = (byte)hash;
            abyte0[1] = (byte)(hash >> 8);
            abyte0[2] = (byte)(hash >> 16);
            abyte0[3] = (byte)(hash >> 24);
            return abyte0;
        }

        public int asInt()
        {
            return hash;
        }

        public long asLong()
        {
            throw new IllegalStateException("this HashCode only has 32 bits; cannot create a long");
        }

        public int bits()
        {
            return 32;
        }

        IntHashCode(int i)
        {
            hash = i;
        }
    }

    private static class LongHashCode extends HashCode
    {

        final long hash;

        public byte[] asBytes()
        {
            byte abyte0[] = new byte[8];
            abyte0[0] = (byte)(int)hash;
            abyte0[1] = (byte)(int)(hash >> 8);
            abyte0[2] = (byte)(int)(hash >> 16);
            abyte0[3] = (byte)(int)(hash >> 24);
            abyte0[4] = (byte)(int)(hash >> 32);
            abyte0[5] = (byte)(int)(hash >> 40);
            abyte0[6] = (byte)(int)(hash >> 48);
            abyte0[7] = (byte)(int)(hash >> 56);
            return abyte0;
        }

        public int asInt()
        {
            return (int)hash;
        }

        public long asLong()
        {
            return hash;
        }

        public int bits()
        {
            return 64;
        }

        LongHashCode(long l)
        {
            hash = l;
        }
    }


    private HashCodes()
    {
    }

    static HashCode fromBytes(byte abyte0[])
    {
        return new BytesHashCode(abyte0);
    }

    static HashCode fromInt(int i)
    {
        return new IntHashCode(i);
    }

    static HashCode fromLong(long l)
    {
        return new LongHashCode(l);
    }
}
