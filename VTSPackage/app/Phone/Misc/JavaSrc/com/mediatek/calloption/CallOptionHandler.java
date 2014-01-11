// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.android.internal.telephony.ITelephony;
import com.mediatek.CellConnService.CellConnMgr;
import java.util.LinkedList;
import java.util.ListIterator;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionHandlerFactory, CallOptionBaseHandler, Request

public class CallOptionHandler
{

    private static final String TAG = "CallOptionHandler";
    protected CallOptionHandlerFactory mCallOptionHandlerFactory;
    protected LinkedList mCallOptionHandlerList;

    public CallOptionHandler(CallOptionHandlerFactory calloptionhandlerfactory)
    {
        mCallOptionHandlerFactory = calloptionhandlerfactory;
        mCallOptionHandlerList = new LinkedList();
        mCallOptionHandlerList.add(calloptionhandlerfactory.getFirstCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getInternetCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getVideoCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getSimSelectionCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getSimStatusCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getVoiceMailCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getInternationalCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getIpCallOptionHandler());
        mCallOptionHandlerList.add(calloptionhandlerfactory.getFinalCallOptionHandler());
    }

    private static void log(String s)
    {
        Log.d("CallOptionHandler", s);
    }

    public void dismissDialogs()
    {
        for (ListIterator listiterator = mCallOptionHandlerList.listIterator(); listiterator.hasNext(); ((CallOptionBaseHandler)listiterator.next()).dismissDialog());
    }

    public void doCallOptionHandle(Context context, Context context1, Intent intent, CallOptionBaseHandler.ICallOptionResultHandle icalloptionresulthandle, CellConnMgr cellconnmgr, ITelephony itelephony, boolean flag, 
            boolean flag1)
    {
        ListIterator listiterator = mCallOptionHandlerList.listIterator();
        CallOptionBaseHandler calloptionbasehandler1;
        for (CallOptionBaseHandler calloptionbasehandler = (CallOptionBaseHandler)listiterator.next(); listiterator.hasNext(); calloptionbasehandler = calloptionbasehandler1)
        {
            calloptionbasehandler1 = (CallOptionBaseHandler)listiterator.next();
            calloptionbasehandler.setSuccessor(calloptionbasehandler1);
        }

        Request request = new Request(context, context1, intent, icalloptionresulthandle, cellconnmgr, itelephony, flag, flag1, mCallOptionHandlerFactory);
        ((CallOptionBaseHandler)mCallOptionHandlerList.getFirst()).handleRequest(request);
    }
}
