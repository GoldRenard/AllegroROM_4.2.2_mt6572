// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.*;
import android.view.*;
import android.widget.LinearLayout;
import android.widget.RemoteViews;
import com.android.systemui.SwipeHelper;
import com.android.systemui.statusbar.BaseStatusBar;

public class IntruderAlertView extends LinearLayout
    implements com.android.systemui.SwipeHelper.Callback
{

    private static final boolean DEBUG = false;
    private static final String TAG = "IntruderAlertView";
    BaseStatusBar mBar;
    private ViewGroup mContentHolder;
    private RemoteViews mIntruderRemoteViews;
    private android.view.View.OnClickListener mOnClickListener;
    private SwipeHelper mSwipeHelper;
    Rect mTmpRect;

    public IntruderAlertView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public IntruderAlertView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTmpRect = new Rect();
        setOrientation(1);
    }

    public void applyIntruderContent(RemoteViews remoteviews, android.view.View.OnClickListener onclicklistener)
    {
        mIntruderRemoteViews = remoteviews;
        mOnClickListener = onclicklistener;
        if (mContentHolder == null)
            return;
        mContentHolder.setX(0.0F);
        mContentHolder.setVisibility(0);
        mContentHolder.setAlpha(1.0F);
        mContentHolder.removeAllViews();
        View view = remoteviews.apply(getContext(), mContentHolder);
        if (onclicklistener != null)
        {
            view.setOnClickListener(onclicklistener);
            android.graphics.drawable.Drawable drawable = getResources().getDrawable(0x7f020113);
            if (drawable == null)
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(0x7f020113);
                Log.e("IntruderAlertView", String.format("Can't find background drawable id=0x%08x", aobj));
            } else
            {
                view.setBackgroundDrawable(drawable);
            }
        }
        mContentHolder.addView(view);
    }

    public boolean canChildBeDismissed(View view)
    {
        return true;
    }

    public View getChildAtPosition(MotionEvent motionevent)
    {
        return mContentHolder;
    }

    public View getChildContentView(View view)
    {
        return view;
    }

    public void onAttachedToWindow()
    {
        mSwipeHelper = new SwipeHelper(0, this, getResources().getDisplayMetrics().density, ViewConfiguration.get(getContext()).getScaledPagingTouchSlop());
        mContentHolder = (ViewGroup)findViewById(0x7f080063);
        if (mIntruderRemoteViews != null)
            applyIntruderContent(mIntruderRemoteViews, mOnClickListener);
    }

    public void onBeginDrag(View view)
    {
    }

    public void onChildDismissed(View view)
    {
        Slog.v("IntruderAlertView", "User swiped intruder to dismiss");
        mBar.dismissIntruder();
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        float f = getResources().getDisplayMetrics().density;
        mSwipeHelper.setDensityScale(f);
        float f1 = ViewConfiguration.get(getContext()).getScaledPagingTouchSlop();
        mSwipeHelper.setPagingTouchSlop(f1);
    }

    public void onDragCancelled(View view)
    {
        mContentHolder.setAlpha(1.0F);
    }

    public void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onInterceptTouchEvent(motionevent) || super.onInterceptTouchEvent(motionevent);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onTouchEvent(motionevent) || super.onTouchEvent(motionevent);
    }

    public void setBar(BaseStatusBar basestatusbar)
    {
        mBar = basestatusbar;
    }
}
