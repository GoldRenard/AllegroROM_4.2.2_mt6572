// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import com.mediatek.oobe.utils.OOBEConstants;
import com.mediatek.oobe.utils.OOBEStepActivity;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SubSimManagementSettings, SimManagement

public class SimManagementSettingsWizard extends OOBEStepActivity
{

    private SubSimManagementSettings mSubSimManagementSettings;


    protected String getStepSpecialTag()
    {
        return "SimManagementSettingsWizard";
    }

    protected void onCreate(Bundle bundle)
    {
        int i = getIntent().getIntExtra("oobe_step_total", 1);
        int j = getIntent().getIntExtra("oobe_step_index", 0);
        mSubSimManagementSettings = new SubSimManagementSettings();
        SimManagement.initProgressBar(i, j);
        super.onCreate(bundle);
        FragmentTransaction fragmenttransaction = getFragmentManager().beginTransaction();
        fragmenttransaction.replace(0x7f0b001a, mSubSimManagementSettings);
        fragmenttransaction.commit();
        initSpecialLayout(0x7f090055, 0x7f090056);
        OOBEConstants.logd("SimManagementSettingsWizard onCreate()");
    }
}
