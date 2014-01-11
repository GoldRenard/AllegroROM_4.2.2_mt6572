// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.net;

import com.google.common.base.Preconditions;
import java.text.ParseException;

// Referenced classes of package com.google.common.net:
//            HostAndPort, InetAddresses, InternetDomainName

public final class HostSpecifier
{

    private final String canonicalForm;

    private HostSpecifier(String s)
    {
        canonicalForm = s;
    }

    public static HostSpecifier from(String s)
        throws ParseException
    {
        HostSpecifier hostspecifier;
        try
        {
            hostspecifier = fromValid(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            ParseException parseexception = new ParseException((new StringBuilder()).append("Invalid host specifier: ").append(s).toString(), 0);
            parseexception.initCause(illegalargumentexception);
            throw parseexception;
        }
        return hostspecifier;
    }

    public static HostSpecifier fromValid(String s)
    {
        String s1;
        java.net.InetAddress inetaddress;
        HostAndPort hostandport = HostAndPort.fromString(s);
        boolean flag;
        java.net.InetAddress inetaddress1;
        if (!hostandport.hasPort())
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        s1 = hostandport.getHostText();
        inetaddress1 = InetAddresses.forString(s1);
        inetaddress = inetaddress1;
_L2:
        if (inetaddress != null)
            return new HostSpecifier(InetAddresses.toUriString(inetaddress));
        InternetDomainName internetdomainname = InternetDomainName.from(s1);
        if (internetdomainname.hasPublicSuffix())
            return new HostSpecifier(internetdomainname.name());
        else
            throw new IllegalArgumentException((new StringBuilder()).append("Domain name does not have a recognized public suffix: ").append(s1).toString());
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        inetaddress = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public static boolean isValid(String s)
    {
        try
        {
            fromValid(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    public boolean equals(Object obj)
    {
        if (this == obj)
            return true;
        if (obj instanceof HostSpecifier)
        {
            HostSpecifier hostspecifier = (HostSpecifier)obj;
            return canonicalForm.equals(hostspecifier.canonicalForm);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return canonicalForm.hashCode();
    }

    public String toString()
    {
        return canonicalForm;
    }
}
