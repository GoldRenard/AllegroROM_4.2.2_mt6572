// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.database.ContentObserver;
import android.os.Handler;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LockScreenNewEventView

public abstract class UnReadObserver extends ContentObserver
{

    static final String TAG = "UnReadObserver";
    long mCreateTime;
    final LockScreenNewEventView mNewEventView;

    public UnReadObserver(Handler handler, LockScreenNewEventView lockscreenneweventview, long l)
    {
        super(handler);
        mNewEventView = lockscreenneweventview;
        mCreateTime = l;
    }

    public void onChange(boolean flag)
    {
        refreshUnReadNumber();
    }

    public abstract void refreshUnReadNumber();

    public final void upateNewEventNumber(int i)
    {
        if (mNewEventView != null)
        {
            mNewEventView.setNumber(i);
            return;
        } else
        {
            Xlog.e("UnReadObserver", "mNewEventView is null");
            return;
        }
    }

    public void updateQueryBaseTime(long l)
    {
        mCreateTime = l;
        upateNewEventNumber(0);
    }
}
