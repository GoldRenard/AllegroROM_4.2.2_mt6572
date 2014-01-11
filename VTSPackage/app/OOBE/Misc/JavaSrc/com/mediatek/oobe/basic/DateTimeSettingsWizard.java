// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import com.mediatek.oobe.utils.OOBEStepActivity;

// Referenced classes of package com.mediatek.oobe.basic:
//            DateTimeSettings

public class DateTimeSettingsWizard extends OOBEStepActivity
{


    protected String getStepSpecialTag()
    {
        return "DateTimeSettingsWizard";
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        DateTimeSettings datetimesettings = new DateTimeSettings();
        datetimesettings.initProgressBar(getIntent().getIntExtra("oobe_step_total", 1), getIntent().getIntExtra("oobe_step_index", 0));
        FragmentTransaction fragmenttransaction = getFragmentManager().beginTransaction();
        fragmenttransaction.replace(0x7f0b001a, datetimesettings);
        fragmenttransaction.commit();
        initSpecialLayout(0x7f09005e, 0x7f09005f);
    }
}
