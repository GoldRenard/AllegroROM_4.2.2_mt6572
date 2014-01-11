// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import com.android.vcard.exception.VCardException;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardParser, VCardParserImpl_V40, VCardInterpreter

public class VCardParser_V40 extends VCardParser
{

    static final Set sAcceptableEncoding = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "8BIT", "B"
    })));
    static final Set sKnownPropertyNameSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "BEGIN", "END", "VERSION", "SOURCE", "KIND", "FN", "N", "NICKNAME", "PHOTO", "BDAY", 
        "ANNIVERSARY", "GENDER", "ADR", "TEL", "EMAIL", "IMPP", "LANG", "TZ", "GEO", "TITLE", 
        "ROLE", "LOGO", "ORG", "MEMBER", "RELATED", "CATEGORIES", "NOTE", "PRODID", "REV", "SOUND", 
        "UID", "CLIENTPIDMAP", "URL", "KEY", "FBURL", "CALENDRURI", "CALURI", "XML"
    })));
    private final VCardParserImpl_V40 mVCardParserImpl;

    public VCardParser_V40()
    {
        mVCardParserImpl = new VCardParserImpl_V40();
    }

    public VCardParser_V40(int i)
    {
        mVCardParserImpl = new VCardParserImpl_V40(i);
    }

    public void addInterpreter(VCardInterpreter vcardinterpreter)
    {
        mVCardParserImpl.addInterpreter(vcardinterpreter);
    }

    public void cancel()
    {
        mVCardParserImpl.cancel();
    }

    public void parse(InputStream inputstream)
        throws IOException, VCardException
    {
        mVCardParserImpl.parse(inputstream);
    }

    public void parseOne(InputStream inputstream)
        throws IOException, VCardException
    {
        mVCardParserImpl.parseOne(inputstream);
    }

}
