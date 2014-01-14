// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.net;

import com.google.common.base.Preconditions;
import com.google.common.io.ByteArrayDataInput;
import com.google.common.io.ByteStreams;
import com.google.common.primitives.Ints;
import java.net.*;
import java.nio.ByteBuffer;
import java.util.Arrays;

public final class InetAddresses
{
    public static final class TeredoInfo
    {

        private final Inet4Address client;
        private final int flags;
        private final int port;
        private final Inet4Address server;

        public Inet4Address getClient()
        {
            return client;
        }

        public int getFlags()
        {
            return flags;
        }

        public int getPort()
        {
            return port;
        }

        public Inet4Address getServer()
        {
            return server;
        }

        public TeredoInfo(Inet4Address inet4address, Inet4Address inet4address1, int i, int j)
        {
            boolean flag;
            if (i >= 0 && i <= 65535)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            Preconditions.checkArgument(flag, "port '%s' is out of range (0 <= port <= 0xffff)", aobj);
            boolean flag1;
            if (j >= 0 && j <= 65535)
                flag1 = true;
            else
                flag1 = false;
            Object aobj1[] = new Object[1];
            aobj1[0] = Integer.valueOf(j);
            Preconditions.checkArgument(flag1, "flags '%s' is out of range (0 <= flags <= 0xffff)", aobj1);
            if (inet4address != null)
                server = inet4address;
            else
                server = InetAddresses.ANY4;
            if (inet4address1 != null)
                client = inet4address1;
            else
                client = InetAddresses.ANY4;
            port = i;
            flags = j;
        }
    }


    private static final Inet4Address ANY4 = (Inet4Address)forString("0.0.0.0");
    private static final int IPV4_PART_COUNT = 4;
    private static final int IPV6_PART_COUNT = 8;
    private static final Inet4Address LOOPBACK4 = (Inet4Address)forString("127.0.0.1");

    private InetAddresses()
    {
    }

    public static int coerceToInteger(InetAddress inetaddress)
    {
        return ByteStreams.newDataInput(getCoercedIPv4Address(inetaddress).getAddress()).readInt();
    }

    private static void compressLongestRunOfZeroes(int ai[])
    {
        int i = -1;
        int j = -1;
        int k = -1;
        for (int l = 0; l < 1 + ai.length; l++)
        {
            if (l < ai.length && ai[l] == 0)
            {
                if (k < 0)
                    k = l;
                continue;
            }
            if (k < 0)
                continue;
            int i1 = l - k;
            if (i1 > j)
            {
                i = k;
                j = i1;
            }
            k = -1;
        }

        if (j >= 2)
            Arrays.fill(ai, i, i + j, -1);
    }

    private static String convertDottedQuadToHex(String s)
    {
        int i = s.lastIndexOf(':');
        String s1 = s.substring(0, i + 1);
        byte abyte0[] = textToNumericFormatV4(s.substring(i + 1));
        if (abyte0 == null)
        {
            return null;
        } else
        {
            String s2 = Integer.toHexString((0xff & abyte0[0]) << 8 | 0xff & abyte0[1]);
            String s3 = Integer.toHexString((0xff & abyte0[2]) << 8 | 0xff & abyte0[3]);
            return (new StringBuilder()).append(s1).append(s2).append(":").append(s3).toString();
        }
    }

    private static byte[] copyOfRange(byte abyte0[], int i, int j)
    {
        Preconditions.checkNotNull(abyte0);
        int k = Math.min(j, abyte0.length);
        byte abyte1[] = new byte[j - i];
        System.arraycopy(abyte0, i, abyte1, 0, k - i);
        return abyte1;
    }

