// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.animation.LayoutTransition;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.LoaderManager;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.Loader;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.ConnectivityManager;
import android.net.INetworkStatsService;
import android.net.INetworkStatsSession;
import android.net.NetworkPolicy;
import android.net.NetworkPolicyManager;
import android.net.NetworkStats;
import android.net.NetworkStatsHistory;
import android.net.NetworkTemplate;
import android.net.TrafficStats;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.INetworkManagementService;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.PreferenceActivity;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.text.format.Time;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.NumberPicker;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;
import com.android.internal.util.Preconditions;
import com.android.settings.drawable.InsetBoundsDrawable;
import com.android.settings.net.ChartData;
import com.android.settings.net.ChartDataLoader;
import com.android.settings.net.DataUsageMeteredSettings;
import com.android.settings.net.NetworkPolicyEditor;
import com.android.settings.net.SummaryForAllUidLoader;
import com.android.settings.net.UidDetail;
import com.android.settings.net.UidDetailProvider;
import com.android.settings.widget.ChartDataUsageView;
import com.android.settings.widget.PieChartView;
import com.google.android.collect.Lists;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.datausage.OverViewTabAdapter;
import com.mediatek.settings.ext.ISettingsMiscExt;
import com.mediatek.settings.ext.ISimRoamingExt;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;
import libcore.util.Objects;

// Referenced classes of package com.android.settings:
//            Utils, HelpUtils

public class DataUsageSummary extends Fragment
{
    public static class AppDetailsFragment extends Fragment
    {

        private static final String EXTRA_APP = "app";

