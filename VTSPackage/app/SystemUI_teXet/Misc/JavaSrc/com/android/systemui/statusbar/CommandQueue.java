// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.os.*;
import com.android.internal.statusbar.*;

public class CommandQueue extends com.android.internal.statusbar.IStatusBar.Stub
{
    public static interface Callbacks
    {

        public abstract void addIcon(String s, int i, int j, StatusBarIcon statusbaricon);

        public abstract void addNotification(IBinder ibinder, StatusBarNotification statusbarnotification);

        public abstract void animateCollapsePanels(int i);

        public abstract void animateExpandNotificationsPanel();

        public abstract void animateExpandSettingsPanel();

        public abstract void cancelPreloadRecentApps();

        public abstract void disable(int i);

        public abstract void hideSearchPanel();

        public abstract void hideSimIndicator();

        public abstract void preloadRecentApps();

        public abstract void removeIcon(String s, int i, int j);

        public abstract void removeNotification(IBinder ibinder);

        public abstract void setHardKeyboardStatus(boolean flag, boolean flag1);

        public abstract void setImeWindowStatus(IBinder ibinder, int i, int j);

        public abstract void setNavigationIconHints(int i);

        public abstract void setSystemUiVisibility(int i, int j);

        public abstract void showApplicationGuide(String s);

        public abstract void showSearchPanel();

        public abstract void showSimIndicator(String s);

        public abstract void toggleRecentApps();

        public abstract void topAppWindowChanged(boolean flag);

        public abstract void updateIcon(String s, int i, int j, StatusBarIcon statusbaricon, StatusBarIcon statusbaricon1);

        public abstract void updateNotification(IBinder ibinder, StatusBarNotification statusbarnotification);
    }

    private final class H extends Handler
    {

        final CommandQueue this$0;

        public void handleMessage(Message message)
        {
            boolean flag = true;
            0xffff0000 & message.what;
            JVM INSTR lookupswitch 19: default 644
        //                       65536: 543
        //                       131072: 511
        //                       196608: 479
        //                       262144: 459
        //                       327680: 442
        //                       393216: 429
        //                       458752: 415
        //                       524288: 402
        //                       589824: 381
        //                       655360: 354
        //                       720896: 326
        //                       786432: 281
        //                       851968: 268
        //                       917504: 255
        //                       983040: 242
        //                       1048576: 225
        //                       1114112: 205
        //                       1179648: 192
        //                       1245184: 172;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20
_L20:
            mCallbacks.showApplicationGuide((String)message.obj);
            return;
_L19:
            mCallbacks.hideSimIndicator();
            return;
_L18:
            mCallbacks.showSimIndicator((String)message.obj);
            return;
_L17:
            mCallbacks.setNavigationIconHints(message.arg1);
            return;
_L16:
            mCallbacks.cancelPreloadRecentApps();
            return;
_L15:
            mCallbacks.preloadRecentApps();
            return;
_L14:
            mCallbacks.toggleRecentApps();
            return;
_L13:
            Callbacks callbacks1 = mCallbacks;
            boolean flag1;
            if (message.arg1 != 0)
                flag1 = flag;
            else
                flag1 = false;
            if (message.arg2 == 0)
                flag = false;
            callbacks1.setHardKeyboardStatus(flag1, flag);
            return;
_L12:
            mCallbacks.setImeWindowStatus((IBinder)message.obj, message.arg1, message.arg2);
            return;
_L11:
            Callbacks callbacks = mCallbacks;
            if (message.arg1 == 0)
                flag = false;
            callbacks.topAppWindowChanged(flag);
            return;
_L10:
            mCallbacks.setSystemUiVisibility(message.arg1, message.arg2);
            return;
_L9:
            mCallbacks.animateExpandSettingsPanel();
            return;
_L8:
            mCallbacks.animateCollapsePanels(0);
            return;
_L7:
            mCallbacks.animateExpandNotificationsPanel();
            return;
_L6:
            mCallbacks.disable(message.arg1);
            return;
_L5:
            mCallbacks.removeNotification((IBinder)message.obj);
            return;
_L4:
            NotificationQueueEntry notificationqueueentry1 = (NotificationQueueEntry)message.obj;
            mCallbacks.updateNotification(notificationqueueentry1.key, notificationqueueentry1.notification);
            return;
_L3:
            NotificationQueueEntry notificationqueueentry = (NotificationQueueEntry)message.obj;
            mCallbacks.addNotification(notificationqueueentry.key, notificationqueueentry.notification);
            return;
_L2:
            int i;
            int j;
            i = 0xffff & message.what;
            j = mList.getViewIndex(i);
            message.arg1;
            JVM INSTR tableswitch 1 2: default 758
        //                       1 645
        //                       2 592;
               goto _L21 _L22 _L23
_L23:
            if (mList.getIcon(i) != null)
            {
                mList.removeIcon(i);
                mCallbacks.removeIcon(mList.getSlot(i), i, j);
                return;
            }
_L1:
            return;
_L22:
            StatusBarIcon statusbaricon = (StatusBarIcon)message.obj;
            StatusBarIcon statusbaricon1 = mList.getIcon(i);
            if (statusbaricon1 == null)
            {
                mList.setIcon(i, statusbaricon);
                mCallbacks.addIcon(mList.getSlot(i), i, j, statusbaricon);
                return;
            } else
            {
                mList.setIcon(i, statusbaricon);
                mCallbacks.updateIcon(mList.getSlot(i), i, j, statusbaricon1, statusbaricon);
                return;
            }
_L21:
        }

