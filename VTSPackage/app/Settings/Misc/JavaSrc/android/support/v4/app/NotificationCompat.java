// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package android.support.v4.app:
//            NotificationCompatHoneycomb, NotificationCompatIceCreamSandwich, NotificationCompatJellybean

public class NotificationCompat
{
    public static class Action
    {

        public PendingIntent actionIntent;
        public int icon;
        public CharSequence title;

        public Action(int i, CharSequence charsequence, PendingIntent pendingintent)
        {
            icon = i;
            title = charsequence;
            actionIntent = pendingintent;
        }
    }

    public static class BigPictureStyle extends Style
    {

        Bitmap mPicture;

        public BigPictureStyle bigPicture(Bitmap bitmap)
        {
            mPicture = bitmap;
            return this;
        }

        public BigPictureStyle setBigContentTitle(CharSequence charsequence)
        {
            super.mBigContentTitle = charsequence;
            return this;
        }

        public BigPictureStyle setSummaryText(CharSequence charsequence)
        {
            super.mSummaryText = charsequence;
            super.mSummaryTextSet = true;
            return this;
        }


        public BigPictureStyle(Builder builder)
        {
            setBuilder(builder);
        }
    }

    public static class BigTextStyle extends Style
    {

        CharSequence mBigText;

        public BigTextStyle bigText(CharSequence charsequence)
        {
            mBigText = charsequence;
            return this;
        }

        public BigTextStyle setBigContentTitle(CharSequence charsequence)
        {
            super.mBigContentTitle = charsequence;
            return this;
        }

        public BigTextStyle setSummaryText(CharSequence charsequence)
        {
            super.mSummaryText = charsequence;
            super.mSummaryTextSet = true;
            return this;
        }


        public BigTextStyle(Builder builder)
        {
            setBuilder(builder);
        }
    }

    public static class Builder
    {

        ArrayList mActions;
        CharSequence mContentInfo;
        PendingIntent mContentIntent;
        CharSequence mContentText;
        CharSequence mContentTitle;
        Context mContext;
        PendingIntent mFullScreenIntent;
        Bitmap mLargeIcon;
        Notification mNotification;
        int mNumber;
        int mPriority;
        int mProgress;
        boolean mProgressIndeterminate;
        int mProgressMax;
        Style mStyle;
        CharSequence mSubText;
        RemoteViews mTickerView;
        boolean mUseChronometer;

        private void setFlag(int i, boolean flag)
        {
            if (flag)
            {
                Notification notification1 = mNotification;
                notification1.flags = i | notification1.flags;
                return;
            } else
            {
                Notification notification = mNotification;
                notification.flags = notification.flags & ~i;
                return;
            }
        }

        public Builder addAction(int i, CharSequence charsequence, PendingIntent pendingintent)
        {
            mActions.add(new Action(i, charsequence, pendingintent));
            return this;
        }

        public Notification build()
        {
            return NotificationCompat.IMPL.build(this);
        }

        public Notification getNotification()
        {
            return NotificationCompat.IMPL.build(this);
        }

        public Builder setAutoCancel(boolean flag)
        {
            setFlag(16, flag);
            return this;
        }

        public Builder setContent(RemoteViews remoteviews)
        {
            mNotification.contentView = remoteviews;
            return this;
        }

        public Builder setContentInfo(CharSequence charsequence)
        {
            mContentInfo = charsequence;
            return this;
        }

        public Builder setContentIntent(PendingIntent pendingintent)
        {
            mContentIntent = pendingintent;
            return this;
        }

        public Builder setContentText(CharSequence charsequence)
        {
            mContentText = charsequence;
            return this;
        }

        public Builder setContentTitle(CharSequence charsequence)
        {
            mContentTitle = charsequence;
            return this;
        }

        public Builder setDefaults(int i)
        {
            mNotification.defaults = i;
            if ((i & 4) != 0)
            {
                Notification notification = mNotification;
                notification.flags = 1 | notification.flags;
            }
            return this;
        }

        public Builder setDeleteIntent(PendingIntent pendingintent)
        {
            mNotification.deleteIntent = pendingintent;
            return this;
        }

        public Builder setFullScreenIntent(PendingIntent pendingintent, boolean flag)
        {
            mFullScreenIntent = pendingintent;
            setFlag(128, flag);
            return this;
        }

