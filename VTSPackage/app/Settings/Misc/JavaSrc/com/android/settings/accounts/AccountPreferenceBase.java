// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.Account;
import android.accounts.AuthenticatorDescription;
import android.accounts.OnAccountsUpdateListener;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.SyncAdapterType;
import android.content.SyncStatusObserver;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.android.settings.SettingsPreferenceFragment;
import com.google.android.collect.Maps;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

// Referenced classes of package com.android.settings.accounts:
//            AuthenticatorHelper

class AccountPreferenceBase extends SettingsPreferenceFragment
    implements OnAccountsUpdateListener
{

    public static final String ACCOUNT_TYPES_FILTER_KEY = "account_types";
    public static final String AUTHORITIES_FILTER_KEY = "authorities";
    protected static final String TAG = "AccountSettings";
    private HashMap mAccountTypeToAuthorities;
    private AuthenticatorHelper mAuthenticatorHelper;
    private DateFormat mDateFormat;
    private final Handler mHandler = new Handler();
    private Object mStatusChangeListenerHandle;
    private SyncStatusObserver mSyncStatusObserver;
    private DateFormat mTimeFormat;

    AccountPreferenceBase()
    {
        mAccountTypeToAuthorities = null;
        mAuthenticatorHelper = new AuthenticatorHelper();
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
    }

    public PreferenceScreen addPreferencesForType(String s, PreferenceScreen preferencescreen)
    {
        boolean flag = mAuthenticatorHelper.containsAccountType(s);
        PreferenceScreen preferencescreen1 = null;
        if (!flag)
            break MISSING_BLOCK_LABEL_88;
        AuthenticatorDescription authenticatordescription = null;
        int i;
        android.content.Context context;
        PreferenceScreen preferencescreen2;
        try
        {
            authenticatordescription = mAuthenticatorHelper.getAccountTypeDescription(s);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("AccountSettings", (new StringBuilder()).append("Couldn't load preferences.xml file from ").append(authenticatordescription.packageName).toString());
            return null;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Log.w("AccountSettings", (new StringBuilder()).append("Couldn't load preferences.xml file from ").append(authenticatordescription.packageName).toString());
            return null;
        }
        preferencescreen1 = null;
        if (authenticatordescription == null)
            break MISSING_BLOCK_LABEL_88;
        i = authenticatordescription.accountPreferencesId;
        preferencescreen1 = null;
        if (i == 0)
            break MISSING_BLOCK_LABEL_88;
        context = getActivity().createPackageContext(authenticatordescription.packageName, 0);
        preferencescreen2 = getPreferenceManager().inflateFromResource(context, authenticatordescription.accountPreferencesId, preferencescreen);
        preferencescreen1 = preferencescreen2;
        return preferencescreen1;
    }

    protected String formatSyncDate(Date date)
    {
        return (new StringBuilder()).append(mDateFormat.format(date)).append(" ").append(mTimeFormat.format(date)).toString();
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
                if (Log.isLoggable("AccountSettings", 2))
                    Log.d("AccountSettings", (new StringBuilder()).append("added authority ").append(syncadaptertype.authority).append(" to accountType ").append(syncadaptertype.accountType).toString());
                arraylist.add(syncadaptertype.authority);
            }

        }
        return (ArrayList)mAccountTypeToAuthorities.get(s);
    }

    protected Drawable getDrawableForType(String s)
    {
        return mAuthenticatorHelper.getDrawableForType(getActivity(), s);
    }

    protected CharSequence getLabelForType(String s)
    {
        return mAuthenticatorHelper.getLabelForType(getActivity(), s);
    }

    public void onAccountsUpdated(Account aaccount[])
    {
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mDateFormat = android.text.format.DateFormat.getDateFormat(activity);
        mTimeFormat = android.text.format.DateFormat.getTimeFormat(activity);
    }

    protected void onAuthDescriptionsUpdated()
    {
    }

    public void onPause()
    {
        super.onPause();
        ContentResolver.removeStatusChangeListener(mStatusChangeListenerHandle);
    }

    public void onResume()
    {
        super.onResume();
        mStatusChangeListenerHandle = ContentResolver.addStatusChangeListener(13, mSyncStatusObserver);
        onSyncStateUpdated();
    }

    protected void onSyncStateUpdated()
    {
    }

    public void updateAuthDescriptions()
    {
        mAuthenticatorHelper.updateAuthDescriptions(getActivity());
        onAuthDescriptionsUpdated();
    }

}
