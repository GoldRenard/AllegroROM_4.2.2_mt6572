// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.users;

import android.content.Context;
import android.os.UserManager;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;

public class UserPreference extends Preference
{

    public static final int USERID_UNKNOWN = -10;
    private android.view.View.OnClickListener mDeleteClickListener;
    private int mSerialNumber;
    private int mUserId;

    public UserPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, -10, false, null);
    }

    UserPreference(Context context, AttributeSet attributeset, int i, boolean flag, android.view.View.OnClickListener onclicklistener)
    {
        super(context, attributeset);
        mSerialNumber = -1;
        mUserId = -10;
        if (flag)
        {
            setWidgetLayoutResource(0x7f040078);
            mDeleteClickListener = onclicklistener;
        }
        mUserId = i;
    }

    public int compareTo(Preference preference)
    {
        return !(preference instanceof UserPreference) || getSerialNumber() > ((UserPreference)preference).getSerialNumber() ? 1 : -1;
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    public int getSerialNumber()
    {
        if (mSerialNumber < 0)
        {
            if (mUserId == -10)
                return 0x7fffffff;
            mSerialNumber = ((UserManager)getContext().getSystemService("user")).getUserSerialNumber(mUserId);
            if (mSerialNumber < 0)
                return mUserId;
        }
        return mSerialNumber;
    }

    public int getUserId()
    {
        return mUserId;
    }

    protected void onBindView(View view)
    {
        View view1 = view.findViewById(0x7f08012c);
        if (view1 != null)
        {
            view1.setOnClickListener(mDeleteClickListener);
            view1.setTag(this);
        }
        super.onBindView(view);
    }
}
