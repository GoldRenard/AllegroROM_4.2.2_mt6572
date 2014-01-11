// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.ContentResolver;
import android.content.Context;
import android.net.wifi.WifiConfiguration;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

public interface IWifiSettingsExt
{

    public abstract void adjustPriority();

    public abstract void disconnect(int i);

    public abstract void emptyCategory(PreferenceScreen preferencescreen);

    public abstract void emptyScreen(PreferenceScreen preferencescreen);

    public abstract int getAccessPointsCount(PreferenceScreen preferencescreen);

    public abstract boolean isCatogoryExist();

    public abstract boolean isTustAP(String s, int i);

    public abstract void recordPriority(int i);

    public abstract void refreshCategory(PreferenceScreen preferencescreen);

    public abstract void registerPriorityObserver(ContentResolver contentresolver, Context context);

    public abstract void setCategory(PreferenceCategory preferencecategory, PreferenceCategory preferencecategory1, PreferenceCategory preferencecategory2);

    public abstract void setLastConnectedConfig(WifiConfiguration wificonfiguration);

    public abstract void setLastPriority(int i);

    public abstract void setNewPriority(WifiConfiguration wificonfiguration);

    public abstract boolean shouldAddDisconnectMenu();

    public abstract boolean shouldAddForgetMenu(String s, int i);

    public abstract void unregisterPriorityObserver(ContentResolver contentresolver);

    public abstract void updatePriority();

    public abstract void updatePriorityAfterConnect(int i);

    public abstract void updatePriorityAfterSubmit(WifiConfiguration wificonfiguration);
}
