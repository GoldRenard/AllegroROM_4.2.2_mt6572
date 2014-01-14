// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.*;
import android.widget.*;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, DreamBackend

public class DreamSettings extends SettingsPreferenceFragment
{
    private class DreamInfoAdapter extends ArrayAdapter
    {

        private final LayoutInflater mInflater;
        final DreamSettings this$0;

        private void activate(DreamBackend.DreamInfo dreaminfo)
        {
            if (dreaminfo.equals(getCurrentSelection()))
                return;
            for (int i = 0; i < getCount(); i++)
                ((DreamBackend.DreamInfo)getItem(i)).isActive = false;

            dreaminfo.isActive = true;
            mBackend.setActiveDream(dreaminfo.componentName);
            notifyDataSetChanged();
        }

        private View createDreamInfoRow(ViewGroup viewgroup)
        {
            View view = mInflater.inflate(0x7f040037, viewgroup, false);
            view.setOnClickListener(view. new android.view.View.OnClickListener() {

                final DreamInfoAdapter this$1;
                final View val$row;

                public void onClick(View view)
                {
                    view.setPressed(true);
                    activate((DreamBackend.DreamInfo)row.getTag());
                }

            
            {
                this$1 = final_dreaminfoadapter;
                row = View.this;
                super();
            }
            }
);
            return view;
        }

        private DreamBackend.DreamInfo getCurrentSelection()
        {
            for (int i = 0; i < getCount(); i++)
            {
                DreamBackend.DreamInfo dreaminfo = (DreamBackend.DreamInfo)getItem(i);
                if (dreaminfo.isActive)
                    return dreaminfo;
            }

            return null;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            int j = 1;
            DreamBackend.DreamInfo dreaminfo = (DreamBackend.DreamInfo)getItem(i);
            Object aobj[] = new Object[j];
            aobj[0] = dreaminfo.caption;
            DreamSettings.logd("getView(%s)", aobj);
            View view1;
            if (view != null)
                view1 = view;
            else
                view1 = createDreamInfoRow(viewgroup);
            view1.setTag(dreaminfo);
            ((ImageView)view1.findViewById(0x1020006)).setImageDrawable(dreaminfo.icon);
            ((TextView)view1.findViewById(0x1020016)).setText(dreaminfo.caption);
            RadioButton radiobutton = (RadioButton)view1.findViewById(0x1020019);
            radiobutton.setChecked(dreaminfo.isActive);
            radiobutton.setOnTouchListener(view1. new android.view.View.OnTouchListener() {

                final DreamInfoAdapter this$1;
                final View val$row;

                public boolean onTouch(View view, MotionEvent motionevent)
                {
                    row.onTouchEvent(motionevent);
                    return false;
                }

            
            {
                this$1 = final_dreaminfoadapter;
                row = View.this;
                super();
            }
            }
);
            if (dreaminfo.settingsComponentName == null)
                j = 0;
            View view2 = view1.findViewById(0x7f08000b);
            byte byte0;
            if (j != 0)
                byte0 = 0;
            else
                byte0 = 4;
            view2.setVisibility(byte0);
            ImageView imageview = (ImageView)view1.findViewById(0x102001a);
            byte byte1 = 0;
            if (j == 0)
                byte1 = 4;
            imageview.setVisibility(byte1);
            float f;
            if (dreaminfo.isActive)
                f = 1.0F;
            else
                f = 0.33F;
            imageview.setAlpha(f);
            imageview.setEnabled(dreaminfo.isActive);
            imageview.setOnClickListener(view1. new android.view.View.OnClickListener() {

                final DreamInfoAdapter this$1;
                final View val$row;

                public void onClick(View view)
                {
                    mBackend.launchSettings((DreamBackend.DreamInfo)row.getTag());
                }

            
            {
                this$1 = final_dreaminfoadapter;
                row = View.this;
                super();
            }
            }
);
            return view1;
        }


        public DreamInfoAdapter(Context context)
        {
            this$0 = DreamSettings.this;
            super(context, 0);
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
        }
    }

