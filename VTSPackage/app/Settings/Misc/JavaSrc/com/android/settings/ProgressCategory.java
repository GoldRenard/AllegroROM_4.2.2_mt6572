// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;

// Referenced classes of package com.android.settings:
//            ProgressCategoryBase

public class ProgressCategory extends ProgressCategoryBase
{

    private final int mEmptyTextRes;
    private boolean mNoDeviceFoundAdded;
    private Preference mNoDeviceFoundPreference;
    private boolean mProgress;

    public ProgressCategory(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        mProgress = false;
        setLayoutResource(0x7f04006d);
        mEmptyTextRes = i;
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
        View view1 = view.findViewById(0x7f08010b);
        boolean flag;
        if (getPreferenceCount() != 0 && (getPreferenceCount() != 1 || getPreference(0) != mNoDeviceFoundPreference))
            flag = false;
        else
            flag = true;
        byte byte0;
        if (mProgress)
            byte0 = 0;
        else
            byte0 = 8;
        view1.setVisibility(byte0);
        if (!mProgress && flag)
        {
            if (!mNoDeviceFoundAdded)
            {
                if (mNoDeviceFoundPreference == null)
                {
                    mNoDeviceFoundPreference = new Preference(getContext());
                    mNoDeviceFoundPreference.setLayoutResource(0x7f040064);
                    mNoDeviceFoundPreference.setTitle(mEmptyTextRes);
                    mNoDeviceFoundPreference.setSelectable(false);
                }
                addPreference(mNoDeviceFoundPreference);
                mNoDeviceFoundAdded = true;
                return;
            }
        } else
        if (mNoDeviceFoundAdded)
        {
            removePreference(mNoDeviceFoundPreference);
            mNoDeviceFoundAdded = false;
        }
    }

    public void setNoDeviceFoundAdded(boolean flag)
    {
        mNoDeviceFoundAdded = flag;
    }

    public void setProgress(boolean flag)
    {
        mProgress = flag;
        notifyChanged();
    }
}
