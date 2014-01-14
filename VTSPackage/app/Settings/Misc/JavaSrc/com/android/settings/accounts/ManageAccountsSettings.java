// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.*;
import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import android.view.*;
import android.widget.ListView;
import android.widget.TextView;
import com.android.settings.AccountPreference;
import com.android.settings.Utils;
import java.util.*;

// Referenced classes of package com.android.settings.accounts:
//            AccountPreferenceBase, AccountSyncSettings

public class ManageAccountsSettings extends AccountPreferenceBase
    implements OnAccountsUpdateListener
{

    private static final String ACCOUNT_KEY = "account";
    public static final String KEY_ACCOUNT_LABEL = "account_label";
    public static final String KEY_ACCOUNT_TYPE = "account_type";
    private static final int MENU_SYNC_CANCEL_ID = 2;
    private static final int MENU_SYNC_NOW_ID = 1;
    private static final int REQUEST_SHOW_SYNC_SETTINGS = 1;
    private String mAccountType;
    private String mAuthorities[];
    private com.android.settings.SettingsPreferenceFragment.SettingsDialogFragment mDialogFragment;
    private TextView mErrorInfoView;
    private Account mFirstAccount;


    private void addAuthenticatorSettings()
    {
        PreferenceScreen preferencescreen = addPreferencesForType(mAccountType, getPreferenceScreen());
        if (preferencescreen != null)
            updatePreferenceIntents(preferencescreen);
    }

    private void requestOrCancelSyncForAccounts(boolean flag)
    {
        SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
        Bundle bundle = new Bundle();
        bundle.putBoolean("force", true);
        int i = getPreferenceScreen().getPreferenceCount();
        for (int j = 0; j < i; j++)
        {
            Preference preference = getPreferenceScreen().getPreference(j);
            if (!(preference instanceof AccountPreference))
                continue;
            Account account = ((AccountPreference)preference).getAccount();
            for (int k = 0; k < asyncadaptertype.length; k++)
            {
                SyncAdapterType syncadaptertype = asyncadaptertype[k];
                if (!asyncadaptertype[k].accountType.equals(mAccountType) || !ContentResolver.getSyncAutomatically(account, syncadaptertype.authority))
                    continue;
                if (flag)
                    ContentResolver.requestSync(account, syncadaptertype.authority, bundle);
                else
                    ContentResolver.cancelSync(account, syncadaptertype.authority);
            }

        }

    }

    private void startAccountSettings(AccountPreference accountpreference)
    {
        Bundle bundle = new Bundle();
        bundle.putParcelable("account", accountpreference.getAccount());
        ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/accounts/AccountSyncSettings.getCanonicalName(), bundle, 0x7f0b082e, accountpreference.getAccount().name, this, 1);
    }

    private void updatePreferenceIntents(PreferenceScreen preferencescreen)
    {
        PackageManager packagemanager = getActivity().getPackageManager();
        int i = 0;
        do
        {
            if (i >= preferencescreen.getPreferenceCount())
                break;
            Intent intent = preferencescreen.getPreference(i).getIntent();
            if (intent != null)
            {
                if (packagemanager.resolveActivity(intent, 0x10000) == null)
                {
                    preferencescreen.removePreference(preferencescreen.getPreference(i));
                    continue;
                }
                intent.putExtra("account", mFirstAccount);
                intent.setFlags(0x10000000 | intent.getFlags());
            }
            i++;
        } while (true);
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
        getPreferenceScreen().removeAll();
        mFirstAccount = null;
        addPreferencesFromResource(0x7f05001f);
        i = 0;
        j = aaccount.length;
_L12:
        if (i >= j) goto _L2; else goto _L1
_L1:
        Account account = aaccount[i];
        if (mAccountType != null && !account.type.equals(mAccountType)) goto _L4; else goto _L3
_L3:
        ArrayList arraylist;
        boolean flag;
        arraylist = getAuthoritiesForAccountType(account.type);
        flag = true;
        if (mAuthorities == null || arraylist == null) goto _L6; else goto _L5
_L5:
        String as[];
        int k;
        int l;
        as = mAuthorities;
        k = as.length;
        l = 0;
_L10:
        flag = false;
        if (l >= k) goto _L6; else goto _L7
_L7:
        if (!arraylist.contains(as[l])) goto _L9; else goto _L8
_L8:
        flag = true;
_L6:
        if (flag)
        {
            android.graphics.drawable.Drawable drawable = getDrawableForType(account.type);
            AccountPreference accountpreference = new AccountPreference(getActivity(), account, drawable, arraylist, false);
            getPreferenceScreen().addPreference(accountpreference);
            if (mFirstAccount == null)
                mFirstAccount = account;
        }
_L4:
        i++;
        continue; /* Loop/switch isn't completed */
_L9:
        l++;
        if (true) goto _L10; else goto _L2
_L2:
        if (mAccountType != null && mFirstAccount != null)
        {
            addAuthenticatorSettings();
        } else
        {
            Intent intent = new Intent("android.settings.SETTINGS");
            intent.setFlags(0x4000000);
            getActivity().startActivity(intent);
        }
        onSyncStateUpdated();
        return;
        if (true) goto _L12; else goto _L11
_L11:
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mErrorInfoView = (TextView)getView().findViewById(0x7f080003);
        mErrorInfoView.setVisibility(8);
        mAuthorities = activity.getIntent().getStringArrayExtra("authorities");
        Bundle bundle1 = getArguments();
        if (bundle1 != null && bundle1.containsKey("account_label"))
            getActivity().setTitle(bundle1.getString("account_label"));
        updateAuthDescriptions();
    }

    protected void onAuthDescriptionsUpdated()
    {
        for (int i = 0; i < getPreferenceScreen().getPreferenceCount(); i++)
        {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (preference instanceof AccountPreference)
            {
                AccountPreference accountpreference = (AccountPreference)preference;
                accountpreference.setSummary(getLabelForType(accountpreference.getAccount().type));
            }
        }

    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Bundle bundle1 = getArguments();
        if (bundle1 != null && bundle1.containsKey("account_type"))
            mAccountType = bundle1.getString("account_type");
        addPreferencesFromResource(0x7f05001f);
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, getString(0x7f0b083d)).setIcon(0x7f02006d);
        menu.add(0, 2, 0, getString(0x7f0b083e)).setIcon(0x1080038);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f040044, viewgroup, false);
        Utils.prepareCustomPreferencesList(viewgroup, view, (ListView)view.findViewById(0x102000a), false);
        return view;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2: // '\002'
            requestOrCancelSyncForAccounts(false);
            return true;

        case 1: // '\001'
            requestOrCancelSyncForAccounts(true);
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
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

    public void onPrepareOptionsMenu(Menu menu)
    {
        boolean flag = true;
        super.onPrepareOptionsMenu(menu);
        boolean flag1;
        if (ContentResolver.getCurrentSync() != null)
            flag1 = flag;
        else
            flag1 = false;
        MenuItem menuitem = menu.findItem(flag);
        boolean flag2;
        if (!flag1 && mFirstAccount != null)
            flag2 = flag;
        else
            flag2 = false;
        menuitem.setVisible(flag2);
        MenuItem menuitem1 = menu.findItem(2);
        if (!flag1 || mFirstAccount == null)
            flag = false;
        menuitem1.setVisible(flag);
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
        Activity activity = getActivity();
        AccountManager.get(activity).removeOnAccountsUpdatedListener(this);
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
    }

    protected void onSyncStateUpdated()
    {
        if (getActivity() == null)
            return;
        SyncInfo syncinfo = ContentResolver.getCurrentSync();
        boolean flag = false;
        Date date = new Date();
        SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
        HashSet hashset = new HashSet();
        int i = 0;
        for (int j = asyncadaptertype.length; i < j; i++)
        {
            SyncAdapterType syncadaptertype = asyncadaptertype[i];
            if (syncadaptertype.isUserVisible())
                hashset.add(syncadaptertype.authority);
        }

        int k = 0;
        for (int l = getPreferenceScreen().getPreferenceCount(); k < l; k++)
        {
            Preference preference = getPreferenceScreen().getPreference(k);
            if (!(preference instanceof AccountPreference))
                continue;
            AccountPreference accountpreference = (AccountPreference)preference;
            Account account = accountpreference.getAccount();
            int i1 = 0;
            long l1 = 0L;
            boolean flag1 = false;
            ArrayList arraylist = accountpreference.getAuthorities();
            boolean flag2 = false;
            if (arraylist != null)
            {
                for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
                {
                    String s1 = (String)iterator.next();
                    SyncStatusInfo syncstatusinfo = ContentResolver.getSyncStatus(account, s1);
                    boolean flag4;
                    if (ContentResolver.getSyncAutomatically(account, s1) && ContentResolver.getMasterSyncAutomatically() && ContentResolver.getIsSyncable(account, s1) > 0)
                        flag4 = true;
                    else
                        flag4 = false;
                    boolean flag5 = ContentResolver.isSyncPending(account, s1);
                    boolean flag6;
                    if (syncinfo != null && syncinfo.authority.equals(s1) && (new Account(syncinfo.account.name, syncinfo.account.type)).equals(account))
                        flag6 = true;
                    else
                        flag6 = false;
                    boolean flag7;
                    if (syncstatusinfo != null && flag4 && syncstatusinfo.lastFailureTime != 0L && syncstatusinfo.getLastFailureMesgAsInt(0) != 1)
                        flag7 = true;
                    else
                        flag7 = false;
                    if (flag7 && !flag6 && !flag5)
                    {
                        flag1 = true;
                        flag = true;
                    }
                    flag2 |= flag6;
                    if (syncstatusinfo != null && l1 < syncstatusinfo.lastSuccessTime)
                        l1 = syncstatusinfo.lastSuccessTime;
                    int j1;
                    if (flag4 && hashset.contains(s1))
                        j1 = 1;
                    else
                        j1 = 0;
                    i1 += j1;
                }

            } else
            {
                boolean flag3 = Log.isLoggable("AccountSettings", 2);
                i1 = 0;
                flag1 = false;
                flag2 = false;
                if (flag3)
                    Log.v("AccountSettings", (new StringBuilder()).append("no syncadapters found for ").append(account).toString());
            }
            if (flag1)
            {
                accountpreference.setSyncStatus(2, true);
                continue;
            }
            if (i1 == 0)
            {
                accountpreference.setSyncStatus(1, true);
                continue;
            }
            if (i1 > 0)
            {
                if (flag2)
                {
                    accountpreference.setSyncStatus(3, true);
                    continue;
                }
                accountpreference.setSyncStatus(0, true);
                if (l1 > 0L)
                {
                    accountpreference.setSyncStatus(0, false);
                    date.setTime(l1);
                    String s = formatSyncDate(date);
                    accountpreference.setSummary(getResources().getString(0x7f0b0839, new Object[] {
                        s
                    }));
                }
            } else
            {
                accountpreference.setSyncStatus(1, true);
            }
        }

        TextView textview = mErrorInfoView;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        textview.setVisibility(byte0);
    }

    public volatile void updateAuthDescriptions()
    {
        super.updateAuthDescriptions();
    }
}
