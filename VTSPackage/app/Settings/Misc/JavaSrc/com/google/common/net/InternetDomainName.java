// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.net;

import com.google.common.base.*;
import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Set;

// Referenced classes of package com.google.common.net:
//            TldPatterns

public final class InternetDomainName
{

    private static final CharMatcher DASH_MATCHER;
    private static final CharMatcher DOTS_MATCHER = CharMatcher.anyOf(".\u3002\uFF0E\uFF61");
    private static final Joiner DOT_JOINER = Joiner.on('.');
    private static final String DOT_REGEX = "\\.";
    private static final Splitter DOT_SPLITTER = Splitter.on('.');
    private static final int MAX_DOMAIN_PART_LENGTH = 63;
    private static final int MAX_LENGTH = 253;
    private static final int MAX_PARTS = 127;
    private static final int NO_PUBLIC_SUFFIX_FOUND = -1;
    private static final CharMatcher PART_CHAR_MATCHER;
    private final String name;
    private final ImmutableList parts;
    private final int publicSuffixIndex = findPublicSuffix();

    InternetDomainName(String s)
    {
        String s1 = Ascii.toLowerCase(DOTS_MATCHER.replaceFrom(s, '.'));
        if (s1.endsWith("."))
            s1 = s1.substring(0, -1 + s1.length());
        boolean flag;
        if (s1.length() <= 253)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Domain name too long: '%s':", new Object[] {
            s1
        });
        name = s1;
        parts = ImmutableList.copyOf(DOT_SPLITTER.split(s1));
        boolean flag1;
        if (parts.size() <= 127)
            flag1 = true;
        else
            flag1 = false;
        Preconditions.checkArgument(flag1, "Domain has too many parts: '%s'", new Object[] {
            s1
        });
        Preconditions.checkArgument(validateSyntax(parts), "Not a valid domain name: '%s'", new Object[] {
            s1
        });
    }

    private InternetDomainName ancestor(int i)
    {
        return from(DOT_JOINER.join(parts.subList(i, parts.size())));
    }

    private int findPublicSuffix()
    {
label0:
        {
            int i = parts.size();
            int j = 0;
            do
            {
                if (j >= i)
                    break label0;
                String s = DOT_JOINER.join(parts.subList(j, i));
                if (TldPatterns.EXACT.contains(s))
                    break;
                if (TldPatterns.EXCLUDED.contains(s))
                    return j + 1;
                if (matchesWildcardPublicSuffix(s))
                    break;
                j++;
            } while (true);
            return j;
        }
        return -1;
    }

    public static InternetDomainName from(String s)
    {
        return new InternetDomainName((String)Preconditions.checkNotNull(s));
    }

    public static InternetDomainName fromLenient(String s)
    {
        return from(s);
    }

    public static boolean isValid(String s)
    {
        try
        {
            from(s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    public static boolean isValidLenient(String s)
    {
        return isValid(s);
    }

    private static boolean matchesWildcardPublicSuffix(String s)
    {
        String as[] = s.split("\\.", 2);
        return as.length == 2 && TldPatterns.UNDER.contains(as[1]);
    }

    private static boolean validatePart(String s, boolean flag)
    {
        if (s.length() >= 1 && s.length() <= 63)
        {
            String s1 = CharMatcher.ASCII.retainFrom(s);
            if (PART_CHAR_MATCHER.matchesAllOf(s1) && !DASH_MATCHER.matches(s.charAt(0)) && !DASH_MATCHER.matches(s.charAt(-1 + s.length())) && (!flag || !CharMatcher.DIGIT.matches(s.charAt(0))))
                return true;
        }
        return false;
    }

    private static boolean validateSyntax(List list)
    {
        int i = -1 + list.size();
        if (!validatePart((String)list.get(i), true))
            return false;
        for (int j = 0; j < i; j++)
            if (!validatePart((String)list.get(j), false))
                return false;

        return true;
    }

    public InternetDomainName child(String s)
    {
        return from((new StringBuilder()).append((String)Preconditions.checkNotNull(s)).append(".").append(name).toString());
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof InternetDomainName)
        {
            InternetDomainName internetdomainname = (InternetDomainName)obj;
            return name.equals(internetdomainname.name);
        } else
        {
            return false;
        }
    }

    public boolean hasParent()
    {
        return parts.size() > 1;
    }

    public boolean hasPublicSuffix()
    {
        return publicSuffixIndex != -1;
    }

    public int hashCode()
    {
        return name.hashCode();
    }

    public boolean isPublicSuffix()
    {
        return publicSuffixIndex == 0;
    }

    public boolean isTopPrivateDomain()
    {
        return publicSuffixIndex == 1;
    }

    public boolean isUnderPublicSuffix()
    {
        return publicSuffixIndex > 0;
    }

    public String name()
    {
        return name;
    }

    public InternetDomainName parent()
    {
        boolean flag = hasParent();
        Object aobj[] = new Object[1];
        aobj[0] = name;
        Preconditions.checkState(flag, "Domain '%s' has no parent", aobj);
        return ancestor(1);
    }

    public ImmutableList parts()
    {
        return parts;
    }

    public InternetDomainName publicSuffix()
    {
        if (hasPublicSuffix())
            return ancestor(publicSuffixIndex);
        else
            return null;
    }

    public String toString()
    {
        return Objects.toStringHelper(this).add("name", name).toString();
    }

    public InternetDomainName topPrivateDomain()
    {
        if (isTopPrivateDomain())
        {
            return this;
        } else
        {
            boolean flag = isUnderPublicSuffix();
            Object aobj[] = new Object[1];
            aobj[0] = name;
            Preconditions.checkState(flag, "Not under a public suffix: %s", aobj);
            return ancestor(-1 + publicSuffixIndex);
        }
    }

    static 
    {
        DASH_MATCHER = CharMatcher.anyOf("-_");
        PART_CHAR_MATCHER = CharMatcher.JAVA_LETTER_OR_DIGIT.or(DASH_MATCHER);
    }
}
