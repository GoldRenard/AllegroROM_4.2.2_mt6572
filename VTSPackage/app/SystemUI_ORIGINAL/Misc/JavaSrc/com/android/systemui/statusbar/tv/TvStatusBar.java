// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tv;

import android.os.IBinder;
import android.view.View;
import com.android.internal.statusbar.StatusBarIcon;
import com.android.internal.statusbar.StatusBarNotification;
import com.android.systemui.statusbar.BaseStatusBar;

public class TvStatusBar extends BaseStatusBar
{


    public void addIcon(String s, int i, int j, StatusBarIcon statusbaricon)
    {
    }

    public void addNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
    }

    public void animateCollapsePanels(int i)
    {
    }

    public void animateExpandNotificationsPanel()
    {
    }

    public void animateExpandSettingsPanel()
    {
    }

    protected void createAndAddWindows()
    {
    }

    public void disable(int i)
    {
    }

    protected int getExpandedViewMaxHeight()
    {
        return 0;
    }

    protected android.view.WindowManager.LayoutParams getRecentsLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return null;
    }

    protected android.view.WindowManager.LayoutParams getSearchLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return null;
    }

    public View getStatusBarView()
    {
        return null;
    }

    protected void haltTicker()
    {
    }

    public void hideSimIndicator()
    {
    }

    public boolean isExpanded()
    {
        return false;
    }

    public void removeIcon(String s, int i, int j)
    {
    }

    public void removeNotification(IBinder ibinder)
    {
    }

    protected void setAreThereNotifications()
    {
    }

    public void setHardKeyboardStatus(boolean flag, boolean flag1)
    {
    }

    public void setImeWindowStatus(IBinder ibinder, int i, int j)
    {
    }

    public void setNavigationIconHints(int i)
    {
    }

    public void setSystemUiVisibility(int i, int j)
    {
    }

    protected boolean shouldDisableNavbarGestures()
    {
        return true;
    }

    public void showApplicationGuide(String s)
    {
    }

    public void showSimIndicator(String s)
    {
    }

    protected void tick(IBinder ibinder, StatusBarNotification statusbarnotification, boolean flag)
    {
    }

    public void toggleRecentApps()
    {
    }

    public void topAppWindowChanged(boolean flag)
    {
    }

    protected void updateExpandedViewPos(int i)
    {
    }

    public void updateIcon(String s, int i, int j, StatusBarIcon statusbaricon, StatusBarIcon statusbaricon1)
    {
    }

    public void updateNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
    }

    protected void updateNotificationIcons()
    {
    }
}
