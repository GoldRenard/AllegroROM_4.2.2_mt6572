// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.content.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import com.android.internal.util.CharSequences;
import com.google.android.collect.Maps;
import java.util.*;

// Referenced classes of package com.android.settings.accounts:
//            ProviderPreference

public class ChooseAccountActivity extends PreferenceActivity
{
    private static class ProviderEntry
        implements Comparable
    {

        private final CharSequence name;
        private final String type;

        public int compareTo(ProviderEntry providerentry)
        {
            if (name == null)
                return -1;
            if (providerentry.name == null)
                return 1;
            else
                return CharSequences.compareToIgnoreCase(name, providerentry.name);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((ProviderEntry)obj);
        }



        ProviderEntry(CharSequence charsequence, String s)
        {
            name = charsequence;
            type = s;
        }
    }


    private static final String TAG = "ChooseAccountActivity";
    private HashMap mAccountTypeToAuthorities;
    public HashSet mAccountTypesFilter;
    private PreferenceGroup mAddAccountGroup;
    private AuthenticatorDescription mAuthDescs[];
    private String mAuthorities[];
    private final ArrayList mProviderList = new ArrayList();
    private Map mTypeToAuthDescription;

    public ChooseAccountActivity()
    {
        mAccountTypeToAuthorities = null;
        mTypeToAuthDescription = new HashMap();
    }

    private void finishWithAccountType(String s)
    {
        Intent intent = new Intent();
        intent.putExtra("selected_account", s);
        setResult(-1, intent);
        finish();
    }

    private void onAuthDescriptionsUpdated()
    {
        int i = 0;
_L10:
        if (i >= mAuthDescs.length) goto _L2; else goto _L1
_L1:
        String s;
        CharSequence charsequence;
        ArrayList arraylist;
        boolean flag;
        s = mAuthDescs[i].type;
        charsequence = getLabelForType(s);
        arraylist = getAuthoritiesForAccountType(s);
        flag = true;
        if (mAuthorities == null || mAuthorities.length <= 0 || arraylist == null) goto _L4; else goto _L3
_L3:
        int l = 0;
_L8:
        int i1;
        i1 = mAuthorities.length;
        flag = false;
        if (l >= i1) goto _L4; else goto _L5
_L5:
        if (!arraylist.contains(mAuthorities[l])) goto _L7; else goto _L6
_L6:
        flag = true;
_L4:
        if (flag && mAccountTypesFilter != null && !mAccountTypesFilter.contains(s))
            flag = false;
        if (flag)
        {
            ArrayList arraylist1 = mProviderList;
            ProviderEntry providerentry1 = new ProviderEntry(charsequence, s);
            arraylist1.add(providerentry1);
        } else
        if (Log.isLoggable("ChooseAccountActivity", 2))
            Log.v("ChooseAccountActivity", (new StringBuilder()).append("Skipped pref ").append(charsequence).append(": has no authority we need").toString());
        i++;
        continue; /* Loop/switch isn't completed */
_L7:
        l++;
        if (true) goto _L8; else goto _L2
_L2:
label0:
        {
            if (mProviderList.size() == 1)
            {
                finishWithAccountType(((ProviderEntry)mProviderList.get(0)).type);
            } else
            {
                if (mProviderList.size() <= 0)
                    break label0;
                Collections.sort(mProviderList);
                mAddAccountGroup.removeAll();
                ProviderPreference providerpreference;
                for (Iterator iterator = mProviderList.iterator(); iterator.hasNext(); mAddAccountGroup.addPreference(providerpreference))
                {
                    ProviderEntry providerentry = (ProviderEntry)iterator.next();
                    Drawable drawable = getDrawableForType(providerentry.type);
                    providerpreference = new ProviderPreference(this, providerentry.type, drawable, providerentry.name);
                }

            }
            return;
        }
        if (Log.isLoggable("ChooseAccountActivity", 2))
        {
            StringBuilder stringbuilder = new StringBuilder();
            String as[] = mAuthorities;
            int j = as.length;
            for (int k = 0; k < j; k++)
            {
                stringbuilder.append(as[k]);
                stringbuilder.append(' ');
            }

            Log.v("ChooseAccountActivity", (new StringBuilder()).append("No providers found for authorities: ").append(stringbuilder).toString());
        }
        setResult(0);
        finish();
        return;
        if (true) goto _L10; else goto _L9
_L9:
    }

    private void updateAuthDescriptions()
    {
        mAuthDescs = AccountManager.get(this).getAuthenticatorTypes();
        for (int i = 0; i < mAuthDescs.length; i++)
            mTypeToAuthDescription.put(mAuthDescs[i].type, mAuthDescs[i]);

        onAuthDescriptionsUpdated();
    }

    public ArrayList getAuthoritiesForAccountType(String s)
    {
        if (mAccountTypeToAuthorities == null)
        {
            mAccountTypeToAuthorities = Maps.newHashMap();
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
                if (Log.isLoggable("ChooseAccountActivity", 2))
                    Log.d("ChooseAccountActivity", (new StringBuilder()).append("added authority ").append(syncadaptertype.authority).append(" to accountType ").append(syncadaptertype.accountType).toString());
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
                Log.w("ChooseAccountActivity", (new StringBuilder()).append("No icon name for account type ").append(s).toString());
                return null;
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                Log.w("ChooseAccountActivity", (new StringBuilder()).append("No icon resource for account type ").append(s).toString());
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
                Log.w("ChooseAccountActivity", (new StringBuilder()).append("No label name for account type ").append(s).toString());
                return null;
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                Log.w("ChooseAccountActivity", (new StringBuilder()).append("No label resource for account type ").append(s).toString());
                return null;
            }
            charsequence = charsequence1;
        }
        return charsequence;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040003);
        addPreferencesFromResource(0x7f050002);
        mAuthorities = getIntent().getStringArrayExtra("authorities");
        String as[] = getIntent().getStringArrayExtra("account_types");
        if (as != null)
        {
            mAccountTypesFilter = new HashSet();
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s = as[j];
                mAccountTypesFilter.add(s);
            }

        }
        mAddAccountGroup = getPreferenceScreen();
        updateAuthDescriptions();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof ProviderPreference)
        {
            ProviderPreference providerpreference = (ProviderPreference)preference;
            if (Log.isLoggable("ChooseAccountActivity", 2))
                Log.v("ChooseAccountActivity", (new StringBuilder()).append("Attempting to add account of type ").append(providerpreference.getAccountType()).toString());
            finishWithAccountType(providerpreference.getAccountType());
        }
        return true;
    }
}
