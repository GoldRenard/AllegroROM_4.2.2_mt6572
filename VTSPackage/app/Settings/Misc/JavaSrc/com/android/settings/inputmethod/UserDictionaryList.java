// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.*;
import com.android.settings.*;
import java.util.*;

public class UserDictionaryList extends SettingsPreferenceFragment
{

    public static final String USER_DICTIONARY_SETTINGS_INTENT_ACTION = "android.settings.USER_DICTIONARY_SETTINGS";


    static TreeSet getUserDictionaryLocalesSet(Activity activity)
    {
        Cursor cursor = activity.managedQuery(android.provider.UserDictionary.Words.CONTENT_URI, new String[] {
            "locale"
        }, null, null, null);
        TreeSet treeset = new TreeSet();
        if (cursor == null)
            return null;
        if (cursor.moveToFirst())
        {
            int i = cursor.getColumnIndex("locale");
            do
            {
                String s = cursor.getString(i);
                if (s == null)
                    s = "";
                treeset.add(s);
            } while (cursor.moveToNext());
        }
        treeset.add(Locale.getDefault().toString());
        return treeset;
    }

    protected void createUserDictSettings(PreferenceGroup preferencegroup)
    {
        Activity activity = getActivity();
        preferencegroup.removeAll();
        TreeSet treeset = getUserDictionaryLocalesSet(activity);
        if (treeset.isEmpty())
        {
            preferencegroup.addPreference(createUserDictionaryPreference(null, activity));
        } else
        {
            for (Iterator iterator = treeset.iterator(); iterator.hasNext(); preferencegroup.addPreference(createUserDictionaryPreference((String)iterator.next(), activity)));
        }
    }

    protected Preference createUserDictionaryPreference(String s, Activity activity)
    {
        Preference preference = new Preference(getActivity());
        Intent intent = new Intent("android.settings.USER_DICTIONARY_SETTINGS");
        if (s == null)
        {
            preference.setTitle(Locale.getDefault().getDisplayName());
        } else
        {
            if ("".equals(s))
                preference.setTitle(getString(0x7f0b06e5));
            else
                preference.setTitle(Utils.createLocaleFromString(s).getDisplayName());
            intent.putExtra("locale", s);
            preference.getExtras().putString("locale", s);
        }
        preference.setIntent(intent);
        preference.setFragment(com/android/settings/UserDictionarySettings.getName());
        return preference;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setPreferenceScreen(getPreferenceManager().createPreferenceScreen(getActivity()));
    }

    public void onResume()
    {
        super.onResume();
        createUserDictSettings(getPreferenceScreen());
    }
}
