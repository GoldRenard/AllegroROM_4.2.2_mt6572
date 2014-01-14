// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.datausage;

import android.content.Context;
import android.net.*;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.telephony.TelephonyManager;
import android.text.format.Formatter;
import android.view.*;
import android.widget.*;
import com.android.settings.Utils;
import com.android.settings.net.ChartData;
import com.android.settings.net.NetworkPolicyEditor;
import com.mediatek.settings.ext.ISettingsMiscExt;
import com.mediatek.xlog.Xlog;
import java.text.SimpleDateFormat;
import java.util.*;

public class OverViewTabAdapter extends BaseExpandableListAdapter
{

    private static final int CYCLE_RANGE_OVER_WEEK = 4;
    private static final long DAY = 0x1b77400L;
    private static final int DAY_END_INDEX = 7;
    private static final int DAY_START_INDEX = 6;
    private static final int LOADER_CHART_DATA = 2;
    private static final int MONTH_END_INDEX = 5;
    private static final int MONTH_START_INDEX = 4;
    private static final int OVER_COLOR_RED = 10;
    private static final int PERCENT_FULL = 1;
    private static final double PERCENT_LOW = 0.01D;
    private static final int PERCENT_NONE = 0;
    private static final int POLICY_NULL_FLAG = -2;
    private static final int PROGRESS_FULL = 100;
    private static final int PROGRESS_NONE = 0;
    private static final long REF_WIFI = 0x3e800000L;
    private static final int SIM_COLOR_BLUE = 0;
    private static final int SIM_COLOR_GREEN = 2;
    private static final int SIM_COLOR_ORANGE = 1;
    private static final int SIM_COLOR_PURPLE = 3;
    private static final String TAG = "OverViewTabAdapter";
    private static final String TEST_SUBSCRIBER_PROP = "test.subscriberid";
    private static final int THOUSAND = 1000;
    private static final int YEAR_END_INDEX = 3;
    private static final int YEAR_START_INDEX;
    private static ISettingsMiscExt sSettingsMiscExt;
    private Context mContext;
    private List mGroup;
    private long mLimitBytes[];
    private int mMobilePos;
    private long mMobileTotal[];
    private NetworkPolicyEditor mPolicyEditor;
    private NetworkPolicyManager mPolicyManager;
    private List mSimList;
    private int mSimNum;
    private INetworkStatsSession mStatsSession;
    private int mWifiPos;
    private long mWifiToday;
    private long mWifiTotal;

    public OverViewTabAdapter(Context context, INetworkStatsSession inetworkstatssession)
    {
        Xlog.d("OverViewTabAdapter", "OverViewTabAdapter()");
        mContext = context;
        mStatsSession = inetworkstatssession;
        initPolicy();
        getMobileState();
        initData();
        sSettingsMiscExt = Utils.getMiscPlugin(context);
    }

