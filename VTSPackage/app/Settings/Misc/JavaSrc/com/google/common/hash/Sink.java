// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import java.nio.charset.Charset;

public interface Sink
{

    public abstract Sink putBoolean(boolean flag);

    public abstract Sink putByte(byte byte0);

    public abstract Sink putBytes(byte abyte0[]);

    public abstract Sink putBytes(byte abyte0[], int i, int j);

    public abstract Sink putChar(char c);

    public abstract Sink putDouble(double d);

    public abstract Sink putFloat(float f);

    public abstract Sink putInt(int i);

    public abstract Sink putLong(long l);

    public abstract Sink putShort(short word0);

    public abstract Sink putString(CharSequence charsequence);

    public abstract Sink putString(CharSequence charsequence, Charset charset);
}
