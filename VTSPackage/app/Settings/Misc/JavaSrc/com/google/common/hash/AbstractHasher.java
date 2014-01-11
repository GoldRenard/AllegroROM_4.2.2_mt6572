// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Charsets;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

// Referenced classes of package com.google.common.hash:
//            Hasher, Sink

abstract class AbstractHasher
    implements Hasher
{


    public final Hasher putBoolean(boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 1;
        else
            byte0 = 0;
        return putByte(byte0);
    }

    public volatile Sink putBoolean(boolean flag)
    {
        return putBoolean(flag);
    }

    public final Hasher putDouble(double d)
    {
        return putLong(Double.doubleToRawLongBits(d));
    }

    public volatile Sink putDouble(double d)
    {
        return putDouble(d);
    }

    public final Hasher putFloat(float f)
    {
        return putInt(Float.floatToRawIntBits(f));
    }

    public volatile Sink putFloat(float f)
    {
        return putFloat(f);
    }

    public Hasher putString(CharSequence charsequence)
    {
        return putString(charsequence, Charsets.UTF_16LE);
    }

    public Hasher putString(CharSequence charsequence, Charset charset)
    {
        Hasher hasher;
        try
        {
            hasher = putBytes(charsequence.toString().getBytes(charset.name()));
        }
        catch (UnsupportedEncodingException unsupportedencodingexception)
        {
            throw new AssertionError(unsupportedencodingexception);
        }
        return hasher;
    }

    public volatile Sink putString(CharSequence charsequence)
    {
        return putString(charsequence);
    }

    public volatile Sink putString(CharSequence charsequence, Charset charset)
    {
        return putString(charsequence, charset);
    }
}