        private H()
        {
            this$0 = CommandQueue.this;
            super();
        }

    }

    private class NotificationQueueEntry
    {

        IBinder key;
        StatusBarNotification notification;
        final CommandQueue this$0;

        private NotificationQueueEntry()
        {
            this$0 = CommandQueue.this;
            super();
        }

    }


    public static final int FLAG_EXCLUDE_COMPAT_MODE_PANEL = 16;
    public static final int FLAG_EXCLUDE_INPUT_METHODS_PANEL = 8;
    public static final int FLAG_EXCLUDE_NONE = 0;
    public static final int FLAG_EXCLUDE_NOTIFICATION_PANEL = 4;
    public static final int FLAG_EXCLUDE_RECENTS_PANEL = 2;
    public static final int FLAG_EXCLUDE_SEARCH_PANEL = 1;
    private static final int INDEX_MASK = 65535;
    private static final int MSG_ADD_NOTIFICATION = 0x20000;
    private static final int MSG_CANCEL_PRELOAD_RECENT_APPS = 0xf0000;
    private static final int MSG_COLLAPSE_PANELS = 0x70000;
    private static final int MSG_DISABLE = 0x50000;
    private static final int MSG_EXPAND_NOTIFICATIONS = 0x60000;
    private static final int MSG_EXPAND_SETTINGS = 0x80000;
    private static final int MSG_HIDE_SIM_INDICATOR = 0x120000;
    private static final int MSG_ICON = 0x10000;
    private static final int MSG_MASK = 0xffff0000;
    private static final int MSG_PRELOAD_RECENT_APPS = 0xe0000;
    private static final int MSG_REMOVE_NOTIFICATION = 0x40000;
    private static final int MSG_SET_HARD_KEYBOARD_STATUS = 0xc0000;
    private static final int MSG_SET_NAVIGATION_ICON_HINTS = 0x100000;
    private static final int MSG_SET_SYSTEMUI_VISIBILITY = 0x90000;
    private static final int MSG_SHIFT = 16;
    private static final int MSG_SHOW_APPLICATION_GUIDE = 0x130000;
    private static final int MSG_SHOW_IME_BUTTON = 0xb0000;
    private static final int MSG_SHOW_SIM_INDICATOR = 0x110000;
    private static final int MSG_TOGGLE_RECENT_APPS = 0xd0000;
    private static final int MSG_TOP_APP_WINDOW_CHANGED = 0xa0000;
    private static final int MSG_UPDATE_NOTIFICATION = 0x30000;
    private static final int OP_REMOVE_ICON = 2;
    private static final int OP_SET_ICON = 1;
    private Callbacks mCallbacks;
    private Handler mHandler;
    private StatusBarIconList mList;

    public CommandQueue(Callbacks callbacks, StatusBarIconList statusbariconlist)
    {
        mHandler = new H();
        mCallbacks = callbacks;
        mList = statusbariconlist;
    }

