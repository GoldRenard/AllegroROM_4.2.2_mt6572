// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.Dialog;
import android.content.Context;
import android.net.sip.SipManager;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.mediatek.calloption:
//            SimPickerAdapter, CallOptionUtils

public abstract class SimPickerDialog
{

    public static final int DEFAULT_SIM_NOT_SET = -5;
    private static final String TAG = "SimPickerDialog";

    private SimPickerDialog()
    {
    }

    public static Dialog create(Context context, String s, android.content.DialogInterface.OnClickListener onclicklistener, SimPickerAdapter simpickeradapter, boolean flag, boolean flag1)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(context);
        simpickeradapter.setItems(createItemHolder(context, flag, flag1));
        builder.setSingleChoiceItems(simpickeradapter, -1, onclicklistener).setTitle(s);
        return builder.create();
    }

    protected static List createItemHolder(Context context, boolean flag, boolean flag1)
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
        ArrayList arraylist = new ArrayList();
        Collections.sort(list, new Comparator() {

            public int compare(android.provider.Telephony.SIMInfo siminfo1, android.provider.Telephony.SIMInfo siminfo2)
            {
                return siminfo1.mSlot - siminfo2.mSlot;
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((android.provider.Telephony.SIMInfo)obj, (android.provider.Telephony.SIMInfo)obj1);
            }

        }
);
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo != null && siminfo.mSlot >= 0)
            {
                Log.d("SimPickerDialog", (new StringBuilder()).append("[createItemHolder] for simId: ").append(siminfo.mSimId).append(", slotId: ").append(siminfo.mSlot).append(", color: ").append(siminfo.mColor).append(", displayName: ").append(siminfo.mDisplayName).toString());
                SimPickerAdapter.ItemHolder itemholder = new SimPickerAdapter.ItemHolder(siminfo, 0);
                if (!flag1)
                    arraylist.add(itemholder);
                else
                if (CallOptionUtils.get3GCapabilitySIMBySlot(siminfo.mSlot))
                    arraylist.add(itemholder);
            }
        } while (true);
        int i = android.provider.Settings.System.getInt(context.getContentResolver(), "enable_internet_call_value", 0);
        if (!flag1 && flag && SipManager.isVoipSupported(context) && i == 1)
            arraylist.add(new SimPickerAdapter.ItemHolder("Internet", 1));
        return arraylist;
    }

    protected abstract SimPickerAdapter getSimPickerAdapter(Context context, List list, long l);
}
