// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.app.Activity;
import android.content.ContentResolver;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.Switch;
import android.widget.TextView;

public interface IWifiExt
{

    public abstract void closeSpinnerDialog();

    public abstract int getApOrder(String s, int i, String s1, int j);

    public abstract int getPriority();

    public abstract View getPriorityView();

    public abstract String getSecurityText(int i);

    public abstract int getSleepPolicy(ContentResolver contentresolver);

    public abstract boolean getSwitchState();

    public abstract String getWifiApSsid();

    public abstract void initConnectView(Activity activity, PreferenceScreen preferencescreen);

    public abstract void initNetworkInfoView(PreferenceScreen preferencescreen);

    public abstract void initPreference(ContentResolver contentresolver);

    public abstract void initSwitchState(Switch switch1);

    public abstract void refreshNetworkInfoView();

    public abstract void registerAirplaneModeObserver(Switch switch1);

    public abstract void setAPNetworkId(int i);

    public abstract void setAPPriority(int i);

    public abstract void setProxyText(TextView textview);

    public abstract void setSecurityText(TextView textview);

    public abstract boolean shouldAddForgetButton(String s, int i);

    public abstract boolean shouldSetDisconnectButton();

    public abstract void unRegisterAirplaneObserver();
}
