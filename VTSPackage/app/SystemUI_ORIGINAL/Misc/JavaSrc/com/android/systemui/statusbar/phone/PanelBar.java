// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelView, PanelHolder

public class PanelBar extends FrameLayout
{

    public static final boolean DEBUG = false;
    public static final int STATE_CLOSED = 0;
    public static final int STATE_OPEN = 2;
    public static final int STATE_OPENING = 1;
    public static final String TAG = com/android/systemui/statusbar/phone/PanelBar.getSimpleName();
    float mPanelExpandedFractionSum;
    PanelHolder mPanelHolder;
    ArrayList mPanels;
    private int mState;
    PanelView mTouchingPanel;
    private boolean mTracking;

    public PanelBar(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mPanels = new ArrayList();
        mState = 0;
    }

    public static final transient void LOG(String s, Object aobj[])
    {
    }

    public void addPanel(PanelView panelview)
    {
        mPanels.add(panelview);
        panelview.setBar(this);
    }

    public void collapseAllPanels(boolean flag)
    {
        boolean flag1 = false;
        for (Iterator iterator = mPanels.iterator(); iterator.hasNext();)
        {
            PanelView panelview = (PanelView)iterator.next();
            if (flag && !panelview.isFullyCollapsed())
            {
                panelview.collapse();
                flag1 = true;
            } else
            {
                panelview.setExpandedFraction(0.0F);
                panelview.setVisibility(8);
            }
        }

        if (!flag1 && mState != 0)
        {
            go(0);
            onAllPanelsCollapsed();
        }
    }

    public float getBarHeight()
    {
        return (float)getMeasuredHeight();
    }

    public void go(int i)
    {
        mState = i;
    }

    public void onAllPanelsCollapsed()
    {
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
    }

    public void onPanelFullyOpened(PanelView panelview)
    {
    }

    public void onPanelPeeked()
    {
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = true;
        if (!panelsEnabled())
            return false;
        if (motionevent.getAction() == 0)
        {
            PanelView panelview = selectPanelForTouch(motionevent);
            if (panelview == null)
            {
                mTouchingPanel = null;
                return flag;
            }
            if (!panelview.isEnabled())
            {
                mTouchingPanel = null;
                return flag;
            }
            startOpeningPanel(panelview);
        }
        if (mTouchingPanel != null)
            flag = mTouchingPanel.onTouchEvent(motionevent);
        return flag;
    }

    public void onTrackingStarted(PanelView panelview)
    {
        mTracking = true;
    }

    public void onTrackingStopped(PanelView panelview)
    {
        mTracking = false;
        panelExpansionChanged(panelview, panelview.getExpandedFraction());
    }

    public void panelExpansionChanged(PanelView panelview, float f)
    {
        boolean flag = true;
        PanelView panelview1 = null;
        mPanelExpandedFractionSum = 0.0F;
        Iterator iterator = mPanels.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            PanelView panelview2 = (PanelView)iterator.next();
            boolean flag1;
            if (panelview2.getVisibility() == 0)
                flag1 = true;
            else
                flag1 = false;
            if (panelview2.getExpandedHeight() > 0.0F)
            {
                if (mState == 0)
                {
                    go(1);
                    onPanelPeeked();
                }
                float f1 = panelview2.getExpandedFraction();
                float f2 = mPanelExpandedFractionSum;
                float f3;
                if (flag1)
                    f3 = f1;
                else
                    f3 = 0.0F;
                mPanelExpandedFractionSum = f3 + f2;
                flag = false;
                if (panelview == panelview2)
                {
                    int i = f1 != 1.0F;
                    flag = false;
                    if (i == 0)
                        panelview1 = panelview;
                }
            }
            if (panelview2.getExpandedHeight() > 0.0F)
            {
                if (!flag1)
                    panelview2.setVisibility(0);
            } else
            if (flag1)
                panelview2.setVisibility(8);
        } while (true);
        mPanelExpandedFractionSum = mPanelExpandedFractionSum / (float)mPanels.size();
        if (panelview1 != null && !mTracking)
        {
            go(2);
            onPanelFullyOpened(panelview1);
        } else
        if (flag && !mTracking && mState != 0)
        {
            go(0);
            onAllPanelsCollapsed();
            return;
        }
    }

    public boolean panelsEnabled()
    {
        return true;
    }

    public PanelView selectPanelForTouch(MotionEvent motionevent)
    {
        int i = mPanels.size();
        return (PanelView)mPanels.get((int)(((float)i * motionevent.getX()) / (float)getMeasuredWidth()));
    }

    public void setPanelHolder(PanelHolder panelholder)
    {
        if (panelholder == null)
        {
            Slog.e(TAG, "setPanelHolder: null PanelHolder", new Throwable());
        } else
        {
            panelholder.setBar(this);
            mPanelHolder = panelholder;
            int i = panelholder.getChildCount();
            for (int j = 0; j < i; j++)
            {
                android.view.View view = panelholder.getChildAt(j);
                if (view != null && (view instanceof PanelView))
                    addPanel((PanelView)view);
            }

        }
    }

    public void startOpeningPanel(PanelView panelview)
    {
        mTouchingPanel = panelview;
        mPanelHolder.setSelectedPanel(mTouchingPanel);
        Iterator iterator = mPanels.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            PanelView panelview1 = (PanelView)iterator.next();
            if (panelview1 != panelview)
                panelview1.collapse();
        } while (true);
    }

}