    public void addNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        synchronized (mList)
        {
            NotificationQueueEntry notificationqueueentry = new NotificationQueueEntry();
            notificationqueueentry.key = ibinder;
            notificationqueueentry.notification = statusbarnotification;
            mHandler.obtainMessage(0x20000, 0, 0, notificationqueueentry).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void animateCollapsePanels()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x70000);
            mHandler.sendEmptyMessage(0x70000);
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void animateExpandNotificationsPanel()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x60000);
            mHandler.sendEmptyMessage(0x60000);
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void animateExpandSettingsPanel()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x80000);
            mHandler.sendEmptyMessage(0x80000);
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void cancelPreloadRecentApps()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0xf0000);
            mHandler.obtainMessage(0xf0000, 0, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void disable(int i)
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x50000);
            mHandler.obtainMessage(0x50000, i, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void hideSimIndicator()
    {
        synchronized (mList)
        {
            mHandler.obtainMessage(0x120000, 0, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void preloadRecentApps()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0xe0000);
            mHandler.obtainMessage(0xe0000, 0, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void removeIcon(int i)
    {
        StatusBarIconList statusbariconlist = mList;
        statusbariconlist;
        JVM INSTR monitorenter ;
        int j = 0x10000 | i;
        mHandler.removeMessages(j);
        mHandler.obtainMessage(j, 2, 0, null).sendToTarget();
        statusbariconlist;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void removeNotification(IBinder ibinder)
    {
        synchronized (mList)
        {
            mHandler.obtainMessage(0x40000, 0, 0, ibinder).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setHardKeyboardStatus(boolean flag, boolean flag1)
    {
        int i = 1;
        StatusBarIconList statusbariconlist = mList;
        statusbariconlist;
        JVM INSTR monitorenter ;
        Handler handler;
        mHandler.removeMessages(0xc0000);
        handler = mHandler;
        Exception exception;
        int j;
        if (flag)
            j = i;
        else
            j = 0;
        if (!flag1)
            i = 0;
          goto _L1
_L3:
        handler.obtainMessage(0xc0000, j, i).sendToTarget();
        statusbariconlist;
        JVM INSTR monitorexit ;
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
_L1:
        if (true) goto _L3; else goto _L2
_L2:
    }

    public void setIcon(int i, StatusBarIcon statusbaricon)
    {
        StatusBarIconList statusbariconlist = mList;
        statusbariconlist;
        JVM INSTR monitorenter ;
        int j = 0x10000 | i;
        mHandler.removeMessages(j);
        mHandler.obtainMessage(j, 1, 0, statusbaricon.clone()).sendToTarget();
        statusbariconlist;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setImeWindowStatus(IBinder ibinder, int i, int j)
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0xb0000);
            mHandler.obtainMessage(0xb0000, i, j, ibinder).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setNavigationIconHints(int i)
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x100000);
            mHandler.obtainMessage(0x100000, i, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setSystemUiVisibility(int i, int j)
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0x90000);
            mHandler.obtainMessage(0x90000, i, j, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void showApplicationGuide(String s)
    {
        synchronized (mList)
        {
            mHandler.obtainMessage(0x130000, 0, 0, s).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void showSimIndicator(String s)
    {
        synchronized (mList)
        {
            mHandler.obtainMessage(0x110000, 0, 0, s).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void toggleRecentApps()
    {
        synchronized (mList)
        {
            mHandler.removeMessages(0xd0000);
            mHandler.obtainMessage(0xd0000, 0, 0, null).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void topAppWindowChanged(boolean flag)
    {
        StatusBarIconList statusbariconlist = mList;
        statusbariconlist;
        JVM INSTR monitorenter ;
        Handler handler;
        mHandler.removeMessages(0xa0000);
        handler = mHandler;
        int i;
        i = 0;
        if (flag)
            i = 1;
        handler.obtainMessage(0xa0000, i, 0, null).sendToTarget();
        statusbariconlist;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void updateNotification(IBinder ibinder, StatusBarNotification statusbarnotification)
    {
        synchronized (mList)
        {
            NotificationQueueEntry notificationqueueentry = new NotificationQueueEntry();
            notificationqueueentry.key = ibinder;
            notificationqueueentry.notification = statusbarnotification;
            mHandler.obtainMessage(0x30000, 0, 0, notificationqueueentry).sendToTarget();
        }
        return;
        exception;
        statusbariconlist;
        JVM INSTR monitorexit ;
        throw exception;
    }


}
