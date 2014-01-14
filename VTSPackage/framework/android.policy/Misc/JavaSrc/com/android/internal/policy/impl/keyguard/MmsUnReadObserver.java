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

public class MmsUnReadObserver extends UnReadObserver
{

    private static final Uri MMS_QUERY_URI = Uri.parse("content://mms/inbox");
    private static final String MMS_STATUS_PROJECTION[] = {
        "date", "_id"
    };
    public static final Uri MMS_URI;
    private static final String NEW_INCOMING_MM_CONSTRAINT = "(read = 0  AND (m_type <> 134 AND m_type <> 136) AND date >= ";
    private static final String NEW_INCOMING_SM_CONSTRAINT = "(type = 1 AND read = 0 AND date >= ";
    private static final Uri SMS_QUERY_URI;
    private static final String SMS_STATUS_PROJECTION[] = {
        "date", "_id"
    };
    private static final String TAG = "MmsUnReadObserver";

    public MmsUnReadObserver(Handler handler, LockScreenNewEventView lockscreenneweventview, long l)
    {
        super(handler, lockscreenneweventview, l);
    }

    public void refreshUnReadNumber()
    {
        (new AsyncTask() {

            final MmsUnReadObserver this$0;

            public transient Integer doInBackground(Void avoid[])
            {
                Cursor cursor;
                int i;
                long l = mCreateTime / 1000L;
                cursor = mNewEventView.getContext().getContentResolver().query(MmsUnReadObserver.MMS_QUERY_URI, MmsUnReadObserver.MMS_STATUS_PROJECTION, (new StringBuilder()).append("(read = 0  AND (m_type <> 134 AND m_type <> 136) AND date >= ").append(l).append(")").toString(), null, null);
                i = 0;
                if (cursor == null)
                    break MISSING_BLOCK_LABEL_90;
                int i1 = cursor.getCount();
                i = i1;
                cursor.close();
                Cursor cursor1;
                int j;
                cursor1 = mNewEventView.getContext().getContentResolver().query(MmsUnReadObserver.SMS_QUERY_URI, MmsUnReadObserver.SMS_STATUS_PROJECTION, (new StringBuilder()).append("(type = 1 AND read = 0 AND date >= ").append(mCreateTime).append(")").toString(), null, null);
                j = 0;
                if (cursor1 == null)
                    break MISSING_BLOCK_LABEL_174;
                int k = cursor1.getCount();
                j = k;
                cursor1.close();
                Xlog.d("MmsUnReadObserver", (new StringBuilder()).append("refreshUnReadNumber mmsCount=").append(i).append(", smsCount=").append(j).append(", mCreateTime=").append(mCreateTime).toString());
                return Integer.valueOf(i + j);
                Exception exception1;
                exception1;
                cursor.close();
                throw exception1;
                Exception exception;
                exception;
                cursor1.close();
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
                this$0 = MmsUnReadObserver.this;
                super();
            }
        }
).execute(new Void[] {
            null, null, null
        });
    }

    static 
    {
        MMS_URI = android.provider.Telephony.Threads.CONTENT_URI;
        SMS_QUERY_URI = android.provider.Telephony.Sms.CONTENT_URI;
    }




}
