// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import com.android.vcard.exception.VCardException;
import java.io.IOException;
import java.io.InputStream;

// Referenced classes of package com.android.vcard:
//            VCardInterpreter

public abstract class VCardParser
{


    public abstract void addInterpreter(VCardInterpreter vcardinterpreter);

    public abstract void cancel();

    public abstract void parse(InputStream inputstream)
        throws IOException, VCardException;

    public void parse(InputStream inputstream, VCardInterpreter vcardinterpreter)
        throws IOException, VCardException
    {
        addInterpreter(vcardinterpreter);
        parse(inputstream);
    }

    public abstract void parseOne(InputStream inputstream)
        throws IOException, VCardException;
}
