// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;


// Referenced classes of package com.android.vcard:
//            VCardInterpreter, VCardProperty

public class VCardEntryCounter
    implements VCardInterpreter
{

    private int mCount;


    public int getCount()
    {
        return mCount;
    }

    public void onEntryEnded()
    {
        mCount = 1 + mCount;
    }

    public void onEntryStarted()
    {
    }

    public void onPropertyCreated(VCardProperty vcardproperty)
    {
    }

    public void onVCardEnded()
    {
    }

    public void onVCardStarted()
    {
    }
}
