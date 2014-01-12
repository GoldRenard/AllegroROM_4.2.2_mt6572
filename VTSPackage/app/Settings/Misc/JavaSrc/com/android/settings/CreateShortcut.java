// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.LauncherActivity;
import android.content.Intent;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.widget.ListView;
import java.util.List;

public class CreateShortcut extends LauncherActivity
{

    private static final String AUDIOPROFILE = "com.android.settings.Settings$AudioProfileSettingsActivity";
    private static final String DREAM_SETTINGS = "com.android.settings.Settings$DreamSettingsActivity";
    private static final String SOUND = "com.android.settings.Settings$SoundSettingsActivity";
    private static final String TAG = "CreateShortcut";


    protected Intent getTargetIntent()
    {
        Intent intent = new Intent("android.intent.action.MAIN", null);
        intent.addCategory("com.android.settings.SHORTCUT");
        intent.addFlags(0x10000000);
        return intent;
    }

    public List makeListItems()
    {
        List list;
        int i;
        int j;
        list = makeListItems();
        i = list.size();
        j = 0;
_L12:
        if (j >= i) goto _L2; else goto _L1
_L1:
        if (!"com.android.settings.Settings$SoundSettingsActivity".equals(((android.app.LauncherActivity.ListItem)list.get(j)).className)) goto _L4; else goto _L3
_L3:
        Log.d("CreateShortcut", "Not support google sound ,remove it");
        list.remove(j);
_L2:
        if (getResources().getBoolean(0x1110040)) goto _L6; else goto _L5
_L5:
        int k;
        int l;
        k = list.size();
        l = 0;
_L10:
        if (l >= k) goto _L6; else goto _L7
_L7:
        if (!"com.android.settings.Settings$DreamSettingsActivity".equals(((android.app.LauncherActivity.ListItem)list.get(l)).className)) goto _L9; else goto _L8
_L8:
        Log.d("CreateShortcut", "Not support dream settings, remove it");
        list.remove(l);
_L6:
        return list;
_L9:
        l++;
        if (true) goto _L10; else goto _L4
_L4:
        j++;
        if (true) goto _L12; else goto _L11
_L11:
    }

    protected boolean onEvaluateShowIcons()
    {
        return false;
    }

    protected void onListItemClick(ListView listview, View view, int i, long l)
    {
        Intent intent = intentForPosition(i);
        intent.setFlags(0x200000);
        Intent intent1 = new Intent();
        intent1.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", android.content.Intent.ShortcutIconResource.fromContext(this, 0x7f030000));
        intent1.putExtra("android.intent.extra.shortcut.INTENT", intent);
        intent1.putExtra("android.intent.extra.shortcut.NAME", itemForPosition(i).label);
        setResult(-1, intent1);
        finish();
    }
}
