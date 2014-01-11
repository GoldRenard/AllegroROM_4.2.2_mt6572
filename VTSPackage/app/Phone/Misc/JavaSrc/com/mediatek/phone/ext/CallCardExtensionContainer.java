// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.util.Log;
import android.view.View;
import com.android.internal.telephony.CallManager;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            CallCardExtension

public class CallCardExtensionContainer extends CallCardExtension
{

    private static final String LOG_TAG = "CallCardExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("CallCardExtensionContainer", s);
    }

    public void add(CallCardExtension callcardextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(callcardextension).toString());
        mSubExtensionList.add(callcardextension);
    }

    public void onFinishInflate(View view)
    {
        if (mSubExtensionList == null)
        {
            log("onFinishInflate(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("onFinishInflate(), callCard is ").append(view).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((CallCardExtension)iterator.next()).onFinishInflate(view));
        }
    }

    public void remove(CallCardExtension callcardextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(callcardextension).toString());
            mSubExtensionList.remove(callcardextension);
            return;
        }
    }

    public boolean updateCallInfoLayout(com.android.internal.telephony.PhoneConstants.State state)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("updateCallInfoLayout(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("updateCallInfoLayout(), phone state is ").append(state).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((CallCardExtension)iterator.next()).updateCallInfoLayout(state));
            return true;
        }
        return false;
    }

    public void updateState(CallManager callmanager)
    {
        if (mSubExtensionList == null)
        {
            log("updateState(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("updateState(), call manager is ").append(callmanager).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((CallCardExtension)iterator.next()).updateState(callmanager));
        }
    }
}
