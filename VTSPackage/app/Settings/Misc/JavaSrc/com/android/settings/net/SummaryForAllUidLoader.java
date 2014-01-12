// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.net;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.net.*;
import android.os.Bundle;
import android.os.RemoteException;

public class SummaryForAllUidLoader extends AsyncTaskLoader
{

    private static final String KEY_END = "end";
    private static final String KEY_START = "start";
    private static final String KEY_TEMPLATE = "template";
    private final Bundle mArgs;
    private final INetworkStatsSession mSession;

    public SummaryForAllUidLoader(Context context, INetworkStatsSession inetworkstatssession, Bundle bundle)
    {
        super(context);
        mSession = inetworkstatssession;
        mArgs = bundle;
    }

    public static Bundle buildArgs(NetworkTemplate networktemplate, long l, long l1)
    {
        Bundle bundle = new Bundle();
        bundle.putParcelable("template", networktemplate);
        bundle.putLong("start", l);
        bundle.putLong("end", l1);
        return bundle;
    }

    public NetworkStats loadInBackground()
    {
        NetworkTemplate networktemplate = (NetworkTemplate)mArgs.getParcelable("template");
        long l = mArgs.getLong("start");
        long l1 = mArgs.getLong("end");
        NetworkStats networkstats;
        try
        {
            networkstats = mSession.getSummaryForAllUid(networktemplate, l, l1, false);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return networkstats;
    }

    public volatile Object loadInBackground()
    {
        return loadInBackground();
    }

    protected void onReset()
    {
        super.onReset();
        cancelLoad();
    }

    protected void onStartLoading()
    {
        super.onStartLoading();
        forceLoad();
    }

    protected void onStopLoading()
    {
        super.onStopLoading();
        cancelLoad();
    }
}
