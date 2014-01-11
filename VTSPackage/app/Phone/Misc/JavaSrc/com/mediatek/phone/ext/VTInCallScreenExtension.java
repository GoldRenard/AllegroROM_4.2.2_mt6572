// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.app.Activity;
import android.view.*;
import com.android.internal.telephony.CallManager;

public class VTInCallScreenExtension
{


    public boolean initDialingSuccessVTState()
    {
        return false;
    }

    public boolean initVTInCallScreen(ViewGroup viewgroup, android.view.View.OnTouchListener ontouchlistener, Activity activity)
    {
        return false;
    }

    public boolean internalAnswerVTCallPre()
    {
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        return false;
    }

    public boolean onReceiveVTManagerStartCounter(CallManager callmanager)
    {
        return false;
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        return false;
    }
}