        public static void show(DataUsageSummary datausagesummary, AppItem appitem, CharSequence charsequence)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                Bundle bundle = new Bundle();
                bundle.putParcelable("app", appitem);
                AppDetailsFragment appdetailsfragment = new AppDetailsFragment();
                appdetailsfragment.setArguments(bundle);
                appdetailsfragment.setTargetFragment(datausagesummary, 0);
                FragmentTransaction fragmenttransaction = datausagesummary.getFragmentManager().beginTransaction();
                fragmenttransaction.add(appdetailsfragment, "appDetails");
                fragmenttransaction.addToBackStack("appDetails");
                fragmenttransaction.setBreadCrumbTitle(charsequence);
                fragmenttransaction.commitAllowingStateLoss();
                return;
            }
        }

        public void onStart()
        {
            super.onStart();
            DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
            datausagesummary.mCurrentApp = (AppItem)getArguments().getParcelable("app");
            Xlog.d("DataUsage", "AppDetailsFragment start ");
            datausagesummary.updateBody();
        }

        public void onStop()
        {
            super.onStop();
            DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
            datausagesummary.mCurrentApp = null;
            datausagesummary.updateBody();
        }

    }

    public static class AppItem
        implements Comparable, Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public AppItem createFromParcel(Parcel parcel)
            {
                return new AppItem(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public AppItem[] newArray(int i)
            {
                return new AppItem[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        public final int key;
        public boolean restricted;
        public long total;
        public SparseBooleanArray uids;

        public void addUid(int i)
        {
            uids.put(i, true);
        }

        public int compareTo(AppItem appitem)
        {
            return Long.compare(appitem.total, total);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((AppItem)obj);
        }

        public int describeContents()
        {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(key);
            parcel.writeSparseBooleanArray(uids);
            parcel.writeLong(total);
        }


        public AppItem(int i)
        {
            uids = new SparseBooleanArray();
            key = i;
        }

        public AppItem(Parcel parcel)
        {
            uids = new SparseBooleanArray();
            key = parcel.readInt();
            uids = parcel.readSparseBooleanArray();
            total = parcel.readLong();
        }
    }

    public static class ConfirmAppRestrictFragment extends DialogFragment
    {

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                ConfirmAppRestrictFragment confirmapprestrictfragment = new ConfirmAppRestrictFragment();
                confirmapprestrictfragment.setTargetFragment(datausagesummary, 0);
                confirmapprestrictfragment.show(datausagesummary.getFragmentManager(), "confirmAppRestrict");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            String s = DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b5), "bgDataDialogTitle");
            String s1 = DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b6), "bgDataDialogMessage");
            builder.setTitle(s);
            builder.setMessage(s1);
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ConfirmAppRestrictFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
                    if (datausagesummary != null)
                        datausagesummary.setAppRestrictBackground(true);
                }

            
            {
                this$0 = ConfirmAppRestrictFragment.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

    }

    public static class ConfirmAutoSyncChangeFragment extends DialogFragment
    {

        private static final String SAVE_ENABLING = "enabling";
        private boolean mEnabling;

        public static void show(DataUsageSummary datausagesummary, boolean flag)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                ConfirmAutoSyncChangeFragment confirmautosyncchangefragment = new ConfirmAutoSyncChangeFragment();
                confirmautosyncchangefragment.mEnabling = flag;
                confirmautosyncchangefragment.setTargetFragment(datausagesummary, 0);
                confirmautosyncchangefragment.show(datausagesummary.getFragmentManager(), "confirmAutoSyncChange");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            if (bundle != null)
                mEnabling = bundle.getBoolean("enabling");
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            if (!mEnabling)
            {
                builder.setTitle(0x7f0b08ba);
                builder.setMessage(0x7f0b08bb);
            } else
            {
                builder.setTitle(0x7f0b08b8);
                builder.setMessage(0x7f0b08b9);
            }
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ConfirmAutoSyncChangeFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    ContentResolver.setMasterSyncAutomatically(mEnabling);
                }

            
            {
                this$0 = ConfirmAutoSyncChangeFragment.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            super.onSaveInstanceState(bundle);
            bundle.putBoolean("enabling", mEnabling);
        }


    }

    public static class ConfirmDataDisableFragment extends DialogFragment
    {

        public static void show(DataUsageSummary datausagesummary)
        {
            show(datausagesummary, -1);
        }

        public static void show(DataUsageSummary datausagesummary, int i)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                ConfirmDataDisableFragment confirmdatadisablefragment = new ConfirmDataDisableFragment();
                confirmdatadisablefragment.setTargetFragment(datausagesummary, i);
                confirmdatadisablefragment.show(datausagesummary.getFragmentManager(), "confirmDataDisable");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            builder.setMessage(0x7f0b08a2);
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ConfirmDataDisableFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DataUsageSummary datausagesummary;
label0:
                    {
                        datausagesummary = (DataUsageSummary)getTargetFragment();
                        int j = getTargetRequestCode();
                        if (datausagesummary != null)
                        {
                            if (j == -1)
                                break label0;
                            datausagesummary.setMobileDataEnabled(j, false);
                        }
                        return;
                    }
                    datausagesummary.setMobileDataEnabled(false);
                }

            
            {
                this$0 = ConfirmDataDisableFragment.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

    }

    public static class ConfirmDataRoamingFragment extends DialogFragment
    {

        public static void show(DataUsageSummary datausagesummary)
        {
            show(datausagesummary, -1);
        }

        public static void show(DataUsageSummary datausagesummary, int i)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                ConfirmDataRoamingFragment confirmdataroamingfragment = new ConfirmDataRoamingFragment();
                confirmdataroamingfragment.setTargetFragment(datausagesummary, i);
                confirmdataroamingfragment.show(datausagesummary.getFragmentManager(), "confirmDataRoaming");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            String s = DataUsageSummary.sSimRoamingExt.getRoamingWarningMsg(getActivity(), 0x7f0b0358);
            builder.setTitle(0x7f0b035a);
            if (Utils.hasMultipleUsers(activity))
                builder.setMessage(0x7f0b0359);
            else
                builder.setMessage(s);
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ConfirmDataRoamingFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DataUsageSummary datausagesummary;
label0:
                    {
                        datausagesummary = (DataUsageSummary)getTargetFragment();
                        int j = getTargetRequestCode();
                        if (datausagesummary != null)
                        {
                            if (j == -1)
                                break label0;
                            datausagesummary.setDataRoaming(j, true);
                        }
                        return;
                    }
                    datausagesummary.setDataRoaming(true);
                }

            
            {
                this$0 = ConfirmDataRoamingFragment.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

    }

    public static class ConfirmLimitFragment extends DialogFragment
    {

        private static final String EXTRA_LIMIT_BYTES = "limitBytes";
        private static final String EXTRA_MESSAGE = "message";

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
                return;
            Resources resources = datausagesummary.getResources();
            long l = (long)(1.2F * (float)datausagesummary.mPolicyEditor.getPolicy(datausagesummary.mTemplate).warningBytes);
            String s = datausagesummary.mCurrentTab;
            String s1;
            long l1;
            if ("3g".equals(s))
            {
                s1 = resources.getString(0x7f0b08c2);
                l1 = Math.max(0x140000000L, l);
            } else
            if ("4g".equals(s))
            {
                s1 = resources.getString(0x7f0b08c2);
                l1 = Math.max(0x140000000L, l);
            } else
            if (!"sim1".equals(s) && !"sim2".equals(s) && !"sim3".equals(s))
            {
                if ("mobile".equals(s))
                {
                    s1 = resources.getString(0x7f0b08c2);
                    l1 = Math.max(0x140000000L, l);
                } else
                {
                    throw new IllegalArgumentException((new StringBuilder()).append("unknown current tab: ").append(s).toString());
                }
            } else
            {
                s1 = resources.getString(0x7f0b08c2);
                l1 = Math.max(0x140000000L, l);
            }
            Bundle bundle = new Bundle();
            bundle.putCharSequence("message", s1);
            bundle.putLong("limitBytes", l1);
            ConfirmLimitFragment confirmlimitfragment = new ConfirmLimitFragment();
            confirmlimitfragment.setArguments(bundle);
            confirmlimitfragment.setTargetFragment(datausagesummary, 0);
            confirmlimitfragment.show(datausagesummary.getFragmentManager(), "confirmLimit");
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            CharSequence charsequence = getArguments().getCharSequence("message");
            long l = getArguments().getLong("limitBytes");
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            builder.setTitle(0x7f0b08c1);
            builder.setMessage(charsequence);
            builder.setPositiveButton(0x104000a, l. new android.content.DialogInterface.OnClickListener() {

                final ConfirmLimitFragment this$0;
                final long val$limitBytes;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
                    if (datausagesummary != null)
                        datausagesummary.setPolicyLimitBytes(limitBytes);
                }

            
            {
                this$0 = final_confirmlimitfragment;
                limitBytes = J.this;
                super();
            }
            }
);
            return builder.create();
        }

    }

    public static class ConfirmRestrictFragment extends DialogFragment
    {

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                ConfirmRestrictFragment confirmrestrictfragment = new ConfirmRestrictFragment();
                confirmrestrictfragment.setTargetFragment(datausagesummary, 0);
                confirmrestrictfragment.show(datausagesummary.getFragmentManager(), "confirmRestrict");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            builder.setTitle(DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08c3), "bgDataDialogTitle"));
            String s = DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08c4), "bgDataMenuDialogMessage");
            if (Utils.hasMultipleUsers(activity))
                builder.setMessage(0x7f0b08c5);
            else
                builder.setMessage(s);
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ConfirmRestrictFragment this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
                    if (datausagesummary != null)
                        datausagesummary.setRestrictBackground(true);
                }

            
            {
                this$0 = ConfirmRestrictFragment.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

    }

    public static class CycleAdapter extends ArrayAdapter
    {

        private final CycleChangeItem mChangeItem;
        private boolean mChangePossible;
        private boolean mChangeVisible;

        private void updateChange()
        {
            remove(mChangeItem);
            if (mChangePossible && mChangeVisible)
                add(mChangeItem);
        }

        public int findNearestPosition(CycleItem cycleitem)
        {
            if (cycleitem != null)
            {
                for (int i = -1 + getCount(); i >= 0; i--)
                {
                    CycleItem cycleitem1 = (CycleItem)getItem(i);
                    if (!(cycleitem1 instanceof CycleChangeItem) && cycleitem1.compareTo(cycleitem) >= 0)
                        return i;
                }

            }
            return 0;
        }

        public void setChangePossible(boolean flag)
        {
            mChangePossible = flag;
            updateChange();
        }

        public void setChangeVisible(boolean flag)
        {
            mChangeVisible = flag;
            updateChange();
        }

        public CycleAdapter(Context context)
        {
            super(context, 0x1090008);
            mChangePossible = false;
            mChangeVisible = false;
            setDropDownViewResource(0x1090009);
            mChangeItem = new CycleChangeItem(context);
        }
    }

    public static class CycleChangeItem extends CycleItem
    {

        public CycleChangeItem(Context context)
        {
            super(context.getString(0x7f0b089c));
        }
    }

    public static class CycleEditorFragment extends DialogFragment
    {

        private static final String EXTRA_TEMPLATE = "template";

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                Bundle bundle = new Bundle();
                bundle.putParcelable("template", datausagesummary.mTemplate);
                CycleEditorFragment cycleeditorfragment = new CycleEditorFragment();
                cycleeditorfragment.setArguments(bundle);
                cycleeditorfragment.setTargetFragment(datausagesummary, 0);
                cycleeditorfragment.show(datausagesummary.getFragmentManager(), "cycleEditor");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
            final NetworkPolicyEditor editor = datausagesummary.mPolicyEditor;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            View view = LayoutInflater.from(builder.getContext()).inflate(0x7f040029, null, false);
            final NumberPicker cycleDayPicker = (NumberPicker)view.findViewById(0x7f080052);
            final NetworkTemplate template = (NetworkTemplate)getArguments().getParcelable("template");
            int i = editor.getPolicyCycleDay(template);
            cycleDayPicker.setMinValue(1);
            cycleDayPicker.setMaxValue(31);
            cycleDayPicker.setValue(i);
            cycleDayPicker.setWrapSelectorWheel(true);
            builder.setTitle(0x7f0b08bc);
            builder.setView(view);
            builder.setPositiveButton(0x7f0b08be, datausagesummary. new android.content.DialogInterface.OnClickListener() {

                final CycleEditorFragment this$0;
                final NumberPicker val$cycleDayPicker;
                final NetworkPolicyEditor val$editor;
                final DataUsageSummary val$target;
                final NetworkTemplate val$template;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    cycleDayPicker.clearFocus();
                    int j = cycleDayPicker.getValue();
                    String s = (new Time()).timezone;
                    editor.setPolicyCycleDay(template, j, s);
                    target.updatePolicy(true);
                }

            
            {
                this$0 = final_cycleeditorfragment;
                cycleDayPicker = numberpicker;
                editor = networkpolicyeditor;
                template = networktemplate;
                target = DataUsageSummary.this;
                super();
            }
            }
);
            return builder.create();
        }

    }

    public static class CycleItem
        implements Comparable
    {

        public long end;
        public CharSequence label;
        public long start;

        public int compareTo(CycleItem cycleitem)
        {
            return Long.compare(start, cycleitem.start);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((CycleItem)obj);
        }

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof CycleItem;
            boolean flag1 = false;
            if (flag)
            {
                CycleItem cycleitem = (CycleItem)obj;
                int i = start != cycleitem.start;
                flag1 = false;
                if (i == 0)
                {
                    int j = end != cycleitem.end;
                    flag1 = false;
                    if (j == 0)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public String toString()
        {
            return label.toString();
        }

        public CycleItem(Context context, long l, long l1)
        {
            label = DataUsageSummary.formatDateRange(context, l, l1);
            start = l;
            end = l1;
        }

        CycleItem(CharSequence charsequence)
        {
            label = charsequence;
        }
    }

    public static class DataUsageAdapter extends BaseAdapter
    {

        private final int mInsetSide;
        private ArrayList mItems;
        private long mLargest;
        private final UidDetailProvider mProvider;

        public void bindStats(NetworkStats networkstats, int ai[])
        {
            mItems.clear();
            int i = ActivityManager.getCurrentUser();
            SparseArray sparsearray = new SparseArray();
            android.net.NetworkStats.Entry entry = null;
            int j;
            if (networkstats != null)
                j = networkstats.size();
            else
                j = 0;
            for (int k = 0; k < j; k++)
            {
                entry = networkstats.getValues(k, entry);
                int k1 = entry.uid;
                int i2;
                if (UserHandle.isApp(k1))
                {
                    if (UserHandle.getUserId(k1) == i)
                        i2 = k1;
                    else
                        i2 = UidDetailProvider.buildKeyForUser(UserHandle.getUserId(k1));
                } else
                if (k1 != -4 && k1 != -5)
                    i2 = 1000;
                else
                    i2 = k1;
                AppItem appitem1 = (AppItem)sparsearray.get(i2);
                if (appitem1 == null)
                {
                    appitem1 = new AppItem(i2);
                    mItems.add(appitem1);
                    sparsearray.put(appitem1.key, appitem1);
                }
                appitem1.addUid(k1);
                appitem1.total = appitem1.total + (entry.rxBytes + entry.txBytes);
            }

            int l = ai.length;
            for (int i1 = 0; i1 < l; i1++)
            {
                int j1 = ai[i1];
                if (UserHandle.getUserId(j1) != i)
                    continue;
                AppItem appitem = (AppItem)sparsearray.get(j1);
                if (appitem == null)
                {
                    appitem = new AppItem(j1);
                    appitem.total = -1L;
                    mItems.add(appitem);
                    sparsearray.put(appitem.key, appitem);
                }
                appitem.restricted = true;
            }

            Collections.sort(mItems);
            long l1;
            if (mItems.size() > 0)
                l1 = ((AppItem)mItems.get(0)).total;
            else
                l1 = 0L;
            mLargest = l1;
            notifyDataSetChanged();
        }

        public int getCount()
        {
            return mItems.size();
        }

        public Object getItem(int i)
        {
            return mItems.get(i);
        }

        public long getItemId(int i)
        {
            return (long)((AppItem)mItems.get(i)).key;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            if (view == null)
            {
                view = LayoutInflater.from(viewgroup.getContext()).inflate(0x7f04002d, viewgroup, false);
                if (mInsetSide > 0)
                    view.setPadding(mInsetSide, 0, mInsetSide, 0);
            }
            Context context = viewgroup.getContext();
            TextView textview = (TextView)view.findViewById(0x1020014);
            ProgressBar progressbar = (ProgressBar)view.findViewById(0x102000d);
            AppItem appitem = (AppItem)mItems.get(i);
            UidDetailTask.bindView(mProvider, appitem, view);
            if (appitem.restricted && appitem.total <= 0L)
            {
                textview.setText(0x7f0b08a1);
                progressbar.setVisibility(8);
            } else
            {
                textview.setText(android.text.format.Formatter.formatFileSize(context, appitem.total));
                progressbar.setVisibility(0);
            }
            int j = mLargest != 0L;
            int k = 0;
            if (j != 0)
                k = (int)((100L * appitem.total) / mLargest);
            progressbar.setProgress(k);
            return view;
        }

        public DataUsageAdapter(UidDetailProvider uiddetailprovider, int i)
        {
            mItems = Lists.newArrayList();
            mProvider = (UidDetailProvider)Preconditions.checkNotNull(uiddetailprovider);
            mInsetSide = i;
        }
    }

    public static class DeniedRestrictFragment extends DialogFragment
    {

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                DeniedRestrictFragment deniedrestrictfragment = new DeniedRestrictFragment();
                deniedrestrictfragment.setTargetFragment(datausagesummary, 0);
                deniedrestrictfragment.show(datausagesummary.getFragmentManager(), "deniedRestrict");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            builder.setTitle(DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b2), "bgDataSwitch"));
            builder.setMessage(DataUsageSummary.sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b7), "bgDataRestrictDenyMessage"));
            builder.setPositiveButton(0x104000a, null);
            return builder.create();
        }

    }

    public static class LimitEditorFragment extends DialogFragment
    {

        private static final String EXTRA_TEMPLATE = "template";

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                Bundle bundle = new Bundle();
                bundle.putParcelable("template", datausagesummary.mTemplate);
                LimitEditorFragment limiteditorfragment = new LimitEditorFragment();
                limiteditorfragment.setArguments(bundle);
                limiteditorfragment.setTargetFragment(datausagesummary, 0);
                limiteditorfragment.show(datausagesummary.getFragmentManager(), "limitEditor");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
            final NetworkPolicyEditor editor = datausagesummary.mPolicyEditor;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            View view = LayoutInflater.from(builder.getContext()).inflate(0x7f040027, null, false);
            final NumberPicker bytesPicker = (NumberPicker)view.findViewById(0x7f080048);
            final NetworkTemplate template = (NetworkTemplate)getArguments().getParcelable("template");
            long l = editor.getPolicyWarningBytes(template);
            long l1 = editor.getPolicyLimitBytes(template);
            bytesPicker.setMaxValue(0xf9c00);
            if (l != -1L && l1 > 0L)
                bytesPicker.setMinValue(1 + (int)(l / 0x100000L));
            else
                bytesPicker.setMinValue(0);
            bytesPicker.setValue((int)(l1 / 0x100000L));
            bytesPicker.setWrapSelectorWheel(false);
            builder.setTitle(0x7f0b08c0);
            builder.setView(view);
            builder.setPositiveButton(0x7f0b08be, datausagesummary. new android.content.DialogInterface.OnClickListener() {

                final LimitEditorFragment this$0;
                final NumberPicker val$bytesPicker;
                final NetworkPolicyEditor val$editor;
                final DataUsageSummary val$target;
                final NetworkTemplate val$template;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    bytesPicker.clearFocus();
                    long l = 0x100000L * (long)bytesPicker.getValue();
                    editor.setPolicyLimitBytes(template, l);
                    target.updatePolicy(false);
                }

            
            {
                this$0 = final_limiteditorfragment;
                bytesPicker = numberpicker;
                editor = networkpolicyeditor;
                template = networktemplate;
                target = DataUsageSummary.this;
                super();
            }
            }
);
            return builder.create();
        }

    }

    private static class UidDetailTask extends AsyncTask
    {

        private final AppItem mItem;
        private final UidDetailProvider mProvider;
        private final View mTarget;

        private static void bindView(UidDetail uiddetail, View view)
        {
            ImageView imageview = (ImageView)view.findViewById(0x1020006);
            TextView textview = (TextView)view.findViewById(0x1020016);
            if (uiddetail != null)
            {
                imageview.setImageDrawable(uiddetail.icon);
                textview.setText(uiddetail.label);
                return;
            } else
            {
                imageview.setImageDrawable(null);
                textview.setText(null);
                return;
            }
        }

        public static void bindView(UidDetailProvider uiddetailprovider, AppItem appitem, View view)
        {
            UidDetailTask uiddetailtask = (UidDetailTask)view.getTag();
            if (uiddetailtask != null)
                uiddetailtask.cancel(false);
            UidDetail uiddetail = uiddetailprovider.getUidDetail(appitem.key, false);
            if (uiddetail != null)
            {
                bindView(uiddetail, view);
                return;
            } else
            {
                view.setTag((new UidDetailTask(uiddetailprovider, appitem, view)).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]));
                return;
            }
        }

        protected transient UidDetail doInBackground(Void avoid[])
        {
            return mProvider.getUidDetail(mItem.key, true);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected void onPostExecute(UidDetail uiddetail)
        {
            bindView(uiddetail, mTarget);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((UidDetail)obj);
        }

        protected void onPreExecute()
        {
            bindView(null, mTarget);
        }

        private UidDetailTask(UidDetailProvider uiddetailprovider, AppItem appitem, View view)
        {
            mProvider = (UidDetailProvider)Preconditions.checkNotNull(uiddetailprovider);
            mItem = (AppItem)Preconditions.checkNotNull(appitem);
            mTarget = (View)Preconditions.checkNotNull(view);
        }
    }

    public static class WarningEditorFragment extends DialogFragment
    {

        private static final String EXTRA_TEMPLATE = "template";

        public static void show(DataUsageSummary datausagesummary)
        {
            if (!datausagesummary.isAdded())
            {
                return;
            } else
            {
                Bundle bundle = new Bundle();
                bundle.putParcelable("template", datausagesummary.mTemplate);
                WarningEditorFragment warningeditorfragment = new WarningEditorFragment();
                warningeditorfragment.setArguments(bundle);
                warningeditorfragment.setTargetFragment(datausagesummary, 0);
                warningeditorfragment.show(datausagesummary.getFragmentManager(), "warningEditor");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            DataUsageSummary datausagesummary = (DataUsageSummary)getTargetFragment();
            final NetworkPolicyEditor editor = datausagesummary.mPolicyEditor;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            View view = LayoutInflater.from(builder.getContext()).inflate(0x7f040027, null, false);
            final NumberPicker bytesPicker = (NumberPicker)view.findViewById(0x7f080048);
            final NetworkTemplate template = (NetworkTemplate)getArguments().getParcelable("template");
            long l = editor.getPolicyWarningBytes(template);
            long l1 = editor.getPolicyLimitBytes(template);
            bytesPicker.setMinValue(0);
            if (l1 != -1L)
            {
                if (l1 == 0L)
                    bytesPicker.setMaxValue(0);
                else
                    bytesPicker.setMaxValue(-1 + (int)(l1 / 0x100000L));
            } else
            {
                bytesPicker.setMaxValue(0xe1000);
            }
            bytesPicker.setValue((int)(l / 0x100000L));
            bytesPicker.setWrapSelectorWheel(false);
            builder.setTitle(0x7f0b08bf);
            builder.setView(view);
            builder.setPositiveButton(0x7f0b08be, datausagesummary. new android.content.DialogInterface.OnClickListener() {

                final WarningEditorFragment this$0;
                final NumberPicker val$bytesPicker;
                final NetworkPolicyEditor val$editor;
                final DataUsageSummary val$target;
                final NetworkTemplate val$template;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    bytesPicker.clearFocus();
                    long l = 0x100000L * (long)bytesPicker.getValue();
                    editor.setPolicyWarningBytes(template, l);
                    target.updatePolicy(false);
                }

            
            {
                this$0 = final_warningeditorfragment;
                bytesPicker = numberpicker;
                editor = networkpolicyeditor;
                template = networktemplate;
                target = DataUsageSummary.this;
                super();
            }
            }
);
            return builder.create();
        }

    }


    private static final String ACTION_POLICYMGR_CREATED = "com.mediatek.server.action.ACTION_POLICY_CREATED";
    private static final int ATTACH_TIME_OUT_LENGTH = 30000;
    private static final int DETACH_TIME_OUT_LENGTH = 10000;
    private static final int EVENT_ATTACH_TIME_OUT = 2001;
    private static final int EVENT_DETACH_TIME_OUT = 2000;
    private static final int LIMIT_MAX_SIZE = 0xf9c00;
    private static final int LOADER_CHART_DATA = 2;
    private static final int LOADER_SUMMARY = 3;
    private static final boolean LOGD = true;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final String PREF_FILE = "data_usage";
    private static final String PREF_SHOW_ETHERNET = "show_ethernet";
    private static final String PREF_SHOW_WIFI = "show_wifi";
    private static final String TAB_3G = "3g";
    private static final String TAB_4G = "4g";
    private static final String TAB_ETHERNET = "ethernet";
    private static final String TAB_MOBILE = "mobile";
    private static final String TAB_OVERVIEW = "Overview";
    private static final String TAB_SIM_1 = "sim1";
    private static final String TAB_SIM_2 = "sim2";
    private static final String TAB_SIM_3 = "sim3";
    private static final String TAB_WIFI = "wifi";
    private static final String TAG = "DataUsage";
    private static final String TAG_APP_DETAILS = "appDetails";
    private static final String TAG_BG_DATA_APP_DIALOG_MESSAGE = "bgDataDialogMessage";
    private static final String TAG_BG_DATA_APP_DIALOG_TITLE = "bgDataDialogTitle";
    private static final String TAG_BG_DATA_MENU_DIALOG_MESSAGE = "bgDataMenuDialogMessage";
    private static final String TAG_BG_DATA_RESTRICT_DENY_MESSAGE = "bgDataRestrictDenyMessage";
    private static final String TAG_BG_DATA_SUMMARY = "bgDataSummary";
    private static final String TAG_BG_DATA_SWITCH = "bgDataSwitch";
    private static final String TAG_CONFIRM_APP_RESTRICT = "confirmAppRestrict";
    private static final String TAG_CONFIRM_AUTO_SYNC_CHANGE = "confirmAutoSyncChange";
    private static final String TAG_CONFIRM_DATA_DISABLE = "confirmDataDisable";
    private static final String TAG_CONFIRM_DATA_ROAMING = "confirmDataRoaming";
    private static final String TAG_CONFIRM_LIMIT = "confirmLimit";
    private static final String TAG_CONFIRM_RESTRICT = "confirmRestrict";
    private static final String TAG_CYCLE_EDITOR = "cycleEditor";
    private static final String TAG_DENIED_RESTRICT = "deniedRestrict";
    private static final String TAG_LIMIT_EDITOR = "limitEditor";
    private static final String TAG_WARNING_EDITOR = "warningEditor";
    private static final boolean TEST_ANIM = false;
    private static final boolean TEST_RADIOS = false;
    private static final String TEST_RADIOS_PROP = "test.radios";
    private static final String TEST_SUBSCRIBER_PROP = "test.subscriberid";
    private static final int WARNING_MAX_SIZE = 0xe1000;
    private static final StringBuilder sBuilder;
    private static final Formatter sFormatter;
    private static boolean sIsSwitching = false;
    private static boolean sIsWifiOnly = false;
    private static ISettingsMiscExt sSettingsMiscExt;
    private static ISimRoamingExt sSimRoamingExt;
    private DataUsageAdapter mAdapter;
    private ContentObserver mAirplaneObserver;
    private TextView mAppBackground;
    private View mAppDetail;
    private TextView mAppForeground;
    private ImageView mAppIcon;
    private PieChartView mAppPieChart;
    private CheckBox mAppRestrict;
    private android.view.View.OnClickListener mAppRestrictListener;
    private View mAppRestrictView;
    private Button mAppSettings;
    private Intent mAppSettingsIntent;
    private android.view.View.OnClickListener mAppSettingsListener;
    private LinearLayout mAppSwitches;
    private ViewGroup mAppTitles;
    private boolean mBinding;
    private CellConnMgr mCellConnMgr;
    private ChartDataUsageView mChart;
    private ChartData mChartData;
    private final android.app.LoaderManager.LoaderCallbacks mChartDataCallbacks = new android.app.LoaderManager.LoaderCallbacks() {

        final DataUsageSummary this$0;

        public Loader onCreateLoader(int i, Bundle bundle)
        {
            return new ChartDataLoader(getActivity(), mStatsSession, bundle);
        }

        public void onLoadFinished(Loader loader, ChartData chartdata)
        {
            Xlog.d("DataUsage", "ChartDataLoader finished ");
            mChartData = chartdata;
            mChart.bindNetworkStats(mChartData.network);
            mChart.bindDetailNetworkStats(mChartData.detail);
            mPolicyEditor.read();
            updatePolicy(true);
            updateAppDetail();
            if (mChartData.detail != null && mListView.getScrollY() == 0)
                mListView.smoothScrollToPosition(0);
        }

        public volatile void onLoadFinished(Loader loader, Object obj)
        {
            onLoadFinished(loader, (ChartData)obj);
        }

        public void onLoaderReset(Loader loader)
        {
            mChartData = null;
            mChart.bindNetworkStats(null);
            mChart.bindDetailNetworkStats(null);
        }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
    }
