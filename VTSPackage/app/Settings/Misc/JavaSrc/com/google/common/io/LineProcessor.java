// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.IOException;

public interface LineProcessor
{

    public abstract Object getResult();

    public abstract boolean processLine(String s)
        throws IOException;
}