    public static InetAddress forString(String s)
    {
        byte abyte0[] = ipStringToBytes(s);
        if (abyte0 == null)
            throw new IllegalArgumentException(String.format("'%s' is not an IP string literal.", new Object[] {
                s
            }));
        InetAddress inetaddress;
        try
        {
            inetaddress = InetAddress.getByAddress(abyte0);
        }
        catch (UnknownHostException unknownhostexception)
        {
            throw new IllegalArgumentException(String.format("'%s' is extremely broken.", new Object[] {
                s
            }), unknownhostexception);
        }
        return inetaddress;
    }

    public static InetAddress forUriString(String s)
    {
        Preconditions.checkNotNull(s);
        boolean flag;
        InetAddress inetaddress1;
        boolean flag1;
        if (s.length() > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "host string is empty");
        inetaddress1 = forString(s);
        flag1 = inetaddress1 instanceof Inet4Address;
        if (flag1)
            return inetaddress1;
        break MISSING_BLOCK_LABEL_47;
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        if (!s.startsWith("[") || !s.endsWith("]"))
            throw new IllegalArgumentException((new StringBuilder()).append("Not a valid address: \"").append(s).append('"').toString());
        InetAddress inetaddress = forString(s.substring(1, -1 + s.length()));
        if (inetaddress instanceof Inet6Address)
            return inetaddress;
        else
            throw new IllegalArgumentException((new StringBuilder()).append("Not a valid address: \"").append(s).append('"').toString());
    }

    public static Inet4Address fromInteger(int i)
    {
        return getInet4Address(Ints.toByteArray(i));
    }

    public static InetAddress fromLittleEndianByteArray(byte abyte0[])
        throws UnknownHostException
    {
        byte abyte1[] = new byte[abyte0.length];
        for (int i = 0; i < abyte0.length; i++)
            abyte1[i] = abyte0[-1 + (abyte0.length - i)];

        return InetAddress.getByAddress(abyte1);
    }

    public static Inet4Address get6to4IPv4Address(Inet6Address inet6address)
    {
        boolean flag = is6to4Address(inet6address);
        Object aobj[] = new Object[1];
        aobj[0] = toAddrString(inet6address);
        Preconditions.checkArgument(flag, "Address '%s' is not a 6to4 address.", aobj);
        return getInet4Address(copyOfRange(inet6address.getAddress(), 2, 6));
    }

    public static Inet4Address getCoercedIPv4Address(InetAddress inetaddress)
    {
        if (inetaddress instanceof Inet4Address)
            return (Inet4Address)inetaddress;
        byte abyte0[] = inetaddress.getAddress();
        boolean flag = true;
        int i = 0;
        do
        {
label0:
            {
                if (i < 15)
                {
                    if (abyte0[i] == 0)
                        break label0;
                    flag = false;
                }
                if (flag && abyte0[15] == 1)
                    return LOOPBACK4;
                if (flag && abyte0[15] == 0)
                    return ANY4;
                Inet6Address inet6address = (Inet6Address)inetaddress;
                long l;
                if (hasEmbeddedIPv4ClientAddress(inet6address))
                    l = getEmbeddedIPv4ClientAddress(inet6address).hashCode();
                else
                    l = ByteBuffer.wrap(inet6address.getAddress(), 0, 8).getLong();
                int j = 0xe0000000 | hash64To32(l);
                if (j == -1)
                    j = -2;
                return getInet4Address(Ints.toByteArray(j));
            }
            i++;
        } while (true);
    }

    public static Inet4Address getCompatIPv4Address(Inet6Address inet6address)
    {
        boolean flag = isCompatIPv4Address(inet6address);
        Object aobj[] = new Object[1];
        aobj[0] = toAddrString(inet6address);
        Preconditions.checkArgument(flag, "Address '%s' is not IPv4-compatible.", aobj);
        return getInet4Address(copyOfRange(inet6address.getAddress(), 12, 16));
    }

