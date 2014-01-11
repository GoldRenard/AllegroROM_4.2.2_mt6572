// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.accounts.Account;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardInterpreter, VCardEntry, VCardEntryHandler, VCardProperty

public class VCardEntryConstructor
    implements VCardInterpreter
{

    private static String LOG_TAG = "vCard";
    private final Account mAccount;
    private VCardEntry mCurrentEntry;
    private final List mEntryHandlers;
    private final List mEntryStack;
    private final int mVCardType;

    public VCardEntryConstructor()
    {
        this(0xc0000000, null, null);
    }

    public VCardEntryConstructor(int i)
    {
        this(i, null, null);
    }

    public VCardEntryConstructor(int i, Account account)
    {
        this(i, account, null);
    }

    public VCardEntryConstructor(int i, Account account, String s)
    {
        mEntryStack = new ArrayList();
        mEntryHandlers = new ArrayList();
        mVCardType = i;
        mAccount = account;
    }

    public void addEntryHandler(VCardEntryHandler vcardentryhandler)
    {
        mEntryHandlers.add(vcardentryhandler);
    }

    public void clear()
    {
        mCurrentEntry = null;
        mEntryStack.clear();
    }

    public void onEntryEnded()
    {
        mCurrentEntry.consolidateFields();
        for (Iterator iterator = mEntryHandlers.iterator(); iterator.hasNext(); ((VCardEntryHandler)iterator.next()).onEntryCreated(mCurrentEntry));
        int i = mEntryStack.size();
        if (i > 1)
        {
            VCardEntry vcardentry = (VCardEntry)mEntryStack.get(i - 2);
            vcardentry.addChild(mCurrentEntry);
            mCurrentEntry = vcardentry;
        } else
        {
            mCurrentEntry = null;
        }
        mEntryStack.remove(i - 1);
    }

    public void onEntryStarted()
    {
        mCurrentEntry = new VCardEntry(mVCardType, mAccount);
        mEntryStack.add(mCurrentEntry);
    }

    public void onPropertyCreated(VCardProperty vcardproperty)
    {
        mCurrentEntry.addProperty(vcardproperty);
    }

    public void onVCardEnded()
    {
        for (Iterator iterator = mEntryHandlers.iterator(); iterator.hasNext(); ((VCardEntryHandler)iterator.next()).onEnd());
    }

    public void onVCardStarted()
    {
        for (Iterator iterator = mEntryHandlers.iterator(); iterator.hasNext(); ((VCardEntryHandler)iterator.next()).onStart());
    }

}