        public Builder setLargeIcon(Bitmap bitmap)
        {
            mLargeIcon = bitmap;
            return this;
        }

        public Builder setLights(int i, int j, int k)
        {
            boolean flag = true;
            mNotification.ledARGB = i;
            mNotification.ledOnMS = j;
            mNotification.ledOffMS = k;
            boolean flag1;
            if (mNotification.ledOnMS != 0 && mNotification.ledOffMS != 0)
                flag1 = flag;
            else
                flag1 = false;
            Notification notification = mNotification;
            int l = -2 & mNotification.flags;
            if (!flag1)
                flag = false;
            notification.flags = flag | l;
            return this;
        }

        public Builder setNumber(int i)
        {
            mNumber = i;
            return this;
        }

        public Builder setOngoing(boolean flag)
        {
            setFlag(2, flag);
            return this;
        }

        public Builder setOnlyAlertOnce(boolean flag)
        {
            setFlag(8, flag);
            return this;
        }

        public Builder setPriority(int i)
        {
            mPriority = i;
            return this;
        }

        public Builder setProgress(int i, int j, boolean flag)
        {
            mProgressMax = i;
            mProgress = j;
            mProgressIndeterminate = flag;
            return this;
        }

        public Builder setSmallIcon(int i)
        {
            mNotification.icon = i;
            return this;
        }

        public Builder setSmallIcon(int i, int j)
        {
            mNotification.icon = i;
            mNotification.iconLevel = j;
            return this;
        }

        public Builder setSound(Uri uri)
        {
            mNotification.sound = uri;
            mNotification.audioStreamType = -1;
            return this;
        }

        public Builder setSound(Uri uri, int i)
        {
            mNotification.sound = uri;
            mNotification.audioStreamType = i;
            return this;
        }

        public Builder setStyle(Style style)
        {
            if (mStyle != style)
            {
                mStyle = style;
                if (mStyle != null)
                    mStyle.setBuilder(this);
            }
            return this;
        }

        public Builder setSubText(CharSequence charsequence)
        {
            mSubText = charsequence;
            return this;
        }

        public Builder setTicker(CharSequence charsequence)
        {
            mNotification.tickerText = charsequence;
            return this;
        }

        public Builder setTicker(CharSequence charsequence, RemoteViews remoteviews)
        {
            mNotification.tickerText = charsequence;
            mTickerView = remoteviews;
            return this;
        }

        public Builder setUsesChronometer(boolean flag)
        {
            mUseChronometer = flag;
            return this;
        }

        public Builder setVibrate(long al[])
        {
            mNotification.vibrate = al;
            return this;
        }

        public Builder setWhen(long l)
        {
            mNotification.when = l;
            return this;
        }

        public Builder(Context context)
        {
            mActions = new ArrayList();
            mNotification = new Notification();
            mContext = context;
            mNotification.when = System.currentTimeMillis();
            mNotification.audioStreamType = -1;
            mPriority = 0;
        }
    }

    public static class InboxStyle extends Style
    {

        ArrayList mTexts;

        public InboxStyle addLine(CharSequence charsequence)
        {
            mTexts.add(charsequence);
            return this;
        }

        public InboxStyle setBigContentTitle(CharSequence charsequence)
        {
            super.mBigContentTitle = charsequence;
            return this;
        }

        public InboxStyle setSummaryText(CharSequence charsequence)
        {
            super.mSummaryText = charsequence;
            super.mSummaryTextSet = true;
            return this;
        }

        public InboxStyle()
        {
            mTexts = new ArrayList();
        }

        public InboxStyle(Builder builder)
        {
            mTexts = new ArrayList();
            setBuilder(builder);
        }
    }

    static interface NotificationCompatImpl
    {

        public abstract Notification build(Builder builder);
    }

    static class NotificationCompatImplBase
        implements NotificationCompatImpl
    {

        public Notification build(Builder builder)
        {
            Notification notification = builder.mNotification;
            notification.setLatestEventInfo(builder.mContext, builder.mContentTitle, builder.mContentText, builder.mContentIntent);
            if (builder.mPriority > 0)
                notification.flags = 0x80 | notification.flags;
            return notification;
        }

    }

