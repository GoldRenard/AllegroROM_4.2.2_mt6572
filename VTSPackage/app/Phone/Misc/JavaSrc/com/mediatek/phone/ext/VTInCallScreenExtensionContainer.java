// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.app.Activity;
import android.util.Log;
import android.view.*;
import com.android.internal.telephony.CallManager;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            VTInCallScreenExtension

public class VTInCallScreenExtensionContainer extends VTInCallScreenExtension
{

    private static final String LOG_TAG = "VTInCallScreenExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("VTInCallScreenExtensionContainer", s);
    }

    public void add(VTInCallScreenExtension vtincallscreenextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(vtincallscreenextension).toString());
        mSubExtensionList.add(vtincallscreenextension);
    }

    public boolean initDialingSuccessVTState()
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("initDialingSuccessVTState(), sub extension list is null, just return");
                break label0;
            }
            log("initDialingSuccessVTState()");
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).initDialingSuccessVTState());
            return true;
        }
        return false;
    }

    public boolean initVTInCallScreen(ViewGroup viewgroup, android.view.View.OnTouchListener ontouchlistener, Activity activity)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("initVTInCallScreen(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("initVTInCallScreen(), vtInCallScreen is ").append(viewgroup).append(", touchListener is ").append(ontouchlistener).append(", inCallScreen is ").append(activity).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).initVTInCallScreen(viewgroup, ontouchlistener, activity));
            return true;
        }
        return false;
    }

    public boolean internalAnswerVTCallPre()
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("internalAnswerVTCallPre(), sub extension list is null, just return");
                break label0;
            }
            log("internalAnswerVTCallPre()");
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).internalAnswerVTCallPre());
            return true;
        }
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onKeyDown(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onKeyDown(), keyCode is ").append(i).append(", event is ").append(keyevent).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).onKeyDown(i, keyevent));
            return true;
        }
        return false;
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onPrepareOptionMenu(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onPrepareOptionMenu(), menu is ").append(menu).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).onPrepareOptionsMenu(menu));
            return true;
        }
        return false;
    }

    public boolean onReceiveVTManagerStartCounter(CallManager callmanager)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onReceiveVTManagerStartCounter(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onReceiveVTManagerStartCounter(), call manager is ").append(callmanager).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).onReceiveVTManagerStartCounter(callmanager));
            return true;
        }
        return false;
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onTouch(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onTouch(), view is ").append(view).append(", event is ").append(motionevent).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((VTInCallScreenExtension)iterator.next()).onTouch(view, motionevent));
            return true;
        }
        return false;
    }

    public void remove(VTInCallScreenExtension vtincallscreenextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(vtincallscreenextension).toString());
            mSubExtensionList.remove(vtincallscreenextension);
            return;
        }
    }
}
