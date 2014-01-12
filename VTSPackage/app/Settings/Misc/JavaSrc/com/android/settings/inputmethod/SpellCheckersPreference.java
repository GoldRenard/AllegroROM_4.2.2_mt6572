// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.content.Context;
import android.util.AttributeSet;
import android.view.textservice.TextServicesManager;

// Referenced classes of package com.android.settings.inputmethod:
//            CheckBoxAndSettingsPreference

public class SpellCheckersPreference extends CheckBoxAndSettingsPreference
{

    private final TextServicesManager mTsm;

    public SpellCheckersPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTsm = (TextServicesManager)context.getSystemService("textservices");
        setChecked(mTsm.isSpellCheckerEnabled());
    }

    protected void onCheckBoxClicked()
    {
        super.onCheckBoxClicked();
        boolean flag = isChecked();
        mTsm.setSpellCheckerEnabled(flag);
    }
}
