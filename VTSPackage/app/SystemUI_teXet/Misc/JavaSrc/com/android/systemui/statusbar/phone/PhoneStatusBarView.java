// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelBar, PanelView, PhoneStatusBar, StatusBarWindowView

public class PhoneStatusBarView extends PanelBar
{

    private static final boolean DEBUG = false;
    private static final String TAG = "PhoneStatusBarView";
    PhoneStatusBar mBar;
    PanelView mFadingPanel;
    boolean mFullWidthNotifications;
    PanelView mLastFullyOpenedPanel;
    PanelView mNotificationPanel;
    int mScrimColor;
    PanelView mSettingsPanel;
    float mSettingsPanelDragzoneFrac;
    float mSettingsPanelDragzoneMin;
    private boolean mShouldFade;

    public PhoneStatusBarView(Context context, AttributeSet attributeset)
    {
        boolean flag = true;
        super(context, attributeset);
        mFadingPanel = null;
        mLastFullyOpenedPanel = null;
        Resources resources = getContext().getResources();
        mScrimColor = resources.getColor(0x7f090003);
        mSettingsPanelDragzoneMin = resources.getDimension(0x7f0d003b);
        try
        {
            mSettingsPanelDragzoneFrac = resources.getFraction(0x7f0d003a, 1, 1);
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            mSettingsPanelDragzoneFrac = 0.0F;
        }
        if (mSettingsPanelDragzoneFrac > 0.0F)
            flag = false;
        mFullWidthNotifications = flag;
    }

    public void addPanel(PanelView panelview)
    {
        super.addPanel(panelview);
        if (panelview.getId() == 0x7f080058)
            mNotificationPanel = panelview;
        else
        if (panelview.getId() == 0x7f080070)
            mSettingsPanel = panelview;
        boolean flag;
        if (!mFullWidthNotifications)
            flag = true;
        else
            flag = false;
        panelview.setRubberbandingEnabled(flag);
    }

    public boolean hasFullWidthNotifications()
    {
        return mFullWidthNotifications;
    }

    public void onAllPanelsCollapsed()
    {
        super.onAllPanelsCollapsed();
        mBar.makeExpandedInvisibleSoon();
        mFadingPanel = null;
        mLastFullyOpenedPanel = null;
    }

    public void onAttachedToWindow()
    {
        PanelView panelview;
        boolean flag;
        for (Iterator iterator = super.mPanels.iterator(); iterator.hasNext(); panelview.setRubberbandingEnabled(flag))
        {
            panelview = (PanelView)iterator.next();
            if (!mFullWidthNotifications)
                flag = true;
            else
                flag = false;
        }

    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mBar.interceptTouchEvent(motionevent) || super.onInterceptTouchEvent(motionevent);
    }

    public void onPanelFullyOpened(PanelView panelview)
    {
        super.onPanelFullyOpened(panelview);
        if (panelview != mLastFullyOpenedPanel)
            panelview.sendAccessibilityEvent(32);
        mFadingPanel = panelview;
        mLastFullyOpenedPanel = panelview;
        mShouldFade = true;
    }

    public void onPanelPeeked()
    {
        super.onPanelPeeked();
        mBar.makeExpandedVisible(true);
    }

    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (super.onRequestSendAccessibilityEvent(view, accessibilityevent))
        {
            AccessibilityEvent accessibilityevent1 = AccessibilityEvent.obtain();
            onInitializeAccessibilityEvent(accessibilityevent1);
            dispatchPopulateAccessibilityEvent(accessibilityevent1);
            accessibilityevent.appendRecord(accessibilityevent1);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mBar.interceptTouchEvent(motionevent) || super.onTouchEvent(motionevent);
    }

    public void panelExpansionChanged(PanelView panelview, float f)
    {
        super.panelExpansionChanged(panelview, f);
        if (panelview == mFadingPanel && mScrimColor != 0 && ActivityManager.isHighEndGfx() && mShouldFade)
        {
            float f4 = 1.2F * super.mPanelExpandedFractionSum - 0.2F;
            if (f4 <= 0.0F)
            {
                mBar.mStatusBarWindow.setBackgroundColor(0);
            } else
            {
                int j = (int)((float)(1.0D - 0.5D * (1.0D - Math.cos(3.1415901184082031D * Math.pow(1.0F - f4, 2D)))) * (float)(mScrimColor >>> 24)) << 24 | 0xffffff & mScrimColor;
                mBar.mStatusBarWindow.setBackgroundColor(j);
            }
        }
        int i = mBar.getStatusBarHeight();
        float f1 = panelview.getExpandedHeight() + (float)panelview.getPaddingBottom();
        float f2 = 1.0F;
        if (f1 < (float)(i * 2))
        {
            float f3;
            if (f1 < (float)i)
                f3 = 0.0F;
            else
                f3 = (f1 - (float)i) / (float)i;
            f2 = f3 * f3;
        }
        if (panelview.getAlpha() != f2)
            panelview.setAlpha(f2);
        mBar.updateCarrierLabelVisibility(false);
    }

    public boolean panelsEnabled()
    {
        return (0x10000 & mBar.mDisabled) == 0;
    }

    public PanelView selectPanelForTouch(MotionEvent motionevent)
    {
        float f = motionevent.getX();
        if (mFullWidthNotifications)
        {
            float f3;
            if (mSettingsPanel == null)
                f3 = 0.0F;
            else
                f3 = mSettingsPanel.getExpandedHeight();
            if (f3 + mNotificationPanel.getExpandedHeight() > 0.0F)
                return null;
            else
                return mNotificationPanel;
        }
        float f1 = getMeasuredWidth();
        float f2 = f1 * mSettingsPanelDragzoneFrac;
        if (f2 < mSettingsPanelDragzoneMin)
            f2 = mSettingsPanelDragzoneMin;
        if (f1 - f < f2)
            return mSettingsPanel;
        else
            return mNotificationPanel;
    }

    public void setBar(PhoneStatusBar phonestatusbar)
    {
        mBar = phonestatusbar;
    }

    public void startOpeningPanel(PanelView panelview)
    {
        super.startOpeningPanel(panelview);
        boolean flag;
        if (mFadingPanel != null && !mFadingPanel.isFullyExpanded())
            flag = false;
        else
            flag = true;
        mShouldFade = flag;
        mFadingPanel = panelview;
    }
}
