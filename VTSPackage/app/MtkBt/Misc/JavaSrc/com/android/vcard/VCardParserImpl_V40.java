// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import java.util.Set;

// Referenced classes of package com.android.vcard:
//            VCardParserImpl_V30, VCardParser_V40

class VCardParserImpl_V40 extends VCardParserImpl_V30
{


    public VCardParserImpl_V40(int i)
    {
        super(i);
    }

    public static String unescapeCharacter(char c)
    {
        if (c != 'n' && c != 'N')
            return String.valueOf(c);
        else
            return "\n";
    }

    public static String unescapeText(String s)
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        for (int j = 0; j < i; j++)
        {
            char c = s.charAt(j);
            if (c == '\\' && j < i - 1)
            {
                j++;
                char c1 = s.charAt(j);
                if (c1 != 'n' && c1 != 'N')
                    stringbuilder.append(c1);
                else
                    stringbuilder.append("\n");
            } else
            {
                stringbuilder.append(c);
            }
        }

        return stringbuilder.toString();
    }

    protected Set getKnownPropertyNameSet()
    {
        return VCardParser_V40.sKnownPropertyNameSet;
    }

    protected int getVersion()
    {
        return 2;
    }

    protected String getVersionString()
    {
        return "4.0";
    }

    protected String maybeUnescapeText(String s)
    {
        return unescapeText(s);
    }
}
