// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;


// Referenced classes of package com.android.vcard:
//            VCardProperty

public interface VCardInterpreter
{

    public abstract void onEntryEnded();

    public abstract void onEntryStarted();

    public abstract void onPropertyCreated(VCardProperty vcardproperty);

    public abstract void onVCardEnded();

    public abstract void onVCardStarted();
}
