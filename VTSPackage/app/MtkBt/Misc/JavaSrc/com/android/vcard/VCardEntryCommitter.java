// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.content.*;
import android.net.Uri;
import android.os.RemoteException;
import android.util.Log;
import java.util.ArrayList;

// Referenced classes of package com.android.vcard:
//            VCardEntryHandler, VCardConfig, VCardEntry

public class VCardEntryCommitter
    implements VCardEntryHandler
{

    public static String LOG_TAG = "vCard";
    private final ContentResolver mContentResolver;
    private int mCounter;
    private final ArrayList mCreatedUris = new ArrayList();
    private ArrayList mOperationList;
    private long mTimeToCommit;

    public VCardEntryCommitter(ContentResolver contentresolver)
    {
        mContentResolver = contentresolver;
    }

    private Uri pushIntoContentResolver(ArrayList arraylist)
    {
        ContentProviderResult acontentproviderresult[] = mContentResolver.applyBatch("com.android.contacts", arraylist);
        if (acontentproviderresult == null)
            break MISSING_BLOCK_LABEL_129;
        if (acontentproviderresult.length == 0)
            break MISSING_BLOCK_LABEL_129;
        if (acontentproviderresult[0] == null)
            return null;
        Uri uri = acontentproviderresult[0].uri;
        return uri;
        RemoteException remoteexception;
        remoteexception;
        String s1 = LOG_TAG;
        Object aobj1[] = new Object[2];
        aobj1[0] = remoteexception.toString();
        aobj1[1] = remoteexception.getMessage();
        Log.e(s1, String.format("%s: %s", aobj1));
        return null;
        OperationApplicationException operationapplicationexception;
        operationapplicationexception;
        String s = LOG_TAG;
        Object aobj[] = new Object[2];
        aobj[0] = operationapplicationexception.toString();
        aobj[1] = operationapplicationexception.getMessage();
        Log.e(s, String.format("%s: %s", aobj));
        return null;
    }

    public ArrayList getCreatedUris()
    {
        return mCreatedUris;
    }

    public void onEnd()
    {
        if (mOperationList != null)
            mCreatedUris.add(pushIntoContentResolver(mOperationList));
        if (VCardConfig.showPerformanceLog())
        {
            String s = LOG_TAG;
            Object aobj[] = new Object[1];
            aobj[0] = Long.valueOf(mTimeToCommit);
            Log.d(s, String.format("time to commit entries: %d ms", aobj));
        }
    }

    public void onEntryCreated(VCardEntry vcardentry)
    {
        long l = System.currentTimeMillis();
        mOperationList = vcardentry.constructInsertOperations(mContentResolver, mOperationList);
        mCounter = 1 + mCounter;
        if (mOperationList != null && mOperationList.size() >= 400)
        {
            mCreatedUris.add(pushIntoContentResolver(mOperationList));
            mCounter = 0;
            mOperationList = null;
        }
        mTimeToCommit = mTimeToCommit + (System.currentTimeMillis() - l);
    }

    public void onStart()
    {
    }

}
