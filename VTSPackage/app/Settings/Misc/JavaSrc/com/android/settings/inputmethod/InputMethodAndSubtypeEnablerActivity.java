// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.content.Intent;
import android.preference.PreferenceActivity;

// Referenced classes of package com.android.settings.inputmethod:
//            InputMethodAndSubtypeEnabler

public class InputMethodAndSubtypeEnablerActivity extends PreferenceActivity
{


    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        if (!intent.hasExtra(":android:show_fragment"))
        {
            intent.putExtra(":android:show_fragment", com/android/settings/inputmethod/InputMethodAndSubtypeEnabler.getName());
            intent.putExtra(":android:no_headers", true);
        }
        return intent;
    }
}
