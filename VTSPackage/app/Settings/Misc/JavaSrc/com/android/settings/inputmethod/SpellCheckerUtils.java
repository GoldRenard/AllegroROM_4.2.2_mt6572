// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.view.textservice.SpellCheckerInfo;
import android.view.textservice.TextServicesManager;

public class SpellCheckerUtils
{

    private static final boolean DBG;
    private static final String TAG = com/android/settings/inputmethod/SpellCheckerUtils.getSimpleName();


    public static SpellCheckerInfo getCurrentSpellChecker(TextServicesManager textservicesmanager)
    {
        return textservicesmanager.getCurrentSpellChecker();
    }

    public static SpellCheckerInfo[] getEnabledSpellCheckers(TextServicesManager textservicesmanager)
    {
        return textservicesmanager.getEnabledSpellCheckers();
    }

    public static boolean getSpellCheckersEnabled(TextServicesManager textservicesmanager)
    {
        return true;
    }

    public static void setCurrentSpellChecker(TextServicesManager textservicesmanager, SpellCheckerInfo spellcheckerinfo)
    {
    }

    public static void setSpellCheckersEnabled(TextServicesManager textservicesmanager, boolean flag)
    {
    }

}
