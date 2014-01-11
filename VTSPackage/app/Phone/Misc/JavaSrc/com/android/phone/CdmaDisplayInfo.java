// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.AlertDialog;
import android.content.Context;
import android.os.SystemProperties;
import android.util.Log;
import android.view.Window;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CdmaDisplayInfo
{

    private static final boolean DBG = false;
    private static final String LOG_TAG = "CdmaDisplayInfo";
    private static AlertDialog sDisplayInfoDialog = null;


    public static void dismissDisplayInfoRecord()
    {
        if (DBG)
            log("Dissmissing Display Info Record...");
        if (sDisplayInfoDialog != null)
        {
            sDisplayInfoDialog.dismiss();
            sDisplayInfoDialog = null;
        }
    }

    public static void displayInfoRecord(Context context, String s)
    {
        if (DBG)
            log((new StringBuilder()).append("displayInfoRecord: infoMsg=").append(s).toString());
        if (sDisplayInfoDialog != null)
            sDisplayInfoDialog.dismiss();
        sDisplayInfoDialog = (new android.app.AlertDialog.Builder(context)).setIcon(0x108009b).setTitle(context.getText(0x7f0d02fa)).setMessage(s).setCancelable(true).create();
        sDisplayInfoDialog.getWindow().setType(2008);
        sDisplayInfoDialog.getWindow().addFlags(2);
        sDisplayInfoDialog.show();
        PhoneGlobals.getInstance().wakeUpScreen();
    }

    private static void log(String s)
    {
        Log.d("CdmaDisplayInfo", (new StringBuilder()).append("[CdmaDisplayInfo] ").append(s).toString());
    }

    static 
    {
        boolean flag = true;
        if (SystemProperties.getInt("ro.debuggable", 0) != flag)
            flag = false;
        DBG = flag;
    }
}
