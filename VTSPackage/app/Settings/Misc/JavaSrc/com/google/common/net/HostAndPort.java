// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.net;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class HostAndPort
{

    private static final Pattern BRACKET_PATTERN = Pattern.compile("^\\[(.*:.*)\\](?::(\\d*))?$");
    private static final int NO_PORT = -1;
    private final boolean hasBracketlessColons;
    private final String host;
    private final int port;

    private HostAndPort(String s, int i, boolean flag)
    {
        host = s;
        port = i;
        hasBracketlessColons = flag;
    }

    public static HostAndPort fromParts(String s, int i)
    {
        Preconditions.checkArgument(isValidPort(i));
        HostAndPort hostandport = fromString(s);
        boolean flag;
        if (!hostandport.hasPort())
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return new HostAndPort(hostandport.host, i, hostandport.hasBracketlessColons);
    }

    public static HostAndPort fromString(String s)
    {
        Preconditions.checkNotNull(s);
        boolean flag = false;
        String s1;
        String s2;
        int j;
        if (s.startsWith("["))
        {
            Matcher matcher = BRACKET_PATTERN.matcher(s);
            Preconditions.checkArgument(matcher.matches(), "Invalid bracketed host/port: %s", new Object[] {
                s
            });
            s1 = matcher.group(1);
            s2 = matcher.group(2);
        } else
        {
            int i = s.indexOf(':');
            if (i >= 0 && s.indexOf(':', i + 1) == -1)
            {
                s1 = s.substring(0, i);
                s2 = s.substring(i + 1);
                flag = false;
            } else
            {
                s1 = s;
                if (i >= 0)
                    flag = true;
                else
                    flag = false;
                s2 = null;
            }
        }
        j = -1;
        if (s2 != null)
        {
            boolean flag1;
            int k;
            if (!s2.startsWith("+"))
                flag1 = true;
            else
                flag1 = false;
            Preconditions.checkArgument(flag1, "Unparseable port number: %s", new Object[] {
                s
            });
            try
            {
                k = Integer.parseInt(s2);
            }
            catch (NumberFormatException numberformatexception)
            {
                throw new IllegalArgumentException((new StringBuilder()).append("Unparseable port number: ").append(s).toString());
            }
            j = k;
            Preconditions.checkArgument(isValidPort(j), "Port number out of range: %s", new Object[] {
                s
            });
        }
        return new HostAndPort(s1, j, flag);
    }

    private static boolean isValidPort(int i)
    {
        return i >= 0 && i <= 65535;
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (this != obj)
            {
                if (!(obj instanceof HostAndPort))
                    break label0;
                HostAndPort hostandport = (HostAndPort)obj;
                if (!Objects.equal(host, hostandport.host) || port != hostandport.port || hasBracketlessColons != hostandport.hasBracketlessColons)
                    return false;
            }
            return true;
        }
        return false;
    }

    public String getHostText()
    {
        return host;
    }

    public int getPort()
    {
        Preconditions.checkState(hasPort());
        return port;
    }

    public int getPortOrDefault(int i)
    {
        if (hasPort())
            i = port;
        return i;
    }

    public boolean hasPort()
    {
        return port >= 0;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[3];
        aobj[0] = host;
        aobj[1] = Integer.valueOf(port);
        aobj[2] = Boolean.valueOf(hasBracketlessColons);
        return Objects.hashCode(aobj);
    }

    public HostAndPort requireBracketsForIPv6()
    {
        boolean flag;
        if (!hasBracketlessColons)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = host;
        Preconditions.checkArgument(flag, "Possible bracketless IPv6 literal: %s", aobj);
        return this;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder(7 + host.length());
        if (host.indexOf(':') >= 0)
            stringbuilder.append('[').append(host).append(']');
        else
            stringbuilder.append(host);
        if (hasPort())
            stringbuilder.append(':').append(port);
        return stringbuilder.toString();
    }

    public HostAndPort withDefaultPort(int i)
    {
        Preconditions.checkArgument(isValidPort(i));
        if (!hasPort() && port != i)
            return new HostAndPort(host, i, hasBracketlessColons);
        else
            return this;
    }

}
