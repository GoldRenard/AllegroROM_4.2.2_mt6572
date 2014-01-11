// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Longs;
import java.io.*;

public class LittleEndianDataOutputStream extends FilterOutputStream
    implements DataOutput
{

    public LittleEndianDataOutputStream(OutputStream outputstream)
    {
        super(new DataOutputStream((OutputStream)Preconditions.checkNotNull(outputstream)));
    }

    public void write(byte abyte0[], int i, int j)
        throws IOException
    {
        out.write(abyte0, i, j);
    }

    public void writeBoolean(boolean flag)
        throws IOException
    {
        ((DataOutputStream)out).writeBoolean(flag);
    }

    public void writeByte(int i)
        throws IOException
    {
        ((DataOutputStream)out).writeByte(i);
    }

    public void writeBytes(String s)
        throws IOException
    {
        ((DataOutputStream)out).writeBytes(s);
    }

    public void writeChar(int i)
        throws IOException
    {
        writeShort(i);
    }

    public void writeChars(String s)
        throws IOException
    {
        for (int i = 0; i < s.length(); i++)
            writeChar(s.charAt(i));

    }

    public void writeDouble(double d)
        throws IOException
    {
        writeLong(Double.doubleToLongBits(d));
    }

    public void writeFloat(float f)
        throws IOException
    {
        writeInt(Float.floatToIntBits(f));
    }

    public void writeInt(int i)
        throws IOException
    {
        out.write(i & 0xff);
        out.write(0xff & i >> 8);
        out.write(0xff & i >> 16);
        out.write(0xff & i >> 24);
    }

    public void writeLong(long l)
        throws IOException
    {
        byte abyte0[] = Longs.toByteArray(Long.reverseBytes(l));
        write(abyte0, 0, abyte0.length);
    }

    public void writeShort(int i)
        throws IOException
    {
        out.write(i & 0xff);
        out.write(0xff & i >> 8);
    }

    public void writeUTF(String s)
        throws IOException
    {
        ((DataOutputStream)out).writeUTF(s);
    }
}
