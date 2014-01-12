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

public class CalendarUnReadObserver extends UnReadObserver
{

    private static final String ACTIVE_ALERTS_SELECTION = "(state=? ) AND receivedTime>=";
    private static final String ACTIVE_ALERTS_SELECTION_ARGS[];
    static final String ALERT_PROJECTION[] = {
        "_id", "event_id", "state", "title", "eventLocation", "selfAttendeeStatus", "allDay", "alarmTime", "minutes", "begin", 
        "end", "description"
    };
    public static final Uri CALENDAR_URL;
    private static final String TAG = "CalendarUnReadObserver";

    public CalendarUnReadObserver(Handler handler, LockScreenNewEventView lockscreenneweventview, long l)
    {
        super(handler, lockscreenneweventview, l);
    }

    public void refreshUnReadNumber()
    {
        (new AsyncTask() {

            final CalendarUnReadObserver this$0;

            public transient Integer doInBackground(Void avoid[])
            {
                Cursor cursor;
                int i;
                cursor = mNewEventView.getContext().getContentResolver().query(android.provider.CalendarContract.CalendarAlerts.CONTENT_URI, CalendarUnReadObserver.ALERT_PROJECTION, (new StringBuilder()).append("(state=? ) AND receivedTime>=").append(String.valueOf(mCreateTime)).toString(), CalendarUnReadObserver.ACTIVE_ALERTS_SELECTION_ARGS, null);
                i = 0;
                if (cursor == null)
                    break MISSING_BLOCK_LABEL_78;
                int j = cursor.getCount();
                i = j;
                cursor.close();
                Xlog.d("CalendarUnReadObserver", (new StringBuilder()).append("refreshUnReadNumber count=").append(i).toString());
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
                this$0 = CalendarUnReadObserver.this;
                super();
            }
        }
).execute(new Void[] {
            null, null, null
        });
    }

    static 
    {
        CALENDAR_URL = android.provider.CalendarContract.CalendarAlerts.CONTENT_URI;
        String as[] = new String[1];
        as[0] = Integer.toString(1);
        ACTIVE_ALERTS_SELECTION_ARGS = as;
    }

}
