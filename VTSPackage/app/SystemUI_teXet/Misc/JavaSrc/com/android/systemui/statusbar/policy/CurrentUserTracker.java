// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.app.ActivityManager;
import android.content.*;

public class CurrentUserTracker extends BroadcastReceiver
{

    private int mCurrentUserId;

    public CurrentUserTracker(Context context)
    {
        context.registerReceiver(this, new IntentFilter("android.intent.action.USER_SWITCHED"));
        mCurrentUserId = ActivityManager.getCurrentUser();
    }

    public int getCurrentUserId()
    {
        return mCurrentUserId;
    }

    public void onReceive(Context context, Intent intent)
    {
        if ("android.intent.action.USER_SWITCHED".equals(intent.getAction()))
            mCurrentUserId = intent.getIntExtra("android.intent.extra.user_handle", 0);
    }
}
