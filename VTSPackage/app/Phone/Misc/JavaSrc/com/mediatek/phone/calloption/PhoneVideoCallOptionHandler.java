// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import com.mediatek.calloption.*;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.telephony.IServiceStateExt;

// Referenced classes of package com.mediatek.phone.calloption:
//            PhoneSimPickerAdapter

public class PhoneVideoCallOptionHandler extends VideoCallOptionHandler
{

    private static final String TAG = "PhoneVideoCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneVideoCallOptionHandler", s);
    }

    protected void show3GSIMSelectDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        super.mDialog = SimPickerDialog.create(request.getActivityContext(), request.getActivityContext().getResources().getString(0x7f0d0116), onclicklistener, new PhoneSimPickerAdapter(request.getActivityContext(), -1L, request.isMultipleSim()), false, true);
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }

    protected void showOpen3GServiceDialog(Request request, boolean flag, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(request.getActivityContext());
        if (!flag)
        {
            Object aobj[] = new Object[1];
            aobj[0] = request.getApplicationContext();
            IServiceStateExt iservicestateext = (IServiceStateExt)MediatekClassFactory.createInstance(com/mediatek/common/telephony/IServiceStateExt, aobj);
            android.app.AlertDialog.Builder builder1 = builder.setTitle(0x7f0d0075);
            int i;
            if (iservicestateext.isImeiLocked())
                i = 0x7f0d018e;
            else
                i = 0x7f0d0186;
            builder1.setMessage(i).setNegativeButton(0x104000a, onclicklistener);
        } else
        {
            builder.setTitle(0x7f0d0075).setMessage(0x7f0d001b).setNegativeButton(0x1040009, onclicklistener).setPositiveButton(0x1040013, onclicklistener);
        }
        super.mDialog = builder.create();
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }
}
