// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import android.net.Uri;
import android.preference.RingtonePreference;
import android.util.AttributeSet;

public class DefaultRingtonePreference extends RingtonePreference
{

    public DefaultRingtonePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    protected void onPrepareRingtonePickerIntent(Intent intent)
    {
        super.onPrepareRingtonePickerIntent(intent);
        intent.putExtra("android.intent.extra.ringtone.SHOW_DEFAULT", false);
    }

    protected Uri onRestoreRingtone()
    {
        return RingtoneManager.getActualDefaultRingtoneUri(getContext(), getRingtoneType());
    }

    protected void onSaveRingtone(Uri uri)
    {
        RingtoneManager.setActualDefaultRingtoneUri(getContext(), getRingtoneType(), uri);
    }
}
