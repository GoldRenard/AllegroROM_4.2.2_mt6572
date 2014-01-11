// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import com.android.vcard.exception.VCardException;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardParser, VCardParserImpl_V21, VCardInterpreter

public final class VCardParser_V21 extends VCardParser
{

    static final Set sAvailableEncoding = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "7BIT", "8BIT", "QUOTED-PRINTABLE", "BASE64", "B"
    })));
    static final Set sKnownPropertyNameSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "BEGIN", "END", "LOGO", "PHOTO", "LABEL", "FN", "TITLE", "SOUND", "VERSION", "TEL", 
        "EMAIL", "TZ", "GEO", "NOTE", "URL", "BDAY", "ROLE", "REV", "UID", "KEY", 
        "MAILER"
    })));
    static final Set sKnownTypeSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "DOM", "INTL", "POSTAL", "PARCEL", "HOME", "WORK", "PREF", "VOICE", "FAX", "MSG", 
        "CELL", "PAGER", "BBS", "MODEM", "CAR", "ISDN", "VIDEO", "AOL", "APPLELINK", "ATTMAIL", 
        "CIS", "EWORLD", "INTERNET", "IBMMAIL", "MCIMAIL", "POWERSHARE", "PRODIGY", "TLX", "X400", "GIF", 
        "CGM", "WMF", "BMP", "MET", "PMB", "DIB", "PICT", "TIFF", "PDF", "PS", 
        "JPEG", "QTIME", "MPEG", "MPEG2", "AVI", "WAVE", "AIFF", "PCM", "X509", "PGP"
    })));
    static final Set sKnownValueSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "INLINE", "URL", "CONTENT-ID", "CID"
    })));
    private final VCardParserImpl_V21 mVCardParserImpl;

    public VCardParser_V21()
    {
        mVCardParserImpl = new VCardParserImpl_V21();
    }

    public VCardParser_V21(int i)
    {
        mVCardParserImpl = new VCardParserImpl_V21(i);
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
