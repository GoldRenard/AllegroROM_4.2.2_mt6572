// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;

// Referenced classes of package com.google.common.hash:
//            HashFunction, Hasher, HashCode, AbstractHasher, 
//            Funnel, Sink

abstract class AbstractStreamingHashFunction
    implements HashFunction
{
    protected static abstract class AbstractStreamingHasher extends AbstractHasher
    {

        private final ByteBuffer buffer;
        private final int bufferSize;
        private final int chunkSize;

        private void munch()
        {
            buffer.flip();
            for (; buffer.remaining() >= chunkSize; process(buffer));
            buffer.compact();
        }

        private void munchIfFull()
        {
            if (buffer.remaining() < 8)
                munch();
        }

        private final Hasher putBytes(ByteBuffer bytebuffer)
        {
            if (bytebuffer.remaining() <= buffer.remaining())
            {
                buffer.put(bytebuffer);
                munchIfFull();
                return this;
            }
            int i = bufferSize - buffer.position();
            for (int j = 0; j < i; j++)
                buffer.put(bytebuffer.get());

            munch();
            for (; bytebuffer.remaining() >= chunkSize; process(bytebuffer));
            buffer.put(bytebuffer);
            return this;
        }

        public final HashCode hash()
        {
            munch();
            buffer.flip();
            if (buffer.remaining() > 0)
                processRemaining(buffer);
            return makeHash();
        }

        abstract HashCode makeHash();

        protected abstract void process(ByteBuffer bytebuffer);

        protected void processRemaining(ByteBuffer bytebuffer)
        {
            bytebuffer.position(bytebuffer.limit());
            bytebuffer.limit(7 + chunkSize);
            for (; bytebuffer.position() < chunkSize; bytebuffer.putLong(0L));
            bytebuffer.limit(chunkSize);
            bytebuffer.flip();
            process(bytebuffer);
        }

        public final Hasher putByte(byte byte0)
        {
            buffer.put(byte0);
            munchIfFull();
            return this;
        }

        public volatile Sink putByte(byte byte0)
        {
            return putByte(byte0);
        }

        public final Hasher putBytes(byte abyte0[])
        {
            return putBytes(abyte0, 0, abyte0.length);
        }

        public final Hasher putBytes(byte abyte0[], int i, int j)
        {
            return putBytes(ByteBuffer.wrap(abyte0, i, j).order(ByteOrder.LITTLE_ENDIAN));
        }

        public volatile Sink putBytes(byte abyte0[])
        {
            return putBytes(abyte0);
        }

        public volatile Sink putBytes(byte abyte0[], int i, int j)
        {
            return putBytes(abyte0, i, j);
        }

        public final Hasher putChar(char c)
        {
            buffer.putChar(c);
            munchIfFull();
            return this;
        }

        public volatile Sink putChar(char c)
        {
            return putChar(c);
        }

        public final Hasher putInt(int i)
        {
            buffer.putInt(i);
            munchIfFull();
            return this;
        }

        public volatile Sink putInt(int i)
        {
            return putInt(i);
        }

        public final Hasher putLong(long l)
        {
            buffer.putLong(l);
            munchIfFull();
            return this;
        }

        public volatile Sink putLong(long l)
        {
            return putLong(l);
        }

        public final Hasher putObject(Object obj, Funnel funnel)
        {
            funnel.funnel(obj, this);
            return this;
        }

        public final Hasher putShort(short word0)
        {
            buffer.putShort(word0);
            munchIfFull();
            return this;
        }

        public volatile Sink putShort(short word0)
        {
            return putShort(word0);
        }

        public final Hasher putString(CharSequence charsequence)
        {
            for (int i = 0; i < charsequence.length(); i++)
                putChar(charsequence.charAt(i));

            return this;
        }

        public volatile Sink putString(CharSequence charsequence)
        {
            return putString(charsequence);
        }

        protected AbstractStreamingHasher(int i)
        {
            this(i, i);
        }

        protected AbstractStreamingHasher(int i, int j)
        {
            boolean flag;
            if (j % i == 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            buffer = ByteBuffer.allocate(j + 7).order(ByteOrder.LITTLE_ENDIAN);
            bufferSize = j;
            chunkSize = i;
        }
    }



    public HashCode hashBytes(byte abyte0[])
    {
        return newHasher().putBytes(abyte0).hash();
    }

    public HashCode hashBytes(byte abyte0[], int i, int j)
    {
        return newHasher().putBytes(abyte0, i, j).hash();
    }

    public HashCode hashLong(long l)
    {
        return newHasher().putLong(l).hash();
    }

    public HashCode hashString(CharSequence charsequence)
    {
        return newHasher().putString(charsequence).hash();
    }

    public HashCode hashString(CharSequence charsequence, Charset charset)
    {
        return newHasher().putString(charsequence, charset).hash();
    }

    public Hasher newHasher(int i)
    {
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return newHasher();
    }
}
