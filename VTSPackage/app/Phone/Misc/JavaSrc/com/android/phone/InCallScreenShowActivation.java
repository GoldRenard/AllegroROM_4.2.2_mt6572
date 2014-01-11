// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemProperties;
import android.util.Log;
import com.android.internal.telephony.TelephonyCapabilities;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, OtaUtils

public class InCallScreenShowActivation extends Activity
{

    private static final boolean DBG = false;
    private static final String LOG_TAG = "InCallScreenShowActivation";


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (DBG)
            Log.d("InCallScreenShowActivation", (new StringBuilder()).append("onCreate: intent = ").append(intent).toString());
        Bundle bundle1 = intent.getExtras();
        if (DBG && bundle1 != null)
        {
            Log.d("InCallScreenShowActivation", (new StringBuilder()).append("      - has extras: size = ").append(bundle1.size()).toString());
            Log.d("InCallScreenShowActivation", (new StringBuilder()).append("      - extras = ").append(bundle1).toString());
        }
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (!TelephonyCapabilities.supportsOtasp(PhoneGlobals.getPhone()))
        {
            Log.w("InCallScreenShowActivation", "CDMA Provisioning not supported on this device");
            setResult(0);
            finish();
            return;
        }
        if (intent.getAction().equals("com.android.phone.PERFORM_CDMA_PROVISIONING"))
        {
            boolean flag = PhoneGlobals.sVoiceCapable;
            Log.d("InCallScreenShowActivation", (new StringBuilder()).append("ACTION_PERFORM_CDMA_PROVISIONING (interactiveMode = ").append(flag).append(")...").toString());
            if (intent.hasExtra("ota_override_interactive_mode") && SystemProperties.getInt("ro.debuggable", 0) == 1)
            {
                flag = intent.getBooleanExtra("ota_override_interactive_mode", false);
                Log.d("InCallScreenShowActivation", (new StringBuilder()).append("===> MANUALLY OVERRIDING interactiveMode to ").append(flag).toString());
            }
            phoneglobals.cdmaOtaScreenState.otaspResultCodePendingIntent = (PendingIntent)intent.getParcelableExtra("otasp_result_code_pending_intent");
            if (flag)
            {
                if (DBG)
                    Log.d("InCallScreenShowActivation", "==> Starting interactive CDMA provisioning...");
                OtaUtils.startInteractiveOtasp(this);
                setResult(1);
            } else
            {
                if (DBG)
                    Log.d("InCallScreenShowActivation", "==> Starting non-interactive CDMA provisioning...");
                int i = OtaUtils.startNonInteractiveOtasp(this);
                if (i == 0)
                {
                    if (DBG)
                        Log.d("InCallScreenShowActivation", (new StringBuilder()).append("  ==> successful result from startNonInteractiveOtasp(): ").append(i).toString());
                    setResult(2);
                } else
                {
                    Log.w("InCallScreenShowActivation", (new StringBuilder()).append("Failure code from startNonInteractiveOtasp(): ").append(i).toString());
                    setResult(3);
                }
            }
        } else
        {
            Log.e("InCallScreenShowActivation", (new StringBuilder()).append("Unexpected intent action: ").append(intent).toString());
            setResult(0);
        }
        finish();
    }

    static 
    {
        boolean flag = true;
        if (SystemProperties.getInt("ro.debuggable", 0) != flag)
            flag = false;
        DBG = flag;
    }
}
