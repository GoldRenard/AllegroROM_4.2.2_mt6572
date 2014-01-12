// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.activity;

import android.app.Activity;
import android.content.*;
import android.os.Bundle;
import com.mediatek.bluetooth.util.BtLog;

public abstract class CancelableActivity extends Activity
{

    public static final String ACTION_CANCEL_ACTIVITY = "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY";
    public static final String EXTRA_CANCEL_ID = "com.mediatek.activity.CancelableActivity.extra.ID";
    public static final int NULL_CANCEL_ID = 0xfff6563d;
    private BroadcastReceiver cancelReceiver;

    public CancelableActivity()
    {
        cancelReceiver = new BroadcastReceiver() {

            final CancelableActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                BtLog.d((new StringBuilder()).append("CancelableActivity.onReceive()").append(intent.getAction()).toString());
                if ("com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY".equals(intent.getAction()))
                {
                    int i = intent.getIntExtra("com.mediatek.activity.CancelableActivity.extra.ID", 0xfff6563d);
                    onActivityCancel(i);
                }
            }

            
            {
                this$0 = CancelableActivity.this;
                super();
            }
        }
;
    }

    public static void sendCancelActivityIntent(Context context, int i)
    {
        BtLog.d("CancelableActivity.sendCancelActivityIntent()");
        Intent intent = new Intent("com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY");
        intent.putExtra("com.mediatek.activity.CancelableActivity.extra.ID", i);
        context.sendBroadcast(intent);
    }

    protected abstract void onActivityCancel(int i);

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        BtLog.d("CancelableActivity.onCreate() - registering BroadReceiver...");
        registerReceiver(cancelReceiver, new IntentFilter("com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"));
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(cancelReceiver);
    }
}
