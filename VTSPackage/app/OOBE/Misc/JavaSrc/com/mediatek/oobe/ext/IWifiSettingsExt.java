// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.ext;

import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

public interface IWifiSettingsExt
{

    public abstract void emptyCategory(PreferenceScreen preferencescreen);

    public abstract void emptyScreen(PreferenceScreen preferencescreen);

    public abstract int getAccessPointsCount(PreferenceScreen preferencescreen);

    public abstract boolean isCatogoryExist();

    public abstract boolean isTustAP(String s, int i);

    public abstract void refreshCategory(PreferenceScreen preferencescreen);

    public abstract void setCategory(PreferenceCategory preferencecategory, PreferenceCategory preferencecategory1, PreferenceCategory preferencecategory2);

    public abstract boolean shouldAddDisconnectMenu();

    public abstract boolean shouldAddForgetMenu(String s, int i);
}
