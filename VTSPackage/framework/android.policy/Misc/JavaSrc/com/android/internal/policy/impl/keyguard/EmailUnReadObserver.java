// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            UnReadObserver, LockScreenNewEventView

public class EmailUnReadObserver extends UnReadObserver
{
    private static interface MailboxColumns
    {

        public static final String ID = "_id";
        public static final String TYPE = "type";
    }

    private static interface MessageColumns
    {

        public static final String ACCOUNT_KEY = "accountKey";
        public static final String DISPLAY_NAME = "displayName";
        public static final String FLAGS = "flags";
        public static final String FLAG_ATTACHMENT = "flagAttachment";
        public static final String FLAG_FAVORITE = "flagFavorite";
        public static final String FLAG_LOADED = "flagLoaded";
        public static final String FLAG_READ = "flagRead";
        public static final String ID = "_id";
        public static final String MAILBOX_KEY = "mailboxKey";
        public static final String SUBJECT = "subject";
        public static final String TIMESTAMP = "timeStamp";
    }


    private static final String ALL_INBOX_SELECTION = "mailboxKey IN (SELECT _id FROM Mailbox WHERE type = 0) AND flagLoaded IN (2,1,4)";
    private static final String ALL_LATEST_UNREAD_SELECTION = "flagRead=0 AND mailboxKey IN (SELECT _id FROM Mailbox WHERE type = 0) AND flagLoaded IN (2,1,4) AND _id>?";
    private static final String ALL_UNREAD_SELECTION = "flagRead=0 AND mailboxKey IN (SELECT _id FROM Mailbox WHERE type = 0) AND flagLoaded IN (2,1,4)";
    private static final String CONTENT_PROJECTION[] = {
        "_id"
    };
    private static final String EMAIL_AUTHORITY = "com.android.email.provider";
    public static final Uri EMAIL_CONTENT_URI;
    private static final Uri EMAIL_MESSAGE_CONTENT_URI;
    private static final String EMAIL_NOTIFIER_AUTHORITY = "com.android.email.notifier";
    private static final Uri EMAIL_NOTIFIER_CONTENT_URI = Uri.parse("content://com.android.email.notifier");
    private static final int FLAG_LOADED_COMPLETE = 1;
    private static final int FLAG_LOADED_DELETED = 3;
    private static final int FLAG_LOADED_ENVELOPE = 4;
    private static final int FLAG_LOADED_PARTIAL = 2;
    private static final String FLAG_LOADED_SELECTION = "flagLoaded IN (2,1,4)";
    private static final int FLAG_LOADED_UNLOADED = 0;
    private static final String MESSAGE_ID_SELECTION = "_id>?";
    private static final int READ = 1;
    private static final String TAG = "EmailUnReadObserver";
    private static final int TYPE_INBOX = 0;
    private static final int TYPE_NONE = -1;
    private static final int UNREAD;
    private long mLatestIdOnLock;

    public EmailUnReadObserver(Handler handler, LockScreenNewEventView lockscreenneweventview, long l)
    {
        super(handler, lockscreenneweventview, l);
        mLatestIdOnLock = getFirstRowColumn(lockscreenneweventview.getContext(), EMAIL_MESSAGE_CONTENT_URI, CONTENT_PROJECTION, "flagRead=0 AND mailboxKey IN (SELECT _id FROM Mailbox WHERE type = 0) AND flagLoaded IN (2,1,4)", null, "_id desc", 0, 0L);
    }

    private static long getFirstRowColumn(Context context, Uri uri, String as[], String s, String as1[], String s1, int i, long l)
    {
        Cursor cursor;
        cursor = context.getContentResolver().query(uri, as, s, as1, s1);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_53;
        long l1;
        if (!cursor.moveToFirst())
            break MISSING_BLOCK_LABEL_56;
        l1 = cursor.getLong(i);
        l = l1;
        cursor.close();
        return l;
        cursor.close();
        return l;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    public void refreshUnReadNumber()
    {
        (new AsyncTask() {

            final EmailUnReadObserver this$0;

            public transient Integer doInBackground(Void avoid[])
            {
                Cursor cursor;
                int i;
                ContentResolver contentresolver = mNewEventView.getContext().getContentResolver();
                Uri uri = EmailUnReadObserver.EMAIL_MESSAGE_CONTENT_URI;
                String as[] = EmailUnReadObserver.CONTENT_PROJECTION;
                String as1[] = new String[1];
                as1[0] = String.valueOf(mLatestIdOnLock);
                cursor = contentresolver.query(uri, as, "flagRead=0 AND mailboxKey IN (SELECT _id FROM Mailbox WHERE type = 0) AND flagLoaded IN (2,1,4) AND _id>?", as1, "_id desc");
                i = 0;
                if (cursor == null)
                    break MISSING_BLOCK_LABEL_86;
                int j = cursor.getCount();
                i = j;
                cursor.close();
                Xlog.d("EmailUnReadObserver", (new StringBuilder()).append("refreshUnReadNumber count=").append(i).toString());
                return Integer.valueOf(i);
                Exception exception;
                exception;
                cursor.close();
                throw exception;
            }

            public volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            public void onPostExecute(Integer integer)
            {
                upateNewEventNumber(integer.intValue());
            }

            public volatile void onPostExecute(Object obj)
            {
                onPostExecute((Integer)obj);
            }

            
            {
                this$0 = EmailUnReadObserver.this;
                super();
            }
        }
).execute(new Void[] {
            null, null, null
        });
    }

    static 
    {
        EMAIL_CONTENT_URI = Uri.parse("content://com.android.email.provider");
        EMAIL_MESSAGE_CONTENT_URI = Uri.parse((new StringBuilder()).append(EMAIL_CONTENT_URI).append("/message").toString());
    }



}
