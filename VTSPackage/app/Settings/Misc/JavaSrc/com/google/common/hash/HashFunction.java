// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import java.nio.charset.Charset;

// Referenced classes of package com.google.common.hash:
//            HashCode, Hasher

public interface HashFunction
{

    public abstract int bits();

    public abstract HashCode hashBytes(byte abyte0[]);

    public abstract HashCode hashBytes(byte abyte0[], int i, int j);

    public abstract HashCode hashLong(long l);

    public abstract HashCode hashString(CharSequence charsequence);

    public abstract HashCode hashString(CharSequence charsequence, Charset charset);

    public abstract Hasher newHasher();

    public abstract Hasher newHasher(int i);
}
