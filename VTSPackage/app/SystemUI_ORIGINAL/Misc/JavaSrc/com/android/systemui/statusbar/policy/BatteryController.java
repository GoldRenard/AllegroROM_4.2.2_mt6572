// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.widget.ImageView;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Iterator;

public class BatteryController extends BroadcastReceiver
{
    public static interface BatteryStateChangeCallback
    {

        public abstract void onBatteryLevelChanged(int i, boolean flag);
    }


    private static final String ACTION_BATTERY_PERCENTAGE_SWITCH = "mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH";
    private static final String TAG = "StatusBar.BatteryController";
    private String mBatteryPercentage;
    private boolean mBatteryProtection;
    private ArrayList mChangeCallbacks;
    private Context mContext;
    private ArrayList mIconViews;
    private ArrayList mLabelViews;
    private boolean mShouldShowBatteryPercentage;

    public BatteryController(Context context)
    {
        mIconViews = new ArrayList();
        mLabelViews = new ArrayList();
        mShouldShowBatteryPercentage = false;
        mBatteryPercentage = "100%";
        mBatteryProtection = false;
        mChangeCallbacks = new ArrayList();
        mContext = context;
        int i = android.provider.Settings.Secure.getInt(context.getContentResolver(), "battery_percentage", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        mShouldShowBatteryPercentage = flag;
        Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append("BatteryController mShouldShowBatteryPercentage is ").append(mShouldShowBatteryPercentage).toString());
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        intentfilter.addAction("mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH");
        context.registerReceiver(this, intentfilter);
    }

    private String getBatteryPercentage(Intent intent)
    {
        int i = intent.getIntExtra("level", 0);
        int j = intent.getIntExtra("scale", 100);
        return (new StringBuilder()).append(String.valueOf((i * 100) / j)).append("%").toString();
    }

    public void addIconView(ImageView imageview)
    {
        mIconViews.add(imageview);
    }

    public void addLabelView(TextView textview)
    {
        mLabelViews.add(textview);
    }

    public void addStateChangedCallback(BatteryStateChangeCallback batterystatechangecallback)
    {
        mChangeCallbacks.add(batterystatechangecallback);
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append("BatteryController onReceive action is ").append(s).toString());
        if (s.equals("android.intent.action.BATTERY_CHANGED"))
        {
            int i = intent.getIntExtra("level", 0);
            int j = intent.getIntExtra("status", 1);
            boolean flag1 = false;
            int k;
            switch (j)
            {
            case 2: // '\002'
            case 5: // '\005'
                flag1 = true;
                // fall through

            case 3: // '\003'
            case 4: // '\004'
            default:
                k = intent.getIntExtra("status", 1);
                break;
            }
            Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append("status_protection = ").append(k).toString());
            if (k != 3 && k != 4)
                mBatteryProtection = false;
            else
                mBatteryProtection = true;
            boolean flag2;
            if (intent.getIntExtra("level", 0) == 100)
                flag2 = true;
            else
                flag2 = false;
            int l;
            if (flag1 && !flag2 && !mBatteryProtection)
                l = 0x7f020169;
            else
                l = 0x7f020160;
            Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append("plugged is ").append(flag1).append(" fulled is ").append(flag2).append(" mBatteryProtection = ").append(mBatteryProtection).append("  R.drawable.stat_sys_battery_charge is ").append(0x7f020169).append(" R.drawable.stat_sys_battery is ").append(0x7f020160).append("  icon is ").append(l).toString());
            int i1 = mIconViews.size();
            for (int j1 = 0; j1 < i1; j1++)
            {
                ImageView imageview = (ImageView)mIconViews.get(j1);
                imageview.setImageResource(l);
                imageview.setImageLevel(i);
                Context context2 = mContext;
                Object aobj1[] = new Object[1];
                aobj1[0] = Integer.valueOf(i);
                imageview.setContentDescription(context2.getString(0x7f0b009c, aobj1));
            }

            int k1 = mLabelViews.size();
            for (int l1 = 0; l1 < k1; l1++)
            {
                TextView textview2 = (TextView)mLabelViews.get(l1);
                Context context1 = mContext;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                textview2.setText(context1.getString(0x7f0b005a, aobj));
            }

            for (Iterator iterator = mChangeCallbacks.iterator(); iterator.hasNext(); ((BatteryStateChangeCallback)iterator.next()).onBatteryLevelChanged(i, flag1));
            mBatteryPercentage = getBatteryPercentage(intent);
            Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append("mBatteryPercentage is ").append(mBatteryPercentage).append(" mShouldShowBatteryPercentage is ").append(mShouldShowBatteryPercentage).append(" mLabelViews.size() ").append(mLabelViews.size()).toString());
            TextView textview1 = (TextView)mLabelViews.get(0);
            if (mShouldShowBatteryPercentage)
            {
                textview1.setText(mBatteryPercentage);
                textview1.setVisibility(0);
            } else
            {
                textview1.setVisibility(8);
                return;
            }
        } else
        if (s.equals("mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH"))
        {
            boolean flag;
            if (intent.getIntExtra("state", 0) == 1)
                flag = true;
            else
                flag = false;
            mShouldShowBatteryPercentage = flag;
            Xlog.d("StatusBar.BatteryController", (new StringBuilder()).append(" OnReceive from mediatek.intent.ACTION_BATTERY_PERCENTAGE_SWITCH  mShouldShowBatteryPercentage is ").append(mShouldShowBatteryPercentage).toString());
            TextView textview = (TextView)mLabelViews.get(0);
            if (mShouldShowBatteryPercentage)
            {
                textview.setText(mBatteryPercentage);
                textview.setVisibility(0);
                return;
            } else
            {
                textview.setVisibility(8);
                return;
            }
        }
    }
}
