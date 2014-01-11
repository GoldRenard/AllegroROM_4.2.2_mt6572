// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import com.mediatek.calloption.*;

// Referenced classes of package com.mediatek.phone.calloption:
//            PhoneSimPickerAdapter

public class PhoneSimSelectionCallOptionHandler extends SimSelectionCallOptionHandler
{

    private static final String TAG = "PhoneSimSelectionCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneSimSelectionCallOptionHandler", s);
    }

    protected void showAssociateMissingDialog(Request request, android.provider.Telephony.SIMInfo siminfo, String s, com.mediatek.calloption.SimSelectionCallOptionHandler.AssociateSimMissingArgs associatesimmissingargs, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        Resources resources = request.getActivityContext().getResources();
        String s1;
        if (siminfo != null)
            s1 = siminfo.mDisplayName;
        else
            s1 = "";
        String s2;
        if (associatesimmissingargs.viaSimInfo != null)
            s2 = associatesimmissingargs.viaSimInfo.mDisplayName;
        else
            s2 = request.getActivityContext().getResources().getString(0x7f0d02e1);
        String s3 = request.getActivityContext().getResources().getString(0x7f0d001c, new Object[] {
            s1, s2
        });
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(request.getActivityContext());
        builder.setTitle(s).setMessage(s3).setPositiveButton(0x1040013, onclicklistener);
        if (associatesimmissingargs.type == 0)
            builder.setNegativeButton(resources.getString(0x1040000), onclicklistener);
        else
        if (associatesimmissingargs.type == 1)
            builder.setNegativeButton(resources.getString(0x7f0d001d), onclicklistener);
        super.mDialog = builder.create();
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }

    protected void showReasonAskDialog(Request request, long l, boolean flag, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        super.mDialog = SimPickerDialog.create(request.getActivityContext(), request.getActivityContext().getResources().getString(0x7f0d0116), onclicklistener, new PhoneSimPickerAdapter(request.getActivityContext(), l, request.isMultipleSim()), flag, false);
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }
}
