// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.*;
import android.os.AsyncTask;
import android.os.UserHandle;
import android.widget.CompoundButton;

public class AirplaneModeController extends BroadcastReceiver
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "StatusBar.AirplaneModeController";
    private boolean mAirplaneMode;
    private CompoundButton mCheckBox;
    private Context mContext;

    public AirplaneModeController(Context context, CompoundButton compoundbutton)
    {
        mContext = context;
        mAirplaneMode = getAirplaneMode();
        mCheckBox = compoundbutton;
        compoundbutton.setChecked(mAirplaneMode);
        compoundbutton.setOnCheckedChangeListener(this);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        context.registerReceiver(this, intentfilter);
    }

    private boolean getAirplaneMode()
    {
        int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private void unsafe(final boolean enabled)
    {
        AsyncTask.execute(new Runnable() {

            final AirplaneModeController this$0;
            final boolean val$enabled;

            public void run()
            {
                android.content.ContentResolver contentresolver = mContext.getContentResolver();
                int i;
                if (enabled)
                    i = 1;
                else
                    i = 0;
                android.provider.Settings.Global.putInt(contentresolver, "airplane_mode_on", i);
                Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
                intent.addFlags(0x20000000);
                intent.putExtra("state", enabled);
                mContext.sendBroadcastAsUser(intent, UserHandle.ALL);
            }

            
            {
                this$0 = AirplaneModeController.this;
                enabled = flag;
                super();
            }
        }
);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (flag != mAirplaneMode)
        {
            mAirplaneMode = flag;
            unsafe(flag);
        }
    }

    public void onReceive(Context context, Intent intent)
    {
        if ("android.intent.action.AIRPLANE_MODE".equals(intent.getAction()))
        {
            boolean flag = intent.getBooleanExtra("state", false);
            if (flag != mAirplaneMode)
            {
                mAirplaneMode = flag;
                mCheckBox.setChecked(flag);
            }
        }
    }

    public void release()
    {
        mContext.unregisterReceiver(this);
    }

}
