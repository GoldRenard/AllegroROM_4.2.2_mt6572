// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelView, PanelBar

public class PanelHolder extends FrameLayout
{

    private PanelBar mBar;
    private int mSelectedPanelIndex;

    public PanelHolder(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mSelectedPanelIndex = -1;
        setChildrenDrawingOrderEnabled(true);
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        if (mSelectedPanelIndex != -1)
        {
            if (j == i - 1)
                return mSelectedPanelIndex;
            if (j >= mSelectedPanelIndex)
                return j + 1;
        }
        return j;
    }

    public int getPanelIndex(PanelView panelview)
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            if (panelview == (PanelView)getChildAt(j))
                return j;

        return -1;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        setChildrenDrawingOrderEnabled(true);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        case 0: // '\0'
            PanelBar.LOG("PanelHolder got touch in open air, closing panels", new Object[0]);
            mBar.collapseAllPanels(true);
            return false;
        }
        return false;
    }

    public void setBar(PanelBar panelbar)
    {
        mBar = panelbar;
    }

    public void setSelectedPanel(PanelView panelview)
    {
        mSelectedPanelIndex = getPanelIndex(panelview);
    }
}
