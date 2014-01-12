// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.activity;

import android.app.Dialog;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import com.mediatek.bluetooth.util.BtLog;
import java.util.Iterator;
import java.util.List;

public class AssembledPreferenceActivity extends PreferenceActivity
{
    public static interface AssemblyPreference
    {

        public abstract int getPreferenceResourceId();

        public abstract void onCreate(PreferenceActivity preferenceactivity);

        public abstract Dialog onCreateDialog(int i);

        public abstract void onDestroy();

        public abstract void onRestoreInstanceState(Bundle bundle);

        public abstract void onResume();

        public abstract void onSaveInstanceState(Bundle bundle);
    }


    private List registeredPreference;

    protected AssembledPreferenceActivity(List list)
    {
        registeredPreference = list;
    }

    protected void onCreate(Bundle bundle)
    {
        BtLog.d("onCreate()[+]");
        super.onCreate(bundle);
        AssemblyPreference assemblypreference;
        for (Iterator iterator = registeredPreference.iterator(); iterator.hasNext(); assemblypreference.onCreate(this))
        {
            assemblypreference = (AssemblyPreference)iterator.next();
            addPreferencesFromResource(assemblypreference.getPreferenceResourceId());
        }

    }

    protected void onDestroy()
    {
        BtLog.d("onDestroy()[+]");
        for (Iterator iterator = registeredPreference.iterator(); iterator.hasNext(); ((AssemblyPreference)iterator.next()).onDestroy());
        super.onDestroy();
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        BtLog.d("onRestoreInstanceState()[+]");
        for (Iterator iterator = registeredPreference.iterator(); iterator.hasNext(); ((AssemblyPreference)iterator.next()).onRestoreInstanceState(bundle));
        super.onRestoreInstanceState(bundle);
    }

    protected void onResume()
    {
        BtLog.d("onResume()[+]");
        super.onResume();
        for (Iterator iterator = registeredPreference.iterator(); iterator.hasNext(); ((AssemblyPreference)iterator.next()).onResume());
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        BtLog.d("onSaveInstanceState()[+]");
        for (Iterator iterator = registeredPreference.iterator(); iterator.hasNext(); ((AssemblyPreference)iterator.next()).onSaveInstanceState(bundle));
        super.onSaveInstanceState(bundle);
    }
}
