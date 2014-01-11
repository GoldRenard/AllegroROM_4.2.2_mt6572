// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import com.mediatek.oobe.utils.OOBEConstants;
import com.mediatek.oobe.utils.OOBEStepActivity;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SubDefaultSimSettings

public class DefaultSimSettingsWizard extends OOBEStepActivity
{


    protected String getStepSpecialTag()
    {
        return "DefaultSimSettingsWizard";
    }

    protected void onCreate(Bundle bundle)
    {
        OOBEConstants.logi("DefaultSimSettingsWizard, +++++++onCreate() begin++++++++");
        super.onCreate(bundle);
        FragmentTransaction fragmenttransaction = getFragmentManager().beginTransaction();
        fragmenttransaction.replace(0x7f0b001a, new SubDefaultSimSettings());
        fragmenttransaction.commit();
        initSpecialLayout(0x7f090059, 0x7f09005a);
        OOBEConstants.logi("DefaultSimSettingsWizard, +++++++onCreate() finish++++++++");
    }
}
