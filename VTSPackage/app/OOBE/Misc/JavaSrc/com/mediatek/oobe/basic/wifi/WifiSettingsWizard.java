// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import com.mediatek.oobe.utils.OOBEStepActivity;

// Referenced classes of package com.mediatek.oobe.basic.wifi:
//            WifiSettings

public class WifiSettingsWizard extends OOBEStepActivity
{


    protected String getStepSpecialTag()
    {
        return "WifiSettingsWizard";
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        FragmentTransaction fragmenttransaction = getFragmentManager().beginTransaction();
        fragmenttransaction.replace(0x7f0b001a, new WifiSettings());
        fragmenttransaction.commit();
        initSpecialLayout(0x7f09005b, 0x7f09005d);
    }
}
