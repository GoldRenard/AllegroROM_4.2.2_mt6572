// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi.p2p;

import android.content.Context;
import android.net.wifi.p2p.WifiP2pGroup;
import android.preference.Preference;
import android.view.View;

public class WifiP2pPersistentGroup extends Preference
{

    public WifiP2pGroup mGroup;

    public WifiP2pPersistentGroup(Context context, WifiP2pGroup wifip2pgroup)
    {
        super(context);
        mGroup = wifip2pgroup;
    }

    String getGroupName()
    {
        return mGroup.getNetworkName();
    }

    int getNetworkId()
    {
        return mGroup.getNetworkId();
    }

    protected void onBindView(View view)
    {
        setTitle(mGroup.getNetworkName());
        super.onBindView(view);
    }
}
