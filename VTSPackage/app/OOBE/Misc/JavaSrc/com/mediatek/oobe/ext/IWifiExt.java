// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.ext;

import android.preference.SwitchPreference;
import android.widget.TextView;

public interface IWifiExt
{

    public abstract int getApOrder(String s, int i, String s1, int j);

    public abstract String getSecurityText(int i);

    public abstract boolean getSwitchState();

    public abstract void initSwitchState(SwitchPreference switchpreference);

    public abstract void registerAirplaneModeObserver(SwitchPreference switchpreference);

    public abstract void setProxyText(TextView textview);

    public abstract void setSecurityText(TextView textview);

    public abstract boolean shouldAddForgetButton(String s, int i);

    public abstract boolean shouldSetDisconnectButton();

    public abstract void unRegisterAirplaneObserver();
}
