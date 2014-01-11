// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.widget.Spinner;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.oobe.advanced:
//            AccountPreferenceBase

public class SNSSettings extends AccountPreferenceBase
{


    public volatile ArrayList getAuthoritiesForAccountType(String s)
    {
        return super.getAuthoritiesForAccountType(s);
    }

    protected String getStepSpecialTag()
    {
        return "SNSSettings";
    }

    public volatile void onAccountsUpdated(Account aaccount[])
    {
        super.onAccountsUpdated(aaccount);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        super.mContext = this;
        addPreferencesFromResource(0x7f050005);
        initSpecialLayout(0x7f09007c, 0x7f09007d);
        Spinner spinner = (Spinner)findViewById(0x7f0b000d);
        if (spinner != null)
            spinner.setVisibility(8);
        super.mUnSupportedType = (new String[] {
            "com.android.exchange", "com.google"
        });
        updateAuthDescriptions();
        AccountManager.get(this).addOnAccountsUpdatedListener(this, null, true);
    }

    protected void onDestroy()
    {
        AccountManager.get(this).removeOnAccountsUpdatedListener(this);
        super.onDestroy();
    }

    public volatile boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }
}