    private int calcMobileProgress(long l, long l1)
    {
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("calcMobileProgress() totalUsage = ").append(l).append(" limitUsage = ").append(l1).toString());
        double d;
        if (l1 < 0L)
        {
            if (l == 0L)
                d = 0.0D;
            else
                d = 1.0D;
        } else
        if (l <= l1)
        {
            d = (double)l / (double)l1;
            Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("limitUsage >=  totalUsage  per = ").append(d).toString());
        } else
        {
            d = 1.0D;
            Xlog.d("OverViewTabAdapter", "limitUsage < totalUsage ,so set per = 1");
        }
        if (d > 0.0D && d < 0.01D)
            d = 0.01D;
        int i = (int)(100D * d);
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("calcMobileProgress value ").append(i).toString());
        return i;
    }

    private int calcWifiTodayProgress(long l, long l1)
    {
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("calcWifiTodayProgress() todayUsage : ").append(l).append(" totalUsage : ").append(l1).toString());
        double d;
        if (l == 0L)
        {
            d = 0.0D;
        } else
        {
            d = (double)l / (double)l1;
            if (d > 0.0D && d < 0.01D)
                d = 0.01D;
        }
        int i = (int)(100D * d);
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("calcWifiTodayProgress() value : ").append(i).toString());
        return i;
    }

    private int calcWifiTotalProgress(long l)
    {
        return l != 0L ? 100 : 0;
    }

    private static String getActiveSubscriberId(Context context)
    {
        return SystemProperties.get("test.subscriberid", TelephonyManager.from(context).getSubscriberId());
    }

    private void getMobileData()
    {
        ChartData chartdata;
        int i;
        Iterator iterator;
        Xlog.d("OverViewTabAdapter", "getMobileData()");
        chartdata = new ChartData();
        i = 0;
        iterator = mSimList.iterator();
_L12:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        long l;
        long l2;
        long l3;
        long l4;
        long l5;
        long l7;
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
        NetworkTemplate networktemplate = NetworkTemplate.buildTemplateMobileAll(getSubscriberId(mContext, siminfo.mSlot));
        long l1;
        android.net.NetworkPolicy networkpolicy;
        android.net.NetworkStatsHistory.Entry entry;
        long al[];
        try
        {
            chartdata.network = mStatsSession.getHistoryForNetwork(networktemplate, 10);
            mLimitBytes[i] = mPolicyEditor.getPolicyLimitBytes(networktemplate);
        }
        catch (Exception exception)
        {
            mLimitBytes[i] = -2L;
            i++;
            continue; /* Loop/switch isn't completed */
        }
        l = chartdata.network.getStart();
        l1 = chartdata.network.getEnd();
        l2 = System.currentTimeMillis();
        networkpolicy = mPolicyEditor.getPolicy(networktemplate);
        l3 = l1;
        l4 = l1;
        l5 = l;
        if (networkpolicy == null) goto _L4; else goto _L3
_L3:
        l7 = NetworkPolicyManager.computeNextCycleBoundary(l1, networkpolicy);
_L9:
        if (l7 <= l) goto _L6; else goto _L5
_L5:
        l5 = NetworkPolicyManager.computeLastCycleBoundary(l7, networkpolicy);
        if (l5 > l2 || l2 > l7) goto _L8; else goto _L7
_L7:
        Xlog.d("OverViewTabAdapter", "cycleStart <= now && now <= cycleEnd");
_L6:
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("cycleEndBak=").append(l4).append("cycleStart=").append(l5).toString());
        entry = chartdata.network.getValues(l5, l4, l2, null);
        al = mMobileTotal;
        long l6;
        if (entry != null)
            l6 = entry.rxBytes + entry.txBytes;
        else
            l6 = 0L;
        al[i] = l6;
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("mMobileTotal[").append(i).append("]=").append(mMobileTotal[i]).append("mLimitBytes").append("[").append(i).append("]=").append(mLimitBytes[i]).toString());
        i++;
        continue; /* Loop/switch isn't completed */
_L8:
        l4 = l7;
        l7 = l5;
          goto _L9
_L10:
        l4 = l3;
        l3 = l5;
_L4:
        if (l3 <= l)
            break; /* Loop/switch isn't completed */
        l5 = l3 - 0x90321000L;
        if (l5 > l2 || l2 > l3) goto _L10; else goto _L6
_L2:
        return;
        if (true) goto _L12; else goto _L11
