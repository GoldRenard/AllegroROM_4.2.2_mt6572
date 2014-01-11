// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.content.Context;
import android.util.Log;
import android.view.ViewGroup;
import com.android.internal.telephony.*;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            VTCallBannerControllerExtension

public class VTCallBannerControllerExtensionContainer extends VTCallBannerControllerExtension
{

    private static final String LOG_TAG = "VTCallBannerControllerExtension";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("VTCallBannerControllerExtension", s);
    }

    public void add(VTCallBannerControllerExtension vtcallbannercontrollerextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(vtcallbannercontrollerextension).toString());
        mSubExtensionList.add(vtcallbannercontrollerextension);
    }

    public void initialize(Context context, ViewGroup viewgroup)
    {
        if (mSubExtensionList == null)
        {
            log("initialize(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("initialize(), context is ").append(context).append(" vtCallBanner is ").append(viewgroup).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((VTCallBannerControllerExtension)iterator.next()).initialize(context, viewgroup));
        }
    }

    public void remove(VTCallBannerControllerExtension vtcallbannercontrollerextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(vtcallbannercontrollerextension).toString());
            mSubExtensionList.remove(vtcallbannercontrollerextension);
            return;
        }
    }

    public boolean updateCallStateWidgets(Call call)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("updateCallStateWidgets(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("updateCallStateWidgets(), call is ").append(call).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTCallBannerControllerExtension)iterator.next()).updateCallStateWidgets(call));
            return true;
        }
        return false;
    }

    public void updateDisplayForPerson(CallerInfo callerinfo, int i, boolean flag, Call call, Connection connection)
    {
        if (mSubExtensionList == null)
        {
            log("updateDisplayForPerson(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("updateDisplayForPerson(), info is ").append(callerinfo).append(", presentation is ").append(i).append(", isTemporary is ").append(flag).append(", call is ").append(call).append(", connection is ").append(connection).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((VTCallBannerControllerExtension)iterator.next()).updateDisplayForPerson(callerinfo, i, flag, call, connection));
        }
    }

    public boolean updateState(Call call)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("updateState(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("updateState(), call is ").append(call).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTCallBannerControllerExtension)iterator.next()).updateState(call));
            return true;
        }
        return false;
    }
}
