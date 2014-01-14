// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.widget.Button;
import com.android.settings.ButtonBarHandler;

// Referenced classes of package com.android.settings.wifi:
//            WifiSettings

public class WifiPickerActivity extends PreferenceActivity
    implements ButtonBarHandler
{

    private static final String EXTRA_PREFS_SET_BACK_TEXT = "extra_prefs_set_back_text";
    private static final String EXTRA_PREFS_SET_NEXT_TEXT = "extra_prefs_set_next_text";
    private static final String EXTRA_PREFS_SHOW_BUTTON_BAR = "extra_prefs_show_button_bar";
    private static final String EXTRA_WIFI_SHOW_ACTION_BAR = "wifi_show_action_bar";
    private static final String EXTRA_WIFI_SHOW_MENUS = "wifi_show_menus";


    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        if (!intent.hasExtra(":android:show_fragment"))
            intent.putExtra(":android:show_fragment", com/android/settings/wifi/WifiSettings.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public Button getNextButton()
    {
        return super.getNextButton();
    }

    public boolean hasNextButton()
    {
        return super.hasNextButton();
    }

    public void startWithFragment(String s, Bundle bundle, Fragment fragment, int i)
    {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(this, getClass());
        intent.putExtra(":android:show_fragment", s);
        intent.putExtra(":android:show_fragment_args", bundle);
        intent.putExtra(":android:no_headers", true);
        Intent intent1 = getIntent();
        if (intent1.hasExtra("extra_prefs_show_button_bar"))
            intent.putExtra("extra_prefs_show_button_bar", intent1.getBooleanExtra("extra_prefs_show_button_bar", false));
        if (intent1.hasExtra("extra_prefs_set_next_text"))
            intent.putExtra("extra_prefs_set_next_text", intent1.getStringExtra("extra_prefs_set_next_text"));
        if (intent1.hasExtra("extra_prefs_set_back_text"))
            intent.putExtra("extra_prefs_set_back_text", intent1.getStringExtra("extra_prefs_set_back_text"));
        if (intent1.hasExtra("wifi_show_action_bar"))
            intent.putExtra("wifi_show_action_bar", intent1.getBooleanExtra("wifi_show_action_bar", true));
        if (intent1.hasExtra("wifi_show_menus"))
            intent.putExtra("wifi_show_menus", intent1.getBooleanExtra("wifi_show_menus", true));
        if (fragment == null)
        {
            startActivity(intent);
            return;
        } else
        {
            fragment.startActivityForResult(intent, i);
            return;
        }
    }
}
