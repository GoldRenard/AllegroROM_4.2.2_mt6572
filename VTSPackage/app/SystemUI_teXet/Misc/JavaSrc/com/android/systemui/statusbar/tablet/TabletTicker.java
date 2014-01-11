// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.animation.LayoutTransition;
import android.app.Notification;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.*;
import android.util.Slog;
import android.view.*;
import android.widget.*;
import com.android.internal.statusbar.StatusBarIcon;
import com.android.internal.statusbar.StatusBarNotification;
import com.android.systemui.statusbar.StatusBarIconView;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            TabletStatusBar

public class TabletTicker extends Handler
    implements android.animation.LayoutTransition.TransitionListener
{

    private static final int ADVANCE_DELAY = 5000;
    private static final boolean CLICKABLE_TICKER = true;
    private static final int MSG_ADVANCE = 1;
    private static final int QUEUE_LENGTH = 3;
    private static final String TAG = "StatusBar.TabletTicker";
    private TabletStatusBar mBar;
    private final Context mContext;
    private IBinder mCurrentKey;
    private StatusBarNotification mCurrentNotification;
    private View mCurrentView;
    private IBinder mKeys[];
    private final int mLargeIconHeight;
    private LayoutTransition mLayoutTransition;
    private StatusBarNotification mQueue[];
    private int mQueuePos;
    private ViewGroup mWindow;
    private final WindowManager mWindowManager;
    private boolean mWindowShouldClose;

    public TabletTicker(TabletStatusBar tabletstatusbar)
    {
        mKeys = new IBinder[3];
        mQueue = new StatusBarNotification[3];
        mBar = tabletstatusbar;
        mContext = tabletstatusbar.getContext();
        mWindowManager = (WindowManager)mContext.getSystemService("window");
        mLargeIconHeight = mContext.getResources().getDimensionPixelSize(0x1050006);
    }

    private void advance()
    {
        boolean flag = true;
        if (mCurrentView != null)
        {
            if (mWindow != null)
                mWindow.removeView(mCurrentView);
            mCurrentView = null;
            mCurrentKey = null;
            mCurrentNotification = null;
        }
        dequeue();
        do
        {
label0:
            {
                if (mCurrentNotification != null)
                {
                    mCurrentView = makeTickerView(mCurrentNotification);
                    if (mCurrentView == null)
                        break label0;
                    if (mWindow == null)
                    {
                        mWindow = makeWindow();
                        mWindowManager.addView(mWindow, mWindow.getLayoutParams());
                    }
                    mWindow.addView(mCurrentView);
                    sendEmptyMessageDelayed(flag, 5000L);
                }
                if (mCurrentView != null || mWindow == null)
                    flag = false;
                mWindowShouldClose = flag;
                return;
            }
            dequeue();
        } while (true);
    }

    private void dequeue()
    {
        mCurrentKey = mKeys[0];
        mCurrentNotification = mQueue[0];
        int i = mQueuePos;
        for (int j = 0; j < i; j++)
        {
            mKeys[j] = mKeys[j + 1];
            mQueue[j] = mQueue[j + 1];
        }

        mKeys[i] = null;
        mQueue[i] = null;
        if (mQueuePos > 0)
            mQueuePos = -1 + mQueuePos;
    }

    private View makeTickerView(StatusBarNotification statusbarnotification)
    {
        Notification notification;
        LayoutInflater layoutinflater;
        int i;
        ViewGroup viewgroup;
        FrameLayout framelayout;
        Object obj;
        View view;
        notification = statusbarnotification.notification;
        layoutinflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        String s;
        View view1;
        if (notification.largeIcon != null)
            i = 0x7f080113;
        else
            i = 0x7f080111;
        if (notification.tickerView == null)
            break MISSING_BLOCK_LABEL_318;
        viewgroup = (ViewGroup)layoutinflater.inflate(0x7f040044, null, false);
        framelayout = (FrameLayout)viewgroup.findViewById(0x7f080114);
        obj = null;
        view1 = notification.tickerView.apply(mContext, framelayout);
        view = view1;
_L2:
        if (view == null)
        {
            s = (new StringBuilder()).append(statusbarnotification.pkg).append("/0x").append(Integer.toHexString(statusbarnotification.id)).toString();
            Slog.e("StatusBar.TabletTicker", (new StringBuilder()).append("couldn't inflate view for notification ").append(s).toString(), ((Throwable) (obj)));
            return null;
        }
        break; /* Loop/switch isn't completed */
        RuntimeException runtimeexception;
        runtimeexception;
        obj = runtimeexception;
        view = null;
        if (true) goto _L2; else goto _L1
_L1:
        android.widget.FrameLayout.LayoutParams layoutparams1 = new android.widget.FrameLayout.LayoutParams(-1, -1);
        framelayout.addView(view, layoutparams1);
_L3:
        ImageView imageview1 = (ImageView)viewgroup.findViewById(0x7f080110);
        if (notification.largeIcon != null)
        {
            imageview1.setImageBitmap(notification.largeIcon);
            imageview1.setVisibility(0);
            android.view.ViewGroup.LayoutParams layoutparams = imageview1.getLayoutParams();
            int j = mBar.getStatusBarHeight();
            android.graphics.drawable.Drawable drawable;
            ImageView imageview;
            android.app.PendingIntent pendingintent;
            if (notification.largeIcon.getHeight() <= j)
                layoutparams.height = j;
            else
                layoutparams.height = mLargeIconHeight;
            imageview1.setLayoutParams(layoutparams);
        }
        pendingintent = statusbarnotification.notification.contentIntent;
        if (pendingintent != null)
            viewgroup.setOnClickListener(new android.view.View.OnClickListener() {

                final TabletTicker this$0;
                final android.view.View.OnClickListener val$clicker;

                public void onClick(View view2)
                {
                    halt();
                    clicker.onClick(view2);
                }

            
            {
                this$0 = TabletTicker.this;
                clicker = onclicklistener;
                super();
            }
            }
);
        else
            viewgroup.setOnClickListener(null);
        return viewgroup;
        if (notification.tickerText != null)
        {
            viewgroup = (ViewGroup)layoutinflater.inflate(0x7f040043, mWindow, false);
            drawable = StatusBarIconView.getIcon(mContext, new StatusBarIcon(statusbarnotification.pkg, statusbarnotification.user, notification.icon, notification.iconLevel, 0, notification.tickerText));
            imageview = (ImageView)viewgroup.findViewById(i);
            imageview.setImageDrawable(drawable);
            imageview.setVisibility(0);
            ((TextView)viewgroup.findViewById(0x7f080112)).setText(notification.tickerText);
        } else
        {
            throw new RuntimeException("tickerView==null && tickerText==null");
        }
          goto _L3
    }

    private ViewGroup makeWindow()
    {
        Resources resources = mContext.getResources();
        FrameLayout framelayout = new FrameLayout(mContext);
        int i = resources.getDimensionPixelSize(0x7f0d004b);
        int j = 0x308 | 0x20;
        android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(i, mLargeIconHeight, 2024, j, -3);
        layoutparams.gravity = 85;
        mLayoutTransition = new LayoutTransition();
        mLayoutTransition.addTransitionListener(this);
        framelayout.setLayoutTransition(mLayoutTransition);
        layoutparams.setTitle("NotificationTicker");
        framelayout.setLayoutParams(layoutparams);
        return framelayout;
    }

    public void add(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        remove(ibinder, false);
        mKeys[mQueuePos] = ibinder;
        mQueue[mQueuePos] = statusbarnotification;
        if (mQueuePos == 0 && mCurrentNotification == null)
            sendEmptyMessage(1);
        if (mQueuePos < 2)
            mQueuePos = 1 + mQueuePos;
    }

    public void endTransition(LayoutTransition layouttransition, ViewGroup viewgroup, View view, int i)
    {
        if (mWindowShouldClose)
        {
            mWindowManager.removeView(mWindow);
            mWindow = null;
            mWindowShouldClose = false;
            mBar.doneTicking();
        }
    }

    public void halt()
    {
        removeMessages(1);
        if (mCurrentView != null || mQueuePos != 0)
        {
            for (int i = 0; i < 3; i++)
            {
                mKeys[i] = null;
                mQueue[i] = null;
            }

            mQueuePos = 0;
            sendEmptyMessage(1);
        }
    }

    public void handleMessage(Message message)
    {
        switch (message.what)
        {
        case 1: // '\001'
            advance();
            return;
        }
    }

    public void remove(IBinder ibinder)
    {
        remove(ibinder, true);
    }

    public void remove(IBinder ibinder, boolean flag)
    {
label0:
        {
            if (mCurrentKey == ibinder)
            {
                if (flag)
                {
                    removeMessages(1);
                    sendEmptyMessage(1);
                }
                break label0;
            }
            int i = 0;
            do
            {
                if (i >= 3)
                    break label0;
                if (mKeys[i] == ibinder)
                    break;
                i++;
            } while (true);
            for (; i < 2; i++)
            {
                mKeys[i] = mKeys[i + 1];
                mQueue[i] = mQueue[i + 1];
            }

            mKeys[2] = null;
            mQueue[2] = null;
            if (mQueuePos > 0)
            {
                mQueuePos = -1 + mQueuePos;
                return;
            }
        }
    }

    public void startTransition(LayoutTransition layouttransition, ViewGroup viewgroup, View view, int i)
    {
    }
}