;
    private com.android.settings.widget.ChartDataUsageView.DataUsageChartListener mChartListener;
    private ConnectivityManager mConnService;
    private AppItem mCurrentApp;
    private String mCurrentTab;
    private CycleAdapter mCycleAdapter;
    private CycleAdapter mCycleAdapterOther;
    private CycleAdapter mCycleAdapterSim1;
    private CycleAdapter mCycleAdapterSim2;
    private CycleAdapter mCycleAdapterSim3;
    private android.widget.AdapterView.OnItemSelectedListener mCycleListener;
    private Spinner mCycleSpinner;
    private View mCycleView;
    private ContentObserver mDataConnectionObserver;
    private Switch mDataEnabled;
    private android.widget.CompoundButton.OnCheckedChangeListener mDataEnabledListener;
    private View mDataEnabledView;
    private CheckBox mDisableAtLimit;
    private android.view.View.OnClickListener mDisableAtLimitListener;
    private View mDisableAtLimitView;
    private TextView mEmpty;
    private android.widget.TabHost.TabContentFactory mEmptyTabContent;
    private ContentObserver mGprsDefaultSIMObserver;
    private boolean mHaveMobileSim;
    private ViewGroup mHeader;
    private ITelephony mITelephony;
    private int mInsetSide;
    private IntentFilter mIntentFilter;
    private String mIntentTab;
    private boolean mIsAirplaneModeOn;
    private boolean mIsLimitChangeToChecked;
    private boolean mIsUserEnabled;
    private android.widget.AdapterView.OnItemClickListener mListListener;
    private ListView mListView;
    private Switch mLockScreenEnabled;
    private TextView mLockScreenPrefTitle;
    private MenuItem mMenuAutoSync;
    private MenuItem mMenuDataRoaming;
    private MenuItem mMenuRestrictBackground;
    private Boolean mMobileDataEnabled;
    private INetworkManagementService mNetworkService;
    private LinearLayout mNetworkSwitches;
    private ViewGroup mNetworkSwitchesContainer;
    private ExpandableListView mOverViewExpList;
    private OverViewTabAdapter mOverviewAdapter;
    private NetworkPolicyEditor mPolicyEditor;
    private NetworkPolicyManager mPolicyManager;
    private SharedPreferences mPrefs;
    private String mSavedCurrentTab;
    private boolean mShowEthernet;
    private View mShowOnLockScreenView;
    private boolean mShowWifi;
    private BroadcastReceiver mSimReceiver;
    private INetworkStatsService mStatsService;
    private INetworkStatsSession mStatsSession;
    private final android.app.LoaderManager.LoaderCallbacks mSummaryCallbacks = new android.app.LoaderManager.LoaderCallbacks() {

        final DataUsageSummary this$0;

        private void updateEmptyVisible()
        {
            boolean flag;
            if (mAdapter.isEmpty() && !isAppDetailMode())
                flag = true;
            else
                flag = false;
            TextView textview = mEmpty;
            byte byte0 = 0;
            if (!flag)
                byte0 = 8;
            textview.setVisibility(byte0);
        }

        public Loader onCreateLoader(int i, Bundle bundle)
        {
            return new SummaryForAllUidLoader(getActivity(), mStatsSession, bundle);
        }

        public void onLoadFinished(Loader loader, NetworkStats networkstats)
        {
            Xlog.d("DataUsage", "SummaryForAllUidLoader finished");
            int ai[] = mPolicyManager.getUidsWithPolicy(1);
            mAdapter.bindStats(networkstats, ai);
            updateEmptyVisible();
        }

        public volatile void onLoadFinished(Loader loader, Object obj)
        {
            onLoadFinished(loader, (NetworkStats)obj);
        }

        public void onLoaderReset(Loader loader)
        {
            mAdapter.bindStats(null, new int[0]);
            updateEmptyVisible();
        }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
    }
