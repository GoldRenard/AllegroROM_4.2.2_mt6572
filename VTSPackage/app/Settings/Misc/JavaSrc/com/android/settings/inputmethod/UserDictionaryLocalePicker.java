// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import com.android.internal.app.LocalePicker;

// Referenced classes of package com.android.settings.inputmethod:
//            UserDictionaryAddWordFragment

public class UserDictionaryLocalePicker extends LocalePicker
{

    public UserDictionaryLocalePicker(UserDictionaryAddWordFragment userdictionaryaddwordfragment)
    {
        setLocaleSelectionListener(userdictionaryaddwordfragment);
    }
}
