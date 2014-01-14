// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.app.IUsageStats;
import com.android.internal.os.PkgUsageStats;
import java.util.*;

public class UsageStats extends Activity
    implements android.widget.AdapterView.OnItemSelectedListener
{
    public static class AppNameComparator
        implements Comparator
    {

        Map mAppLabelList;

        public final int compare(PkgUsageStats pkgusagestats, PkgUsageStats pkgusagestats1)
        {
            return ((CharSequence)mAppLabelList.get(pkgusagestats.packageName)).toString().compareTo(((CharSequence)mAppLabelList.get(pkgusagestats1.packageName)).toString());
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((PkgUsageStats)obj, (PkgUsageStats)obj1);
        }

        AppNameComparator(Map map)
        {
            mAppLabelList = map;
        }
    }

    static class AppViewHolder
    {

        TextView launchCount;
        TextView pkgName;
        TextView usageTime;

    }

    public static class LaunchCountComparator
        implements Comparator
    {

        public final int compare(PkgUsageStats pkgusagestats, PkgUsageStats pkgusagestats1)
        {
            return pkgusagestats1.launchCount - pkgusagestats.launchCount;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((PkgUsageStats)obj, (PkgUsageStats)obj1);
        }

    }

    class UsageStatsAdapter extends BaseAdapter
    {

        private static final int _DISPLAY_ORDER_APP_NAME = 2;
        private static final int _DISPLAY_ORDER_LAUNCH_COUNT = 1;
        private static final int _DISPLAY_ORDER_USAGE_TIME;
        private AppNameComparator mAppLabelComparator;
        private HashMap mAppLabelMap;
        private int mDisplayOrder;
        private LaunchCountComparator mLaunchCountComparator;
        private List mUsageStats;
        private UsageTimeComparator mUsageTimeComparator;
        final UsageStats this$0;

        private void sortList()
        {
            if (mDisplayOrder == 0)
                Collections.sort(mUsageStats, mUsageTimeComparator);
            else
            if (mDisplayOrder == 1)
                Collections.sort(mUsageStats, mLaunchCountComparator);
            else
            if (mDisplayOrder == 2)
                Collections.sort(mUsageStats, mAppLabelComparator);
            notifyDataSetChanged();
        }

        public int getCount()
        {
            return mUsageStats.size();
        }

        public Object getItem(int i)
        {
            return mUsageStats.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            AppViewHolder appviewholder;
            if (view == null)
            {
                view = mInflater.inflate(0x7f040096, null);
                appviewholder = new AppViewHolder();
                appviewholder.pkgName = (TextView)view.findViewById(0x7f08019c);
                appviewholder.launchCount = (TextView)view.findViewById(0x7f08019d);
                appviewholder.usageTime = (TextView)view.findViewById(0x7f08019e);
                view.setTag(appviewholder);
            } else
            {
                appviewholder = (AppViewHolder)view.getTag();
            }
            PkgUsageStats pkgusagestats = (PkgUsageStats)mUsageStats.get(i);
            if (pkgusagestats != null)
            {
                CharSequence charsequence = (CharSequence)mAppLabelMap.get(pkgusagestats.packageName);
                appviewholder.pkgName.setText(charsequence);
                appviewholder.launchCount.setText(String.valueOf(pkgusagestats.launchCount));
                appviewholder.usageTime.setText((new StringBuilder()).append(String.valueOf(pkgusagestats.usageTime)).append(" ms").toString());
                return view;
            } else
            {
                Log.w("UsageStatsActivity", (new StringBuilder()).append("No usage stats info for package:").append(i).toString());
                return view;
            }
        }

        void sortList(int i)
        {
            if (mDisplayOrder == i)
            {
                return;
            } else
            {
                mDisplayOrder = i;
                sortList();
                return;
            }
        }

        UsageStatsAdapter()
        {
            PkgUsageStats apkgusagestats[];
            int i;
            int j;
            this$0 = UsageStats.this;
            super();
            mDisplayOrder = 0;
            mUsageStats = new ArrayList();
            mAppLabelMap = new HashMap();
            try
            {
                apkgusagestats = mUsageStatsService.getAllPkgUsageStats();
            }
            catch (RemoteException remoteexception)
            {
                Log.e("UsageStatsActivity", "Failed initializing usage stats service");
                return;
            }
            if (apkgusagestats == null)
                return;
            i = apkgusagestats.length;
            j = 0;
_L2:
            PkgUsageStats pkgusagestats;
            if (j >= i)
                break; /* Loop/switch isn't completed */
            pkgusagestats = apkgusagestats[j];
            mUsageStats.add(pkgusagestats);
            CharSequence charsequence = mPm.getApplicationInfo(pkgusagestats.packageName, 0).loadLabel(mPm);
            Object obj = charsequence;
_L3:
            mAppLabelMap.put(pkgusagestats.packageName, obj);
            j++;
            if (true) goto _L2; else goto _L1
            android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
            namenotfoundexception;
            obj = pkgusagestats.packageName;
              goto _L3
_L1:
            mLaunchCountComparator = new LaunchCountComparator();
            mUsageTimeComparator = new UsageTimeComparator();
            mAppLabelComparator = new AppNameComparator(mAppLabelMap);
            sortList();
            return;
        }
    }

    public static class UsageTimeComparator
        implements Comparator
    {

        public final int compare(PkgUsageStats pkgusagestats, PkgUsageStats pkgusagestats1)
        {
            long l = pkgusagestats.usageTime - pkgusagestats1.usageTime;
            if (l == 0L)
                return 0;
            return l >= 0L ? -1 : 1;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((PkgUsageStats)obj, (PkgUsageStats)obj1);
        }

    }


    private static final String TAG = "UsageStatsActivity";
    private static final boolean localLOGV;
    private UsageStatsAdapter mAdapter;
    private LayoutInflater mInflater;
    private ListView mListView;
    private PackageManager mPm;
    private Spinner mTypeSpinner;
    private IUsageStats mUsageStatsService;


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mUsageStatsService = com.android.internal.app.IUsageStats.Stub.asInterface(ServiceManager.getService("usagestats"));
        if (mUsageStatsService == null)
        {
            Log.e("UsageStatsActivity", "Failed to retrieve usagestats service");
            return;
        } else
        {
            mInflater = (LayoutInflater)getSystemService("layout_inflater");
            mPm = getPackageManager();
            setContentView(0x7f040095);
            mTypeSpinner = (Spinner)findViewById(0x7f08019a);
            mTypeSpinner.setOnItemSelectedListener(this);
            mListView = (ListView)findViewById(0x7f08019b);
            mAdapter = new UsageStatsAdapter();
            mListView.setAdapter(mAdapter);
            return;
        }
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        mAdapter.sortList(i);
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }



}