;
    private TabHost mTabHost;
    private android.widget.TabHost.OnTabChangeListener mTabListener;
    private TabWidget mTabWidget;
    private ViewGroup mTabsContainer;
    private TelephonyManagerEx mTelephonyManager;
    private NetworkTemplate mTemplate;
    private Handler mTimerHandler;
    private UidDetailProvider mUidDetailProvider;
    private TextView mUsageSummary;

    public DataUsageSummary()
    {
        mInsetSide = 0;
        mIsLimitChangeToChecked = false;
        mShowWifi = false;
        mShowEthernet = false;
        mCurrentApp = null;
        mCurrentTab = null;
        mIntentTab = null;
        mIsUserEnabled = false;
        mSavedCurrentTab = null;
        mHaveMobileSim = false;
        mGprsDefaultSIMObserver = new ContentObserver(new Handler()) {

            final DataUsageSummary this$0;

            public void onChange(boolean flag)
            {
                Xlog.i("DataUsage", "Gprs connection SIM changed");
                mIsUserEnabled = false;
                mSavedCurrentTab = mTabHost.getCurrentTabTag();
                updateBody();
            }

            
            {
                this$0 = DataUsageSummary.this;
                super(handler);
            }
        }
;
        mDataConnectionObserver = new ContentObserver(new Handler()) {

            final DataUsageSummary this$0;

            public void onChange(boolean flag)
            {
                Xlog.i("DataUsage", (new StringBuilder()).append("Data connection state changed(none gemini mode)").append(mConnService.getMobileDataEnabled()).toString());
                updatePolicy(false);
            }

            
            {
                this$0 = DataUsageSummary.this;
                super(handler);
            }
        }
;
        mAirplaneObserver = new ContentObserver(new Handler()) {

            final DataUsageSummary this$0;

            public void onChange(boolean flag)
            {
                Xlog.i("DataUsage", "airplane mode changed");
                updateBody();
            }

            
            {
                this$0 = DataUsageSummary.this;
                super(handler);
            }
        }
;
        mSimReceiver = new BroadcastReceiver() {

            final DataUsageSummary this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                Xlog.d("DataUsage", (new StringBuilder()).append("Receive broadcast , action =  ").append(s).toString());
                boolean flag1;
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    int i = intent.getIntExtra("slotId", -1);
                    int j = intent.getIntExtra("state", -1);
                    Xlog.i("DataUsage", (new StringBuilder()).append("receive notification: state of sim slot ").append(i).append(" is ").append(j).toString());
                    flag1 = false;
                    if (i >= 0)
                    {
                        flag1 = false;
                        if (j >= 0)
                            flag1 = true;
                    }
                } else
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    mIsAirplaneModeOn = isAirplaneModeOn(getActivity());
                    flag1 = true;
                } else
                if (s.equals("com.mediatek.server.action.ACTION_POLICY_CREATED"))
                {
                    mPolicyEditor.read();
                    CycleAdapter cycleadapter = mCycleAdapter;
                    flag1 = false;
                    if (cycleadapter != null)
                    {
                        updatePolicy(true);
                        flag1 = false;
                    }
                } else
                if (s.equals("android.intent.action.ANY_DATA_STATE"))
                {
                    String s1 = intent.getStringExtra("apnType");
                    String s2 = intent.getStringExtra("state");
                    com.android.internal.telephony.PhoneConstants.DataState datastate;
                    if (s2 != null)
                        datastate = (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s2);
                    else
                        datastate = com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
                    intent.getIntExtra("simId", -1);
                    if ("default".equals(s1) && datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED && DataUsageSummary.sIsSwitching)
                    {
                        mTimerHandler.removeMessages(2001);
                        DataUsageSummary.sIsSwitching = false;
                        mDataEnabled.setEnabled(true);
                        if (mCycleAdapter != null)
                            updatePolicy(true);
                        Xlog.d("DataUsage", "attach over");
                    }
                    boolean flag2 = "default".equals(s1);
                    flag1 = false;
                    if (flag2)
                    {
                        com.android.internal.telephony.PhoneConstants.DataState datastate1 = com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
                        flag1 = false;
                        if (datastate == datastate1)
                        {
                            boolean flag3 = DataUsageSummary.sIsSwitching;
                            flag1 = false;
                            if (flag3)
                            {
                                mTimerHandler.removeMessages(2000);
                                DataUsageSummary.sIsSwitching = false;
                                mDataEnabled.setEnabled(true);
                                if (mCycleAdapter != null)
                                    updatePolicy(true);
                                Xlog.d("DataUsage", "detach over");
                                flag1 = false;
                            }
                        }
                    }
                } else
                {
                    boolean flag = s.equals("android.intent.action.SIM_INFO_UPDATE");
                    flag1 = false;
                    if (flag)
                    {
                        mSavedCurrentTab = mTabHost.getCurrentTabTag();
                        if (isRemainInserted(mSavedCurrentTab))
                        {
                            Xlog.d("DataUsage", "set mSavedCurrentTab null when sim hotswap for gemini");
                            mSavedCurrentTab = null;
                        }
                        updateTabs();
                        updateBody();
                        flag1 = false;
                    }
                }
                if (flag1)
                {
                    mSavedCurrentTab = mTabHost.getCurrentTabTag();
                    Xlog.d("DataUsage", (new StringBuilder()).append("set mSavedCurrentTab = ").append(mSavedCurrentTab).toString());
                    updateBody();
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mEmptyTabContent = new android.widget.TabHost.TabContentFactory() {

            final DataUsageSummary this$0;

            public View createTabContent(String s)
            {
                return new View(mTabHost.getContext());
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mTabListener = new android.widget.TabHost.OnTabChangeListener() {

            final DataUsageSummary this$0;

            public void onTabChanged(String s)
            {
                Xlog.d("DataUsage", "tab changed listener , start to update body");
                updateBody();
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mTimerHandler = new Handler() {

            final DataUsageSummary this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2000: 
                case 2001: 
                    Xlog.d("DataUsage", "timer expired update switch enabled");
                    mDataEnabled.setEnabled(true);
                    DataUsageSummary.sIsSwitching = false;
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mDataEnabledListener = new android.widget.CompoundButton.OnCheckedChangeListener() {

            final DataUsageSummary this$0;

            public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
            {
                if (mBinding)
                {
                    return;
                } else
                {
                    String s = mCurrentTab;
                    Xlog.d("DataUsage", (new StringBuilder()).append("Data enable check change ").append(s).append(" ").append(flag).toString());
                    int i = getCurrentSlot(mCurrentTab);
                    onDataEnableChangeGemini(flag, i);
                    updatePolicy(true);
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mDisableAtLimitListener = new android.view.View.OnClickListener() {

            final DataUsageSummary this$0;

            public void onClick(View view)
            {
                boolean flag;
                if (!mDisableAtLimit.isChecked())
                    flag = true;
                else
                    flag = false;
                if (flag)
                {
                    ConfirmLimitFragment.show(DataUsageSummary.this);
                    return;
                } else
                {
                    setPolicyLimitBytes(-1L);
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mAppRestrictListener = new android.view.View.OnClickListener() {

            final DataUsageSummary this$0;

            public void onClick(View view)
            {
                boolean flag;
                if (!mAppRestrict.isChecked())
                    flag = true;
                else
                    flag = false;
                if (flag)
                {
                    ConfirmAppRestrictFragment.show(DataUsageSummary.this);
                    return;
                } else
                {
                    setAppRestrictBackground(false);
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mAppSettingsListener = new android.view.View.OnClickListener() {

            final DataUsageSummary this$0;

            public void onClick(View view)
            {
                if (!isAdded())
                {
                    return;
                } else
                {
                    startActivity(mAppSettingsIntent);
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mListListener = new android.widget.AdapterView.OnItemClickListener() {

            final DataUsageSummary this$0;

            public void onItemClick(AdapterView adapterview, View view, int i, long l)
            {
                view.getContext();
                AppItem appitem = (AppItem)adapterview.getItemAtPosition(i);
                if (mUidDetailProvider != null && appitem != null)
                {
                    UidDetail uiddetail = mUidDetailProvider.getUidDetail(appitem.key, true);
                    AppDetailsFragment.show(DataUsageSummary.this, appitem, uiddetail.label);
                    return;
                } else
                {
                    return;
                }
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mCycleListener = new android.widget.AdapterView.OnItemSelectedListener() {

            final DataUsageSummary this$0;

            public void onItemSelected(AdapterView adapterview, View view, int i, long l)
            {
                CycleItem cycleitem = (CycleItem)adapterview.getItemAtPosition(i);
                if (cycleitem instanceof CycleChangeItem)
                {
                    CycleEditorFragment.show(DataUsageSummary.this);
                    mCycleSpinner.setSelection(0);
                    return;
                } else
                {
                    Log.d("DataUsage", (new StringBuilder()).append("showing cycle ").append(cycleitem).append(", start=").append(cycleitem.start).append(", end=").append(cycleitem.end).append("]").toString());
                    mChart.setVisibleRange(cycleitem.start, cycleitem.end);
                    updateDetailData();
                    return;
                }
            }

            public void onNothingSelected(AdapterView adapterview)
            {
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
        mChartListener = new com.android.settings.widget.ChartDataUsageView.DataUsageChartListener() {

            final DataUsageSummary this$0;

            public void onInspectRangeChanged()
            {
                Log.d("DataUsage", "onInspectRangeChanged()");
                updateDetailData();
            }

            public void onLimitChanged()
            {
                long l = mChart.getLimitBytes();
                Xlog.d("DataUsage", (new StringBuilder()).append("onLimitChanged(),limitBytes = ").append(l).toString());
                if (l != 0L && l < 0x100000L)
                {
                    Xlog.d("DataUsage", "set limitBytes = 0 , when it < 1MB && != 0");
                    l = 0L;
                }
                setPolicyLimitBytes(l);
            }

            public void onWarningChanged()
            {
                setPolicyWarningBytes(mChart.getWarningBytes());
            }

            public void requestLimitEdit()
            {
                LimitEditorFragment.show(DataUsageSummary.this);
            }

            public void requestWarningEdit()
            {
                WarningEditorFragment.show(DataUsageSummary.this);
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
;
    }

    private static LayoutTransition buildLayoutTransition()
    {
        LayoutTransition layouttransition = new LayoutTransition();
        layouttransition.setAnimateParentHierarchy(false);
        return layouttransition;
    }

    private List buildLimitedNetworksList()
    {
        Activity activity = getActivity();
        ArrayList arraylist = Lists.newArrayList();
        if (TelephonyManager.from(activity).getSimState() == 5)
        {
            String s = getActiveSubscriberId(activity);
            if (isSimInserted(0) && hasLimitedPolicy(0))
                arraylist.add(getText(0x7f0b08ac));
            if (isSimInserted(1) && hasLimitedPolicy(1))
                arraylist.add(getText(0x7f0b08ac));
            if (mPolicyEditor.hasLimitedPolicy(NetworkTemplate.buildTemplateMobile3gLower(s)))
                arraylist.add(getText(0x7f0b08ab));
            if (mPolicyEditor.hasLimitedPolicy(NetworkTemplate.buildTemplateMobile4g(s)))
                arraylist.add(getText(0x7f0b08aa));
        }
        if (mPolicyEditor.hasLimitedPolicy(NetworkTemplate.buildTemplateWifiWildcard()))
            arraylist.add(getText(0x7f0b08a7));
        if (mPolicyEditor.hasLimitedPolicy(NetworkTemplate.buildTemplateEthernet()))
            arraylist.add(getText(0x7f0b08a8));
        return arraylist;
    }

    private CharSequence buildLimitedNetworksString()
    {
        List list = buildLimitedNetworksList();
        if (list.isEmpty())
            list.add(getText(0x7f0b08ad));
        return TextUtils.join(list);
    }

    private android.widget.TabHost.TabSpec buildTabSpec(String s, int i)
    {
        return mTabHost.newTabSpec(s).setIndicator(getText(i)).setContent(mEmptyTabContent);
    }

    private android.widget.TabHost.TabSpec buildTabSpec(String s, String s1)
    {
        android.widget.TabHost.TabSpec tabspec = mTabHost.newTabSpec(s).setIndicator(s1);
        android.widget.TabHost.TabSpec tabspec1 = sSettingsMiscExt.DataUsageUpdateTabInfo(getActivity(), s, tabspec, mTabWidget, s1);
        tabspec1.setContent(mEmptyTabContent);
        return tabspec1;
    }

    private boolean checkMtkLockScreenApkExist()
    {
        Activity activity = getActivity();
        try
        {
            activity.getPackageManager().getApplicationInfo("com.mediatek.DataUsageLockScreenClient", 8192);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Xlog.d("DataUsage", "ClassNotFoundException happens,MTK Keyguard did not install");
            return false;
        }
        return true;
    }

    private String computeTabFromIntent(Intent intent)
    {
        NetworkTemplate networktemplate = (NetworkTemplate)intent.getParcelableExtra("android.net.NETWORK_TEMPLATE");
        if (networktemplate == null)
            return null;
        switch (networktemplate.getMatchRule())
        {
        case 4: // '\004'
            return "wifi";

        case 3: // '\003'
            return "4g";

        case 2: // '\002'
            return "3g";

        case 1: // '\001'
            String s = networktemplate.getSubscriberId();
            Xlog.d("DataUsage", (new StringBuilder()).append("computeTabFromIntent, subscriber ").append(s).toString());
            if (s == null)
            {
                Xlog.e("DataUsage", "the subscriber error , null!");
                return "sim1";
            }
            if (s.equals(getSubscriberId(0)))
                return "sim1";
            if (s.equals(getSubscriberId(1)))
            {
                return "sim2";
            } else
            {
                Xlog.e("DataUsage", "the subscriber error , no matching!");
                return "sim1";
            }
        }
        return null;
    }

    private void ensureLayoutTransitions()
    {
        if (mChart.getLayoutTransition() != null)
        {
            return;
        } else
        {
            mTabsContainer.setLayoutTransition(buildLayoutTransition());
            mHeader.setLayoutTransition(buildLayoutTransition());
            mNetworkSwitchesContainer.setLayoutTransition(buildLayoutTransition());
            LayoutTransition layouttransition = buildLayoutTransition();
            layouttransition.disableTransitionType(2);
            layouttransition.disableTransitionType(3);
            mChart.setLayoutTransition(layouttransition);
            return;
        }
    }

    public static String formatDateRange(Context context, long l, long l1)
    {
        String s;
        synchronized (sBuilder)
        {
            sBuilder.setLength(0);
            s = DateUtils.formatDateRange(context, sFormatter, l, l1, 0x10010, null).toString();
        }
        return s;
        exception;
        stringbuilder;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static String getActiveSubscriberId(Context context)
    {
        return SystemProperties.get("test.subscriberid", TelephonyManager.from(context).getSubscriberId());
    }

    private boolean getAppRestrictBackground()
    {
        int i = mCurrentApp.key;
        return (1 & mPolicyManager.getUidPolicy(i)) != 0;
    }

    private int getCurrentSlot(String s)
    {
        if (!"sim1".equals(s))
        {
            if ("sim2".equals(s))
                return 1;
            if ("sim3".equals(s))
                return 2;
        }
        return 0;
    }

    private boolean getDataRoaming()
    {
        int i = android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "data_roaming", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private boolean getDataRoaming(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        Xlog.d("DataUsage", (new StringBuilder()).append("get data Roaming for slotId = ").append(i).append(" ,result = ").append(siminfo.mDataRoaming).toString());
        return siminfo.mDataRoaming == 1;
    }

    private boolean getEnableStateInProvider(String s)
    {
        int i = 1;
        if (!"sim1".equals(s)) goto _L2; else goto _L1
_L1:
        int k = android.provider.Settings.System.getInt(getActivity().getContentResolver(), "data_usage_on_lockscreen_sim1");
        i = k;
_L4:
        StringBuilder stringbuilder = (new StringBuilder()).append("currentTab : ").append(s).append(" lock screen state ON : ");
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        boolean flag;
        int j;
        if (i == 1)
            flag = true;
        else
            flag = false;
        Xlog.d("DataUsage", stringbuilder.append(flag).toString());
        return i == 1;
_L2:
        if (!"sim2".equals(s)) goto _L4; else goto _L3
_L3:
        j = android.provider.Settings.System.getInt(getActivity().getContentResolver(), "data_usage_on_lockscreen_sim2");
        i = j;
          goto _L4
        settingnotfoundexception;
        Xlog.d("DataUsage", "Get data from provider failure");
        i = 0;
          goto _L4
    }

    private int getSimIndicatorState(int i)
    {
        int j = -1;
        int k;
        if (mITelephony == null)
            break MISSING_BLOCK_LABEL_24;
        k = mITelephony.getSimIndicatorStateGemini(i);
        j = k;
_L2:
        Xlog.d("DataUsage", (new StringBuilder()).append("getSimIndicator() slotId = ").append(i).append(" ,simIndicatorState = ").append(j).toString());
        return j;
        RemoteException remoteexception;
        remoteexception;
        Xlog.e("DataUsage", "RemoteException");
        continue; /* Loop/switch isn't completed */
        NullPointerException nullpointerexception;
        nullpointerexception;
        Xlog.e("DataUsage", "NullPointerException");
        if (true) goto _L2; else goto _L1
_L1:
    }

    private String getSubscriberId(int i)
    {
        String s = TelephonyManagerEx.getDefault().getSubscriberId(i);
        Xlog.d("DataUsage", (new StringBuilder()).append("getSubscriberId() slotId : ").append(i).append("  imsiId : ").append(s).toString());
        return s;
    }

    private boolean hasLimitedNetworks()
    {
        return !buildLimitedNetworksList().isEmpty();
    }

    private boolean hasLimitedPolicy(int i)
    {
        NetworkPolicyEditor networkpolicyeditor = mPolicyEditor;
        boolean flag = false;
        if (networkpolicyeditor != null)
            flag = mPolicyEditor.hasLimitedPolicy(NetworkTemplate.buildTemplateMobileAll(getSubscriberId(i)));
        return flag;
    }

    public static boolean hasReadyMobile4gRadio(Context context)
    {
        return false;
    }

    public static boolean hasReadyMobileRadio(Context context)
    {
        ConnectivityManager connectivitymanager = ConnectivityManager.from(context);
        TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
        boolean flag;
        if (telephonymanagerex.getSimState(0) == 5)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (telephonymanagerex.getSimState(1) == 5)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (!flag && !flag1)
            flag2 = false;
        else
            flag2 = true;
        return connectivitymanager.isNetworkSupported(0) && flag2;
    }

    public static boolean hasWifiRadio(Context context)
    {
        return ConnectivityManager.from(context).isNetworkSupported(1);
    }

    private static View inflateAppTitle(LayoutInflater layoutinflater, ViewGroup viewgroup, CharSequence charsequence)
    {
        TextView textview = (TextView)layoutinflater.inflate(0x7f040026, viewgroup, false);
        textview.setText(charsequence);
        return textview;
    }

    private void inflateLockScreenView(LayoutInflater layoutinflater)
    {
        if (mNetworkSwitches != null)
        {
            mLockScreenEnabled = new Switch(layoutinflater.getContext());
            mShowOnLockScreenView = inflatePreference(layoutinflater, mNetworkSwitches, mLockScreenEnabled);
            mShowOnLockScreenView.setClickable(true);
            mShowOnLockScreenView.setFocusable(true);
            mLockScreenEnabled.setChecked(getEnableStateInProvider(mTabHost.getCurrentTabTag()));
            mLockScreenEnabled.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

                final DataUsageSummary this$0;

                public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
                {
                    String s = mTabHost.getCurrentTabTag();
                    String s1 = "data_usage_on_lockscreen_sim1";
                    if ("sim1".equals(s))
                        s1 = "data_usage_on_lockscreen_sim1";
                    else
                    if ("sim2".equals(s))
                        s1 = "data_usage_on_lockscreen_sim2";
                    ContentResolver contentresolver = getActivity().getContentResolver();
                    int i;
                    if (flag)
                        i = 1;
                    else
                        i = 0;
                    android.provider.Settings.System.putInt(contentresolver, s1, i);
                    Xlog.d("DataUsage", (new StringBuilder()).append("lockScreenTag: ").append(s1).append(" isChecked:").append(flag).toString());
                }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
            }
);
            mLockScreenPrefTitle = (TextView)mShowOnLockScreenView.findViewById(0x1020016);
            mLockScreenPrefTitle.setText(0x7f0b0182);
            mNetworkSwitches.addView(mShowOnLockScreenView);
        }
    }

    private static View inflatePreference(LayoutInflater layoutinflater, ViewGroup viewgroup, View view)
    {
        View view1 = layoutinflater.inflate(0x7f04005b, viewgroup, false);
        ((LinearLayout)view1.findViewById(0x1020018)).addView(view, new android.widget.LinearLayout.LayoutParams(-2, -2));
        return view1;
    }

    private static void insetListViewDrawables(ListView listview, int i)
    {
        android.graphics.drawable.Drawable drawable = listview.getSelector();
        android.graphics.drawable.Drawable drawable1 = listview.getDivider();
        ColorDrawable colordrawable = new ColorDrawable(0);
        listview.setSelector(colordrawable);
        listview.setDivider(colordrawable);
        listview.setSelector(new InsetBoundsDrawable(drawable, i));
        listview.setDivider(new InsetBoundsDrawable(drawable1, i));
    }

    private boolean isAppDetailMode()
    {
        return mCurrentApp != null;
    }

    private boolean isBandwidthControlEnabled()
    {
        boolean flag;
        try
        {
            flag = mNetworkService.isBandwidthControlEnabled();
        }
        catch (RemoteException remoteexception)
        {
            Log.w("DataUsage", (new StringBuilder()).append("problem talking with INetworkManagementService: ").append(remoteexception).toString());
            return false;
        }
        return flag;
    }

    private boolean isMobileDataEnabled()
    {
        Xlog.d("DataUsage", (new StringBuilder()).append("no gemini mobile data state = ").append(mConnService.getMobileDataEnabled()).toString());
        return mConnService.getMobileDataEnabled();
    }

    private boolean isMobileDataEnabled(int i)
    {
        boolean flag = mConnService.getMobileDataEnabledGemini(i);
        Xlog.d("DataUsage", (new StringBuilder()).append("isMoblieDataEnabled for slotId ").append(i).append(" ").append(flag).toString());
        return flag;
    }

    private boolean isMobilePolicySplit()
    {
        Activity activity = getActivity();
        if (hasReadyMobileRadio(activity))
        {
            TelephonyManager.from(activity);
            return mPolicyEditor.isMobilePolicySplit(getActiveSubscriberId(activity));
        } else
        {
            return false;
        }
    }

    private boolean isNeedtoShowRoamingMsg()
    {
        boolean flag = ((TelephonyManager)getActivity().getSystemService("phone")).isNetworkRoaming();
        boolean flag1 = getDataRoaming();
        Xlog.d("DataUsage", (new StringBuilder()).append("isInRoaming=").append(flag).append(" isRoamingEnabled=").append(flag1).toString());
        return flag && !flag1;
    }

    private boolean isNetworkPolicyModifiable(NetworkPolicy networkpolicy)
    {
        boolean flag;
        if (!isSimStatusNotReady(mCurrentTab))
            flag = true;
        else
            flag = false;
        Xlog.i("DataUsage", (new StringBuilder()).append("isNetworkPolicyModifiable(), policy : ").append(networkpolicy).append(" , isSimReady ").append(flag).toString());
        return networkpolicy != null && flag && isBandwidthControlEnabled() && mDataEnabled.isChecked() && ActivityManager.getCurrentUser() == 0;
    }

    private boolean isRemainInserted(String s)
    {
        boolean flag;
        if ("sim1".equals(s))
        {
            boolean flag3 = isSimInserted(0);
            flag = false;
            if (!flag3)
                flag = true;
        } else
        if ("sim2".equals(s))
        {
            boolean flag2 = isSimInserted(1);
            flag = false;
            if (!flag2)
                flag = true;
        } else
        if ("sim3".equals(s))
        {
            boolean flag1 = isSimInserted(2);
            flag = false;
            if (!flag1)
                flag = true;
        } else
        {
            Xlog.d("DataUsage", "savedTab is not current cared tab");
            flag = false;
        }
        Xlog.d("DataUsage", (new StringBuilder()).append("savedTab = ").append(s).append(" clearSavedTab = ").append(flag).toString());
        return flag;
    }

    private boolean isSimInserted(int i)
    {
        ITelephony itelephony = mITelephony;
        boolean flag = false;
        if (itelephony != null)
        {
            boolean flag1;
            try
            {
                flag1 = mITelephony.isSimInsert(i);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.i("DataUsage", "RemoteException happens......");
                return false;
            }
            flag = flag1;
        }
        return flag;
    }

    private boolean isSimStatusNotReady(String s)
    {
        boolean flag = true;
        if ("sim1".equals(s))
        {
            if (getSimIndicatorState(0) == 1)
                flag = true;
            else
                flag = false;
        } else
        if ("sim2".equals(s))
        {
            if (getSimIndicatorState(1) == 1)
                flag = true;
            else
                flag = false;
        } else
        if ("sim3".equals(s))
            if (getSimIndicatorState(2) == 1)
                flag = true;
            else
                flag = false;
        return mIsAirplaneModeOn || flag;
    }

    private void onDataEnableChangeGemini(boolean flag, int i)
    {
        if (isMobileDataEnabled(i) == flag)
            return;
        if (flag)
        {
            if (getSimIndicatorState(i) == 2)
            {
                mCellConnMgr.handleCellConn(i, 302);
                Xlog.d("DataUsage", "Data enable check change request pin");
                mDataEnabled.setChecked(false);
                return;
            } else
            {
                setMobileDataEnabled(i, true);
                mIsUserEnabled = true;
                return;
            }
        } else
        {
            ConfirmDataDisableFragment.show(this, i);
            return;
        }
    }

    private void setAppRestrictBackground(boolean flag)
    {
        Log.d("DataUsage", "setAppRestrictBackground()");
        int i = mCurrentApp.key;
        NetworkPolicyManager networkpolicymanager = mPolicyManager;
        int j;
        if (flag)
            j = 1;
        else
            j = 0;
        networkpolicymanager.setUidPolicy(i, j);
        mAppRestrict.setChecked(flag);
    }

    private void setDataRoaming(int i, boolean flag)
    {
        Xlog.d("DataUsage", (new StringBuilder()).append("set data Romaing for ").append(i).append(" result ").append(flag).toString());
        android.provider.Telephony.SIMInfo siminfo;
        if (mITelephony != null)
            try
            {
                mITelephony.setDataRoamingEnabledGemini(flag, i);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("DataUsage", "data roaming setting remote exception");
            }
        else
            Xlog.e("DataUsage", "iTelephony is null , error !");
        siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        if (flag)
        {
            android.provider.Telephony.SIMInfo.setDataRoaming(getActivity(), 1, siminfo.mSimId);
            return;
        } else
        {
            android.provider.Telephony.SIMInfo.setDataRoaming(getActivity(), 0, siminfo.mSimId);
            return;
        }
    }

    private void setDataRoaming(boolean flag)
    {
        ContentResolver contentresolver = getActivity().getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "data_roaming", i);
        mMenuDataRoaming.setChecked(flag);
    }

    private void setLockScreenState(boolean flag, boolean flag1)
    {
        mLockScreenEnabled.setEnabled(flag);
        mLockScreenEnabled.setChecked(flag1);
        mLockScreenPrefTitle.setEnabled(flag);
    }

    private void setMobileDataEnabled(int i, boolean flag)
    {
        Xlog.d("DataUsage", (new StringBuilder()).append("setMobileDataEnabled for slotId ").append(i).append(" ").append(flag).toString());
        sIsSwitching = true;
        if (flag)
        {
            mConnService.setMobileDataEnabledGemini(i);
            mTimerHandler.sendEmptyMessageDelayed(2001, 30000L);
        } else
        {
            mConnService.setMobileDataEnabledGemini(-1);
            mTimerHandler.sendEmptyMessageDelayed(2000, 10000L);
            mIsUserEnabled = false;
        }
        updatePolicy(false);
    }

    private void setMobileDataEnabled(boolean flag)
    {
        Log.d("DataUsage", "setMobileDataEnabled()");
        mConnService.setMobileDataEnabled(flag);
        updatePolicy(false);
    }

    private void setMobilePolicySplit(boolean flag)
    {
        Activity activity = getActivity();
        if (hasReadyMobileRadio(activity))
        {
            TelephonyManager.from(activity);
            mPolicyEditor.setMobilePolicySplit(getActiveSubscriberId(activity), flag);
        }
    }

    private void setPolicyLimitBytes(long l)
    {
        Log.d("DataUsage", (new StringBuilder()).append("setPolicyLimitBytes() , limitBytes = ").append(l).toString());
        mPolicyEditor.setPolicyLimitBytes(mTemplate, l);
        updatePolicy(false);
    }

    private void setPolicyWarningBytes(long l)
    {
        Log.d("DataUsage", (new StringBuilder()).append("setPolicyWarningBytes() , warningBytes = ").append(l).toString());
        mPolicyEditor.setPolicyWarningBytes(mTemplate, l);
        updatePolicy(false);
    }

    private static void setPreferenceSummary(View view, CharSequence charsequence)
    {
        TextView textview = (TextView)view.findViewById(0x1020010);
        textview.setVisibility(0);
        textview.setText(charsequence);
    }

    private static void setPreferenceTitle(View view, int i)
    {
        ((TextView)view.findViewById(0x1020016)).setText(i);
    }

    private void updateAppDetail()
    {
label0:
        {
            Xlog.d("DataUsage", "updateAppDetail()");
            Activity activity = getActivity();
            PackageManager packagemanager = activity.getPackageManager();
            LayoutInflater layoutinflater = getActivity().getLayoutInflater();
            if (!isAppDetailMode())
                break label0;
            mAppDetail.setVisibility(0);
            mCycleAdapter.setChangeVisible(false);
            mChart.bindNetworkPolicy(null);
            int i = mCurrentApp.key;
            UidDetail uiddetail = mUidDetailProvider.getUidDetail(i, true);
            mAppIcon.setImageDrawable(uiddetail.icon);
            mAppTitles.removeAllViews();
            if (uiddetail.detailLabels != null)
            {
                CharSequence acharsequence[] = uiddetail.detailLabels;
                int l = acharsequence.length;
                for (int i1 = 0; i1 < l; i1++)
                {
                    CharSequence charsequence = acharsequence[i1];
                    mAppTitles.addView(inflateAppTitle(layoutinflater, mAppTitles, charsequence));
                }

            } else
            {
                mAppTitles.addView(inflateAppTitle(layoutinflater, mAppTitles, uiddetail.label));
            }
            String as[] = packagemanager.getPackagesForUid(i);
            if (as != null && as.length > 0)
            {
                mAppSettingsIntent = new Intent("android.intent.action.MANAGE_NETWORK_USAGE");
                mAppSettingsIntent.addCategory("android.intent.category.DEFAULT");
                int j = as.length;
                int k = 0;
label1:
                do
                {
label2:
                    {
                        boolean flag = false;
                        if (k < j)
                        {
                            String s2 = as[k];
                            mAppSettingsIntent.setPackage(s2);
                            if (packagemanager.resolveActivity(mAppSettingsIntent, 0) == null)
                                break label2;
                            flag = true;
                        }
                        mAppSettings.setEnabled(flag);
                        mAppSettings.setVisibility(0);
                        break label1;
                    }
                    k++;
                } while (true);
            } else
            {
                mAppSettingsIntent = null;
                mAppSettings.setVisibility(8);
            }
            updateDetailData();
            if (UserHandle.isApp(i) && !mPolicyManager.getRestrictBackground() && isBandwidthControlEnabled() && hasReadyMobileRadio(activity))
            {
                String s = sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b2), "bgDataSwitch");
                ((TextView)mAppRestrictView.findViewById(0x1020016)).setText(s);
                String s1 = sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b3), "bgDataSummary");
                setPreferenceSummary(mAppRestrictView, s1);
                mAppRestrictView.setVisibility(0);
                mAppRestrict.setChecked(getAppRestrictBackground());
            } else
            {
                mAppRestrictView.setVisibility(8);
            }
            Xlog.d("DataUsage", "updateAppDetail done");
            return;
        }
        mAppDetail.setVisibility(8);
        mCycleAdapter.setChangeVisible(true);
        mChart.bindDetailNetworkStats(null);
    }

    private void updateBody()
    {
        String s;
label0:
        {
            mBinding = true;
            if (!isAdded())
                return;
            Activity activity = getActivity();
            s = mTabHost.getCurrentTabTag();
            boolean flag;
            if (ActivityManager.getCurrentUser() == 0)
                flag = true;
            else
                flag = false;
            Xlog.d("DataUsage", (new StringBuilder()).append("updateBody(), currentTab = ").append(s).append(" , mSavedCurrentTab = ").append(mSavedCurrentTab).append(" , sIsSwitching = ").append(sIsSwitching).toString());
            if (s == null)
            {
                Log.w("DataUsage", "no tab selected; hiding body");
                mListView.setVisibility(8);
                return;
            }
            mListView.setVisibility(0);
            if (!s.equals(mCurrentTab));
            mCurrentTab = s;
            View view = mDataEnabledView;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            view.setVisibility(byte0);
            TelephonyManager.from(activity);
            mCycleAdapter = mCycleAdapterOther;
            if ("sim1".equals(s))
                updateDataSwitchState(mCycleAdapterSim1, 0);
            else
            if ("sim2".equals(s))
                updateDataSwitchState(mCycleAdapterSim2, 1);
            else
            if ("sim3".equals(s))
                updateDataSwitchState(mCycleAdapterSim3, 2);
            else
            if ("mobile".equals(s))
            {
                setPreferenceTitle(mDisableAtLimitView, 0x7f0b08a3);
                if (isAirplaneModeOn(getActivity()))
                {
                    mDataEnabledView.setVisibility(8);
                    mDisableAtLimitView.setVisibility(8);
                } else
                {
                    setPreferenceTitle(mDataEnabledView, 0x7f0b08ae);
                }
                mTemplate = NetworkTemplate.buildTemplateMobileAll(getActiveSubscriberId(activity));
            } else
            if ("3g".equals(s))
            {
                setPreferenceTitle(mDataEnabledView, 0x7f0b08af);
                setPreferenceTitle(mDisableAtLimitView, 0x7f0b08a5);
                mTemplate = NetworkTemplate.buildTemplateMobile3gLower(getActiveSubscriberId(activity));
            } else
            if ("4g".equals(s))
            {
                setPreferenceTitle(mDataEnabledView, 0x7f0b08b0);
                setPreferenceTitle(mDisableAtLimitView, 0x7f0b08a4);
                mTemplate = NetworkTemplate.buildTemplateMobile4g(getActiveSubscriberId(activity));
            } else
            if ("wifi".equals(s))
            {
                mDataEnabledView.setVisibility(8);
                mDisableAtLimitView.setVisibility(8);
                mTemplate = NetworkTemplate.buildTemplateWifiWildcard();
            } else
            {
                if (!"ethernet".equals(s))
                    break label0;
                mDataEnabledView.setVisibility(8);
                mDisableAtLimitView.setVisibility(8);
                mTemplate = NetworkTemplate.buildTemplateEthernet();
            }
            mCycleSpinner.setAdapter(mCycleAdapter);
            getLoaderManager().restartLoader(2, ChartDataLoader.buildArgs(mTemplate, mCurrentApp), mChartDataCallbacks);
            getActivity().invalidateOptionsMenu();
            mBinding = false;
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("unknown tab: ").append(s).toString());
    }

    private void updateCycleList(NetworkPolicy networkpolicy)
    {
        CycleItem cycleitem = (CycleItem)mCycleSpinner.getSelectedItem();
        mCycleAdapter.clear();
        Context context = mCycleSpinner.getContext();
        long l = 0x7fffffffffffffffL;
        long l1 = 0x8000000000000000L;
        if (mChartData != null)
        {
            l = mChartData.network.getStart();
            l1 = mChartData.network.getEnd();
        }
        long l2 = System.currentTimeMillis();
        if (l == 0x7fffffffffffffffL)
            l = l2;
        if (l1 == 0x8000000000000000L)
            l1 = l2 + 1L;
        boolean flag = false;
        if (networkpolicy != null)
        {
            for (long l5 = NetworkPolicyManager.computeNextCycleBoundary(l1, networkpolicy); l5 > l;)
            {
                long l6 = NetworkPolicyManager.computeLastCycleBoundary(l5, networkpolicy);
                Log.d("DataUsage", (new StringBuilder()).append("generating cs=").append(l6).append(" to ce=").append(l5).append(" waiting for hs=").append(l).toString());
                mCycleAdapter.add(new CycleItem(context, l6, l5));
                l5 = l6;
                flag = true;
            }

            mCycleAdapter.setChangePossible(isNetworkPolicyModifiable(networkpolicy));
        }
        if (!flag)
        {
            long l4;
            for (long l3 = l1; l3 > l; l3 = l4)
            {
                l4 = l3 - 0x90321000L;
                mCycleAdapter.add(new CycleItem(context, l4, l3));
            }

            mCycleAdapter.setChangePossible(false);
        }
        if (mCycleAdapter.getCount() > 0)
        {
            int i = mCycleAdapter.findNearestPosition(cycleitem);
            mCycleSpinner.setSelection(i);
            if (!Objects.equal((CycleItem)mCycleAdapter.getItem(i), cycleitem))
            {
                mCycleListener.onItemSelected(mCycleSpinner, null, i, 0L);
                return;
            } else
            {
                updateDetailData();
                return;
            }
        } else
        {
            updateDetailData();
            return;
        }
    }

    private void updateDataSwitchState(CycleAdapter cycleadapter, int i)
    {
        boolean flag = true;
        if (!mIsAirplaneModeOn && getSimIndicatorState(i) != flag)
        {
            setPreferenceTitle(mDataEnabledView, 0x7f0b08ae);
            setPreferenceTitle(mDisableAtLimitView, 0x7f0b08a3);
        } else
        {
            mDataEnabledView.setVisibility(8);
            mDisableAtLimitView.setVisibility(8);
            Xlog.d("DataUsage", (new StringBuilder()).append("disable this sim enable because radio off ,slotId :").append(i).toString());
        }
        Switch switch1 = mDataEnabled;
        if (sIsSwitching)
            flag = false;
        switch1.setEnabled(flag);
        mCycleAdapter = cycleadapter;
        mTemplate = NetworkTemplate.buildTemplateMobileAll(getSubscriberId(i));
    }

    private void updateDetailData()
    {
        Log.d("DataUsage", "updateDetailData()");
        long l = mChart.getInspectStart();
        long l1 = mChart.getInspectEnd();
        long l2 = System.currentTimeMillis();
        Activity activity = getActivity();
        android.net.NetworkStatsHistory.Entry entry;
        if (isAppDetailMode() && mChartData != null && mChartData.detail != null)
        {
            android.net.NetworkStatsHistory.Entry entry1 = mChartData.detailDefault.getValues(l, l1, l2, null);
            long l4 = entry1.rxBytes + entry1.txBytes;
            android.net.NetworkStatsHistory.Entry entry2 = mChartData.detailForeground.getValues(l, l1, l2, entry1);
            long l5 = entry2.rxBytes + entry2.txBytes;
            mAppPieChart.setOriginAngle(175);
            mAppPieChart.removeAllSlices();
            mAppPieChart.addSlice(l5, Color.parseColor("#d88d3a"));
            mAppPieChart.addSlice(l4, Color.parseColor("#666666"));
            mAppPieChart.generatePath();
            mAppBackground.setText(android.text.format.Formatter.formatFileSize(activity, l4));
            mAppForeground.setText(android.text.format.Formatter.formatFileSize(activity, l5));
            entry = mChartData.detail.getValues(l, l1, l2, null);
            getLoaderManager().destroyLoader(3);
        } else
        {
            ChartData chartdata = mChartData;
            entry = null;
            if (chartdata != null)
                entry = mChartData.network.getValues(l, l1, l2, null);
            getLoaderManager().restartLoader(3, SummaryForAllUidLoader.buildArgs(mTemplate, l, l1), mSummaryCallbacks);
        }
        long l3;
        if (entry != null)
            l3 = entry.rxBytes + entry.txBytes;
        else
            l3 = 0L;
        String s = android.text.format.Formatter.formatFileSize(activity, l3);
        String s1 = formatDateRange(activity, l, l1);
        int i;
        if (!"mobile".equals(mCurrentTab) && !"3g".equals(mCurrentApp) && !"4g".equals(mCurrentApp))
            i = 0x7f0b08cb;
        else
            i = 0x7f0b08cc;
        TextView textview = mUsageSummary;
        Object aobj[] = {
            s, s1
        };
        textview.setText(getString(i, aobj));
        ensureLayoutTransitions();
    }

    private void updateLockScreenViewState(NetworkTemplate networktemplate, String s)
    {
        Xlog.d("DataUsage", "updateLockScreenViewState()");
        if (mShowOnLockScreenView != null && mLockScreenEnabled != null && !isSimStatusNotReady(s))
        {
            NetworkPolicy networkpolicy = mPolicyEditor.getPolicy(networktemplate);
            long l;
            if (networkpolicy != null)
                l = networkpolicy.limitBytes;
            else
                l = 0L;
            if (mDataEnabled.isChecked() && !isAppDetailMode())
            {
                if (mDisableAtLimit.isChecked())
                {
                    if (l == 0L)
                    {
                        setLockScreenState(false, false);
                        return;
                    }
                    boolean flag;
                    if (mIsLimitChangeToChecked)
                        flag = true;
                    else
                        flag = getEnableStateInProvider(s);
                    setLockScreenState(true, flag);
                    mIsLimitChangeToChecked = false;
                    return;
                } else
                {
                    setLockScreenState(false, false);
                    return;
                }
            } else
            {
                setLockScreenState(false, getEnableStateInProvider(s));
                return;
            }
        } else
        {
            return;
        }
    }

    private void updateLockScreenViewVisibility(String s)
    {
        byte byte0 = 8;
        Xlog.d("DataUsage", (new StringBuilder()).append("updateLockScreenViewVisibility() currentTab : ").append(s).toString());
        if (mShowOnLockScreenView == null)
            return;
        if ("wifi".equals(s))
        {
            mShowOnLockScreenView.setVisibility(byte0);
            return;
        }
        if (isSimStatusNotReady(s))
        {
            mShowOnLockScreenView.setVisibility(byte0);
            return;
        }
        View view = mShowOnLockScreenView;
        if (checkMtkLockScreenApkExist())
            byte0 = 0;
        view.setVisibility(byte0);
    }

    private void updatePolicy(boolean flag)
    {
        boolean flag1 = true;
        Xlog.d("DataUsage", (new StringBuilder()).append("updatePolicy() , refreshCycle = ").append(flag).append(" , mIsUserEnabled = ").append(mIsUserEnabled).toString());
        if (isAppDetailMode())
            mNetworkSwitches.setVisibility(8);
        else
            mNetworkSwitches.setVisibility(0);
        int i = getCurrentSlot(mCurrentTab);
        mBinding = flag1;
        Switch switch1 = mDataEnabled;
        boolean flag2;
        if (!isMobileDataEnabled(i) && !mIsUserEnabled)
            flag2 = false;
        else
            flag2 = flag1;
        switch1.setChecked(flag2);
        mBinding = false;
        NetworkPolicy networkpolicy = mPolicyEditor.getPolicy(mTemplate);
        if (mDisableAtLimitView == null)
        {
            Xlog.i("DataUsage", "mDisableAtLimitView should not be null here !!!");
        } else
        {
            if (isNetworkPolicyModifiable(networkpolicy))
            {
                Xlog.d("DataUsage", "network policy is modifiable, mobile data checkBox is on");
                mDisableAtLimitView.setVisibility(0);
                mPolicyEditor.setPolicyActive(networkpolicy);
                CheckBox checkbox = mDisableAtLimit;
                if (networkpolicy == null || networkpolicy.limitBytes == -1L)
                    flag1 = false;
                checkbox.setChecked(flag1);
                if (!isAppDetailMode())
                    mChart.bindNetworkPolicy(networkpolicy);
            } else
            {
                Xlog.d("DataUsage", "network policy not modifiable, no warning limit/sweeps.");
                mDisableAtLimitView.setVisibility(8);
                mChart.bindNetworkPolicy(null);
            }
            if (flag)
            {
                updateCycleList(networkpolicy);
                return;
            }
        }
    }

    private void updateTabs()
    {
        Xlog.d("DataUsage", "updateTabs()");
        Activity activity = getActivity();
        mTabHost.clearAllTabs();
        Xlog.d("DataUsage", "clear All Tabs...");
        if (!hasReadyMobileRadio(activity))
        {
            mShowWifi = hasWifiRadio(activity);
            mShowEthernet = hasEthernet(activity);
        }
        if (isMobilePolicySplit() && hasReadyMobile4gRadio(activity))
        {
            mTabHost.addTab(buildTabSpec("3g", 0x7f0b08ab));
            mTabHost.addTab(buildTabSpec("4g", 0x7f0b08aa));
        } else
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), 0);
            if (siminfo != null)
                mTabHost.addTab(buildTabSpec("sim1", siminfo.mDisplayName));
            android.provider.Telephony.SIMInfo siminfo1 = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), 1);
            if (siminfo1 != null)
                mTabHost.addTab(buildTabSpec("sim2", siminfo1.mDisplayName));
        }
        if (mShowWifi && hasWifiRadio(activity))
            mTabHost.addTab(buildTabSpec("wifi", 0x7f0b08a7));
        if (mShowEthernet && hasEthernet(activity))
            mTabHost.addTab(buildTabSpec("ethernet", 0x7f0b08a8));
        boolean flag;
        if (mTabWidget.getTabCount() == 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mTabWidget.getTabCount() > 1)
            flag1 = true;
        else
            flag1 = false;
        TabWidget tabwidget = mTabWidget;
        byte byte0 = 0;
        if (!flag1)
            byte0 = 8;
        tabwidget.setVisibility(byte0);
        Xlog.d("DataUsage", (new StringBuilder()).append("mIntentTab ").append(mIntentTab).append(" mSavedCurrentTab ").append(mSavedCurrentTab).toString());
        if (mIntentTab != null)
        {
            if (Objects.equal(mIntentTab, mTabHost.getCurrentTabTag()))
            {
                updateBody();
            } else
            {
                Xlog.d("DataUsage", "set Intent tab ");
                mTabHost.setCurrentTabByTag(mIntentTab);
            }
            mIntentTab = null;
        } else
        {
            if (mSavedCurrentTab != null)
            {
                Xlog.d("DataUsage", (new StringBuilder()).append("saved curernt tabs ").append(mSavedCurrentTab).append(" ").toString());
                if (!Objects.equal(mSavedCurrentTab, mTabHost.getCurrentTabTag()))
                    mTabHost.setCurrentTabByTag(mSavedCurrentTab);
                mSavedCurrentTab = null;
                updateBody();
                return;
            }
            if (flag)
            {
                updateBody();
                return;
            }
        }
    }

    public boolean hasEthernet(Context context)
    {
        boolean flag = ConnectivityManager.from(context).isNetworkSupported(9);
        long l;
        if (mStatsSession != null)
        {
            long l1;
            try
            {
                l1 = mStatsSession.getSummaryForNetwork(NetworkTemplate.buildTemplateEthernet(), 0x8000000000000000L, 0x7fffffffffffffffL).getTotalBytes();
            }
            catch (RemoteException remoteexception)
            {
                throw new RuntimeException(remoteexception);
            }
            l = l1;
        } else
        {
            l = 0L;
        }
        return flag && l > 0L;
    }

    public boolean isAirplaneModeOn(Context context)
    {
        int i = android.provider.Settings.System.getInt(context.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Activity activity = getActivity();
        mNetworkService = android.os.INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
        mStatsService = android.net.INetworkStatsService.Stub.asInterface(ServiceManager.getService("netstats"));
        mPolicyManager = NetworkPolicyManager.from(activity);
        mConnService = ConnectivityManager.from(activity);
        mPrefs = getActivity().getSharedPreferences("data_usage", 0);
        mTelephonyManager = TelephonyManagerEx.getDefault();
        mITelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("com.mediatek.server.action.ACTION_POLICY_CREATED");
        mIntentFilter.addAction("android.intent.action.ANY_DATA_STATE");
        mCellConnMgr = new CellConnMgr(null);
        mCellConnMgr.register(getActivity());
        mPolicyEditor = new NetworkPolicyEditor(mPolicyManager);
        mPolicyEditor.read();
        mShowWifi = mPrefs.getBoolean("show_wifi", false);
        mShowEthernet = mPrefs.getBoolean("show_ethernet", false);
        if (Utils.isWifiOnly(getActivity()))
            sIsWifiOnly = true;
        sSimRoamingExt = Utils.getSimRoamingExtPlugin(getActivity());
        sSettingsMiscExt = Utils.getMiscPlugin(getActivity());
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menuinflater.inflate(0x7f100000, menu);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        Xlog.d("DataUsage", "onCreateView");
        Context context = layoutinflater.getContext();
        View view = layoutinflater.inflate(0x7f04002e, viewgroup, false);
        mUidDetailProvider = new UidDetailProvider(context);
        boolean flag;
        try
        {
            mStatsSession = mStatsService.openSession();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        mTabHost = (TabHost)view.findViewById(0x1020012);
        mTabsContainer = (ViewGroup)view.findViewById(0x7f080060);
        mTabWidget = (TabWidget)view.findViewById(0x1020013);
        mListView = (ListView)view.findViewById(0x102000a);
        if (mListView.getScrollBarStyle() == 0x2000000)
            flag = true;
        else
            flag = false;
        if (flag)
            mInsetSide = view.getResources().getDimensionPixelOffset(0x1050029);
        else
            mInsetSide = 0;
        Utils.prepareCustomPreferencesList(viewgroup, view, mListView, true);
        mTabHost.setup();
        mTabHost.setOnTabChangedListener(mTabListener);
        mHeader = (ViewGroup)layoutinflater.inflate(0x7f04002c, mListView, false);
        mHeader.setClickable(true);
        mListView.addHeaderView(mHeader, null, true);
        mListView.setItemsCanFocus(true);
        mListView.setVerticalScrollBarEnabled(false);
        if (mInsetSide > 0)
        {
            insetListViewDrawables(mListView, mInsetSide);
            mHeader.setPadding(mInsetSide, 0, mInsetSide, 0);
        }
        mNetworkSwitchesContainer = (ViewGroup)mHeader.findViewById(0x7f08005d);
        mNetworkSwitches = (LinearLayout)mHeader.findViewById(0x7f08005e);
        mDataEnabled = new Switch(layoutinflater.getContext());
        mDataEnabledView = inflatePreference(layoutinflater, mNetworkSwitches, mDataEnabled);
        mDataEnabledView.setClickable(true);
        mDataEnabledView.setFocusable(true);
        mDataEnabled.setOnCheckedChangeListener(mDataEnabledListener);
        mNetworkSwitches.addView(mDataEnabledView);
        mDisableAtLimit = new CheckBox(layoutinflater.getContext());
        mDisableAtLimit.setClickable(false);
        mDisableAtLimit.setFocusable(false);
        mDisableAtLimitView = inflatePreference(layoutinflater, mNetworkSwitches, mDisableAtLimit);
        mDisableAtLimitView.setClickable(true);
        mDisableAtLimitView.setFocusable(true);
        mDisableAtLimitView.setOnClickListener(mDisableAtLimitListener);
        mNetworkSwitches.addView(mDisableAtLimitView);
        mCycleView = mHeader.findViewById(0x7f080053);
        mCycleSpinner = (Spinner)mCycleView.findViewById(0x7f080054);
        mCycleAdapterSim1 = new CycleAdapter(context);
        mCycleAdapterSim2 = new CycleAdapter(context);
        mCycleAdapterOther = new CycleAdapter(context);
        mCycleSpinner.setOnItemSelectedListener(mCycleListener);
        mChart = (ChartDataUsageView)mHeader.findViewById(0x7f08004a);
        mChart.setListener(mChartListener);
        mChart.bindNetworkPolicy(null);
        mAppDetail = mHeader.findViewById(0x7f080055);
        mAppIcon = (ImageView)mAppDetail.findViewById(0x7f080056);
        mAppTitles = (ViewGroup)mAppDetail.findViewById(0x7f080057);
        mAppPieChart = (PieChartView)mAppDetail.findViewById(0x7f08005a);
        mAppForeground = (TextView)mAppDetail.findViewById(0x7f080058);
        mAppBackground = (TextView)mAppDetail.findViewById(0x7f080059);
        mAppSwitches = (LinearLayout)mAppDetail.findViewById(0x7f08005c);
        mAppSettings = (Button)mAppDetail.findViewById(0x7f08005b);
        mAppSettings.setOnClickListener(mAppSettingsListener);
        mAppRestrict = new CheckBox(layoutinflater.getContext());
        mAppRestrict.setClickable(false);
        mAppRestrict.setFocusable(false);
        mAppRestrictView = inflatePreference(layoutinflater, mAppSwitches, mAppRestrict);
        mAppRestrictView.setClickable(true);
        mAppRestrictView.setFocusable(true);
        mAppRestrictView.setOnClickListener(mAppRestrictListener);
        mAppSwitches.addView(mAppRestrictView);
        mUsageSummary = (TextView)mHeader.findViewById(0x7f08005f);
        mEmpty = (TextView)mHeader.findViewById(0x1020004);
        mAdapter = new DataUsageAdapter(mUidDetailProvider, mInsetSide);
        mListView.setOnItemClickListener(mListListener);
        mListView.setAdapter(mAdapter);
        return view;
    }

    public void onDestroy()
    {
        Xlog.d("DataUsage", "onDestory");
        mDataEnabledView = null;
        mDisableAtLimitView = null;
        mUidDetailProvider.clearCache();
        mUidDetailProvider = null;
        TrafficStats.closeQuietly(mStatsSession);
        if (isRemoving())
            getFragmentManager().popBackStack("appDetails", 1);
        mCellConnMgr.unregister();
        getActivity().setRequestedOrientation(4);
        super.onDestroy();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231336: 
            if (ActivityManager.isUserAMonkey())
            {
                Log.d("SyncState", "ignoring monkey's attempt to flip global sync state");
                return true;
            }
            boolean flag7 = menuitem.isChecked();
            boolean flag8 = false;
            if (!flag7)
                flag8 = true;
            ConfirmAutoSyncChangeFragment.show(this, flag8);
            return true;

        case 2131231339: 
            ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/net/DataUsageMeteredSettings.getCanonicalName(), null, 0x7f0b08cd, null, this, 0);
            return true;

        case 2131231338: 
            boolean flag5 = menuitem.isChecked();
            boolean flag6 = false;
            if (!flag5)
                flag6 = true;
            mShowEthernet = flag6;
            mPrefs.edit().putBoolean("show_ethernet", mShowEthernet).apply();
            menuitem.setChecked(mShowEthernet);
            updateTabs();
            return true;

        case 2131231337: 
            boolean flag3 = menuitem.isChecked();
            boolean flag4 = false;
            if (!flag3)
                flag4 = true;
            mShowWifi = flag4;
            mPrefs.edit().putBoolean("show_wifi", mShowWifi).apply();
            menuitem.setChecked(mShowWifi);
            updateTabs();
            return true;

        case 2131231335: 
            boolean flag2;
            if (!menuitem.isChecked())
                flag2 = true;
            else
                flag2 = false;
            setMobilePolicySplit(flag2);
            menuitem.setChecked(isMobilePolicySplit());
            updateTabs();
            return true;

        case 2131231334: 
            boolean flag1;
            if (!menuitem.isChecked())
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
            {
                ConfirmRestrictFragment.show(this);
                return true;
            } else
            {
                setRestrictBackground(false);
                return true;
            }

        case 2131231333: 
            boolean flag;
            if (!menuitem.isChecked())
                flag = true;
            else
                flag = false;
            int i = getCurrentSlot(mTabHost.getCurrentTabTag());
            if (flag)
            {
                ConfirmDataRoamingFragment.show(this, i);
                return true;
            } else
            {
                setDataRoaming(i, false);
                return true;
            }
        }
        return false;
    }

    public void onPause()
    {
        Xlog.d("DataUsage", "onPause");
        super.onPause();
        mSavedCurrentTab = mTabHost.getCurrentTabTag();
        getActivity().getContentResolver().unregisterContentObserver(mGprsDefaultSIMObserver);
        getActivity().unregisterReceiver(mSimReceiver);
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        Xlog.d("DataUsage", "onPrepareOptionsMenu()");
        Activity activity = getActivity();
        boolean flag = isAppDetailMode();
        boolean flag1;
        if (ActivityManager.getCurrentUser() == 0)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2 = hasWifiRadio(activity);
        boolean flag3 = hasReadyMobileRadio(activity);
        mMenuDataRoaming = menu.findItem(0x7f080265);
        String s = mTabHost.getCurrentTabTag();
        boolean flag4 = isSimStatusNotReady(s);
        if (!flag && !flag4)
        {
            if (!"sim1".equals(s) && !"sim2".equals(s) && !"sim3".equals(s))
            {
                mMenuDataRoaming.setVisible(false);
            } else
            {
                int i = getCurrentSlot(s);
                android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
                Xlog.d("DataUsage", (new StringBuilder()).append("slotId : ").append(i).append(" simInfo : ").append(siminfo).toString());
                if (siminfo != null)
                {
                    String s3 = siminfo.mDisplayName;
                    mMenuDataRoaming.setTitle((new StringBuilder()).append(getString(0x7f0b0895)).append(" ").append(s3).toString());
                    mMenuDataRoaming.setChecked(getDataRoaming(i));
                    mMenuDataRoaming.setVisible(true);
                } else
                {
                    mMenuDataRoaming.setVisible(false);
                }
            }
        } else
        {
            mMenuDataRoaming.setVisible(false);
        }
        mMenuRestrictBackground = menu.findItem(0x7f080266);
        String s1 = sSettingsMiscExt.getDataUsageBackgroundStrByTag(getString(0x7f0b08b2), "bgDataSwitch");
        mMenuRestrictBackground.setTitle(s1);
        if (!sIsWifiOnly)
        {
            MenuItem menuitem6 = mMenuRestrictBackground;
            boolean flag10;
            if (flag3 && !flag)
                flag10 = true;
            else
                flag10 = false;
            menuitem6.setVisible(flag10);
            mMenuRestrictBackground.setChecked(mPolicyManager.getRestrictBackground());
            mMenuRestrictBackground.setVisible(flag1);
        } else
        {
            mMenuRestrictBackground.setVisible(false);
        }
        mMenuAutoSync = menu.findItem(0x7f080268);
        mMenuAutoSync.setChecked(ContentResolver.getMasterSyncAutomatically());
        MenuItem menuitem = mMenuAutoSync;
        boolean flag5;
        if (!flag)
            flag5 = true;
        else
            flag5 = false;
        menuitem.setVisible(flag5);
        MenuItem menuitem1 = menu.findItem(0x7f080267);
        boolean flag6;
        if (hasReadyMobile4gRadio(activity) && flag1 && !flag)
            flag6 = true;
        else
            flag6 = false;
        menuitem1.setVisible(flag6);
        menuitem1.setChecked(isMobilePolicySplit());
        MenuItem menuitem2 = menu.findItem(0x7f080269);
        if (flag2 && flag3)
        {
            boolean flag9;
            if (!flag)
                flag9 = true;
            else
                flag9 = false;
            menuitem2.setVisible(flag9);
            menuitem2.setChecked(mShowWifi);
        } else
        {
            menuitem2.setVisible(false);
        }
        MenuItem menuitem3 = menu.findItem(0x7f08026a);
        if (hasEthernet(activity) && flag3)
        {
            boolean flag8;
            if (!flag)
                flag8 = true;
            else
                flag8 = false;
            menuitem3.setVisible(flag8);
            menuitem3.setChecked(mShowEthernet);
        } else
        {
            menuitem3.setVisible(false);
        }
        MenuItem menuitem4 = menu.findItem(0x7f08026b);
        if (!flag3 && !flag2)
        {
            menuitem4.setVisible(false);
        } else
        {
            boolean flag7;
            if (!flag)
                flag7 = true;
            else
                flag7 = false;
            menuitem4.setVisible(flag7);
        }
        MenuItem menuitem5 = menu.findItem(0x7f08026c);
        String s2 = getResources().getString(0x7f0b092b);
        if (!TextUtils.isEmpty(s2))
        {
            HelpUtils.prepareHelpMenuItem(activity, menuitem5, s2);
            return;
        } else
        {
            menuitem5.setVisible(false);
            return;
        }
    }

    public void onResume()
    {
        super.onResume();
        Xlog.d("DataUsage", "onResume");
        mIsAirplaneModeOn = isAirplaneModeOn(getActivity());
        mIsUserEnabled = false;
        mIntentTab = computeTabFromIntent(getActivity().getIntent());
        updateTabs();
        (new AsyncTask() {

            final DataUsageSummary this$0;

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            protected transient Void doInBackground(Void avoid[])
            {
                try
                {
                    Thread.sleep(2000L);
                    mStatsService.forceUpdate();
                }
                catch (InterruptedException interruptedexception) { }
                catch (RemoteException remoteexception) { }
                return null;
            }

            protected volatile void onPostExecute(Object obj)
            {
                onPostExecute((Void)obj);
            }

            protected void onPostExecute(Void void1)
            {
                if (isAdded())
                    updateBody();
            }

            
            {
                this$0 = DataUsageSummary.this;
                super();
            }
        }
).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        getActivity().getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), false, mGprsDefaultSIMObserver);
        getActivity().registerReceiver(mSimReceiver, mIntentFilter);
    }

    public void setRestrictBackground(boolean flag)
    {
        mPolicyManager.setRestrictBackground(flag);
        mMenuRestrictBackground.setChecked(flag);
    }

    static 
    {
        sBuilder = new StringBuilder(50);
        sFormatter = new Formatter(sBuilder, Locale.getDefault());
    }


/*
    static boolean access$002(DataUsageSummary datausagesummary, boolean flag)
    {
        datausagesummary.mIsUserEnabled = flag;
        return flag;
    }

*/




/*
    static String access$102(DataUsageSummary datausagesummary, String s)
    {
        datausagesummary.mSavedCurrentTab = s;
        return s;
    }

*/






















/*
    static ChartData access$2902(DataUsageSummary datausagesummary, ChartData chartdata)
    {
        datausagesummary.mChartData = chartdata;
        return chartdata;
    }

*/










/*
    static AppItem access$3702(DataUsageSummary datausagesummary, AppItem appitem)
    {
        datausagesummary.mCurrentApp = appitem;
        return appitem;
    }

*/











/*
    static boolean access$602(DataUsageSummary datausagesummary, boolean flag)
    {
        datausagesummary.mIsAirplaneModeOn = flag;
        return flag;
    }

*/





/*
    static boolean access$902(boolean flag)
    {
        sIsSwitching = flag;
        return flag;
    }

*/
}
