// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.util.Log;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            VTInCallScreenFlagsExtension

public class VTInCallScreenFlagsExtensionContainer extends VTInCallScreenFlagsExtension
{

    private static final String LOG_TAG = "VTInCallScreenFlagsExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("VTInCallScreenFlagsExtensionContainer", s);
    }

    public void add(VTInCallScreenFlagsExtension vtincallscreenflagsextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(vtincallscreenflagsextension).toString());
        mSubExtensionList.add(vtincallscreenflagsextension);
    }

    public void remove(VTInCallScreenFlagsExtension vtincallscreenflagsextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(vtincallscreenflagsextension).toString());
            mSubExtensionList.remove(vtincallscreenflagsextension);
            return;
        }
    }

    public void reset()
    {
        if (mSubExtensionList == null)
        {
            log("reset(), sub extension list is null, just return");
        } else
        {
            log("reset()");
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((VTInCallScreenFlagsExtension)iterator.next()).reset());
        }
    }
}
