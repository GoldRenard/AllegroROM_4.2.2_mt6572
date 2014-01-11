// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.*;
import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.settings.Utils;
import com.google.android.collect.Lists;
import com.google.android.collect.Maps;
import java.io.IOException;
import java.util.*;

// Referenced classes of package com.android.settings.accounts:
//            AccountPreferenceBase, SyncStateCheckBoxPreference

public class AccountSyncSettings extends AccountPreferenceBase
{

    public static final String ACCOUNT_KEY = "account";
    private static final int CANT_DO_ONETIME_SYNC_DIALOG = 102;
    private static final int FAILED_REMOVAL_DIALOG = 101;
    private static final int MENU_REMOVE_ACCOUNT_ID = 3;
    private static final int MENU_SYNC_CANCEL_ID = 2;
    private static final int MENU_SYNC_NOW_ID = 1;
    private static final int REALLY_REMOVE_DIALOG = 100;
    private Account mAccount;
    private Account mAccounts[];
    private ArrayList mCheckBoxes;
    private TextView mErrorInfoView;
    private ArrayList mInvisibleAdapters;
    private ImageView mProviderIcon;
    private TextView mProviderId;
    private TextView mUserId;

    public AccountSyncSettings()
    {
        mCheckBoxes = new ArrayList();
        mInvisibleAdapters = Lists.newArrayList();
    }

    private void addSyncStateCheckBox(Account account, String s)
    {
        SyncStateCheckBoxPreference syncstatecheckboxpreference = new SyncStateCheckBoxPreference(getActivity(), account, s);
        syncstatecheckboxpreference.setPersistent(false);
        ProviderInfo providerinfo = getPackageManager().resolveContentProvider(s, 0);
        if (providerinfo == null)
            return;
        CharSequence charsequence = providerinfo.loadLabel(getPackageManager());
        if (TextUtils.isEmpty(charsequence))
        {
            Log.e("AccountSettings", (new StringBuilder()).append("Provider needs a label for authority '").append(s).append("'").toString());
            return;
        } else
        {
            syncstatecheckboxpreference.setTitle(getString(0x7f0b084f, new Object[] {
                charsequence
            }));
            syncstatecheckboxpreference.setKey(s);
            mCheckBoxes.add(syncstatecheckboxpreference);
            return;
        }
    }

    private void cancelSyncForEnabledProviders()
    {
        requestOrCancelSyncForEnabledProviders(false);
        getActivity().invalidateOptionsMenu();
    }

    private boolean isSyncing(List list, Account account, String s)
    {
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
        {
            SyncInfo syncinfo = (SyncInfo)iterator.next();
            if (syncinfo.account.equals(account) && syncinfo.authority.equals(s))
                return true;
        }

        return false;
    }

    private void requestOrCancelSync(Account account, String s, boolean flag)
    {
        if (flag)
        {
            Bundle bundle = new Bundle();
            bundle.putBoolean("force", true);
            ContentResolver.requestSync(account, s, bundle);
            return;
        } else
        {
            ContentResolver.cancelSync(account, s);
            return;
        }
    }

