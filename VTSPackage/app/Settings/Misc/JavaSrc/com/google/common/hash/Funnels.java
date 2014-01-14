// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;


// Referenced classes of package com.google.common.hash:
//            Funnel, Sink

public final class Funnels
{
    private static final class ByteArrayFunnel extends Enum
        implements Funnel
    {

        private static final ByteArrayFunnel $VALUES[];
        public static final ByteArrayFunnel INSTANCE;

        public static ByteArrayFunnel valueOf(String s)
        {
            return (ByteArrayFunnel)Enum.valueOf(com/google/common/hash/Funnels$ByteArrayFunnel, s);
        }

        public static ByteArrayFunnel[] values()
        {
            return (ByteArrayFunnel[])$VALUES.clone();
        }

        public volatile void funnel(Object obj, Sink sink)
        {
            funnel((byte[])obj, sink);
        }

        public void funnel(byte abyte0[], Sink sink)
        {
            sink.putBytes(abyte0);
        }

        public String toString()
        {
            return "Funnels.byteArrayFunnel()";
        }

        static 
        {
            INSTANCE = new ByteArrayFunnel("INSTANCE", 0);
            ByteArrayFunnel abytearrayfunnel[] = new ByteArrayFunnel[1];
            abytearrayfunnel[0] = INSTANCE;
            $VALUES = abytearrayfunnel;
        }

        private ByteArrayFunnel(String s, int i)
        {
            super(s, i);
        }
    }

    private static final class StringFunnel extends Enum
        implements Funnel
    {

        private static final StringFunnel $VALUES[];
        public static final StringFunnel INSTANCE;

        public static StringFunnel valueOf(String s)
        {
            return (StringFunnel)Enum.valueOf(com/google/common/hash/Funnels$StringFunnel, s);
        }

        public static StringFunnel[] values()
        {
            return (StringFunnel[])$VALUES.clone();
        }

        public void funnel(CharSequence charsequence, Sink sink)
        {
            sink.putString(charsequence);
        }

        public volatile void funnel(Object obj, Sink sink)
        {
            funnel((CharSequence)obj, sink);
        }

        public String toString()
        {
            return "Funnels.stringFunnel()";
        }

        static 
        {
            INSTANCE = new StringFunnel("INSTANCE", 0);
            StringFunnel astringfunnel[] = new StringFunnel[1];
            astringfunnel[0] = INSTANCE;
            $VALUES = astringfunnel;
        }

        private StringFunnel(String s, int i)
        {
            super(s, i);
        }
    }


    private Funnels()
    {
    }

    public static Funnel byteArrayFunnel()
    {
        return ByteArrayFunnel.INSTANCE;
    }

    public static Funnel stringFunnel()
    {
        return StringFunnel.INSTANCE;
    }
}