    public static Inet4Address getEmbeddedIPv4ClientAddress(Inet6Address inet6address)
    {
        if (isCompatIPv4Address(inet6address))
            return getCompatIPv4Address(inet6address);
        if (is6to4Address(inet6address))
            return get6to4IPv4Address(inet6address);
        if (isTeredoAddress(inet6address))
        {
            return getTeredoInfo(inet6address).getClient();
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = toAddrString(inet6address);
            throw new IllegalArgumentException(String.format("'%s' has no embedded IPv4 address.", aobj));
        }
    }

    private static Inet4Address getInet4Address(byte abyte0[])
    {
        InetAddress inetaddress;
        boolean flag;
        Object aobj[];
        if (abyte0.length == 4)
            flag = true;
        else
            flag = false;
        aobj = new Object[1];
        aobj[0] = Integer.valueOf(abyte0.length);
        Preconditions.checkArgument(flag, "Byte array has invalid length for an IPv4 address: %s != 4.", aobj);
        try
        {
            inetaddress = InetAddress.getByAddress(abyte0);
            if (!(inetaddress instanceof Inet4Address))
            {
                Object aobj2[] = new Object[1];
                aobj2[0] = inetaddress.getHostAddress();
                throw new UnknownHostException(String.format("'%s' is not an IPv4 address.", aobj2));
            }
        }
        catch (UnknownHostException unknownhostexception)
        {
            Object aobj1[] = new Object[1];
            aobj1[0] = Arrays.toString(abyte0);
            throw new IllegalArgumentException(String.format("Host address '%s' is not a valid IPv4 address.", aobj1), unknownhostexception);
        }
        Inet4Address inet4address = (Inet4Address)inetaddress;
        return inet4address;
    }

    public static Inet4Address getIsatapIPv4Address(Inet6Address inet6address)
    {
        boolean flag = isIsatapAddress(inet6address);
        Object aobj[] = new Object[1];
        aobj[0] = toAddrString(inet6address);
        Preconditions.checkArgument(flag, "Address '%s' is not an ISATAP address.", aobj);
        return getInet4Address(copyOfRange(inet6address.getAddress(), 12, 16));
    }

    public static TeredoInfo getTeredoInfo(Inet6Address inet6address)
    {
        boolean flag = isTeredoAddress(inet6address);
        Object aobj[] = new Object[1];
        aobj[0] = toAddrString(inet6address);
        Preconditions.checkArgument(flag, "Address '%s' is not a Teredo address.", aobj);
        byte abyte0[] = inet6address.getAddress();
        Inet4Address inet4address = getInet4Address(copyOfRange(abyte0, 4, 8));
        int i = 0xffff & ByteStreams.newDataInput(abyte0, 8).readShort();
        int j = 0xffff & (-1 ^ ByteStreams.newDataInput(abyte0, 10).readShort());
        byte abyte1[] = copyOfRange(abyte0, 12, 16);
        for (int k = 0; k < abyte1.length; k++)
            abyte1[k] = (byte)(-1 ^ abyte1[k]);

        return new TeredoInfo(inet4address, getInet4Address(abyte1), j, i);
    }

    public static boolean hasEmbeddedIPv4ClientAddress(Inet6Address inet6address)
    {
        return isCompatIPv4Address(inet6address) || is6to4Address(inet6address) || isTeredoAddress(inet6address);
    }

    static int hash64To32(long l)
    {
        long l1 = (-1L ^ l) + (l << 18);
        long l2 = 21L * (l1 ^ l1 >>> 31);
        long l3 = l2 ^ l2 >>> 11;
        long l4 = l3 + (l3 << 6);
        return (int)(l4 ^ l4 >>> 22);
    }

    private static String hextetsToIPv6String(int ai[])
    {
        StringBuilder stringbuilder = new StringBuilder(39);
        boolean flag = false;
        for (int i = 0; i < ai.length; i++)
        {
            boolean flag1;
            if (ai[i] >= 0)
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
            {
                if (flag)
                    stringbuilder.append(':');
                stringbuilder.append(Integer.toHexString(ai[i]));
            } else
            if (i == 0 || flag)
                stringbuilder.append("::");
            flag = flag1;
        }

        return stringbuilder.toString();
    }

