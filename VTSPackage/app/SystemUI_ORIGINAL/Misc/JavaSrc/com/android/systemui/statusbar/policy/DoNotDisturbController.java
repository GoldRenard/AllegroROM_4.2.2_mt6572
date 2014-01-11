// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.content.SharedPreferences;
import android.widget.CompoundButton;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            Prefs

public class DoNotDisturbController
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.content.SharedPreferences.OnSharedPreferenceChangeListener
{

    private static final String TAG = "StatusBar.DoNotDisturbController";
    private CompoundButton mCheckBox;
    private Context mContext;
    private boolean mDoNotDisturb;
    SharedPreferences mPrefs;

    public DoNotDisturbController(Context context, CompoundButton compoundbutton)
    {
        mContext = context;
        mPrefs = Prefs.read(context);
        mPrefs.registerOnSharedPreferenceChangeListener(this);
        mDoNotDisturb = mPrefs.getBoolean("do_not_disturb", false);
        mCheckBox = compoundbutton;
        compoundbutton.setOnCheckedChangeListener(this);
        boolean flag = mDoNotDisturb;
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        compoundbutton.setChecked(flag1);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != mDoNotDisturb)
        {
            android.content.SharedPreferences.Editor editor = Prefs.edit(mContext);
            editor.putBoolean("do_not_disturb", flag1);
            editor.apply();
        }
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedpreferences, String s)
    {
        boolean flag = sharedpreferences.getBoolean("do_not_disturb", false);
        if (flag != mDoNotDisturb)
        {
            mDoNotDisturb = flag;
            CompoundButton compoundbutton = mCheckBox;
            boolean flag1 = false;
            if (!flag)
                flag1 = true;
            compoundbutton.setChecked(flag1);
        }
    }

    public void release()
    {
        mPrefs.unregisterOnSharedPreferenceChangeListener(this);
    }
}
