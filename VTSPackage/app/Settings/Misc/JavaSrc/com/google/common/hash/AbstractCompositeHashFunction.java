// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;

import java.nio.charset.Charset;

// Referenced classes of package com.google.common.hash:
//            AbstractStreamingHashFunction, Hasher, HashFunction, HashCode, 
//            Sink, Funnel

abstract class AbstractCompositeHashFunction extends AbstractStreamingHashFunction
{

    private static final long serialVersionUID;
    final HashFunction functions[];

    transient AbstractCompositeHashFunction(HashFunction ahashfunction[])
    {
        functions = ahashfunction;
    }

    abstract HashCode makeHash(Hasher ahasher[]);

    public Hasher newHasher()
    {
        final Hasher hashers[] = new Hasher[functions.length];
        for (int i = 0; i < hashers.length; i++)
            hashers[i] = functions[i].newHasher();

        return new Hasher() {

            final AbstractCompositeHashFunction this$0;
            final Hasher val$hashers[];

            public HashCode hash()
            {
                return makeHash(hashers);
            }

            public Hasher putBoolean(boolean flag)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putBoolean(flag);

                return this;
            }

            public volatile Sink putBoolean(boolean flag)
            {
                return putBoolean(flag);
            }

            public Hasher putByte(byte byte0)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putByte(byte0);

                return this;
            }

            public volatile Sink putByte(byte byte0)
            {
                return putByte(byte0);
            }

            public Hasher putBytes(byte abyte0[])
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putBytes(abyte0);

                return this;
            }

            public Hasher putBytes(byte abyte0[], int j, int k)
            {
                Hasher ahasher[] = hashers;
                int l = ahasher.length;
                for (int i1 = 0; i1 < l; i1++)
                    ahasher[i1].putBytes(abyte0, j, k);

                return this;
            }

            public volatile Sink putBytes(byte abyte0[])
            {
                return putBytes(abyte0);
            }

            public volatile Sink putBytes(byte abyte0[], int j, int k)
            {
                return putBytes(abyte0, j, k);
            }

            public Hasher putChar(char c)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putChar(c);

                return this;
            }

            public volatile Sink putChar(char c)
            {
                return putChar(c);
            }

            public Hasher putDouble(double d)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putDouble(d);

                return this;
            }

            public volatile Sink putDouble(double d)
            {
                return putDouble(d);
            }

            public Hasher putFloat(float f)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putFloat(f);

                return this;
            }

            public volatile Sink putFloat(float f)
            {
                return putFloat(f);
            }

            public Hasher putInt(int j)
            {
                Hasher ahasher[] = hashers;
                int k = ahasher.length;
                for (int l = 0; l < k; l++)
                    ahasher[l].putInt(j);

                return this;
            }

            public volatile Sink putInt(int j)
            {
                return putInt(j);
            }

            public Hasher putLong(long l)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putLong(l);

                return this;
            }

            public volatile Sink putLong(long l)
            {
                return putLong(l);
            }

            public Hasher putObject(Object obj, Funnel funnel)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putObject(obj, funnel);

                return this;
            }

            public Hasher putShort(short word0)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putShort(word0);

                return this;
            }

            public volatile Sink putShort(short word0)
            {
                return putShort(word0);
            }

            public Hasher putString(CharSequence charsequence)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putString(charsequence);

                return this;
            }

            public Hasher putString(CharSequence charsequence, Charset charset)
            {
                Hasher ahasher[] = hashers;
                int j = ahasher.length;
                for (int k = 0; k < j; k++)
                    ahasher[k].putString(charsequence, charset);

                return this;
            }

            public volatile Sink putString(CharSequence charsequence)
            {
                return putString(charsequence);
            }

            public volatile Sink putString(CharSequence charsequence, Charset charset)
            {
                return putString(charsequence, charset);
            }

            
            {
                this$0 = AbstractCompositeHashFunction.this;
                hashers = ahasher;
                super();
            }
        }
;
    }
}
