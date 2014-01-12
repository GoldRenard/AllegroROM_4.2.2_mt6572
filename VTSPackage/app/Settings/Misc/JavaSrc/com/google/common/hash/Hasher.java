// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import java.nio.charset.Charset;

// Referenced classes of package com.google.common.hash:
//            Sink, HashCode, Funnel

public interface Hasher
    extends Sink
{

    public abstract HashCode hash();

    public abstract Hasher putBoolean(boolean flag);

    public abstract Hasher putByte(byte byte0);

    public abstract Hasher putBytes(byte abyte0[]);

    public abstract Hasher putBytes(byte abyte0[], int i, int j);

    public abstract Hasher putChar(char c);

    public abstract Hasher putDouble(double d);

    public abstract Hasher putFloat(float f);

    public abstract Hasher putInt(int i);

    public abstract Hasher putLong(long l);

    public abstract Hasher putObject(Object obj, Funnel funnel);

    public abstract Hasher putShort(short word0);

    public abstract Hasher putString(CharSequence charsequence);

    public abstract Hasher putString(CharSequence charsequence, Charset charset);
}
