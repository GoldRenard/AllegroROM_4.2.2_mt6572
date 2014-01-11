// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wireless;

import android.app.Activity;
import android.os.Bundle;
import android.view.*;
import com.android.settings.SettingsPreferenceFragment;

public class UsbSharingInfo extends SettingsPreferenceFragment
{

    private static final int MENU_OK = 1;
    public static final String TAG = "UsbSharingInfo";


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, 0x104000a).setShowAsAction(5);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        return getActivity().getLayoutInflater().inflate(0x7f040097, null);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
            finishFragment();
        return super.onOptionsItemSelected(menuitem);
    }
}
