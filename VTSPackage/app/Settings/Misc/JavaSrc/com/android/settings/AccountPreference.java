// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.accounts.Account;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import java.util.ArrayList;

public class AccountPreference extends Preference
{

    public static final int SYNC_DISABLED = 1;
    public static final int SYNC_ENABLED = 0;
    public static final int SYNC_ERROR = 2;
    public static final int SYNC_IN_PROGRESS = 3;
    private static final String TAG = "AccountPreference";
    private Account mAccount;
    private ArrayList mAuthorities;
    private boolean mShowTypeIcon;
    private int mStatus;
    private ImageView mSyncStatusIcon;

    public AccountPreference(Context context, Account account, Drawable drawable, ArrayList arraylist, boolean flag)
    {
        super(context);
        mAccount = account;
        mAuthorities = arraylist;
        mShowTypeIcon = flag;
        if (flag)
            setIcon(drawable);
        else
            setIcon(getSyncStatusIcon(1));
        setTitle(mAccount.name);
        setSummary("");
        setPersistent(false);
        setSyncStatus(1, false);
    }

    private String getSyncContentDescription(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return getContext().getString(0x7f0b082b);

        case 1: // '\001'
            return getContext().getString(0x7f0b082a);

        case 0: // '\0'
            return getContext().getString(0x7f0b0829);
        }
        Log.e("AccountPreference", (new StringBuilder()).append("Unknown sync status: ").append(i).toString());
        return getContext().getString(0x7f0b082b);
    }

    private int getSyncStatusIcon(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return 0x7f020099;

        case 2: // '\002'
            return 0x7f02009d;

        case 1: // '\001'
            return 0x7f02009b;

        case 0: // '\0'
            return 0x7f020099;
        }
        Log.e("AccountPreference", (new StringBuilder()).append("Unknown sync status: ").append(i).toString());
        return 0x7f02009d;
    }

    private int getSyncStatusMessage(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return 0x7f0b083a;

        case 2: // '\002'
            return 0x7f0b0838;

        case 1: // '\001'
            return 0x7f0b0837;

        case 0: // '\0'
            return 0x7f0b0836;
        }
        Log.e("AccountPreference", (new StringBuilder()).append("Unknown sync status: ").append(i).toString());
        return 0x7f0b0838;
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
        if (!mShowTypeIcon)
        {
            mSyncStatusIcon = (ImageView)view.findViewById(0x1020006);
            mSyncStatusIcon.setImageResource(getSyncStatusIcon(mStatus));
            mSyncStatusIcon.setContentDescription(getSyncContentDescription(mStatus));
        }
    }

    public void setSyncStatus(int i, boolean flag)
    {
        mStatus = i;
        if (!mShowTypeIcon && mSyncStatusIcon != null)
        {
            mSyncStatusIcon.setImageResource(getSyncStatusIcon(i));
            mSyncStatusIcon.setContentDescription(getSyncContentDescription(mStatus));
        }
        if (flag)
            setSummary(getSyncStatusMessage(i));
    }
}
