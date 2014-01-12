// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.*;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.Log;
import java.util.*;

public class AuthenticatorHelper
{

    private static final String TAG = "AuthenticatorHelper";
    private Map mAccTypeIconCache;
    private AuthenticatorDescription mAuthDescs[];
    private ArrayList mEnabledAccountTypes;
    private Map mTypeToAuthDescription;

    public AuthenticatorHelper()
    {
        mTypeToAuthDescription = new HashMap();
        mEnabledAccountTypes = new ArrayList();
        mAccTypeIconCache = new HashMap();
    }

    public boolean containsAccountType(String s)
    {
        return mTypeToAuthDescription.containsKey(s);
    }

    public AuthenticatorDescription getAccountTypeDescription(String s)
    {
        return (AuthenticatorDescription)mTypeToAuthDescription.get(s);
    }

    public Drawable getDrawableForType(Context context, String s)
    {
        if (mAccTypeIconCache.containsKey(s))
            return (Drawable)mAccTypeIconCache.get(s);
        boolean flag = mTypeToAuthDescription.containsKey(s);
        Drawable drawable = null;
        if (flag)
            try
            {
                AuthenticatorDescription authenticatordescription = (AuthenticatorDescription)mTypeToAuthDescription.get(s);
                drawable = context.createPackageContext(authenticatordescription.packageName, 0).getResources().getDrawable(authenticatordescription.iconId);
                mAccTypeIconCache.put(s, drawable);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
            catch (android.content.res.Resources.NotFoundException notfoundexception) { }
        if (drawable == null)
            drawable = context.getPackageManager().getDefaultActivityIcon();
        return drawable;
    }

    public String[] getEnabledAccountTypes()
    {
        return (String[])mEnabledAccountTypes.toArray(new String[mEnabledAccountTypes.size()]);
    }

    public CharSequence getLabelForType(Context context, String s)
    {
        boolean flag = mTypeToAuthDescription.containsKey(s);
        CharSequence charsequence = null;
        if (flag)
        {
            CharSequence charsequence1;
            try
            {
                AuthenticatorDescription authenticatordescription = (AuthenticatorDescription)mTypeToAuthDescription.get(s);
                charsequence1 = context.createPackageContext(authenticatordescription.packageName, 0).getResources().getText(authenticatordescription.labelId);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.w("AuthenticatorHelper", (new StringBuilder()).append("No label name for account type ").append(s).toString());
                return null;
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                Log.w("AuthenticatorHelper", (new StringBuilder()).append("No label icon for account type ").append(s).toString());
                return null;
            }
            charsequence = charsequence1;
        }
        return charsequence;
    }

    public boolean hasAccountPreferences(String s)
    {
        if (containsAccountType(s))
        {
            AuthenticatorDescription authenticatordescription = getAccountTypeDescription(s);
            if (authenticatordescription != null && authenticatordescription.accountPreferencesId != 0)
                return true;
        }
        return false;
    }

    public void onAccountsUpdated(Context context, Account aaccount[])
    {
        if (aaccount == null)
            aaccount = AccountManager.get(context).getAccounts();
        mEnabledAccountTypes.clear();
        mAccTypeIconCache.clear();
        Account aaccount1[] = aaccount;
        int i = aaccount1.length;
        for (int j = 0; j < i; j++)
        {
            Account account = aaccount1[j];
            if (!mEnabledAccountTypes.contains(account.type))
                mEnabledAccountTypes.add(account.type);
        }

    }

    public void updateAuthDescriptions(Context context)
    {
        mAuthDescs = AccountManager.get(context).getAuthenticatorTypes();
        for (int i = 0; i < mAuthDescs.length; i++)
            mTypeToAuthDescription.put(mAuthDescs[i].type, mAuthDescs[i]);

    }
}
