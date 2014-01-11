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
//            InCallTouchUiExtension

public class InCallTouchUiExtensionContainer extends InCallTouchUiExtension
{

    private static final String LOG_TAG = "InCallTouchUiExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("InCallTouchUiExtensionContainer", s);
    }

    public void add(InCallTouchUiExtension incalltouchuiextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        mSubExtensionList.add(incalltouchuiextension);
    }

    public void onFinishInflate(View view)
    {
        if (mSubExtensionList == null)
        {
            log("onFinishInflate(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("onFinishInflate(), inCallTouchUi is ").append(view).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((InCallTouchUiExtension)iterator.next()).onFinishInflate(view));
        }
    }

    public void remove(InCallTouchUiExtension incalltouchuiextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(incalltouchuiextension).toString());
            mSubExtensionList.remove(incalltouchuiextension);
            return;
        }
    }

    public void updateState(CallManager callmanager)
    {
        if (mSubExtensionList == null)
        {
            log("updateState(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("updateState(), call manager is ").append(callmanager).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((InCallTouchUiExtension)iterator.next()).updateState(callmanager));
        }
    }
}
