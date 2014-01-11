// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import com.mediatek.oobe.utils.OOBEStepActivity;
import com.mediatek.oobe.utils.ZonePicker;

public class TimeZonePickerWizard extends OOBEStepActivity
{


    protected String getStepSpecialTag()
    {
        return "TimeZonePickerWizard";
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        FragmentTransaction fragmenttransaction = getFragmentManager().beginTransaction();
        fragmenttransaction.replace(0x7f0b001a, new ZonePicker());
        fragmenttransaction.commit();
        initSpecialLayout(0x7f090086, 0x7f090087);
    }

    public void onNextStep(boolean flag)
    {
        finish();
        if (flag)
        {
            overridePendingTransition(0x7f040002, 0x7f040001);
            return;
        } else
        {
            overridePendingTransition(0x7f040000, 0x7f040003);
            return;
        }
    }
}
