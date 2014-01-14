// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.net;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.net.*;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.SparseBooleanArray;

// Referenced classes of package com.android.settings.net:
//            ChartData

public class ChartDataLoader extends AsyncTaskLoader
{

    private static final String KEY_APP = "app";
    private static final String KEY_FIELDS = "fields";
    private static final String KEY_TEMPLATE = "template";
    private final Bundle mArgs;
    private final INetworkStatsSession mSession;

    public ChartDataLoader(Context context, INetworkStatsSession inetworkstatssession, Bundle bundle)
    {
        super(context);
        mSession = inetworkstatssession;
        mArgs = bundle;
    }

    public static Bundle buildArgs(NetworkTemplate networktemplate, com.android.settings.DataUsageSummary.AppItem appitem)
    {
        return buildArgs(networktemplate, appitem, 10);
    }

    public static Bundle buildArgs(NetworkTemplate networktemplate, com.android.settings.DataUsageSummary.AppItem appitem, int i)
    {
        Bundle bundle = new Bundle();
        bundle.putParcelable("template", networktemplate);
        bundle.putParcelable("app", appitem);
        bundle.putInt("fields", i);
        return bundle;
    }

    private NetworkStatsHistory collectHistoryForUid(NetworkTemplate networktemplate, int i, int j, NetworkStatsHistory networkstatshistory)
        throws RemoteException
    {
        NetworkStatsHistory networkstatshistory1 = mSession.getHistoryForUid(networktemplate, i, j, 0, 10);
        if (networkstatshistory != null)
        {
            networkstatshistory.recordEntireHistory(networkstatshistory1);
            return networkstatshistory;
        } else
        {
            return networkstatshistory1;
        }
    }

    private ChartData loadInBackground(NetworkTemplate networktemplate, com.android.settings.DataUsageSummary.AppItem appitem, int i)
        throws RemoteException
    {
        ChartData chartdata;
label0:
        {
            chartdata = new ChartData();
            chartdata.network = mSession.getHistoryForNetwork(networktemplate, i);
            if (appitem != null)
            {
                int j = appitem.uids.size();
                for (int k = 0; k < j; k++)
                {
                    int l = appitem.uids.keyAt(k);
                    chartdata.detailDefault = collectHistoryForUid(networktemplate, l, 0, chartdata.detailDefault);
                    chartdata.detailForeground = collectHistoryForUid(networktemplate, l, 1, chartdata.detailForeground);
                }

                if (j <= 0)
                    break label0;
                chartdata.detail = new NetworkStatsHistory(chartdata.detailForeground.getBucketDuration());
                chartdata.detail.recordEntireHistory(chartdata.detailDefault);
                chartdata.detail.recordEntireHistory(chartdata.detailForeground);
            }
            return chartdata;
        }
        chartdata.detailDefault = new NetworkStatsHistory(0x36ee80L);
        chartdata.detailForeground = new NetworkStatsHistory(0x36ee80L);
        chartdata.detail = new NetworkStatsHistory(0x36ee80L);
        return chartdata;
    }

    public ChartData loadInBackground()
    {
        NetworkTemplate networktemplate = (NetworkTemplate)mArgs.getParcelable("template");
        com.android.settings.DataUsageSummary.AppItem appitem = (com.android.settings.DataUsageSummary.AppItem)mArgs.getParcelable("app");
        int i = mArgs.getInt("fields");
        ChartData chartdata;
        try
        {
            chartdata = loadInBackground(networktemplate, appitem, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("problem reading network stats", remoteexception);
        }
        return chartdata;
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
