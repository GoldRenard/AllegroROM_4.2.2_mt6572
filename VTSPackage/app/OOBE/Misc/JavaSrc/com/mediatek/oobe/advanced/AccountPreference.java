// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.accounts.Account;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.view.View;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

public class AccountPreference extends Preference
{

    public static final int SYNC_DISABLED = 1;
    public static final int SYNC_ENABLED = 0;
    public static final int SYNC_ERROR = 2;
    private static final String TAG = "AccountPreference";
    private Account mAccount;
    private ArrayList mAuthorities;
    private Drawable mProviderIcon;
    private ImageView mProviderIconView;
    private int mStatus;
    private ImageView mSyncStatusIcon;

    public AccountPreference(Context context, Account account, Drawable drawable, ArrayList arraylist)
    {
        super(context);
        mAccount = account;
        mAuthorities = arraylist;
        mProviderIcon = drawable;
        setLayoutResource(0x7f030000);
        setTitle(mAccount.type);
        setSummary(mAccount.name);
        Intent intent = new Intent("android.settings.ACCOUNT_SYNC_SETTINGS");
        intent.putExtra("account", mAccount);
        setIntent(intent);
        setPersistent(false);
        setSyncStatus(1);
    }

    private int getSyncStatusIcon(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return 0x7f02001b;

        case 1: // '\001'
            return 0x7f02001a;

        case 0: // '\0'
            return 0x7f020019;
        }
        Xlog.w("AccountPreference", (new StringBuilder()).append("Unknown sync status: ").append(i).toString());
        return 0x7f02001b;
    }

    public int compareTo(Preference preference)
    {
        if (!(preference instanceof AccountPreference))
            return 1;
        else
            return mAccount.name.compareTo(((AccountPreference)preference).mAccount.name);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    public Account getAccount()
    {
        return mAccount;
    }

    public ArrayList getAuthorities()
    {
        return mAuthorities;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mProviderIconView = (ImageView)view.findViewById(0x7f0b0000);
        mProviderIconView.setImageDrawable(mProviderIcon);
        mSyncStatusIcon = (ImageView)view.findViewById(0x7f0b0001);
        mSyncStatusIcon.setImageResource(getSyncStatusIcon(mStatus));
    }

    public void setProviderIcon(Drawable drawable)
    {
        mProviderIcon = drawable;
        if (mProviderIconView != null)
            mProviderIconView.setImageDrawable(drawable);
    }

    public void setSyncStatus(int i)
    {
        mStatus = i;
        if (mSyncStatusIcon != null)
            mSyncStatusIcon.setImageResource(getSyncStatusIcon(i));
    }
}
