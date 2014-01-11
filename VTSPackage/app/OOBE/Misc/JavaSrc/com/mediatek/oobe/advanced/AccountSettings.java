// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.oobe.advanced:
//            AccountPreferenceBase

public class AccountSettings extends AccountPreferenceBase
{


    public volatile ArrayList getAuthoritiesForAccountType(String s)
    {
        return super.getAuthoritiesForAccountType(s);
    }

    protected String getStepSpecialTag()
    {
        return "AccountSettings";
    }

    public volatile void onAccountsUpdated(Account aaccount[])
    {
        super.onAccountsUpdated(aaccount);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        super.mContext = this;
        addPreferencesFromResource(0x7f050001);
        super.mAuthorities = getIntent().getStringArrayExtra("authorities");
        initSpecialLayout(0x7f090078, 0x7f090079);
        super.mSupportedType = (new String[] {
            "com.android.exchange", "com.android.email"
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
