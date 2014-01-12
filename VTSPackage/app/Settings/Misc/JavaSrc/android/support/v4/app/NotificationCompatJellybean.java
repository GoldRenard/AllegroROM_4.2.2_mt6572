// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

class NotificationCompatJellybean
{

    private android.app.Notification.Builder b;

    public NotificationCompatJellybean(Context context, Notification notification, CharSequence charsequence, CharSequence charsequence1, CharSequence charsequence2, RemoteViews remoteviews, int i, 
            PendingIntent pendingintent, PendingIntent pendingintent1, Bitmap bitmap, int j, int k, boolean flag, boolean flag1, 
            int l, CharSequence charsequence3)
    {
        android.app.Notification.Builder builder = (new android.app.Notification.Builder(context)).setWhen(notification.when).setSmallIcon(notification.icon, notification.iconLevel).setContent(notification.contentView).setTicker(notification.tickerText, remoteviews).setSound(notification.sound, notification.audioStreamType).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS);
        boolean flag2;
        if ((2 & notification.flags) != 0)
            flag2 = true;
        else
            flag2 = false;
        android.app.Notification.Builder builder1 = builder.setOngoing(flag2);
        boolean flag3;
        if ((8 & notification.flags) != 0)
            flag3 = true;
        else
            flag3 = false;
        android.app.Notification.Builder builder2 = builder1.setOnlyAlertOnce(flag3);
        boolean flag4;
        if ((0x10 & notification.flags) != 0)
            flag4 = true;
        else
            flag4 = false;
        android.app.Notification.Builder builder3 = builder2.setAutoCancel(flag4).setDefaults(notification.defaults).setContentTitle(charsequence).setContentText(charsequence1).setSubText(charsequence3).setContentInfo(charsequence2).setContentIntent(pendingintent).setDeleteIntent(notification.deleteIntent);
        boolean flag5;
        if ((0x80 & notification.flags) != 0)
            flag5 = true;
        else
            flag5 = false;
        b = builder3.setFullScreenIntent(pendingintent1, flag5).setLargeIcon(bitmap).setNumber(i).setUsesChronometer(flag1).setPriority(l).setProgress(j, k, flag);
    }

    public void addAction(int i, CharSequence charsequence, PendingIntent pendingintent)
    {
        b.addAction(i, charsequence, pendingintent);
    }

    public void addBigPictureStyle(CharSequence charsequence, boolean flag, CharSequence charsequence1, Bitmap bitmap)
    {
        android.app.Notification.BigPictureStyle bigpicturestyle = (new android.app.Notification.BigPictureStyle(b)).setBigContentTitle(charsequence).bigPicture(bitmap);
        if (flag)
            bigpicturestyle.setSummaryText(charsequence1);
    }

    public void addBigTextStyle(CharSequence charsequence, boolean flag, CharSequence charsequence1, CharSequence charsequence2)
    {
        android.app.Notification.BigTextStyle bigtextstyle = (new android.app.Notification.BigTextStyle(b)).setBigContentTitle(charsequence).bigText(charsequence2);
        if (flag)
            bigtextstyle.setSummaryText(charsequence1);
    }

    public void addInboxStyle(CharSequence charsequence, boolean flag, CharSequence charsequence1, ArrayList arraylist)
    {
        android.app.Notification.InboxStyle inboxstyle = (new android.app.Notification.InboxStyle(b)).setBigContentTitle(charsequence);
        if (flag)
            inboxstyle.setSummaryText(charsequence1);
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); inboxstyle.addLine((CharSequence)iterator.next()));
    }

    public Notification build()
    {
        return b.build();
    }
}
