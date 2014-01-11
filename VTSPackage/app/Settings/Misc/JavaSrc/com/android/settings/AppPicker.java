// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.*;
import android.os.Build;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import com.android.settings.applications.AppViewHolder;
import java.text.Collator;
import java.util.*;

public class AppPicker extends ListActivity
{
    public class AppListAdapter extends ArrayAdapter
    {

        private final LayoutInflater mInflater;
        private final List mPackageInfoList = new ArrayList();
        final AppPicker this$0;

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            AppViewHolder appviewholder = AppViewHolder.createOrRecycle(mInflater, view);
            View view1 = appviewholder.rootView;
            MyApplicationInfo myapplicationinfo = (MyApplicationInfo)getItem(i);
            appviewholder.appName.setText(myapplicationinfo.label);
            if (myapplicationinfo.info != null)
            {
                appviewholder.appIcon.setImageDrawable(myapplicationinfo.info.loadIcon(getPackageManager()));
                appviewholder.appSize.setText(((PackageItemInfo) (myapplicationinfo.info)).packageName);
            } else
            {
                appviewholder.appIcon.setImageDrawable(null);
                appviewholder.appSize.setText("");
            }
            appviewholder.disabled.setVisibility(8);
            appviewholder.checkBox.setVisibility(8);
            return view1;
        }

        public AppListAdapter(Context context)
        {
            this$0 = AppPicker.this;
            super(context, 0);
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
            List list = context.getPackageManager().getInstalledApplications(0);
            for (int i = 0; i < list.size(); i++)
            {
                ApplicationInfo applicationinfo = (ApplicationInfo)list.get(i);
                if (applicationinfo.uid != 1000 && ((2 & applicationinfo.flags) != 0 || !"user".equals(Build.TYPE)))
                {
                    MyApplicationInfo myapplicationinfo1 = new MyApplicationInfo();
                    myapplicationinfo1.info = applicationinfo;
                    myapplicationinfo1.label = myapplicationinfo1.info.loadLabel(getPackageManager()).toString();
                    mPackageInfoList.add(myapplicationinfo1);
                }
            }

            Collections.sort(mPackageInfoList, AppPicker.sDisplayNameComparator);
            MyApplicationInfo myapplicationinfo = new MyApplicationInfo();
            myapplicationinfo.label = context.getText(0x7f0b0863);
            mPackageInfoList.add(0, myapplicationinfo);
            addAll(mPackageInfoList);
        }
    }

    class MyApplicationInfo
    {

        ApplicationInfo info;
        CharSequence label;
        final AppPicker this$0;

        MyApplicationInfo()
        {
            this$0 = AppPicker.this;
            super();
        }
    }


    private static final Comparator sDisplayNameComparator = new Comparator() {

        private final Collator collator = Collator.getInstance();

        public final int compare(MyApplicationInfo myapplicationinfo, MyApplicationInfo myapplicationinfo1)
        {
            return collator.compare(myapplicationinfo.label, myapplicationinfo1.label);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((MyApplicationInfo)obj, (MyApplicationInfo)obj1);
        }

    }
;
    private AppListAdapter mAdapter;


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mAdapter = new AppListAdapter(this);
        if (mAdapter.getCount() <= 0)
        {
            finish();
            return;
        } else
        {
            setListAdapter(mAdapter);
            return;
        }
    }

    protected void onListItemClick(ListView listview, View view, int i, long l)
    {
        MyApplicationInfo myapplicationinfo = (MyApplicationInfo)mAdapter.getItem(i);
        Intent intent = new Intent();
        if (myapplicationinfo.info != null)
            intent.setAction(((PackageItemInfo) (myapplicationinfo.info)).packageName);
        setResult(-1, intent);
        finish();
    }

    protected void onResume()
    {
        super.onResume();
    }

    protected void onStop()
    {
        super.onStop();
    }


}
