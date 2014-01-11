// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class GsmUmtsCallOptions extends PreferenceActivity
{

    private static final boolean DBG = false;
    private static final String LOG_TAG = "GsmUmtsCallOptions";


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060011);
        if (PhoneGlobals.getPhone().getPhoneType() != 1)
            getPreferenceScreen().setEnabled(false);
    }
}
