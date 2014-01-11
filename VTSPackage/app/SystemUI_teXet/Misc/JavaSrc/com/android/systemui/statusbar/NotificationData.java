// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.app.Notification;
import android.os.IBinder;
import android.view.View;
import android.widget.ImageView;
import com.android.internal.statusbar.StatusBarNotification;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar:
//            StatusBarIconView

public class NotificationData
{
    public static final class Entry
    {

        public View content;
        public View expanded;
        protected View expandedLarge;
        public StatusBarIconView icon;
        public IBinder key;
        public ImageView largeIcon;
        public StatusBarNotification notification;
        public View row;

        public boolean expandable()
        {
            return NotificationData.getIsExpandable(row);
        }

        public View getLargeView()
        {
            return expandedLarge;
        }

        public void setLargeView(View view)
        {
            expandedLarge = view;
            View view1 = row;
            boolean flag;
            if (view != null)
                flag = true;
            else
                flag = false;
            NotificationData.writeBooleanTag(view1, 0x7f080002, flag);
        }

        public boolean setUserExpanded(boolean flag)
        {
            return NotificationData.setUserExpanded(row, flag);
        }

        public boolean setUserLocked(boolean flag)
        {
            return NotificationData.setUserLocked(row, flag);
        }

        public boolean userExpanded()
        {
            return NotificationData.getUserExpanded(row);
        }

        public boolean userLocked()
        {
            return NotificationData.getUserLocked(row);
        }


        public Entry(IBinder ibinder, StatusBarNotification statusbarnotification, StatusBarIconView statusbariconview)
        {
            key = ibinder;
            notification = statusbarnotification;
            icon = statusbariconview;
        }
    }


    private final ArrayList mEntries = new ArrayList();
    private final Comparator mEntryCmp = new Comparator() {

        final NotificationData this$0;

        public int compare(Entry entry, Entry entry1)
        {
            StatusBarNotification statusbarnotification = entry.notification;
            StatusBarNotification statusbarnotification1 = entry1.notification;
            int i = statusbarnotification.score - statusbarnotification1.score;
            if (i != 0)
                return i;
            else
                return (int)(statusbarnotification.notification.when - statusbarnotification1.notification.when);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((Entry)obj, (Entry)obj1);
        }

            
            {
                this$0 = NotificationData.this;
                super();
            }
    }
;


    public static boolean getIsExpandable(View view)
    {
        return readBooleanTag(view, 0x7f080002);
    }

    public static boolean getUserExpanded(View view)
    {
        return readBooleanTag(view, 0x7f080003);
    }

    public static boolean getUserLocked(View view)
    {
        return readBooleanTag(view, 0x7f080004);
    }

    protected static boolean readBooleanTag(View view, int i)
    {
        boolean flag = false;
        if (view != null)
        {
            Object obj = view.getTag(i);
            flag = false;
            if (obj != null)
            {
                boolean flag1 = obj instanceof Boolean;
                flag = false;
                if (flag1)
                {
                    boolean flag2 = ((Boolean)obj).booleanValue();
                    flag = false;
                    if (flag2)
                        flag = true;
                }
            }
        }
        return flag;
    }

    public static boolean setUserExpanded(View view, boolean flag)
    {
        return writeBooleanTag(view, 0x7f080003, flag);
    }

    public static boolean setUserLocked(View view, boolean flag)
    {
        return writeBooleanTag(view, 0x7f080004, flag);
    }

    protected static boolean writeBooleanTag(View view, int i, boolean flag)
    {
        if (view != null)
        {
            view.setTag(i, Boolean.valueOf(flag));
            return flag;
        } else
        {
            return false;
        }
    }

    public int add(IBinder ibinder, StatusBarNotification statusbarnotification, View view, View view1, View view2, StatusBarIconView statusbariconview)
    {
        Entry entry = new Entry();
        entry.key = ibinder;
        entry.notification = statusbarnotification;
        entry.row = view;
        entry.content = view1;
        entry.expanded = view2;
        entry.icon = statusbariconview;
        entry.largeIcon = null;
        return add(entry);
    }

    public int add(Entry entry)
    {
        int i = mEntries.size();
        int j;
        for (j = 0; j < i && mEntryCmp.compare(mEntries.get(j), entry) <= 0; j++);
        mEntries.add(j, entry);
        return j;
    }

    public Entry findByKey(IBinder ibinder)
    {
        for (Iterator iterator = mEntries.iterator(); iterator.hasNext();)
        {
            Entry entry = (Entry)iterator.next();
            if (entry.key == ibinder)
                return entry;
        }

        return null;
    }

    public Entry get(int i)
    {
        return (Entry)mEntries.get(i);
    }

    public boolean hasClearableItems()
    {
        for (Iterator iterator = mEntries.iterator(); iterator.hasNext();)
        {
            Entry entry = (Entry)iterator.next();
            if (entry.expanded != null && entry.notification.isClearable())
                return true;
        }

        return false;
    }

    public boolean hasVisibleItems()
    {
        for (Iterator iterator = mEntries.iterator(); iterator.hasNext();)
            if (((Entry)iterator.next()).expanded != null)
                return true;

        return false;
    }

    public Entry remove(IBinder ibinder)
    {
        Entry entry = findByKey(ibinder);
        if (entry != null)
            mEntries.remove(entry);
        return entry;
    }

    public int size()
    {
        return mEntries.size();
    }
}