_L11:
    }

    private void getMobileState()
    {
        Xlog.d("OverViewTabAdapter", "getMobileState()");
        mSimList = android.provider.Telephony.SIMInfo.getInsertedSIMList(mContext);
        mSimNum = mSimList.size();
        mMobileTotal = new long[mSimNum];
        mLimitBytes = new long[mSimNum];
        Collections.sort(mSimList, new com.mediatek.gemini.GeminiUtils.SIMInfoComparable());
    }

    private static String getSubscriberId(Context context, int i)
    {
        return ((TelephonyManager)context.getSystemService("phone")).getSubscriberIdGemini(i);
    }

    private void getWifiData()
    {
        Xlog.d("OverViewTabAdapter", "getWifiData()");
        ChartData chartdata = new ChartData();
        long l;
        long l1;
        long l2;
        long l3;
        long l4;
        long l5;
        try
        {
            chartdata.network = mStatsSession.getHistoryForNetwork(NetworkTemplate.buildTemplateWifiWildcard(), 10);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("OverViewTabAdapter", "Remote Exception happens");
        }
        l = chartdata.network.getStart();
        l1 = chartdata.network.getEnd();
        l2 = System.currentTimeMillis();
        Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("historyStart = ").append(l).append(" historyEnd = ").append(l1).append(" now = ").append(l2).toString());
        l3 = l1;
        l4 = l1;
        l5 = l;
        do
        {
label0:
            {
                if (l3 > l)
                {
                    l5 = l3 - 0x90321000L;
                    if (l5 > l2 || l2 > l3)
                        break label0;
                    Xlog.d("OverViewTabAdapter", "cycleStart <= now && now <= cycleEnd");
                }
                android.net.NetworkStatsHistory.Entry entry = chartdata.network.getValues(l5, l4, l2, null);
                Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("cycleStart = ").append(l5).append(" cycleEndBak = ").append(l4).toString());
                long l6;
                android.net.NetworkStatsHistory.Entry entry1;
                long l7;
                if (entry != null)
                    l6 = entry.rxBytes + entry.txBytes;
                else
                    l6 = 0L;
                mWifiTotal = l6;
                entry1 = chartdata.network.getValues(getUtcDateMillis(), l2, l2, null);
                if (entry1 != null)
                    l7 = entry1.rxBytes + entry1.txBytes;
                else
                    l7 = 0L;
                mWifiToday = l7;
                Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("mWifiTotal = ").append(mWifiTotal).append(" mWifiToday = ").append(mWifiToday).toString());
                return;
            }
            l4 = l3;
            l3 = l5;
        } while (true);
    }

    private void initData()
    {
        Xlog.d("OverViewTabAdapter", "initData()");
        mGroup = new ArrayList();
        if (mSimNum != 0)
        {
            mGroup.add(mContext.getString(0x7f0b018b));
            mMobilePos = 0;
            mGroup.add(mContext.getString(0x7f0b0432));
            mWifiPos = 1;
            return;
        } else
        {
            mGroup.add(mContext.getString(0x7f0b0432));
            mWifiPos = 0;
            return;
        }
    }

    private void initPolicy()
    {
        Xlog.d("OverViewTabAdapter", "initPolicy()");
        if (mPolicyManager == null && mPolicyEditor == null)
        {
            mPolicyManager = NetworkPolicyManager.from(mContext);
            mPolicyEditor = new NetworkPolicyEditor(mPolicyManager);
            mPolicyEditor.read();
        }
    }

    public Object getChild(int i, int j)
    {
        return null;
    }

    public long getChildId(int i, int j)
    {
        return (long)j;
    }

    public View getChildView(int i, int j, boolean flag, View view, ViewGroup viewgroup)
    {
        View view1;
        if (i == mWifiPos)
        {
            view1 = LayoutInflater.from(mContext).inflate(0x7f040053, null);
            TextView textview2 = (TextView)view1.findViewById(0x7f0800de);
            TextView textview3 = (TextView)view1.findViewById(0x7f0800e0);
            ProgressBar progressbar1 = (ProgressBar)view1.findViewById(0x7f0800df);
            getWifiData();
            if (j == 0)
            {
                textview2.setText(mContext.getString(0x7f0b0189));
                String s1 = Formatter.formatFileSize(mContext, mWifiToday);
                Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("childPosition=").append(j).append(" and usage= ").append(s1).toString());
                textview3.setText(s1);
                progressbar1.setSecondaryProgress(calcWifiTodayProgress(mWifiToday, mWifiTotal));
            } else
            {
                textview2.setText(mContext.getString(0x7f0b018a));
                String s = Formatter.formatFileSize(mContext, mWifiTotal);
                Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("childPosition = ").append(j).append(" and usage= ").append(s).toString());
                textview3.setText(s);
                progressbar1.setSecondaryProgress(calcWifiTotalProgress(mWifiTotal));
                return view1;
            }
        } else
        {
            int k = mMobilePos;
            view1 = null;
            if (i == k)
            {
                getMobileData();
                LayoutInflater layoutinflater = LayoutInflater.from(mContext);
                int l = ((android.provider.Telephony.SIMInfo)mSimList.get(j)).mColor;
                Xlog.d("OverViewTabAdapter", (new StringBuilder()).append("usage : ").append(mMobileTotal[j]).append(" limit : ").append(mLimitBytes[j]).toString());
                if (mLimitBytes[j] >= 0L && mMobileTotal[j] > mLimitBytes[j])
                    l = 10;
                View view2;
                switch (l)
                {
                case 10: // '\n'
                    view2 = layoutinflater.inflate(0x7f040052, null);
                    break;

                case 3: // '\003'
                    view2 = layoutinflater.inflate(0x7f040051, null);
                    break;

                case 2: // '\002'
                    view2 = layoutinflater.inflate(0x7f04004f, null);
                    break;

                case 1: // '\001'
                    view2 = layoutinflater.inflate(0x7f040050, null);
                    break;

                case 0: // '\0'
                    view2 = layoutinflater.inflate(0x7f04004e, null);
                    break;

                case 4: // '\004'
                case 5: // '\005'
                case 6: // '\006'
                case 7: // '\007'
                case 8: // '\b'
                case 9: // '\t'
                default:
                    view2 = layoutinflater.inflate(0x7f04004e, null);
                    break;
                }
                TextView textview = (TextView)view2.findViewById(0x7f0800db);
                TextView textview1 = (TextView)view2.findViewById(0x7f0800dd);
                int i1 = ((android.provider.Telephony.SIMInfo)mSimList.get(j)).mColor;
                ProgressBar progressbar = (ProgressBar)view2.findViewById(0x7f0800dc);
                textview.setText(((android.provider.Telephony.SIMInfo)mSimList.get(j)).mDisplayName);
                sSettingsMiscExt.DataUsageUpdateSimText(i1, textview);
                if (mLimitBytes[j] > -1L)
                {
                    if (mLimitBytes[j] >= 0L && mMobileTotal[j] > mLimitBytes[j])
                    {
                        Xlog.d("OverViewTabAdapter", "Usage bytes is bigger than the limit bytes , show warning");
                        Context context1 = mContext;
                        Object aobj1[] = new Object[1];
                        aobj1[0] = Formatter.formatFileSize(mContext, mMobileTotal[j] - mLimitBytes[j]);
                        textview1.setText(context1.getString(0x7f0b018d, aobj1));
                    } else
                    {
                        Context context = mContext;
                        Object aobj[] = new Object[2];
                        aobj[0] = Formatter.formatFileSize(mContext, mMobileTotal[j]);
                        aobj[1] = Formatter.formatFileSize(mContext, mLimitBytes[j]);
                        textview1.setText(context.getString(0x7f0b018c, aobj));
                    }
                } else
                {
                    textview1.setText(Formatter.formatFileSize(mContext, mMobileTotal[j]));
                }
                progressbar.setProgress(calcMobileProgress(mMobileTotal[j], mLimitBytes[j]));
                return view2;
            }
        }
        return view1;
    }

    public int getChildrenCount(int i)
    {
        if (i == mWifiPos)
            return 2;
        if (i == mMobilePos)
            return mSimNum;
        else
            return 0;
    }

    public Object getGroup(int i)
    {
        return null;
    }

    public int getGroupCount()
    {
        return mGroup.size();
    }

    public long getGroupId(int i)
    {
        return (long)i;
    }

    public View getGroupView(int i, boolean flag, View view, ViewGroup viewgroup)
    {
        TextView textview;
        if (view != null && (view instanceof TextView))
            textview = (TextView)view;
        else
            textview = (TextView)LayoutInflater.from(mContext).inflate(0x7f040040, null);
        textview.setText((CharSequence)mGroup.get(i));
        return textview;
    }

    public long getUtcDateMillis()
    {
        String s = (new SimpleDateFormat("yyyyMMdd", Locale.getDefault())).format(new Date(System.currentTimeMillis()));
        int i = Integer.valueOf(s.substring(0, 4)).intValue();
        int j = Integer.valueOf(s.substring(4, 6)).intValue();
        int k = Integer.valueOf(s.substring(6, 8)).intValue();
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        calendar.set(i, j - 1, k, 0, 0, 0);
        return 1000L * (calendar.getTimeInMillis() / 1000L);
    }

    public boolean hasStableIds()
    {
        return false;
    }

    public boolean isChildSelectable(int i, int j)
    {
        return false;
    }

    public void updateAdapter()
    {
        Xlog.d("OverViewTabAdapter", "updateAdapter()");
        if (mPolicyEditor != null)
            mPolicyEditor.read();
        getMobileState();
        initData();
    }
}
