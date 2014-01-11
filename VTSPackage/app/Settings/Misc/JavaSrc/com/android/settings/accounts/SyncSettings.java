// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.*;
import android.app.Activity;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Intent;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import com.android.settings.AccountPreference;
import com.android.settings.DialogCreatable;
import java.util.ArrayList;

// Referenced classes of package com.android.settings.accounts:
//            AccountPreferenceBase

public class SyncSettings extends AccountPreferenceBase
    implements OnAccountsUpdateListener, DialogCreatable
{

    private static final String KEY_SYNC_SWITCH = "sync_switch";
    private String mAuthorities[];
    private CheckBoxPreference mAutoSyncPreference;
    private com.android.settings.SettingsPreferenceFragment.SettingsDialogFragment mDialogFragment;


    private void removeAccountPreferences()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        for (int i = 0; i < preferencescreen.getPreferenceCount();)
            if (preferencescreen.getPreference(i) instanceof AccountPreference)
                preferencescreen.removePreference(preferencescreen.getPreference(i));
            else
                i++;

    }

    private void startAccountSettings(AccountPreference accountpreference)
    {
        Intent intent = new Intent("android.settings.ACCOUNT_SYNC_SETTINGS");
        intent.putExtra("account", accountpreference.getAccount());
        intent.setFlags(0x10000000);
        startActivity(intent);
        finish();
    }

    public volatile PreferenceScreen addPreferencesForType(String s, PreferenceScreen preferencescreen)
    {
        return super.addPreferencesForType(s, preferencescreen);
    }

    public volatile ArrayList getAuthoritiesForAccountType(String s)
    {
        return super.getAuthoritiesForAccountType(s);
    }

    public void onAccountsUpdated(Account aaccount[])
    {
        int i;
        int j;
        if (getActivity() == null)
            return;
        removeAccountPreferences();
        i = 0;
        j = aaccount.length;
_L10:
        if (i >= j) goto _L2; else goto _L1
_L1:
        Account account;
        ArrayList arraylist;
        boolean flag;
        account = aaccount[i];
        arraylist = getAuthoritiesForAccountType(account.type);
        flag = true;
        if (mAuthorities == null || arraylist == null) goto _L4; else goto _L3
_L3:
        String as[];
        int k;
        int l;
        as = mAuthorities;
        k = as.length;
        l = 0;
_L8:
        flag = false;
        if (l >= k) goto _L4; else goto _L5
_L5:
        if (!arraylist.contains(as[l])) goto _L7; else goto _L6
_L6:
        flag = true;
_L4:
        if (flag)
        {
            android.graphics.drawable.Drawable drawable = getDrawableForType(account.type);
            AccountPreference accountpreference = new AccountPreference(getActivity(), account, drawable, arraylist, true);
            getPreferenceScreen().addPreference(accountpreference);
            accountpreference.setSummary(getLabelForType(account.type));
        }
        i++;
        continue; /* Loop/switch isn't completed */
_L7:
        l++;
        if (true) goto _L8; else goto _L2
_L2:
        onSyncStateUpdated();
        return;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mAutoSyncPreference.setChecked(ContentResolver.getMasterSyncAutomatically());
        mAuthorities = activity.getIntent().getStringArrayExtra("authorities");
        updateAuthDescriptions();
    }

    protected void onAuthDescriptionsUpdated()
    {
        for (int i = 0; i < getPreferenceScreen().getPreferenceCount(); i++)
            if (getPreferenceScreen().getPreference(i) instanceof AccountPreference)
            {
                AccountPreference accountpreference = (AccountPreference)getPreferenceScreen().getPreference(i);
                accountpreference.setIcon(getDrawableForType(accountpreference.getAccount().type));
                accountpreference.setSummary(getLabelForType(accountpreference.getAccount().type));
            }

    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05003a);
        mAutoSyncPreference = (CheckBoxPreference)getPreferenceScreen().findPreference("sync_switch");
        mAutoSyncPreference.setOnPreferenceChangeListener(new android.preference.Preference.OnPreferenceChangeListener() {

            final SyncSettings this$0;

            public boolean onPreferenceChange(Preference preference, Object obj)
            {
                if (ActivityManager.isUserAMonkey())
                    Log.d("SyncSettings", "ignoring monkey's attempt to flip sync state");
                else
                    ContentResolver.setMasterSyncAutomatically(((Boolean)obj).booleanValue());
                return true;
            }

            
            {
                this$0 = SyncSettings.this;
                super();
            }
        }
);
        setHasOptionsMenu(true);
    }

    public volatile void onPause()
    {
        super.onPause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof AccountPreference)
        {
            startAccountSettings((AccountPreference)preference);
            return true;
        } else
        {
            return false;
        }
    }

    public volatile void onResume()
    {
        super.onResume();
    }

    public void onStart()
    {
        super.onStart();
        AccountManager.get(getActivity()).addOnAccountsUpdatedListener(this, null, true);
    }

    public void onStop()
    {
        super.onStop();
        AccountManager.get(getActivity()).removeOnAccountsUpdatedListener(this);
    }

    public void showDialog(int i)
    {
        if (mDialogFragment != null)
            Log.e("AccountSettings", "Old dialog fragment not null!");
        mDialogFragment = new com.android.settings.SettingsPreferenceFragment.SettingsDialogFragment(this, i);
        mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public volatile void updateAuthDescriptions()
    {
        super.updateAuthDescriptions();
    }
}
