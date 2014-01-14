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

public class MissCallUnReadObserver extends UnReadObserver
{

    private static final String MISS_CALL_PROJECTION[] = {
        "_id", "new", "date"
    };
    private static final String MISS_CALL_SELECTION = "(new = ? AND type = ? AND is_read = ? AND date >= ";
    private static final String MISS_CALL_SELECTION_ARGS[];
    public static final Uri MISS_CALL_URI;
    private static final String TAG = "MissCallUnReadObserver";

    public MissCallUnReadObserver(Handler handler, LockScreenNewEventView lockscreenneweventview, long l)
    {
        super(handler, lockscreenneweventview, l);
    }

    public void refreshUnReadNumber()
    {
        (new AsyncTask() {

            final MissCallUnReadObserver this$0;

            public transient Integer doInBackground(Void avoid[])
            {
                Cursor cursor;
                int i;
                cursor = mNewEventView.getContext().getContentResolver().query(MissCallUnReadObserver.MISS_CALL_URI, MissCallUnReadObserver.MISS_CALL_PROJECTION, (new StringBuilder()).append("(new = ? AND type = ? AND is_read = ? AND date >= ").append(mCreateTime).append(" )").toString(), MissCallUnReadObserver.MISS_CALL_SELECTION_ARGS, null);
                i = 0;
                if (cursor == null)
                    break MISSING_BLOCK_LABEL_80;
                int j = cursor.getCount();
                i = j;
                cursor.close();
                Xlog.d("MissCallUnReadObserver", (new StringBuilder()).append("refreshUnReadNumber count=").append(i).toString());
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
                this$0 = MissCallUnReadObserver.this;
                super();
            }
        }
).execute(new Void[] {
            null, null, null
        });
    }

    static 
    {
        MISS_CALL_URI = android.provider.CallLog.Calls.CONTENT_URI;
        String as[] = new String[3];
        as[0] = "1";
        as[1] = Integer.toString(3);
        as[2] = Integer.toString(0);
        MISS_CALL_SELECTION_ARGS = as;
    }


}