    private void requestOrCancelSyncForEnabledProviders(boolean flag)
    {
        int i = getPreferenceScreen().getPreferenceCount();
        for (int j = 0; j < i; j++)
        {
            Preference preference = getPreferenceScreen().getPreference(j);
            if (!(preference instanceof SyncStateCheckBoxPreference))
                continue;
            SyncStateCheckBoxPreference syncstatecheckboxpreference = (SyncStateCheckBoxPreference)preference;
            if (syncstatecheckboxpreference.isChecked())
                requestOrCancelSync(syncstatecheckboxpreference.getAccount(), syncstatecheckboxpreference.getAuthority(), flag);
        }

        if (mAccount != null)
        {
            Iterator iterator = mInvisibleAdapters.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                SyncAdapterType syncadaptertype = (SyncAdapterType)iterator.next();
                if (syncadaptertype.accountType.equals(mAccount.type))
                    requestOrCancelSync(mAccount, syncadaptertype.authority, flag);
            } while (true);
        }
    }

    private void setFeedsState()
    {
        Date date = new Date();
        List list = ContentResolver.getCurrentSyncs();
        boolean flag = false;
        updateAccountCheckboxes(mAccounts);
        int i = 0;
        for (int j = getPreferenceScreen().getPreferenceCount(); i < j; i++)
        {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (!(preference instanceof SyncStateCheckBoxPreference))
                continue;
            SyncStateCheckBoxPreference syncstatecheckboxpreference = (SyncStateCheckBoxPreference)preference;
            String s = syncstatecheckboxpreference.getAuthority();
            Account account = syncstatecheckboxpreference.getAccount();
            SyncStatusInfo syncstatusinfo = ContentResolver.getSyncStatus(account, s);
            boolean flag1 = ContentResolver.getSyncAutomatically(account, s);
            boolean flag2;
            if (syncstatusinfo == null)
                flag2 = false;
            else
                flag2 = syncstatusinfo.pending;
            boolean flag3;
            if (syncstatusinfo == null)
                flag3 = false;
            else
                flag3 = syncstatusinfo.initialize;
            boolean flag4 = isSyncing(list, account, s);
            boolean flag5;
            if (syncstatusinfo != null && syncstatusinfo.lastFailureTime != 0L && syncstatusinfo.getLastFailureMesgAsInt(0) != 1)
                flag5 = true;
            else
                flag5 = false;
            if (!flag1)
                flag5 = false;
            if (flag5 && !flag4 && !flag2)
                flag = true;
            if (Log.isLoggable("AccountSettings", 2))
                Log.d("AccountSettings", (new StringBuilder()).append("Update sync status: ").append(account).append(" ").append(s).append(" active = ").append(flag4).append(" pend =").append(flag2).toString());
            long l;
            if (syncstatusinfo == null)
                l = 0L;
            else
                l = syncstatusinfo.lastSuccessTime;
            if (!flag1)
                syncstatecheckboxpreference.setSummary(0x7f0b0837);
            else
            if (flag4)
                syncstatecheckboxpreference.setSummary(0x7f0b083a);
            else
            if (l != 0L)
            {
                date.setTime(l);
                String s1 = formatSyncDate(date);
                syncstatecheckboxpreference.setSummary(getResources().getString(0x7f0b0839, new Object[] {
                    s1
                }));
            } else
            {
                syncstatecheckboxpreference.setSummary("");
            }
            int k = ContentResolver.getIsSyncable(account, s);
            boolean flag6;
            if (flag4 && k >= 0 && !flag3)
                flag6 = true;
            else
                flag6 = false;
            syncstatecheckboxpreference.setActive(flag6);
            boolean flag7;
            if (flag2 && k >= 0 && !flag3)
                flag7 = true;
            else
                flag7 = false;
            syncstatecheckboxpreference.setPending(flag7);
            syncstatecheckboxpreference.setFailed(flag5);
            ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
            boolean flag8 = ContentResolver.getMasterSyncAutomatically();
            boolean flag9 = connectivitymanager.getBackgroundDataSetting();
            boolean flag10;
            if (flag8 && flag9)
                flag10 = false;
            else
                flag10 = true;
            syncstatecheckboxpreference.setOneTimeSyncMode(flag10);
            boolean flag11;
            if (!flag10 && !flag1)
                flag11 = false;
            else
                flag11 = true;
            syncstatecheckboxpreference.setChecked(flag11);
        }

        TextView textview = mErrorInfoView;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        textview.setVisibility(byte0);
        getActivity().invalidateOptionsMenu();
    }

    private void startSyncForEnabledProviders()
    {
        requestOrCancelSyncForEnabledProviders(true);
        getActivity().invalidateOptionsMenu();
    }

    private void updateAccountCheckboxes(Account aaccount[])
    {
        mInvisibleAdapters.clear();
        SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
        HashMap hashmap = Maps.newHashMap();
        int i = 0;
        for (int j = asyncadaptertype.length; i < j; i++)
        {
            SyncAdapterType syncadaptertype = asyncadaptertype[i];
            if (syncadaptertype.isUserVisible())
            {
                ArrayList arraylist1 = (ArrayList)hashmap.get(syncadaptertype.accountType);
                if (arraylist1 == null)
                {
                    arraylist1 = new ArrayList();
                    hashmap.put(syncadaptertype.accountType, arraylist1);
                }
                if (Log.isLoggable("AccountSettings", 2))
                    Log.d("AccountSettings", (new StringBuilder()).append("onAccountUpdated: added authority ").append(syncadaptertype.authority).append(" to accountType ").append(syncadaptertype.accountType).toString());
                arraylist1.add(syncadaptertype.authority);
            } else
            {
                mInvisibleAdapters.add(syncadaptertype);
            }
        }

        int k = 0;
        for (int l = mCheckBoxes.size(); k < l; k++)
            getPreferenceScreen().removePreference((Preference)mCheckBoxes.get(k));

        mCheckBoxes.clear();
        int i1 = 0;
        for (int j1 = aaccount.length; i1 < j1; i1++)
        {
            Account account = aaccount[i1];
            if (Log.isLoggable("AccountSettings", 2))
                Log.d("AccountSettings", (new StringBuilder()).append("looking for sync adapters that match account ").append(account).toString());
            ArrayList arraylist = (ArrayList)hashmap.get(account.type);
            if (arraylist == null || mAccount != null && !mAccount.equals(account))
                continue;
            int i2 = 0;
            for (int j2 = arraylist.size(); i2 < j2; i2++)
            {
                String s = (String)arraylist.get(i2);
                int k2 = ContentResolver.getIsSyncable(account, s);
                if (Log.isLoggable("AccountSettings", 2))
                    Log.d("AccountSettings", (new StringBuilder()).append("  found authority ").append(s).append(" ").append(k2).toString());
                if (k2 > 0)
                    addSyncStateCheckBox(account, s);
            }

        }

        Collections.sort(mCheckBoxes);
        int k1 = 0;
        for (int l1 = mCheckBoxes.size(); k1 < l1; k1++)
            getPreferenceScreen().addPreference((Preference)mCheckBoxes.get(k1));

    }

    public volatile PreferenceScreen addPreferencesForType(String s, PreferenceScreen preferencescreen)
    {
        return super.addPreferencesForType(s, preferencescreen);
    }

    public volatile ArrayList getAuthoritiesForAccountType(String s)
    {
        return super.getAuthoritiesForAccountType(s);
    }

    protected void initializeUi(View view)
    {
        addPreferencesFromResource(0x7f050001);
        mErrorInfoView = (TextView)view.findViewById(0x7f080003);
        mErrorInfoView.setVisibility(8);
        mUserId = (TextView)view.findViewById(0x7f080180);
        mProviderId = (TextView)view.findViewById(0x7f080181);
        mProviderIcon = (ImageView)view.findViewById(0x7f08017f);
    }

    public void onAccountsUpdated(Account aaccount[])
    {
        super.onAccountsUpdated(aaccount);
        mAccounts = aaccount;
        updateAccountCheckboxes(aaccount);
        onSyncStateUpdated();
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Bundle bundle1 = getArguments();
        if (bundle1 == null)
        {
            Log.e("AccountSettings", "No arguments provided when starting intent. ACCOUNT_KEY needed.");
        } else
        {
            mAccount = (Account)bundle1.getParcelable("account");
            if (mAccount != null)
            {
                if (Log.isLoggable("AccountSettings", 2))
                    Log.v("AccountSettings", (new StringBuilder()).append("Got account: ").append(mAccount).toString());
                mUserId.setText(mAccount.name);
                mProviderId.setText(mAccount.type);
                return;
            }
        }
    }

    protected void onAuthDescriptionsUpdated()
    {
        super.onAuthDescriptionsUpdated();
        getPreferenceScreen().removeAll();
        if (mAccount != null)
        {
            mProviderIcon.setImageDrawable(getDrawableForType(mAccount.type));
            mProviderId.setText(getLabelForType(mAccount.type));
        }
        addPreferencesFromResource(0x7f050001);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog alertdialog;
        if (i == 100)
        {
            alertdialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b084b).setMessage(0x7f0b084c).setNegativeButton(0x1040000, null).setPositiveButton(0x7f0b0848, new android.content.DialogInterface.OnClickListener() {

                final AccountSyncSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    AccountManager.get(getActivity()).removeAccount(mAccount, new AccountManagerCallback() {

                        final _cls1 this$1;

                        public void run(AccountManagerFuture accountmanagerfuture)
                        {
                            boolean flag;
                            if (!isResumed())
                                return;
                            flag = true;
                            boolean flag1 = ((Boolean)accountmanagerfuture.getResult()).booleanValue();
                            if (flag1)
                                flag = false;
_L2:
                            if (flag)
                            {
                                showDialog(101);
                                return;
                            } else
                            {
                                finish();
                                return;
                            }
                            AuthenticatorException authenticatorexception;
                            authenticatorexception;
                            continue; /* Loop/switch isn't completed */
                            IOException ioexception;
                            ioexception;
                            continue; /* Loop/switch isn't completed */
                            OperationCanceledException operationcanceledexception;
                            operationcanceledexception;
                            if (true) goto _L2; else goto _L1
_L1:
                        }

            
            {
                this$1 = _cls1.this;
                super();
            }
                    }
, null);
                }

            
            {
                this$0 = AccountSyncSettings.this;
                super();
            }
            }
).create();
        } else
        {
            if (i == 101)
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b084b).setPositiveButton(0x104000a, null).setMessage(0x7f0b084d).create();
            alertdialog = null;
            if (i == 102)
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0850).setMessage(0x7f0b0851).setPositiveButton(0x104000a, null).create();
        }
        return alertdialog;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        MenuItem menuitem = menu.add(0, 1, 0, getString(0x7f0b083d)).setIcon(0x7f02006d);
        MenuItem menuitem1 = menu.add(0, 2, 0, getString(0x7f0b083e)).setIcon(0x1080038);
        menu.add(0, 3, 0, getString(0x7f0b0848)).setIcon(0x7f02006b).setShowAsAction(4);
        menuitem.setShowAsAction(4);
        menuitem1.setShowAsAction(4);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f040002, viewgroup, false);
        Utils.prepareCustomPreferencesList(viewgroup, view, (ListView)view.findViewById(0x102000a), false);
        initializeUi(view);
        return view;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 3: // '\003'
            showDialog(100);
            return true;

        case 2: // '\002'
            cancelSyncForEnabledProviders();
            return true;

        case 1: // '\001'
            startSyncForEnabledProviders();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        AccountManager.get(getActivity()).removeOnAccountsUpdatedListener(this);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof SyncStateCheckBoxPreference)
        {
            SyncStateCheckBoxPreference syncstatecheckboxpreference = (SyncStateCheckBoxPreference)preference;
            String s = syncstatecheckboxpreference.getAuthority();
            Account account = syncstatecheckboxpreference.getAccount();
            boolean flag = ContentResolver.getSyncAutomatically(account, s);
            if (syncstatecheckboxpreference.isOneTimeSyncMode())
            {
                requestOrCancelSync(account, s, true);
            } else
            {
                boolean flag1 = syncstatecheckboxpreference.isChecked();
                if (flag1 != flag)
                {
                    ContentResolver.setSyncAutomatically(account, s, flag1);
                    if (!ContentResolver.getMasterSyncAutomatically() || !flag1)
                    {
                        requestOrCancelSync(account, s, flag1);
                        return true;
                    }
                }
            }
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
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
        if (flag1)
            flag = false;
        menuitem.setVisible(flag);
        menu.findItem(2).setVisible(flag1);
    }

    public void onResume()
    {
        Activity activity = getActivity();
        AccountManager.get(activity).addOnAccountsUpdatedListener(this, null, false);
        updateAuthDescriptions();
        onAccountsUpdated(AccountManager.get(activity).getAccounts());
        super.onResume();
    }

    protected void onSyncStateUpdated()
    {
        if (!isResumed())
        {
            return;
        } else
        {
            setFeedsState();
            return;
        }
    }

    public volatile void updateAuthDescriptions()
    {
        super.updateAuthDescriptions();
    }


}