    static class NotificationCompatImplHoneycomb
        implements NotificationCompatImpl
    {

        public Notification build(Builder builder)
        {
            return NotificationCompatHoneycomb.add(builder.mContext, builder.mNotification, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mTickerView, builder.mNumber, builder.mContentIntent, builder.mFullScreenIntent, builder.mLargeIcon);
        }

    }

    static class NotificationCompatImplIceCreamSandwich
        implements NotificationCompatImpl
    {

        public Notification build(Builder builder)
        {
            return NotificationCompatIceCreamSandwich.add(builder.mContext, builder.mNotification, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mTickerView, builder.mNumber, builder.mContentIntent, builder.mFullScreenIntent, builder.mLargeIcon, builder.mProgressMax, builder.mProgress, builder.mProgressIndeterminate);
        }

    }

    static class NotificationCompatImplJellybean
        implements NotificationCompatImpl
    {

        public Notification build(Builder builder)
        {
            NotificationCompatJellybean notificationcompatjellybean = new NotificationCompatJellybean(builder.mContext, builder.mNotification, builder.mContentTitle, builder.mContentText, builder.mContentInfo, builder.mTickerView, builder.mNumber, builder.mContentIntent, builder.mFullScreenIntent, builder.mLargeIcon, builder.mProgressMax, builder.mProgress, builder.mProgressIndeterminate, builder.mUseChronometer, builder.mPriority, builder.mSubText);
            Action action;
            for (Iterator iterator = builder.mActions.iterator(); iterator.hasNext(); notificationcompatjellybean.addAction(action.icon, action.title, action.actionIntent))
                action = (Action)iterator.next();

            if (builder.mStyle != null)
                if (builder.mStyle instanceof BigTextStyle)
                {
                    BigTextStyle bigtextstyle = (BigTextStyle)builder.mStyle;
                    notificationcompatjellybean.addBigTextStyle(((Style) (bigtextstyle)).mBigContentTitle, ((Style) (bigtextstyle)).mSummaryTextSet, ((Style) (bigtextstyle)).mSummaryText, bigtextstyle.mBigText);
                } else
                if (builder.mStyle instanceof InboxStyle)
                {
                    InboxStyle inboxstyle = (InboxStyle)builder.mStyle;
                    notificationcompatjellybean.addInboxStyle(((Style) (inboxstyle)).mBigContentTitle, ((Style) (inboxstyle)).mSummaryTextSet, ((Style) (inboxstyle)).mSummaryText, inboxstyle.mTexts);
                } else
                if (builder.mStyle instanceof BigPictureStyle)
                {
                    BigPictureStyle bigpicturestyle = (BigPictureStyle)builder.mStyle;
                    notificationcompatjellybean.addBigPictureStyle(((Style) (bigpicturestyle)).mBigContentTitle, ((Style) (bigpicturestyle)).mSummaryTextSet, ((Style) (bigpicturestyle)).mSummaryText, bigpicturestyle.mPicture);
                }
            return notificationcompatjellybean.build();
        }

    }

    public static abstract class Style
    {

        CharSequence mBigContentTitle;
        Builder mBuilder;
        CharSequence mSummaryText;
        boolean mSummaryTextSet;

        public Notification build()
        {
            Builder builder = mBuilder;
            Notification notification = null;
            if (builder != null)
                notification = mBuilder.build();
            return notification;
        }

        public void setBuilder(Builder builder)
        {
            if (mBuilder != builder)
            {
                mBuilder = builder;
                if (mBuilder != null)
                    mBuilder.setStyle(this);
            }
        }

        public Style()
        {
            mSummaryTextSet = false;
        }
    }


    public static final int FLAG_HIGH_PRIORITY = 128;
    private static final NotificationCompatImpl IMPL;
    public static final int PRIORITY_DEFAULT = 0;
    public static final int PRIORITY_HIGH = 1;
    public static final int PRIORITY_LOW = -1;
    public static final int PRIORITY_MAX = 2;
    public static final int PRIORITY_MIN = -2;


    static 
    {
        if (android.os.Build.VERSION.SDK_INT >= 16)
            IMPL = new NotificationCompatImplJellybean();
        else
        if (android.os.Build.VERSION.SDK_INT >= 14)
            IMPL = new NotificationCompatImplIceCreamSandwich();
        else
        if (android.os.Build.VERSION.SDK_INT >= 11)
            IMPL = new NotificationCompatImplHoneycomb();
        else
            IMPL = new NotificationCompatImplBase();
    }

}
