// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.*;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LockScreenNewEventView, CalendarUnReadObserver, EmailUnReadObserver, MissCallUnReadObserver, 
//            MmsUnReadObserver

public class UnReadEventView extends LinearLayout
{

    private static final String CLEAR_NEW_EVENT_VIEW_INTENT = "android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS";
    private static final boolean DEBUG = true;
    private static final String MISSED_CALL_SETTING = "com_android_contacts_mtk_unread";
    private static final String TAG = "UnReadEventView";
    private static final String UNRAD_EMAIL_SETTING = "com_android_email_mtk_unread";
    private static final String UNREAD_MMS_SETTING = "com_android_mms_mtk_unread";
    private BroadcastReceiver mClearUnReadTipRceiver = new BroadcastReceiver() {

        final UnReadEventView this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if (mNewEventViews != null && mNewEventViews.size() > 0)
            {
                int i1 = mNewEventViews.size();
                long l1 = System.currentTimeMillis();
                for (int j1 = 0; j1 < i1; j1++)
                    ((LockScreenNewEventView)mNewEventViews.get(j1)).updateQueryBaseTime(l1);

            }
        }

            
            {
                this$0 = UnReadEventView.this;
                super();
            }
    }
;
    private ArrayList mNewEventViews;
    private long mQueryBaseTime;

    public UnReadEventView(Context context)
    {
        this(context, null);
    }

    public UnReadEventView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public UnReadEventView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.mediatek.internal.R.styleable.UnReadEventView, i, 0);
        int j = typedarray.getIndexCount();
        int k = 0;
        do
        {
            if (k >= j)
                break;
            int l = typedarray.getIndex(k);
            switch (l)
            {
            case 0: // '\0'
                TypedValue typedvalue = new TypedValue();
                if (typedarray.getValue(l, typedvalue))
                    initUnReadViews(typedvalue.resourceId);
                if (mNewEventViews == null || mNewEventViews.size() <= 0)
                    throw new IllegalStateException("Must specify at least one target drawable");
                break;
            }
            k++;
        } while (true);
        typedarray.recycle();
        setMotionEventSplittingEnabled(false);
    }

    private void initUnReadViews(int i)
    {
        TypedArray typedarray = getContext().getResources().obtainTypedArray(i);
        int j = typedarray.length();
        if (j <= 0)
        {
            typedarray.recycle();
            return;
        }
        new ArrayList(j);
        LayoutInflater layoutinflater = (LayoutInflater)getContext().getSystemService("layout_inflater");
        ArrayList arraylist = new ArrayList(j);
        for (int k = 0; k < j; k++)
        {
            TypedValue typedvalue = typedarray.peekValue(k);
            if (typedvalue != null && typedvalue.resourceId > 0)
            {
                ViewGroup viewgroup = (ViewGroup)layoutinflater.inflate(0x207000d, this, false);
                LockScreenNewEventView lockscreenneweventview = (LockScreenNewEventView)viewgroup.findViewById(0x2100027);
                lockscreenneweventview.setTopParent(viewgroup);
                lockscreenneweventview.init(typedvalue.resourceId);
                lockscreenneweventview.setViewVisibility(4);
                addView(viewgroup);
                arraylist.add(lockscreenneweventview);
            }
        }

        mNewEventViews = arraylist;
        typedarray.recycle();
    }

    private void registerNewEventObserver(LockScreenNewEventView lockscreenneweventview)
    {
        int i = lockscreenneweventview.getResourceId();
        Xlog.d("TAG", (new StringBuilder()).append("mQueryBaseTimeWhenRegisterNewEvevtObserver=").append(mQueryBaseTime).toString());
        switch (i)
        {
        case 33685614: 
            lockscreenneweventview.registerForQueryObserver(CalendarUnReadObserver.CALENDAR_URL, new CalendarUnReadObserver(new Handler(), lockscreenneweventview, mQueryBaseTime));
            return;

        case 33685615: 
            lockscreenneweventview.registerForQueryObserver(EmailUnReadObserver.EMAIL_CONTENT_URI, new EmailUnReadObserver(new Handler(), lockscreenneweventview, mQueryBaseTime));
            return;

        case 33685616: 
            MissCallUnReadObserver misscallunreadobserver = new MissCallUnReadObserver(new Handler(), lockscreenneweventview, mQueryBaseTime);
            lockscreenneweventview.registerForQueryObserver(MissCallUnReadObserver.MISS_CALL_URI, misscallunreadobserver);
            misscallunreadobserver.refreshUnReadNumber();
            return;

        case 33685617: 
            MmsUnReadObserver mmsunreadobserver = new MmsUnReadObserver(new Handler(), lockscreenneweventview, mQueryBaseTime);
            lockscreenneweventview.registerForQueryObserver(MmsUnReadObserver.MMS_URI, mmsunreadobserver);
            mmsunreadobserver.refreshUnReadNumber();
            return;
        }
    }

    public ArrayList getNewEventViewList()
    {
        return mNewEventViews;
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (mNewEventViews != null && mNewEventViews.size() > 0)
        {
            int i = mNewEventViews.size();
            for (int j = 0; j < i; j++)
                registerNewEventObserver((LockScreenNewEventView)mNewEventViews.get(j));

            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS");
            getContext().registerReceiver(mClearUnReadTipRceiver, intentfilter);
            return;
        } else
        {
            return;
        }
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mNewEventViews != null && mNewEventViews.size() > 0)
        {
            int i = mNewEventViews.size();
            for (int j = 0; j < i; j++)
                ((LockScreenNewEventView)mNewEventViews.get(j)).unRegisterNewEventObserver();

            getContext().unregisterReceiver(mClearUnReadTipRceiver);
            return;
        } else
        {
            return;
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
    }

    public void updateQueryBaseTimeAndRefreshUnReadNumber(long l)
    {
        mQueryBaseTime = l;
        Xlog.d("TAG", (new StringBuilder()).append("mQueryBaseTimeReceived=").append(mQueryBaseTime).toString());
    }

}