    private class PackageReceiver extends BroadcastReceiver
    {

        final DreamSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            DreamSettings.logd("PackageReceiver.onReceive", new Object[0]);
            refreshFromBackend();
        }

        private PackageReceiver()
        {
            this$0 = DreamSettings.this;
            super();
        }

    }


    static final boolean DEBUG = false;
    private static final int DIALOG_WHEN_TO_DREAM = 1;
    private static final String PACKAGE_SCHEME = "package";
    private static final String TAG = com/android/settings/DreamSettings.getSimpleName();
    private DreamInfoAdapter mAdapter;
    private DreamBackend mBackend;
    private Context mContext;
    private MenuItem mMenuItemsWhenEnabled[];
    private final PackageReceiver mPackageReceiver = new PackageReceiver();
    private boolean mRefreshing;
    private Switch mSwitch;


    private MenuItem createMenuItem(Menu menu, int i, int j, boolean flag, final Runnable onClick)
    {
        MenuItem menuitem = menu.add(i);
        menuitem.setShowAsAction(j);
        menuitem.setEnabled(flag);
        menuitem.setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final DreamSettings this$0;
            final Runnable val$onClick;

            public boolean onMenuItemClick(MenuItem menuitem1)
            {
                onClick.run();
                return true;
            }

            
            {
                this$0 = DreamSettings.this;
                onClick = runnable;
                super();
            }
        }
);
        return menuitem;
    }

    private Dialog createWhenToDreamDialog()
    {
        byte byte0 = 2;
        CharSequence acharsequence[] = new CharSequence[3];
        acharsequence[0] = mContext.getString(0x7f0b051c);
        acharsequence[1] = mContext.getString(0x7f0b051b);
        acharsequence[byte0] = mContext.getString(0x7f0b051a);
        if (!mBackend.isActivatedOnDock() || !mBackend.isActivatedOnSleep())
            if (mBackend.isActivatedOnDock())
                byte0 = 0;
            else
            if (mBackend.isActivatedOnSleep())
                byte0 = 1;
            else
                byte0 = -1;
        return (new android.app.AlertDialog.Builder(mContext)).setTitle(0x7f0b051f).setSingleChoiceItems(acharsequence, byte0, new android.content.DialogInterface.OnClickListener() {

            final DreamSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                DreamBackend dreambackend1;
                boolean flag1;
label0:
                {
                    DreamBackend dreambackend = mBackend;
                    boolean flag;
                    if (i != 0 && i != 2)
                        flag = false;
                    else
                        flag = true;
                    dreambackend.setActivatedOnDock(flag);
                    dreambackend1 = mBackend;
                    if (i != 1)
                    {
                        flag1 = false;
                        if (i != 2)
                            break label0;
                    }
                    flag1 = true;
                }
                dreambackend1.setActivatedOnSleep(flag1);
                dialoginterface.dismiss();
            }

            
            {
                this$0 = DreamSettings.this;
                super();
            }
        }
).create();
    }

    public static int getSummaryResource(Context context)
    {
        DreamBackend dreambackend = new DreamBackend(context);
        boolean flag = dreambackend.isEnabled();
        boolean flag1 = dreambackend.isActivatedOnSleep();
        boolean flag2 = dreambackend.isActivatedOnDock();
        boolean flag3;
        if (flag1 && flag2)
            flag3 = true;
        else
            flag3 = false;
        int i;
        if (!flag)
        {
            i = 0x7f0b051d;
        } else
        {
            if (flag3)
                return 0x7f0b0519;
            if (flag1)
                return 0x7f0b051b;
            i = 0;
            if (flag2)
                return 0x7f0b051c;
        }
        return i;
    }

    public static CharSequence getSummaryTextWithDreamName(Context context)
    {
        DreamBackend dreambackend = new DreamBackend(context);
        if (!dreambackend.isEnabled())
            return context.getString(0x7f0b051d);
        else
            return dreambackend.getActiveDreamName();
    }

    private static transient void logd(String s, Object aobj[])
    {
    }

    private void refreshFromBackend()
    {
        logd("refreshFromBackend()", new Object[0]);
        mRefreshing = true;
        boolean flag = mBackend.isEnabled();
        if (mSwitch.isChecked() != flag)
            mSwitch.setChecked(flag);
        mAdapter.clear();
        if (flag)
        {
            java.util.List list = mBackend.getDreamInfos();
            mAdapter.addAll(list);
        }
        if (mMenuItemsWhenEnabled != null)
        {
            MenuItem amenuitem[] = mMenuItemsWhenEnabled;
            int i = amenuitem.length;
            for (int j = 0; j < i; j++)
                amenuitem[j].setEnabled(flag);

        }
        mRefreshing = false;
    }

    public void onActivityCreated(Bundle bundle)
    {
        logd("onActivityCreated(%s)", new Object[] {
            bundle
        });
        super.onActivityCreated(bundle);
        ListView listview = getListView();
        TextView textview = (TextView)getView().findViewById(0x1020004);
        textview.setText(0x7f0b051e);
        listview.setEmptyView(textview);
        mAdapter = new DreamInfoAdapter(mContext);
        listview.setAdapter(mAdapter);
    }

    public void onAttach(Activity activity)
    {
        Object aobj[] = new Object[1];
        aobj[0] = activity.getClass().getSimpleName();
        logd("onAttach(%s)", aobj);
        super.onAttach(activity);
        mContext = activity;
    }

    public void onCreate(Bundle bundle)
    {
        logd("onCreate(%s)", new Object[] {
            bundle
        });
        super.onCreate(bundle);
        Activity activity = getActivity();
        mBackend = new DreamBackend(activity);
        mSwitch = new Switch(activity);
        mSwitch.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

            final DreamSettings this$0;

            public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
            {
                if (!mRefreshing)
                {
                    mBackend.setEnabled(flag);
                    refreshFromBackend();
                }
            }

            
            {
                this$0 = DreamSettings.this;
                super();
            }
        }
);
        int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
        mSwitch.setPadding(0, 0, i, 0);
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(mSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
        setHasOptionsMenu(true);
    }

    public Dialog onCreateDialog(int i)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        logd("onCreateDialog(%s)", aobj);
        if (i == 1)
            return createWhenToDreamDialog();
        else
            return super.onCreateDialog(i);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        logd("onCreateOptionsMenu()", new Object[0]);
        boolean flag = mBackend.isEnabled();
        MenuItem menuitem = createMenuItem(menu, 0x7f0b0520, 2, flag, new Runnable() {

            final DreamSettings this$0;

            public void run()
            {
                mBackend.startDreaming();
            }

            
            {
                this$0 = DreamSettings.this;
                super();
            }
        }
);
        MenuItem menuitem1 = createMenuItem(menu, 0x7f0b051f, 1, flag, new Runnable() {

            final DreamSettings this$0;

            public void run()
            {
                showDialog(1);
            }

            
            {
                this$0 = DreamSettings.this;
                super();
            }
        }
);
        super.onCreateOptionsMenu(menu, menuinflater);
        mMenuItemsWhenEnabled = (new MenuItem[] {
            menuitem, menuitem1
        });
    }

    public void onDestroyView()
    {
        getActivity().getActionBar().setCustomView(null);
        super.onDestroyView();
    }

    public void onPause()
    {
        logd("onPause()", new Object[0]);
        super.onPause();
        mContext.unregisterReceiver(mPackageReceiver);
    }

    public void onResume()
    {
        logd("onResume()", new Object[0]);
        super.onResume();
        refreshFromBackend();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentfilter.addAction("android.intent.action.PACKAGE_CHANGED");
        intentfilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentfilter.addAction("android.intent.action.PACKAGE_REPLACED");
        intentfilter.addDataScheme("package");
        mContext.registerReceiver(mPackageReceiver, intentfilter);
    }





}
