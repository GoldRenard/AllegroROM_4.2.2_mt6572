// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.quicklaunch;

import android.app.ListActivity;
import android.content.Intent;
import android.content.pm.*;
import android.os.Bundle;
import android.os.Handler;
import android.view.*;
import android.widget.*;
import java.util.*;

public class BookmarkPicker extends ListActivity
    implements android.widget.SimpleAdapter.ViewBinder
{

    private static final int DISPLAY_MODE_LAUNCH = 0;
    private static final int DISPLAY_MODE_SHORTCUT = 1;
    public static final String EXTRA_SHORTCUT = "com.android.settings.quicklaunch.SHORTCUT";
    public static final String EXTRA_TITLE = "com.android.settings.quicklaunch.TITLE";
    private static final String KEY_RESOLVE_INFO = "RESOLVE_INFO";
    private static final String KEY_TITLE = "TITLE";
    private static final int REQUEST_CREATE_SHORTCUT = 1;
    private static final String TAG = "BookmarkPicker";
    private static final String sKeys[] = {
        "TITLE", "RESOLVE_INFO"
    };
    private static Intent sLaunchIntent;
    private static final int sResourceIds[] = {
        0x7f080024, 0x7f080023
    };
    private static Intent sShortcutIntent;
    private int mDisplayMode;
    private SimpleAdapter mMyAdapter;
    private List mResolveList;
    private Handler mUiHandler;

    public BookmarkPicker()
    {
        mDisplayMode = 0;
        mUiHandler = new Handler();
    }

    private SimpleAdapter createResolveAdapter(List list)
    {
        SimpleAdapter simpleadapter = new SimpleAdapter(this, list, 0x7f040015, sKeys, sResourceIds);
        simpleadapter.setViewBinder(this);
        return simpleadapter;
    }

    private void ensureIntents()
    {
        if (sLaunchIntent == null)
        {
            sLaunchIntent = (new Intent("android.intent.action.MAIN")).addCategory("android.intent.category.LAUNCHER");
            sShortcutIntent = new Intent("android.intent.action.CREATE_SHORTCUT");
        }
    }

    private void fillAdapterList(List list, List list1)
    {
        list.clear();
        int i = list1.size();
        for (int j = 0; j < i; j++)
        {
            ResolveInfo resolveinfo = (ResolveInfo)list1.get(j);
            TreeMap treemap = new TreeMap();
            treemap.put("TITLE", getResolveInfoTitle(resolveinfo));
            treemap.put("RESOLVE_INFO", resolveinfo);
            list.add(treemap);
        }

    }

    private void fillResolveList(List list)
    {
        ensureIntents();
        PackageManager packagemanager = getPackageManager();
        list.clear();
        if (mDisplayMode == 0)
            list.addAll(packagemanager.queryIntentActivities(sLaunchIntent, 0));
        else
        if (mDisplayMode == 1)
        {
            list.addAll(packagemanager.queryIntentActivities(sShortcutIntent, 0));
            return;
        }
    }

    private void finish(Intent intent, String s)
    {
        intent.putExtras(getIntent());
        intent.putExtra("com.android.settings.quicklaunch.TITLE", s);
        setResult(-1, intent);
        finish();
    }

    private static Intent getIntentForResolveInfo(ResolveInfo resolveinfo, String s)
    {
        Intent intent = new Intent(s);
        ActivityInfo activityinfo = resolveinfo.activityInfo;
        intent.setClassName(((PackageItemInfo) (activityinfo)).packageName, activityinfo.name);
        return intent;
    }

    private String getResolveInfoTitle(ResolveInfo resolveinfo)
    {
        Object obj = resolveinfo.loadLabel(getPackageManager());
        if (obj == null)
            obj = resolveinfo.activityInfo.name;
        if (obj != null)
            return obj.toString();
        else
            return null;
    }

    private void startShortcutActivity(ResolveInfo resolveinfo)
    {
        startActivityForResult(getIntentForResolveInfo(resolveinfo, "android.intent.action.CREATE_SHORTCUT"), 1);
    }

    private void updateAdapterToUseNewLists(final ArrayList newAdapterList, final ArrayList newResolveList)
    {
        mUiHandler.post(new Runnable() {

            final BookmarkPicker this$0;
            final ArrayList val$newAdapterList;
            final ArrayList val$newResolveList;

            public void run()
            {
                mMyAdapter = createResolveAdapter(newAdapterList);
                mResolveList = newResolveList;
                setListAdapter(mMyAdapter);
            }

            
            {
                this$0 = BookmarkPicker.this;
                newAdapterList = arraylist;
                newResolveList = arraylist1;
                super();
            }
        }
);
    }

    private void updateListAndAdapter()
    {
        (new Thread("data updater") {

            final BookmarkPicker this$0;

            public void run()
            {
                synchronized (BookmarkPicker.this)
                {
                    ArrayList arraylist = new ArrayList();
                    ArrayList arraylist1 = new ArrayList();
                    fillResolveList(arraylist);
                    Collections.sort(arraylist, new android.content.pm.ResolveInfo.DisplayNameComparator(getPackageManager()));
                    fillAdapterList(arraylist1, arraylist);
                    updateAdapterToUseNewLists(arraylist1, arraylist);
                }
                return;
                exception;
                bookmarkpicker;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = BookmarkPicker.this;
                super(s);
            }
        }
).start();
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            if (j == -1)
                switch (i)
                {
                default:
                    break label0;

                case 1: // '\001'
                    if (intent != null)
                    {
                        finish((Intent)intent.getParcelableExtra("android.intent.extra.shortcut.INTENT"), intent.getStringExtra("android.intent.extra.shortcut.NAME"));
                        return;
                    }
                    break;
                }
            return;
        }
        super.onActivityResult(i, j, intent);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        updateListAndAdapter();
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        menu.add(0, 0, 0, 0x7f0b06f4).setIcon(0x1080320);
        menu.add(0, 1, 0, 0x7f0b06f5).setIcon(0x1080337);
        return true;
    }

    protected void onListItemClick(ListView listview, View view, int i, long l)
    {
        if (i >= mResolveList.size())
            return;
        ResolveInfo resolveinfo = (ResolveInfo)mResolveList.get(i);
        switch (mDisplayMode)
        {
        case 1: // '\001'
            startShortcutActivity(resolveinfo);
            return;

        case 0: // '\0'
            Intent intent = getIntentForResolveInfo(resolveinfo, "android.intent.action.MAIN");
            intent.addCategory("android.intent.category.LAUNCHER");
            finish(intent, getResolveInfoTitle(resolveinfo));
            return;
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
label0:
        {
            switch (menuitem.getItemId())
            {
            default:
                break label0;

            case 1: // '\001'
                mDisplayMode = 1;
                break;

            case 0: // '\0'
                mDisplayMode = 0;
                break;
            }
            updateListAndAdapter();
            return true;
        }
        return false;
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.findItem(0);
        boolean flag;
        if (mDisplayMode != 0)
            flag = true;
        else
            flag = false;
        menuitem.setVisible(flag);
        MenuItem menuitem1 = menu.findItem(1);
        int i = mDisplayMode;
        boolean flag1 = false;
        if (i != 1)
            flag1 = true;
        menuitem1.setVisible(flag1);
        return true;
    }

    public boolean setViewValue(View view, Object obj, String s)
    {
        if (view.getId() == 0x7f080023)
        {
            android.graphics.drawable.Drawable drawable = ((ResolveInfo)obj).loadIcon(getPackageManager());
            if (drawable != null)
                ((ImageView)view).setImageDrawable(drawable);
            return true;
        } else
        {
            return false;
        }
    }







/*
    static SimpleAdapter access$302(BookmarkPicker bookmarkpicker, SimpleAdapter simpleadapter)
    {
        bookmarkpicker.mMyAdapter = simpleadapter;
        return simpleadapter;
    }

*/



/*
    static List access$502(BookmarkPicker bookmarkpicker, List list)
    {
        bookmarkpicker.mResolveList = list;
        return list;
    }

*/
}
