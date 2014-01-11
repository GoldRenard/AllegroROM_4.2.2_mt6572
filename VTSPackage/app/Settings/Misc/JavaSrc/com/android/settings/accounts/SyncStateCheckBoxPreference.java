// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.Account;
import android.app.ActivityManager;
import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import com.android.settings.widget.AnimatedImageView;

public class SyncStateCheckBoxPreference extends CheckBoxPreference
{

    private Account mAccount;
    private String mAuthority;
    private boolean mFailed;
    private boolean mIsActive;
    private boolean mIsPending;
    private boolean mOneTimeSyncMode;

    public SyncStateCheckBoxPreference(Context context, Account account, String s)
    {
        super(context, null);
        mIsActive = false;
        mIsPending = false;
        mFailed = false;
        mOneTimeSyncMode = false;
        mAccount = account;
        mAuthority = s;
        setWidgetLayoutResource(0x7f04007a);
    }

    public SyncStateCheckBoxPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIsActive = false;
        mIsPending = false;
        mFailed = false;
        mOneTimeSyncMode = false;
        setWidgetLayoutResource(0x7f04007a);
        mAccount = null;
        mAuthority = null;
    }

    public Account getAccount()
    {
        return mAccount;
    }

    public String getAuthority()
    {
        return mAuthority;
    }

    public boolean isOneTimeSyncMode()
    {
        return mOneTimeSyncMode;
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
        AnimatedImageView animatedimageview = (AnimatedImageView)view.findViewById(0x7f08012f);
        View view1 = view.findViewById(0x7f08012e);
        boolean flag;
        if (!mIsActive && !mIsPending)
            flag = false;
        else
            flag = true;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        animatedimageview.setVisibility(byte0);
        animatedimageview.setAnimating(mIsActive);
        boolean flag1;
        if (mFailed && !flag)
            flag1 = true;
        else
            flag1 = false;
        byte byte1;
        if (flag1)
            byte1 = 0;
        else
            byte1 = 8;
        view1.setVisibility(byte1);
        View view2 = view.findViewById(0x1020001);
        if (mOneTimeSyncMode)
        {
            view2.setVisibility(8);
            TextView textview = (TextView)view.findViewById(0x1020010);
            Context context = getContext();
            Object aobj[] = new Object[1];
            aobj[0] = getSummary();
            textview.setText(context.getString(0x7f0b083f, aobj));
            return;
        } else
        {
            view2.setVisibility(0);
            return;
        }
    }

    protected void onClick()
    {
label0:
        {
            if (!mOneTimeSyncMode)
            {
                if (!ActivityManager.isUserAMonkey())
                    break label0;
                Log.d("SyncState", "ignoring monkey's attempt to flip sync state");
            }
            return;
        }
        super.onClick();
    }

    public void setActive(boolean flag)
    {
        mIsActive = flag;
        notifyChanged();
    }

    public void setFailed(boolean flag)
    {
        mFailed = flag;
        notifyChanged();
    }

    public void setOneTimeSyncMode(boolean flag)
    {
        mOneTimeSyncMode = flag;
        notifyChanged();
    }

    public void setPending(boolean flag)
    {
        mIsPending = flag;
        notifyChanged();
    }
}
