// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import com.android.internal.widget.LockPatternUtils;

public final class ChooseLockSettingsHelper
{

    static final String EXTRA_KEY_PASSWORD = "password";
    private Activity mActivity;
    private Fragment mFragment;
    private LockPatternUtils mLockPatternUtils;

    public ChooseLockSettingsHelper(Activity activity)
    {
        mActivity = activity;
        mLockPatternUtils = new LockPatternUtils(activity);
    }

    public ChooseLockSettingsHelper(Activity activity, Fragment fragment)
    {
        this(activity);
        mFragment = fragment;
    }

    private boolean confirmPassword(int i)
    {
        if (!mLockPatternUtils.isLockPasswordEnabled())
            return false;
        Intent intent = new Intent();
        intent.setClassName("com.android.settings", "com.android.settings.ConfirmLockPassword");
        if (mFragment != null)
            mFragment.startActivityForResult(intent, i);
        else
            mActivity.startActivityForResult(intent, i);
        return true;
    }

    private boolean confirmPattern(int i, CharSequence charsequence, CharSequence charsequence1)
    {
        if (mLockPatternUtils.isLockPatternEnabled() && mLockPatternUtils.savedPatternExists())
        {
            Intent intent = new Intent();
            intent.putExtra("com.android.settings.ConfirmLockPattern.header", charsequence);
            intent.putExtra("com.android.settings.ConfirmLockPattern.footer", charsequence1);
            intent.setClassName("com.android.settings", "com.android.settings.ConfirmLockPattern");
            if (mFragment != null)
                mFragment.startActivityForResult(intent, i);
            else
                mActivity.startActivityForResult(intent, i);
            return true;
        } else
        {
            return false;
        }
    }

    boolean launchConfirmationActivity(int i, CharSequence charsequence, CharSequence charsequence1)
    {
        switch (mLockPatternUtils.getKeyguardStoredPasswordQuality())
        {
        case 131072: 
        case 262144: 
        case 327680: 
        case 393216: 
            return confirmPassword(i);

        case 65536: 
            return confirmPattern(i, charsequence, charsequence1);
        }
        return false;
    }

    public LockPatternUtils utils()
    {
        return mLockPatternUtils;
    }
}
