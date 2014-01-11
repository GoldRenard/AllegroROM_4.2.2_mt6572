// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            PhoneGlobalsBroadcastReceiverExtension

public class PhoneGlobalsBroadcastReceiverExtensionContainer extends PhoneGlobalsBroadcastReceiverExtension
{

    private static final String LOG_TAG = "PhoneGlobalsBroadcastReceiverExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("PhoneGlobalsBroadcastReceiverExtensionContainer", s);
    }

    public void add(PhoneGlobalsBroadcastReceiverExtension phoneglobalsbroadcastreceiverextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(phoneglobalsbroadcastreceiverextension).toString());
        mSubExtensionList.add(phoneglobalsbroadcastreceiverextension);
    }

    public boolean onReceive(Context context, Intent intent)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onReceive(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onReceive(), context is ").append(context).append("intent is ").append(intent).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((PhoneGlobalsBroadcastReceiverExtension)iterator.next()).onReceive(context, intent));
            return true;
        }
        return false;
    }

    public void remove(PhoneGlobalsBroadcastReceiverExtension phoneglobalsbroadcastreceiverextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(phoneglobalsbroadcastreceiverextension).toString());
            mSubExtensionList.remove(phoneglobalsbroadcastreceiverextension);
            return;
        }
    }
}
