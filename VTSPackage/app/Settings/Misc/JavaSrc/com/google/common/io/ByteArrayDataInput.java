// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.DataInput;

public interface ByteArrayDataInput
    extends DataInput
{

    public abstract boolean readBoolean();

    public abstract byte readByte();

    public abstract char readChar();

    public abstract double readDouble();

    public abstract float readFloat();

    public abstract void readFully(byte abyte0[]);

    public abstract void readFully(byte abyte0[], int i, int j);

    public abstract int readInt();

    public abstract String readLine();

    public abstract long readLong();

    public abstract short readShort();

    public abstract String readUTF();

    public abstract int readUnsignedByte();

    public abstract int readUnsignedShort();

    public abstract int skipBytes(int i);
}
