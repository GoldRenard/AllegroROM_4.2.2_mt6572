// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import java.text.Collator;
import java.util.*;

public class AppWidgetLoader
{
    public static interface ItemConstructor
    {

        public abstract Object createItem(Context context, AppWidgetProviderInfo appwidgetproviderinfo, Bundle bundle);
    }

    static interface LabelledItem
    {

        public abstract CharSequence getLabel();
    }


    private static final boolean LOGD = false;
    private static final String TAG = "AppWidgetAdapter";
    private AppWidgetManager mAppWidgetManager;
    private Context mContext;
    ItemConstructor mItemConstructor;

    public AppWidgetLoader(Context context, AppWidgetManager appwidgetmanager, ItemConstructor itemconstructor)
    {
        mContext = context;
        mAppWidgetManager = appwidgetmanager;
        mItemConstructor = itemconstructor;
    }

    protected List getItems(Intent intent)
    {
        boolean flag = intent.getBooleanExtra("customSort", true);
        ArrayList arraylist = new ArrayList();
        putInstalledAppWidgets(arraylist, intent.getIntExtra("categoryFilter", 1));
        if (flag)
            putCustomAppWidgets(arraylist, intent);
        Collections.sort(arraylist, new Comparator() {

            Collator mCollator;
            final AppWidgetLoader this$0;

            public int compare(LabelledItem labelleditem, LabelledItem labelleditem1)
            {
                return mCollator.compare(labelleditem.getLabel(), labelleditem1.getLabel());
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((LabelledItem)obj, (LabelledItem)obj1);
            }

            
            {
                this$0 = AppWidgetLoader.this;
                super();
                mCollator = Collator.getInstance();
            }
        }
);
        if (!flag)
        {
            ArrayList arraylist1 = new ArrayList();
            putCustomAppWidgets(arraylist1, intent);
            arraylist.addAll(arraylist1);
        }
        return arraylist;
    }

    void putAppWidgetItems(List list, List list1, List list2, int i, boolean flag)
    {
        if (list != null)
        {
            int j = list.size();
            for (int k = 0; k < j; k++)
            {
                AppWidgetProviderInfo appwidgetproviderinfo = (AppWidgetProviderInfo)list.get(k);
                if (!flag && (i & appwidgetproviderinfo.widgetCategory) == 0)
                    continue;
                ItemConstructor itemconstructor = mItemConstructor;
                Context context = mContext;
                Bundle bundle;
                if (list1 != null)
                    bundle = (Bundle)list1.get(k);
                else
                    bundle = null;
                list2.add((LabelledItem)itemconstructor.createItem(context, appwidgetproviderinfo, bundle));
            }

        }
    }

    void putCustomAppWidgets(List list, Intent intent)
    {
        ArrayList arraylist;
        ArrayList arraylist1;
label0:
        {
            arraylist = null;
            arraylist1 = intent.getParcelableArrayListExtra("customInfo");
            if (arraylist1 != null && arraylist1.size() != 0)
            {
                int i = arraylist1.size();
                for (int j = 0; j < i;)
                {
                    Parcelable parcelable1 = (Parcelable)arraylist1.get(j);
                    if (parcelable1 != null && (parcelable1 instanceof AppWidgetProviderInfo))
                    {
                        j++;
                    } else
                    {
                        Log.e("AppWidgetAdapter", (new StringBuilder()).append("error using EXTRA_CUSTOM_INFO index=").append(j).toString());
                        arraylist1 = null;
                        arraylist = null;
                        break label0;
                    }
                }

                arraylist = intent.getParcelableArrayListExtra("customExtras");
                if (arraylist == null)
                {
                    Log.e("AppWidgetAdapter", "EXTRA_CUSTOM_INFO without EXTRA_CUSTOM_EXTRAS");
                    arraylist1 = null;
                    break label0;
                }
                int k = arraylist.size();
                if (i != k)
                {
                    Log.e("AppWidgetAdapter", (new StringBuilder()).append("list size mismatch: EXTRA_CUSTOM_INFO: ").append(i).append(" EXTRA_CUSTOM_EXTRAS: ").append(k).toString());
                    arraylist1 = null;
                    arraylist = null;
                    break label0;
                }
                int l = 0;
                do
                {
                    if (l >= k)
                        break label0;
                    Parcelable parcelable = (Parcelable)arraylist.get(l);
                    if (parcelable == null || !(parcelable instanceof Bundle))
                        break;
                    l++;
                } while (true);
                Log.e("AppWidgetAdapter", (new StringBuilder()).append("error using EXTRA_CUSTOM_EXTRAS index=").append(l).toString());
                arraylist1 = null;
                arraylist = null;
            } else
            {
                Log.i("AppWidgetAdapter", "EXTRA_CUSTOM_INFO not present.");
            }
        }
        putAppWidgetItems(arraylist1, arraylist, list, 0, true);
    }

    void putInstalledAppWidgets(List list, int i)
    {
        putAppWidgetItems(mAppWidgetManager.getInstalledProviders(i), null, list, i, false);
    }
}
