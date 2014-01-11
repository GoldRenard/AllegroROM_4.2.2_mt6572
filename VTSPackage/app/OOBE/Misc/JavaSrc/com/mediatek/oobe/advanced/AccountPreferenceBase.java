// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.accounts.*;
import android.content.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.os.Handler;
import android.preference.*;
import android.util.Log;
import android.widget.Toast;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.util.*;

// Referenced classes of package com.mediatek.oobe.advanced:
//            AccountPreference, ProviderPreference

class AccountPreferenceBase extends OOBEStepPreferenceActivity
    implements OnAccountsUpdateListener
{

    public static final String AUTHORITIES_FILTER_KEY = "authorities";
    protected static final String TAG = "AccountPreferenceBase";
    protected PreferenceCategory mAccountListCategory;
    private HashMap mAccountTypeToAuthorities;
    private Account mAccounts[];
    protected AuthenticatorDescription mAuthDescs[];
    protected String mAuthorities[];
    private AccountManagerCallback mCallback;
    protected Context mContext;
    private final Handler mHandler = new Handler();
    private Object mStatusChangeListenerHandle;
    protected String mSupportedType[];
    private SyncStatusObserver mSyncStatusObserver;
    private Map mTypeToAuthDescription;
    private ArrayList mUnSNSType;
    protected String mUnSupportedType[];

    AccountPreferenceBase()
    {
        mTypeToAuthDescription = new HashMap();
        mAccountTypeToAuthorities = null;
        mUnSNSType = new ArrayList();
        mSyncStatusObserver = new SyncStatusObserver() {

            final AccountPreferenceBase this$0;

            public void onStatusChanged(int i)
            {
                mHandler.post(new Runnable() {

                    final _cls1 this$1;

                    public void run()
                    {
                        onSyncStateUpdated();
                    }

            
            {
                this$1 = _cls1.this;
                super();
            }
                }
);
            }

            
            {
                this$0 = AccountPreferenceBase.this;
                super();
            }
        }
;
        mCallback = new AccountManagerCallback() {

            final AccountPreferenceBase this$0;

            public void run(AccountManagerFuture accountmanagerfuture)
            {
                Bundle bundle;
                Intent intent;
                String s;
                try
                {
                    bundle = (Bundle)accountmanagerfuture.getResult();
                    intent = (Intent)bundle.getParcelable("intent");
                }
                catch (OperationCanceledException operationcanceledexception)
                {
                    Xlog.e("AccountPreferenceBase", "addAccount was canceled");
                    return;
                }
                catch (IOException ioexception)
                {
                    Xlog.e("AccountPreferenceBase", (new StringBuilder()).append("addAccount failed: ").append(ioexception).toString());
                    return;
                }
                catch (AuthenticatorException authenticatorexception)
                {
                    Xlog.e("AccountPreferenceBase", (new StringBuilder()).append("addAccount failed: ").append(authenticatorexception).toString());
                    return;
                }
                if (intent == null) goto _L2; else goto _L1
_L1:
                mContext.startActivity(intent);
_L4:
                Xlog.v("AccountPreferenceBase", (new StringBuilder()).append("account added: ").append(bundle).toString());
                return;
_L2:
                s = bundle.getString("errorMessage");
                if (s == null) goto _L4; else goto _L3
_L3:
                Toast.makeText(mContext, s, 0).show();
                  goto _L4
            }

            
            {
                this$0 = AccountPreferenceBase.this;
                super();
            }
        }
;
    }

    private void addAccountPreference()
    {
        int i;
        int j;
        Xlog.v("AccountPreferenceBase", "addAccountPreference()");
        if (mAccounts == null)
        {
            Xlog.w("AccountPreferenceBase", "No account till now, return");
            return;
        }
        Xlog.w("AccountPreferenceBase", (new StringBuilder()).append("mAccounts=").append(mAccounts.length).toString());
        if (mAccountListCategory == null)
        {
            mAccountListCategory = new PreferenceCategory(this);
            mAccountListCategory.setKey("account_list_category");
            mAccountListCategory.setTitle(0x7f09007a);
        }
        if (mAccounts.length == 0)
        {
            PreferenceScreen preferencescreen1 = getPreferenceScreen();
            if (preferencescreen1 != null)
                preferencescreen1.removePreference(mAccountListCategory);
        } else
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            if (preferencescreen != null)
                preferencescreen.addPreference(mAccountListCategory);
        }
        mAccountListCategory.removeAll();
        i = 0;
        j = mAccounts.length;
_L10:
        if (i >= j) goto _L2; else goto _L1
_L1:
        Account account;
        ArrayList arraylist;
        boolean flag;
        account = mAccounts[i];
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
        if (flag && !shouldShowType(account.type))
            flag = false;
        if (flag)
        {
            AccountPreference accountpreference = new AccountPreference(this, account, getDrawableForType(account.type), arraylist);
            mAccountListCategory.addPreference(accountpreference);
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

    private void addProvider()
    {
        int i;
        Xlog.v("AccountPreferenceBase", (new StringBuilder()).append(getStepSpecialTag()).append(" --> addProvider()").toString());
        i = 0;
_L18:
        if (i >= mAuthDescs.length) goto _L2; else goto _L1
_L1:
        String s;
        boolean flag;
        s = mAuthDescs[i].type;
        flag = true;
        if (mUnSNSType.contains(s) || mAccounts == null) goto _L4; else goto _L3
_L3:
        int l;
        int i1;
        l = 0;
        i1 = mAccounts.length;
_L16:
        if (l >= i1) goto _L4; else goto _L5
_L5:
        Account account = mAccounts[l];
        if (account == null || !account.type.equals(s)) goto _L7; else goto _L6
_L6:
        Xlog.v("AccountPreferenceBase", (new StringBuilder()).append("Provider type[").append(s).append("] already have an account added, just hide this provider").toString());
        flag = false;
_L4:
        if (!flag) goto _L9; else goto _L8
_L8:
        CharSequence charsequence;
        ArrayList arraylist;
        charsequence = getLabelForType(s);
        arraylist = getAuthoritiesForAccountType(s);
        Xlog.v("AccountPreferenceBase", (new StringBuilder()).append(getStepSpecialTag()).append(" ###  type=").append(s).toString());
        if (mAuthorities == null || mAuthorities.length <= 0 || arraylist == null) goto _L11; else goto _L10
_L10:
        int j = 0;
_L15:
        int k;
        k = mAuthorities.length;
        flag = false;
        if (j >= k) goto _L11; else goto _L12
_L12:
        if (!arraylist.contains(mAuthorities[j])) goto _L14; else goto _L13
_L13:
        flag = true;
_L11:
        if (flag && !shouldShowType(s))
            flag = false;
        if (flag)
        {
            ProviderPreference providerpreference = new ProviderPreference(this, s, getDrawableForType(s), charsequence);
            getPreferenceScreen().addPreference(providerpreference);
        }
_L9:
        i++;
        continue; /* Loop/switch isn't completed */
_L14:
        j++;
        if (true) goto _L15; else goto _L7
_L7:
        l++;
        if (true) goto _L16; else goto _L2
_L2:
        return;
        if (true) goto _L18; else goto _L17
_L17:
    }

    private boolean shouldShowType(String s)
    {
        boolean flag;
        if (s != null && !s.equals(""))
        {
            flag = true;
            if (mSupportedType != null)
            {
                String as1[] = mSupportedType;
                int k = as1.length;
                int l = 0;
                do
                {
                    flag = false;
                    if (l >= k)
                        break;
                    if (s.equals(as1[l]))
                        return true;
                    l++;
                } while (true);
            } else
            if (mUnSupportedType != null)
            {
                String as[] = mUnSupportedType;
                int i = as.length;
                for (int j = 0; j < i; j++)
                    if (s.equals(as[j]))
                        return false;

            }
        } else
        {
            flag = false;
        }
        return flag;
    }

    private void updatePage()
    {
        Xlog.v("AccountPreferenceBase", "updatePage()");
        mAccountListCategory = null;
        getPreferenceScreen().removeAll();
        addProvider();
        addAccountPreference();
    }

    protected void addAccount(String s)
    {
        if (mContext != null)
        {
            AccountManager.get(mContext).addAccount(s, null, null, null, null, mCallback, null);
            return;
        } else
        {
            Xlog.w("AccountPreferenceBase", "Click provider, try to add an account, but context is null");
            return;
        }
    }

    public ArrayList getAuthoritiesForAccountType(String s)
    {
        if (mAccountTypeToAuthorities == null)
        {
            mAccountTypeToAuthorities = new HashMap();
            SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
            int i = 0;
            for (int j = asyncadaptertype.length; i < j; i++)
            {
                SyncAdapterType syncadaptertype = asyncadaptertype[i];
                ArrayList arraylist = (ArrayList)mAccountTypeToAuthorities.get(syncadaptertype.accountType);
                if (arraylist == null)
                {
                    arraylist = new ArrayList();
                    mAccountTypeToAuthorities.put(syncadaptertype.accountType, arraylist);
                }
                Xlog.d("AccountPreferenceBase", (new StringBuilder()).append("added authority ").append(syncadaptertype.authority).append(" to accountType ").append(syncadaptertype.accountType).toString());
                arraylist.add(syncadaptertype.authority);
            }

        }
        return (ArrayList)mAccountTypeToAuthorities.get(s);
    }

    protected Drawable getDrawableForType(String s)
    {
        boolean flag = mTypeToAuthDescription.containsKey(s);
        Drawable drawable = null;
        if (flag)
        {
            Drawable drawable1;
            try
            {
                AuthenticatorDescription authenticatordescription = (AuthenticatorDescription)mTypeToAuthDescription.get(s);
                drawable1 = createPackageContext(authenticatordescription.packageName, 0).getResources().getDrawable(authenticatordescription.iconId);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Xlog.w("AccountPreferenceBase", (new StringBuilder()).append("No icon for account type ").append(s).toString());
                return null;
            }
            drawable = drawable1;
        }
        return drawable;
    }

    protected CharSequence getLabelForType(String s)
    {
        boolean flag = mTypeToAuthDescription.containsKey(s);
        CharSequence charsequence = null;
        if (flag)
        {
            CharSequence charsequence1;
            try
            {
                AuthenticatorDescription authenticatordescription = (AuthenticatorDescription)mTypeToAuthDescription.get(s);
                charsequence1 = createPackageContext(authenticatordescription.packageName, 0).getResources().getText(authenticatordescription.labelId);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Xlog.w("AccountPreferenceBase", (new StringBuilder()).append("No label for account type , type ").append(s).toString());
                return null;
            }
            charsequence = charsequence1;
        }
        return charsequence;
    }

    public void onAccountsUpdated(Account aaccount[])
    {
        Xlog.v("AccountPreferenceBase", "onAccountsUpdated()");
        mAccounts = aaccount;
        if (aaccount == null)
        {
            Xlog.w("AccountPreferenceBase", "No account to show");
            return;
        } else
        {
            updatePage();
            return;
        }
    }

    protected void onAuthDescriptionsUpdated()
    {
        updatePage();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mUnSNSType.add("com.android.exchange");
    }

    protected void onPause()
    {
        super.onPause();
        ContentResolver.removeStatusChangeListener(mStatusChangeListenerHandle);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        Xlog.d("AccountPreferenceBase", "$$$ preference is clicked");
        if (preference instanceof ProviderPreference)
        {
            ProviderPreference providerpreference = (ProviderPreference)preference;
            Xlog.v("AccountPreferenceBase", (new StringBuilder()).append("Attempting to add account of type ").append(providerpreference.getAccountType()).toString());
            addAccount(providerpreference.getAccountType());
        }
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        mStatusChangeListenerHandle = ContentResolver.addStatusChangeListener(5, mSyncStatusObserver);
        onSyncStateUpdated();
    }

    protected void onSyncStateUpdated()
    {
        Xlog.v("AccountPreferenceBase", "onSyncStateUpdated()");
        boolean flag = ((ConnectivityManager)getSystemService("connectivity")).getBackgroundDataSetting();
        boolean flag1 = ContentResolver.getMasterSyncAutomatically();
        SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
        HashSet hashset = new HashSet();
        int i = 0;
        for (int j = asyncadaptertype.length; i < j; i++)
        {
            SyncAdapterType syncadaptertype = asyncadaptertype[i];
            if (syncadaptertype.isUserVisible())
                hashset.add(syncadaptertype.authority);
        }

        if (mAccountListCategory == null)
        {
            Xlog.w("AccountPreferenceBase", "No account till now, no need to update, return");
        } else
        {
            int k = 0;
            for (int l = mAccountListCategory.getPreferenceCount(); k < l; k++)
            {
                Preference preference = mAccountListCategory.getPreference(k);
                if (!(preference instanceof AccountPreference))
                    continue;
                AccountPreference accountpreference = (AccountPreference)preference;
                Account account = accountpreference.getAccount();
                int i1 = 0;
                ArrayList arraylist = accountpreference.getAuthorities();
                if (arraylist != null)
                {
                    for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
                    {
                        String s = (String)iterator.next();
                        boolean flag3;
                        if (ContentResolver.getSyncAutomatically(account, s) && flag1 && flag && ContentResolver.getIsSyncable(account, s) > 0)
                            flag3 = true;
                        else
                            flag3 = false;
                        int j1;
                        if (flag3 && hashset.contains(s))
                            j1 = 1;
                        else
                            j1 = 0;
                        i1 += j1;
                    }

                } else
                {
                    boolean flag2 = Log.isLoggable("AccountPreferenceBase", 2);
                    i1 = 0;
                    if (flag2)
                        Xlog.v("AccountPreferenceBase", (new StringBuilder()).append("no syncadapters found for ").append(account).toString());
                }
                byte byte0 = 1;
                if (false)
                    byte0 = 2;
                else
                if (i1 == 0)
                    byte0 = 1;
                else
                if (i1 > 0)
                    byte0 = 0;
                accountpreference.setSyncStatus(byte0);
            }

        }
    }

    protected void updateAuthDescriptions()
    {
        mAuthDescs = AccountManager.get(this).getAuthenticatorTypes();
        for (int i = 0; i < mAuthDescs.length; i++)
            mTypeToAuthDescription.put(mAuthDescs[i].type, mAuthDescs[i]);

        onAuthDescriptionsUpdated();
    }

}
