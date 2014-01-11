// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.security.MessageDigest;

public abstract class HashCode
{

    private static final char hexDigits[] = "0123456789abcdef".toCharArray();


    public abstract byte[] asBytes();

    public abstract int asInt();

    public abstract long asLong();

    public abstract int bits();

    public boolean equals(Object obj)
    {
        if (obj instanceof HashCode)
        {
            HashCode hashcode = (HashCode)obj;
            return MessageDigest.isEqual(asBytes(), hashcode.asBytes());
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return asInt();
    }

    public String toString()
    {
        byte abyte0[] = asBytes();
        StringBuilder stringbuilder = new StringBuilder(2 * abyte0.length);
        int i = abyte0.length;
        for (int j = 0; j < i; j++)
        {
            byte byte0 = abyte0[j];
            stringbuilder.append(hexDigits[0xf & byte0 >> 4]).append(hexDigits[byte0 & 0xf]);
        }

        return stringbuilder.toString();
    }

    public int writeBytesTo(byte abyte0[], int i, int j)
    {
        byte abyte1[] = asBytes();
        int ai[] = new int[2];
        ai[0] = j;
        ai[1] = abyte1.length;
        int k = Ints.min(ai);
        Preconditions.checkPositionIndexes(i, i + k, abyte0.length);
        System.arraycopy(abyte1, 0, abyte0, i, k);
        return k;
    }

}
