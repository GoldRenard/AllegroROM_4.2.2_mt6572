// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

// Referenced classes of package com.google.common.hash:
//            AbstractStreamingHashFunction, Hasher, HashCodes, Funnel, 
//            HashCode, Sink

final class MessageDigestHashFunction extends AbstractStreamingHashFunction
{
    private static class MessageDigestHasher
        implements Hasher
    {

        private final MessageDigest digest;
        private boolean done;
        private final ByteBuffer scratch;

        private void checkNotDone()
        {
            boolean flag;
            if (!done)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag, "Cannot use Hasher after calling #hash() on it");
        }

        public HashCode hash()
        {
            done = true;
            return HashCodes.fromBytes(digest.digest());
        }

        public Hasher putBoolean(boolean flag)
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

        public Hasher putByte(byte byte0)
        {
            checkNotDone();
            digest.update(byte0);
            return this;
        }

        public volatile Sink putByte(byte byte0)
        {
            return putByte(byte0);
        }

        public Hasher putBytes(byte abyte0[])
        {
            checkNotDone();
            digest.update(abyte0);
            return this;
        }

        public Hasher putBytes(byte abyte0[], int i, int j)
        {
            checkNotDone();
            Preconditions.checkPositionIndexes(i, i + j, abyte0.length);
            digest.update(abyte0, i, j);
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
            checkNotDone();
            scratch.putChar(c);
            digest.update(scratch.array(), 0, 2);
            scratch.clear();
            return this;
        }

        public volatile Sink putChar(char c)
        {
            return putChar(c);
        }

        public Hasher putDouble(double d)
        {
            checkNotDone();
            scratch.putDouble(d);
            digest.update(scratch.array(), 0, 8);
            scratch.clear();
            return this;
        }

        public volatile Sink putDouble(double d)
        {
            return putDouble(d);
        }

        public Hasher putFloat(float f)
        {
            checkNotDone();
            scratch.putFloat(f);
            digest.update(scratch.array(), 0, 4);
            scratch.clear();
            return this;
        }

        public volatile Sink putFloat(float f)
        {
            return putFloat(f);
        }

        public Hasher putInt(int i)
        {
            checkNotDone();
            scratch.putInt(i);
            digest.update(scratch.array(), 0, 4);
            scratch.clear();
            return this;
        }

        public volatile Sink putInt(int i)
        {
            return putInt(i);
        }

        public Hasher putLong(long l)
        {
            checkNotDone();
            scratch.putLong(l);
            digest.update(scratch.array(), 0, 8);
            scratch.clear();
            return this;
        }

        public volatile Sink putLong(long l)
        {
            return putLong(l);
        }

        public Hasher putObject(Object obj, Funnel funnel)
        {
            checkNotDone();
            funnel.funnel(obj, this);
            return this;
        }

        public Hasher putShort(short word0)
        {
            checkNotDone();
            scratch.putShort(word0);
            digest.update(scratch.array(), 0, 2);
            scratch.clear();
            return this;
        }

        public volatile Sink putShort(short word0)
        {
            return putShort(word0);
        }

        public Hasher putString(CharSequence charsequence)
        {
            for (int i = 0; i < charsequence.length(); i++)
                putChar(charsequence.charAt(i));

            return this;
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

        private MessageDigestHasher(MessageDigest messagedigest)
        {
            digest = messagedigest;
            scratch = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        }

    }


    private final String algorithmName;
    private final int bits;

    MessageDigestHashFunction(String s)
    {
        algorithmName = s;
        bits = 8 * getMessageDigest(s).getDigestLength();
    }

    private static MessageDigest getMessageDigest(String s)
    {
        MessageDigest messagedigest;
        try
        {
            messagedigest = MessageDigest.getInstance(s);
        }
        catch (NoSuchAlgorithmException nosuchalgorithmexception)
        {
            throw new AssertionError(nosuchalgorithmexception);
        }
        return messagedigest;
    }

    public int bits()
    {
        return bits;
    }

    public Hasher newHasher()
    {
        return new MessageDigestHasher(getMessageDigest(algorithmName));
    }
}
