// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import java.util.List;

// Referenced classes of package com.android.settings:
//            ActivityPicker, AppWidgetLoader

public class AppWidgetPickActivity extends ActivityPicker
    implements AppWidgetLoader.ItemConstructor
{

    static final boolean LOGD = false;
    private static final String TAG = "AppWidgetPickActivity";
    private int mAppWidgetId;
    private AppWidgetLoader mAppWidgetLoader;
    private AppWidgetManager mAppWidgetManager;
    List mItems;
    private PackageManager mPackageManager;


    public ActivityPicker.PickAdapter.Item createItem(Context context, AppWidgetProviderInfo appwidgetproviderinfo, Bundle bundle)
    {
        String s;
        int i;
        android.graphics.drawable.Drawable drawable;
        s = appwidgetproviderinfo.label;
        i = appwidgetproviderinfo.icon;
        drawable = null;
        if (i == 0) goto _L2; else goto _L1
_L1:
        int j = context.getResources().getDisplayMetrics().densityDpi;
        j;
        JVM INSTR lookupswitch 5: default 84
    //                   160: 220
    //                   213: 220
    //                   240: 220
    //                   320: 220
    //                   480: 220;
           goto _L3 _L3 _L3 _L3 _L3 _L3
_L3:
        int k = (int)(0.5F + 0.75F * (float)j);
        android.graphics.drawable.Drawable drawable1 = mPackageManager.getResourcesForApplication(appwidgetproviderinfo.provider.getPackageName()).getDrawableForDensity(appwidgetproviderinfo.icon, k);
        drawable = drawable1;
_L5:
        if (drawable == null)
            Log.w("AppWidgetPickActivity", (new StringBuilder()).append("Can't load icon drawable 0x").append(Integer.toHexString(appwidgetproviderinfo.icon)).append(" for provider: ").append(appwidgetproviderinfo.provider).toString());
_L2:
        ActivityPicker.PickAdapter.Item item = new ActivityPicker.PickAdapter.Item(context, s, drawable);
        item.packageName = appwidgetproviderinfo.provider.getPackageName();
        item.className = appwidgetproviderinfo.provider.getClassName();
        item.extras = bundle;
        return item;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Log.w("AppWidgetPickActivity", (new StringBuilder()).append("Can't load icon drawable 0x").append(Integer.toHexString(appwidgetproviderinfo.icon)).append(" for provider: ").append(appwidgetproviderinfo.provider).toString());
        drawable = null;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public volatile Object createItem(Context context, AppWidgetProviderInfo appwidgetproviderinfo, Bundle bundle)
    {
        return createItem(context, appwidgetproviderinfo, bundle);
    }

    protected List getItems()
    {
        mItems = mAppWidgetLoader.getItems(getIntent());
        return mItems;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        Intent intent = getIntentForPosition(i);
        if (((ActivityPicker.PickAdapter.Item)mItems.get(i)).extras == null) goto _L2; else goto _L1
_L1:
        setResultData(-1, intent);
_L4:
        finish();
        return;
_L2:
        Bundle bundle = intent.getExtras();
        Bundle bundle1;
        bundle1 = null;
        if (bundle == null)
            break MISSING_BLOCK_LABEL_61;
        bundle1 = intent.getExtras().getBundle("appWidgetOptions");
        mAppWidgetManager.bindAppWidgetId(mAppWidgetId, intent.getComponent(), bundle1);
        byte byte0 = -1;
_L5:
        setResultData(byte0, null);
        if (true) goto _L4; else goto _L3
_L3:
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        byte0 = 0;
          goto _L5
    }

    public void onCreate(Bundle bundle)
    {
        mPackageManager = getPackageManager();
        mAppWidgetManager = AppWidgetManager.getInstance(this);
        mAppWidgetLoader = new AppWidgetLoader(this, mAppWidgetManager, this);
        super.onCreate(bundle);
        setResultData(0, null);
        Intent intent = getIntent();
        if (intent.hasExtra("appWidgetId"))
        {
            mAppWidgetId = intent.getIntExtra("appWidgetId", 0);
            return;
        } else
        {
            finish();
            return;
        }
    }

    void setResultData(int i, Intent intent)
    {
        Intent intent1;
        if (intent != null)
            intent1 = intent;
        else
            intent1 = new Intent();
        intent1.putExtra("appWidgetId", mAppWidgetId);
        setResult(i, intent1);
    }
}
