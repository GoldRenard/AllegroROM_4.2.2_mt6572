// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.*;
import android.os.*;
import android.text.format.DateUtils;
import android.widget.TextView;
import com.android.internal.app.IBatteryStats;

// Referenced classes of package com.android.settings:
//            Utils

public class BatteryInfo extends Activity
{

    private static final int EVENT_TICK = 1;
    private IBatteryStats mBatteryStats;
    private Handler mHandler;
    private TextView mHealth;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mIntentReceiver;
    private TextView mLevel;
    private TextView mPower;
    private TextView mScale;
    private IPowerManager mScreenStats;
    private TextView mStatus;
    private TextView mTechnology;
    private TextView mTemperature;
    private TextView mUptime;
    private TextView mVoltage;

    public BatteryInfo()
    {
        mHandler = new Handler() {

            final BatteryInfo this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    updateBatteryStats();
                    sendEmptyMessageDelayed(1, 1000L);
                    return;
                }
            }

            
            {
                this$0 = BatteryInfo.this;
                super();
            }
        }
;
        mIntentReceiver = new BroadcastReceiver() {

            final BatteryInfo this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED"))
                {
                    int i = intent.getIntExtra("plugged", 0);
                    mLevel.setText((new StringBuilder()).append("").append(intent.getIntExtra("level", 0)).toString());
                    mScale.setText((new StringBuilder()).append("").append(intent.getIntExtra("scale", 0)).toString());
                    mVoltage.setText((new StringBuilder()).append("").append(intent.getIntExtra("voltage", 0)).append(" ").append(getString(0x7f0b02a2)).toString());
                    mTemperature.setText((new StringBuilder()).append("").append(tenthsToFixedString(intent.getIntExtra("temperature", 0))).append(getString(0x7f0b02a4)).toString());
                    mTechnology.setText((new StringBuilder()).append("").append(intent.getStringExtra("technology")).toString());
                    mStatus.setText(Utils.getBatteryStatus(getResources(), intent));
                    switch (i)
                    {
                    case 3: // '\003'
                        mPower.setText(getString(0x7f0b02b5));
                        break;

                    case 4: // '\004'
                        mPower.setText(getString(0x7f0b02b4));
                        break;

                    case 2: // '\002'
                        mPower.setText(getString(0x7f0b02b3));
                        break;

                    case 1: // '\001'
                        mPower.setText(getString(0x7f0b02b2));
                        break;

                    case 0: // '\0'
                        mPower.setText(getString(0x7f0b02b1));
                        break;

                    default:
                        mPower.setText(getString(0x7f0b02b6));
                        break;
                    }
                    int j = intent.getIntExtra("health", 1);
                    String s;
                    if (j == 2)
                        s = getString(0x7f0b02b8);
                    else
                    if (j == 3)
                        s = getString(0x7f0b02b9);
                    else
                    if (j == 4)
                        s = getString(0x7f0b02ba);
                    else
                    if (j == 5)
                        s = getString(0x7f0b02bb);
                    else
                    if (j == 6)
                        s = getString(0x7f0b02bc);
                    else
                    if (j == 7)
                        s = getString(0x7f0b02bd);
                    else
                        s = getString(0x7f0b02b7);
                    mHealth.setText(s);
                }
            }

            
            {
                this$0 = BatteryInfo.this;
                super();
            }
        }
;
    }

    private final String tenthsToFixedString(int i)
    {
        int j = i / 10;
        return (new StringBuilder()).append(Integer.toString(j)).append(".").append(i - j * 10).toString();
    }

    private void updateBatteryStats()
    {
        long l = SystemClock.elapsedRealtime();
        mUptime.setText(DateUtils.formatElapsedTime(l / 1000L));
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f04000c);
        mIntentFilter = new IntentFilter();
        mIntentFilter.addAction("android.intent.action.BATTERY_CHANGED");
    }

    public void onPause()
    {
        super.onPause();
        mHandler.removeMessages(1);
        unregisterReceiver(mIntentReceiver);
    }

    public void onResume()
    {
        super.onResume();
        mStatus = (TextView)findViewById(0x7f08000e);
        mPower = (TextView)findViewById(0x7f08000f);
        mLevel = (TextView)findViewById(0x7f080010);
        mScale = (TextView)findViewById(0x7f080011);
        mHealth = (TextView)findViewById(0x7f080012);
        mTechnology = (TextView)findViewById(0x7f080015);
        mVoltage = (TextView)findViewById(0x7f080013);
        mTemperature = (TextView)findViewById(0x7f080014);
        mUptime = (TextView)findViewById(0x7f080016);
        mBatteryStats = com.android.internal.app.IBatteryStats.Stub.asInterface(ServiceManager.getService("batteryinfo"));
        mScreenStats = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        mHandler.sendEmptyMessageDelayed(1, 1000L);
        registerReceiver(mIntentReceiver, mIntentFilter);
    }










}
