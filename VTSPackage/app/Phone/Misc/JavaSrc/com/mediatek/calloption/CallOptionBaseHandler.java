// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.Dialog;
import android.content.Intent;

// Referenced classes of package com.mediatek.calloption:
//            Request

public abstract class CallOptionBaseHandler
{
    public static interface ICallOptionResultHandle
    {

        public abstract void onContinueCallProcess(Intent intent);

        public abstract void onHandlingFinish();
    }


    protected Dialog mDialog;
    protected CallOptionBaseHandler mSuccessor;


    public void dismissDialog()
    {
        if (mDialog != null)
            mDialog.cancel();
    }

    public abstract void handleRequest(Request request);

    public void setSuccessor(CallOptionBaseHandler calloptionbasehandler)
    {
        mSuccessor = calloptionbasehandler;
    }
}