    public static InetAddress increment(InetAddress inetaddress)
    {
        byte abyte0[] = inetaddress.getAddress();
        int i;
        for (i = -1 + abyte0.length; i >= 0 && abyte0[i] == -1; i--)
            abyte0[i] = 0;

        boolean flag;
        InetAddress inetaddress1;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Incrementing %s would wrap.", new Object[] {
            inetaddress
        });
        abyte0[i] = (byte)(1 + abyte0[i]);
        try
        {
            inetaddress1 = InetAddress.getByAddress(abyte0);
        }
        catch (UnknownHostException unknownhostexception)
        {
            throw new AssertionError(unknownhostexception);
        }
        return inetaddress1;
    }

    private static byte[] ipStringToBytes(String s)
    {
label0:
        {
            boolean flag = false;
            boolean flag1 = false;
            for (int i = 0; i < s.length(); i++)
            {
                char c = s.charAt(i);
                if (c == '.')
                {
                    flag1 = true;
                    continue;
                }
                if (c == ':')
                {
                    if (!flag1)
                    {
                        flag = true;
                        continue;
                    }
                    break label0;
                }
                if (Character.digit(c, 16) == -1)
                    return null;
            }

            if (flag)
            {
                if (flag1)
                {
                    s = convertDottedQuadToHex(s);
                    if (s == null)
                        break label0;
                }
                return textToNumericFormatV6(s);
            }
            if (flag1)
                return textToNumericFormatV4(s);
        }
        return null;
    }

    public static boolean is6to4Address(Inet6Address inet6address)
    {
        byte abyte0[] = inet6address.getAddress();
        return abyte0[0] == 32 && abyte0[1] == 2;
    }

    public static boolean isCompatIPv4Address(Inet6Address inet6address)
    {
        if (inet6address.isIPv4CompatibleAddress())
        {
            byte abyte0[] = inet6address.getAddress();
            if (abyte0[12] != 0 || abyte0[13] != 0 || abyte0[14] != 0 || abyte0[15] != 0 && abyte0[15] != 1)
                return true;
        }
        return false;
    }

    public static boolean isInetAddress(String s)
    {
        return ipStringToBytes(s) != null;
    }

    public static boolean isIsatapAddress(Inet6Address inet6address)
    {
        if (!isTeredoAddress(inet6address))
        {
            byte abyte0[] = inet6address.getAddress();
            if ((3 | abyte0[8]) == 3 && abyte0[9] == 0 && abyte0[10] == 94 && abyte0[11] == -2)
                return true;
        }
        return false;
    }

    public static boolean isMappedIPv4Address(String s)
    {
label0:
        {
label1:
            {
                byte abyte0[] = ipStringToBytes(s);
                if (abyte0 == null || abyte0.length != 16)
                    break label1;
                for (int i = 0; i < 10; i++)
                    if (abyte0[i] != 0)
                        break label1;

                int j = 10;
                do
                {
                    if (j >= 12)
                        break label0;
                    if (abyte0[j] != -1)
                        break;
                    j++;
                } while (true);
            }
            return false;
        }
        return true;
    }

    public static boolean isMaximum(InetAddress inetaddress)
    {
        byte abyte0[] = inetaddress.getAddress();
        for (int i = 0; i < abyte0.length; i++)
            if (abyte0[i] != -1)
                return false;

        return true;
    }

    public static boolean isTeredoAddress(Inet6Address inet6address)
    {
        byte abyte0[] = inet6address.getAddress();
        return abyte0[0] == 32 && abyte0[1] == 1 && abyte0[2] == 0 && abyte0[3] == 0;
    }

    public static boolean isUriInetAddress(String s)
    {
        try
        {
            forUriString(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    private static short parseHextet(String s)
    {
        int i = Integer.parseInt(s, 16);
        if (i > 65535)
            throw new NumberFormatException();
        else
            return (short)i;
    }

    private static byte parseOctet(String s)
    {
        int i = Integer.parseInt(s);
        if (i <= 255 && (!s.startsWith("0") || s.length() <= 1))
            return (byte)i;
        else
            throw new NumberFormatException();
    }

    private static byte[] textToNumericFormatV4(String s)
    {
        String as[] = s.split("\\.", 5);
        if (as.length == 4) goto _L2; else goto _L1
_L1:
        byte abyte0[] = null;
_L4:
        return abyte0;
_L2:
        abyte0 = new byte[4];
        int i = 0;
        do
        {
            try
            {
                if (i >= abyte0.length)
                    break;
                abyte0[i] = parseOctet(as[i]);
            }
            catch (NumberFormatException numberformatexception)
            {
                return null;
            }
            i++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    private static byte[] textToNumericFormatV6(String s)
    {
        String as[] = s.split(":", 10);
        if (as.length >= 3 && as.length <= 9) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        int i;
        int j;
        i = -1;
        j = 1;
_L6:
        if (j >= -1 + as.length) goto _L4; else goto _L3
_L3:
        if (as[j].length() != 0)
            continue; /* Loop/switch isn't completed */
        if (i >= 0) goto _L1; else goto _L5
_L5:
        i = j;
        j++;
          goto _L6
_L4:
        if (i < 0) goto _L8; else goto _L7
_L7:
        int k;
        int l;
        k = i;
        l = -1 + (as.length - i);
        if (as[0].length() == 0 && --k != 0 || as[-1 + as.length].length() == 0 && --l != 0) goto _L1; else goto _L9
_L9:
        int i1 = 8 - (k + l);
        if (i < 0) goto _L11; else goto _L10
_L10:
        ByteBuffer bytebuffer;
        if (i1 < 1) goto _L1; else goto _L12
_L8:
        k = as.length;
        l = 0;
          goto _L9
_L11:
        if (i1 != 0)
            return null;
_L12:
        int l1;
        bytebuffer = ByteBuffer.allocate(16);
        int j1 = 0;
        while (j1 < k) 
        {
            int k1;
            try
            {
                bytebuffer.putShort(parseHextet(as[j1]));
            }
            catch (NumberFormatException numberformatexception)
            {
                return null;
            }
            j1++;
        }
        k1 = 0;
_L14:
        if (k1 >= i1)
            break; /* Loop/switch isn't completed */
        bytebuffer.putShort((short)0);
        k1++;
        if (true) goto _L14; else goto _L13
_L16:
        if (l1 <= 0)
            break MISSING_BLOCK_LABEL_236;
        bytebuffer.putShort(parseHextet(as[as.length - l1]));
        l1--;
        continue; /* Loop/switch isn't completed */
        return bytebuffer.array();
_L13:
        l1 = l;
        if (true) goto _L16; else goto _L15
_L15:
          goto _L9
    }

    public static String toAddrString(InetAddress inetaddress)
    {
        Preconditions.checkNotNull(inetaddress);
        if (inetaddress instanceof Inet4Address)
            return inetaddress.getHostAddress();
        Preconditions.checkArgument(inetaddress instanceof Inet6Address);
        byte abyte0[] = inetaddress.getAddress();
        int ai[] = new int[8];
        for (int i = 0; i < ai.length; i++)
            ai[i] = Ints.fromBytes((byte)0, (byte)0, abyte0[i * 2], abyte0[1 + i * 2]);

        compressLongestRunOfZeroes(ai);
        return hextetsToIPv6String(ai);
    }

    public static String toUriString(InetAddress inetaddress)
    {
        if (inetaddress instanceof Inet6Address)
            return (new StringBuilder()).append("[").append(toAddrString(inetaddress)).append("]").toString();
        else
            return toAddrString(inetaddress);
    }


}
