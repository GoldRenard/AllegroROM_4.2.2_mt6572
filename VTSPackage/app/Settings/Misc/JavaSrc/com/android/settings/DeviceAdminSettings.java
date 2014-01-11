// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.ListFragment;
import android.app.admin.DeviceAdminInfo;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.*;
import android.os.Bundle;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.io.IOException;
import java.util.*;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package com.android.settings:
//            DeviceAdminAdd

public class DeviceAdminSettings extends ListFragment
{
    class PolicyListAdapter extends BaseAdapter
    {

        final LayoutInflater mInflater;
        final DeviceAdminSettings this$0;

        public boolean areAllItemsEnabled()
        {
            return false;
        }

        public void bindView(View view, int i)
        {
            Activity activity = getActivity();
            ViewHolder viewholder = (ViewHolder)view.getTag();
            DeviceAdminInfo deviceadmininfo = (DeviceAdminInfo)mAvailableAdmins.get(i);
            viewholder.icon.setImageDrawable(deviceadmininfo.loadIcon(activity.getPackageManager()));
            viewholder.name.setText(deviceadmininfo.loadLabel(activity.getPackageManager()));
            viewholder.checkbox.setChecked(mActiveAdmins.contains(deviceadmininfo.getComponent()));
            try
            {
                viewholder.description.setText(deviceadmininfo.loadDescription(activity.getPackageManager()));
                return;
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                return;
            }
        }

        public int getCount()
        {
            return mAvailableAdmins.size();
        }

        public Object getItem(int i)
        {
            return mAvailableAdmins.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            View view1;
            if (view == null)
                view1 = newView(viewgroup);
            else
                view1 = view;
            bindView(view1, i);
            return view1;
        }

        public boolean hasStableIds()
        {
            return true;
        }

        public boolean isEnabled(int i)
        {
            return true;
        }

        public View newView(ViewGroup viewgroup)
        {
            View view = mInflater.inflate(0x7f040032, viewgroup, false);
            ViewHolder viewholder = new ViewHolder();
            viewholder.icon = (ImageView)view.findViewById(0x7f080023);
            viewholder.name = (TextView)view.findViewById(0x7f08007a);
            viewholder.checkbox = (CheckBox)view.findViewById(0x7f08007c);
            viewholder.description = (TextView)view.findViewById(0x7f08007b);
            view.setTag(viewholder);
            return view;
        }

        PolicyListAdapter()
        {
            this$0 = DeviceAdminSettings.this;
            super();
            mInflater = (LayoutInflater)getActivity().getSystemService("layout_inflater");
        }
    }

    static class ViewHolder
    {

        CheckBox checkbox;
        TextView description;
        ImageView icon;
        TextView name;

    }


    static final int DIALOG_WARNING = 1;
    static final String TAG = "DeviceAdminSettings";
    final HashSet mActiveAdmins = new HashSet();
    final ArrayList mAvailableAdmins = new ArrayList();
    DevicePolicyManager mDPM;


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mDPM = (DevicePolicyManager)getActivity().getSystemService("device_policy");
        return layoutinflater.inflate(0x7f040033, viewgroup, false);
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        DeviceAdminInfo deviceadmininfo = (DeviceAdminInfo)listview.getAdapter().getItem(i);
        Intent intent = new Intent();
        intent.setClass(getActivity(), com/android/settings/DeviceAdminAdd);
        intent.putExtra("android.app.extra.DEVICE_ADMIN", deviceadmininfo.getComponent());
        startActivity(intent);
    }

    public void onResume()
    {
        super.onResume();
        updateList();
    }

    void updateList()
    {
        mActiveAdmins.clear();
        List list = mDPM.getActiveAdmins();
        if (list != null)
        {
            for (int k = 0; k < list.size(); k++)
                mActiveAdmins.add(list.get(k));

        }
        mAvailableAdmins.clear();
        Object obj = getActivity().getPackageManager().queryBroadcastReceivers(new Intent("android.app.action.DEVICE_ADMIN_ENABLED"), 128);
        if (obj == null)
            obj = Collections.emptyList();
        HashSet hashset = new HashSet(mActiveAdmins);
        ResolveInfo resolveinfo1;
        for (Iterator iterator = ((List) (obj)).iterator(); iterator.hasNext(); hashset.remove(new ComponentName(((PackageItemInfo) (resolveinfo1.activityInfo)).packageName, resolveinfo1.activityInfo.name)))
            resolveinfo1 = (ResolveInfo)iterator.next();

        if (!hashset.isEmpty())
        {
            ArrayList arraylist = new ArrayList(((java.util.Collection) (obj)));
            PackageManager packagemanager = getActivity().getPackageManager();
            Iterator iterator1 = hashset.iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                ComponentName componentname = (ComponentName)iterator1.next();
                List list1 = packagemanager.queryBroadcastReceivers((new Intent()).setComponent(componentname), 128);
                if (list1 != null)
                    arraylist.addAll(list1);
            } while (true);
            obj = arraylist;
        }
        int i = 0;
        int j = ((List) (obj)).size();
        while (i < j) 
        {
            ResolveInfo resolveinfo = (ResolveInfo)((List) (obj)).get(i);
            try
            {
                DeviceAdminInfo deviceadmininfo = new DeviceAdminInfo(getActivity(), resolveinfo);
                if (deviceadmininfo.isVisible() || mActiveAdmins.contains(deviceadmininfo.getComponent()))
                    mAvailableAdmins.add(deviceadmininfo);
            }
            catch (XmlPullParserException xmlpullparserexception)
            {
                Log.w("DeviceAdminSettings", (new StringBuilder()).append("Skipping ").append(resolveinfo.activityInfo).toString(), xmlpullparserexception);
            }
            catch (IOException ioexception)
            {
                Log.w("DeviceAdminSettings", (new StringBuilder()).append("Skipping ").append(resolveinfo.activityInfo).toString(), ioexception);
            }
            i++;
        }
        ListView listview = getListView();
        PolicyListAdapter policylistadapter = new PolicyListAdapter();
        listview.setAdapter(policylistadapter);
    }
}
