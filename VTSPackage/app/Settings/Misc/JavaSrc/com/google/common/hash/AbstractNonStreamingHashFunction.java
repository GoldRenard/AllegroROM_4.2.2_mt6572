// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

// Referenced classes of package com.google.common.hash:
//            HashFunction, Hasher, AbstractHasher, Funnel, 
//            HashCode, Sink

abstract class AbstractNonStreamingHashFunction
    implements HashFunction
{
    private final class BufferingHasher extends AbstractHasher
    {

        static final int BOTTOM_BYTE = 255;
        final ExposedByteArrayOutputStream stream;
        final AbstractNonStreamingHashFunction this$0;

        public HashCode hash()
        {
            return hashBytes(stream.byteArray(), 0, stream.length());
        }

        public Hasher putByte(byte byte0)
        {
            stream.write(byte0);
            return this;
        }

        public volatile Sink putByte(byte byte0)
        {
            return putByte(byte0);
        }

        public Hasher putBytes(byte abyte0[])
        {
            try
            {
                stream.write(abyte0);
            }
            catch (IOException ioexception)
            {
                throw Throwables.propagate(ioexception);
            }
            return this;
        }

        public Hasher putBytes(byte abyte0[], int i, int j)
        {
            stream.write(abyte0, i, j);
            return this;
        }

        public volatile Sink putBytes(byte abyte0[])
        {
            return putBytes(abyte0);
        }

        public volatile Sink putBytes(byte abyte0[], int i, int j)
        {
            return putBytes(abyte0, i, j);
        }

        public Hasher putChar(char c)
        {
            stream.write(c & 0xff);
            stream.write(0xff & c >>> 8);
            return this;
        }

        public volatile Sink putChar(char c)
        {
            return putChar(c);
        }

        public Hasher putInt(int i)
        {
            stream.write(i & 0xff);
            stream.write(0xff & i >>> 8);
            stream.write(0xff & i >>> 16);
            stream.write(0xff & i >>> 24);
            return this;
        }

        public volatile Sink putInt(int i)
        {
            return putInt(i);
        }

        public Hasher putLong(long l)
        {
            for (int i = 0; i < 64; i += 8)
                stream.write((byte)(int)(255L & l >>> i));

            return this;
        }

        public volatile Sink putLong(long l)
        {
            return putLong(l);
        }

        public Hasher putObject(Object obj, Funnel funnel)
        {
            funnel.funnel(obj, this);
            return this;
        }

        public Hasher putShort(short word0)
        {
            stream.write(word0 & 0xff);
            stream.write(0xff & word0 >>> 8);
            return this;
        }

        public volatile Sink putShort(short word0)
        {
            return putShort(word0);
        }

        BufferingHasher(int i)
        {
            this$0 = AbstractNonStreamingHashFunction.this;
            super();
            stream = new ExposedByteArrayOutputStream(i);
        }
    }

    private static final class ExposedByteArrayOutputStream extends ByteArrayOutputStream
    {

        byte[] byteArray()
        {
            return buf;
        }

        int length()
        {
            return count;
        }

        ExposedByteArrayOutputStream(int i)
        {
            super(i);
        }
    }



    public Hasher newHasher()
    {
        return new BufferingHasher(32);
    }

    public Hasher newHasher(int i)
    {
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return new BufferingHasher(i);
    }
}
