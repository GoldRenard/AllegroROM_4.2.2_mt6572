// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.*;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import com.android.systemui.ExpandHelper;
import com.android.systemui.statusbar.policy.NotificationRowLayout;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PhoneStatusBar, NotificationPanelView

public class StatusBarWindowView extends FrameLayout
{

    public static final boolean DEBUG = false;
    public static final String TAG = "StatusBarWindowView";
    private NotificationRowLayout latestItems;
    private ExpandHelper mExpandHelper;
    private final android.view.ViewTreeObserver.OnGlobalLayoutListener mGlobalLayoutListener = new android.view.ViewTreeObserver.OnGlobalLayoutListener() {

        final StatusBarWindowView this$0;

        public void onGlobalLayout()
        {
            if (mService.mNeedRelayout)
            {
                requestLayout();
                mService.mNeedRelayout = false;
                mService.updateCarrierLabelVisibility(true);
            }
        }

            
            {
                this$0 = StatusBarWindowView.this;
                super();
            }
    }
;
    private NotificationPanelView mNotificationPanel;
    private ScrollView mScrollView;
    PhoneStatusBar mService;

    public StatusBarWindowView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setMotionEventSplittingEnabled(false);
        setWillNotDraw(true);
    }

    public void cancelExpandHelper()
    {
        if (mExpandHelper != null)
            mExpandHelper.cancel();
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        boolean flag = true;
        boolean flag1;
        if (keyevent.getAction() == 0)
            flag1 = flag;
        else
            flag1 = false;
        switch (keyevent.getKeyCode())
        {
        case 4: // '\004'
            if (!flag1)
            {
                mService.animateCollapsePanels();
                return flag;
            }
            break;

        default:
            flag = super.dispatchKeyEvent(keyevent);
            break;
        }
        return flag;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        latestItems = (NotificationRowLayout)findViewById(0x7f08005d);
        mScrollView = (ScrollView)findViewById(0x7f08005c);
        mNotificationPanel = (NotificationPanelView)findViewById(0x7f080058);
        int i = getResources().getDimensionPixelSize(0x7f0d001a);
        int j = getResources().getDimensionPixelSize(0x7f0d001b);
        mExpandHelper = new ExpandHelper(mContext, latestItems, i, j);
        mExpandHelper.setEventSource(this);
        mExpandHelper.setScrollView(mScrollView);
        getViewTreeObserver().addOnGlobalLayoutListener(mGlobalLayoutListener);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        getViewTreeObserver().removeGlobalOnLayoutListener(mGlobalLayoutListener);
    }

    public void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        boolean flag = mNotificationPanel.isFullyExpanded();
        boolean flag1 = false;
        if (flag)
        {
            int i = mScrollView.getVisibility();
            flag1 = false;
            if (i == 0)
                flag1 = mExpandHelper.onInterceptTouchEvent(motionevent);
        }
        if (!flag1)
            super.onInterceptTouchEvent(motionevent);
        if (flag1)
        {
            MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
            motionevent1.setAction(3);
            latestItems.onInterceptTouchEvent(motionevent1);
            motionevent1.recycle();
        }
        return flag1;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = mNotificationPanel.isFullyExpanded();
        boolean flag1 = false;
        if (flag)
            flag1 = mExpandHelper.onTouchEvent(motionevent);
        if (!flag1)
            flag1 = super.onTouchEvent(motionevent);
        return flag1;
    }
}
