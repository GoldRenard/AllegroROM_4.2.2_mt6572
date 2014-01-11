// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.app.Activity;
import android.content.Intent;
import android.service.dreams.Sandman;

public class Somnambulator extends Activity
{


    public void onStart()
    {
        super.onStart();
        Intent intent = getIntent();
        if ("android.intent.action.CREATE_SHORTCUT".equals(intent.getAction()))
        {
            Intent intent1 = new Intent(this, com/android/systemui/Somnambulator);
            intent1.setFlags(0x10800000);
            Intent intent2 = new Intent();
            intent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", android.content.Intent.ShortcutIconResource.fromContext(this, 0x7f030001));
            intent2.putExtra("android.intent.extra.shortcut.INTENT", intent1);
            intent2.putExtra("android.intent.extra.shortcut.NAME", getString(0x7f0b00d1));
            setResult(-1, intent2);
        } else
        if (intent.hasCategory("android.intent.category.DESK_DOCK"))
            Sandman.startDreamWhenDockedIfAppropriate(this);
        else
            Sandman.startDreamByUserRequest(this);
        finish();
    }
}
