// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import com.android.vcard.exception.VCardException;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardParser, VCardParserImpl_V30, VCardInterpreter

public class VCardParser_V30 extends VCardParser
{

    static final Set sAcceptableEncoding = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "7BIT", "8BIT", "BASE64", "B"
    })));
    static final Set sKnownPropertyNameSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "BEGIN", "END", "LOGO", "PHOTO", "LABEL", "FN", "TITLE", "SOUND", "VERSION", "TEL", 
        "EMAIL", "TZ", "GEO", "NOTE", "URL", "BDAY", "ROLE", "REV", "UID", "KEY", 
        "MAILER", "NAME", "PROFILE", "SOURCE", "NICKNAME", "CLASS", "SORT-STRING", "CATEGORIES", "PRODID", "IMPP"
    })));
    private final VCardParserImpl_V30 mVCardParserImpl;

    public VCardParser_V30()
    {
        mVCardParserImpl = new VCardParserImpl_V30();
    }

    public VCardParser_V30(int i)
    {
        mVCardParserImpl = new VCardParserImpl_V30(i);
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
