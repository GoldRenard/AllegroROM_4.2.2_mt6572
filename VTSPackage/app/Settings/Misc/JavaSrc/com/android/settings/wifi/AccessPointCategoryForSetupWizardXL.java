// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.util.AttributeSet;
import com.android.settings.ProgressCategoryBase;

public class AccessPointCategoryForSetupWizardXL extends ProgressCategoryBase
{

    public AccessPointCategoryForSetupWizardXL(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setLayoutResource(0x7f040000);
    }

    public void setProgress(boolean flag)
    {
        notifyChanged();
    }
}
