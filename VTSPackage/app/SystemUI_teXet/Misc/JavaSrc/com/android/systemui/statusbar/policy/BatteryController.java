// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.database.ContentObserver;
import android.os.Handler;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Iterator;

public class BatteryController extends BroadcastReceiver
{
    public static interface BatteryStateChangeCallback
    {

        public abstract void onBatteryLevelChanged(int i, int j);
    }

    class SettingsObserver extends ContentObserver
    {

        final BatteryController this$0;

        void observe()
        {
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("status_bar_battery"), false, this);
        }

        public void onChange(boolean flag)
        {
            updateSettings();
        }

        SettingsObserver(Handler handler)
        {
            this$0 = BatteryController.this;
            super(handler);
        }
    }


    private static final String ACTION_BATTERY_PERCENTAGE_SWITCH = "mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH";
    public static final int BATTERY_STYLE_CIRCLE = 2;
    public static final int BATTERY_STYLE_CIRCLE_PERCENT = 3;
    public static final int BATTERY_STYLE_GONE = 4;
    public static final int BATTERY_STYLE_NORMAL = 0;
    public static final int BATTERY_STYLE_PERCENT = 1;
    private static final int BATTERY_TEXT_STYLE_MIN = 0x7f0b00ef;
    private static final int BATTERY_TEXT_STYLE_NORMAL = 0x7f0b005b;
    private static final String STATUS_BAR_BATTERY_PREF = "status_bar_battery";
    private static final String TAG = "StatusBar.BatteryController";
    private int mBatteryLevel;
    private String mBatteryPercentage;
    private boolean mBatteryPlugged;
    private boolean mBatteryProtection;
    private int mBatteryStatus;
    private int mBatteryStyle;
    private ArrayList mChangeCallbacks;
    private Context mContext;
    Handler mHandler;
    private ArrayList mIconViews;
    private ArrayList mLabelViews;
    private boolean mShouldShowBatteryPercentage;
    private boolean mUiController;

    public BatteryController(Context context)
    {
        this(context, true);
    }

    public BatteryController(Context context, boolean flag)
    {
        mIconViews = new ArrayList();
        mLabelViews = new ArrayList();
        mBatteryPlugged = false;
        mBatteryStatus = 1;
        mBatteryLevel = 0;
        mUiController = false;
        mChangeCallbacks = new ArrayList();
        mContext = context;
        mHandler = new Handler();
        mUiController = flag;
        if (mUiController)
        {
            (new SettingsObserver(mHandler)).observe();
            updateSettings();
        }
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        mContext.registerReceiver(this, intentfilter);
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
        batterystatechangecallback.onBatteryLevelChanged(getBatteryLevel(), getBatteryStatus());
    }

    protected int getBatteryLevel()
    {
        return mBatteryLevel;
    }

    protected int getBatteryStatus()
    {
        return mBatteryStatus;
    }

    protected int getBatteryStyle()
    {
        return mBatteryStyle;
    }

    public int getIconStyleCharge()
    {
        return 0x7f020145;
    }

    public int getIconStyleChargeMin()
    {
        return 0x7f02025f;
    }

    public int getIconStyleNormal()
    {
        return 0x7f02013c;
    }

    public int getIconStyleNormalMin()
    {
        return 0x7f020260;
    }

    public int getIconStyleUnknown()
    {
        return 0x7f02013c;
    }

    protected boolean isBatteryPlugged()
    {
        return mBatteryPlugged;
    }

    protected boolean isBatteryPresent()
    {
        return true;
    }

    protected boolean isBatteryStatusCharging()
    {
        return getBatteryStatus() == 2;
    }

    protected boolean isBatteryStatusUnknown()
    {
        return getBatteryStatus() == 1;
    }

    protected boolean isUiController()
    {
        return mUiController;
    }

    public void onReceive(Context context, Intent intent)
    {
        if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED"))
        {
            mBatteryLevel = intent.getIntExtra("level", 0);
            int i = intent.getIntExtra("plugged", 0);
            boolean flag = false;
            if (i != 0)
                flag = true;
            mBatteryPlugged = flag;
            mBatteryStatus = intent.getIntExtra("status", 1);
            updateViews();
            if (mUiController)
                updateBattery();
        }
    }

    public void removeStateChangedCallback(BatteryStateChangeCallback batterystatechangecallback)
    {
        mChangeCallbacks.remove(batterystatechangecallback);
    }

    protected void updateBattery()
    {
        byte byte0 = 8;
        byte byte1 = 8;
        int i = getIconStyleNormal();
        if (isBatteryPresent())
            if (!isBatteryStatusUnknown() || mBatteryStyle != 0 && mBatteryStyle != 1)
            {
                if (mBatteryStyle == 0)
                {
                    if (isBatteryStatusCharging())
                        i = getIconStyleCharge();
                    else
                        i = getIconStyleNormal();
                    byte0 = 0;
                } else
                if (mBatteryStyle == 1)
                {
                    if (isBatteryStatusCharging())
                        i = getIconStyleChargeMin();
                    else
                        i = getIconStyleNormalMin();
                    byte0 = 0;
                    byte1 = 0;
                }
            } else
            {
                byte0 = 0;
                i = getIconStyleUnknown();
            }
        int j = mIconViews.size();
        for (int k = 0; k < j; k++)
        {
            ImageView imageview = (ImageView)mIconViews.get(k);
            imageview.setVisibility(byte0);
            imageview.setImageResource(i);
        }

        int l = mLabelViews.size();
        for (int i1 = 0; i1 < l; i1++)
            ((TextView)mLabelViews.get(i1)).setVisibility(byte1);

    }

    public void updateSettings()
    {
        mBatteryStyle = android.provider.Settings.System.getInt(mContext.getContentResolver(), "status_bar_battery", 0);
        updateBattery();
    }

    protected void updateViews()
    {
        int i = getBatteryLevel();
        if (mUiController)
        {
            int j = mIconViews.size();
            for (int k = 0; k < j; k++)
            {
                ImageView imageview = (ImageView)mIconViews.get(k);
                imageview.setImageLevel(i);
                Context context1 = mContext;
                Object aobj1[] = new Object[1];
                aobj1[0] = Integer.valueOf(i);
                imageview.setContentDescription(context1.getString(0x7f0b009d, aobj1));
            }

            int l = mLabelViews.size();
            for (int i1 = 0; i1 < l; i1++)
            {
                TextView textview = (TextView)mLabelViews.get(i1);
                Context context = mContext;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                textview.setText(context.getString(0x7f0b00ef, aobj));
            }

        }
        for (Iterator iterator = mChangeCallbacks.iterator(); iterator.hasNext(); ((BatteryStateChangeCallback)iterator.next()).onBatteryLevelChanged(i, getBatteryStatus()));
    }

}
